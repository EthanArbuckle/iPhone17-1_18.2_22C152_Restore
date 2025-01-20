@interface VUIPersistentContainer
+ (id)defaultDirectoryURL;
@end

@implementation VUIPersistentContainer

+ (id)defaultDirectoryURL
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!sDeleteAllEntriesOnInitialization) {
    goto LABEL_5;
  }
  v3 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:@"com.apple.tv" allowPlaceholder:0 error:0];
  v4 = [v3 dataContainerURL];
  v5 = [v4 URLByAppendingPathComponent:@"Library/Application Support" isDirectory:1];

  v6 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Using overridden defaultDirectoryURL for download database: %@", buf, 0xCu);
  }
  if (!v5)
  {
LABEL_5:
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___VUIPersistentContainer;
    v5 = objc_msgSendSuper2(&v9, sel_defaultDirectoryURL);
    v7 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Using default implementation of defaultDirectoryURL for download database: %@", buf, 0xCu);
    }
  }
  return v5;
}

@end