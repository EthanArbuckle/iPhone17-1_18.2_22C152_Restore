@interface MTInMemorySyncChangeStore
- (MTInMemorySyncChangeStore)init;
- (NSMutableArray)changes;
- (id)loadChanges;
- (void)persistChanges:(id)a3;
- (void)setChanges:(id)a3;
@end

@implementation MTInMemorySyncChangeStore

- (MTInMemorySyncChangeStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTInMemorySyncChangeStore;
  v2 = [(MTInMemorySyncChangeStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    changes = v2->_changes;
    v2->_changes = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)persistChanges:(id)a3
{
  v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  changes = self->_changes;
  self->_changes = v4;
  MEMORY[0x1F41817F8](v4, changes);
}

- (id)loadChanges
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_changes copy];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (NSMutableArray)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
}

- (void).cxx_destruct
{
}

@end