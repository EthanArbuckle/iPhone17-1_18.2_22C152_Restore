@interface MKContactMigrator
- (MKContactMigrator)init;
- (void)import:(id)a3;
- (void)importVCard:(id)a3;
@end

@implementation MKContactMigrator

- (MKContactMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKContactMigrator;
  v2 = [(MKMigrator *)&v6 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    [(MKMigrator *)v2 setType:5];
  }
  return v2;
}

- (void)importVCard:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  objc_super v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKContactMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  objc_super v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = self;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "%@ will import a vcard.", buf, 0xCu);
  }

  id v38 = 0;
  id v7 = [MEMORY[0x263EFEA70] contactsWithData:v4 error:&v38];
  id v8 = v38;
  if (v8)
  {
    v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MKGETStatusRouter server:didReceiveRequest:response:]((uint64_t)v8, v9);
    }
LABEL_20:

    id v10 = (id)[[NSString alloc] initWithData:v4 encoding:4];
    if ([v10 length])
    {
      unint64_t v18 = objc_msgSend(v10, "mk_occurrenceCountOfString:", @"BEGIN:VCARD");
      if (v18 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v18;
      }
      [(MKMigrator *)self migratorDidFailWithImportError:v8 count:v19];
    }
    else
    {
      [(MKMigrator *)self migratorDidFailWithImportError:v8];
    }
    goto LABEL_30;
  }
  if (![v7 count])
  {
    v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MKContactMigrator import:](v9);
    }
    goto LABEL_20;
  }
  v9 = objc_alloc_init(MEMORY[0x263EFEB48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) mutableCopy];
        [v9 addContact:v14 toContainerWithIdentifier:0];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  contactStore = self->_contactStore;
  id v33 = 0;
  [(CNContactStore *)contactStore executeSaveRequest:v9 error:&v33];
  id v16 = v33;
  if (v16)
  {
    id v8 = v16;
    v17 = +[MKLog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MKGETStatusRouter server:didReceiveRequest:response:]((uint64_t)v8, v17);
    }

    goto LABEL_20;
  }
  uint64_t v20 = [v10 count];
  v21 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  if ([v21 length])
  {
    uint64_t v22 = objc_msgSend(v21, "mk_occurrenceCountOfString:", @"BEGIN:VCARD");
    if (v22 > 0) {
      uint64_t v20 = v22;
    }
  }
  [(MKMigrator *)self migratorDidImportWithCount:v20];
  -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v4 length]);

  id v8 = 0;
LABEL_30:

  v23 = +[MKLog log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = self;
    _os_log_impl(&dword_22BFAC000, v23, OS_LOG_TYPE_INFO, "%@ did import a vcard.", buf, 0xCu);
  }

  id v24 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v24);
  v25 = [v24 payload];
  v26 = [v25 contacts];

  v27 = [MEMORY[0x263EFF910] date];
  [v27 timeIntervalSinceDate:v5];
  double v29 = v28;

  v30 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v29];
  v31 = [v26 importElapsedTime];
  v32 = [v31 decimalNumberByAdding:v30];
  [v26 setImportElapsedTime:v32];

  objc_sync_exit(v24);
}

- (void).cxx_destruct
{
}

- (void)import:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "no contact data found.", v1, 2u);
}

@end