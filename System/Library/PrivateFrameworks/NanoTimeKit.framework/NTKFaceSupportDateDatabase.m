@interface NTKFaceSupportDateDatabase
- (NSString)filePath;
- (NTKFaceSupportDateDatabase)initWithFileAtPath:(id)a3;
- (id)_queue_save;
- (void)_queue_loadLookup;
- (void)deleteDateForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)recordDate:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)retreiveDateForBundleIdentifier:(id)a3 completion:(id)a4;
@end

@implementation NTKFaceSupportDateDatabase

- (NTKFaceSupportDateDatabase)initWithFileAtPath:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && ([v4 pathExtension],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"db"],
        v5,
        v6))
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFaceSupportDateDatabase;
    v7 = [(NTKFaceSupportDateDatabase *)&v15 init];
    if (v7)
    {
      uint64_t v8 = [v4 copy];
      filePath = v7->_filePath;
      v7->_filePath = (NSString *)v8;

      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create("com.apple.facesupport.dateDatabase", v10);
      fileQueue = v7->_fileQueue;
      v7->_fileQueue = (OS_dispatch_queue *)v11;
    }
    self = v7;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)recordDate:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v11 = v9;
    goto LABEL_9;
  }
  id v11 = (id)[v9 copy];

  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:405 userInfo:0];
    fileQueue = self->_fileQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke;
    block[3] = &unk_1E62C0AE8;
    id v27 = v13;
    id v28 = v10;
    id v15 = v13;
    dispatch_async(fileQueue, block);

    v16 = v28;
LABEL_8:

    goto LABEL_9;
  }
  if (![v11 length])
  {
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:411 userInfo:0];
    v18 = self->_fileQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_2;
    v23[3] = &unk_1E62C0AE8;
    id v24 = v17;
    id v25 = v10;
    id v15 = v17;
    dispatch_async(v18, v23);

    v16 = v25;
    goto LABEL_8;
  }
  v12 = self->_fileQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_3;
  v19[3] = &unk_1E62C3348;
  v19[4] = self;
  id v20 = v8;
  id v11 = v11;
  id v21 = v11;
  id v22 = v10;
  dispatch_async(v12, v19);

LABEL_9:
}

uint64_t __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadLookup");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  [v2 setObject:v4 forKey:*(void *)(a1 + 48)];

  objc_msgSend(*(id *)(a1 + 32), "_queue_save");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)retreiveDateForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (id)[v6 copy];

    if ([v8 length])
    {
      fileQueue = self->_fileQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E62C0098;
      void block[4] = self;
      id v8 = v8;
      id v14 = v8;
      id v15 = v7;
      dispatch_async(fileQueue, block);
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:411 userInfo:0];
      id v11 = self->_fileQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke;
      v16[3] = &unk_1E62C0AE8;
      id v17 = v10;
      id v18 = v7;
      id v12 = v10;
      dispatch_async(v11, v16);
    }
  }
  else
  {
    id v8 = v6;
  }
}

uint64_t __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadLookup");
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:404 userInfo:0];
  v2 = };
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deleteDateForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (id)[v6 copy];

    if ([v8 length])
    {
      if (![v8 isEqualToString:@"NTKFaceSupportDateDatabaseInvalidDeleteIdentifier"])
      {
        fileQueue = self->_fileQueue;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_3;
        v16[3] = &unk_1E62C0098;
        void v16[4] = self;
        id v8 = v8;
        id v17 = v8;
        id v18 = v7;
        dispatch_async(fileQueue, v16);

        goto LABEL_9;
      }
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:503 userInfo:0];
      id v10 = self->_fileQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E62C0AE8;
      id v20 = v9;
      id v21 = v7;
      id v11 = v9;
      dispatch_async(v10, block);

      id v12 = v21;
    }
    else
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:411 userInfo:0];
      id v14 = self->_fileQueue;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke;
      v22[3] = &unk_1E62C0AE8;
      id v23 = v13;
      id v24 = v7;
      id v11 = v13;
      dispatch_async(v14, v22);

      id v12 = v24;
    }
  }
  else
  {
    id v8 = v6;
  }
LABEL_9:
}

uint64_t __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadLookup");
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_save");
  }
  else
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:404 userInfo:0];
  v2 = };
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_queue_loadLookup
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fileQueue);
  if (!self->_lookup)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v4 = [v3 fileExistsAtPath:self->_filePath];

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:self->_filePath options:1 error:0];
      id v19 = 0;
      id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:1 error:&v19];
      id v7 = v19;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x2020000000;
        char v18 = 1;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __47__NTKFaceSupportDateDatabase__queue_loadLookup__block_invoke;
        v14[3] = &unk_1E62C8788;
        v14[4] = &v15;
        [v6 enumerateKeysAndObjectsUsingBlock:v14];
        if (*((unsigned char *)v16 + 24))
        {
          id v8 = v6;
        }
        else
        {
          id v8 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        lookup = self->_lookup;
        self->_lookup = v8;

        _Block_object_dispose(&v15, 8);
      }
      else
      {
        id v11 = [MEMORY[0x1E4F1CA60] dictionary];
        id v12 = self->_lookup;
        self->_lookup = v11;
      }
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      id v10 = self->_lookup;
      self->_lookup = v9;
    }
  }
}

void __47__NTKFaceSupportDateDatabase__queue_loadLookup__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)_queue_save
{
  v21[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fileQueue);
  [(NTKFaceSupportDateDatabase *)self _queue_loadLookup];
  id v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:self->_lookup options:3 error:0];
  if (v3)
  {
    char v4 = [(NSString *)self->_filePath stringByDeletingLastPathComponent];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:self->_filePath isDirectory:0];

    if ((v6 & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v20 = *MEMORY[0x1E4F28370];
      v21[0] = *MEMORY[0x1E4F28378];
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v8 error:0];
    }
    filePath = self->_filePath;
    id v17 = 0;
    char v10 = [v3 writeToFile:filePath options:1 error:&v17];
    id v11 = v17;
    id v12 = v11;
    if (v10)
    {
      v13 = 0;
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      char v18 = @"writeError";
      id v19 = v11;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v13 = [v14 errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:503 userInfo:v15];
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDateDatabaseErrorDomain" code:302 userInfo:0];
  }

  return v13;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_lookup, 0);

  objc_storeStrong((id *)&self->_fileQueue, 0);
}

@end