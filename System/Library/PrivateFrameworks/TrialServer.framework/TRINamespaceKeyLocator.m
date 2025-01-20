@interface TRINamespaceKeyLocator
+ (id)_fileNameForNamespaceIdentifier:(id)a3 asymmetric:(BOOL)a4;
+ (id)_keyFileSearchLocationsForNamespace:(id)a3 asymmetric:(BOOL)a4;
+ (id)_namespaceIdForNamespace:(id)a3;
+ (id)keyDataForNamespace:(id)a3 asymmetric:(BOOL)a4;
+ (id)keyFileURLForNamespace:(id)a3 asymmetric:(BOOL)a4;
@end

@implementation TRINamespaceKeyLocator

+ (id)keyDataForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 keyFileURLForNamespace:v6 asymmetric:v4];
  if (v7)
  {
    id v14 = 0;
    v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:2 error:&v14];
    v9 = v14;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v11 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = [v7 path];
        *(_DWORD *)buf = 138412546;
        id v16 = v13;
        __int16 v17 = 2112;
        v18 = v9;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Failed to read key data from file %@ -- %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v9 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't find key for namespace %@", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)keyFileURLForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a1 _keyFileSearchLocationsForNamespace:a3 asymmetric:a4];
  v5 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Searching for namespace key in the following locations: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        if (!access((const char *)objc_msgSend(v10, "fileSystemRepresentation", (void)v12), 4))
        {
          v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v10];
          goto LABEL_13;
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

+ (id)_keyFileSearchLocationsForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = a4;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4FB0240];
  id v7 = a3;
  uint64_t v8 = [v6 sharedSystemPaths];
  v9 = [v8 decryptionKeyDirForAppleInternal:1];

  id v10 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  v11 = [v10 decryptionKeyDirForAppleInternal:0];

  long long v12 = [a1 _fileNameForNamespaceIdentifier:v7 asymmetric:v4];
  long long v13 = [a1 _namespaceIdForNamespace:v7];

  if (v13)
  {
    long long v14 = [v13 stringValue];
    long long v15 = [a1 _fileNameForNamespaceIdentifier:v14 asymmetric:v4];

    id v16 = [v9 stringByAppendingPathComponent:v12];
    v23[0] = v16;
    __int16 v17 = [v9 stringByAppendingPathComponent:v15];
    v23[1] = v17;
    v18 = [v11 stringByAppendingPathComponent:v12];
    v23[2] = v18;
    uint64_t v19 = [v11 stringByAppendingPathComponent:v15];
    v23[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  }
  else
  {
    long long v15 = [v9 stringByAppendingPathComponent:v12];
    v22[0] = v15;
    id v16 = [v11 stringByAppendingPathComponent:v12];
    v22[1] = v16;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  }

  return v20;
}

+ (id)_fileNameForNamespaceIdentifier:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = @"com.apple.trial.%@.namespacekey";
  if (a4) {
    BOOL v4 = @"com.apple.trial.%@.namespacekey.priv";
  }
  v5 = objc_msgSend(NSString, "stringWithFormat:", v4, a3);
  return v5;
}

+ (id)_namespaceIdForNamespace:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unsigned int v9 = -1;
  BOOL v4 = TRINamespace_NamespaceId_EnumDescriptor();
  char v5 = [v4 getValue:&v9 forEnumTextFormatName:v3];

  if (v5)
  {
    id v6 = [NSNumber numberWithInt:v9];
  }
  else
  {
    id v7 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Unable to find namespace id for namespace name: %@", buf, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

@end