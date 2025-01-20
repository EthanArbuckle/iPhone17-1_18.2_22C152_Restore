@interface ML3ContainerSeedTable
- (id)columns;
- (id)name;
@end

@implementation ML3ContainerSeedTable

- (void).cxx_destruct
{
}

- (id)columns
{
  v10[3] = *MEMORY[0x1E4F143B8];
  columns = self->_columns;
  if (!columns)
  {
    v4 = +[ML3DatabaseColumn columnWithName:@"container_pid" datatype:2 constraints:1 defaultValue:0];
    v5 = +[ML3DatabaseColumn columnWithName:@"item_pid", 2, 16, &unk_1F0912478, v4 datatype constraints defaultValue];
    v10[1] = v5;
    v6 = +[ML3DatabaseColumn columnWithName:@"seed_order" datatype:2 constraints:16 defaultValue:&unk_1F0912478];
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
  return @"container_seed";
}

@end