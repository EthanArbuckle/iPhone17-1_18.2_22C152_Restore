@interface ImportExtension
- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5;
@end

@implementation ImportExtension

- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100003A78((uint64_t)v9, v10);
  }

  v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000039DC(v8, v11);
  }

  v12 = self;
  objc_sync_enter(v12);
  if (!v12->_spotlightImporter)
  {
    v13 = (OISpotlightImporter *)objc_alloc_init((Class)OISpotlightImporter);
    spotlightImporter = v12->_spotlightImporter;
    v12->_spotlightImporter = v13;
  }
  objc_sync_exit(v12);

  v15 = [(OISpotlightImporter *)v12->_spotlightImporter searchableAttributesForOfficeFileAtURL:v9 error:a5];
  if (v15)
  {
    [v8 addAttributesFromAttributeSet:v15];
    v16 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100003880(v16);
    }
  }
  else
  {
    v16 = [v9 absoluteString];
    v17 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100003954((uint64_t *)a5, v17);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000038C4((uint64_t)v16, (uint64_t *)a5);
    }
  }

  return v15 != 0;
}

- (void).cxx_destruct
{
}

@end