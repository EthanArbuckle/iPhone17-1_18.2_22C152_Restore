@interface USBCSimpleUVDMFirmwareUpdater
- (BOOL)hasSleepAssertion;
- (BOOL)isManifestCommand;
- (BOOL)pingDevice;
- (BOOL)useDropboxLocation;
- (MobileAsset)mobileAsset;
- (NSData)firmware;
- (USBCSimpleUVDMFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3;
- (double)initialDelay;
- (id)DeviceSerialNumber;
- (id)DeviceSerialNumber:(BOOL)a3;
- (id)DeviceSerialNumberForController:(id)a3;
- (id)EnterUpdateMode;
- (id)ExitUpdateMode:(BOOL)a3;
- (id)FirmwareFilename:(id)a3;
- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)checkForEntryForSerialNumber:(id)a3 inSavedAccInfo:(id)a4 needsReplacement:(BOOL)a5;
- (id)enableFirmwareUpdate;
- (id)executeUVDM:(id)a3 header:(unsigned __int16)a4 svid:(unsigned __int16)a5 data:(unsigned int *)a6 size:(char *)a7 sop:(int)a8 response:(BOOL)a9;
- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)getAccessoryFWStagedInfoForSerialNum:(id)a3;
- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)queryPredicate;
- (id)sendFirmwareBlock:(id)a3 atOffset:(unsigned int)a4;
- (id)setWriteOffset:(unsigned int)a3 length:(unsigned __int8)a4;
- (id)validateDevice:(id)a3 withFirmware:(id)a4;
- (int)holdSleepAssertion;
- (int)releaseSleepAssertion;
- (int)setCFUpForController:(id)a3 enable:(BOOL)a4;
- (unsigned)DeviceFirmwareVersion;
- (unsigned)sleepAssertionId;
- (void)createUSBDevice;
- (void)getFWFromURL:(id)a3;
- (void)saveAccessoryFWStagedInfo;
- (void)setFirmware:(id)a3;
- (void)setHasSleepAssertion:(BOOL)a3;
- (void)setInitialDelay:(double)a3;
- (void)setIsManifestCommand:(BOOL)a3;
- (void)setMobileAsset:(id)a3;
- (void)setSleepAssertionId:(unsigned int)a3;
- (void)setUseDropboxLocation:(BOOL)a3;
@end

@implementation USBCSimpleUVDMFirmwareUpdater

- (USBCSimpleUVDMFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)USBCSimpleUVDMFirmwareUpdater;
  v3 = [(USBCFirmwareUpdater *)&v8 initWithRegistryEntry:*(void *)&a3];
  v4 = v3;
  if (v3)
  {
    v3->_initialDelay = 0.0;
    v3->_USBDevice = 0;
    v3->_hasSleepAssertion = 0;
    v3->_useDropboxLocation = 0;
    v3->_isManifestCommand = 0;
    v5 = [[MobileAsset alloc] initWithDelegate:v3];
    mobileAsset = v4->_mobileAsset;
    v4->_mobileAsset = v5;
  }
  return v4;
}

- (id)validateDevice:(id)a3 withFirmware:(id)a4
{
  CFMutableDictionaryRef properties = 0;
  if ([(USBCSimpleUVDMFirmwareUpdater *)self holdSleepAssertion]
    || (!IORegistryEntryCreateCFProperties(self->super._registryEntry, &properties, kCFAllocatorDefault, 0)
      ? (BOOL v5 = properties == 0)
      : (BOOL v5 = 1),
        v5))
  {
    v6 = 0;
    v19 = 0;
    v13 = 0;
    v25 = 0;
    v12 = 0;
    v9 = 0;
    goto LABEL_28;
  }
  v6 = properties;
  if (!self->super._hardwareProperties)
  {
    v7 = +[NSMutableDictionary dictionary];
    hardwareProperties = self->super._hardwareProperties;
    self->super._hardwareProperties = v7;
  }
  v9 = [(__CFDictionary *)v6 objectForKey:@"bcdDevice"];
  if (!v9)
  {
    v19 = 0;
    v13 = 0;
    v25 = 0;
    v12 = 0;
    goto LABEL_28;
  }
  [(NSMutableDictionary *)self->super._hardwareProperties setObject:v9 forKey:@"Hardware Installed firmware version"];
  id v10 = objc_alloc_init((Class)NSNumberFormatter);
  [v10 setNumberStyle:1];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%x", [v9 unsignedIntValue]);
  id v28 = v10;
  v12 = [v10 numberFromString:v11];

  self->_firmwareVersionMajor = [v12 unsignedIntValue] / 0x3E8;
  self->_firmwareVersionMinor = (656 * ([v12 unsignedIntValue] % 0x3E8)) >> 16;
  self->_firmwareVersionRelease = [v12 unsignedIntValue] % 0x64;
  [(FudPluginDelegate *)self->super._delegate log:7, @"Accessory requires initial delay of %f seconds", *(void *)&self->_initialDelay format];
  +[NSThread sleepForTimeInterval:self->_initialDelay];
  [(FudPluginDelegate *)self->super._delegate log:7, @"Continuing after initial delay of %f seconds", *(void *)&self->_initialDelay format];
  v13 = [(__CFDictionary *)v6 objectForKey:@"USB Serial Number"];
  if (!v13)
  {
    v19 = 0;
    goto LABEL_27;
  }
  v27 = v6;
  [(NSMutableDictionary *)self->super._hardwareProperties setObject:v13 forKey:@"Hardware S/N"];
  [(FudPluginDelegate *)self->super._delegate log:7, @"Current FW version on for S/N %@: %d.%d.%d", v13, self->_firmwareVersionMajor, self->_firmwareVersionMinor, self->_firmwareVersionRelease format];
  v14 = +[PDController knownPDControllers];
  pdControllers = self->super._pdControllers;
  self->super._pdControllers = v14;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v16 = self->super._pdControllers;
  id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    v19 = 0;
    uint64_t v20 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (v19) {

        }
        v23 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumberForController:v22];
        v19 = v23;
        if (v23 && ![v23 compare:v13])
        {
          [(FudPluginDelegate *)self->super._delegate log:7, @"Found _pdController for S/N %@", v13 format];
          objc_storeStrong((id *)&self->super._pdController, v22);
          goto LABEL_24;
        }
      }
      id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_24:

  if (!self->super._pdController)
  {
    v6 = v27;
LABEL_27:
    v25 = v28;
LABEL_28:
    v24 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8448 userInfo:0];
    goto LABEL_29;
  }
  v24 = 0;
  v6 = v27;
  v25 = v28;
LABEL_29:
  if ([(USBCSimpleUVDMFirmwareUpdater *)self releaseSleepAssertion] && !v24)
  {
    v24 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8448 userInfo:0];
  }

  return v24;
}

- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  id v10 = (void (**)(id, void, void *))a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_useDropboxLocation)
  {
    id v18 = 0;
    goto LABEL_4;
  }
  v14 = [(MobileAsset *)self->_mobileAsset asset];
  v15 = [v14 getLocalFileUrl];
  v16 = [(MobileAsset *)self->_mobileAsset fwBundleFileName];
  id v17 = [v15 URLByAppendingPathComponent:v16];
  id v18 = [v17 filePathURL];

  if (v18)
  {
    [(USBCSimpleUVDMFirmwareUpdater *)self getFWFromURL:v18];
    if (self->_firmware)
    {
LABEL_4:
      v19 = 0;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  v19 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
  if (v10) {
LABEL_5:
  }
    v10[2](v10, 0, v19);
LABEL_6:

  return v19;
}

- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  id v10 = (void (**)(id, void, void *))a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void, double))a6;
  memset(v33, 0, sizeof(v33));
  int v34 = 0;
  char v32 = 1;
  v14 = &selRef_flashFirmwareToDevice_;
  if (self->super._updaterOperational)
  {
    if (!self->_firmware)
    {
      v24 = 0;
      v21 = 0;
      goto LABEL_32;
    }
    id v30 = v12;
    long long v31 = v10;
    delegate = self->super._delegate;
    v16 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
    id v17 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)delegate log:1, @"Accessory firmware update started: %@ with S/N %@", v16, v17 format];

    [(FudPluginDelegate *)self->super._delegate log:7 format:@"=-=-=-=-=-=-=-=-=-=-=-=- Sending Firmware Update Start Command =-=-=-=-=-=-=-=-=-=-=-=-"];
    uint64_t v18 = [(USBCSimpleUVDMFirmwareUpdater *)self enableFirmwareUpdate];
    if (v18
      || ([(FudPluginDelegate *)self->super._delegate log:7 format:@"=-=-=-=-=-=-=-=-=-=-=-=- Setting Write Offset =-=-=-=-=-=-=-=-=-=-=-=-"], [(USBCSimpleUVDMFirmwareUpdater *)self setWriteOffset:0 length:1], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = (void *)v18;
      v21 = 0;
LABEL_31:
      id v12 = v30;
LABEL_32:
      v14 = &selRef_flashFirmwareToDevice_;
      goto LABEL_23;
    }
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"=-=-=-=-=-=-=-=-=-=-=-=- Sending Firmware Payload =-=-=-=-=-=-=-=-=-=-=-=-"];
    if ([(NSData *)self->_firmware length])
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      v21 = 0;
      while (1)
      {

        if ([(NSData *)self->_firmware length] - v20 <= 0x80) {
          unsigned int v22 = [(NSData *)self->_firmware length] - v20;
        }
        else {
          unsigned int v22 = 128;
        }
        v21 = -[NSData subdataWithRange:](self->_firmware, "subdataWithRange:", v19, v22);
        if (!v21)
        {
          v24 = 0;
          goto LABEL_30;
        }
        [(FudPluginDelegate *)self->super._delegate log:7, @"Sending BlockAddress: %d", v20 format];
        uint64_t v23 = [(USBCSimpleUVDMFirmwareUpdater *)self sendFirmwareBlock:v21 atOffset:v20];
        if (v23) {
          break;
        }
        uint64_t v19 = v22 + v20;
        if (v13) {
          v13[2](v13, (double)v19 / (double)[(NSData *)self->_firmware length] * 100.0);
        }
        uint64_t v20 = v22 + v20;
        if ([(NSData *)self->_firmware length] <= v19) {
          goto LABEL_17;
        }
      }
      v24 = (void *)v23;
LABEL_30:
      id v10 = v31;
      goto LABEL_31;
    }
    v21 = 0;
LABEL_17:
    +[NSThread sleepForTimeInterval:0.1];
    [(FudPluginDelegate *)self->super._delegate log:1 format:@"=-=-=-=-=-=-=-=-=-=-=-=- Sending Manifest Command =-=-=-=-=-=-=-=-=-=-=-=-"];
    v14 = &selRef_flashFirmwareToDevice_;
    self->_isManifestCommand = 1;
    char v32 = 0;
    LOBYTE(v29) = 1;
    v24 = [(USBCSimpleUVDMFirmwareUpdater *)self executeUVDM:0 header:399 svid:1452 data:v33 size:&v32 sop:0 response:v29];
    if (v24)
    {
      id v10 = v31;
    }
    else
    {
      if (v32 && !HIDWORD(v33[0]))
      {
        v25 = self->super._delegate;
        v26 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
        v27 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber];
        [(FudPluginDelegate *)v25 log:1, @"Accessory firmware update succeeded: %@ with S/N %@", v26, v27 format];

        [(USBCSimpleUVDMFirmwareUpdater *)self saveAccessoryFWStagedInfo];
        v24 = 0;
      }
      id v10 = v31;
    }
    id v12 = v30;
  }
  else
  {
    v24 = 0;
    v21 = 0;
  }
LABEL_23:
  *((unsigned char *)&self->super.super.isa + *((int *)v14 + 213)) = 0;
  if (v10) {
    v10[2](v10, 0, v24);
  }

  return v24;
}

- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  if (a3) {
    (*((void (**)(id, void, void, id, id, id))a3 + 2))(a3, 0, 0, a4, a5, a6);
  }
  return 0;
}

- (id)EnterUpdateMode
{
  return 0;
}

- (id)ExitUpdateMode:(BOOL)a3
{
  return 0;
}

- (id)DeviceSerialNumber:(BOOL)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];
  }
  else {
  v3 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumberForController:self->super._pdController];
  }
  return v3;
}

- (id)DeviceSerialNumber
{
  return [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber:1];
}

- (id)DeviceSerialNumberForController:(id)a3
{
  memset(v8, 0, sizeof(v8));
  char v7 = 0;
  LOBYTE(v6) = 1;
  v3 = [(USBCSimpleUVDMFirmwareUpdater *)self executeUVDM:a3 header:159 svid:1452 data:v8 size:&v7 sop:0 response:v6];
  if (v3) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_alloc((Class)NSString) initWithBytes:(char *)v8 + 4 length:17 encoding:4];
  }

  return v4;
}

- (unsigned)DeviceFirmwareVersion
{
  v2 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware Installed firmware version"];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)FirmwareFilename:(id)a3
{
  return 0;
}

- (id)queryPredicate
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018160;
  v4[3] = &unk_1000245B8;
  v4[4] = self;
  v2 = +[NSPredicate predicateWithBlock:v4];
  return v2;
}

- (id)checkForEntryForSerialNumber:(id)a3 inSavedAccInfo:(id)a4 needsReplacement:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  id v11 = 0;
  id v28 = v8;
  id v12 = 0;
  if (v8 && v9)
  {
    if ([v9 count])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v13 = v10;
      id v12 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12)
      {
        BOOL v27 = a5;
        v26 = self;
        uint64_t v14 = *(void *)v30;
LABEL_6:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v13);
          }
          v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v16 objectForKey:@"SerialNumber"];
            if (v17)
            {
              uint64_t v18 = (void *)v17;
              uint64_t v19 = [v16 objectForKey:@"SerialNumber"];
              unsigned int v20 = [v19 isEqualToString:v28];

              if (v20) {
                break;
              }
            }
          }
          if (v12 == (id)++v15)
          {
            id v12 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v12) {
              goto LABEL_6;
            }
            id v11 = 0;
            goto LABEL_21;
          }
        }
        id v11 = [v16 objectForKey:@"DateSaved"];
        if (v11)
        {
          v21 = +[NSDate date];
          [v21 timeIntervalSinceDate:v11];
          double v23 = v22;

          double v24 = v23 / 86400.0;
          id v12 = [v16 copy];
          if (v27 || v24 >= 7.0)
          {
            [v13 removeObject:v16];

            if (v24 < 7.0) {
              goto LABEL_22;
            }
            [(FudPluginDelegate *)v26->super._delegate log:7, @"Saved Staged Firmware Info %@ older than %d days (%f sec), discarding", v12, 7, *(void *)&v23 format];
            id v13 = v12;
            id v12 = 0;
          }
        }
        else
        {
          [v13 removeObject:v16];
          id v12 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
LABEL_21:
    }
    else
    {
      id v11 = 0;
      id v12 = 0;
    }
  }
LABEL_22:

  return v12;
}

- (void)saveAccessoryFWStagedInfo
{
  unsigned int v3 = +[NSFileManager defaultManager];
  id v4 = +[NSDate date];
  uint64_t v5 = [(MobileAsset *)self->_mobileAsset fwVersion];
  if (!v5
    || (uint64_t v6 = (void *)v5,
        [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber],
        char v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"No MAAsset FW version available, cannot save staged FW for this accessory"];
    goto LABEL_15;
  }
  uint64_t v8 = [(MobileAsset *)self->_mobileAsset fwVersion];
  id v9 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber];
  id v10 = +[NSString pathWithComponents:&off_100027770];
  id v11 = [v10 stringByAppendingPathComponent:@"StagedFWInfo"];
  v21 = v10;
  double v22 = v3;
  if (![v3 fileExistsAtPath:v11])
  {
    [v3 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
    [v3 createFileAtPath:v11 contents:0 attributes:0];
LABEL_8:
    id v12 = objc_alloc_init((Class)NSMutableArray);
    goto LABEL_9;
  }
  id v12 = [objc_alloc((Class)NSMutableArray) initWithContentsOfFile:v11];
  if (!v12) {
    goto LABEL_8;
  }
LABEL_9:
  id v13 = [(USBCSimpleUVDMFirmwareUpdater *)self checkForEntryForSerialNumber:v9 inSavedAccInfo:v12 needsReplacement:1];
  if (!v13)
  {
    id v13 = +[NSMutableDictionary dictionary];
  }
  [v13 setObject:v9 forKey:@"SerialNumber"];
  [v13 setObject:v8 forKey:@"StagedFW"];
  [v13 setObject:v4 forKey:@"DateSaved"];
  [v12 addObject:v13];
  [(FudPluginDelegate *)self->super._delegate log:7, @"Saving Staged Firmware Info to file: %@", v11 format];
  uint64_t v14 = +[NSURL fileURLWithPath:v11];
  id v23 = 0;
  unsigned __int8 v15 = [v12 writeToURL:v14 error:&v23];
  v16 = (void *)v8;
  id v17 = v23;
  delegate = self->super._delegate;
  if (v15) {
    [(FudPluginDelegate *)delegate log:7, @"Saved Staged Firmware Info %@ to %@", v13, v11, v19, v20 format];
  }
  else {
    -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s: There was an error: %@ while saving Staged Firmware Info: %@ to file: %@", "-[USBCSimpleUVDMFirmwareUpdater saveAccessoryFWStagedInfo]", v17, v13, v14);
  }

  unsigned int v3 = v22;
LABEL_15:
}

- (id)getAccessoryFWStagedInfoForSerialNum:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSFileManager defaultManager];
  uint64_t v6 = +[NSString pathWithComponents:&off_100027788];
  char v7 = [v6 stringByAppendingPathComponent:@"StagedFWInfo"];
  if ([v5 fileExistsAtPath:v7])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithContentsOfFile:v7];
    id v9 = v8;
    if (v8 && [v8 count])
    {
      uint64_t v10 = [(USBCSimpleUVDMFirmwareUpdater *)self checkForEntryForSerialNumber:v4 inSavedAccInfo:v9 needsReplacement:0];
      if (v10)
      {
        id v11 = (void *)v10;
        goto LABEL_6;
      }
      CFStringRef v13 = @"No saved state information for this accessory";
    }
    else
    {
      CFStringRef v13 = @"No saved state information in file";
    }
  }
  else
  {
    id v9 = 0;
    CFStringRef v13 = @"No saved state file";
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:v13];
  id v11 = 0;
LABEL_6:

  return v11;
}

- (int)holdSleepAssertion
{
  if (self->_hasSleepAssertion)
  {
    IOReturn v3 = 0;
    CFStringRef v4 = @"Sleep Assertion already held";
  }
  else
  {
    IOReturn v3 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, @"com.apple.USBCAccessoryFirmwareUpdater.SleepAssertionID", &self->_sleepAssertionId);
    if (v3)
    {
      CFStringRef v4 = @"Failed to hold sleep assertion";
    }
    else
    {
      self->_hasSleepAssertion = 1;
      CFStringRef v4 = @"Held sleep assertion";
    }
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:v4];
  return v3;
}

- (int)releaseSleepAssertion
{
  if (self->_hasSleepAssertion)
  {
    IOReturn v3 = IOPMAssertionRelease(self->_sleepAssertionId);
    if (v3)
    {
      CFStringRef v4 = @"Failed to release sleep assertion";
    }
    else
    {
      self->_hasSleepAssertion = 0;
      CFStringRef v4 = @"Released sleep assertion";
    }
  }
  else
  {
    IOReturn v3 = 0;
    CFStringRef v4 = @"No sleep assertion held to release";
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:v4];
  return v3;
}

- (void)getFWFromURL:(id)a3
{
  id v11 = +[NSBundle bundleWithURL:a3];
  if (v11)
  {
    CFStringRef v4 = [v11 objectForInfoDictionaryKey:@"FirmwareImageFile"];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v4 stringByDeletingPathExtension];
      char v7 = [v5 pathExtension];
      id v8 = [v11 pathForResource:v6 ofType:v7];
      id v9 = +[NSData dataWithContentsOfFile:v8];
      firmware = self->_firmware;
      self->_firmware = v9;
    }
  }
}

- (id)enableFirmwareUpdate
{
  IOReturn v3 = +[NSMutableDictionary dictionary];
  HIBYTE(v7) = 1;
  memset(v8, 0, sizeof(v8));
  int v9 = 0;
  LOBYTE(v7) = 1;
  uint64_t v4 = [(USBCSimpleUVDMFirmwareUpdater *)self executeUVDM:0 header:31 svid:1452 data:v8 size:(char *)&v7 + 7 sop:0 response:v7];
  if (!v4)
  {
    if (HIBYTE(v7) && !HIDWORD(v8[0]))
    {
      uint64_t v5 = 0;
      goto LABEL_5;
    }
    uint64_t v4 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:10752 userInfo:v3];
  }
  uint64_t v5 = (void *)v4;
LABEL_5:

  return v5;
}

- (id)sendFirmwareBlock:(id)a3 atOffset:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  char v24 = 1;
  memset(v25, 0, 28);
  if ((unint64_t)[v6 length] > 0x7F)
  {
    id v12 = [v6 bytes];
    uLong v11 = crc32((uLong)v12, (const Bytef *)0x80, v13);
  }
  else
  {
    uint64_t v7 = +[NSMutableData dataWithData:v6];
    objc_msgSend(v7, "increaseLengthBy:", 128 - objc_msgSend(v6, "length"));
    id v8 = v7;
    id v9 = [v8 bytes];
    uLong v11 = crc32((uLong)v9, (const Bytef *)0x80, v10);
  }
  uint64_t v14 = 0;
  while (1)
  {
    unsigned int v15 = v14;
    if (!v14) {
      goto LABEL_8;
    }
    if (v14 == 5)
    {
      uint64_t v19 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:11520 userInfo:0];
LABEL_22:
      uint64_t v20 = (void *)v19;
      goto LABEL_23;
    }
    [(FudPluginDelegate *)self->super._delegate log:7, @"Retrying: %d time, resending block address %d", v14, v4 format];
    unsigned int v15 = 0;
LABEL_8:
    while ((unint64_t)[v6 length] > v15)
    {
      uint64_t v16 = v15;
      if ([v6 length] - v15 <= 0x18) {
        unsigned int v17 = [v6 length] - v15;
      }
      else {
        unsigned int v17 = 24;
      }
      memset(v25, 0, 28);
      objc_msgSend(v6, "getBytes:range:", v25, v16, v17);
      unsigned int v18 = v17 >> 2;
      if ((v17 & 3) != 0) {
        LOBYTE(v18) = v18 + 1;
      }
      char v23 = v18;
      LOBYTE(v22) = 0;
      uint64_t v19 = [(USBCSimpleUVDMFirmwareUpdater *)self executeUVDM:0 header:((v17 & 0x1F) << 10) | 0x3F svid:1452 data:v25 size:&v23 sop:0 response:v22];
      unsigned int v15 = v17 + v16;
      if (v19) {
        goto LABEL_22;
      }
    }
    memset((char *)v25 + 4, 0, 24);
    LODWORD(v25[0]) = v11;
    char v24 = 1;
    LOBYTE(v22) = 1;
    uint64_t v19 = [(USBCSimpleUVDMFirmwareUpdater *)self executeUVDM:0 header:79 svid:1452 data:v25 size:&v24 sop:0 response:v22];
    if (v19) {
      goto LABEL_22;
    }
    if (v24 && v11 == HIDWORD(v25[0])) {
      break;
    }
    [(FudPluginDelegate *)self->super._delegate log:7, @"FAILED: Manifest CRC Response Mismatch (Attempt %d/%d): expected CRC32 = %d, received = %d", v14, 5, v11, HIDWORD(v25[0]) format];
    uint64_t v14 = (v14 + 1);
    char v24 = 1;
    uint64_t v19 = [(USBCSimpleUVDMFirmwareUpdater *)self setWriteOffset:v4 length:1];
    if (v19) {
      goto LABEL_22;
    }
  }
  uint64_t v20 = 0;
LABEL_23:

  return v20;
}

- (id)setWriteOffset:(unsigned int)a3 length:(unsigned __int8)a4
{
  unsigned int v8 = a3;
  unsigned __int8 v7 = a4;
  LOBYTE(v6) = 0;
  uint64_t v4 = [(USBCSimpleUVDMFirmwareUpdater *)self executeUVDM:0 header:47 svid:1452 data:&v8 size:&v7 sop:0 response:v6];
  return v4;
}

- (int)setCFUpForController:(id)a3 enable:(BOOL)a4
{
  uint64_t v6 = (PDController *)a3;
  pdController = v6;
  if (!v6) {
    pdController = self->super._pdController;
  }
  unsigned int v8 = pdController;
  BOOL v14 = a4;
  if ([(PDController *)v8 registerWrite:&v14 ofLength:1 atAddress:9])
  {
    int v9 = -536870212;
    delegate = self->super._delegate;
    CFStringRef v11 = @"Failed to execute iecsWrite(DATA1) for CFUp enable/disable";
  }
  else
  {
    if (![(PDController *)v8 executeIECSCommand:1128682864])
    {
      int v9 = 0;
      goto LABEL_8;
    }
    int v9 = -536870212;
    delegate = self->super._delegate;
    uInt v13 = "-[USBCSimpleUVDMFirmwareUpdater setCFUpForController:enable:]";
    CFStringRef v11 = @"%s: Failed to execute iecsCommand(CFUp) for CFUp enable/disable";
  }
  -[FudPluginDelegate log:format:](delegate, "log:format:", 3, v11, v13);
LABEL_8:

  return v9;
}

- (id)executeUVDM:(id)a3 header:(unsigned __int16)a4 svid:(unsigned __int16)a5 data:(unsigned int *)a6 size:(char *)a7 sop:(int)a8 response:(BOOL)a9
{
  uint64_t v9 = *(void *)&a8;
  int v12 = a5;
  unsigned int v15 = (PDController *)a3;
  long long v30 = +[NSMutableDictionary dictionary];
  unint64_t v32 = 0;
  __int16 v31 = 0;
  pdController = v15;
  if (!v15) {
    pdController = self->super._pdController;
  }
  int v33 = 0;
  unsigned int v17 = pdController;
  if (self->_isManifestCommand) {
    int v18 = 8000;
  }
  else {
    int v18 = 1000;
  }
  if (!a9) {
    goto LABEL_10;
  }
  if (![(USBCSimpleUVDMFirmwareUpdater *)self setCFUpForController:v17 enable:1])
  {
    if ([(PDController *)v17 receiveVDM:v34 length:28 outSop:&v33 outSequence:(char *)&v31 + 1 outLength:&v32])
    {
      BOOL v24 = 0;
LABEL_26:
      if ([(USBCSimpleUVDMFirmwareUpdater *)self setCFUpForController:v17 enable:0])
      {
        uint64_t v19 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber];
        v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: Failed to executeUVDM for S/N %@ and failed to setCFUp off", "-[USBCSimpleUVDMFirmwareUpdater executeUVDM:header:svid:data:size:sop:response:]", v19);
        uint64_t v20 = v30;
LABEL_31:
        [v20 setObject:v26 forKeyedSubscript:@"Notes"];

        goto LABEL_32;
      }
LABEL_28:
      uint64_t v20 = v30;
      if (v24)
      {
        BOOL v27 = 0;
        goto LABEL_33;
      }
      uint64_t v19 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber];
      v26 = +[NSString stringWithFormat:@"Failed to executeUVDM for S/N %@", v19];
      goto LABEL_31;
    }
LABEL_10:
    v35[0] = a4 & 0x7FFF | (v12 << 16);
    unsigned int v21 = *a7;
    if (v21 <= 6) {
      int v22 = 4 * v21;
    }
    else {
      int v22 = 24;
    }
    __memcpy_chk();
    unsigned int v23 = [(PDController *)v17 sendVDM:v35 length:(v22 + 4) sop:v9];
    BOOL v24 = v23 == 0;
    if (v23) {
      BOOL v25 = 1;
    }
    else {
      BOOL v25 = !a9;
    }
    if (!v25)
    {
      LOBYTE(v31) = HIBYTE(v31);
      +[NSThread sleepForTimeInterval:0.01];
      while (1)
      {
        BOOL v24 = v31 != HIBYTE(v31);
        if (v31 != HIBYTE(v31)
          || [(PDController *)v17 receiveVDM:a6 length:28 outSop:&v33 outSequence:&v31 outLength:&v32])
        {
          break;
        }
        *a7 = v32 >> 2;
        if (v31 != HIBYTE(v31)) {
          +[NSThread sleepForTimeInterval:0.01];
        }
        if (!--v18)
        {
          [(FudPluginDelegate *)self->super._delegate log:7 format:@"Timeout in waiting for VDM response\n"];
          BOOL v24 = 1;
          goto LABEL_26;
        }
      }
    }
    if (!a9) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: Failed to setCFUp on", "-[USBCSimpleUVDMFirmwareUpdater executeUVDM:header:svid:data:size:sop:response:]");
  uint64_t v20 = v30;
  [v30 setObject:v19 forKeyedSubscript:@"Notes"];
LABEL_32:

  BOOL v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:11520 userInfo:v20];
LABEL_33:
  id v28 = v27;

  return v28;
}

- (void)createUSBDevice
{
  kern_return_t v6;
  IOCFPlugInInterface **v7;
  BOOL v8;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v10;
  CFUUIDBytes v11;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;

  theInterface = 0;
  theScore = 0;
  io_service_t registryEntry = self->super._registryEntry;
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  uint64_t v6 = IOCreatePlugInInterfaceForService(registryEntry, v4, v5, &theInterface, &theScore);
  unsigned __int8 v7 = theInterface;
  if (v6) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = theInterface == 0;
  }
  if (!v8)
  {
    QueryInterface = (*theInterface)->QueryInterface;
    uInt v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x5Cu, 0x81u, 0x87u, 0xD0u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0x8Bu, 0x45u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    CFStringRef v11 = CFUUIDGetUUIDBytes(v10);
    ((void (*)(IOCFPlugInInterface **, void, void, IOUSBDeviceStruct942 ***))QueryInterface)(v7, *(void *)&v11.byte0, *(void *)&v11.byte8, &self->_USBDevice);
    unsigned __int8 v7 = theInterface;
  }
  if (v7) {
    ((void (*)(IOCFPlugInInterface **))(*v7)->Release)(v7);
  }
}

- (BOOL)pingDevice
{
  USBDevice = self->_USBDevice;
  if (USBDevice
    || ([(USBCSimpleUVDMFirmwareUpdater *)self createUSBDevice], (USBDevice = self->_USBDevice) != 0))
  {
    __int16 v5 = 192;
    int v6 = 0;
    __int16 v7 = 2;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    ((void (*)(IOUSBDeviceStruct942 **, __int16 *))(*USBDevice)->DeviceRequest)(USBDevice, &v5);
    LOBYTE(USBDevice) = 1;
  }
  return (char)USBDevice;
}

- (NSData)firmware
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFirmware:(id)a3
{
}

- (MobileAsset)mobileAsset
{
  return (MobileAsset *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMobileAsset:(id)a3
{
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (BOOL)hasSleepAssertion
{
  return self->_hasSleepAssertion;
}

- (void)setHasSleepAssertion:(BOOL)a3
{
  self->_hasSleepAssertion = a3;
}

- (BOOL)useDropboxLocation
{
  return self->_useDropboxLocation;
}

- (void)setUseDropboxLocation:(BOOL)a3
{
  self->_useDropboxLocation = a3;
}

- (BOOL)isManifestCommand
{
  return self->_isManifestCommand;
}

- (void)setIsManifestCommand:(BOOL)a3
{
  self->_isManifestCommand = a3;
}

- (unsigned)sleepAssertionId
{
  return self->_sleepAssertionId;
}

- (void)setSleepAssertionId:(unsigned int)a3
{
  self->_sleepAssertionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAsset, 0);
  objc_storeStrong((id *)&self->_firmware, 0);
}

@end