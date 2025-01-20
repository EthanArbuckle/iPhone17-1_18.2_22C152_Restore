@interface TYATypologyAccessSession
+ (id)_safeFilenameWithName:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (NSDirectoryEnumerator)directoryEnumerator;
- (TITypologyPreferences)typologyPreferences;
- (TYATypologyAccessSession)initWithAuditToken:(id *)a3;
- (id)_issueSandboxExtensionForURL:(id)a3;
- (unint64_t)accessMode;
- (void)_initializeEnumerator;
- (void)nextTypologyURL:(id)a3;
- (void)removeTypologyFileWithName:(id)a3 completion:(id)a4;
- (void)setAccessMode:(unint64_t)a3;
- (void)setAuditToken:(id *)a3;
- (void)setDirectoryEnumerator:(id)a3;
- (void)setTypologyAccessMode:(unint64_t)a3;
- (void)setTypologyPreferences:(id)a3;
- (void)startEnumeration;
- (void)writeData:(id)a3 toTypologyFileWithName:(id)a4 completion:(id)a5;
@end

@implementation TYATypologyAccessSession

- (TYATypologyAccessSession)initWithAuditToken:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TYATypologyAccessSession;
  v4 = [(TYATypologyAccessSession *)&v8 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v4->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v4->_auditToken.val[4] = v6;
    [(TYATypologyAccessSession *)v4 setAccessMode:0];
  }
  return v5;
}

- (void)setAccessMode:(unint64_t)a3
{
  if (self->_accessMode != a3)
  {
    self->_accessMode = a3;
    if (a3 == 2)
    {
      v4 = TITypologyProfilePreferences;
    }
    else if (a3 == 1)
    {
      v4 = TITypologyInternalPreferences;
    }
    else
    {
      if (a3) {
        return;
      }
      v4 = (__objc2_class *)TITypologyPreferences;
    }
    self->_typologyPreferences = (TITypologyPreferences *)objc_alloc_init(v4);
    _objc_release_x1();
  }
}

- (void)_initializeEnumerator
{
  directoryEnumerator = self->_directoryEnumerator;
  self->_directoryEnumerator = 0;

  v4 = [(TYATypologyAccessSession *)self typologyPreferences];
  unsigned int v5 = [v4 typologyLoggingEnabledByProfile];

  if (v5)
  {
    long long v6 = [(TYATypologyAccessSession *)self typologyPreferences];
    v7 = [v6 typologyDirectoryURL];

    v12[0] = NSURLNameKey;
    v12[1] = NSURLIsDirectoryKey;
    objc_super v8 = +[NSArray arrayWithObjects:v12 count:2];
    id v9 = [&stru_10001C740 copy];
    v10 = +[NSFileManager defaultManager];
    v11 = [v10 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:5 errorHandler:v9];
    [(TYATypologyAccessSession *)self setDirectoryEnumerator:v11];
  }
  else
  {
    v7 = TYALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100010834(v7);
    }
  }
}

- (id)_issueSandboxExtensionForURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 path];
  [v5 fileSystemRepresentation];
  [(TYATypologyAccessSession *)self auditToken];
  uint64_t v6 = sandbox_extension_issue_file_to_process();
  if (!v6)
  {
    v14 = TYALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100010924(v4, v14);
    }

    goto LABEL_12;
  }
  v7 = (char *)v6;
  id v8 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v7 length:strlen(v7) encoding:4 freeWhenDone:1];
  id v9 = TYALog();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000109C0(v10);
    }

    free(v7);
LABEL_12:
    id v8 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = [v8 UTF8String];
    id v12 = [v4 lastPathComponent];
    id v13 = [v12 UTF8String];
    *(_DWORD *)buf = 136380931;
    id v17 = v11;
    __int16 v18 = 2081;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Issued sandbox extension (%{private}s) for typology url with name %{private}s", buf, 0x16u);
  }
LABEL_13:

  return v8;
}

- (void)startEnumeration
{
  v3 = TYALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Start enumeration.", v4, 2u);
  }

  [(TYATypologyAccessSession *)self _initializeEnumerator];
}

+ (id)_safeFilenameWithName:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastPathComponent];
  unsigned int v5 = v4;
  if (v4
    && [v4 length]
    && ([v5 isEqualToString:@"/"] & 1) == 0
    && ([v5 isEqualToString:@"~"] & 1) == 0
    && ([v5 isEqualToString:@"."] & 1) == 0
    && ([v5 isEqualToString:@".."] & 1) == 0)
  {
    if ([v5 isEqualToString:v3])
    {
LABEL_8:
      id v6 = v5;
      goto LABEL_15;
    }
    v7 = [v3 pathComponents];
    if ([v7 count] == (id)2
      && ([v7 firstObject],
          id v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v8 isEqualToString:@"."],
          v8,
          v9))
    {
      v10 = [v7 lastObject];
      unsigned int v11 = [v10 isEqualToString:v5];

      if (v11) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v6 = 0;
LABEL_15:

  return v6;
}

- (void)nextTypologyURL:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  unsigned int v5 = 0;
  while (1)
  {
    id v6 = v5;
    v7 = [(TYATypologyAccessSession *)self directoryEnumerator];
    unsigned int v5 = [v7 nextObject];

    if (!v5) {
      break;
    }
    if (_isTypologyURL(v5))
    {
      id v8 = [(TYATypologyAccessSession *)self typologyPreferences];
      unsigned int v9 = [v8 isTypologyInDatavault];

      if (v9)
      {
        v10 = [(TYATypologyAccessSession *)self _issueSandboxExtensionForURL:v5];
      }
      else
      {
        v10 = 0;
      }
      id v12 = TYALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v5 lastPathComponent];
        int v14 = 136380931;
        id v15 = [v13 UTF8String];
        __int16 v16 = 2081;
        id v17 = [v10 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "-nextTypologyURL: -> (%{private}s, %{private}s)", (uint8_t *)&v14, 0x16u);
      }
      v4[2](v4, v5, v10);

      goto LABEL_13;
    }
  }
  unsigned int v11 = TYALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "-nextTypologyURL: -> ((null), (null))", (uint8_t *)&v14, 2u);
  }

  v4[2](v4, 0, 0);
LABEL_13:
}

- (void)removeTypologyFileWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  id v8 = TYALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removing typology file with name: %{private}@", buf, 0xCu);
  }

  unsigned int v9 = [(id)objc_opt_class() _safeFilenameWithName:v6];
  if (v9)
  {
    v10 = [(TYATypologyAccessSession *)self typologyPreferences];
    unsigned int v11 = [v10 typologyDirectoryURL];
    id v12 = [v11 URLByAppendingPathComponent:v9 isDirectory:0];

    id v13 = +[NSFileManager defaultManager];
    id v18 = 0;
    id v14 = [v13 removeItemAtURL:v12 error:&v18];
    id v15 = v18;

    if ((v14 & 1) == 0)
    {
      __int16 v16 = TYALog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100010A6C();
      }
    }
  }
  else
  {
    id v17 = TYALog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100010A04();
    }

    id v15 = +[NSError errorWithDomain:NSCocoaErrorDomain code:514 userInfo:0];
    id v14 = 0;
  }
  v7[2](v7, v14, v15);
}

- (void)setTypologyAccessMode:(unint64_t)a3
{
  unsigned int v5 = TYALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Set typology access mode %lu.", (uint8_t *)&v6, 0xCu);
  }

  [(TYATypologyAccessSession *)self setAccessMode:a3];
}

- (void)writeData:(id)a3 toTypologyFileWithName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, BOOL, id))a5;
  if (TI_IS_INTERNAL_INSTALL())
  {
    unsigned int v11 = [(id)objc_opt_class() _safeFilenameWithName:v9];
    if (!v11)
    {
      v25 = TYALog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100010A04();
      }

      id v22 = +[NSError errorWithDomain:NSCocoaErrorDomain code:514 userInfo:0];
      int v23 = 0;
      goto LABEL_17;
    }
    id v12 = [(TYATypologyAccessSession *)self typologyPreferences];
    id v13 = [v12 typologyDirectoryURL];
    id v14 = [v13 URLByAppendingPathComponent:v11];

    id v15 = TYALog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Write data to typology file at url: %{private}@", buf, 0xCu);
    }

    __int16 v16 = +[NSFileManager defaultManager];
    id v17 = [(TYATypologyAccessSession *)self typologyPreferences];
    id v18 = [v17 typologyDirectoryURL];
    id v28 = 0;
    unsigned int v19 = [v16 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v28];
    id v20 = v28;

    if (v19)
    {
      id v27 = v20;
      unsigned __int8 v21 = [v8 writeToURL:v14 options:2 error:&v27];
      id v22 = v27;

      if (v21)
      {
        int v23 = 1;
LABEL_16:

LABEL_17:
        BOOL v24 = v23 != 0;
        goto LABEL_18;
      }
    }
    else
    {
      id v22 = v20;
    }
    v26 = TYALog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100010AD4();
    }

    int v23 = 0;
    goto LABEL_16;
  }
  id v22 = 0;
  BOOL v24 = 0;
LABEL_18:
  v10[2](v10, v24, v22);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (TITypologyPreferences)typologyPreferences
{
  return self->_typologyPreferences;
}

- (void)setTypologyPreferences:(id)a3
{
}

- (NSDirectoryEnumerator)directoryEnumerator
{
  return self->_directoryEnumerator;
}

- (void)setDirectoryEnumerator:(id)a3
{
}

- (unint64_t)accessMode
{
  return self->_accessMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryEnumerator, 0);
  objc_storeStrong((id *)&self->_typologyPreferences, 0);
}

@end