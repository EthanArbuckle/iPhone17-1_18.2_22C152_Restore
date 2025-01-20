@interface USBCAccessoryFirmwareUpdater
+ (BOOL)getEarlyBootList:(id)a3 delegate:(id)a4;
- (BOOL)shouldUpdateBeSilent:(id)a3;
- (NSDictionary)options;
- (NSMutableDictionary)firmwareAssetProperties;
- (NSMutableDictionary)installedHardwareFirmwareProperties;
- (NSNumber)registryEntryID;
- (NSString)description;
- (NSString)fwAssetPath;
- (USBCAccessoryFirmwareUpdater)initWithCoder:(id)a3;
- (USBCAccessoryFirmwareUpdater)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (USBCFirmwareUpdater)firmwareUpdater;
- (id)buildFirmwareUpdaterObject;
- (id)retrievePlistDeviceEntryFromDeviceClass:(id)a3;
- (unsigned)getConnectionForRegistryID:(int64_t *)a3;
- (unsigned)getServiceForRegistryID:(int64_t *)a3;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)attemptErrorRecovery:(id)a3 delegate:(id)a4;
- (void)bootstrapWithOptions:(id)a3;
- (void)dealloc;
- (void)disconnectTimer:(id)a3;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)getFWAssetInfo;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirmwareAssetProperties:(id)a3;
- (void)setFirmwareUpdater:(id)a3;
- (void)setFwAssetPath:(id)a3;
- (void)setInstalledHardwareFirmwareProperties:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPreferredFirmwarePartition:(BOOL)a3;
@end

@implementation USBCAccessoryFirmwareUpdater

- (void)getFWAssetInfo
{
  v3 = +[NSString stringWithUTF8String:"com.apple.MobileAccessoryUpdater.USBCAccessoryUpdaterService"];
  v4 = +[NSBundle bundleWithIdentifier:v3];

  if (self->_firmwareAssetProperties)
  {
    if (v4)
    {
LABEL_3:
      v5 = [v4 resourcePath];
      [(NSMutableDictionary *)self->_firmwareAssetProperties setObject:v5 forKeyedSubscript:@"Firmware Asset Path"];

      goto LABEL_6;
    }
  }
  else
  {
    v6 = +[NSMutableDictionary dictionary];
    firmwareAssetProperties = self->_firmwareAssetProperties;
    self->_firmwareAssetProperties = v6;

    if (v4) {
      goto LABEL_3;
    }
  }
  [(NSMutableDictionary *)self->_firmwareAssetProperties setObject:@"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework/XPCServices/USBCAccessoryUpdaterService.xpc/Contents/Resources" forKeyedSubscript:@"Firmware Asset Path"];
LABEL_6:

  firmwareUpdater = self->_firmwareUpdater;
  v9 = [(NSMutableDictionary *)self->_firmwareAssetProperties objectForKeyedSubscript:@"Firmware Asset Path"];
  id v12 = [(USBCFirmwareUpdater *)firmwareUpdater FirmwareFilename:v9];

  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - Firmware filename: %@", "-[USBCAccessoryFirmwareUpdater getFWAssetInfo]", v12);
  v10 = +[NSData dataWithContentsOfFile:v12];
  [(NSMutableDictionary *)self->_firmwareAssetProperties setObject:v10 forKeyedSubscript:@"Firmware Asset File"];
  v11 = +[NSNumber numberWithLong:[(USBCFirmwareUpdater *)self->_firmwareUpdater FirmwareFileVersion:v10]];
  [(NSMutableDictionary *)self->_firmwareAssetProperties setObject:v11 forKeyedSubscript:@"Firmware Asset Version"];
}

- (id)buildFirmwareUpdaterObject
{
  v2 = self;
  CFDictionaryRef v3 = IORegistryEntryIDMatching([(NSNumber *)self->_registryEntryID unsignedLongLongValue]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v3);
  if ([(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.USBCBillboard-HDMI"]
    && [(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.USBCBillboard-VGA"])
  {
    if ([(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.ThunderboltType1Switch"]&& [(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.ThunderboltType2Switch"])
    {
      if ([(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.USBCSDCardReader"])
      {
        if ([(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.USBCHDMIAdapter"])
        {
          goto LABEL_11;
        }
        v5 = USBCHDMIAdapterFirmwareUpdater;
      }
      else
      {
        v5 = USBCSDCardReaderFirmwareUpdater;
      }
    }
    else
    {
      v5 = USBCThunderboltFirmwareUpdater;
    }
  }
  else
  {
    v5 = USBCUSBFirmwareUpdater;
  }
  v6 = (USBCFirmwareUpdater *)[[v5 alloc] initWithRegistryEntry:MatchingService andDelegate:v2->_delegate andControllers:v2->_pdControllers];
  firmwareUpdater = v2->_firmwareUpdater;
  v2->_firmwareUpdater = v6;

LABEL_11:
  v8 = &CFRelease_ptr;
  if (v2->_firmwareUpdater)
  {
    if ([(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.USBCSDCardReader"]
      && [(NSString *)v2->_deviceClass compare:@"com.apple.mau.plugin.usbcupdater.USBCHDMIAdapter"])
    {
      [(USBCAccessoryFirmwareUpdater *)v2 getFWAssetInfo];
    }
    v9 = 0;
    int v10 = 0;
    v26 = v2;
    while (1)
    {
      v11 = [(USBCFirmwareUpdater *)v2->_firmwareUpdater validateDevice:v2->_installedHardwareFirmwareProperties withFirmware:v2->_firmwareAssetProperties];

      if (!v11) {
        break;
      }
      uint64_t v12 = (uint64_t)[v11 code];
      v13 = [v8[106] dictionary];
      id v14 = v11;
      for (i = v14; ; i = v19)
      {
        unint64_t v16 = v12 >> 8;
        if ((unint64_t)(v12 >> 8) <= 0x26 && ((1 << SBYTE1(v12)) & 0x4200000800) != 0) {
          break;
        }
        v18 = [i userInfo];
        v19 = [v18 objectForKeyedSubscript:@"Previous Error Response"];

        if (!v19)
        {
          i = 0;
          break;
        }
        uint64_t v12 = (uint64_t)[v19 code];
      }
      [v13 setObject:v14 forKeyedSubscript:@"Previous Error Response"];
      v20 = +[NSString stringWithFormat:@"Failed to validate connected device: %@", v26->_deviceClass];
      [v13 setObject:v20 forKeyedSubscript:@"Notes"];

      v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13568 userInfo:v13];

      if (v16 <= 0x26 && ((1 << v16) & 0x4200000800) != 0)
      {

        v2 = v26;
        v8 = &CFRelease_ptr;
        if (v9) {
          goto LABEL_34;
        }
        break;
      }
      usleep(0x7A120u);

      ++v10;
      v2 = v26;
      v8 = &CFRelease_ptr;
      if (v10 == 5)
      {
        if (v9) {
          goto LABEL_34;
        }
        break;
      }
    }
    [(USBCFirmwareUpdater *)v2->_firmwareUpdater setDelegate:v2->_delegate];
    [(USBCFirmwareUpdater *)v2->_firmwareUpdater setOverrideFile:@"/var/usbc_updater_override.plist"];
  }
  else
  {
    v21 = +[NSMutableDictionary dictionary];
    v22 = +[NSString stringWithFormat:@"Failed to create Firmware Updater for assetType: %@", v2->_deviceClass];
    [v21 setObject:v22 forKeyedSubscript:@"Notes"];

    v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:10240 userInfo:v21];

    if (v9)
    {
LABEL_34:
      v23 = [v8[106] dictionary];
      [v23 setObject:v9 forKeyedSubscript:@"Previous Error Response"];
      v24 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13568 userInfo:v23];

      goto LABEL_37;
    }
  }
  v24 = 0;
LABEL_37:
  return v24;
}

- (void)attemptErrorRecovery:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = v6;
  v8 = [(USBCFirmwareUpdater *)self->_firmwareUpdater pdAccess];
  objc_msgSend(v7, "log:format:", 7, @"Entering: %s:%d", "-[USBCAccessoryFirmwareUpdater attemptErrorRecovery:delegate:]", 440);
  if (v14)
  {
    v9 = v14;
    do
    {
      int v10 = [v9 userInfo];
      [v9 code];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"Previous Error Response"];

      v9 = (void *)v11;
    }
    while (v11);
  }
  id v12 = [(USBCFirmwareUpdater *)self->_firmwareUpdater ExitUpdateMode:1];
  v13 = [v8 VerifyEmptyPortAndReset:v14];
  [v7 log:7, @"%s - VerifyEmptyPortAndReset gave: %@", "-[USBCAccessoryFirmwareUpdater attemptErrorRecovery:delegate:]", v13 format];
}

- (USBCAccessoryFirmwareUpdater)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  id v10 = a3;
  id obj = a4;
  id v11 = a4;
  id v12 = a6;
  v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  [v11 log:7, @"Initializing %@ version %s for DeviceClass %@ with options %@", v14, "0.4", v10, v12 format];

  v58 = v11;
  [v11 log:1, @"Device of type %@ detected", v10 format];
  io_registry_entry_t v15 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v15, @"boot-args", kCFAllocatorDefault, 0);
  v17 = [CFProperty componentsSeparatedByString:@" "];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v18)
  {
    id v19 = v18;
    v53 = CFProperty;
    v54 = a5;
    id v55 = v12;
    char v20 = 0;
    uint64_t v21 = *(void *)v61;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v61 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = [*(id *)(*((void *)&v60 + 1) + 8 * i) componentsSeparatedByString:@"="];
        v24 = [v23 objectAtIndexedSubscript:0];
        v25 = v24;
        if (v24 && ![v24 compare:@"usbcfuddisable"])
        {
          v26 = [v23 objectAtIndexedSubscript:1];
          v27 = v26;
          if (v26 && [v26 compare:@"0"])
          {
            objc_msgSend(v58, "log:format:", 3, @"%s - USB-C FUD Updates Disabled via boot-arg", "-[USBCAccessoryFirmwareUpdater initWithDeviceClass:delegate:info:options:]");
            char v20 = 1;
          }
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v19);

    a5 = v54;
    id v12 = v55;
    if (v20)
    {
LABEL_31:
      v48 = 0;
      if ([(USBCFirmwareUpdater *)self->_firmwareUpdater updaterOperational]) {
        goto LABEL_32;
      }
      goto LABEL_35;
    }
  }
  else
  {
  }
  v59.receiver = self;
  v59.super_class = (Class)USBCAccessoryFirmwareUpdater;
  v28 = [(USBCAccessoryFirmwareUpdater *)&v59 init];
  self = v28;
  if (!v58 || !v10 || !v28)
  {
    CFStringRef v51 = @"Init Failure";
LABEL_30:
    [v58 log:7 format:v51];
    goto LABEL_31;
  }
  inOptions = v28->_inOptions;
  v28->_inOptions = 0;

  deviceClass = self->_deviceClass;
  self->_deviceClass = 0;

  objc_storeStrong((id *)&self->_delegate, obj);
  outOptions = self->_outOptions;
  self->_outOptions = 0;

  lastState = self->_lastState;
  self->_lastState = 0;

  v33 = [v12 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
  registryEntryID = self->_registryEntryID;
  self->_registryEntryID = v33;

  v35 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  installedHardwareFirmwareProperties = self->_installedHardwareFirmwareProperties;
  self->_installedHardwareFirmwareProperties = v35;

  v37 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  firmwareAssetProperties = self->_firmwareAssetProperties;
  self->_firmwareAssetProperties = v37;

  if (!self->_registryEntryID)
  {
    CFStringRef v51 = @"No attached registry ID";
    goto LABEL_30;
  }
  objc_storeStrong((id *)&self->_deviceClass, a3);
  [(NSMutableDictionary *)self->_installedHardwareFirmwareProperties setObject:v10 forKeyedSubscript:@"Hardware Device Class"];
  [(USBCAccessoryFirmwareUpdater *)self setOptions:v12];
  v39 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  v40 = self->_outOptions;
  self->_outOptions = v39;

  delegate = self->_delegate;
  v42 = (objc_class *)objc_opt_class();
  v43 = NSStringFromClass(v42);
  v44 = +[NSString stringWithFormat:@"Initializing Plugin %@ for DeviceClass %@", v43, v10];
  [(FudPluginDelegate *)delegate log:7 format:v44];

  uint64_t v45 = [(USBCAccessoryFirmwareUpdater *)self buildFirmwareUpdaterObject];
  if (v45)
  {
    v48 = (void *)v45;
LABEL_35:
    char v49 = 0;
    goto LABEL_26;
  }
  v46 = [v12 objectForKey:@"UseDropboxLocation"];
  unsigned int v47 = [v46 BOOLValue];

  if (v47) {
    [(NSMutableDictionary *)self->_installedHardwareFirmwareProperties setObject:&__kCFBooleanTrue forKey:@"UseDropboxLocation"];
  }
  *a5 = &off_100027700;
  [v58 log:7, @"%s:\n deviceClass=%@\n registryID=%@", "-[USBCAccessoryFirmwareUpdater initWithDeviceClass:delegate:info:options:]", v10, self->_registryEntryID format];
  v48 = 0;
  if ([(USBCFirmwareUpdater *)self->_firmwareUpdater updaterOperational]) {
    goto LABEL_27;
  }
  char v49 = 1;
LABEL_26:
  [v58 log:7, @"%s - returned error: %@", "-[USBCAccessoryFirmwareUpdater initWithDeviceClass:delegate:info:options:]", v48 format];
  [(USBCAccessoryFirmwareUpdater *)self attemptErrorRecovery:v48 delegate:v58];
  if ((v49 & 1) == 0)
  {
LABEL_32:
    [v58 log:1, @"Device of type %@ did not meet requirements for update", v10 format];
    v50 = 0;
    goto LABEL_33;
  }
LABEL_27:
  self = self;
  v50 = self;
LABEL_33:

  return v50;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
  id v5 = a3;
  [(USBCFirmwareUpdater *)self->_firmwareUpdater setDelegate:self->_delegate];
}

+ (BOOL)getEarlyBootList:(id)a3 delegate:(id)a4
{
  return 1;
}

- (void)bootstrapWithOptions:(id)a3
{
  [(USBCAccessoryFirmwareUpdater *)self setOptions:a3];
  lastState = self->_lastState;
  self->_lastState = (NSString *)@"Bootstrapping";

  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - success = %u", "-[USBCAccessoryFirmwareUpdater bootstrapWithOptions:]", 1);
  id v5 = [(NSMutableDictionary *)self->_installedHardwareFirmwareProperties objectForKeyedSubscript:@"Hardware Device Class"];
  [(FudPluginDelegate *)self->_delegate log:7, @"%@ bootstrap was %@", v5, @"successful" format];

  if (![(USBCFirmwareUpdater *)self->_firmwareUpdater updaterOperational])
  {
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - returned error: %@", "-[USBCAccessoryFirmwareUpdater bootstrapWithOptions:]", 0);
    [(USBCAccessoryFirmwareUpdater *)self attemptErrorRecovery:0 delegate:self->_delegate];
  }
  delegate = self->_delegate;
  [(FudPluginDelegate *)delegate didBootstrap:1 info:0 error:0];
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v46 = 0;
  unsigned int v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100007F18;
  v36 = sub_100007F28;
  id v37 = 0;
  [(USBCAccessoryFirmwareUpdater *)self setOptions:v6];
  lastState = self->_lastState;
  self->_lastState = (NSString *)@"Find";

  outOptions = self->_outOptions;
  v9 = +[NSNumber numberWithBool:0];
  [(NSMutableDictionary *)outOptions setValue:v9 forKey:@"UpdateRequired"];

  id v10 = self->_outOptions;
  LODWORD(v11) = 1028443341;
  id v12 = +[NSNumber numberWithFloat:v11];
  [(NSMutableDictionary *)v10 setValue:v12 forKey:@"PrepareWeight"];

  v13 = self->_outOptions;
  LODWORD(v14) = 1062836634;
  io_registry_entry_t v15 = +[NSNumber numberWithFloat:v14];
  [(NSMutableDictionary *)v13 setValue:v15 forKey:@"ApplyWeight"];

  unint64_t v16 = self->_outOptions;
  LODWORD(v17) = 1036831949;
  id v18 = +[NSNumber numberWithFloat:v17];
  [(NSMutableDictionary *)v16 setValue:v18 forKey:@"FinishWeight"];

  if (!v4)
  {
    [(FudPluginDelegate *)self->_delegate log:7 format:@"Searching locally only..."];
    [(FudPluginDelegate *)self->_delegate progress:100.0];
  }
  id v19 = [(NSMutableDictionary *)self->_firmwareAssetProperties objectForKeyedSubscript:@"Firmware Asset Version"];
  char v20 = v19;
  BOOL v21 = v19 && [v19 compare:&off_100027728] && objc_msgSend(v20, "compare:", &off_100027740) != 0;
  *((unsigned char *)v47 + 24) = v21;

  if (objc_opt_respondsToSelector())
  {
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s Calling findFirmware", "-[USBCAccessoryFirmwareUpdater findFirmwareWithOptions:remote:]");
    firmwareUpdater = self->_firmwareUpdater;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100007F30;
    v31[3] = &unk_100024450;
    v31[4] = &v46;
    v31[5] = &v42;
    v31[6] = &v32;
    id v23 = [(USBCFirmwareUpdater *)firmwareUpdater findFirmware:v31 hardware:self->_installedHardwareFirmwareProperties searchRemote:v4];
  }
  v24 = self->_firmwareUpdater;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100007F5C;
  v30[3] = &unk_100024478;
  v30[4] = &v38;
  v30[5] = &v32;
  installedHardwareFirmwareProperties = self->_installedHardwareFirmwareProperties;
  firmwareAssetProperties = self->_firmwareAssetProperties;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100007F7C;
  v29[3] = &unk_1000244A0;
  v29[4] = self;
  id v27 = [(USBCFirmwareUpdater *)v24 validateFirmware:v30 hardware:installedHardwareFirmwareProperties firmware:firmwareAssetProperties progress:v29];
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - firmwareFound = %u, goodToInstall = %u, needsDownload = %u", "-[USBCAccessoryFirmwareUpdater findFirmwareWithOptions:remote:]", *((unsigned __int8 *)v47 + 24), *((unsigned __int8 *)v39 + 24), *((unsigned __int8 *)v43 + 24));
  uint64_t v28 = v33[5];
  if (v28) {
    goto LABEL_12;
  }
  if (![(USBCFirmwareUpdater *)self->_firmwareUpdater updaterOperational])
  {
    uint64_t v28 = v33[5];
LABEL_12:
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - returned error: %@", "-[USBCAccessoryFirmwareUpdater findFirmwareWithOptions:remote:]", v28);
    [(USBCAccessoryFirmwareUpdater *)self attemptErrorRecovery:v33[5] delegate:self->_delegate];
  }
  [(FudPluginDelegate *)self->_delegate didFind:*((unsigned __int8 *)v47 + 24) info:self->_outOptions updateAvailable:*((unsigned __int8 *)v39 + 24) needsDownload:*((unsigned __int8 *)v43 + 24) error:v33[5]];
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  delegate = self->_delegate;
  id v5 = a3;
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s options %@", "-[USBCAccessoryFirmwareUpdater downloadFirmwareWithOptions:]", v5);
  [(USBCAccessoryFirmwareUpdater *)self setOptions:v5];

  lastState = self->_lastState;
  self->_lastState = (NSString *)@"download";

  if (objc_opt_respondsToSelector())
  {
    firmwareUpdater = self->_firmwareUpdater;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000080C0;
    v11[3] = &unk_1000244C8;
    v11[4] = self;
    installedHardwareFirmwareProperties = self->_installedHardwareFirmwareProperties;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000080D8;
    v10[3] = &unk_1000244A0;
    v10[4] = self;
    id v9 = [(USBCFirmwareUpdater *)firmwareUpdater downloadFirmware:v11 hardware:installedHardwareFirmwareProperties progress:v10];
  }
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  delegate = self->_delegate;
  id v5 = a3;
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s options %@", "-[USBCAccessoryFirmwareUpdater prepareFirmwareWithOptions:]", v5);
  [(USBCAccessoryFirmwareUpdater *)self setOptions:v5];

  lastState = self->_lastState;
  self->_lastState = (NSString *)@"prepare";

  firmwareUpdater = self->_firmwareUpdater;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008208;
  v12[3] = &unk_1000244C8;
  v12[4] = self;
  installedHardwareFirmwareProperties = self->_installedHardwareFirmwareProperties;
  firmwareAssetProperties = self->_firmwareAssetProperties;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008364;
  v11[3] = &unk_1000244A0;
  v11[4] = self;
  id v10 = [(USBCFirmwareUpdater *)firmwareUpdater prepareFirmware:v12 hardware:installedHardwareFirmwareProperties firmware:firmwareAssetProperties progress:v11];
}

- (void)applyFirmwareWithOptions:(id)a3
{
  delegate = self->_delegate;
  id v5 = a3;
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s options %@", "-[USBCAccessoryFirmwareUpdater applyFirmwareWithOptions:]", v5);
  [(USBCAccessoryFirmwareUpdater *)self setOptions:v5];

  lastState = self->_lastState;
  self->_lastState = (NSString *)@"apply";

  firmwareUpdater = self->_firmwareUpdater;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008494;
  v12[3] = &unk_1000244C8;
  v12[4] = self;
  installedHardwareFirmwareProperties = self->_installedHardwareFirmwareProperties;
  firmwareAssetProperties = self->_firmwareAssetProperties;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000085F0;
  v11[3] = &unk_1000244A0;
  v11[4] = self;
  id v10 = [(USBCFirmwareUpdater *)firmwareUpdater applyFirmware:v12 hardware:installedHardwareFirmwareProperties firmware:firmwareAssetProperties progress:v11];
}

- (void)finishWithOptions:(id)a3
{
  delegate = self->_delegate;
  id v5 = a3;
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s options %@", "-[USBCAccessoryFirmwareUpdater finishWithOptions:]", v5);
  [(USBCAccessoryFirmwareUpdater *)self setOptions:v5];

  lastState = self->_lastState;
  self->_lastState = (NSString *)@"finish";

  firmwareUpdater = self->_firmwareUpdater;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008720;
  v12[3] = &unk_1000244C8;
  v12[4] = self;
  installedHardwareFirmwareProperties = self->_installedHardwareFirmwareProperties;
  firmwareAssetProperties = self->_firmwareAssetProperties;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000088C4;
  v11[3] = &unk_1000244A0;
  v11[4] = self;
  id v10 = [(USBCFirmwareUpdater *)firmwareUpdater finishFirmware:v12 hardware:installedHardwareFirmwareProperties firmware:firmwareAssetProperties progress:v11];
}

- (BOOL)shouldUpdateBeSilent:(id)a3
{
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - silent = %u", "-[USBCAccessoryFirmwareUpdater shouldUpdateBeSilent:]", 0);
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)USBCAccessoryFirmwareUpdater;
  [(USBCAccessoryFirmwareUpdater *)&v2 dealloc];
}

- (void)disconnectTimer:(id)a3
{
  a3;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(FudPluginDelegate *)self->_delegate accessoryDisconnected:0];
  }
  _objc_release_x1();
}

- (USBCAccessoryFirmwareUpdater)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)USBCAccessoryFirmwareUpdater;
  id v5 = [(USBCAccessoryFirmwareUpdater *)&v24 init];
  if (v5)
  {
    freopen("/tmp/FUD_A119_attempt.txt", "a", __stdoutp);
    freopen("/tmp/FUD_A119_attempt_err.txt", "a", __stderrp);
    delegate = v5->_delegate;
    v5->_delegate = 0;

    uint64_t v7 = [v4 decodeObjectForKey:@"DeviceClass"];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"Options"];
    inOptions = v5->_inOptions;
    v5->_inOptions = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectForKey:@"OutOptions"];
    outOptions = v5->_outOptions;
    v5->_outOptions = (NSMutableDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectForKey:@"LastState"];
    lastState = v5->_lastState;
    v5->_lastState = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectForKey:@"RegistryID"];
    registryEntryID = v5->_registryEntryID;
    v5->_registryEntryID = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectForKey:@"InstalledHardwareFirmwareProperties"];
    installedHardwareFirmwareProperties = v5->_installedHardwareFirmwareProperties;
    v5->_installedHardwareFirmwareProperties = (NSMutableDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectForKey:@"FirmwareAssetProperties"];
    firmwareAssetProperties = v5->_firmwareAssetProperties;
    v5->_firmwareAssetProperties = (NSMutableDictionary *)v19;

    id v21 = [(USBCAccessoryFirmwareUpdater *)v5 buildFirmwareUpdaterObject];
    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  inOptions = self->_inOptions;
  id v5 = a3;
  [v5 encodeObject:inOptions forKey:@"Options"];
  [v5 encodeObject:self->_outOptions forKey:@"OutOptions"];
  [v5 encodeObject:self->_lastState forKey:@"LastState"];
  [v5 encodeObject:self->_deviceClass forKey:@"DeviceClass"];
  [v5 encodeObject:self->_registryEntryID forKey:@"RegistryID"];
  [v5 encodeObject:self->_installedHardwareFirmwareProperties forKey:@"InstalledHardwareFirmwareProperties"];
  [v5 encodeObject:self->_firmwareAssetProperties forKey:@"FirmwareAssetProperties"];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<USBCAccessoryFirmwareUpdater: %p>={_delegate=%@ _inOptions=%@ _deviceClass=%@ _outOptions=%@ }", self, self->_delegate, self->_inOptions, self->_deviceClass, self->_outOptions];
}

- (unsigned)getServiceForRegistryID:(int64_t *)a3
{
  *a3 = 0;
  id v5 = [(USBCAccessoryFirmwareUpdater *)self registryEntryID];
  CFDictionaryRef v6 = IORegistryEntryIDMatching((uint64_t)[v5 unsignedLongLongValue]);

  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
  [(FudPluginDelegate *)self->_delegate log:7, @"IOServiceGetMatchingService ioService=%u", MatchingService format];
  if (MatchingService)
  {
    CFMutableDictionaryRef properties = 0;
    uint64_t v8 = IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0);
    [(FudPluginDelegate *)self->_delegate log:7, @"service=%u retVal=0x%0x properties=%@ ", MatchingService, v8, properties format];
    CFRelease(properties);
  }
  else
  {
    *a3 = 2;
  }
  return MatchingService;
}

- (unsigned)getConnectionForRegistryID:(int64_t *)a3
{
  io_connect_t connect = 0;
  *a3 = 0;
  unsigned int result = -[USBCAccessoryFirmwareUpdater getServiceForRegistryID:](self, "getServiceForRegistryID:");
  if (result)
  {
    io_object_t v6 = result;
    uint64_t v7 = IOServiceOpen(result, mach_task_self_, 0, &connect);
    [(FudPluginDelegate *)self->_delegate log:7, @"IOServiceOpen retVal=0x%0x ioConnection=%u", v7, connect format];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = connect == 0;
    }
    if (v8) {
      *a3 = 3;
    }
    IOObjectRelease(v6);
    return connect;
  }
  return result;
}

- (id)retrievePlistDeviceEntryFromDeviceClass:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.USBCAccessoryFirmwareUpdater"];
  id v5 = v4;
  if (!v4)
  {
    io_object_t v6 = 0;
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  io_object_t v6 = [v4 objectForInfoDictionaryKey:@"MobileAccessoryUpdaterProperties"];
  id v4 = [v6 objectForKey:@"MatchingDevices"];
  uint64_t v7 = v4;
  if (!v4)
  {
LABEL_8:
    BOOL v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  BOOL v8 = +[NSPredicate predicateWithFormat:@"DeviceClass = %@", v3];
  id v4 = [v7 filteredArrayUsingPredicate:v8];
  uint64_t v9 = v4;
  if (v4)
  {
    id v4 = [v4 count];
    if (v4)
    {
      id v4 = [v9 firstObject];
    }
  }
LABEL_6:
  id v10 = v4;

  return v10;
}

- (void)setPreferredFirmwarePartition:(BOOL)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSMutableDictionary)installedHardwareFirmwareProperties
{
  return self->_installedHardwareFirmwareProperties;
}

- (void)setInstalledHardwareFirmwareProperties:(id)a3
{
}

- (NSMutableDictionary)firmwareAssetProperties
{
  return self->_firmwareAssetProperties;
}

- (void)setFirmwareAssetProperties:(id)a3
{
}

- (USBCFirmwareUpdater)firmwareUpdater
{
  return self->_firmwareUpdater;
}

- (void)setFirmwareUpdater:(id)a3
{
}

- (NSNumber)registryEntryID
{
  return self->_registryEntryID;
}

- (NSString)fwAssetPath
{
  return self->_fwAssetPath;
}

- (void)setFwAssetPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fwAssetPath, 0);
  objc_storeStrong((id *)&self->_registryEntryID, 0);
  objc_storeStrong((id *)&self->_pdControllers, 0);
  objc_storeStrong((id *)&self->_firmwareAssetProperties, 0);
  objc_storeStrong((id *)&self->_installedHardwareFirmwareProperties, 0);
  objc_storeStrong((id *)&self->_lastState, 0);
  objc_storeStrong((id *)&self->_outOptions, 0);
  objc_storeStrong((id *)&self->mobileAssetType, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_inOptions, 0);
  objc_storeStrong((id *)&self->_firmwareUpdater, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end