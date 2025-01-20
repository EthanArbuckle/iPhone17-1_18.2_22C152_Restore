@interface _PSConfidenceModelDriver
+ (id)defaultArchivePath;
+ (void)deleteArchiveFile;
- (BOOL)addEventForModel:(id)a3 forUseCaseKey:(id)a4 event:(id)a5;
- (BOOL)registerModelKey:(id)a3 forUseCaseKey:(id)a4 confidenceWindowSize:(int)a5 minimumInstanceCount:(int)a6;
- (NSMutableDictionary)confidenceModelDictionary;
- (_PSConfidenceModelDriver)init;
- (double)getConfidenceForModel:(id)a3 forUseCaseKey:(id)a4;
- (id)getDictionaryFromArchiveAtPath:(id)a3;
- (id)getOrMakeConfidenceModelDictionary;
- (void)setConfidenceModelDictionary:(id)a3;
- (void)writeArchive:(id)a3 toFilePath:(id)a4;
- (void)writeArchiveFromDict:(id)a3;
@end

@implementation _PSConfidenceModelDriver

- (_PSConfidenceModelDriver)init
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)_PSConfidenceModelDriver;
  v23 = [(_PSConfidenceModelDriver *)&v32 init];
  if (v23)
  {
    v2 = [(_PSConfidenceModelDriver *)v23 getOrMakeConfidenceModelDictionary];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(_PSConfidenceModelDriver *)v23 setConfidenceModelDictionary:v3];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = v2;
    uint64_t v20 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v20)
    {
      uint64_t v19 = *(void *)v29;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v4);
          }
          uint64_t v21 = v5;
          uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * v5);
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v8 = [(_PSConfidenceModelDriver *)v23 confidenceModelDictionary];
          [v8 setObject:v7 forKeyedSubscript:v6];

          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id obj = [v4 objectForKeyedSubscript:v6];
          uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v25;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v25 != v11) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * v12);
                v14 = [v4 objectForKeyedSubscript:v6];
                v15 = [v14 objectForKeyedSubscript:v13];
                v16 = [(_PSConfidenceModelDriver *)v23 confidenceModelDictionary];
                v17 = [v16 objectForKeyedSubscript:v6];
                [v17 setObject:v15 forKeyedSubscript:v13];

                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
            }
            while (v10);
          }

          uint64_t v5 = v21 + 1;
        }
        while (v21 + 1 != v20);
        uint64_t v20 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v20);
    }
  }
  return v23;
}

- (BOOL)registerModelKey:(id)a3 forUseCaseKey:(id)a4 confidenceWindowSize:(int)a5 minimumInstanceCount:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
  uint64_t v13 = [v12 objectForKey:v11];

  v14 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
  v15 = v14;
  if (!v13)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v15 setValue:v19 forKey:v11];

    goto LABEL_5;
  }
  v16 = [v14 objectForKeyedSubscript:v11];
  v17 = [v16 objectForKey:v10];

  if (!v17)
  {
LABEL_5:
    uint64_t v20 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
    uint64_t v21 = [v20 objectForKeyedSubscript:v11];
    v22 = [[_PSConfidenceModel alloc] initWithBufferSize:v7 minimumInstanceCount:v6];
    [v21 setValue:v22 forKey:v10];

    v23 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
    [(_PSConfidenceModelDriver *)self writeArchiveFromDict:v23];

    BOOL v18 = 1;
    goto LABEL_6;
  }
  BOOL v18 = 0;
LABEL_6:

  return v18;
}

- (BOOL)addEventForModel:(id)a3 forUseCaseKey:(id)a4 event:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
  uint64_t v12 = [v11 objectForKey:v9];
  BOOL v13 = v12 != 0;
  if (v12)
  {
    v14 = (void *)v12;
    v15 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
    v16 = [v15 objectForKeyedSubscript:v9];
    v17 = [v16 objectForKey:v8];

    if (!v17)
    {
      BOOL v13 = 0;
      goto LABEL_6;
    }
    BOOL v18 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
    id v19 = [v18 objectForKeyedSubscript:v9];
    uint64_t v20 = [v19 objectForKeyedSubscript:v8];
    [v20 addEvent:v10];

    id v11 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
    [(_PSConfidenceModelDriver *)self writeArchiveFromDict:v11];
  }

LABEL_6:
  return v13;
}

- (double)getConfidenceForModel:(id)a3 forUseCaseKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
  uint64_t v9 = [v8 objectForKey:v7];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
    uint64_t v12 = [v11 objectForKeyedSubscript:v7];
    BOOL v13 = [v12 objectForKey:v6];

    if (!v13)
    {
      double v17 = -1.0;
      goto LABEL_7;
    }
    id v8 = [(_PSConfidenceModelDriver *)self confidenceModelDictionary];
    v14 = [v8 objectForKeyedSubscript:v7];
    v15 = [v14 objectForKeyedSubscript:v6];
    [v15 getConfidence];
    double v17 = v16;
  }
  else
  {
    double v17 = -1.0;
  }

LABEL_7:
  return v17;
}

+ (id)defaultArchivePath
{
  v2 = [MEMORY[0x1E4F5B420] peopleDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"PSConfidenceModel/confidenceModels.archive"];

  return v3;
}

- (id)getDictionaryFromArchiveAtPath:(id)a3
{
  id v25 = 0;
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3 options:2 error:&v25];
  id v4 = v25;
  if (v4)
  {
    id v5 = v4;
    id v6 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_PSConfidenceModelDriver getDictionaryFromArchiveAtPath:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
  id v24 = 0;
  id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v24];
  id v5 = v24;
  if (v5)
  {
    v14 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_PSConfidenceModelDriver getDictionaryFromArchiveAtPath:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    goto LABEL_8;
  }
  v22 = [v6 confidenceModelDictionary];
LABEL_9:

  return v22;
}

- (id)getOrMakeConfidenceModelDictionary
{
  id v3 = +[_PSConfidenceModelDriver defaultArchivePath];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = [(_PSConfidenceModelDriver *)self getDictionaryFromArchiveAtPath:v3];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    [(_PSConfidenceModelDriver *)self writeArchiveFromDict:v6];
  }

  return v6;
}

- (void)writeArchiveFromDict:(id)a3
{
  id v4 = a3;
  id v6 = [[_PSConfidenceModelArchive alloc] initWithConfidenceModelDictionary:v4];

  int v5 = +[_PSConfidenceModelDriver defaultArchivePath];
  [(_PSConfidenceModelDriver *)self writeArchive:v6 toFilePath:v5];
}

- (void)writeArchive:(id)a3 toFilePath:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (a3 && v5)
  {
    id v23 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v23];
    uint64_t v8 = v23;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_PSConfidenceModelDriver writeArchive:toFilePath:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      uint64_t v10 = [v6 stringByDeletingLastPathComponent];
      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v22 = 0;
      [v18 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v22];
      uint64_t v9 = v22;

      if (v9)
      {
        uint64_t v19 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[_PSInteractionPredictor writeArchive:toFilePath:]();
        }
      }
      else
      {
        id v21 = 0;
        [v7 writeToFile:v6 options:1 error:&v21];
        uint64_t v9 = v21;
        uint64_t v20 = +[_PSLogging generalChannel];
        uint64_t v19 = v20;
        if (v9)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[_PSConfidenceModelDriver writeArchive:toFilePath:]((uint64_t)v9, v19);
          }
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v6;
            _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_INFO, "Successfully persisted dictionary: %@", buf, 0xCu);
          }
          uint64_t v9 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Empty archive or filePath when trying to persist _PSConfidenceModelArchive", buf, 2u);
    }
  }
}

+ (void)deleteArchiveFile
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "file deleted: %@", (uint8_t *)&v2, 0xCu);
}

- (NSMutableDictionary)confidenceModelDictionary
{
  return self->_confidenceModelDictionary;
}

- (void)setConfidenceModelDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getDictionaryFromArchiveAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getDictionaryFromArchiveAtPath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeArchive:(uint64_t)a1 toFilePath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error when trying to persist dictionary: %@", (uint8_t *)&v2, 0xCu);
}

- (void)writeArchive:(uint64_t)a3 toFilePath:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end