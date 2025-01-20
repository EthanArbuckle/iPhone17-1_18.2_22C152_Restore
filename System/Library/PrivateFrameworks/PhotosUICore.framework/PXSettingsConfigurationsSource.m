@interface PXSettingsConfigurationsSource
- (NSMutableArray)configurations;
- (NSUserDefaults)userDefaults;
- (PXSettingsConfigurationsSource)init;
- (PXSettingsConfigurationsSource)initWithUserDefaults:(id)a3;
- (PXSettingsConfigurationsSourceObserver)observer;
- (id)configurationAtIndex:(int64_t)a3;
- (int64_t)indexOfConfiguration:(id)a3;
- (int64_t)numberOfConfigurations;
- (void)_save;
- (void)deleteAllConfigurations;
- (void)deleteConfigurationAtIndex:(int64_t)a3;
- (void)insertConfiguration:(id)a3 atIndex:(int64_t)a4;
- (void)insertConfigurations:(id)a3 atIndex:(int64_t)a4;
- (void)performChanges:(id)a3;
- (void)renameConfigurationAtIndex:(int64_t)a3 withName:(id)a4;
- (void)setObserver:(id)a3;
- (void)updateConfigurationAtIndex:(int64_t)a3;
@end

@implementation PXSettingsConfigurationsSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (NSMutableArray)configurations
{
  return self->_configurations;
}

- (void)setObserver:(id)a3
{
}

- (PXSettingsConfigurationsSourceObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PXSettingsConfigurationsSourceObserver *)WeakRetained;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)updateConfigurationAtIndex:(int64_t)a3
{
  -[PXSettingsConfigurationsSource configurationAtIndex:](self, "configurationAtIndex:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(PXSettingsConfigurationsSource *)self configurations];
  v6 = (void *)[v7 copyWithUpdatedSettingsValues];
  [v5 replaceObjectAtIndex:a3 withObject:v6];
}

- (void)renameConfigurationAtIndex:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v9 = [(PXSettingsConfigurationsSource *)self configurationAtIndex:a3];
  id v7 = [(PXSettingsConfigurationsSource *)self configurations];
  v8 = (void *)[v9 copyWithName:v6];

  [v7 replaceObjectAtIndex:a3 withObject:v8];
}

- (void)deleteAllConfigurations
{
  id v2 = [(PXSettingsConfigurationsSource *)self configurations];
  [v2 removeAllObjects];
}

- (void)deleteConfigurationAtIndex:(int64_t)a3
{
  id v4 = [(PXSettingsConfigurationsSource *)self configurations];
  [v4 removeObjectAtIndex:a3];
}

- (void)insertConfigurations:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(PXSettingsConfigurationsSource *)self configurations];
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", a4, objc_msgSend(v6, "count"));
  [v8 insertObjects:v6 atIndexes:v7];
}

- (void)insertConfiguration:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PXSettingsConfigurationsSource *)self configurations];
  [v7 insertObject:v6 atIndex:a4];
}

- (void)_save
{
  id v4 = (void *)MEMORY[0x1E4F28DB0];
  v5 = [(PXSettingsConfigurationsSource *)self configurations];
  id v10 = 0;
  id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v10];
  id v7 = v10;

  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSettingsConfigurationsSource.m", 79, @"couldn't archive configurations: %@", v7 object file lineNumber description];
  }
  id v8 = [(PXSettingsConfigurationsSource *)self userDefaults];
  [v8 setObject:v6 forKey:@"PXSettingsConfigurations"];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  v5 = [(PXSettingsConfigurationsSource *)self observer];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXSettingsConfigurationsSource_performChanges___block_invoke;
  aBlock[3] = &unk_1E5DD0E78;
  aBlock[4] = self;
  id v12 = v4;
  id v6 = v5;
  id v11 = v6;
  id v7 = v4;
  id v8 = _Block_copy(aBlock);
  id v9 = v8;
  if (v6) {
    [v6 settingsConfigurationSource:self performChanges:v8];
  }
  else {
    (*((void (**)(void *))v8 + 2))(v8);
  }
}

void __49__PXSettingsConfigurationsSource_performChanges___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configurations];
  id v6 = (id)[v2 copy];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _save];
  v3 = [*(id *)(a1 + 32) configurations];
  id v4 = (void *)[v3 copy];

  v5 = [off_1E5DA5568 changeDetailsFromArray:v6 toArray:v4 changedObjects:MEMORY[0x1E4F1CBF0]];
  [*(id *)(a1 + 40) settingsConfigurationSource:*(void *)(a1 + 32) didChange:v5];
}

- (int64_t)indexOfConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(PXSettingsConfigurationsSource *)self configurations];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)configurationAtIndex:(int64_t)a3
{
  id v4 = [(PXSettingsConfigurationsSource *)self configurations];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)numberOfConfigurations
{
  id v2 = [(PXSettingsConfigurationsSource *)self configurations];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXSettingsConfigurationsSource)initWithUserDefaults:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXSettingsConfigurationsSource;
  int64_t v6 = [(PXSettingsConfigurationsSource *)&v21 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    id v8 = [(NSUserDefaults *)v7->_userDefaults objectForKey:@"PXSettingsConfigurations"];
    if (v8)
    {
      id v9 = (void *)MEMORY[0x1E4F28DC0];
      id v10 = (void *)MEMORY[0x1E4F1CAD0];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      id v12 = [v10 setWithArray:v11];
      id v20 = 0;
      uint64_t v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v8 error:&v20];
      id v14 = v20;
      configurations = v7->_configurations;
      v7->_configurations = (NSMutableArray *)v13;

      v16 = PLUIGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v14;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "couldn't unarchive configurations data: %@", buf, 0xCu);
      }
    }
    if (!v7->_configurations)
    {
      v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v18 = v7->_configurations;
      v7->_configurations = v17;
    }
  }

  return v7;
}

- (PXSettingsConfigurationsSource)init
{
  int64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(PXSettingsConfigurationsSource *)self initWithUserDefaults:v3];

  return v4;
}

@end