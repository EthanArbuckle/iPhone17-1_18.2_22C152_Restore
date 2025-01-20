@interface NPKValueAddedServiceAutomaticSelectionCoordinator
- (NPKPassesDataSource)dataSource;
- (NPKValueAddedServiceAutomaticSelectionCoordinator)initWithDelegate:(id)a3 passesDataSource:(id)a4;
- (NPKValueAddedServiceAutomaticSelectionCoordinatorDelegate)delegate;
- (void)_handleWalletPreferencesChanged:(id)a3;
- (void)_updateAutomaticSelectionPasses;
- (void)passesDataSource:(id)a3 didAddPasses:(id)a4;
- (void)passesDataSource:(id)a3 didRemovePasses:(id)a4;
- (void)passesDataSource:(id)a3 didUpdatePasses:(id)a4;
- (void)passesDataSource:(id)a3 didUpdateSettingsForPass:(id)a4;
- (void)passesDataSourceDidReloadPasses:(id)a3;
- (void)passesDataSourceDidReorderPasses:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPKValueAddedServiceAutomaticSelectionCoordinator

- (NPKValueAddedServiceAutomaticSelectionCoordinator)initWithDelegate:(id)a3 passesDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NPKValueAddedServiceAutomaticSelectionCoordinator;
  v8 = [(NPKValueAddedServiceAutomaticSelectionCoordinator *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    id v10 = objc_storeWeak((id *)&v9->_dataSource, v7);
    [v7 registerObserver:v9];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v9 selector:sel__handleWalletPreferencesChanged_ name:*MEMORY[0x263F5C7E8] object:0];
  }
  return v9;
}

- (void)passesDataSourceDidReloadPasses:(id)a3
{
  v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got reloaded passes", v7, 2u);
    }
  }
  [(NPKValueAddedServiceAutomaticSelectionCoordinator *)self _updateAutomaticSelectionPasses];
}

- (void)passesDataSource:(id)a3 didAddPasses:(id)a4
{
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got added passes", v8, 2u);
    }
  }
  [(NPKValueAddedServiceAutomaticSelectionCoordinator *)self _updateAutomaticSelectionPasses];
}

- (void)passesDataSource:(id)a3 didUpdatePasses:(id)a4
{
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got updated passes", v8, 2u);
    }
  }
  [(NPKValueAddedServiceAutomaticSelectionCoordinator *)self _updateAutomaticSelectionPasses];
}

- (void)passesDataSource:(id)a3 didRemovePasses:(id)a4
{
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got removed passes", v8, 2u);
    }
  }
  [(NPKValueAddedServiceAutomaticSelectionCoordinator *)self _updateAutomaticSelectionPasses];
}

- (void)passesDataSourceDidReorderPasses:(id)a3
{
  v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got reordered passes", v7, 2u);
    }
  }
  [(NPKValueAddedServiceAutomaticSelectionCoordinator *)self _updateAutomaticSelectionPasses];
}

- (void)passesDataSource:(id)a3 didUpdateSettingsForPass:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v5 uniqueID];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: VAS automatic selection coordinator got updated settings for pass %@", (uint8_t *)&v10, 0xCu);
    }
  }
  [(NPKValueAddedServiceAutomaticSelectionCoordinator *)self _updateAutomaticSelectionPasses];
}

- (void)_handleWalletPreferencesChanged:(id)a3
{
  v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Wallet preferences changed", v7, 2u);
    }
  }
  [(NPKValueAddedServiceAutomaticSelectionCoordinator *)self _updateAutomaticSelectionPasses];
}

- (void)_updateAutomaticSelectionPasses
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v25 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained passes];

  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v26 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (NPKIsValidVASPass(v10)
          && ([v10 hasStoredValue] & 1) == 0
          && ([v10 settings] & 0x10) != 0)
        {
          v11 = [v10 passTypeIdentifier];
          uint64_t v12 = [v4 objectForKeyedSubscript:v11];

          if (!v12) {
            goto LABEL_12;
          }
          objc_super v13 = [v10 passTypeIdentifier];
          v14 = [v4 objectForKeyedSubscript:v13];

          v15 = [v14 ingestedDate];
          v16 = [v10 ingestedDate];
          uint64_t v17 = [v15 compare:v16];

          if (v17 == 1)
          {
            v18 = [v10 uniqueID];
            [v26 removeObjectForKey:v18];

LABEL_12:
            v19 = objc_msgSend(v10, "passTypeIdentifier", v25);
            [v4 setObject:v10 forKeyedSubscript:v19];

            v14 = [v10 uniqueID];
            [v26 setObject:v10 forKey:v14];
          }

          continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v7);
  }

  v20 = pk_General_log();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    v22 = pk_General_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v26 count];
      *(_DWORD *)buf = 67109120;
      int v32 = v23;
      _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Found %d VAS passes for automatic selection", buf, 8u);
    }
  }
  id v24 = objc_loadWeakRetained((id *)&v25->_delegate);
  [v24 valueAddedServiceAutomaticSelectionCoordinator:v25 didUpdatePasses:v26];
}

- (NPKValueAddedServiceAutomaticSelectionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKValueAddedServiceAutomaticSelectionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPKPassesDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPKPassesDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end