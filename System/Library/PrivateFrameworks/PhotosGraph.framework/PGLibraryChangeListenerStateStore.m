@interface PGLibraryChangeListenerStateStore
- (PGLibraryChangeListenerStateStore)initWithPhotoLibrary:(id)a3;
- (PHPersistentChangeToken)changeToken;
- (void)setChangeToken:(id)a3;
@end

@implementation PGLibraryChangeListenerStateStore

- (void).cxx_destruct
{
}

- (PHPersistentChangeToken)changeToken
{
  if (self->_changeTokenURL)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:");
    if (v2)
    {
      v3 = [MEMORY[0x1E4F8A8D0] secureUnarchivedObjectWithData:v2 ofClass:objc_opt_class()];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  return (PHPersistentChangeToken *)v3;
}

- (void)setChangeToken:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (NSURL *)a3;
  if (v4)
  {
    id v17 = 0;
    v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v17];
    id v6 = v17;
    v7 = v6;
    if (v5)
    {
      changeTokenURL = self->_changeTokenURL;
      id v16 = v6;
      char v9 = [v5 writeToURL:changeTokenURL options:1 error:&v16];
      id v10 = v16;

      if (v9)
      {
LABEL_11:

        goto LABEL_12;
      }
      v11 = +[PGLogging sharedLogging];
      v12 = [v11 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = self->_changeTokenURL;
        *(_DWORD *)buf = 138412546;
        v19 = v13;
        __int16 v20 = 2112;
        id v21 = v10;
        _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Writing change token to file (%@) failed with error: %@", buf, 0x16u);
      }
    }
    else
    {
      v15 = +[PGLogging sharedLogging];
      v12 = [v15 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Archiving change token (%@) failed with error: %@", buf, 0x16u);
      }
      id v10 = v7;
    }

    goto LABEL_11;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [v14 removeItemAtURL:self->_changeTokenURL error:0];

LABEL_12:
}

- (PGLibraryChangeListenerStateStore)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGLibraryChangeListenerStateStore;
  v5 = [(PGLibraryChangeListenerStateStore *)&v10 init];
  if (v5)
  {
    id v6 = objc_msgSend(v4, "pg_urlForGraphApplicationData");
    uint64_t v7 = [v6 URLByAppendingPathComponent:@"changetoken.plist"];
    changeTokenURL = v5->_changeTokenURL;
    v5->_changeTokenURL = (NSURL *)v7;
  }
  return v5;
}

@end