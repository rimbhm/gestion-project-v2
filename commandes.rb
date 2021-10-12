php artisan make:migration:schema create_articles_table --model=0 --schema="title:string,content:longText"
php artisan make:migration:schema create_equipe_table --model=0 --schema="nom_equipe:string"
php artisan make:migration:schema create_employee_table --model=0 --schema="cin:string,nom:string,prenom:string,adresse:string,tel:string"

php artisan make:migration:schema create_tache_materiels_table --model=0 --schema="tache_id:integer:unsigned,materiel_id:integer:unsigned"
php artisan make:migration:schema create_materiel_table --model=0 --schema="nom_mat:string,prix_location:string,locateur:string"

php artisan make:migration:schema create_equipe_employees_table --model=0 --schema="equipe_id:integer:unsigned,employee_id:integer:unsigned"

php artisan make:migration:schema create_projet_equipes_table --model=0 --schema="projet_id:integer:unsigned,equipe_id:integer:unsigned"

php artisan make:migration:schema create_projets_table --model=0 --schema="nom_projet:string,duree:string,statut:string"

php artisan make:migration:schema create_projet_taches_table --model=0 --schema="projet_id:integer:unsigned,tache_id:integer:unsigned"


php artisan make:migration:schema create_taches_table --model=0 --schema="nom_tache:string,description:longText"
php artisan backpack:crud employee
public function employee()
    {
        return $this->belongsToMany(employee::class, 'equipe_employee','equipe_id', 'employee_id');
    }




    private function getFieldsData($show = FALSE) {
        return [
            [
                'name'=> 'nom_equipe',
                'label' => 'nom_equipe',
                'type'=> 'text'
            ],
           
            [    // Select2Multiple = n-n relationship (with pivot table)
                'label'     => "employee",
                'type'      => ($show ? "select": 'select2_multiple'),
                'name'      => 'employee', // the method that defines the relationship in your Model
// optional
                'entity'    => 'employee', // the method that defines the relationship in your Model
                'model'     => "App\Models\Tag", // foreign key model
                'attribute' => 'name', // foreign key attribute that is shown to user
                'pivot'     => true, // on create&update, do you need to add/delete pivot table entries?
            ]
        ];
    }