@interface ML3ContainerItemReactionTable
- (id)columns;
- (id)name;
@end

@implementation ML3ContainerItemReactionTable

- (void).cxx_destruct
{
}

- (id)columns
{
  v12[5] = *MEMORY[0x1E4F143B8];
  columns = self->_columns;
  if (!columns)
  {
    v4 = +[ML3DatabaseColumn columnWithName:@"container_item_reaction_pid" datatype:2 constraints:1 defaultValue:0];
    v5 = +[ML3DatabaseColumn columnWithName:@"container_item_pid", 2, 16, &unk_1F0912430, v4 datatype constraints defaultValue];
    v12[1] = v5;
    v6 = +[ML3DatabaseColumn columnWithName:@"person_pid" datatype:2 constraints:16 defaultValue:&unk_1F0912430];
    v12[2] = v6;
    v7 = +[ML3DatabaseColumn columnWithName:@"reaction" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v12[3] = v7;
    v8 = +[ML3DatabaseColumn columnWithName:@"date" datatype:2 constraints:16 defaultValue:&unk_1F0912430];
    v12[4] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
    v10 = self->_columns;
    self->_columns = v9;

    columns = self->_columns;
  }

  return columns;
}

- (id)name
{
  return @"container_item_reaction";
}

@end