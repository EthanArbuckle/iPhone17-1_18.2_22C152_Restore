@interface VCIntentDefinitionChange
+ (int)messageType;
- (BOOL)readFrom:(id)a3 error:(id *)a4;
- (BOOL)writeTo:(id)a3 error:(id *)a4;
- (NSArray)files;
- (NSString)checksum;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (VCIntentDefinitionChange)initWithApplicationRecord:(id)a3 changeType:(int64_t)a4;
- (VCIntentDefinitionChange)initWithObjectIdentifier:(id)a3 changeType:(int64_t)a4;
- (int64_t)changeType;
- (void)setChangeType:(int64_t)a3;
- (void)setFiles:(id)a3;
@end

@implementation VCIntentDefinitionChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_checksum, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

- (void)setFiles:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (BOOL)readFrom:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  int v8 = [v7 readFrom:v6 error:a4];

  if (v8)
  {
    v9 = [v7 intentDefinition];
    v10 = [v9 files];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__VCIntentDefinitionChange_readFrom_error___block_invoke;
    v13[3] = &unk_1E6541C18;
    v13[4] = self;
    v11 = objc_msgSend(v10, "if_compactMap:", v13);
    [(VCIntentDefinitionChange *)self setFiles:v11];
  }
  return v8;
}

id __43__VCIntentDefinitionChange_readFrom_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 data];
  if (v4
    && (v5 = (void *)v4,
        [v3 name],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E4F5A900];
    int v8 = [v3 data];
    v9 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
    v10 = [v3 name];
    v11 = [v7 fileWithData:v8 ofType:v9 proposedFilename:v10];

    v12 = [v3 name];
    [v11 setFilename:v12];
  }
  else
  {
    v13 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v3 name];
      v15 = [*(id *)(a1 + 32) objectIdentifier];
      int v17 = 136315650;
      v18 = "-[VCIntentDefinitionChange readFrom:error:]_block_invoke";
      __int16 v19 = 2114;
      v20 = v14;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_ERROR, "%s Received file \"%{public}@\" with empty filename or data for %{public}@, dropping", (uint8_t *)&v17, 0x20u);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)writeTo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = 1;
  if ([(VCIntentDefinitionChange *)self changeType] != 3)
  {
    int v8 = objc_opt_new();
    v9 = [(VCIntentDefinitionChange *)self objectIdentifier];
    [v8 setAssociatedBundleID:v9];

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    uint64_t v20 = 0;
    __int16 v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__6550;
    v24 = __Block_byref_object_dispose__6551;
    id v25 = 0;
    v10 = [(VCIntentDefinitionChange *)self files];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__VCIntentDefinitionChange_writeTo_error___block_invoke;
    v19[3] = &unk_1E6541BF0;
    v19[4] = self;
    v19[5] = &v20;
    v19[6] = &v26;
    v11 = objc_msgSend(v10, "if_compactMap:", v19);
    v12 = (void *)[v11 mutableCopy];
    [v8 setFiles:v12];

    BOOL v7 = *((unsigned char *)v27 + 24) != 0;
    if (*((unsigned char *)v27 + 24))
    {
      v13 = objc_opt_new();
      v14 = [(VCIntentDefinitionChange *)self objectIdentifier];
      [v13 setAssociatedBundleID:v14];

      int64_t v15 = [(VCIntentDefinitionChange *)self changeType];
      if (v15 == 2) {
        unsigned int v16 = 2;
      }
      else {
        unsigned int v16 = 1;
      }
      if (v15 == 3) {
        uint64_t v17 = 3;
      }
      else {
        uint64_t v17 = v16;
      }
      [v13 setChangeType:v17];
      [v13 setIntentDefinition:v8];
      [v13 writeTo:v6];
    }
    else if (a4)
    {
      *a4 = (id) v21[5];
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v7;
}

id __42__VCIntentDefinitionChange_writeTo_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  v5 = [v3 filename];
  [v4 setName:v5];

  id v16 = 0;
  id v6 = [v3 mappedDataWithError:&v16];

  id v7 = v16;
  id v8 = v16;
  [v4 setData:v6];

  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
  }
  uint64_t v9 = [v4 name];
  if (!v9
    || (v10 = (void *)v9,
        [v4 data],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    v12 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v4 name];
      v14 = [*(id *)(a1 + 32) objectIdentifier];
      *(_DWORD *)buf = 136315906;
      v18 = "-[VCIntentDefinitionChange writeTo:error:]_block_invoke";
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read \"%{public}@\" when syncing intent definitions for %{public}@: %{public}@", buf, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }

  return v4;
}

- (NSString)checksum
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  checksum = self->_checksum;
  if (checksum)
  {
    id v3 = checksum;
  }
  else
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x8010000000;
    v35 = &unk_1C7EDD8AE;
    memset(&v36, 0, sizeof(v36));
    CC_SHA1_Init(&v36);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v4 = [(VCIntentDefinitionChange *)self files];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v29;
      obuint64_t j = v4;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v9 = (void *)MEMORY[0x1C87C4C10]();
          v10 = [v8 filename];
          v11 = [v10 dataUsingEncoding:4];

          v12 = v33;
          id v13 = v11;
          CC_SHA1_Update((CC_SHA1_CTX *)(v12 + 4), (const void *)[v13 bytes], objc_msgSend(v13, "length"));
          if ([v8 representationType])
          {
            v14 = [v8 inputStream];
            [v14 open];
            while ([v14 hasBytesAvailable])
            {
              int64_t v15 = (void *)MEMORY[0x1C87C4C10]();
              uint64_t v16 = [v14 read:data maxLength:0x2000];
              if (v16 < 0)
              {
                v18 = getWFWatchSyncLogObject();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  __int16 v19 = [v14 streamError];
                  *(_DWORD *)buf = 136315394;
                  v38 = "-[VCIntentDefinitionChange checksum]";
                  __int16 v39 = 2114;
                  v40 = v19;
                  _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Error calculating intent definition file checksum: %{public}@", buf, 0x16u);
                }
                int v17 = 1;
              }
              else if (v16)
              {
                CC_SHA1_Update((CC_SHA1_CTX *)(v33 + 4), data, v16);
                int v17 = 0;
              }
              else
              {
                int v17 = 5;
              }
              if (v17)
              {
                if (v17 != 5) {
                  goto LABEL_22;
                }
                break;
              }
            }
            [v14 close];
            int v17 = 0;
          }
          else
          {
            v14 = [v8 data];
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __36__VCIntentDefinitionChange_checksum__block_invoke;
            v27[3] = &unk_1E6541BC8;
            v27[4] = &v32;
            [v14 enumerateByteRangesUsingBlock:v27];
            int v17 = 3;
          }
LABEL_22:

          if (v17 != 3 && v17)
          {

            id v3 = 0;
            goto LABEL_30;
          }
        }
        uint64_t v4 = obj;
        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v41 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    CC_SHA1_Final(buf, (CC_SHA1_CTX *)(v33 + 4));
    uint64_t v20 = [MEMORY[0x1E4F28E78] stringWithCapacity:40];
    for (uint64_t j = 0; j != 20; ++j)
      objc_msgSend(v20, "appendFormat:", @"%02x", buf[j]);
    uint64_t v22 = self->_checksum;
    self->_checksum = (NSString *)v20;
    id v23 = v20;

    id v3 = self->_checksum;
LABEL_30:
    _Block_object_dispose(&v32, 8);
  }
  return v3;
}

uint64_t __36__VCIntentDefinitionChange_checksum__block_invoke(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), a2, len);
}

- (NSString)sequencer
{
  return 0;
}

- (VCIntentDefinitionChange)initWithObjectIdentifier:(id)a3 changeType:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCIntentDefinitionChange;
  id v7 = [(VCIntentDefinitionChange *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    objectIdentifier = v7->_objectIdentifier;
    v7->_objectIdentifier = (NSString *)v8;

    v7->_changeType = a4;
    v10 = v7;
  }

  return v7;
}

- (VCIntentDefinitionChange)initWithApplicationRecord:(id)a3 changeType:(int64_t)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"VCIntentDefinitionChange.m", 54, @"Invalid parameter not satisfying: %@", @"applicationRecord" object file lineNumber description];
  }
  uint64_t v8 = [v7 bundleIdentifier];
  uint64_t v9 = [(VCIntentDefinitionChange *)self initWithObjectIdentifier:v8 changeType:a4];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F302B0] appInfoWithApplicationRecord:v7];
    v11 = [v10 supportedActions];
    objc_super v12 = (VCIntentDefinitionChange *)[v11 count];

    if (v12)
    {
      id v13 = v7;
      v14 = objc_opt_new();
      int64_t v15 = objc_msgSend(v13, "if_allIntentDefinitionURLs");
      uint64_t v16 = [v15 allObjects];
      [v14 addObjectsFromArray:v16];

      int v17 = INIntentDefinitionLocalizableFileURLsForBundleRecord();

      [v14 addObjectsFromArray:v17];
      v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"path" ascending:1];
      v31[0] = v18;
      __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      [v14 sortUsingDescriptors:v19];

      uint64_t v20 = objc_msgSend(v14, "if_compactMap:", &__block_literal_global_6574);
      files = v9->_files;
      v9->_files = (NSArray *)v20;

      uint64_t v22 = v9->_files;
      id v23 = (void *)MEMORY[0x1E4F5A900];
      id v24 = [v10 data];
      uint64_t v25 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
      uint64_t v26 = [v23 fileWithData:v24 ofType:v25 proposedFilename:@"AppInfo.appinfo"];
      uint64_t v27 = [(NSArray *)v22 arrayByAddingObject:v26];
      long long v28 = v9->_files;
      v9->_files = (NSArray *)v27;

      objc_super v12 = v9;
    }
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

id __65__VCIntentDefinitionChange_initWithApplicationRecord_changeType___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5A900];
  id v3 = (void *)MEMORY[0x1E4FB4718];
  uint64_t v4 = *MEMORY[0x1E4F44378];
  id v5 = a2;
  id v6 = [v3 typeWithUTType:v4];
  id v7 = [v2 fileWithURL:v5 options:0 ofType:v6];

  uint64_t v8 = [v5 lastPathComponent];

  [v7 setFilename:v8];
  return v7;
}

+ (int)messageType
{
  return 1;
}

@end