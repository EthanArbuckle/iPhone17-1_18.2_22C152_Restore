@interface Haywire
- (BOOL)_findAsset:(BOOL)a3;
- (BOOL)filterAsset:(id)a3 osBuild:(id)a4 osVersion:(id)a5;
- (BOOL)findLocalAsset;
- (BOOL)findRemoteAsset;
- (BOOL)hasNetworkAccess;
- (Haywire)initWithCoder:(id)a3;
- (Haywire)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (MAAsset)firmwareAsset;
- (NSArray)assetResults;
- (NSDictionary)options;
- (NSError)error;
- (NSMutableDictionary)outOptions;
- (NSString)boardID;
- (NSString)bootArgs;
- (NSString)bundlePath;
- (NSString)chipID;
- (NSString)maxLocalBuildNumber;
- (NSString)maxRemoteBuildNumber;
- (NSString)variant;
- (id)assetWithMaxVersion:(id)a3 remote:(BOOL)a4;
- (id)filterFoundAssets:(id)a3;
- (id)getUpdateRequired;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)cleanupAssets;
- (void)dealloc;
- (void)deviceError:(int)a3;
- (void)dfuDeviceConnected:(__AMDFUModeDevice *)a3;
- (void)dfuDeviceDisconnected:(__AMDFUModeDevice *)a3;
- (void)doBootstrapWithOptions:(id)a3;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)notifyUserWithMessage:(id)a3 title:(id)a4;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)queryComplete:(id)a3 remote:(BOOL)a4 error:(id)a5 completion:(id)a6;
- (void)recoveryDeviceConnected:(__AMRecoveryModeDevice *)a3;
- (void)recoveryDeviceDisconnected:(__AMRecoveryModeDevice *)a3;
- (void)runQuery:(BOOL)a3 completion:(id)a4;
- (void)setAPFusingsWithChipID:(unsigned int)a3 boardID:(unsigned int)a4 productionFused:(BOOL)a5;
- (void)setAssetResults:(id)a3;
- (void)setBoardID:(id)a3;
- (void)setChipID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setFirmwareAsset:(id)a3;
- (void)setMaxLocalBuildNumber:(id)a3;
- (void)setMaxRemoteBuildNumber:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOutOptions:(id)a3;
@end

@implementation Haywire

- (void)notifyUserWithMessage:(id)a3 title:(id)a4
{
}

- (void)setAPFusingsWithChipID:(unsigned int)a3 boardID:(unsigned int)a4 productionFused:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s", "-[Haywire setAPFusingsWithChipID:boardID:productionFused:]");
  [(Haywire *)self setChipID:+[NSString stringWithFormat:@"0x%04X", v7]];
  [(Haywire *)self setBoardID:+[NSString stringWithFormat:@"0x%02X", v6]];
  self->_productionFused = a5;
}

- (BOOL)hasNetworkAccess
{
  v2 = SCNetworkReachabilityCreateWithName(0, (const char *)[@"mesu.apple.com" UTF8String]);
  SCNetworkReachabilityFlags flags = 0;
  int v3 = SCNetworkReachabilityGetFlags(v2, &flags);
  if (v3)
  {
    BOOL v4 = (flags & 4) == 0;
    if ((flags & 0x28) != 0) {
      BOOL v4 = (~flags & 0x14) != 0;
    }
    SCNetworkReachabilityFlags v5 = v4 | ((flags & 0x40000) >> 18);
    LOBYTE(v3) = v5;
    if (v2) {
      goto LABEL_5;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
    if (v2)
    {
LABEL_5:
      CFRelease(v2);
      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)findRemoteAsset
{
  [(Haywire *)self _findAsset:1];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  if ([(MAAsset *)[(Haywire *)self firmwareAsset] state] != (id)2)
  {
    int v3 = dispatch_semaphore_create(0);
    BOOL v4 = objc_opt_new();
    [v4 setDiscretionary:0];
    [v4 setAllowsCellularAccess:1];
    [v4 setAllowsExpensiveAccess:1];
    [v4 setRequiresPowerPluggedIn:0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100002324;
    v7[3] = &unk_10009CF38;
    v7[5] = v3;
    v7[6] = &v8;
    v7[4] = self;
    [(MAAsset *)[(Haywire *)self firmwareAsset] startDownload:v4 then:v7];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v3);
  }
  BOOL v5 = v9[3] == 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)findLocalAsset
{
  return [(Haywire *)self _findAsset:0];
}

- (BOOL)_findAsset:(BOOL)a3
{
  BOOL v3 = a3;
  delegate = self->_delegate;
  [+[NSDate date] timeIntervalSinceReferenceDate];
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"[%f] %s", v6, "-[Haywire _findAsset:]");
  if ([(Haywire *)self firmwareAsset]) {
    return 1;
  }
  uint64_t v7 = dispatch_semaphore_create(0);
  [(Haywire *)self setError:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100002588;
  v17[3] = &unk_10009CF60;
  v17[4] = self;
  v17[5] = v7;
  [(Haywire *)self runQuery:v3 completion:v17];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  uint64_t v8 = self->_delegate;
  [+[NSDate date] timeIntervalSinceReferenceDate];
  -[FudPluginDelegate log:format:](v8, "log:format:", 7, @"[%f] %s - Returning", v9, "-[Haywire _findAsset:]");
  if ([(Haywire *)self firmwareAsset]) {
    return 1;
  }
  -[Haywire setError:](self, "setError:", sub_10000261C(4001, @"%s: failed to find %@ asset\n", v10, v11, v12, v13, v14, v15, (uint64_t)"-[Haywire _findAsset:]"));
  if (self->_retryBootstrap) {
    return 0;
  }
  [(Haywire *)self notifyUserWithMessage:[+[NSBundle mainBundle](NSBundle, "mainBundle") localizedStringForKey:@"Downloading accessory firmware. Your accessory will not function until the download completes." value:&stru_10009EF88 table:0] title:[+[NSBundle mainBundle] localizedStringForKey:@"Accessory" value:&stru_10009EF88 table:0]];
  BOOL result = 0;
  self->_retryBootstrap = 1;
  return result;
}

- (void)dfuDeviceConnected:(__AMDFUModeDevice *)a3
{
  delegate = self->_delegate;
  [+[NSDate date] timeIntervalSinceReferenceDate];
  [(FudPluginDelegate *)delegate log:7, @"[%f] dfu mode %p detected.\n", v6, a3 format];
  if (!a3) {
    return;
  }
  uint64_t ChipID = AMDFUModeDeviceGetChipID((uint64_t)a3);
  uint64_t BoardID = AMDFUModeDeviceGetBoardID((uint64_t)a3);
  [(Haywire *)self setAPFusingsWithChipID:ChipID boardID:BoardID productionFused:AMDFUModeDeviceGetProductionMode((uint64_t)a3) != 0];
  if (![(Haywire *)self findLocalAsset]
    && (![(Haywire *)self hasNetworkAccess] || ![(Haywire *)self findRemoteAsset]))
  {
    [(Haywire *)self setError:sub_10000261C(4001, @"chipID=0x%X, boardID=%d: DFU mode options failed to find local asset.", v39, v40, v41, v42, v43, v44, ChipID)];
    v45 = [+[NSBundle mainBundle] localizedStringForKey:@"Accessory not Supported or failed to download accessory firmware." value:&stru_10009EF88 table:0];
    v46 = [+[NSBundle mainBundle] localizedStringForKey:@"Accessory" value:&stru_10009EF88 table:0];
    [(Haywire *)self notifyUserWithMessage:v45 title:v46];
    return;
  }
  CFStringRef v9 = [(Haywire *)self bundlePath];
  CFStringRef v10 = [(Haywire *)self variant];
  uint64_t v11 = [(Haywire *)self bootArgs];
  CFDictionaryRef v15 = (const __CFDictionary *)sub_1000029B0(v9, v10, (uint64_t)v11, ChipID, BoardID, v12, v13, v14);
  if (v15)
  {
    CFDictionaryRef v22 = v15;
    if (AMDFUModeDeviceIsBootstrapOnly((uint64_t)a3, v15))
    {
      [(FudPluginDelegate *)self->_delegate log:5, @"chipID=0x%X, boardID=%d: DFU mode bootstrap.\n", ChipID, BoardID format];
      v29 = self->_delegate;
      [+[NSDate date] timeIntervalSinceReferenceDate];
      -[FudPluginDelegate log:format:](v29, "log:format:", 7, @"[%f] %s - starting restore\n", v30, "-[Haywire dfuDeviceConnected:]");
      int v31 = AMRestorePerformDFURestore((uint64_t)a3, v22, (uint64_t)sub_100002B04, (uint64_t)self);
      if (!v31)
      {
LABEL_17:
        CFRelease(v22);
        return;
      }
      v38 = sub_10000261C(v31, @"AMRestorePerformDFURestore(%p) returned %d.\n", v32, v33, v34, v35, v36, v37, (uint64_t)a3);
    }
    else
    {
      v38 = sub_10000261C(4006, @"chipID=0x%X, boardID=%d not configured to bootstrap, ignoring.\n", v23, v24, v25, v26, v27, v28, ChipID);
    }
    [(Haywire *)self setError:v38];
    goto LABEL_17;
  }
  v47 = sub_10000261C(4005, @"chipID=0x%X, boardID=%d: DFU mode options creation failed.\n", v16, v17, v18, v19, v20, v21, ChipID);
  [(Haywire *)self setError:v47];
}

- (void)dfuDeviceDisconnected:(__AMDFUModeDevice *)a3
{
}

- (void)recoveryDeviceConnected:(__AMRecoveryModeDevice *)a3
{
  [(FudPluginDelegate *)self->_delegate log:6, @"recovery mode device %p connected\n", a3 format];
  uint64_t ChipID = AMRecoveryModeDeviceGetChipID((uint64_t)a3);
  uint64_t BoardID = AMRecoveryModeDeviceGetBoardID((uint64_t)a3);
  [(Haywire *)self setAPFusingsWithChipID:ChipID boardID:BoardID productionFused:AMRecoveryModeDeviceGetProductionMode((uint64_t)a3) != 0];
  if (![(Haywire *)self findLocalAsset]
    && (![(Haywire *)self hasNetworkAccess] || ![(Haywire *)self findRemoteAsset]))
  {
    [(Haywire *)self setError:sub_10000261C(4001, @"chipID=0x%X, boardID=%d: Recovery mode options failed to find local asset.", v35, v36, v37, v38, v39, v40, ChipID)];
    uint64_t v41 = [+[NSBundle mainBundle] localizedStringForKey:@"Accessory not Supported or failed to download accessory firmware." value:&stru_10009EF88 table:0];
    uint64_t v42 = [+[NSBundle mainBundle] localizedStringForKey:@"Accessory" value:&stru_10009EF88 table:0];
    [(Haywire *)self notifyUserWithMessage:v41 title:v42];
    return;
  }
  CFStringRef v7 = [(Haywire *)self bundlePath];
  CFStringRef v8 = [(Haywire *)self variant];
  CFStringRef v9 = [(Haywire *)self bootArgs];
  CFDictionaryRef v13 = (const __CFDictionary *)sub_1000029B0(v7, v8, (uint64_t)v9, ChipID, BoardID, v10, v11, v12);
  if (v13)
  {
    CFDictionaryRef v20 = v13;
    if (AMRecoveryModeDeviceIsBootstrapOnly((uint64_t)a3, v13))
    {
      [(FudPluginDelegate *)self->_delegate log:5, @"chipID=0x%X, boardID=%d: Recovery mode bootstrap.\n", ChipID, BoardID format];
      int v27 = AMRestorePerformRecoveryModeRestore((uint64_t)a3, v20, (uint64_t)sub_100002DE0, (uint64_t)self);
      if (!v27)
      {
        uint64_t v44 = 0;
        self->_success = 1;
        goto LABEL_17;
      }
      uint64_t v34 = sub_10000261C(v27, @"AMRestorePerformRecoveryModeRestore(%ps) returned %d.\n", v28, v29, v30, v31, v32, v33, (uint64_t)a3);
    }
    else
    {
      uint64_t v34 = sub_10000261C(4006, @"chipID=0x%X, boardID=%d not configured to bootstrap, ignoring.\n", v21, v22, v23, v24, v25, v26, ChipID);
    }
    uint64_t v44 = v34;
LABEL_17:
    [(Haywire *)self setError:v44];
    CFRelease(v20);
    return;
  }
  uint64_t v43 = sub_10000261C(4005, @"chipID=0x%X, boardID=%d: Recovery mode options creation failed.\n", v14, v15, v16, v17, v18, v19, ChipID);
  [(Haywire *)self setError:v43];
}

- (void)recoveryDeviceDisconnected:(__AMRecoveryModeDevice *)a3
{
}

- (void)deviceError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(FudPluginDelegate *)self->_delegate log:3, @"error %d processing device\n", *(void *)&a3 format];
  uint64_t v11 = sub_10000261C(v3, @"error %d processing device\n", v5, v6, v7, v8, v9, v10, v3);
  [(Haywire *)self setError:v11];
}

- (NSString)bundlePath
{
  if ([(Haywire *)self firmwareAsset])
  {
    uint64_t v9 = (NSString *)objc_msgSend(-[MAAsset getLocalUrl](-[Haywire firmwareAsset](self, "firmwareAsset"), "getLocalUrl"), "path");
    AMRLog(3, @"FirmwareAsset is %@", v10, v11, v12, v13, v14, v15, (char)v9);
  }
  else
  {
    AMRLog(3, @"FirmwareAsset is nil", v3, v4, v5, v6, v7, v8, v17);
    return 0;
  }
  return v9;
}

- (NSString)variant
{
  if (self->_productionFused) {
    CFStringRef v3 = @"Accessory - Customer Boot";
  }
  else {
    CFStringRef v3 = @"Accessory - Development Boot";
  }
  id v4 = (id)CFPreferencesCopyAppValue(@"AuthInstallVariant", kCFPreferencesCurrentApplication);
  if ([(Haywire *)self firmwareAsset] && !v4)
  {
    id v4 = objc_msgSend(-[MAAsset attributes](-[Haywire firmwareAsset](self, "firmwareAsset"), "attributes"), "objectForKey:", @"Variant");
    id v5 = v4;
  }
  if (!v4) {
    return &v3->isa;
  }

  return (NSString *)v4;
}

- (NSString)bootArgs
{
  BOOL result = [(Haywire *)self firmwareAsset];
  if (result)
  {
    id v4 = [(MAAsset *)[(Haywire *)self firmwareAsset] attributes];
    return (NSString *)[v4 objectForKey:@"BootArgs"];
  }
  return result;
}

- (id)getUpdateRequired
{
  CFStringRef v3 = +[NSNumber numberWithBool:1];
  id result = [(Haywire *)self firmwareAsset];
  if (result) {
    id result = objc_msgSend(-[MAAsset attributes](-[Haywire firmwareAsset](self, "firmwareAsset"), "attributes"), "objectForKey:", @"UpdateRequired");
  }
  if (!result) {
    return v3;
  }
  return result;
}

- (Haywire)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)Haywire;
  uint64_t v9 = [(Haywire *)&v15 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_delegate = (FudPluginDelegate *)a4;
    [(Haywire *)v9 setOptions:a6];
    [(Haywire *)v10 setOutOptions:+[NSMutableDictionary dictionary]];
    delegate = v10->_delegate;
    uint64_t v12 = (objc_class *)objc_opt_class();
    [(FudPluginDelegate *)delegate log:5, @"Initializing Plugin %@ for DeviceClass %@", NSStringFromClass(v12), a3 format];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (DarwinNotifyCenter) {
      CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, @"com.apple.HaywireAccessoryAttached", @"com.apple.MobileAsset.MobileAccessoryUpdate.haywire", (CFDictionaryRef)+[NSDictionary dictionaryWithObject:a3 forKey:@"DeviceClass"], 4uLL);
    }
    else {
      [(FudPluginDelegate *)v10->_delegate log:4 format:@"Failed to get darwin notification center, can't post connection notification...continuing"];
    }
  }
  return v10;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FudPluginDelegate *)a3;
}

- (void)doBootstrapWithOptions:(id)a3
{
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 5, @"%s", "-[Haywire doBootstrapWithOptions:]");
  [(Haywire *)self setError:0];
  AMRestoreUnregisterForDeviceNotifications();
  uint64_t v4 = AMRestoreRegisterForDeviceNotifications((uint64_t)sub_100003300, (uint64_t)sub_100003314, (uint64_t)sub_100003328, (uint64_t)sub_10000333C, (uint64_t)sub_100003350, (uint64_t)self);
  if (v4)
  {
    uint64_t v11 = v4;
    -[Haywire setError:](self, "setError:", sub_10000261C(v4, @"%s: unable to register for device notifications (err: %d)\n", v5, v6, v7, v8, v9, v10, (uint64_t)"-[Haywire doBootstrapWithOptions:]"));
  }
  if (self->_success)
  {
LABEL_6:
    if (!self->_error) {
      -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 5, @"%s: successfully bootstrapped device.\n", "-[Haywire doBootstrapWithOptions:]");
    }
  }
  else
  {
    while (!self->_error)
    {
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      if (self->_success) {
        goto LABEL_6;
      }
    }
  }
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 5, @"%s: unregistering for libusbrestore device notifications", "-[Haywire doBootstrapWithOptions:]", v11);
  AMRestoreUnregisterForDeviceNotifications();
}

- (void)bootstrapWithOptions:(id)a3
{
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 6, @"%s", "-[Haywire bootstrapWithOptions:]");
  [(Haywire *)self doBootstrapWithOptions:a3];
  if (self->_success)
  {
    uint64_t v5 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSString stringWithFormat:@"%@-%@-%@", [(Haywire *)self chipID], [(Haywire *)self boardID], [(Haywire *)self variant]], @"DeviceClassRevision");
    BOOL success = self->_success;
  }
  else
  {
    BOOL success = 0;
    uint64_t v5 = 0;
  }
  delegate = self->_delegate;
  error = self->_error;
  [(FudPluginDelegate *)delegate didBootstrap:success info:v5 error:error];
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  delegate = self->_delegate;
  uint64_t v7 = "Local";
  if (a4) {
    uint64_t v7 = "Remote";
  }
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s (%s)", "-[Haywire findFirmwareWithOptions:remote:]", v7);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003558;
  v8[3] = &unk_10009CF88;
  v8[4] = self;
  [(Haywire *)self runQuery:v4 completion:v8];
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  id v4 = objc_alloc_init((Class)MADownloadOptions);
  if ([(Haywire *)self firmwareAsset])
  {
    delegate = self->_delegate;
    uint64_t v21 = "-[Haywire downloadFirmwareWithOptions:]";
    [(MAAsset *)[(Haywire *)self firmwareAsset] state];
    [(FudPluginDelegate *)delegate log:5 format:@"%s asset state = %d"];
    if (v4)
    {
      [v4 setRequiresPowerPluggedIn:0];
      [v4 setAllowsCellularAccess:1];
      [v4 setAllowsExpensiveAccess:1];
      [v4 setDiscretionary:0];
      unsigned int v12 = [(MAAsset *)[(Haywire *)self firmwareAsset] wasLocal];
      uint64_t v13 = self->_delegate;
      if (!v12)
      {
        -[FudPluginDelegate log:format:](v13, "log:format:", 5, @"%s calling beginDownloadWithOptions", "-[Haywire downloadFirmwareWithOptions:]");
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000038A8;
        v22[3] = &unk_10009CFB0;
        v22[4] = self;
        [(MAAsset *)[(Haywire *)self firmwareAsset] startDownload:v4 completionWithError:v22];
        return;
      }
      -[FudPluginDelegate log:format:](v13, "log:format:", 5, @"%s calling didDownload", "-[Haywire downloadFirmwareWithOptions:]");
      uint64_t v14 = self->_delegate;
      outOptions = self->_outOptions;
      uint64_t v16 = 1;
      char v17 = 0;
      goto LABEL_5;
    }
    CFStringRef v18 = @"downloadOptions allocation failed";
  }
  else
  {
    CFStringRef v18 = @"No Asset";
  }
  uint64_t v19 = sub_10000261C(4001, (uint64_t)v18, v5, v6, v7, v8, v9, v10, (uint64_t)v21);
  if (!v19) {
    return;
  }
  CFDictionaryRef v20 = v19;
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s - Error: %@ - calling -didDownload:FALSE", "-[Haywire downloadFirmwareWithOptions:]", v19);
  uint64_t v14 = self->_delegate;
  outOptions = self->_outOptions;
  uint64_t v16 = 0;
  char v17 = v20;
LABEL_5:
  [(FudPluginDelegate *)v14 didDownload:v16 info:outOptions error:v17];
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  [(Haywire *)self setOptions:a3];
  delegate = self->_delegate;
  outOptions = self->_outOptions;
  [(FudPluginDelegate *)delegate didPrepare:1 info:outOptions error:0];
}

- (void)applyFirmwareWithOptions:(id)a3
{
  [(Haywire *)self setOptions:a3];
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 5, @"%s - Applying update. old version(%@) new version (%@)", "-[Haywire applyFirmwareWithOptions:]", self->_maxLocalBuildNumber, self->_maxRemoteBuildNumber);
  [(Haywire *)self setMaxLocalBuildNumber:self->_maxRemoteBuildNumber];
  if (self->_retryBootstrap)
  {
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 5, @"%s:About to trigger bootstrap", "-[Haywire applyFirmwareWithOptions:]");
    [(Haywire *)self doBootstrapWithOptions:0];
    if (!self->_error)
    {
      [(Haywire *)self notifyUserWithMessage:[+[NSBundle mainBundle](NSBundle, "mainBundle") localizedStringForKey:@"Downloading accessory firmware complete. Your accessory should now be ready for use." value:&stru_10009EF88 table:0] title:[+[NSBundle mainBundle] localizedStringForKey:@"Accessory" value:&stru_10009EF88 table:0]];
      self->_retryBootstrap = 0;
    }
  }
  [(Haywire *)self cleanupAssets];
  delegate = self->_delegate;
  outOptions = self->_outOptions;
  [(FudPluginDelegate *)delegate didApply:1 info:outOptions error:0];
}

- (void)finishWithOptions:(id)a3
{
  [(Haywire *)self setOptions:a3];
  delegate = self->_delegate;
  outOptions = self->_outOptions;
  [(FudPluginDelegate *)delegate didFinish:1 info:outOptions error:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)Haywire;
  [(Haywire *)&v3 dealloc];
}

- (Haywire)initWithCoder:(id)a3
{
  AMRLog(7, @"%s", (uint64_t)a3, v3, v4, v5, v6, v7, (char)"-[Haywire initWithCoder:]");
  v13.receiver = self;
  v13.super_class = (Class)Haywire;
  uint64_t v10 = [(Haywire *)&v13 init];
  if (v10)
  {
    uint64_t v11 = (NSMutableDictionary *)[a3 decodeObjectForKey:@"OutOptions"];
    v10->_outOptions = v11;
    if (!v11) {
      [(Haywire *)v10 setOutOptions:+[NSMutableDictionary dictionary]];
    }
    v10->_maxLocalBuildNumber = (NSString *)[a3 decodeObjectForKey:@"InstalledBuildNumber"];
    v10->_maxRemoteBuildNumber = (NSString *)[a3 decodeObjectForKey:@"MaxBuildNumber"];
    v10->_chipID = (NSString *)[a3 decodeObjectForKey:@"ApChipID"];
    v10->_boardID = (NSString *)[a3 decodeObjectForKey:@"ApBoardID"];
    v10->_firmwareAsset = 0;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s", "-[Haywire encodeWithCoder:]");
  outOptions = self->_outOptions;
  if (outOptions) {
    [a3 encodeObject:outOptions forKey:@"OutOptions"];
  }
  maxLocalBuildNumber = self->_maxLocalBuildNumber;
  if (maxLocalBuildNumber) {
    [a3 encodeObject:maxLocalBuildNumber forKey:@"InstalledBuildNumber"];
  }
  maxRemoteBuildNumber = self->_maxRemoteBuildNumber;
  if (maxRemoteBuildNumber) {
    [a3 encodeObject:maxRemoteBuildNumber forKey:@"MaxBuildNumber"];
  }
  chipID = self->_chipID;
  if (chipID) {
    [a3 encodeObject:chipID forKey:@"ApChipID"];
  }
  if (self->_boardID)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (void)runQuery:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(Haywire *)self variant];
  uint64_t v8 = "Local";
  if (v5) {
    uint64_t v8 = "Remote";
  }
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s:(%s)", "-[Haywire runQuery:completion:]", v8);
  id v9 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.MobileAccessoryUpdate.haywire"];
  if (v9)
  {
    if (v7)
    {
      chipID = self->_chipID;
      if (chipID)
      {
        if (self->_boardID)
        {
          uint64_t v16 = v9;
          objc_msgSend(v9, "addKeyValuePair:with:", @"ApChipID");
          [v16 addKeyValuePair:@"ApBoardID" with:self->_boardID];
          [v16 addKeyValuePair:@"Variant" with:v7];
          [v16 addKeyValuePair:@"PackageVersion" with:@"1.0"];
          delegate = self->_delegate;
          boardID = self->_boardID;
          if (self->_productionFused)
          {
            -[FudPluginDelegate log:format:](delegate, "log:format:", 5, @"%s - query for prod. variant = %@, _chipID = %@, _boardID = %@ ", "-[Haywire runQuery:completion:]", v7, self->_chipID, boardID);
            objc_msgSend(v16, "addKeyValuePair:with:", @"ProductionSigned", objc_msgSend(&__kCFBooleanTrue, "stringValue"));
          }
          else
          {
            -[FudPluginDelegate log:format:](delegate, "log:format:", 5, @"%s - query for dev. variant = %@, _chipID = %@, _boardID = %@ ", "-[Haywire runQuery:completion:]", v7, self->_chipID, boardID);
          }
          id v19 = v16;
          if (v5)
          {
            id v20 = objc_alloc_init((Class)MADownloadOptions);
            [v20 setRequiresPowerPluggedIn:0];
            [v20 setDiscretionary:0];
            [v20 setAllowsCellularAccess:1];
            [v20 setAllowsExpensiveAccess:1];
            [v20 setTimeoutIntervalForResource:120];
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_100004010;
            v27[3] = &unk_10009CFD8;
            v27[4] = v16;
            v27[5] = self;
            BOOL v28 = v5;
            v27[6] = a4;
            +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.MobileAccessoryUpdate.haywire" options:v20 completionWithError:v27];
          }
          else
          {
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1000040F8;
            v25[3] = &unk_10009CFD8;
            v25[4] = self;
            v25[5] = v16;
            char v26 = 0;
            v25[6] = a4;
            [v16 queryMetaDataWithError:v25];
          }
          return;
        }
        CFStringRef v21 = @"_boardID is nil";
      }
      else
      {
        CFStringRef v21 = @"_chipID is nil";
      }
    }
    else
    {
      CFStringRef v21 = @"variant is nil";
    }
  }
  else
  {
    CFStringRef v21 = @"Couldn't allocate MAAssetQuery";
  }
  uint64_t v22 = sub_10000261C(4000, (uint64_t)v21, v10, (uint64_t)chipID, v12, v13, v14, v15, v24);
  if (v22)
  {
    uint64_t v23 = (void (*)(id, NSError *))*((void *)a4 + 2);
    v23(a4, v22);
  }
}

- (void)queryComplete:(id)a3 remote:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  if (!a5)
  {
    if (a3)
    {
      BOOL v10 = a4;
      delegate = self->_delegate;
      uint64_t v13 = "Local";
      if (a4) {
        uint64_t v13 = "Remote";
      }
      -[FudPluginDelegate log:format:](delegate, "log:format:", 5, @"%s:(%s) - Query Results: %@", "-[Haywire queryComplete:remote:error:completion:]", v13, a3);
      [(Haywire *)self setAssetResults:a3];
      if (![a3 count]) {
        goto LABEL_13;
      }
      id v14 = [(Haywire *)self filterFoundAssets:a3];
      if (!v14) {
        goto LABEL_13;
      }
      id v15 = v14;
      if (![v14 count]) {
        goto LABEL_13;
      }
      id v16 = [(Haywire *)self assetWithMaxVersion:v15 remote:v10];
      if (v16)
      {
        char v17 = v16;
        if ([v16 attributes])
        {
          if (v10 || [v17 wasLocal]) {
            [(Haywire *)self setFirmwareAsset:v17];
          }
LABEL_13:
          a5 = 0;
          goto LABEL_14;
        }
        CFStringRef v19 = @"No asset attributes";
        int v20 = 4002;
LABEL_21:
        a5 = sub_10000261C(v20, (uint64_t)v19, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, v6, v7, v21);
        if (!a6) {
          return;
        }
        goto LABEL_15;
      }
      CFStringRef v19 = @"No asset found";
    }
    else
    {
      CFStringRef v19 = @"asset query results are nil";
    }
    int v20 = 4001;
    goto LABEL_21;
  }
LABEL_14:
  if (!a6) {
    return;
  }
LABEL_15:
  CFStringRef v18 = (void (*)(id, id))*((void *)a6 + 2);
  v18(a6, a5);
}

- (id)filterFoundAssets:(id)a3
{
  id v3 = a3;
  if (!a3) {
    return v3;
  }
  BOOL v5 = (void *)MGCopyAnswer();
  uint64_t v6 = (void *)MGCopyAnswer();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000043A8;
  v9[3] = &unk_10009D000;
  v9[4] = self;
  v9[5] = v5;
  v9[6] = v6;
  id v7 = [v3 indexesOfObjectsWithOptions:1 passingTest:v9];
  if (v7)
  {
    id v3 = [v3 objectsAtIndexes:v7];
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v3 = 0;
  if (v5) {
LABEL_4:
  }

LABEL_5:
  if (v6) {

  }
  return v3;
}

- (BOOL)filterAsset:(id)a3 osBuild:(id)a4 osVersion:(id)a5
{
  if (!a3)
  {
    LOBYTE(v8) = 0;
    return (char)v8;
  }
  id v8 = [a3 attributes];
  if (!v8) {
    return (char)v8;
  }
  id v9 = v8;
  id v10 = [v8 objectForKey:@"MinimumRequiredOSBuild"];
  if (v10)
  {
    if (!a4) {
      goto LABEL_20;
    }
    id v11 = v10;
    if ([a4 compare:v10] == (id)-1)
    {
      -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s: OS build %@ doesn't meet minimum build requirement %@\n", "-[Haywire filterAsset:osBuild:osVersion:]", a4, v11);
      goto LABEL_20;
    }
  }
  id v12 = [v9 objectForKey:@"MaximumAllowedOSBuild"];
  if (v12)
  {
    if (a4)
    {
      id v13 = v12;
      if ([a4 compare:v12] == (id)1)
      {
        -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s: OS build %@ doesn't meet maximum allowed build requirement %@\n", "-[Haywire filterAsset:osBuild:osVersion:]", a4, v13);
        goto LABEL_20;
      }
      goto LABEL_10;
    }
LABEL_20:
    LOBYTE(v8) = 0;
    return (char)v8;
  }
LABEL_10:
  id v14 = [v9 objectForKey:@"MinimumRequiredOSVersion"];
  if (v14)
  {
    if (!a5) {
      goto LABEL_20;
    }
    id v15 = v14;
    if ([a5 compare:v14] == (id)-1)
    {
      -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s: OS build %@ doesn't meet minimum version requirement %@\n", "-[Haywire filterAsset:osBuild:osVersion:]", a5, v15);
      goto LABEL_20;
    }
  }
  id v16 = [v9 objectForKey:@"MaximumAllowedOSVersion"];
  if (v16)
  {
    if (!a5) {
      goto LABEL_20;
    }
    id v17 = v16;
    if ([a5 compare:v16] == (id)1)
    {
      -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s: OS build %@ doesn't meet maximum allowed version requirement %@\n", "-[Haywire filterAsset:osBuild:osVersion:]", a5, v17);
      goto LABEL_20;
    }
  }
  LOBYTE(v8) = 1;
  return (char)v8;
}

- (id)assetWithMaxVersion:(id)a3 remote:(BOOL)a4
{
  BOOL v31 = a4;
  if (!a3) {
    return 0;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v33 objects:v37 count:16];
  id v7 = "-[Haywire assetWithMaxVersion:remote:]";
  if (v6)
  {
    id v8 = v6;
    id v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v34;
    id obj = a3;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v14 = [v13 attributes];
        if (v14)
        {
          id v15 = [v14 objectForKey:@"BuildNumber"];
          if (v15)
          {
            id v16 = v15;
            if (!v10 || [v15 compare:v10 options:64] != (id)-1)
            {
              if (v31 || ([v13 wasLocal] & 1) != 0)
              {
                delegate = self->_delegate;
                id v18 = [v13 state];
                [v13 state];
                [(FudPluginDelegate *)delegate log:5, @"%s: found Asset. state=%d %@", v7, v18, MAStringForMAAssetState() format];
                id v9 = v13;
                id v10 = v16;
              }
              else
              {
                uint64_t v29 = self->_delegate;
                id v30 = v10;
                CFStringRef v19 = self;
                int v20 = v7;
                uint64_t v21 = v9;
                id v22 = [v13 state];
                [v13 state];
                id v27 = v22;
                id v9 = v21;
                id v7 = v20;
                self = v19;
                id v10 = v30;
                [(FudPluginDelegate *)v29 log:7, @"%s: skipping asset %@ because it is not installed (state = %d %@)", v7, v16, v27, MAStringForMAAssetState() format];
              }
            }
          }
          else
          {
            [(FudPluginDelegate *)self->_delegate log:4, @"%s: Asset has no %@ key: %@", v7, v13, @"BuildNumber", v28 format];
          }
        }
        else
        {
          [(FudPluginDelegate *)self->_delegate log:4, @"%s: Asset has no attributes: %@", v7, v13, v26, v28 format];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
  }
  if (v31)
  {
    [(FudPluginDelegate *)self->_delegate log:5, @"%s: _maxRemoteBuildNumber was '%@' is now '%@'", v7, self->_maxRemoteBuildNumber, v10 format];
    [(Haywire *)self setMaxRemoteBuildNumber:v10];
  }
  else
  {
    id v23 = [v9 state];
    uint64_t v24 = self->_delegate;
    if (v23 == (id)1)
    {
      [(FudPluginDelegate *)v24 log:5, @"%s: _maxLocalBuildNumber was '%@' is now '%@'", v7, self->_maxLocalBuildNumber, v10 format];
      [(Haywire *)self setMaxLocalBuildNumber:v10];
    }
    else
    {
      -[FudPluginDelegate log:format:](v24, "log:format:", 3, @"%s: _maxLocalBuildNumber was '%@' unchanged because '%@' is not installed. maxAsset.state = %d:\n%@", v7, self->_maxLocalBuildNumber, v10, [v9 state], v9);
    }
  }
  return v9;
}

- (void)cleanupAssets
{
  unsigned int v3 = [(Haywire *)self findLocalAsset];
  assetResults = self->_assetResults;
  if (!assetResults)
  {
    id v27 = sub_10000261C(4001, @"_assetResults are nil", v4, v5, v6, v7, v8, v9, (uint64_t)v28);
    [(Haywire *)self setError:v27];
    return;
  }
  if (!v3)
  {
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 5, @"%s: no local assets found.", "-[Haywire cleanupAssets]");
    return;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = [(NSArray *)assetResults countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(assetResults);
      }
      id v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      if ([v15 wasPurgeable])
      {
        id v16 = [v15 attributes];
        if (!v16)
        {
          CFStringRef v26 = @"attributes is nil";
LABEL_22:
          [(Haywire *)self setError:sub_10000261C(4001, (uint64_t)v26, (uint64_t)maxLocalBuildNumber, v18, v19, v20, v21, v22, (uint64_t)v28)];
          return;
        }
        id v23 = [v16 objectForKey:@"BuildNumber"];
        if (!v23)
        {
          CFStringRef v26 = @"buildNumber is nil";
          goto LABEL_22;
        }
        maxLocalBuildNumber = self->_maxLocalBuildNumber;
        if (!maxLocalBuildNumber)
        {
          CFStringRef v26 = @"_maxLocalBuildNumber is nil";
          goto LABEL_22;
        }
        id v24 = v23;
        if ([v23 compare:maxLocalBuildNumber options:64] == (id)-1)
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100004B10;
          v29[3] = &unk_10009D028;
          v29[4] = self;
          v29[5] = v24;
          [v15 purgeWithError:v29];
        }
        else
        {
          delegate = self->_delegate;
          [v15 state];
          [v15 state];
          MAStringForMAAssetState();
          uint64_t v28 = "-[Haywire cleanupAssets]";
          [(FudPluginDelegate *)delegate log:5 format:@"%s: not purging current=%@, max=%@ state=%d %@."];
        }
      }
      if (v12 == (id)++v14)
      {
        id v12 = [(NSArray *)assetResults countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v12) {
          goto LABEL_5;
        }
        return;
      }
    }
  }
}

- (NSString)maxLocalBuildNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMaxLocalBuildNumber:(id)a3
{
}

- (NSString)maxRemoteBuildNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMaxRemoteBuildNumber:(id)a3
{
}

- (NSString)chipID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setChipID:(id)a3
{
}

- (NSString)boardID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBoardID:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (NSArray)assetResults
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAssetResults:(id)a3
{
}

- (NSMutableDictionary)outOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutOptions:(id)a3
{
}

- (MAAsset)firmwareAsset
{
  return (MAAsset *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirmwareAsset:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOptions:(id)a3
{
}

@end