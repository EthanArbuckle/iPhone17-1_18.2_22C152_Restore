@interface WiFiP2PUIAgent
- (WiFiP2PUIAgent)init;
- (id)exportedInterface;
- (void)activate;
- (void)addNotificationRequest:(id)a3 completionHandler:(id)a4;
- (void)configureNotificationsWithBundleIdentifier:(id)a3;
- (void)invalidate;
- (void)removeNotificationsWithIdentifiers:(id)a3;
- (void)showInfrastructureDisconnectOnRetroModeNotificationForService:(id)a3 localization:(id)a4 phoneDisconnected:(BOOL)a5 uuid:(id)a6 completionHandler:(id)a7;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
@end

@implementation WiFiP2PUIAgent

- (WiFiP2PUIAgent)init
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiP2PUIAgent;
  v2 = [(WiFiP2PUIAgent *)&v11 init];
  v3 = v2;
  if (v2)
  {
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = 0;

    v5 = [WiFiP2PXPCConnection alloc];
    v6 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PUIAgent", 0, v6);
    uint64_t v8 = [(WiFiP2PXPCConnection *)v5 initWithEndpointType:0 queue:v7 retryTimeout:-1];
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (WiFiP2PXPCConnection *)v8;

    [(WiFiP2PXPCConnection *)v3->_xpcConnection setDelegate:v3];
  }
  return v3;
}

- (void)activate
{
}

- (void)invalidate
{
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18153B8];
}

- (void)configureNotificationsWithBundleIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F44678];
  id v5 = a3;
  v6 = (UNUserNotificationCenter *)[[v4 alloc] initWithBundleIdentifier:v5];

  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v6;

  [(UNUserNotificationCenter *)self->_notificationCenter removeAllDeliveredNotifications];
  uint64_t v8 = self->_notificationCenter;

  [(UNUserNotificationCenter *)v8 removeAllPendingNotificationRequests];
}

- (void)addNotificationRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)removeNotificationsWithIdentifiers:(id)a3
{
}

- (void)showInfrastructureDisconnectOnRetroModeNotificationForService:(id)a3 localization:(id)a4 phoneDisconnected:(BOOL)a5 uuid:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F445A8]);
  int v17 = MGGetBoolAnswer();
  if (v9)
  {
    v18 = [MEMORY[0x1E4F44618] iconNamed:@"iPhone"];
    [v16 setIcon:v18];

    v19 = +[WiFiP2PXPCConnection frameworkBundle];
    if (v17)
    {
      v20 = @"iPhone WLAN Disconnected";
      goto LABEL_6;
    }
    v26 = @"iPhone Wi-Fi Disconnected";
  }
  else
  {
    v21 = [MEMORY[0x1E4F44618] iconNamed:@"iPad"];
    [v16 setIcon:v21];

    v19 = +[WiFiP2PXPCConnection frameworkBundle];
    if (v17)
    {
      v20 = @"iPad WLAN Disconnected";
LABEL_6:
      v22 = [v19 localizedStringForKey:v20 value:0 table:0 localization:v13];
      [v16 setTitle:v22];

      if ([v12 isEqualToString:@"RemoteCamera"])
      {
        v23 = +[WiFiP2PXPCConnection frameworkBundle];
        v24 = v23;
        v25 = @"To optimize Continuity Camera, your iPhone has disconnected from WLAN. Plug it in with a cable to use WLAN.";
      }
      else
      {
        if (![v12 isEqualToString:@"sidecar"]) {
          goto LABEL_17;
        }
        v23 = +[WiFiP2PXPCConnection frameworkBundle];
        v24 = v23;
        v25 = @"To optimize Sidecar, your iPad has disconnected from WLAN. Plug it in with a cable to use WLAN.";
      }
      goto LABEL_16;
    }
    v26 = @"iPad Wi-Fi Disconnected";
  }
  v27 = [v19 localizedStringForKey:v26 value:0 table:0 localization:v13];
  [v16 setTitle:v27];

  if ([v12 isEqualToString:@"RemoteCamera"])
  {
    v23 = +[WiFiP2PXPCConnection frameworkBundle];
    v24 = v23;
    v25 = @"To optimize Continuity Camera, your iPhone has disconnected from Wi-Fi. Plug it in with a cable to use Wi-Fi.";
  }
  else
  {
    if (![v12 isEqualToString:@"sidecar"]) {
      goto LABEL_17;
    }
    v23 = +[WiFiP2PXPCConnection frameworkBundle];
    v24 = v23;
    v25 = @"To optimize Sidecar, your iPad has disconnected from Wi-Fi. Plug it in with a cable to use Wi-Fi.";
  }
LABEL_16:
  v28 = [v23 localizedStringForKey:v25 value:0 table:0 localization:v13];
  [v16 setBody:v28];

LABEL_17:
  if ([v12 isEqualToString:@"TVRemoteCamera"])
  {
    v29 = +[WiFiP2PXPCConnection frameworkBundle];
    v30 = [v29 localizedStringForKey:@"Optimizing Continuity Camera connection." value:0 table:0 localization:v13];
    [v16 setBody:v30];
  }
  if ([v12 isEqualToString:@"RemoteScreen"])
  {
    v31 = +[WiFiP2PXPCConnection frameworkBundle];
    v32 = [v31 localizedStringForKey:@"Optimizing iPhone Mirroring connection." value:0 table:0 localization:v13];
    [v16 setBody:v32];
  }
  uint64_t v33 = [v16 title];
  if (v33
    && (v34 = (void *)v33,
        [v16 body],
        v35 = objc_claimAutoreleasedReturnValue(),
        v35,
        v34,
        v35))
  {
    v36 = [MEMORY[0x1E4F44648] defaultSound];
    [v16 setSound:v36];

    [v16 setShouldIgnoreDoNotDisturb:1];
    [v16 setShouldIgnoreDowntime:1];
    [v16 setShouldHideDate:1];
    [v16 setShouldHideTime:1];
    v37 = (void *)MEMORY[0x1E4F44620];
    v38 = [v14 UUIDString];
    v39 = [v37 requestWithIdentifier:v38 content:v16 trigger:0];
    [(WiFiP2PUIAgent *)self addNotificationRequest:v39 completionHandler:v15];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v40 = 138543362;
    id v41 = v12;
    _os_log_error_impl(&dword_1BD645000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Skipping WiFi disconnect notification for %{public}@", (uint8_t *)&v40, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end