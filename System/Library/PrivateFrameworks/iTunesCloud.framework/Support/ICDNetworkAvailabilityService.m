@interface ICDNetworkAvailabilityService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDNetworkAvailabilityService)init;
- (void)_canShowCloudDownloadButtonsDidChangeNotification:(id)a3;
- (void)_canShowCloudTracksDidChangeNotification:(id)a3;
- (void)_isCellularDataRestrictedDidChangeNotification:(id)a3;
- (void)_setupNotifications;
- (void)canShowCloudDownloadButtonsWithCompletion:(id)a3;
- (void)canShowCloudMusicWithCompletion:(id)a3;
- (void)canShowCloudVideoWithCompletion:(id)a3;
- (void)dealloc;
- (void)hasProperNetworkConditionsToPlayMediaWithCompletion:(id)a3;
- (void)hasProperNetworkConditionsToShowCloudMediaWithCompletion:(id)a3;
- (void)isCellularDataRestrictedForMusicWithCompletion:(id)a3;
- (void)isCellularDataRestrictedForStoreAppsWithCompletion:(id)a3;
- (void)isCellularDataRestrictedForVideosWithCompletion:(id)a3;
- (void)shouldProhibitMusicActionForCurrentNetworkConditionsWithCompletion:(id)a3;
- (void)shouldProhibitStoreAppsActionForCurrentNetworkConditionsWithCompletion:(id)a3;
- (void)shouldProhibitVideosActionForCurrentNetworkConditionsWithCompletion:(id)a3;
@end

@implementation ICDNetworkAvailabilityService

- (void)_isCellularDataRestrictedDidChangeNotification:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)ICCloudAvailabilityControllerIsCellularDataRestrictedDidChangeNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 1u);
}

- (void)_canShowCloudTracksDidChangeNotification:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)ICCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 1u);
}

- (void)_canShowCloudDownloadButtonsDidChangeNotification:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)ICCloudAvailabilityControllerCanShowCloudDownloadButtonsDidChangeNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 1u);
}

- (void)_setupNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_canShowCloudDownloadButtonsDidChangeNotification:" name:ICCloudAvailabilityControllerCanShowCloudDownloadButtonsDidChangeNotification object:0];

  CFStringRef v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_canShowCloudTracksDidChangeNotification:" name:ICCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_isCellularDataRestrictedDidChangeNotification:" name:ICCloudAvailabilityControllerIsCellularDataRestrictedDidChangeNotification object:0];
}

- (void)canShowCloudVideoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 canShowCloudVideo]);
}

- (void)canShowCloudMusicWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 canShowCloudMusic]);
}

- (void)canShowCloudDownloadButtonsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 canShowCloudDownloadButtons]);
}

- (void)shouldProhibitStoreAppsActionForCurrentNetworkConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 shouldProhibitStoreAppsActionForCurrentNetworkConditions]);
}

- (void)isCellularDataRestrictedForStoreAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isCellularDataRestrictedForStoreApps]);
}

- (void)shouldProhibitVideosActionForCurrentNetworkConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 shouldProhibitVideosActionForCurrentNetworkConditions]);
}

- (void)isCellularDataRestrictedForVideosWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isCellularDataRestrictedForVideos]);
}

- (void)shouldProhibitMusicActionForCurrentNetworkConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 shouldProhibitMusicActionForCurrentNetworkConditions]);
}

- (void)isCellularDataRestrictedForMusicWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isCellularDataRestrictedForMusic]);
}

- (void)hasProperNetworkConditionsToShowCloudMediaWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 hasProperNetworkConditionsToShowCloudMedia]);
}

- (void)hasProperNetworkConditionsToPlayMediaWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudAvailabilityController sharedController];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 hasProperNetworkConditionsToPlayMedia]);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = objc_msgSend(v5, "icd_isConnectionAllowedForService:", 2);
  if (v6)
  {
    unsigned int v7 = [v5 processIdentifier];
    if (v5) {
      [v5 auditToken];
    }
    v8 = MSVBundleIDForAuditToken();
    v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v8;
      __int16 v16 = 1024;
      unsigned int v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ICDNetworkAvailabilityService %p - XPC connection from %{public}@[%d]", buf, 0x1Cu);
    }

    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICCloudServerAvailabilityServiceProtocol];
    [v5 setExportedInterface:v10];
    [v5 setExportedObject:self];
    [v5 resume];
  }
  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)ICDNetworkAvailabilityService;
  [(ICDNetworkAvailabilityService *)&v4 dealloc];
}

- (ICDNetworkAvailabilityService)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICDNetworkAvailabilityService;
  v2 = [(ICDNetworkAvailabilityService *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICDNetworkAvailabilityService *)v2 _setupNotifications];
  }
  return v3;
}

@end