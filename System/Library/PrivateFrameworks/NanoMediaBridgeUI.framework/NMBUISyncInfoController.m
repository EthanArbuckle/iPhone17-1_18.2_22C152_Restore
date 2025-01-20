@interface NMBUISyncInfoController
- (BOOL)_musicCellularDownloadingAllowedOnWatch;
- (NMBUISyncInfoController)initWithSyncInfoTarget:(unint64_t)a3;
- (NMBUISyncInfoControllerDataSource)dataSource;
- (NMSMediaSyncInfo)syncInfo;
- (float)progressForModelObject:(id)a3;
- (id)_bundleIdentifierForTarget;
- (id)_musicSyncInfoMessageWithStatus:(unint64_t)a3 downloadPauseReason:(unint64_t)a4;
- (id)syncStatusDetailText;
- (unint64_t)downloadStateForModelObject:(id)a3;
- (unint64_t)target;
- (void)_handleMediaSyncInfoDidUpdateNotification:(id)a3;
- (void)_handleMusicCellularDownloadsAllowedDidChangeNotification:(id)a3;
- (void)beginObservingSyncInfo;
- (void)endObservingSyncInfo;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)powerSourceInfoHasExternalPowerSourceConnectedDidChange:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation NMBUISyncInfoController

- (NMBUISyncInfoController)initWithSyncInfoTarget:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)NMBUISyncInfoController;
  v4 = [(NMBUISyncInfoController *)&v25 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_unint64_t target = a3;
  id v6 = objc_alloc(MEMORY[0x263F57518]);
  v7 = [(NMBUISyncInfoController *)v5 _bundleIdentifierForTarget];
  uint64_t v8 = [v6 initWithBundleIdentifier:v7];
  syncInfoUpdaterHeartbeat = v5->_syncInfoUpdaterHeartbeat;
  v5->_syncInfoUpdaterHeartbeat = (NMSMediaSyncInfoUpdaterHeartbeat *)v8;

  uint64_t v10 = [objc_alloc(MEMORY[0x263F57510]) initWithTarget:a3];
  syncInfo = v5->_syncInfo;
  v5->_syncInfo = (NMSMediaSyncInfo *)v10;

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:v5 selector:sel__handleMediaSyncInfoDidUpdateNotification_ name:*MEMORY[0x263F57500] object:v5->_syncInfo];

  v13 = [MEMORY[0x263F57730] sharedInstance];
  v14 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  v15 = [v13 getAllDevicesWithArchivedAltAccountDevicesMatching:v14];
  v16 = [v15 firstObject];
  v17 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  if (![v16 supportsCapability:v17])
  {

    goto LABEL_7;
  }
  unint64_t target = v5->_target;

  if (target)
  {
LABEL_7:
    v22 = objc_alloc_init(NMBUIPowerSourceInfo);
    powerSourceInfo = v5->_powerSourceInfo;
    v5->_powerSourceInfo = v22;

    [(NMBUIPowerSourceInfo *)v5->_powerSourceInfo setDelegate:v5];
    return v5;
  }
  if (isPairedDeviceGreenTeaCapable())
  {
    id v19 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v20 = [v19 initWithSuiteName:*MEMORY[0x263F574E8]];
    greenTeaDefaults = v5->_greenTeaDefaults;
    v5->_greenTeaDefaults = (NSUserDefaults *)v20;
  }
  return v5;
}

- (unint64_t)downloadStateForModelObject:(id)a3
{
  if (!a3) {
    return 5;
  }
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v7 = [WeakRetained syncInfoController:self containerIdentifierForModelObject:v5];

  uint64_t v8 = 5;
  switch([(NMSMediaSyncInfo *)self->_syncInfo statusForContainer:v7])
  {
    case 0:
      uint64_t v8 = 0;
      goto LABEL_20;
    case 1:
      uint64_t v10 = [MEMORY[0x263F57730] sharedInstance];
      v11 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
      v12 = [v10 getAllDevicesWithArchivedAltAccountDevicesMatching:v11];
      v13 = [v12 firstObject];
      v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
      if (![v13 supportsCapability:v14])
      {

        goto LABEL_16;
      }
      unint64_t target = self->_target;

      if (target)
      {
LABEL_16:
        BOOL v23 = ![(NMBUIPowerSourceInfo *)self->_powerSourceInfo hasExternalPowerSourceConnected];
        goto LABEL_17;
      }
      v16 = [(NMSMediaSyncInfo *)self->_syncInfo containers];
      int v17 = [v16 containsObject:v7];

      if (v17) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = 3;
      }
LABEL_20:
      if ([(NMSMediaSyncInfo *)self->_syncInfo hasItemsOverStorageLimitForContainer:v7])unint64_t v9 = 6; {
      else
      }
        unint64_t v9 = v8;

      return v9;
    case 2:
      v18 = [MEMORY[0x263F57730] sharedInstance];
      id v19 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
      uint64_t v20 = [v18 getAllDevicesWithArchivedAltAccountDevicesMatching:v19];
      v21 = [v20 firstObject];
      v22 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
      if ([v21 supportsCapability:v22]
        && !self->_target
        && [(NMSMediaSyncInfo *)self->_syncInfo downloadPauseReasonForContainer:v7])
      {
        int v25 = [(NMSMediaSyncInfo *)self->_syncInfo hasItemsWaitingWithoutPauseReasonForContainer:v7];

        BOOL v23 = v25 == 0;
LABEL_17:
        if (v23) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = 3;
        }
      }
      else
      {

        uint64_t v8 = 3;
      }
      goto LABEL_20;
    case 3:
      uint64_t v8 = 4;
      goto LABEL_20;
    case 5:
      uint64_t v8 = 2;
      goto LABEL_20;
    default:
      goto LABEL_20;
  }
}

- (float)progressForModelObject:(id)a3
{
  if (!a3) {
    return 1.0;
  }
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v7 = [WeakRetained syncInfoController:self containerIdentifierForModelObject:v5];

  if (v7)
  {
    [(NMSMediaSyncInfo *)self->_syncInfo progressForContainer:v7];
    float v9 = v8;
  }
  else
  {
    float v9 = 1.0;
  }

  return v9;
}

- (id)syncStatusDetailText
{
  unint64_t v3 = [(NMSMediaSyncInfo *)self->_syncInfo status];
  if (v3 > 5) {
    goto LABEL_20;
  }
  if (((1 << v3) & 0x26) != 0)
  {
    v4 = [MEMORY[0x263F57730] sharedInstance];
    id v5 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
    id v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    v7 = [v6 firstObject];
    float v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
    if ([v7 supportsCapability:v8])
    {
      unint64_t target = self->_target;

      if (!target)
      {
        if ([(NMSMediaSyncInfo *)self->_syncInfo hasItemsWaitingWithoutPauseReason])uint64_t v10 = 0; {
        else
        }
          uint64_t v10 = [(NMSMediaSyncInfo *)self->_syncInfo downloadPauseReason];
        int v17 = [(NMBUISyncInfoController *)self _musicSyncInfoMessageWithStatus:[(NMSMediaSyncInfo *)self->_syncInfo status] downloadPauseReason:v10];
        goto LABEL_28;
      }
    }
    else
    {
    }
    if ([(NMBUIPowerSourceInfo *)self->_powerSourceInfo hasExternalPowerSourceConnected])
    {
      v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v12 = v11;
      v13 = @"SYNC_STATUS_WAITING_TITLE";
      v14 = @"Waiting…";
      goto LABEL_27;
    }
    unint64_t v15 = self->_target;
    switch(v15)
    {
      case 2uLL:
        v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v12 = v11;
        v13 = @"SYNC_STATUS_WAITING_TITLE_POWER_AUDIOBOOKS";
        v14 = @"Audiobooks download when Apple Watch is charging";
        goto LABEL_27;
      case 1uLL:
        v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v12 = v11;
        v13 = @"SYNC_STATUS_WAITING_TITLE_POWER_PODCASTS";
        v14 = @"Podcasts download when Apple Watch is charging";
        goto LABEL_27;
      case 0uLL:
        v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v12 = v11;
        v13 = @"SYNC_STATUS_WAITING_TITLE_POWER_MUSIC";
        v14 = @"Music downloads when Apple Watch is charging";
        goto LABEL_27;
    }
LABEL_20:
    int v17 = 0;
    goto LABEL_28;
  }
  if (((1 << v3) & 0x11) == 0)
  {
    unint64_t v16 = self->_target;
    switch(v16)
    {
      case 2uLL:
        v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v12 = v11;
        v13 = @"SYNC_STATUS_SYNCING_TITLE_AUDIOBOOKS";
        v14 = @"Updating Audiobooks on Apple Watch…";
        goto LABEL_27;
      case 1uLL:
        v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v12 = v11;
        v13 = @"SYNC_STATUS_SYNCING_TITLE_PODCASTS";
        v14 = @"Updating Podcasts on Apple Watch…";
        goto LABEL_27;
      case 0uLL:
        v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v12 = v11;
        v13 = @"SYNC_STATUS_PROGRESS_TITLE_MUSIC";
        v14 = @"Updating Music on Apple Watch…";
        goto LABEL_27;
    }
    goto LABEL_20;
  }
  v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
  v12 = v11;
  v13 = @"SYNC_STATUS_UPDATED_TITLE";
  v14 = @"Updated Just Now";
LABEL_27:
  int v17 = [v11 localizedStringForKey:v13 value:v14 table:0];

LABEL_28:
  return v17;
}

- (void)beginObservingSyncInfo
{
  if (self->_isObservingSyncInfo) {
    return;
  }
  self->_isObservingSyncInfo = 1;
  [(NMSMediaSyncInfoUpdaterHeartbeat *)self->_syncInfoUpdaterHeartbeat start];
  unint64_t v3 = [MEMORY[0x263F57730] sharedInstance];
  v4 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  if ([v6 supportsCapability:v7])
  {
    unint64_t target = self->_target;

    if (!target)
    {
      float v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:self selector:sel__handleMusicCellularDownloadsAllowedDidChangeNotification_ name:*MEMORY[0x263F11B60] object:0];

      if (isPairedDeviceGreenTeaCapable())
      {
        [(NSUserDefaults *)self->_greenTeaDefaults addObserver:self forKeyPath:*MEMORY[0x263F574E0] options:0 context:*MEMORY[0x263F574E0]];
        greenTeaDefaults = self->_greenTeaDefaults;
        uint64_t v11 = *MEMORY[0x263F574D8];
        uint64_t v12 = *MEMORY[0x263F574D8];
        [(NSUserDefaults *)greenTeaDefaults addObserver:self forKeyPath:v11 options:0 context:v12];
      }
      return;
    }
  }
  else
  {
  }
  powerSourceInfo = self->_powerSourceInfo;
  [(NMBUIPowerSourceInfo *)powerSourceInfo setDelegate:self];
}

- (void)endObservingSyncInfo
{
  if (!self->_isObservingSyncInfo) {
    return;
  }
  self->_isObservingSyncInfo = 0;
  [(NMSMediaSyncInfoUpdaterHeartbeat *)self->_syncInfoUpdaterHeartbeat stop];
  unint64_t v3 = [MEMORY[0x263F57730] sharedInstance];
  v4 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  id v6 = [v5 firstObject];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"];
  if ([v6 supportsCapability:v7])
  {
    unint64_t target = self->_target;

    if (!target)
    {
      float v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 removeObserver:self name:*MEMORY[0x263F11B60] object:0];

      if (isPairedDeviceGreenTeaCapable())
      {
        [(NSUserDefaults *)self->_greenTeaDefaults removeObserver:self forKeyPath:*MEMORY[0x263F574E0] context:*MEMORY[0x263F574E0]];
        greenTeaDefaults = self->_greenTeaDefaults;
        uint64_t v11 = *MEMORY[0x263F574D8];
        uint64_t v12 = *MEMORY[0x263F574D8];
        [(NSUserDefaults *)greenTeaDefaults removeObserver:self forKeyPath:v11 context:v12];
      }
      return;
    }
  }
  else
  {
  }
  powerSourceInfo = self->_powerSourceInfo;
  [(NMBUIPowerSourceInfo *)powerSourceInfo setDelegate:0];
}

- (void)powerSourceInfoHasExternalPowerSourceConnectedDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v4 hasExternalPowerSourceConnected];
    _os_log_impl(&dword_2397B1000, v5, OS_LOG_TYPE_DEFAULT, "Watch power state did change hasPower=%x", (uint8_t *)v7, 8u);
  }

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"NMBUIMediaSyncInfoDidUpdateNotification" object:self];
}

- (void)_handleMediaSyncInfoDidUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = NMLogForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v9 = 0;
    _os_log_impl(&dword_2397B1000, v5, OS_LOG_TYPE_DEFAULT, "Received media sync info did update notification.", v9, 2u);
  }

  id v6 = [v4 object];

  syncInfo = self->_syncInfo;
  if (v6 == syncInfo)
  {
    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"NMBUIMediaSyncInfoDidUpdateNotification" object:self];
  }
}

- (void)_handleMusicCellularDownloadsAllowedDidChangeNotification:(id)a3
{
  id v4 = NMLogForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2397B1000, v4, OS_LOG_TYPE_DEFAULT, "Received MusicCellularDownloadsAllowedDidChange notification.", v6, 2u);
  }

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"NMBUIMediaSyncInfoDidUpdateNotification" object:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)*MEMORY[0x263F574E0] == a6 || *MEMORY[0x263F574D8] == (void)a6)
  {
    uint64_t v8 = NMLogForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2397B1000, v8, OS_LOG_TYPE_DEFAULT, "Received GreenTeaSettingsChanged notification.", v10, 2u);
    }

    float v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:@"NMBUIMediaSyncInfoDidUpdateNotification" object:self];
  }
}

- (id)_bundleIdentifierForTarget
{
  unint64_t v3 = [(NMBUISyncInfoController *)self target];
  if (v3 >= 3)
  {
    id v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF498];
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected target: (%lu).", -[NMBUISyncInfoController target](self, "target"));
    id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  return off_264DA3C38[v3];
}

- (id)_musicSyncInfoMessageWithStatus:(unint64_t)a3 downloadPauseReason:(unint64_t)a4
{
  switch(NMUResolvedDownloadWaitingReason(a3, a4))
  {
    case 0:
      id v8 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      id v5 = v8;
      uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_GENERIC_MESSAGE";
      v7 = @"Your music will download soon.";
      break;
    case 1:
      id v8 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      id v5 = v8;
      uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_STORAGE";
      v7 = @"Your music will continue to download once additional storage space is available on your Apple Watch.";
      break;
    case 2:
      id v8 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      id v5 = v8;
      uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_HQ_NETWORK";
      v7 = @"Your music will continue to download once your Apple Watch has a better internet connection.";
      break;
    case 3:
      id v8 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      id v5 = v8;
      uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CONSTRAINED_NETWORK";
      v7 = @"Your music will continue to download once your Apple Watch is no longer in Low Data Mode.";
      break;
    case 4:
    case 5:
      char v4 = MGGetBoolAnswer();
      id v5 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      if (v4)
      {
        uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CELLULAR_DOWNLOADS_NOT_ALLOWED_WLAN";
        v7 = @"Cellular downloads are turned off. Your music will continue to download the next time your Apple Watch is connected to either WLAN or your iPhone.";
      }
      else
      {
        uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CELLULAR_DOWNLOADS_NOT_ALLOWED_WIFI";
        v7 = @"Cellular downloads are turned off. Your music will continue to download the next time your Apple Watch is connected to either Wi-Fi or your iPhone.";
      }
      goto LABEL_18;
    case 6:
      char v9 = MGGetBoolAnswer();
      id v5 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      if (v9)
      {
        uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_WLAN";
        v7 = @"Your music will continue to download the next time your Apple Watch is connected to either WLAN or your iPhone.";
      }
      else
      {
        uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_WIFI";
        v7 = @"Your music will continue to download the next time your Apple Watch is connected to either Wi-Fi or your iPhone.";
      }
      goto LABEL_18;
    case 7:
      id v8 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      id v5 = v8;
      uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_POWER";
      v7 = @"Your music will continue to download the next time your Apple Watch is charging.";
      break;
    case 8:
      char v10 = MGGetBoolAnswer();
      id v5 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      if (v10)
      {
        uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_WLAN_AND_POWER";
        v7 = @"Your music will continue to download the next time your Apple Watch is charging and connected to either WLAN or your iPhone.";
      }
      else
      {
        uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_WIFI_AND_POWER";
        v7 = @"Your music will continue to download the next time your Apple Watch is charging and connected to either Wi-Fi or your iPhone.";
      }
LABEL_18:
      id v8 = v5;
      break;
    case 9:
      id v8 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      id v5 = v8;
      uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_THERMAL";
      v7 = @"Your music will continue to download once your Apple Watch cools down.";
      break;
    case 10:
      id v8 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      id v5 = v8;
      uint64_t v6 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_FAILED";
      v7 = @"Your music will resume downloading the next time your Apple Watch is charging and connected to the internet.";
      break;
    default:
      id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unsupported NMUDownloadWaitingReason." userInfo:0];
      objc_exception_throw(v13);
  }
  uint64_t v11 = [v8 localizedStringForKey:v6 value:v7 table:0];

  return v11;
}

- (BOOL)_musicCellularDownloadingAllowedOnWatch
{
  if (isPairedDeviceGreenTeaCapable()
    && ![(NSUserDefaults *)self->_greenTeaDefaults BOOLForKey:*MEMORY[0x263F574E0]])
  {
    greenTeaDefaults = self->_greenTeaDefaults;
    uint64_t v7 = *MEMORY[0x263F574D8];
    return [(NSUserDefaults *)greenTeaDefaults BOOLForKey:v7];
  }
  else
  {
    unint64_t v3 = [MEMORY[0x263F120E8] sharedNetworkObserver];
    char v4 = [v3 isMusicCellularDownloadingAllowed];

    return v4;
  }
}

- (unint64_t)target
{
  return self->_target;
}

- (NMSMediaSyncInfo)syncInfo
{
  return self->_syncInfo;
}

- (NMBUISyncInfoControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NMBUISyncInfoControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_syncInfo, 0);
  objc_storeStrong((id *)&self->_greenTeaDefaults, 0);
  objc_storeStrong((id *)&self->_powerSourceInfo, 0);
  objc_storeStrong((id *)&self->_syncInfoUpdaterHeartbeat, 0);
}

@end