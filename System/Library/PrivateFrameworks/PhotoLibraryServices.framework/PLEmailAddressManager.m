@interface PLEmailAddressManager
- (PLEmailAddressManager)initWithPathManager:(id)a3 lazyAssetsdClient:(id)a4;
- (id)assetsdClient;
- (id)emailAddressForKey:(id)a3;
- (id)keyForEmailAddress:(id)a3;
- (id)plistPath;
- (void)_loadDictionariesIfNeeded;
@end

@implementation PLEmailAddressManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyAssetsdClient, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_emailsForKey, 0);
  objc_storeStrong((id *)&self->_keysForEmails, 0);
}

- (void)_loadDictionariesIfNeeded
{
  if (!self->_keysForEmails)
  {
    if ([MEMORY[0x1E4F8B9D8] isEntitledForPhotoKit])
    {
      v3 = (void *)MEMORY[0x1E4F1C9E8];
      v4 = [(PLEmailAddressManager *)self plistPath];
      v5 = [v3 dictionaryWithContentsOfFile:v4];
      v6 = (NSMutableDictionary *)[v5 mutableCopy];
      keysForEmails = self->_keysForEmails;
      self->_keysForEmails = v6;
    }
    else
    {
      v8 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Could not read dictionary; missing required entitlement",
          buf,
          2u);
      }
    }
    if (!self->_keysForEmails)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = self->_keysForEmails;
      self->_keysForEmails = v9;
    }
    self->_maxKey = 1;
    v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_keysForEmails, "count"));
    emailsForKey = self->_emailsForKey;
    self->_emailsForKey = v11;

    v13 = self->_keysForEmails;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PLEmailAddressManager__loadDictionariesIfNeeded__block_invoke;
    v14[3] = &unk_1E5871D68;
    v14[4] = self;
    [(NSMutableDictionary *)v13 enumerateKeysAndObjectsUsingBlock:v14];
  }
}

void __50__PLEmailAddressManager__loadDictionariesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 intValue];
  uint64_t v7 = *(void *)(a1 + 32);
  if ((int)v6 > *(_DWORD *)(v7 + 24))
  {
    *(_DWORD *)(v7 + 24) = v6;
    uint64_t v7 = *(void *)(a1 + 32);
  }
  v8 = *(void **)(v7 + 16);
  id v9 = [NSNumber numberWithInt:v6];
  [v8 setObject:v5 forKey:v9];
}

- (id)emailAddressForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || [v4 intValue] == -1)
  {
LABEL_15:
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  [(PLEmailAddressManager *)v6 _loadDictionariesIfNeeded];
  uint64_t v7 = [(NSMutableDictionary *)v6->_emailsForKey objectForKey:v5];
  objc_sync_exit(v6);

  if (!v7)
  {
    if (PLIsAssetsd())
    {
      v8 = v6;
      objc_sync_enter(v8);
      uint64_t v7 = [(NSMutableDictionary *)v6->_emailsForKey objectForKey:v5];
      objc_sync_exit(v8);
    }
    else
    {
      id v9 = [(PLEmailAddressManager *)v6 assetsdClient];
      v10 = [v9 cloudInternalClient];
      id v15 = 0;
      uint64_t v7 = objc_msgSend(v10, "emailAddressForKey:error:", (int)objc_msgSend(v5, "intValue"), &v15);
      id v11 = v15;

      if (v7)
      {
        v12 = v6;
        objc_sync_enter(v12);
        [(objc_class *)v12[1].isa setObject:v5 forKey:v7];
        [(NSMutableDictionary *)v6->_emailsForKey setObject:v7 forKey:v5];
        objc_sync_exit(v12);
      }
      else
      {
        v12 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v17 = v5;
          __int16 v18 = 2112;
          id v19 = v11;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error getting email address from key: %@, error: %@", buf, 0x16u);
        }
      }
    }
    if (!v7)
    {
      v13 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Could not find email address for key %@", buf, 0xCu);
      }

      goto LABEL_15;
    }
  }
LABEL_16:

  return v7;
}

- (id)keyForEmailAddress:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_27;
  }
  id v5 = self;
  objc_sync_enter(v5);
  [(PLEmailAddressManager *)v5 _loadDictionariesIfNeeded];
  uint64_t v6 = [(NSMutableDictionary *)v5->_keysForEmails objectForKey:v4];
  objc_sync_exit(v5);

  if (!v6)
  {
    if (PLIsAssetsd())
    {
      uint64_t v7 = v5;
      objc_sync_enter(v7);
      uint64_t v6 = [(NSMutableDictionary *)v5->_keysForEmails objectForKey:v4];
      if (!v6)
      {
        v8 = NSNumber;
        ++v7->_maxKey;
        uint64_t v6 = objc_msgSend(v8, "numberWithInt:");
        [(NSMutableDictionary *)v5->_keysForEmails setObject:v6 forKey:v4];
        [(NSMutableDictionary *)v7->_emailsForKey setObject:v4 forKey:v6];
        id v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5->_keysForEmails format:100 options:0 error:0];
        v10 = [(PLEmailAddressManager *)v7 plistPath];
        if (([v9 writeToFile:v10 options:1073741825 error:0] & 1) == 0)
        {
          id v11 = objc_opt_new();
          v12 = [(PLEmailAddressManager *)v10 stringByDeletingLastPathComponent];
          id v25 = 0;
          int v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v25];
          id v14 = v25;

          if (!v13
            || (id v24 = v14,
                char v15 = [v9 writeToFile:v10 options:1073741825 error:&v24],
                id v16 = v24,
                v14,
                id v14 = v16,
                (v15 & 1) == 0))
          {
            v17 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v10;
              __int16 v29 = 2112;
              id v30 = v14;
              _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "##### Failed to write %@ at %@", buf, 0x16u);
            }
          }
        }
      }
      objc_sync_exit(v7);
      goto LABEL_22;
    }
    __int16 v18 = [(PLEmailAddressManager *)v5 assetsdClient];
    id v19 = [v18 cloudInternalClient];
    id v26 = 0;
    uint64_t v20 = [v19 keyForEmailAddress:v4 error:&v26];
    uint64_t v7 = (PLEmailAddressManager *)v26;

    if (v7)
    {
      v21 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Error getting key from email address: %@", buf, 0xCu);
      }
      uint64_t v6 = 0;
    }
    else
    {
      if (v20 == -1)
      {
        uint64_t v6 = 0;
        goto LABEL_22;
      }
      uint64_t v6 = [NSNumber numberWithInt:v20];
      v21 = v5;
      objc_sync_enter(v21);
      [(NSMutableDictionary *)v5->_keysForEmails setObject:v6 forKey:v4];
      [(objc_class *)v21[2].isa setObject:v4 forKey:v6];
      objc_sync_exit(v21);
    }

LABEL_22:
  }
  if ([v6 intValue] == -1)
  {
    v22 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Returning invalid keyValue of -1", buf, 2u);
    }
  }
LABEL_27:

  return v6;
}

- (id)plistPath
{
  return (id)[(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:22 additionalPathComponents:@"cloudSharedEmails.plist"];
}

- (id)assetsdClient
{
  return (id)[(PLLazyObject *)self->_lazyAssetsdClient objectValue];
}

- (PLEmailAddressManager)initWithPathManager:(id)a3 lazyAssetsdClient:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLEmailAddressManager.m", 37, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  char v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PLEmailAddressManager.m", 38, @"Invalid parameter not satisfying: %@", @"lazyAssetsdClient" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PLEmailAddressManager;
  id v11 = [(PLEmailAddressManager *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pathManager, a3);
    objc_storeStrong((id *)&v12->_lazyAssetsdClient, a4);
  }

  return v12;
}

@end