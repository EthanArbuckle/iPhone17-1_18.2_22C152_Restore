@interface AWDDiagnosticExtensionExtension
- (AWDDiagnosticExtensionExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation AWDDiagnosticExtensionExtension

- (AWDDiagnosticExtensionExtension)init
{
  v4.receiver = self;
  v4.super_class = (Class)AWDDiagnosticExtensionExtension;
  v2 = [(AWDDiagnosticExtensionExtension *)&v4 init];
  syslog(3, " **** INIT");
  return v2;
}

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  syslog(3, " **** attachmentsForParameters");
  objc_super v4 = +[NSMutableArray array];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000039A8;
  v30 = sub_1000039B8;
  id v31 = 0;
  v6 = dispatch_get_global_queue(0, 0);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_1000039C0;
  v23 = &unk_100004138;
  v25 = &v26;
  v7 = v5;
  v24 = v7;
  AWDServerConsolidateDeviceDiagnostics();

  dispatch_time_t v8 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    syslog(3, " **** attachmentsForParameters :: TIMEOUT");
  }
  else
  {
    v9 = [(id)v27[5] objectForKey:kAwdDiagnosticsFileArray];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v17;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = +[DEAttachmentItem attachmentWithPath:*(void *)(*((void *)&v16 + 1) + 8 * i)];
            [v4 addObject:v14];
          }
          id v11 = [v10 countByEnumeratingWithState:&v16 objects:v32 count:16];
        }
        while (v11);
      }

      syslog(3, " **** attachmentsForParameters :: %zd files", (size_t)[v4 count]);
    }
    else
    {
      syslog(3, " **** attachmentsForParameters :: BAD INPUT");
    }
  }
  _Block_object_dispose(&v26, 8);

  return v4;
}

@end