@interface ML3AccountTable
- (id)columns;
- (id)name;
@end

@implementation ML3AccountTable

- (void).cxx_destruct
{
}

- (id)columns
{
  v10[3] = *MEMORY[0x1E4F143B8];
  columns = self->_columns;
  if (!columns)
  {
    v4 = +[ML3DatabaseColumn columnWithName:@"dsid" datatype:2 constraints:1 defaultValue:0];
    v5 = +[ML3DatabaseColumn columnWithName:@"apple_id", 4, 16, &stru_1F08D4D70, v4 datatype constraints defaultValue];
    v10[1] = v5;
    v6 = +[ML3DatabaseColumn columnWithName:@"alt_dsid" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v10[2] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    v8 = self->_columns;
    self->_columns = v7;

    columns = self->_columns;
  }

  return columns;
}

- (id)name
{
  return @"account";
}

@end