@interface PLInitialSuggestionsStorageManager
+ (BOOL)_deleteInitialSuggestionsAtFilePath:(id)a3 error:(id *)a4;
+ (BOOL)deleteInitialSuggestionsForPathManager:(id)a3 error:(id *)a4;
+ (BOOL)deleteInitialSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4;
+ (BOOL)saveInitialSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (id)_initialSuggestionsFilePathForPhotoLibrary:(id)a3;
+ (id)initialSearchSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4;
@end

@implementation PLInitialSuggestionsStorageManager

+ (id)_initialSuggestionsFilePathForPhotoLibrary:(id)a3
{
  v3 = [a3 pathManager];
  v4 = [v3 searchInitialSearchSuggestionsFilePath];

  return v4;
}

+ (id)initialSearchSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLInitialSuggestionsStorageManager.m", 21, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v8 = [a1 _initialSuggestionsFilePathForPhotoLibrary:v7];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    id v27 = 0;
    v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v8 options:0 error:&v27];
    id v12 = v27;
    v13 = v12;
    if (v11)
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
      id v26 = v13;
      v19 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v18 fromData:v11 error:&v26];
      id v20 = v26;

      if (!v19)
      {
        v21 = PLSearchBackendInitialSuggestionsGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v7;
          __int16 v30 = 2112;
          id v31 = v20;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to unarchive search suggestions for photoLibrary: %@, error: %@", buf, 0x16u);
        }
      }
      if (!a4) {
        goto LABEL_11;
      }
    }
    else
    {
      v19 = 0;
      id v20 = v12;
      if (!a4) {
        goto LABEL_11;
      }
    }
    *a4 = v20;
LABEL_11:
    v22 = (void *)MEMORY[0x1E4F1CBF0];
    if (v19) {
      v22 = v19;
    }
    id v23 = v22;
    goto LABEL_17;
  }
  v11 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v8;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "No initial suggestions found at path: \"%@\".", buf, 0xCu);
  }
  id v20 = 0;
  v19 = 0;
  id v23 = (id)MEMORY[0x1E4F1CBF0];
LABEL_17:

  return v23;
}

+ (BOOL)_deleteInitialSuggestionsAtFilePath:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = 0;
    char v9 = [v8 removeItemAtPath:v5 error:&v18];
    char v10 = v18;

    v11 = PLSearchBackendInitialSuggestionsGetLog();
    id v12 = v11;
    if (v9)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412546;
      id v20 = v5;
      __int16 v21 = 2112;
      v22 = v10;
      v13 = "Failed to delete initial suggestions at path: \"%@\" with error: %@.";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 22;
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      v13 = "Successfully deleted initial suggestions at path: \"%@\".";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 12;
    }
    _os_log_impl(&dword_19B3C7000, v14, v15, v13, buf, v16);
LABEL_11:

    if (a4)
    {
      char v10 = v10;
      *a4 = v10;
    }
    goto LABEL_13;
  }
  char v10 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "No initial suggestions found at path: \"%@\", nothing to delete.", buf, 0xCu);
  }
  char v9 = 1;
LABEL_13:

  return v9;
}

+ (BOOL)deleteInitialSuggestionsForPathManager:(id)a3 error:(id *)a4
{
  v6 = [a3 searchInitialSearchSuggestionsFilePath];
  LOBYTE(a4) = [a1 _deleteInitialSuggestionsAtFilePath:v6 error:a4];

  return (char)a4;
}

+ (BOOL)deleteInitialSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  v6 = [a1 _initialSuggestionsFilePathForPhotoLibrary:a3];
  LOBYTE(a4) = [a1 _deleteInitialSuggestionsAtFilePath:v6 error:a4];

  return (char)a4;
}

+ (BOOL)saveInitialSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = [a1 _initialSuggestionsFilePathForPhotoLibrary:v9];
  id v22 = 0;
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v22];
  id v12 = v22;
  v13 = v12;
  if (v11)
  {
    id v21 = v12;
    int v14 = [v11 writeToFile:v10 options:1073741825 error:&v21];
    id v15 = v21;

    if (v14)
    {
      uint32_t v16 = PLSearchBackendInitialSuggestionsGetLog();
      BOOL v17 = 1;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v8 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Successfully saved %tu initial suggestions for photoLibrary: %@", buf, 0x16u);
      }
      goto LABEL_9;
    }
  }
  else
  {
    id v15 = v12;
  }
  uint32_t v16 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = [v8 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v19;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v15;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Error saving %tu initial suggestions for photoLibrary: %@, %@", buf, 0x20u);
  }
  BOOL v17 = 0;
LABEL_9:

  if (a5) {
    *a5 = v15;
  }

  return v17;
}

@end