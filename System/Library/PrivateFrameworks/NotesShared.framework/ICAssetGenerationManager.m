@interface ICAssetGenerationManager
- (BOOL)beginGeneration;
- (BOOL)commitGeneration;
- (BOOL)isAdvancing;
- (BOOL)rollbackGeneration;
- (ICAssetGeneration)currentGeneration;
- (ICAssetGeneration)nextGeneration;
- (ICAssetGenerationManager)initWithObject:(id)a3 generationKeyPath:(id)a4 containerURL:(id)a5;
- (ICCloudSyncingObject)object;
- (ICDistributedLock)nextGenerationLock;
- (NSArray)fallbackURLs;
- (NSString)generationKeyPath;
- (NSURL)containerURL;
- (NSURL)generationURL;
- (double)generationTimeout;
- (id)description;
- (void)beginGeneration;
- (void)commitGeneration;
- (void)dealloc;
- (void)managedObjectContextDidSaveObjectIDs:(id)a3;
- (void)managedObjectContextObjectsDidChange:(id)a3;
- (void)removeStaleGenerations;
- (void)rollbackGeneration;
- (void)setAdvancing:(BOOL)a3;
- (void)setCurrentGeneration:(id)a3;
- (void)setFallbackURLs:(id)a3;
- (void)setGenerationTimeout:(double)a3;
- (void)setNextGeneration:(id)a3;
- (void)setNextGenerationLock:(id)a3;
- (void)updateCurrentGeneration;
@end

@implementation ICAssetGenerationManager

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  v2 = [v1 object];
  [v2 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  v3 = [(id)OUTLINED_FUNCTION_5() containerURL];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Deallocating asset generation manager while advancing asset generation — rolling back {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);
}

- (void)setFallbackURLs:(id)a3
{
}

- (ICAssetGenerationManager)initWithObject:(id)a3 generationKeyPath:(id)a4 containerURL:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 managedObjectContext];
  if (v11 && [v9 length])
  {

    if (v10)
    {
      v25.receiver = self;
      v25.super_class = (Class)ICAssetGenerationManager;
      v12 = [(ICAssetGenerationManager *)&v25 init];
      v13 = v12;
      if (v12)
      {
        objc_storeWeak((id *)&v12->_object, v8);
        objc_storeStrong((id *)&v13->_generationKeyPath, a4);
        objc_storeStrong((id *)&v13->_containerURL, a5);
        fallbackURLs = v13->_fallbackURLs;
        v13->_fallbackURLs = (NSArray *)MEMORY[0x1E4F1CBF0];

        v13->_generationTimeout = 3600.0;
        [(ICAssetGenerationManager *)v13 updateCurrentGeneration];
        v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v16 = *MEMORY[0x1E4F1BE30];
        v17 = [v8 managedObjectContext];
        [v15 addObserver:v13 selector:sel_managedObjectContextObjectsDidChange_ name:v16 object:v17];

        v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v19 = *MEMORY[0x1E4F1BE28];
        v20 = [v8 managedObjectContext];
        [v18 addObserver:v13 selector:sel_managedObjectContextDidSaveObjectIDs_ name:v19 object:v20];
      }
      self = v13;
      v21 = self;
      goto LABEL_11;
    }
  }
  else
  {
  }
  v22 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v24 = [v8 shortLoggingDescription];
    *(_DWORD *)buf = 138412802;
    v27 = v24;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_error_impl(&dword_1C3A61000, v22, OS_LOG_TYPE_ERROR, "Cannot create asset generation manager because parameters are invalid {object: %@, generationKeyPath: %@, containerUrl: %@}", buf, 0x20u);
  }
  v21 = 0;
LABEL_11:

  return v21;
}

- (void)updateCurrentGeneration
{
  objc_opt_class();
  v3 = [(ICAssetGenerationManager *)self object];
  uint64_t v4 = [(ICAssetGenerationManager *)self generationKeyPath];
  uint64_t v5 = [v3 valueForKeyPath:v4];
  ICCheckedDynamicCast();
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23) {
    uint64_t v6 = [[ICAssetGeneration alloc] initWithRawValue:v23];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(ICAssetGenerationManager *)self nextGeneration];

  if (!v7) {
    goto LABEL_31;
  }
  id v8 = [(ICAssetGenerationManager *)self currentGeneration];
  id v9 = (void *)*MEMORY[0x1E4F1D260];
  if ((ICAssetGeneration *)*MEMORY[0x1E4F1D260] == v6) {
    id v10 = 0;
  }
  else {
    id v10 = v6;
  }
  unint64_t v11 = v10;
  if (v9 == v8) {
    v12 = 0;
  }
  else {
    v12 = v8;
  }
  unint64_t v13 = v12;
  if (!(v11 | v13))
  {

    goto LABEL_19;
  }
  v14 = (void *)v13;
  if (v11) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    int v16 = [(id)v11 isEqual:v13];

    if (!v16) {
      goto LABEL_21;
    }
LABEL_19:
    [(ICAssetGenerationManager *)self setAdvancing:1];
    [(ICAssetGenerationManager *)self rollbackGeneration];
    goto LABEL_32;
  }

LABEL_21:
  v17 = [(ICAssetGenerationManager *)self nextGeneration];
  id v18 = (id)v11;
  if (v9 == v17) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v17;
  }
  unint64_t v20 = v19;
  if (!(v11 | v20))
  {

    goto LABEL_32;
  }
  v21 = (void *)v20;
  if (!v11 || !v20)
  {

    goto LABEL_31;
  }
  char v22 = [v18 isEqual:v20];

  if ((v22 & 1) == 0) {
LABEL_31:
  }
    [(ICAssetGenerationManager *)self setCurrentGeneration:v6];
LABEL_32:
}

- (void)setCurrentGeneration:(id)a3
{
}

- (NSURL)generationURL
{
  v3 = [(ICAssetGenerationManager *)self nextGeneration];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ICAssetGenerationManager *)self currentGeneration];
  }
  uint64_t v6 = v5;

  uint64_t v7 = [v6 rawValue];
  if (v7)
  {
    id v8 = [(ICAssetGenerationManager *)self containerURL];
    id v9 = [v6 rawValue];
    id v10 = [v8 URLByAppendingPathComponent:v9 isDirectory:1];
  }
  else
  {
    id v10 = 0;
  }

  return (NSURL *)v10;
}

- (ICAssetGeneration)nextGeneration
{
  return self->_nextGeneration;
}

- (NSString)generationKeyPath
{
  return self->_generationKeyPath;
}

- (ICAssetGeneration)currentGeneration
{
  return self->_currentGeneration;
}

- (void)managedObjectContextObjectsDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];

  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA8]];
  ICCheckedDynamicCast();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [(ICAssetGenerationManager *)self object];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(ICAssetGenerationManager *)self object];
    if ([v15 containsObject:v9])
    {
      id v10 = [(ICAssetGenerationManager *)self object];
      unint64_t v11 = [v10 changedValuesForCurrentEvent];
      v12 = [v11 allKeys];
      unint64_t v13 = [(ICAssetGenerationManager *)self generationKeyPath];
      int v14 = [v12 containsObject:v13];

      if (v14) {
        [(ICAssetGenerationManager *)self updateCurrentGeneration];
      }
    }
    else
    {
    }
  }
}

- (ICCloudSyncingObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return (ICCloudSyncingObject *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextGenerationLock, 0);
  objc_storeStrong((id *)&self->_nextGeneration, 0);
  objc_storeStrong((id *)&self->_currentGeneration, 0);
  objc_storeStrong((id *)&self->_fallbackURLs, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_generationKeyPath, 0);
  objc_destroyWeak((id *)&self->_object);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ICAssetGenerationManager *)self object];
  uint64_t v7 = [v6 shortLoggingDescription];
  id v8 = [(ICAssetGenerationManager *)self containerURL];
  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAssetGenerationManager isAdvancing](self, "isAdvancing"));
  id v10 = [v3 stringWithFormat:@"<%@: %p, object: %@, containerURL: %@, isAdvancing: %@>", v5, self, v7, v8, v9];

  return v10;
}

- (BOOL)beginGeneration
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICAssetGenerationManager *)self object];
    id v5 = [v4 shortLoggingDescription];
    uint64_t v6 = [(ICAssetGenerationManager *)self containerURL];
    *(_DWORD *)buf = 138413058;
    v46 = v5;
    __int16 v47 = 2112;
    __int16 v49 = 2080;
    v48 = v6;
    v50 = "-[ICAssetGenerationManager beginGeneration]";
    __int16 v51 = 1024;
    int v52 = 115;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Beginning asset generation… {object: %@, containerUrl: %@}%s:%d", buf, 0x26u);
  }
  if (![(ICAssetGenerationManager *)self isAdvancing])
  {
    id v8 = [(ICAssetGenerationManager *)self object];
    id v9 = [v8 managedObjectContext];

    if (!v9)
    {
      uint64_t v7 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICAssetGenerationManager beginGeneration](self);
      }
      goto LABEL_11;
    }
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    unint64_t v11 = [(ICAssetGenerationManager *)self containerURL];
    id v44 = 0;
    char v12 = [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v44];
    unint64_t v13 = v44;
    int v14 = v13;
    if (v12)
    {
    }
    else
    {
      uint64_t v16 = [v13 code];

      if (v16 != 516)
      {
        uint64_t v7 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[ICAssetGenerationManager beginGeneration].cold.6(self);
        }

        goto LABEL_34;
      }
    }
    uint64_t v17 = [(ICAssetGenerationManager *)self nextGeneration];
    if (v17)
    {
      id v18 = (void *)v17;
      uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      unint64_t v20 = [(ICAssetGenerationManager *)self generationURL];
      v43 = v14;
      char v21 = [v19 removeItemAtURL:v20 error:&v43];
      char v22 = v43;

      if ((v21 & 1) == 0)
      {
        id v23 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[ICAssetGenerationManager beginGeneration].cold.5(self);
        }
      }
    }
    else
    {
      char v22 = v14;
    }
    v24 = [(ICAssetGenerationManager *)self currentGeneration];
    objc_super v25 = [v24 nextGeneration];
    if (v25)
    {
      [(ICAssetGenerationManager *)self setNextGeneration:v25];
    }
    else
    {
      v26 = objc_alloc_init(ICAssetGeneration);
      [(ICAssetGenerationManager *)self setNextGeneration:v26];
    }
    [(ICAssetGenerationManager *)self setAdvancing:1];
    v27 = [(ICAssetGenerationManager *)self containerURL];
    __int16 v28 = [(ICAssetGenerationManager *)self nextGeneration];
    id v29 = [v28 rawValue];
    __int16 v30 = [v27 URLByAppendingPathComponent:v29 isDirectory:1];

    uint64_t v7 = [v30 URLByAppendingPathExtension:@"lock"];

    id v31 = (void *)MEMORY[0x1E4F83748];
    uint64_t v32 = [v7 path];
    v33 = [v31 lockWithPath:v32];
    [(ICAssetGenerationManager *)self setNextGenerationLock:v33];

    v34 = [(ICAssetGenerationManager *)self nextGenerationLock];
    LOBYTE(v32) = [v34 tryLock];

    if (v32)
    {
      v35 = [MEMORY[0x1E4F28CB8] defaultManager];
      v36 = [(ICAssetGenerationManager *)self generationURL];
      v42 = v22;
      BOOL v15 = 1;
      char v37 = [v35 createDirectoryAtURL:v36 withIntermediateDirectories:1 attributes:0 error:&v42];
      int v14 = v42;

      if (v37) {
        goto LABEL_35;
      }
      v38 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[ICAssetGenerationManager beginGeneration](self);
      }

      [(ICAssetGenerationManager *)self setNextGeneration:0];
      v39 = [(ICAssetGenerationManager *)self nextGenerationLock];
      [v39 unlock];
    }
    else
    {
      v40 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[ICAssetGenerationManager beginGeneration].cold.4(self);
      }

      [(ICAssetGenerationManager *)self setNextGeneration:0];
      int v14 = v22;
    }
    [(ICAssetGenerationManager *)self setNextGenerationLock:0];
    [(ICAssetGenerationManager *)self setAdvancing:0];
LABEL_34:
    BOOL v15 = 0;
    goto LABEL_35;
  }
  uint64_t v7 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ICAssetGenerationManager beginGeneration]();
  }
LABEL_11:
  BOOL v15 = 0;
  int v14 = v7;
LABEL_35:

  return v15;
}

- (BOOL)commitGeneration
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICAssetGenerationManager *)self object];
    id v5 = [v4 shortLoggingDescription];
    uint64_t v6 = [(ICAssetGenerationManager *)self containerURL];
    int v16 = 138413058;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    __int16 v20 = 2080;
    uint64_t v19 = v6;
    char v21 = "-[ICAssetGenerationManager commitGeneration]";
    __int16 v22 = 1024;
    int v23 = 172;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Committing asset generation… {object: %@, containerUrl: %@}%s:%d", (uint8_t *)&v16, 0x26u);
  }
  if ([(ICAssetGenerationManager *)self isAdvancing])
  {
    uint64_t v7 = [(ICAssetGenerationManager *)self object];
    id v8 = [v7 managedObjectContext];

    if (v8)
    {
      [(ICAssetGenerationManager *)self setAdvancing:0];
      id v9 = [(ICAssetGenerationManager *)self object];
      id v10 = [(ICAssetGenerationManager *)self nextGeneration];
      unint64_t v11 = [v10 rawValue];
      char v12 = [(ICAssetGenerationManager *)self generationKeyPath];
      [v9 setValue:v11 forKey:v12];

      return 1;
    }
    BOOL v15 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ICAssetGenerationManager commitGeneration](self);
    }

    [(ICAssetGenerationManager *)self rollbackGeneration];
  }
  else
  {
    int v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICAssetGenerationManager commitGeneration]();
    }
  }
  return 0;
}

- (BOOL)rollbackGeneration
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICAssetGenerationManager *)self object];
    id v5 = [v4 shortLoggingDescription];
    uint64_t v6 = [(ICAssetGenerationManager *)self containerURL];
    *(_DWORD *)buf = 138413058;
    char v21 = v5;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    int v23 = v6;
    objc_super v25 = "-[ICAssetGenerationManager rollbackGeneration]";
    __int16 v26 = 1024;
    int v27 = 197;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Rolling back asset generation… {object: %@, containerUrl: %@}%s:%d", buf, 0x26u);
  }
  BOOL v7 = [(ICAssetGenerationManager *)self isAdvancing];
  if (v7)
  {
    id v8 = [(ICAssetGenerationManager *)self nextGenerationLock];
    [v8 unlock];

    [(ICAssetGenerationManager *)self setNextGenerationLock:0];
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = [(ICAssetGenerationManager *)self generationURL];
    id v19 = 0;
    char v11 = [v9 removeItemAtURL:v10 error:&v19];
    os_log_t v12 = (os_log_t)v19;

    if ((v11 & 1) == 0)
    {
      unint64_t v13 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ICAssetGenerationManager beginGeneration].cold.5(self);
      }
    }
    [(ICAssetGenerationManager *)self setNextGeneration:0];
    [(ICAssetGenerationManager *)self setAdvancing:0];
    os_log_t v14 = [(ICAssetGenerationManager *)self object];
    BOOL v15 = [(ICAssetGenerationManager *)self currentGeneration];
    int v16 = [v15 rawValue];
    uint64_t v17 = [(ICAssetGenerationManager *)self generationKeyPath];
    [v14 setValue:v16 forKey:v17];
  }
  else
  {
    os_log_t v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICAssetGenerationManager rollbackGeneration]();
    }
    os_log_t v12 = v14;
  }

  return v7;
}

- (void)removeStaleGenerations
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICAssetGenerationManager *)self object];
    id v5 = [v4 shortLoggingDescription];
    uint64_t v6 = [(ICAssetGenerationManager *)self containerURL];
    *(_DWORD *)buf = 138413058;
    v84 = v5;
    __int16 v85 = 2112;
    __int16 v87 = 2080;
    v86 = v6;
    v88 = "-[ICAssetGenerationManager removeStaleGenerations]";
    __int16 v89 = 1024;
    int v90 = 227;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Removing stale generations… {object: %@, containerUrl: %@}%s:%d", buf, 0x26u);
  }
  BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v62 = self;
  id v8 = [(ICAssetGenerationManager *)self containerURL];
  uint64_t v66 = *MEMORY[0x1E4F1C628];
  uint64_t v82 = *MEMORY[0x1E4F1C628];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  id v79 = 0;
  id v10 = [v7 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v9 options:1 error:&v79];
  id v11 = v79;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v75 objects:v81 count:16];
  id v61 = v12;
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v76;
    *(void *)&long long v14 = 138412546;
    long long v59 = v14;
    uint64_t v65 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v76 != v16) {
          objc_enumerationMutation(v12);
        }
        __int16 v18 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        id v19 = objc_msgSend(v18, "pathExtension", v59);
        char v20 = [v19 isEqual:@"lock"];

        if ((v20 & 1) == 0)
        {
          id v73 = 0;
          id v74 = 0;
          char v21 = [v18 getResourceValue:&v74 forKey:v66 error:&v73];
          id v22 = v74;
          id v23 = v73;

          if ((v21 & 1) == 0)
          {
            objc_super v25 = os_log_create("com.apple.notes", "Media");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v18;
              _os_log_error_impl(&dword_1C3A61000, v25, OS_LOG_TYPE_ERROR, "Cannot determine if URL is directory — skipping {url: %@}", buf, 0xCu);
            }
            goto LABEL_48;
          }
          if (([v22 BOOLValue] & 1) == 0)
          {
            objc_super v25 = os_log_create("com.apple.notes", "Media");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v18;
              _os_log_debug_impl(&dword_1C3A61000, v25, OS_LOG_TYPE_DEBUG, "Skipping non-directory file {url: %@}", buf, 0xCu);
            }
            goto LABEL_48;
          }
          __int16 v24 = [v18 pathComponents];
          objc_super v25 = [v24 lastObject];

          __int16 v26 = [[ICAssetGeneration alloc] initWithRawValue:v25];
          if (v26)
          {
            int v27 = v62;
            uint64_t v28 = [(ICAssetGenerationManager *)v62 currentGeneration];
            id v29 = v64;
            if (v28)
            {
              id v29 = [(ICAssetGenerationManager *)v62 currentGeneration];
              if ([(ICAssetGeneration *)v26 isEqual:v29])
              {

                goto LABEL_46;
              }
              int v27 = v62;
            }
            v63 = v26;
            __int16 v30 = [(ICAssetGenerationManager *)v27 nextGeneration];
            v64 = v29;
            if (v30)
            {
              id v31 = [(ICAssetGenerationManager *)v27 nextGeneration];
              BOOL v32 = [(ICAssetGeneration *)v63 isEqual:v31];

              if (v28)
              {
                id v29 = v64;

                if (!v32) {
                  goto LABEL_30;
                }
              }
              else
              {
                id v29 = v64;
                if (!v32) {
                  goto LABEL_30;
                }
              }
              __int16 v26 = v63;
LABEL_47:

              id v12 = v61;
LABEL_48:

              id v11 = v23;
              uint64_t v16 = v65;
              continue;
            }

            if (v28)
            {
            }
LABEL_30:
            uint64_t v28 = [v18 URLByAppendingPathExtension:@"lock"];
            v33 = (void *)MEMORY[0x1E4F83748];
            v34 = [v28 path];
            v35 = [v33 lockWithPath:v34];

            v60 = v35;
            if ([v35 tryLock])
            {
LABEL_36:
              v43 = [MEMORY[0x1E4F28CB8] defaultManager];
              id v72 = v23;
              char v44 = [v43 removeItemAtURL:v18 error:&v72];
              id v45 = v72;

              if ((v44 & 1) == 0)
              {
                v46 = os_log_create("com.apple.notes", "Media");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v84 = v18;
                  _os_log_error_impl(&dword_1C3A61000, v46, OS_LOG_TYPE_ERROR, "Cannot remove asset generation {url: %@}", buf, 0xCu);
                }
                id v23 = v45;
                id v29 = v64;
                goto LABEL_44;
              }
              id v23 = v45;
              id v29 = v64;
            }
            else
            {
              [(ICAssetGenerationManager *)v62 generationTimeout];
              if (v36 <= 0.0
                || ([v35 lockDate],
                    char v37 = objc_claimAutoreleasedReturnValue(),
                    [v37 timeIntervalSinceNow],
                    double v39 = v38,
                    [(ICAssetGenerationManager *)v62 generationTimeout],
                    double v41 = v39 + v40,
                    v37,
                    v41 < 0.0))
              {
                v42 = os_log_create("com.apple.notes", "Media");
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v84 = v18;
                  _os_log_impl(&dword_1C3A61000, v42, OS_LOG_TYPE_INFO, "Breaking lock for asset generation {url: %@}", buf, 0xCu);
                }

                [v60 breakLock];
                goto LABEL_36;
              }
              v46 = os_log_create("com.apple.notes", "Media");
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                __int16 v47 = [MEMORY[0x1E4F28ED0] numberWithInt:*__error()];
                *(_DWORD *)buf = v59;
                v84 = v18;
                __int16 v85 = 2112;
                v86 = v47;
                _os_log_impl(&dword_1C3A61000, v46, OS_LOG_TYPE_INFO, "Cannot unlock asset generation — skipping {url: %@, errno: %@}", buf, 0x16u);
              }
LABEL_44:
            }
            __int16 v26 = v63;
          }
          else
          {
            uint64_t v28 = os_log_create("com.apple.notes", "Media");
            id v29 = v64;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v18;
              _os_log_debug_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEBUG, "Skipping non-generational directory {url: %@}", buf, 0xCu);
            }
          }
LABEL_46:
          v64 = v29;

          goto LABEL_47;
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v15);
  }

  v48 = [(ICAssetGenerationManager *)v62 currentGeneration];

  if (v48)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    __int16 v49 = [(ICAssetGenerationManager *)v62 fallbackURLs];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (!v50) {
      goto LABEL_64;
    }
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v69;
    while (1)
    {
      uint64_t v53 = 0;
      v54 = v11;
      do
      {
        if (*(void *)v69 != v52) {
          objc_enumerationMutation(v49);
        }
        v55 = *(void **)(*((void *)&v68 + 1) + 8 * v53);
        v56 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v67 = v54;
        char v57 = [v56 removeItemAtURL:v55 error:&v67];
        id v11 = v67;

        if ((v57 & 1) == 0)
        {
          uint64_t v58 = [v11 code];

          if (v58 == 4) {
            goto LABEL_62;
          }
          v56 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v55;
            _os_log_error_impl(&dword_1C3A61000, v56, OS_LOG_TYPE_ERROR, "Cannot remove fallback {url: %@}", buf, 0xCu);
          }
        }

LABEL_62:
        ++v53;
        v54 = v11;
      }
      while (v51 != v53);
      uint64_t v51 = [v49 countByEnumeratingWithState:&v68 objects:v80 count:16];
      if (!v51)
      {
LABEL_64:

        id v12 = v61;
        break;
      }
    }
  }
}

- (void)managedObjectContextDidSaveObjectIDs:(id)a3
{
  if ([(ICAssetGenerationManager *)self isAdvancing])
  {
    id v4 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ICAssetGenerationManager managedObjectContextDidSaveObjectIDs:]();
    }

    [(ICAssetGenerationManager *)self rollbackGeneration];
  }
  else
  {
    id v5 = [(ICAssetGenerationManager *)self nextGeneration];

    if (v5)
    {
      uint64_t v6 = [(ICAssetGenerationManager *)self nextGeneration];
      [(ICAssetGenerationManager *)self setCurrentGeneration:v6];

      [(ICAssetGenerationManager *)self setNextGeneration:0];
      [(ICAssetGenerationManager *)self removeStaleGenerations];
      BOOL v7 = [(ICAssetGenerationManager *)self nextGenerationLock];
      [v7 unlock];

      [(ICAssetGenerationManager *)self setNextGenerationLock:0];
    }
  }
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSArray)fallbackURLs
{
  return self->_fallbackURLs;
}

- (double)generationTimeout
{
  return self->_generationTimeout;
}

- (void)setGenerationTimeout:(double)a3
{
  self->_generationTimeout = a3;
}

- (void)setNextGeneration:(id)a3
{
}

- (BOOL)isAdvancing
{
  return self->_advancing;
}

- (void)setAdvancing:(BOOL)a3
{
  self->_advancing = a3;
}

- (ICDistributedLock)nextGenerationLock
{
  return self->_nextGenerationLock;
}

- (void)setNextGenerationLock:(id)a3
{
}

- (void)beginGeneration
{
  id v1 = [a1 containerURL];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create assets container directory {url: %@}", v4, v5, v6, v7, v8);
}

- (void)commitGeneration
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = [v1 object];
  [v2 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() containerURL];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Attempting to commit generation before beginning one {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);
}

- (void)rollbackGeneration
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = [v1 object];
  [v2 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() containerURL];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Attempting to roll back generation before beginning one {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);
}

- (void)managedObjectContextDidSaveObjectIDs:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = [v1 object];
  [v2 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() containerURL];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Context was saved while advancing asset generation — rolling back {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);
}

@end