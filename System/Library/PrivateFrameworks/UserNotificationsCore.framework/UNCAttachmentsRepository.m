@interface UNCAttachmentsRepository
+ (id)_sha1HashOfFileAtURL:(id)a3;
- (BOOL)isRepositoryURL:(id)a3;
- (BOOL)isValidRepositoryURL:(id)a3 forBundleIdentifier:(id)a4;
- (UNCAttachmentsRepository)initWithDirectory:(id)a3 librarian:(id)a4;
- (id)_attachmentDirectoryForBundleIdentifier:(id)a3;
- (id)_claimedRepositoryURLsForBundleIdentifier:(id)a3;
- (id)_fileURLForDigestString:(id)a3 extension:(id)a4 bundleIdentifier:(id)a5;
- (id)allBundleIdentifiers;
- (id)bundleIdentifiersClaimingAttachments;
- (id)moveFileIntoRepositoryFromFileURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (id)referencesForBundleIdentifier:(id)a3;
- (unint64_t)_addReferencesToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (unint64_t)_removeReferencesToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5;
- (unint64_t)_transformNotificationIdentifiersForRepositoryURL:(id)a3 bundleIdentifier:(id)a4 usingTransformBlock:(id)a5;
- (void)_performAttachmentFilesMigration;
- (void)_performAttachmentRepositoryKeyMigration;
- (void)_removeAllReferencesForBundleIdentifier:(id)a3;
- (void)_removeRepositoryURL:(id)a3;
- (void)_transformAttachmentsForBundleIdentifier:(id)a3 usingTransformBlock:(id)a4;
- (void)deleteAllFilesForBundleIdentifier:(id)a3;
- (void)ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers:(id)a3;
- (void)performMigration;
- (void)removeReferenceToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5;
@end

@implementation UNCAttachmentsRepository

- (UNCAttachmentsRepository)initWithDirectory:(id)a3 librarian:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNCAttachmentsRepository;
  v8 = [(UNCAttachmentsRepository *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [NSURL fileURLWithPath:v6];
    directoryURL = v8->_directoryURL;
    v8->_directoryURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_librarian, a4);
    v11 = [[UNCKeyedDictionaryRepository alloc] initWithDirectory:v6 fileName:@"AttachmentsList" pathExtension:@"plist" librarian:v7];
    referencesRepository = v8->_referencesRepository;
    v8->_referencesRepository = v11;
  }
  return v8;
}

- (id)bundleIdentifiersClaimingAttachments
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [v3 contentsOfDirectoryAtURL:self->_directoryURL includingPropertiesForKeys:0 options:0 error:0];

  v5 = [MEMORY[0x263F08850] defaultManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__UNCAttachmentsRepository_bundleIdentifiersClaimingAttachments__block_invoke;
  v9[3] = &unk_2655680C0;
  id v10 = v5;
  v11 = self;
  id v6 = v5;
  id v7 = objc_msgSend(v4, "bs_mapNoNulls:", v9);

  return v7;
}

id __64__UNCAttachmentsRepository_bundleIdentifiersClaimingAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 URLByAppendingPathComponent:@"Attachments"];
  v5 = *(void **)(a1 + 32);
  id v6 = [v4 path];
  LODWORD(v5) = [v5 fileExistsAtPath:v6];

  if (v5)
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 24);
    v8 = [v3 lastPathComponent];
    uint64_t v9 = [v7 bundleIdentifierForUniqueIdentifier:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_claimedRepositoryURLsForBundleIdentifier:(id)a3
{
  id v3 = [(UNCAttachmentsRepository *)self _attachmentDirectoryForBundleIdentifier:a3];
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:0];

  id v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_14);

  return v6;
}

uint64_t __70__UNCAttachmentsRepository__claimedRepositoryURLsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 URLByStandardizingPath];
}

- (BOOL)isRepositoryURL:(id)a3
{
  uint64_t v8 = 2;
  v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  [v6 getRelationship:&v8 ofDirectoryAtURL:self->_directoryURL toItemAtURL:v5 error:0];

  return v8 == 0;
}

- (BOOL)isValidRepositoryURL:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = [v6 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    v11 = [(UNCAttachmentsRepository *)self _attachmentDirectoryForBundleIdentifier:v7];
    uint64_t v14 = 2;
    [v8 getRelationship:&v14 ofDirectoryAtURL:v11 toItemAtURL:v6 error:0];
    BOOL v12 = v14 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)allBundleIdentifiers
{
  return [(UNCKeyedDictionaryRepository *)self->_referencesRepository allKeys];
}

- (id)referencesForBundleIdentifier:(id)a3
{
  return [(UNCKeyedDictionaryRepository *)self->_referencesRepository dictionaryForKey:a3];
}

- (id)moveFileIntoRepositoryFromFileURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(id)objc_opt_class() _sha1HashOfFileAtURL:v8];
  if (v11)
  {
    id v35 = v9;
    uint64_t v12 = objc_msgSend(NSString, "unc_stringWithDigestOfSHA1Hash:", v11);
    v13 = [v8 pathExtension];
    v34 = (void *)v12;
    uint64_t v14 = [(UNCAttachmentsRepository *)self _fileURLForDigestString:v12 extension:v13 bundleIdentifier:v10];
    v15 = [MEMORY[0x263F08850] defaultManager];
    v16 = [v14 path];
    int v17 = [v15 fileExistsAtPath:v16];

    if (v17)
    {
      v18 = *MEMORY[0x263F1DFF0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_ERROR)) {
        -[UNCAttachmentsRepository moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:]((uint64_t)v8, v18);
      }
      v19 = [MEMORY[0x263F08850] defaultManager];
      [v19 removeItemAtURL:v8 error:0];

      id v20 = v14;
      v21 = v34;
      goto LABEL_20;
    }
    v23 = [(UNCAttachmentsRepository *)self _attachmentDirectoryForBundleIdentifier:v10];
    uint64_t v24 = [MEMORY[0x263F08850] defaultManager];
    [(id)v24 createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:0 error:0];

    uint64_t v25 = *MEMORY[0x263EFF6B0];
    id v37 = 0;
    LOBYTE(v24) = [v23 setResourceValue:MEMORY[0x263EFFA88] forKey:v25 error:&v37];
    id v26 = v37;
    if ((v24 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_ERROR)) {
      -[UNCFileHandleContentProtectionStrategy _excludeItemFromBackupAtPath:]();
    }
    v27 = [MEMORY[0x263F08850] defaultManager];
    id v36 = v26;
    char v28 = [v27 moveItemAtURL:v8 toURL:v14 error:&v36];
    id v33 = v36;

    if (v28)
    {
      id v9 = v35;
      unint64_t v29 = [(UNCAttachmentsRepository *)self _addReferencesToRepositoryURL:v14 forNotificationIdentifier:v35 bundleIdentifier:v10];
      v30 = *MEMORY[0x263F1DFF0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v39 = v14;
        __int16 v40 = 2112;
        id v41 = v35;
        __int16 v42 = 2048;
        unint64_t v43 = v29;
        _os_log_impl(&dword_2608DB000, v30, OS_LOG_TYPE_DEFAULT, "Added reference to repository URL '%@' for notification identifier '%@' (refcount %lu)", buf, 0x20u);
      }
      id v20 = v14;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_ERROR))
      {
        v31 = v33;
        -[UNCAttachmentsRepository moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:]();
        id v20 = 0;
        v21 = v34;
        id v9 = v35;
        goto LABEL_19;
      }
      id v20 = 0;
      id v9 = v35;
    }
    v31 = v33;
    v21 = v34;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v22 = *MEMORY[0x263F1DFF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_ERROR)) {
    -[UNCAttachmentsRepository moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:]((uint64_t)v8, v22);
  }
  id v20 = 0;
LABEL_21:

  return v20;
}

- (void)removeReferenceToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UNCAttachmentsRepository *)self isValidRepositoryURL:v8 forBundleIdentifier:v10])
  {
    unint64_t v11 = [(UNCAttachmentsRepository *)self _removeReferencesToRepositoryURL:v8 forNotificationIdentifier:v9 bundleIdentifier:v10];
    if (!v11) {
      [(UNCAttachmentsRepository *)self _removeRepositoryURL:v8];
    }
    uint64_t v12 = *MEMORY[0x263F1DFF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2048;
      unint64_t v19 = v11;
      _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "Removed reference to repository URL '%@' for notification identifier '%@' (refcount %lu)", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    v13 = *MEMORY[0x263F1DFF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_ERROR)) {
      -[UNCAttachmentsRepository removeReferenceToRepositoryURL:forNotificationIdentifier:bundleIdentifier:]((uint64_t)v8, (uint64_t)v9, v13);
    }
  }
}

- (void)_removeRepositoryURL:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = *MEMORY[0x263F1DFF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "Removing repository URL '%@' as no notifications reference it", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [MEMORY[0x263F08850] defaultManager];
  [v5 removeItemAtURL:v3 error:0];
}

- (void)deleteAllFilesForBundleIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F1DFF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "Removing all attachments for bundle '%@'", (uint8_t *)&v8, 0xCu);
  }
  [(UNCAttachmentsRepository *)self _removeAllReferencesForBundleIdentifier:v4];
  int v6 = [(UNCAttachmentsRepository *)self _attachmentDirectoryForBundleIdentifier:v4];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  [v7 removeItemAtURL:v6 error:0];
}

- (unint64_t)_addReferencesToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __101__UNCAttachmentsRepository__addReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke;
  v12[3] = &unk_265568108;
  id v13 = v8;
  id v9 = v8;
  unint64_t v10 = [(UNCAttachmentsRepository *)self _transformNotificationIdentifiersForRepositoryURL:a3 bundleIdentifier:a5 usingTransformBlock:v12];

  return v10;
}

uint64_t __101__UNCAttachmentsRepository__addReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setByAddingObject:*(void *)(a1 + 32)];
}

- (unint64_t)_removeReferencesToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __104__UNCAttachmentsRepository__removeReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke;
  v12[3] = &unk_265568108;
  id v13 = v8;
  id v9 = v8;
  unint64_t v10 = [(UNCAttachmentsRepository *)self _transformNotificationIdentifiersForRepositoryURL:a3 bundleIdentifier:a5 usingTransformBlock:v12];

  return v10;
}

id __104__UNCAttachmentsRepository__removeReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 removeObject:*(void *)(a1 + 32)];

  return v3;
}

- (void)_removeAllReferencesForBundleIdentifier:(id)a3
{
}

uint64_t __68__UNCAttachmentsRepository__removeAllReferencesForBundleIdentifier___block_invoke()
{
  return 0;
}

- (void)_transformAttachmentsForBundleIdentifier:(id)a3 usingTransformBlock:(id)a4
{
  id v13 = a3;
  referencesRepository = self->_referencesRepository;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(UNCKeyedDictionaryRepository *)referencesRepository dictionaryForKey:v13];
  if (!v8)
  {
    id v8 = [NSDictionary dictionary];
  }
  id v9 = v7[2](v7, v8);

  unint64_t v10 = (void *)[v9 copy];
  uint64_t v11 = [v10 count];
  uint64_t v12 = self->_referencesRepository;
  if (v11) {
    [(UNCKeyedDictionaryRepository *)v12 setDictionary:v10 forKey:v13];
  }
  else {
    [(UNCKeyedDictionaryRepository *)v12 removeDictionaryForKey:v13];
  }
}

- (unint64_t)_transformNotificationIdentifiersForRepositoryURL:(id)a3 bundleIdentifier:(id)a4 usingTransformBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __115__UNCAttachmentsRepository__transformNotificationIdentifiersForRepositoryURL_bundleIdentifier_usingTransformBlock___block_invoke;
  v15[3] = &unk_265568150;
  id v11 = v8;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  __int16 v18 = &v19;
  [(UNCAttachmentsRepository *)self _transformAttachmentsForBundleIdentifier:v9 usingTransformBlock:v15];
  unint64_t v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

id __115__UNCAttachmentsRepository__transformNotificationIdentifiersForRepositoryURL_bundleIdentifier_usingTransformBlock___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = [v3 objectForKey:a1[4]];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  id v7 = v6;

  id v8 = (*(void (**)(void))(a1[5] + 16))();
  id v9 = (void *)[v8 copy];

  *(void *)(*(void *)(a1[6] + 8) + 24) = [v9 count];
  if (*(void *)(*(void *)(a1[6] + 8) + 24)) {
    [v3 setObject:v9 forKey:a1[4]];
  }
  else {
    [v3 removeObjectForKey:a1[4]];
  }

  return v3;
}

- (void)performMigration
{
  [(UNCAttachmentsRepository *)self _performAttachmentFilesMigration];

  [(UNCAttachmentsRepository *)self _performAttachmentRepositoryKeyMigration];
}

- (void)_performAttachmentFilesMigration
{
  v45[4] = *MEMORY[0x263EF8340];
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v3 = [v2 objectAtIndex:0];

  v45[0] = v3;
  v45[1] = @"SpringBoard";
  v45[2] = @"PushStore";
  v45[3] = @"Attachments";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
  id v5 = [NSURL fileURLWithPathComponents:v4];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v6 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:0 error:0];

  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v9 = [v5 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    unint64_t v29 = v5;
    v30 = v4;
    v31 = v3;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    char v28 = v7;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    id v12 = (os_log_t *)MEMORY[0x263F1E048];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v17 = (void *)MEMORY[0x261221EF0]();
          __int16 v18 = [v16 lastPathComponent];
          uint64_t v19 = [(NSURL *)self->_directoryURL URLByAppendingPathComponent:v18];
          uint64_t v20 = [v19 URLByAppendingPathComponent:@"Attachments"];

          uint64_t v21 = *v12;
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v41 = v16;
            __int16 v42 = 2114;
            id v43 = v20;
            _os_log_impl(&dword_2608DB000, v21, OS_LOG_TYPE_DEFAULT, "Move attachments directory from '%{public}@' to '%{public}@'", buf, 0x16u);
          }
          id v35 = 0;
          char v22 = [v8 moveItemAtURL:v16 toURL:v20 error:&v35];
          id v23 = v35;
          if ((v22 & 1) == 0)
          {
            uint64_t v24 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v41 = v20;
              __int16 v42 = 2114;
              id v43 = v23;
              _os_log_impl(&dword_2608DB000, v24, OS_LOG_TYPE_DEFAULT, "Moving attachment bundle directory to '%{public}@' failed: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v13);
    }

    id v34 = 0;
    id v5 = v29;
    char v25 = [v8 removeItemAtURL:v29 error:&v34];
    id v26 = v34;
    if ((v25 & 1) == 0)
    {
      v27 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v41 = v29;
        __int16 v42 = 2114;
        id v43 = v26;
        _os_log_impl(&dword_2608DB000, v27, OS_LOG_TYPE_DEFAULT, "Removing attachments directory '%{public}@' failed: %{public}@", buf, 0x16u);
      }
    }

    id v4 = v30;
    id v3 = v31;
    id v7 = v28;
  }
}

- (void)_performAttachmentRepositoryKeyMigration
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v27 = [MEMORY[0x263EFF980] array];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  [(NSURL *)self->_directoryURL path];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v30 = long long v42 = 0u;
  v31 = v3;
  objc_msgSend(v3, "enumeratorAtPath:");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v39 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x261221EF0]();
        int v10 = [v30 stringByAppendingPathComponent:v8];
        uint64_t v11 = [v10 stringByAppendingPathComponent:@"AttachmentsList"];
        id v12 = [v11 stringByAppendingPathExtension:@"plist"];

        if ([v31 fileExistsAtPath:v12]) {
          [v27 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v26 = v27;
  uint64_t v13 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id obja = *(id *)v36;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(id *)v36 != obja) {
          objc_enumerationMutation(v26);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * v15);
        id v17 = (void *)MEMORY[0x261221EF0]();
        __int16 v18 = [(UNCBundleLibrarian *)self->_librarian bundleIdentifierForUniqueIdentifier:v16];
        if (v18)
        {
          uint64_t v19 = [(UNCAttachmentsRepository *)self _attachmentDirectoryForBundleIdentifier:v18];
          uint64_t v20 = [(UNCKeyedDictionaryRepository *)self->_referencesRepository dictionaryForKey:v18];
          uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __68__UNCAttachmentsRepository__performAttachmentRepositoryKeyMigration__block_invoke;
          v32[3] = &unk_265568178;
          id v33 = v19;
          id v34 = v21;
          id v22 = v21;
          id v23 = v19;
          [v20 enumerateKeysAndObjectsUsingBlock:v32];
          referencesRepository = self->_referencesRepository;
          char v25 = (void *)[v22 copy];
          [(UNCKeyedDictionaryRepository *)referencesRepository setDictionary:v25 forKey:v18];
        }
        ++v15;
      }
      while (v14 != v15);
      uint64_t v14 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v14);
  }
}

void __68__UNCAttachmentsRepository__performAttachmentRepositoryKeyMigration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = [a2 lastPathComponent];
  uint64_t v6 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v7];
  [*(id *)(a1 + 40) setObject:v5 forKey:v6];
}

- (void)ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(UNCAttachmentsRepository *)self bundleIdentifiersClaimingAttachments];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v4 objectForKey:v10];
        id v12 = v11;
        if (v11)
        {
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke;
          v13[3] = &unk_2655681C8;
          v13[4] = self;
          v13[5] = v10;
          id v14 = v11;
          [(UNCAttachmentsRepository *)self _transformAttachmentsForBundleIdentifier:v10 usingTransformBlock:v13];
        }
        else
        {
          [(UNCAttachmentsRepository *)self deleteAllFilesForBundleIdentifier:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

id __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _claimedRepositoryURLsForBundleIdentifier:*(void *)(a1 + 40)];
  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if ([v4 containsObject:v10])
        {
          uint64_t v11 = [v5 objectForKey:v10];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke_2;
          v26[3] = &unk_2655681A0;
          id v27 = *(id *)(a1 + 48);
          id v12 = objc_msgSend(v11, "bs_filter:", v26);
          if ([v12 count]) {
            [v21 setObject:v12 forKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v21 allKeys];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        if (([v13 containsObject:v19] & 1) == 0) {
          [*(id *)(a1 + 32) _removeRepositoryURL:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v16);
  }

  return v21;
}

uint64_t __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_fileURLForDigestString:(id)a3 extension:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(UNCAttachmentsRepository *)self _attachmentDirectoryForBundleIdentifier:a5];
  uint64_t v11 = [v10 URLByAppendingPathComponent:v9];

  id v12 = [v11 URLByAppendingPathExtension:v8];

  return v12;
}

- (id)_attachmentDirectoryForBundleIdentifier:(id)a3
{
  id v4 = [(UNCBundleLibrarian *)self->_librarian uniqueIdentifierForBundleIdentifier:a3];
  id v5 = [(NSURL *)self->_directoryURL URLByAppendingPathComponent:v4 isDirectory:1];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"Attachments"];

  return v6;
}

+ (id)_sha1HashOfFileAtURL:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v3 error:0];
  if (v4)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA1_Init(&c);
    id v13 = 0;
    id v5 = [v4 readDataUpToLength:1024 error:&v13];
    id v6 = v13;
    uint64_t v7 = v6;
    if (v5)
    {
      while ([v5 length])
      {
        id v8 = v5;
        CC_SHA1_Update(&c, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
        id v13 = 0;
        id v5 = [v4 readDataUpToLength:1024 error:&v13];
        id v9 = v13;

        uint64_t v7 = v9;
        if (!v5) {
          goto LABEL_8;
        }
      }
      id v11 = [MEMORY[0x263EFF990] dataWithLength:20];
      CC_SHA1_Final((unsigned __int8 *)[v11 mutableBytes], &c);
    }
    else
    {
      id v9 = v6;
LABEL_8:
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF0], OS_LOG_TYPE_ERROR)) {
        +[UNCAttachmentsRepository _sha1HashOfFileAtURL:]();
      }
      id v5 = 0;
      id v11 = 0;
      uint64_t v7 = v9;
    }
    [v4 closeFile];
    uint64_t v10 = (void *)[v11 copy];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);

  objc_storeStrong((id *)&self->_referencesRepository, 0);
}

- (void)moveFileIntoRepositoryFromFileURL:(uint64_t)a1 forNotificationIdentifier:(NSObject *)a2 bundleIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "Could not hash file at '%@'", (uint8_t *)&v2, 0xCu);
}

- (void)moveFileIntoRepositoryFromFileURL:(uint64_t)a1 forNotificationIdentifier:(NSObject *)a2 bundleIdentifier:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "File at '%@' already exists in the repository", (uint8_t *)&v2, 0xCu);
}

- (void)moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "File at '%@' was not moved into the repository correctly, error=%{public}@");
}

- (void)removeReferenceToRepositoryURL:(uint64_t)a1 forNotificationIdentifier:(uint64_t)a2 bundleIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, a2, a3, "Attempted to remove reference for repository URL '%@' for notification identifier '%@' but this isn't in the repository", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

+ (void)_sha1HashOfFileAtURL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not read file at '%{public}@': error=%{public}@");
}

@end