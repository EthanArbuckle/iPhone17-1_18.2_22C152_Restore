@interface UNCKeyedDictionaryRepository
- (BOOL)_saveDictionary:(id)a3 atPath:(id)a4;
- (UNCKeyedDictionaryRepository)initWithDirectory:(id)a3 fileName:(id)a4 pathExtension:(id)a5 librarian:(id)a6;
- (id)_dataAtPath:(id)a3;
- (id)_dictionaryAtPath:(id)a3;
- (id)_directoryForKey:(id)a3;
- (id)_pathForKey:(id)a3;
- (id)allKeys;
- (id)dictionaryForKey:(id)a3;
- (void)_removeDictionaryAtPath:(id)a3;
- (void)removeDictionaryForKey:(id)a3;
- (void)setDictionary:(id)a3 forKey:(id)a4;
@end

@implementation UNCKeyedDictionaryRepository

- (void)removeDictionaryForKey:(id)a3
{
  id v4 = [(UNCKeyedDictionaryRepository *)self _pathForKey:a3];
  [(UNCKeyedDictionaryRepository *)self _removeDictionaryAtPath:v4];
}

- (void)_removeDictionaryAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v7 = 0;
    char v5 = [v4 removeItemAtPath:v3 error:&v7];
    id v6 = v7;
    if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
      -[UNCKeyedDictionaryRepository _removeDictionaryAtPath:]();
    }
  }
}

- (id)_pathForKey:(id)a3
{
  id v4 = [(UNCKeyedDictionaryRepository *)self _directoryForKey:a3];
  char v5 = [v4 stringByAppendingPathComponent:self->_fileName];
  id v6 = [v5 stringByAppendingPathExtension:self->_pathExtension];

  return v6;
}

- (id)_directoryForKey:(id)a3
{
  id v4 = [(UNCBundleLibrarian *)self->_librarian uniqueIdentifierForBundleIdentifier:a3];
  char v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:&stru_270CB9250];
  id v6 = [(NSString *)self->_directory stringByAppendingPathComponent:v5];

  return v6;
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(UNCKeyedDictionaryRepository *)self _pathForKey:a4];
  [(UNCKeyedDictionaryRepository *)self _saveDictionary:v6 atPath:v7];
}

- (BOOL)_saveDictionary:(id)a3 atPath:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_t *)MEMORY[0x263F1E030];
  v8 = (void *)*MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    id v26 = v6;
    __int16 v27 = 2048;
    uint64_t v28 = [v5 count];
    _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "Saving file at %{public}@ with %lu items", buf, 0x16u);
  }
  v10 = [MEMORY[0x263F08850] defaultManager];
  v11 = [v6 stringByDeletingLastPathComponent];
  if (([v10 fileExistsAtPath:v11] & 1) == 0)
  {
    id v24 = 0;
    char v12 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v13 = v24;
    if ((v12 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.4();
    }
  }
  id v23 = 0;
  v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v23];
  id v15 = v23;
  v16 = v15;
  if (v14)
  {
    id v22 = v15;
    char v17 = [v14 writeToFile:v6 options:268435457 error:&v22];
    id v18 = v22;

    if (v17)
    {
      BOOL v19 = 1;
    }
    else
    {
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        -[UNCBundleLibrarian _queue_saveDictionary:atPath:]();
      }
      BOOL v19 = 0;
    }
    v16 = v18;
  }
  else
  {
    v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      -[UNCKeyedDictionaryRepository _saveDictionary:atPath:]((uint64_t)v16, v20);
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (UNCKeyedDictionaryRepository)initWithDirectory:(id)a3 fileName:(id)a4 pathExtension:(id)a5 librarian:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)UNCKeyedDictionaryRepository;
  v14 = [(UNCKeyedDictionaryRepository *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    directory = v14->_directory;
    v14->_directory = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    fileName = v14->_fileName;
    v14->_fileName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    pathExtension = v14->_pathExtension;
    v14->_pathExtension = (NSString *)v19;

    objc_storeStrong((id *)&v14->_librarian, a6);
  }

  return v14;
}

- (id)allKeys
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v15 = [MEMORY[0x263EFF980] array];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 enumeratorAtPath:self->_directory];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [(NSString *)self->_directory stringByAppendingPathComponent:v9];
        id v11 = [v10 stringByAppendingPathComponent:self->_fileName];
        id v12 = [v11 stringByAppendingPathExtension:self->_pathExtension];

        if ([v3 fileExistsAtPath:v12])
        {
          id v13 = [(UNCBundleLibrarian *)self->_librarian bundleIdentifierForUniqueIdentifier:v9];
          if (v13) {
            [v15 addObject:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v15;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = [(UNCKeyedDictionaryRepository *)self _pathForKey:a3];
  uint64_t v5 = [(UNCKeyedDictionaryRepository *)self _dictionaryAtPath:v4];

  return v5;
}

- (id)_dictionaryAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UNCKeyedDictionaryRepository *)self _dataAtPath:v4];
  if (!v5)
  {
LABEL_7:
    id v15 = 0;
    goto LABEL_8;
  }
  v20 = (void *)MEMORY[0x263F08928];
  objc_super v22 = (void *)MEMORY[0x263EFFA08];
  uint64_t v21 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v22, "setWithObjects:", v21, v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  id v15 = [v20 unarchivedObjectOfClasses:v14 fromData:v5 error:0];

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v16 = (void *)*MEMORY[0x263F1E030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        [(UNCKeyedDictionaryRepository *)v16 _dictionaryAtPath:(uint64_t)v4];
      }

      goto LABEL_7;
    }
  }
LABEL_8:

  return v15;
}

- (id)_dataAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  if (!v4)
  {
    uint64_t v5 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
      -[UNCKeyedDictionaryRepository _dataAtPath:]((uint64_t)v3, v5);
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)_dictionaryAtPath:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2608DB000, v4, OS_LOG_TYPE_ERROR, "Unexpected class %{public}@ decocded at %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_dictionaryAtPath:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    uint64_t v6 = a2;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_error_impl(&dword_2608DB000, v4, OS_LOG_TYPE_ERROR, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v5,
      0x16u);
  }

  objc_end_catch();
}

- (void)_dataAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "No data found at %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_saveDictionary:(uint64_t)a1 atPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "Could not encode object data: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_saveDictionary:(void *)a1 atPath:.cold.3(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = objc_begin_catch(a1);
  int v2 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_error_impl(&dword_2608DB000, v2, OS_LOG_TYPE_ERROR, "Unable to archive objects: %{public}@", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

- (void)_removeDictionaryAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not delete %{public}@: %{public}@");
}

@end