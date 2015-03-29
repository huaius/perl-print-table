# perl-print-table
A perl function used to print structured data into a table

It takes two parameters, $values and $titles
$values: an array reference of all table content
$titles: the table header, also the key names 

Here are example parameters:
$values = [
          {
            'name' => 'john',
            'age' => '19'
          },
          {
            'name' => 'kate',
            'age' => '18'
          },
          {
            'name' => 'anderson',
            'age' => '20'
          }
        ];


$titles = [
          'name',
          'age'
        ];
