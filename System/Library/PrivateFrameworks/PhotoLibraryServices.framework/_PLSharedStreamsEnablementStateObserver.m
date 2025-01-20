@interface _PLSharedStreamsEnablementStateObserver
- (_PLSharedStreamsEnablementStateObserver)init;
- (void)accountStoreDidChange;
- (void)dealloc;
@end

@implementation _PLSharedStreamsEnablementStateObserver

- (_PLSharedStreamsEnablementStateObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PLSharedStreamsEnablementStateObserver;
  v2 = [(_PLSharedStreamsEnablementStateObserver *)&v6 init];
  if (v2)
  {
    v3 = +[PLAccountStore pl_sharedAccountStore];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_accountStoreDidChange name:@"PLAccountStoreDidChangeNotification" object:v3];
  }
  return v2;
}

- (void)accountStoreDidChange
{
  v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "PLAccountStore did change; invalidating sharedStreamsEnabled",
      v3,
      2u);
  }

  +[PLPhotoSharingHelper accountSettingsChanged];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_PLSharedStreamsEnablementStateObserver;
  [(_PLSharedStreamsEnablementStateObserver *)&v4 dealloc];
}

@end