@interface FCPersistentDictionary
- (BOOL)writeWithAccessor:(id)a3;
- (FCPersistentDictionary)init;
- (FCPersistentDictionary)initWithFileURL:(id)a3 allowedClasses:(id)a4;
- (NSSet)allowedClasses;
- (NSURL)fileURL;
- (id)read;
@end

@implementation FCPersistentDictionary

- (id)read
{
  v3 = [(FCPersistentDictionary *)self fileURL];
  v4 = [(FCPersistentDictionary *)self allowedClasses];
  v5 = FCReadDictionary(v3, v4);

  return v5;
}

- (BOOL)writeWithAccessor:(id)a3
{
  id v4 = a3;
  v5 = [(FCPersistentDictionary *)self fileURL];
  v6 = [(FCPersistentDictionary *)self allowedClasses];
  v7 = [(FCPersistentDictionary *)self fileURL];
  char v8 = FCReadWriteDictionaryWithAccessor(v5, v6, v7, 0, v4);

  return v8;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (FCPersistentDictionary)initWithFileURL:(id)a3 allowedClasses:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPersistentDictionary initWithFileURL:allowedClasses:]";
    __int16 v21 = 2080;
    v22 = "FCFileCoordinatedDictionary.m";
    __int16 v23 = 1024;
    int v24 = 135;
    __int16 v25 = 2114;
    v26 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "allowedClasses");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPersistentDictionary initWithFileURL:allowedClasses:]";
    __int16 v21 = 2080;
    v22 = "FCFileCoordinatedDictionary.m";
    __int16 v23 = 1024;
    int v24 = 136;
    __int16 v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)FCPersistentDictionary;
  char v8 = [(FCPersistentDictionary *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    fileURL = v8->_fileURL;
    v8->_fileURL = (NSURL *)v9;

    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v12 = [v7 setByAddingObjectsFromArray:v11];
    allowedClasses = v8->_allowedClasses;
    v8->_allowedClasses = (NSSet *)v12;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (FCPersistentDictionary)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    char v8 = "-[FCPersistentDictionary init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedDictionary.m";
    __int16 v11 = 1024;
    int v12 = 130;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersistentDictionary init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

@end