@interface ICDataPersister
+ (BOOL)supportsSecureCoding;
+ (id)rootCacheDirectoryPathForPasteboard:(BOOL)a3;
+ (void)deletePasteboardDataFiles;
- (BOOL)makeSureCacheDirectoryExists;
- (BOOL)saveData:(id)a3 identifier:(id)a4;
- (BOOL)verifyDataFiles;
- (ICDataCryptor)dataCryptor;
- (ICDataPersister)init;
- (ICDataPersister)initWithCoder:(id)a3;
- (ICDataPersister)initWithObjectIdentifier:(id)a3 forPasteboard:(BOOL)a4;
- (NSMutableArray)allURLs;
- (NSMutableDictionary)identifierToDataDictionary;
- (NSString)objectIdentifier;
- (NSURL)cacheDirectoryURL;
- (id)description;
- (id)loadDataForIdentifier:(id)a3;
- (unint64_t)accumulatedDataSize;
- (void)createDataCryptorIfNecessary;
- (void)deleteDataFiles;
- (void)encodeWithCoder:(id)a3;
- (void)makeSureCacheDirectoryExists;
- (void)setAccumulatedDataSize:(unint64_t)a3;
- (void)verifyDataFiles;
@end

@implementation ICDataPersister

- (ICDataPersister)init
{
  return 0;
}

- (ICDataPersister)initWithObjectIdentifier:(id)a3 forPasteboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICDataPersister;
  v8 = [(ICDataPersister *)&v20 init];
  if (v8)
  {
    v9 = [(id)objc_opt_class() rootCacheDirectoryPathForPasteboard:v4];
    v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [v10 UUIDString];
    v12 = [v9 stringByAppendingPathComponent:v11];

    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    cacheDirectoryURL = v8->_cacheDirectoryURL;
    v8->_cacheDirectoryURL = (NSURL *)v13;

    objc_storeStrong((id *)&v8->_objectIdentifier, a3);
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    allURLs = v8->_allURLs;
    v8->_allURLs = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    identifierToDataDictionary = v8->_identifierToDataDictionary;
    v8->_identifierToDataDictionary = (NSMutableDictionary *)v17;

    [(ICDataPersister *)v8 createDataCryptorIfNecessary];
  }

  return v8;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)ICDataPersister;
  v3 = [(ICDataPersister *)&v9 description];
  BOOL v4 = NSString;
  v5 = [(ICDataPersister *)self cacheDirectoryURL];
  v6 = [(ICDataPersister *)self objectIdentifier];
  id v7 = [v4 stringWithFormat:@"%@ <%@, %@>", v3, v5, v6];

  return v7;
}

- (void)createDataCryptorIfNecessary
{
  v3 = [(ICDataPersister *)self objectIdentifier];

  if (v3)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    BOOL v4 = +[ICNoteContext sharedContext];
    v5 = [v4 snapshotManagedObjectContext];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__ICDataPersister_createDataCryptorIfNecessary__block_invoke;
    v11[3] = &unk_1E64A5958;
    v11[4] = self;
    id v6 = v5;
    id v12 = v6;
    uint64_t v13 = &v14;
    [v6 performBlockAndWait:v11];
    if (*((unsigned char *)v15 + 24))
    {
      id v7 = [ICDataCryptor alloc];
      v8 = [(ICDataPersister *)self objectIdentifier];
      objc_super v9 = [(ICDataCryptor *)v7 initWithObjectIdentifier:v8];
      dataCryptor = self->_dataCryptor;
      self->_dataCryptor = v9;
    }
    _Block_object_dispose(&v14, 8);
  }
}

void __47__ICDataPersister_createDataCryptorIfNecessary__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectIdentifier];
  id v3 = +[ICCloudSyncingObject cloudObjectWithIdentifier:v2 context:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 isPasswordProtected];
}

+ (id)rootCacheDirectoryPathForPasteboard:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = NSTemporaryDirectory();
  v5 = v4;
  if (v3) {
    id v6 = @"pasteboardDataPersister";
  }
  else {
    id v6 = @"dataPersister";
  }
  id v7 = [v4 stringByAppendingPathComponent:v6];

  return v7;
}

- (BOOL)makeSureCacheDirectoryExists
{
  v2 = [(ICDataPersister *)self cacheDirectoryURL];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  char v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    id v6 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICDataPersister makeSureCacheDirectoryExists]();
    }
  }
  return v4;
}

- (BOOL)saveData:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICDataPersister *)self makeSureCacheDirectoryExists])
  {
    id v8 = [(ICDataPersister *)self dataCryptor];

    if (v8)
    {
      objc_super v9 = [(ICDataPersister *)self dataCryptor];
      uint64_t v10 = [v9 encryptData:v6];

      id v6 = (id)v10;
    }
    v11 = [(ICDataPersister *)self cacheDirectoryURL];
    id v12 = [v11 URLByAppendingPathComponent:v7 isDirectory:0];

    uint64_t v13 = [v12 path];
    char v14 = [v6 writeToFile:v13 atomically:1];

    if (v14)
    {
      -[ICDataPersister setAccumulatedDataSize:](self, "setAccumulatedDataSize:", -[ICDataPersister accumulatedDataSize](self, "accumulatedDataSize") + [v6 length]);
      uint64_t v15 = [(ICDataPersister *)self allURLs];
      [v15 addObject:v12];
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICDataPersister saveData:identifier:]();
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)loadDataForIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICDataPersister *)self identifierToDataDictionary];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [(ICDataPersister *)self cacheDirectoryURL];
    id v8 = [v7 URLByAppendingPathComponent:v4 isDirectory:0];

    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
    if (v9)
    {
      id v6 = (void *)v9;
      uint64_t v10 = [(ICDataPersister *)self dataCryptor];

      if (!v10) {
        goto LABEL_10;
      }
      v11 = [(ICDataPersister *)self dataCryptor];
      uint64_t v12 = [v11 decryptData:v6];

      id v6 = (void *)v12;
      if (v12) {
        goto LABEL_10;
      }
      uint64_t v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = v8;
        _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEFAULT, "Unable to decrypt data at: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      uint64_t v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ICDataPersister loadDataForIdentifier:]();
      }
    }

    id v6 = 0;
LABEL_10:
  }
  return v6;
}

- (void)deleteDataFiles
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Failed to delete large data temp directory: %@", v2, v3, v4, v5, v6);
}

- (BOOL)verifyDataFiles
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = [(ICDataPersister *)self allURLs];
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v22;
    *(void *)&long long v4 = 138412290;
    long long v17 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "lastPathComponent", v17);
        uint64_t v10 = [(ICDataPersister *)self identifierToDataDictionary];
        v11 = [v10 objectForKeyedSubscript:v9];
        if (v11)
        {

          id v12 = 0;
        }
        else
        {
          id v20 = 0;
          char v19 = [v8 checkResourceIsReachableAndReturnError:&v20];
          id v12 = v20;

          if ((v19 & 1) == 0)
          {
            if ([v12 code] != 4)
            {
              int v15 = os_log_create("com.apple.notes", "Topotext");
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                id v26 = v12;
                _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "Got error when checking if data persister file exists: %@", buf, 0xCu);
              }
            }
            obj = os_log_create("com.apple.notes", "Topotext");
            if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
              -[ICDataPersister verifyDataFiles]();
            }
            BOOL v14 = 0;
            goto LABEL_21;
          }
        }
        uint64_t v13 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v17;
          id v26 = v8;
          _os_log_debug_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEBUG, "Verified file exists at %@", buf, 0xCu);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_21:

  return v14;
}

+ (void)deletePasteboardDataFiles
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Failed to delete pasteboard data directory: %@", v2, v3, v4, v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDataPersister)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICDataPersister;
  uint64_t v5 = [(ICDataPersister *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheDirectoryURL"];
    cacheDirectoryURL = v5->_cacheDirectoryURL;
    v5->_cacheDirectoryURL = (NSURL *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"allURLs"];
    allURLs = v5->_allURLs;
    v5->_allURLs = (NSMutableArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectIdentifier"];
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataCryptor"];
    dataCryptor = v5->_dataCryptor;
    v5->_dataCryptor = (ICDataCryptor *)v15;

    v5->_accumulatedDataSize = [v4 decodeIntegerForKey:@"accumulatedDataSize"];
    long long v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"identifierToDataDictionary"];
    identifierToDataDictionary = v5->_identifierToDataDictionary;
    v5->_identifierToDataDictionary = (NSMutableDictionary *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICDataPersister accumulatedDataSize](self, "accumulatedDataSize"), @"accumulatedDataSize");
  uint64_t v5 = [(ICDataPersister *)self cacheDirectoryURL];
  [v4 encodeObject:v5 forKey:@"cacheDirectoryURL"];

  uint64_t v6 = [(ICDataPersister *)self allURLs];
  [v4 encodeObject:v6 forKey:@"allURLs"];

  id v7 = [(ICDataPersister *)self objectIdentifier];

  if (v7)
  {
    id v8 = [(ICDataPersister *)self objectIdentifier];
    [v4 encodeObject:v8 forKey:@"objectIdentifier"];
  }
  uint64_t v9 = [(ICDataPersister *)self dataCryptor];

  if (v9)
  {
    uint64_t v10 = [(ICDataPersister *)self dataCryptor];
    [v4 encodeObject:v10 forKey:@"dataCryptor"];
  }
  unint64_t v11 = [(ICDataPersister *)self accumulatedDataSize];
  id v12 = os_log_create("com.apple.notes", "Topotext");
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11 >> 21 > 0x4A)
  {
    if (v13) {
      -[ICDataPersister encodeWithCoder:](self, v12);
    }
  }
  else
  {
    v29 = v4;
    if (v13) {
      -[ICDataPersister encodeWithCoder:](self, v12);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    BOOL v14 = [(ICDataPersister *)self allURLs];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v20 = [v19 lastPathComponent];
          uint64_t v21 = [(ICDataPersister *)self identifierToDataDictionary];
          long long v22 = [v21 objectForKeyedSubscript:v20];

          if (!v22)
          {
            uint64_t v23 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v19];
            if (v23)
            {
              objc_super v24 = (void *)v23;
              v25 = [(ICDataPersister *)self dataCryptor];

              if (!v25
                || ([(ICDataPersister *)self dataCryptor],
                    id v26 = objc_claimAutoreleasedReturnValue(),
                    [v26 decryptData:v24],
                    uint64_t v27 = objc_claimAutoreleasedReturnValue(),
                    v24,
                    v26,
                    (objc_super v24 = (void *)v27) != 0))
              {
                uint64_t v28 = [(ICDataPersister *)self identifierToDataDictionary];
                [v28 setObject:v24 forKeyedSubscript:v20];
              }
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v16);
    }

    id v12 = [(ICDataPersister *)self identifierToDataDictionary];
    id v4 = v29;
    [v29 encodeObject:v12 forKey:@"identifierToDataDictionary"];
  }
}

- (unint64_t)accumulatedDataSize
{
  return self->_accumulatedDataSize;
}

- (void)setAccumulatedDataSize:(unint64_t)a3
{
  self->_accumulatedDataSize = a3;
}

- (ICDataCryptor)dataCryptor
{
  return self->_dataCryptor;
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSMutableArray)allURLs
{
  return self->_allURLs;
}

- (NSMutableDictionary)identifierToDataDictionary
{
  return self->_identifierToDataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToDataDictionary, 0);
  objc_storeStrong((id *)&self->_allURLs, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_dataCryptor, 0);
}

- (void)makeSureCacheDirectoryExists
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Failed to create large data directory with error %@.", v2, v3, v4, v5, v6);
}

- (void)saveData:identifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Unable to write data at URL: %@", v2, v3, v4, v5, v6);
}

- (void)loadDataForIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Unable to find large data at URL: %@", v2);
}

- (void)verifyDataFiles
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Not all files exists for ICDataPersister: %@", v2);
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 accumulatedDataSize];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, a2, v3, "Encoding all data for pasteboard: %lu", v4);
}

- (void)encodeWithCoder:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 accumulatedDataSize];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, a2, v3, "Data is too large to be encoded for the pasteboard: %lu", v4);
}

@end