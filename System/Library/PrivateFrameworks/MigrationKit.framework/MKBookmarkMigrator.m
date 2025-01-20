@interface MKBookmarkMigrator
- (MKBookmarkMigrator)init;
- (id)_bookmarkFolderAtTitlePath:(id)a3 withinBookmarkFolder:(id)a4;
- (id)_bookmarkFolderAtTitlePath:(id)a3 withinRootFolder:(id)a4;
- (id)_createBookmarkFolderWithTitle:(id)a3 UUID:(id)a4;
- (id)_createRootBookmarkFolder;
- (void)import:(id)a3;
- (void)importDataEncodedInJSON:(id)a3;
- (void)init;
@end

@implementation MKBookmarkMigrator

- (MKBookmarkMigrator)init
{
  v11.receiver = self;
  v11.super_class = (Class)MKBookmarkMigrator;
  v2 = [(MKMigrator *)&v11 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_5;
  }
  [(MKMigrator *)v2 setType:3];
  if (![MEMORY[0x263F861E0] lockSync])
  {
    v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MKBookmarkMigrator init](v9);
    }
    goto LABEL_10;
  }
  uint64_t v4 = [MEMORY[0x263F861E0] safariBookmarkCollection];
  collection = v3->_collection;
  v3->_collection = (WebBookmarkCollection *)v4;

  if (!v3->_collection)
  {
    v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MKBookmarkMigrator init](v9);
    }
LABEL_10:

    v8 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [(MKBookmarkMigrator *)v3 _createRootBookmarkFolder];
  rootFolder = v3->_rootFolder;
  v3->_rootFolder = (NSMutableDictionary *)v6;

LABEL_5:
  v8 = v3;
LABEL_11:

  return v8;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  uint64_t v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKBookmarkMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "will import a bookmark.", buf, 2u);
  }

  if (![v4 length])
  {
    collection = self->_collection;
    rootFolder = self->_rootFolder;
    id v29 = 0;
    [(WebBookmarkCollection *)collection mergeWithBookmarksDictionary:rootFolder clearHidden:0 error:&v29];
    id v14 = v29;
    if (!v14)
    {
      [MEMORY[0x263F861E0] unlockSync];
      goto LABEL_14;
    }
    v15 = v14;
    v16 = +[MKLog log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MKGETStatusRouter server:didReceiveRequest:response:]((uint64_t)v15, v16);
    }
LABEL_12:

    [(MKMigrator *)self migratorDidFailWithImportError:v15];
    goto LABEL_15;
  }
  id v7 = [[MKBookmark alloc] initWithData:v4];
  if (!v7)
  {
    v16 = +[MKLog log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_22BFAC000, v16, OS_LOG_TYPE_INFO, "bookmark is missing.", v28, 2u);
    }
    v15 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  v9 = [(MKBookmarkMigrator *)self _bookmarkFolderAtTitlePath:&stru_26DF6A8B0 withinRootFolder:self->_rootFolder];
  v10 = [v9 objectForKeyedSubscript:@"Children"];
  objc_super v11 = [(MKBookmark *)v8 data];
  [v10 addObject:v11];

LABEL_14:
  [(MKMigrator *)self migratorDidImport];
  -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v4 length]);
  v15 = 0;
LABEL_15:
  id v17 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v17);
  v18 = [v17 payload];
  v19 = [v18 bookmarks];

  v20 = [MEMORY[0x263EFF910] date];
  [v20 timeIntervalSinceDate:v5];
  double v22 = v21;

  v23 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v22];
  v24 = [v19 importElapsedTime];
  v25 = [v24 decimalNumberByAdding:v23];
  [v19 setImportElapsedTime:v25];

  objc_sync_exit(v17);
  v26 = +[MKLog log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_22BFAC000, v26, OS_LOG_TYPE_INFO, "did import a bookmark.", v27, 2u);
  }
}

- (id)_createRootBookmarkFolder
{
  v3 = [(MKBookmarkMigrator *)self _createBookmarkFolderWithTitle:0 UUID:@"Root"];
  id v4 = [v3 objectForKeyedSubscript:@"Children"];
  uint64_t v5 = [MEMORY[0x263F08C38] UUID];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [(MKBookmarkMigrator *)self _createBookmarkFolderWithTitle:@"BookmarksBar" UUID:v6];

  [v4 addObject:v7];
  return v3;
}

- (id)_createBookmarkFolderWithTitle:(id)a3 UUID:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  v8 = (void *)[[v6 alloc] initWithCapacity:4];
  [v8 setObject:@"WebBookmarkTypeList" forKey:@"WebBookmarkType"];
  [v8 setObject:v7 forKey:@"WebBookmarkUUID"];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v8 setObject:v9 forKey:@"Children"];

  if (v5) {
    [v8 setObject:v5 forKey:@"Title"];
  }

  return v8;
}

- (id)_bookmarkFolderAtTitlePath:(id)a3 withinRootFolder:(id)a4
{
  id v6 = a3;
  id v7 = [a4 objectForKeyedSubscript:@"Children"];
  v8 = [v7 objectAtIndexedSubscript:0];

  if ([v6 length])
  {
    id v9 = [v6 pathComponents];
    uint64_t v10 = [(MKBookmarkMigrator *)self _bookmarkFolderAtTitlePath:v9 withinBookmarkFolder:v8];

    v8 = (void *)v10;
  }

  return v8;
}

- (id)_bookmarkFolderAtTitlePath:(id)a3 withinBookmarkFolder:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v24 = self;
    v8 = [v6 objectAtIndexedSubscript:0];
    id v25 = v7;
    [v7 objectForKeyedSubscript:@"Children"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        v15 = [v14 objectForKeyedSubscript:@"Title"];
        char v16 = [v8 isEqualToString:v15];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v18 = v14;

      id v17 = v24;
      if (v18) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:

      id v17 = v24;
    }
    v19 = [MEMORY[0x263F08C38] UUID];
    v20 = [v19 UUIDString];
    id v18 = [(MKBookmarkMigrator *)v17 _createBookmarkFolderWithTitle:v8 UUID:v20];

    [v9 addObject:v18];
LABEL_13:
    if ((unint64_t)[v6 count] >= 2)
    {
      double v21 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
      uint64_t v22 = [(MKBookmarkMigrator *)v17 _bookmarkFolderAtTitlePath:v21 withinBookmarkFolder:v18];

      id v18 = (id)v22;
    }
    id v7 = v25;
  }
  else
  {
    id v18 = v7;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "WebBookmarkCollection lockSync was failed.", v1, 2u);
}

@end