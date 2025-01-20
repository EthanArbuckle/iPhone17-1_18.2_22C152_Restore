@interface ML3ItemKVSTable
- (id)columns;
- (id)name;
@end

@implementation ML3ItemKVSTable

- (void).cxx_destruct
{
}

- (id)columns
{
  v9[2] = *MEMORY[0x1E4F143B8];
  columns = self->_columns;
  if (!columns)
  {
    v4 = +[ML3DatabaseColumn columnWithName:@"item_pid" datatype:2 constraints:1 defaultValue:0];
    v9[0] = v4;
    v5 = +[ML3DatabaseColumn columnWithName:@"key" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v9[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    v7 = self->_columns;
    self->_columns = v6;

    columns = self->_columns;
  }

  return columns;
}

- (id)name
{
  return @"item_kvs";
}

@end