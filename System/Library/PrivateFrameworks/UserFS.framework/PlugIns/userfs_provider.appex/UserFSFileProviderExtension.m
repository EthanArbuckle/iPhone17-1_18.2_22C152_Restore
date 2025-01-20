@interface UserFSFileProviderExtension
- (BOOL)serverSearchUsesCS;
- (BOOL)supportsTrash;
- (UserFSFileProviderExtension)init;
@end

@implementation UserFSFileProviderExtension

- (UserFSFileProviderExtension)init
{
  v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[UserFSFileProviderExtension init]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s starting", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)UserFSFileProviderExtension;
  v4 = [(UserFSFileProviderExtension *)&v8 init];
  if (v4)
  {
    *(void *)&v4->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_ItemClass] = objc_opt_class();
    *(void *)&v4->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_EnumeratorClass] = objc_opt_class();
    v5 = *(void **)&v4->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_connectionURL];
    *(void *)&v4->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_connectionURL] = @"machp://com.apple.filesystems.localLiveFiles";

    v6 = *(void **)&v4->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_providerName];
    *(void *)&v4->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_providerName] = @"com.apple.filesystems.userfsd";
  }
  return v4;
}

- (BOOL)serverSearchUsesCS
{
  return 1;
}

- (BOOL)supportsTrash
{
  return 1;
}

@end