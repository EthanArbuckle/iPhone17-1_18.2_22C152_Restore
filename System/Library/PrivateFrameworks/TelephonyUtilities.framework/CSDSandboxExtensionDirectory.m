@interface CSDSandboxExtensionDirectory
- (BOOL)removeLinksForFilenamesNotInArray:(id)a3 error:(id *)a4;
- (CSDSandboxExtensionDirectory)init;
- (CSDSandboxExtensionDirectory)initWithName:(id)a3 error:(id *)a4;
- (CSDSandboxExtensionDirectory)initWithName:(id)a3 fileManager:(id)a4 error:(id *)a5;
- (NSFileManager)fileManager;
- (NSString)name;
- (NSURL)URL;
- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4 error:(id *)a5;
- (id)urlForFilename:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation CSDSandboxExtensionDirectory

- (CSDSandboxExtensionDirectory)initWithName:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSDSandboxExtensionDirectory;
  v10 = [(CSDSandboxExtensionDirectory *)&v20 init];
  if (v10)
  {
    p_isa = (id *)&v10->super.isa;
    p_fileManager = (id *)&v10->_fileManager;
    objc_storeStrong((id *)&v10->_fileManager, a4);
    v13 = [p_isa[2] URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:a5];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 URLByAppendingPathComponent:@"CallServices" isDirectory:1];
      v16 = [v15 URLByAppendingPathComponent:v8 isDirectory:1];
      v17 = [v16 URLByStandardizingPath];

      if (v17
        && [*p_fileManager createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:a5])
      {
        objc_storeStrong(p_isa + 1, v17);
      }
      else
      {

        p_isa = 0;
      }
      v18 = (CSDSandboxExtensionDirectory *)p_isa;

      p_isa = (id *)v15;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (CSDSandboxExtensionDirectory)initWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSFileManager defaultManager];
  id v8 = [(CSDSandboxExtensionDirectory *)self initWithName:v6 fileManager:v7 error:a4];

  return v8;
}

- (CSDSandboxExtensionDirectory)init
{
  v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CSDSandboxExtensionDirectory.m", 56, @"%s is not available. Use a designated initializer instead.", "-[CSDSandboxExtensionDirectory init]");

  return 0;
}

- (NSString)name
{
  v2 = [(CSDSandboxExtensionDirectory *)self URL];
  v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(CSDSandboxExtensionDirectory *)self urlForFilename:a3];
  v10 = [(CSDSandboxExtensionDirectory *)self fileManager];
  v11 = [v9 path];
  unsigned int v12 = [v10 fileExistsAtPath:v11];

  if (!v12) {
    goto LABEL_8;
  }
  id v27 = 0;
  unsigned int v13 = [v8 getResourceValue:&v27 forKey:NSURLFileResourceIdentifierKey error:0];
  id v14 = v27;
  id v15 = 0;
  if (v13
    && (id v26 = 0,
        v16 = [v9 getResourceValue:&v26 forKey:NSURLFileResourceIdentifierKey error:0], id v15 = v26, v16))
  {
    unsigned __int8 v17 = [v14 isEqual:v15];

    if (v17) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v18 = [(CSDSandboxExtensionDirectory *)self fileManager];
  unsigned int v19 = [v18 removeItemAtURL:v9 error:a5];

  if (!v19)
  {
    unsigned int v21 = 0;
    if (!a5) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_8:
    objc_super v20 = [(CSDSandboxExtensionDirectory *)self fileManager];
    unsigned int v21 = [v20 copyItemAtURL:v8 toURL:v9 error:a5];

    if (!a5) {
      goto LABEL_13;
    }
  }
  if ((v21 & 1) == 0 && !*a5)
  {
    id v23 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    v22 = 0;
    *a5 = v23;
    goto LABEL_17;
  }
LABEL_13:
  if (!v21)
  {
    v22 = 0;
    goto LABEL_17;
  }
LABEL_14:
  v22 = v9;
LABEL_17:
  id v24 = v22;

  return v24;
}

- (BOOL)removeLinksForFilenamesNotInArray:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        unsigned int v13 = [(CSDSandboxExtensionDirectory *)self urlForFilename:v12];
        if (v13)
        {
          [v6 addObject:v13];
        }
        else
        {
          id v14 = sub_100008DCC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to get URL for filename '%@'", buf, 0xCu);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v9);
  }
  v38 = v7;

  id v15 = [(CSDSandboxExtensionDirectory *)self fileManager];
  unsigned int v16 = [(CSDSandboxExtensionDirectory *)self URL];
  unsigned __int8 v17 = [v15 contentsOfDirectoryAtURL:v16 includingPropertiesForKeys:&__NSArray0__struct options:0 error:a4];

  v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v45;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        v25 = objc_msgSend(v24, "URLByStandardizingPath", v38);
        if (v25)
        {
          [v18 addObject:v25];
        }
        else
        {
          id v26 = sub_100008DCC();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v24;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to get standardized URL for URL '%@'", buf, 0xCu);
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v21);
  }

  id v27 = +[NSMutableSet setWithArray:v18];
  v28 = +[NSSet setWithArray:v6];
  [v27 minusSet:v28];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v29 = v27;
  id v30 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v41;
LABEL_27:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v41 != v32) {
        objc_enumerationMutation(v29);
      }
      uint64_t v34 = *(void *)(*((void *)&v40 + 1) + 8 * v33);
      v35 = [(CSDSandboxExtensionDirectory *)self fileManager];
      unsigned int v36 = [v35 removeItemAtURL:v34 error:a4];

      if (!v36) {
        break;
      }
      if (v31 == (id)++v33)
      {
        id v31 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v31) {
          goto LABEL_27;
        }
        goto LABEL_33;
      }
    }
  }
  else
  {
LABEL_33:
    LOBYTE(v36) = 1;
  }

  return v36;
}

- (id)urlForFilename:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDSandboxExtensionDirectory *)self URL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  id v7 = [v6 URLByStandardizingPath];

  return v7;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end