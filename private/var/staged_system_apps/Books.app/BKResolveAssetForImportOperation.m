@interface BKResolveAssetForImportOperation
- (BKResolveAssetForImportOperation)initWithURL:(id)a3;
- (BOOL)failed;
- (NSURL)inboxURL;
- (NSURL)originalURL;
- (NSURL)resultURL;
- (void)cleanup;
- (void)main;
- (void)setInboxURL:(id)a3;
- (void)setResultURL:(id)a3;
@end

@implementation BKResolveAssetForImportOperation

- (BKResolveAssetForImportOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKResolveAssetForImportOperation;
  v6 = [(BKResolveAssetForImportOperation *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalURL, a3);
    v8 = +[NSFileManager defaultManager];
    v9 = [v8 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];
    uint64_t v10 = [v9 URLByAppendingPathComponent:@"Inbox"];
    inboxURL = v7->_inboxURL;
    v7->_inboxURL = (NSURL *)v10;

    v12 = v7->_inboxURL;
    id v17 = 0;
    unsigned __int8 v13 = [v8 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v14 = v17;
    if ((v13 & 1) == 0)
    {
      v15 = BKLibraryBookImportLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1007ED8B0();
      }
    }
  }

  return v7;
}

- (void)cleanup
{
  v3 = [(BKResolveAssetForImportOperation *)self resultURL];

  if (v3)
  {
    v4 = +[NSFileManager defaultManager];
    uint64_t v11 = 2;
    id v5 = [(BKResolveAssetForImportOperation *)self inboxURL];
    v6 = [(BKResolveAssetForImportOperation *)self resultURL];
    [v4 getRelationship:&v11 ofDirectoryAtURL:v5 toItemAtURL:v6 error:0];

    if (!v11)
    {
      v7 = [(BKResolveAssetForImportOperation *)self resultURL];
      id v10 = 0;
      [v4 removeItemAtURL:v7 error:&v10];
      id v8 = v10;

      if (v8)
      {
        v9 = BKLibraryBookImportLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1007ED918();
        }
      }
    }
  }
}

- (void)main
{
  v3 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(BKResolveAssetForImportOperation *)self originalURL];
    *(_DWORD *)buf = 141558274;
    uint64_t v37 = 1752392040;
    __int16 v38 = 2112;
    v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: start main: url: %{mask.hash}@", buf, 0x16u);
  }
  id v5 = +[NSFileManager defaultManager];
  v6 = [(BKResolveAssetForImportOperation *)self originalURL];
  unsigned int v7 = [v6 startAccessingSecurityScopedResource];

  if ((v7 & 1) == 0)
  {
    id v8 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007EDB20(self, v8);
    }
  }
  v9 = [(BKResolveAssetForImportOperation *)self originalURL];
  id v10 = [v9 ui_downloadOperationForActivity:0];

  [v10 start];
  if ([v10 isCancelled])
  {
    uint64_t v11 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: User cancelled import of cloud asset.", buf, 2u);
    }
    goto LABEL_37;
  }
  uint64_t v35 = 2;
  v12 = [(BKResolveAssetForImportOperation *)self originalURL];
  id v34 = 0;
  unsigned __int8 v13 = [v5 getRelationship:&v35 ofDirectory:9 inDomain:1 toItemAtURL:v12 error:&v34];
  uint64_t v11 = v34;

  if ((v13 & 1) == 0)
  {
    v16 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1007EDAB8();
    }
    goto LABEL_34;
  }
  if (v35 != 2)
  {
    if (v35) {
      goto LABEL_35;
    }
    id v14 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(BKResolveAssetForImportOperation *)self originalURL];
      *(_DWORD *)buf = 141558274;
      uint64_t v37 = 1752392040;
      __int16 v38 = 2112;
      v39 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: File is in container. url: %{mask.hash}@", buf, 0x16u);
    }
    v16 = [(BKResolveAssetForImportOperation *)self originalURL];
    goto LABEL_21;
  }
  id v17 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: Copying to Inbox.", buf, 2u);
  }

  objc_super v18 = [(BKResolveAssetForImportOperation *)self inboxURL];
  v19 = [(BKResolveAssetForImportOperation *)self originalURL];
  v20 = [v19 lastPathComponent];
  v16 = [v18 URLByAppendingPathComponent:v20];

  v21 = [(BKResolveAssetForImportOperation *)self originalURL];
  id v33 = 0;
  LODWORD(v19) = [v5 copyItemAtURL:v21 toURL:v16 error:&v33];
  uint64_t v11 = v33;

  if (!v19)
  {
    v22 = [v11 domain];
    if ([v22 isEqualToString:NSCocoaErrorDomain])
    {
      id v23 = [v11 code];

      if (v23 == (id)516)
      {
        v24 = BKLibraryBookImportLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558274;
          uint64_t v37 = 1752392040;
          __int16 v38 = 2112;
          v39 = v16;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "BKResolveAssetForImportOperation: Removing exising file from Inbox. url: %{mask.hash}@", buf, 0x16u);
        }

        id v32 = 0;
        unsigned int v25 = [v5 removeItemAtURL:v16 error:&v32];
        v26 = v32;
        uint64_t v11 = v26;
        if (v25)
        {

          v27 = [(BKResolveAssetForImportOperation *)self originalURL];
          id v31 = 0;
          unsigned int v28 = [v5 copyItemAtURL:v27 toURL:v16 error:&v31];
          uint64_t v11 = v31;

          if (v28) {
            goto LABEL_21;
          }
          v29 = BKLibraryBookImportLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_1007ED980();
          }
        }
        else
        {
          v29 = BKLibraryBookImportLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_1007ED9E8();
          }
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
    }
    v29 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1007EDA50();
    }
    goto LABEL_33;
  }
LABEL_21:
  [(BKResolveAssetForImportOperation *)self setResultURL:v16];
LABEL_34:

LABEL_35:
  if (v7)
  {
    v30 = [(BKResolveAssetForImportOperation *)self originalURL];
    [v30 stopAccessingSecurityScopedResource];
  }
LABEL_37:
}

- (BOOL)failed
{
  v2 = [(BKResolveAssetForImportOperation *)self resultURL];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)resultURL
{
  return self->_resultURL;
}

- (void)setResultURL:(id)a3
{
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxURL, 0);
  objc_storeStrong((id *)&self->_resultURL, 0);

  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end