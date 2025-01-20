@interface MFDiagnosticExtension
+ (OS_os_log)log;
- (EMDaemonInterface)daemonInterface;
- (id)_attachmentForURL:(id)a3;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)requestDiagnostics:(id)a3 isSensitiveCollectionAllowed:(BOOL)a4;
- (void)dealloc;
- (void)setDaemonInterface:(id)a3;
@end

@implementation MFDiagnosticExtension

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002760;
  block[3] = &unk_100004170;
  block[4] = a1;
  if (qword_100008670 != -1) {
    dispatch_once(&qword_100008670, block);
  }
  v2 = (void *)qword_100008668;

  return (OS_os_log *)v2;
}

- (void)dealloc
{
  [(MFDiagnosticExtension *)self setDaemonInterface:0];
  v3.receiver = self;
  v3.super_class = (Class)MFDiagnosticExtension;
  [(MFDiagnosticExtension *)&v3 dealloc];
}

- (EMDaemonInterface)daemonInterface
{
  daemonInterface = self->_daemonInterface;
  if (!daemonInterface)
  {
    v4 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    v5 = self->_daemonInterface;
    self->_daemonInterface = v4;

    daemonInterface = self->_daemonInterface;
  }

  return daemonInterface;
}

- (id)requestDiagnostics:(id)a3 isSensitiveCollectionAllowed:(BOOL)a4
{
  LODWORD(v4) = a4;
  id v6 = a3;
  v7 = +[MFDiagnosticExtension log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting diagnostics...", buf, 2u);
  }

  v8 = +[EFPromise promise];
  if (([v6 isEqualToString:@"com.apple.taptoradard"] & 1) != 0
    || [v6 isEqualToString:@"com.apple.TapToRadar"])
  {
    uint64_t v4 = v4;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v9 = +[MFDiagnosticExtension log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting diagnostics using options %lu", buf, 0xCu);
  }

  v10 = [(MFDiagnosticExtension *)self daemonInterface];
  v11 = [v10 diagnosticInfoGatherer];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100002B2C;
  v15[3] = &unk_100004198;
  id v12 = v8;
  id v16 = v12;
  [v11 gatherDiagnosticsWithOptions:v4 completionHandler:v15];

  v13 = [v12 future];

  return v13;
}

- (id)_attachmentForURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[DEAttachmentItem attachmentWithPathURL:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v23 = a3;
  v25 = [v23 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  uint64_t v4 = [v23 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"];

  v5 = +[MFDiagnosticExtension log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v25;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Host Application: %{public}@", buf, 0xCu);
  }

  id v6 = +[NSMutableArray array];
  v7 = [(MFDiagnosticExtension *)self requestDiagnostics:v25 isSensitiveCollectionAllowed:v4 != 0];
  id v31 = 0;
  v24 = [v7 resultWithTimeout:&v31 error:120.0];
  id v8 = v31;

  if (v8)
  {
    v9 = +[MFDiagnosticExtension log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000030B8((uint64_t)v8, v9);
    }

    id v10 = 0;
    id v11 = &__NSArray0__struct;
  }
  else
  {
    unsigned int v12 = [v24 startAccessingSecurityScopedResource];
    v13 = +[NSFileManager defaultManager];
    unsigned int v22 = v12;
    id v30 = 0;
    id v8 = [v13 contentsOfDirectoryAtURL:v24 includingPropertiesForKeys:0 options:0 error:&v30];
    id v10 = v30;

    if (v10)
    {
      v14 = +[MFDiagnosticExtension log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [v24 path];
        sub_100003050(v15, (uint64_t)v10, buf, v14);
      }
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v14 = v8;
      id v16 = [v14 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v27;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = [(MFDiagnosticExtension *)self _attachmentForURL:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            [v19 setDeleteOnAttach:&__kCFBooleanTrue];
            [v6 ef_addOptionalObject:v19];
          }
          id v16 = [v14 countByEnumeratingWithState:&v26 objects:v38 count:16];
        }
        while (v16);
      }
    }

    if (v22) {
      [v24 stopAccessingSecurityScopedResource];
    }
    v20 = +[MFDiagnosticExtension log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138412546;
      id v33 = v23;
      __int16 v34 = 2112;
      v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "attachmentsForParameters:%@ %@", v32, 0x16u);
    }

    id v11 = v6;
  }

  return v11;
}

- (void)setDaemonInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end