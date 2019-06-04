# Models
Los modelos son clases de Ruby. <br/>
Se comunican con la base de datos, validan la información que queremos guardar / editar / borrar. <br/>
Los modelos heredan de `ActiveRecord::Base` esto les brinda el poder de hacer queries y guardar información en la base de datos.

## Creación de modelos
Usamos el comando `rails g model` donde `g` hace referencia a `generate`
> rails g model user email:string name:string auth_token:string

### Relacionando modelos entre si
Un post pertenece a un usuario con lo cual el user debe estar referenciado al post. <br/>
Usamos el keyword `references`
> rails g model post user:references title:string content:string published:boolean

- Verificar que dentro del modelo de post tenemos la relacion
```
class Post < ApplicationRecord
  belongs_to :user
end
```

- Verificar la tabla dentro de `migrations`
Tenemos una `reference` y la relación entre tablas con `foreign_key`
```
class CreatePosts < ActiveRecord::Migration[5.2]
    ...
    t.references :user, foreign_key: true
end
 ```

### Cómo borrar un modelo
Utilizamos el keyword `destroy`
> rails destroy model post


## Cómo crear las tablas para los modelos
Utilizamos `db:migrate`
> rails db:migrate
