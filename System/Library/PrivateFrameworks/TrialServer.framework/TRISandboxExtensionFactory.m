@interface TRISandboxExtensionFactory
+ (id)extensionTokenForPath:(id)a3 extensionClass:(unsigned __int8)a4;
@end

@implementation TRISandboxExtensionFactory

+ (id)extensionTokenForPath:(id)a3 extensionClass:(unsigned __int8)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 fileSystemRepresentation];
  uint64_t v5 = sandbox_extension_issue_file();
  if (!v5)
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      int v14 = *__error();
      int v16 = 138543874;
      uint64_t v17 = (uint64_t)v4;
      __int16 v18 = 2080;
      v19 = v13;
      __int16 v20 = 1024;
      int v21 = v14;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "failed to issue extension for \"%{public}@\" err %s errno %d", (uint8_t *)&v16, 0x1Cu);
    }
    goto LABEL_11;
  }
  v6 = (void *)v5;
  v7 = (void *)[[NSString alloc] initWithCString:v5 encoding:4];
  free(v6);
  v8 = TRILogCategory_Server();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "failed to construct sandbox extension with raw token", (uint8_t *)&v16, 2u);
    }

    v10 = 0;
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = [v4 fileSystemRepresentation];
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "issuing extension to com.apple.trial.TrialArchivingService for %s", (uint8_t *)&v16, 0xCu);
  }

  v10 = v7;
  v11 = v10;
LABEL_12:

  return v11;
}

@end