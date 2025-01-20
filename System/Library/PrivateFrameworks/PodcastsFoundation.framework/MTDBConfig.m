@interface MTDBConfig
- (NSManagedObjectModel)model;
- (id)databaseFileUrl;
- (id)managedObjectModel;
- (id)persistentStoreOptions;
- (void)setModel:(id)a3;
@end

@implementation MTDBConfig

- (id)persistentStoreOptions
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"WAL", @"journal_mode", 0);
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v4 = *MEMORY[0x1E4F1BF68];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  v6 = objc_msgSend(v3, "initWithObjectsAndKeys:", v2, v4, v5, *MEMORY[0x1E4F1BE50], *MEMORY[0x1E4F28378], *MEMORY[0x1E4F1BEC0], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F1BE80], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F1BEF8], 0);

  return v6;
}

- (id)managedObjectModel
{
  model = self->_model;
  if (!model)
  {
    uint64_t v4 = [(id)objc_opt_class() fetchManagedObjectModelFromDisk];
    v5 = self->_model;
    self->_model = v4;

    model = self->_model;
  }
  return model;
}

- (id)databaseFileUrl
{
  v2 = objc_opt_class();
  return (id)[v2 libraryPath];
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end