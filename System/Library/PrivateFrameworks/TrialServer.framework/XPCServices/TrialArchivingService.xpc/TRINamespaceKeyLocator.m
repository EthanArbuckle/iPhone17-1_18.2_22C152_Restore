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
  id v6 = a3;
  v7 = [a1 keyFileURLForNamespace:v6 asymmetric:v4];
  if (v7)
  {
    id v14 = 0;
    v8 = +[NSData dataWithContentsOfURL:v7 options:2 error:&v14];
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
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to read key data from file %@ -- %@", buf, 0x16u);
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
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Couldn't find key for namespace %@", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)keyFileURLForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = [a1 _keyFileSearchLocationsForNamespace:a3 asymmetric:a4];
  v5 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Searching for namespace key in the following locations: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:v10];
          goto LABEL_13;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
  id v6 = a3;
  id v7 = +[TRIStandardPaths sharedSystemPaths];
  uint64_t v8 = [v7 decryptionKeyDirForAppleInternal:1];

  v9 = +[TRIStandardPaths sharedSystemPaths];
  id v10 = [v9 decryptionKeyDirForAppleInternal:0];

  v11 = [a1 _fileNameForNamespaceIdentifier:v6 asymmetric:v4];
  long long v12 = [a1 _namespaceIdForNamespace:v6];

  if (v12)
  {
    long long v13 = [v12 stringValue];
    long long v14 = [a1 _fileNameForNamespaceIdentifier:v13 asymmetric:v4];

    long long v15 = [v8 stringByAppendingPathComponent:v11];
    v22[0] = v15;
    id v16 = [v8 stringByAppendingPathComponent:v14];
    v22[1] = v16;
    __int16 v17 = [v10 stringByAppendingPathComponent:v11];
    v22[2] = v17;
    v18 = [v10 stringByAppendingPathComponent:v14];
    v22[3] = v18;
    v19 = +[NSArray arrayWithObjects:v22 count:4];
  }
  else
  {
    long long v14 = [v8 stringByAppendingPathComponent:v11];
    v21[0] = v14;
    long long v15 = [v10 stringByAppendingPathComponent:v11];
    v21[1] = v15;
    v19 = +[NSArray arrayWithObjects:v21 count:2];
  }

  return v19;
}

+ (id)_fileNameForNamespaceIdentifier:(id)a3 asymmetric:(BOOL)a4
{
  CFStringRef v4 = @"com.apple.trial.%@.namespacekey";
  if (a4) {
    CFStringRef v4 = @"com.apple.trial.%@.namespacekey.priv";
  }
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, a3);
  return v5;
}

+ (id)_namespaceIdForNamespace:(id)a3
{
  id v3 = a3;
  unsigned int v9 = -1;
  CFStringRef v4 = TRINamespace_NamespaceId_EnumDescriptor();
  unsigned __int8 v5 = [v4 getValue:&v9 forEnumTextFormatName:v3];

  if (v5)
  {
    id v6 = +[NSNumber numberWithInt:v9];
  }
  else
  {
    id v7 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to find namespace id for namespace name: %@", buf, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

@end