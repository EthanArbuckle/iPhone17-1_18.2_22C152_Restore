@interface MKCallHistoryMigrator
- (MKCallHistoryMigrator)init;
- (MKSIMLabel)label;
- (void)didImportCallHistory:(unint64_t)a3 size:(unint64_t)a4;
- (void)import:(id)a3;
- (void)importCallHistory:(id)a3 size:(unint64_t)a4;
- (void)importDataEncodedInJSON:(id)a3;
- (void)importNumbers:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation MKCallHistoryMigrator

- (MKCallHistoryMigrator)init
{
  v7.receiver = self;
  v7.super_class = (Class)MKCallHistoryMigrator;
  v2 = [(MKMigrator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MKMigrator *)v2 setType:6];
    v4 = (CHManager *)objc_alloc_init(MEMORY[0x263F30588]);
    callHistoryManager = v3->_callHistoryManager;
    v3->_callHistoryManager = v4;
  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKCallHistoryMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  id v4 = a3;
  id v8 = 0;
  uint64_t v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v8];
  id v6 = v8;
  if (v6)
  {
    id v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKCallHistoryMigrator import:]((uint64_t)v6, v7);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MKCallHistoryMigrator *)self importNumbers:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MKCallHistoryMigrator importCallHistory:size:](self, "importCallHistory:size:", v5, [v4 length]);
    }
  }
}

- (void)importNumbers:(id)a3
{
  id v4 = a3;
  v9 = [[MKCallHistoryNumbers alloc] initWithSerializedData:v4];

  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [(MKCallHistoryNumbers *)v9 numbersInUse];
  id v7 = [v5 setWithArray:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  [WeakRetained createLabelsForNumbersInUse:v7];
}

- (void)importCallHistory:(id)a3 size:(unint64_t)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
    id v8 = +[MKCallHistory calls:v6 label:WeakRetained];

    uint64_t v9 = [v6 count];
    uint64_t v10 = v9 - [v8 count];
    v11 = (void *)[v8 count];
    if (v10 >= 1)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08320];
      v24 = @"could not parse call history data.";
      v13 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v14 = [v12 errorWithDomain:@"MKCallHistoryError" code:0 userInfo:v13];
      [(MKMigrator *)self migratorDidFailWithImportError:v14 count:v10];
    }
    if (v11)
    {
      v15 = [(MKMigrator *)self delegate];
      [v15 migratorWillExecuteOperation:self];

      objc_initWeak(&location, self);
      callHistoryManager = self->_callHistoryManager;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __48__MKCallHistoryMigrator_importCallHistory_size___block_invoke;
      v20[3] = &unk_264905D90;
      objc_copyWeak(v21, &location);
      v21[1] = v11;
      v21[2] = (id)a4;
      [(CHManager *)callHistoryManager addArrayToCallHistory:v8 withCompletion:v20];
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v17 = +[MKLog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MKCallHistoryMigrator importCallHistory:size:](v17);
    }

    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    v26[0] = @"could not parse call history data.";
    id v8 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v19 = [v18 errorWithDomain:@"MKCallHistoryError" code:0 userInfo:v8];
    [(MKMigrator *)self migratorDidFailWithImportError:v19];
  }
}

void __48__MKCallHistoryMigrator_importCallHistory_size___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didImportCallHistory:*(void *)(a1 + 40) size:*(void *)(a1 + 48)];
}

- (void)didImportCallHistory:(unint64_t)a3 size:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_22BFAC000, v7, OS_LOG_TYPE_INFO, "did import call history. count=%lu", (uint8_t *)&v9, 0xCu);
  }

  [(MKMigrator *)self migratorDidAppendDataSize:a4];
  [(MKMigrator *)self migratorDidImportWithCount:a3];
  id v8 = [(MKMigrator *)self delegate];
  [v8 migratorDidExecuteOperation:self];
}

- (MKSIMLabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (MKSIMLabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
}

- (void)import:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "could not deserialize call history data. error=%@", (uint8_t *)&v2, 0xCu);
}

- (void)importCallHistory:(os_log_t)log size:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "could not parse call history data.", v1, 2u);
}

@end