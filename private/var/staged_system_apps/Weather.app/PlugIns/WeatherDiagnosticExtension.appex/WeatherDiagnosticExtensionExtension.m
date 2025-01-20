@interface WeatherDiagnosticExtensionExtension
+ (id)log;
- (WDEDatabaseManager)databaseManager;
- (WDEDiagnosticFileProvider)fileProvider;
- (WeatherDiagnosticExtensionExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation WeatherDiagnosticExtensionExtension

- (WeatherDiagnosticExtensionExtension)init
{
  v8.receiver = self;
  v8.super_class = (Class)WeatherDiagnosticExtensionExtension;
  v2 = [(WeatherDiagnosticExtensionExtension *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fileProvider = v2->_fileProvider;
    v2->_fileProvider = (WDEDiagnosticFileProvider *)v3;

    uint64_t v5 = objc_opt_new();
    databaseManager = v2->_databaseManager;
    v2->_databaseManager = (WDEDatabaseManager *)v5;
  }
  return v2;
}

- (id)attachmentList
{
  uint64_t v3 = [(WeatherDiagnosticExtensionExtension *)self databaseManager];
  [v3 checkpoint];

  v4 = [(WeatherDiagnosticExtensionExtension *)self fileProvider];
  id v23 = 0;
  uint64_t v5 = [v4 exportDirectoryAndReturnError:&v23];
  id v6 = v23;

  if (v6)
  {
    v7 = +[WeatherDiagnosticExtensionExtension log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to create export directory with error: %@", buf, 0xCu);
    }
    objc_super v8 = &__NSArray0__struct;
  }
  else
  {
    v7 = +[NSFileManager defaultManager];
    id v22 = 0;
    v17 = v5;
    v9 = [v7 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:4 error:&v22];
    id v6 = v22;
    objc_super v8 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = +[DEAttachmentItem attachmentWithPathURL:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          [v15 setDeleteOnAttach:&__kCFBooleanTrue];
          [v8 addObject:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v12);
    }

    uint64_t v5 = v17;
  }

  return v8;
}

- (id)attachmentsForParameters:(id)a3
{
  return [(WeatherDiagnosticExtensionExtension *)self attachmentList];
}

+ (id)log
{
  if (qword_10000C488 != -1) {
    dispatch_once(&qword_10000C488, &stru_100008478);
  }
  v2 = (void *)qword_10000C490;

  return v2;
}

- (WDEDiagnosticFileProvider)fileProvider
{
  return self->_fileProvider;
}

- (WDEDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);

  objc_storeStrong((id *)&self->_fileProvider, 0);
}

@end