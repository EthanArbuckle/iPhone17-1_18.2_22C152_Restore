@interface ML3MutableDatabaseTable
- (void)setColumns:(id)a3;
- (void)setForeignKeyConstraints:(id)a3;
- (void)setName:(id)a3;
@end

@implementation ML3MutableDatabaseTable

- (void)setForeignKeyConstraints:(id)a3
{
  self->super._foreignKeyConstraints = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setColumns:(id)a3
{
  self->super._columns = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setName:(id)a3
{
  self->super._name = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

@end