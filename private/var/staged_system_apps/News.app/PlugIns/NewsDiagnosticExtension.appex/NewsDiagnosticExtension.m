id FRDiagnosticFileListURL()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t vars8;

  v0 = +[NSFileManager defaultManager];
  v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.news"];
  v2 = [v1 URLByAppendingPathComponent:@"news-diagnostic-file-list.txt"];

  return v2;
}

id FRDiagnosticFileTempDirURL()
{
  v0 = +[NSFileManager defaultManager];
  v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.news"];
  v2 = [v1 URLByAppendingPathComponent:@"Library/Caches/Diagnostics" isDirectory:1];

  return v2;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_diagnosticDumpNotifier(void *a1, const char *a2, ...)
{
  return [a1 diagnosticDumpNotifier];
}

id objc_msgSend_diagnosticFileURLs(void *a1, const char *a2, ...)
{
  return [a1 diagnosticFileURLs];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_triggerDiagnosticFileDump(void *a1, const char *a2, ...)
{
  return [a1 triggerDiagnosticFileDump];
}
t];
    v18[0] = 67109120;
    v18[1] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Found %u files for diagnostics", (uint8_t *)v18, 8u);
  }
  v16 = [(NewsDiagnosticExtension *)self attachmentsFromDiagnosticFiles:v12];

  return v16;
}

- (id)attachmentsFromDiagnosticFiles:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (TFInterprocessDiagnosticDumpNotifier)diagnosticDumpNotifier
{
  return self->_diagnosticDumpNotifier;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_diagnosticDumpNotifier, 0);
}

@end