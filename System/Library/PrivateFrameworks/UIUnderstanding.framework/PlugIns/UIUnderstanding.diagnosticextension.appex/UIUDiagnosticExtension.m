@interface UIUDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)findRelevantFiles;
@end

@implementation UIUDiagnosticExtension

- (id)findRelevantFiles
{
  v2 = +[NSMutableArray array];
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.uiunderstanding"];
  v5 = [v4 URLByAppendingPathComponent:@"UIDeduplicatorDebug" isDirectory:1];
  id v20 = 0;
  v6 = [v3 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:4 error:&v20];
  id v7 = v20;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003A28(v7);
    }
  }
  else
  {
    v15 = v4;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [objc_alloc((Class)DEAttachmentItem) initWithPathURL:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [v2 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    v4 = v15;
  }

  return v2;
}

- (id)attachmentList
{
  return [(UIUDiagnosticExtension *)self findRelevantFiles];
}

- (id)attachmentsForParameters:(id)a3
{
  return [(UIUDiagnosticExtension *)self findRelevantFiles];
}

@end