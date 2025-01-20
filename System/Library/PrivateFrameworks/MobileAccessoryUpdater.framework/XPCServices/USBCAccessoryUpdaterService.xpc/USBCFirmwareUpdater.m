@interface USBCFirmwareUpdater
- (BOOL)flashFirmwareToDevice:(id)a3;
- (BOOL)updaterOperational;
- (FudPluginDelegate)delegate;
- (NSString)overrideFile;
- (PDController)pdController;
- (USBCFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3;
- (USBCFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3 andDelegate:(id)a4 andControllers:(id)a5;
- (USBCPDAccess)pdAccess;
- (id)BlessArgumentsWithRemoteReset:(BOOL)a3;
- (id)DeviceFirmwareVersionString;
- (id)DeviceSerialNumber;
- (id)DeviceSerialNumber:(BOOL)a3;
- (id)DeviceVIDDID:(unsigned int *)a3 andDid:(unsigned int *)a4 andUid:(id *)a5;
- (id)EnterUpdateMode;
- (id)ExitUpdateMode:(BOOL)a3;
- (id)FirmwareFileVersionString:(unsigned int)a3;
- (id)FirmwareFilename:(id)a3;
- (id)FirmwareFromFile;
- (id)LocatePortMicroForSerialNumber:(id)a3;
- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)validateDevice:(id)a3 withFirmware:(id)a4;
- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (unint64_t)route;
- (unsigned)DeviceFirmwareVersion;
- (unsigned)FirmwareFileVersion:(id)a3;
- (unsigned)address;
- (unsigned)firmwareVersion;
- (unsigned)registryEntry;
- (unsigned)rid;
- (void)setAddress:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setFirmwareVersion:(unsigned int)a3;
- (void)setOverrideFile:(id)a3;
- (void)setPdAccess:(id)a3;
- (void)setPdController:(id)a3;
- (void)setRegistryEntry:(unsigned int)a3;
- (void)setRid:(unsigned __int8)a3;
- (void)setRoute:(unint64_t)a3;
- (void)setUpdaterOperational:(BOOL)a3;
@end

@implementation USBCFirmwareUpdater

- (USBCFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)USBCFirmwareUpdater;
  result = [(USBCFirmwareUpdater *)&v5 init];
  if (result) {
    result->_registryEntry = a3;
  }
  return result;
}

- (USBCFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3 andDelegate:(id)a4 andControllers:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(USBCFirmwareUpdater *)self initWithRegistryEntry:v7];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_delegate, a4);
    objc_storeStrong((id *)&v12->_pdControllers, a5);
    v12->_updaterOperational = 1;
    -[FudPluginDelegate log:format:](v12->_delegate, "log:format:", 7, @"%s - init succeeded.  registryEntry: %u", "-[USBCFirmwareUpdater initWithRegistryEntry:andDelegate:andControllers:]", v7);
    v13 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x28], "log:format:", 3, @"%s - init FAILED", "-[USBCFirmwareUpdater initWithRegistryEntry:andDelegate:andControllers:]");
  }

  return v12;
}

- (id)DeviceVIDDID:(unsigned int *)a3 andDid:(unsigned int *)a4 andUid:(id *)a5
{
  int v25 = 4;
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - _pdAccess: %@ ", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", self->_pdAccess);
  if (!self->_pdAccess) {
    goto LABEL_13;
  }
  if (!a3) {
    goto LABEL_6;
  }
  id v9 = [(NSMutableDictionary *)self->_hardwareProperties objectForKeyedSubscript:@"Hardware VID"];

  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_hardwareProperties objectForKeyedSubscript:@"Hardware VID"];
    *a3 = [v10 unsignedLongValue];
  }
  if (!*a3)
  {
    LOBYTE(v24) = 0;
    v16 = [(USBCPDAccess *)self->_pdAccess IECSReadReg:0 buffer:a3 bufferLength:4 registerAddress:0 returnedBufferLength:&v25 canRetry:0 canRecover:v24];
    delegate = self->_delegate;
    if (v16)
    {
      -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - RemoteIECSReadReg VID gave: %@", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", v16);
      goto LABEL_20;
    }
    -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - VID: %08X", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", *a3);
    v21 = +[NSNumber numberWithUnsignedLong:*a3];
    [(NSMutableDictionary *)self->_hardwareProperties setObject:v21 forKeyedSubscript:@"Hardware VID"];

    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_6:
    if (!a4) {
      goto LABEL_10;
    }
  }
  v11 = [(NSMutableDictionary *)self->_hardwareProperties objectForKeyedSubscript:@"Hardware DID"];

  if (v11)
  {
    v12 = [(NSMutableDictionary *)self->_hardwareProperties objectForKeyedSubscript:@"Hardware DID"];
    *a4 = [v12 unsignedLongValue];
  }
  if (!*a4)
  {
    LOBYTE(v24) = 0;
    v16 = [(USBCPDAccess *)self->_pdAccess IECSReadReg:0 buffer:a4 bufferLength:4 registerAddress:1 returnedBufferLength:&v25 canRetry:0 canRecover:v24];
    v18 = self->_delegate;
    if (!v16)
    {
      -[FudPluginDelegate log:format:](v18, "log:format:", 7, @"%s - DID: %08X", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", *a4);
      v22 = +[NSNumber numberWithUnsignedLong:*a4];
      [(NSMutableDictionary *)self->_hardwareProperties setObject:v22 forKeyedSubscript:@"Hardware DID"];

      goto LABEL_10;
    }
    -[FudPluginDelegate log:format:](v18, "log:format:", 7, @"%s - RemoteIECSReadReg DID gave: %@", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", v16);
LABEL_20:
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - returnValue: %@", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", v16);
    id v14 = +[NSMutableDictionary dictionary];
    [v14 setObject:v16 forKeyedSubscript:@"Previous Error Response"];
    v15 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9988 userInfo:v14];

    goto LABEL_21;
  }
LABEL_10:
  if (!a5)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_22;
  }
  v13 = [(NSMutableDictionary *)self->_hardwareProperties objectForKeyedSubscript:@"Hardware UID"];

  if (!v13)
  {
    int v25 = 16;
    LOBYTE(v24) = 0;
    v16 = [(USBCPDAccess *)self->_pdAccess IECSReadReg:0 buffer:v26 bufferLength:16 registerAddress:5 returnedBufferLength:&v25 canRetry:0 canRecover:v24];
    v19 = self->_delegate;
    if (!v16)
    {
      -[FudPluginDelegate log:format:](v19, "log:format:", 7, @"%s - UUID: %02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X%02X%02X", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", v26[0], v26[1], v26[2], v26[3], v26[4], v26[5], v26[6], v26[7], v26[8], v26[9], v26[10], v26[11], v26[12], v26[13],
        v26[14],
        v26[15]);
      id v23 = [objc_alloc((Class)NSData) initWithBytes:v26 length:16];
      *a5 = v23;
      id v14 = [v23 copy];
      [(NSMutableDictionary *)self->_hardwareProperties setObject:v14 forKeyedSubscript:@"Hardware UID"];
      v15 = 0;
      goto LABEL_21;
    }
    -[FudPluginDelegate log:format:](v19, "log:format:", 7, @"%s - RemoteIECSReadReg UUID gave: %@", "-[USBCFirmwareUpdater DeviceVIDDID:andDid:andUid:]", v16);
    goto LABEL_20;
  }
  id v14 = [(NSMutableDictionary *)self->_hardwareProperties objectForKeyedSubscript:@"Hardware UID"];
  v15 = 0;
  *a5 = [v14 copy];
LABEL_21:

LABEL_22:
  return v15;
}

- (id)LocatePortMicroForSerialNumber:(id)a3
{
  id v36 = a3;
  v34 = +[AppleHPMUserClientManager sharedInstance];
  if (!v34)
  {
    [(FudPluginDelegate *)self->_delegate log:3 format:@"AppleHPM not found or you are running as a non-root user"];
    v26 = +[NSMutableDictionary dictionary];
    delegate = self->_delegate;
    CFStringRef v28 = @"Bad userClient Manager";
    uint64_t v29 = 7;
LABEL_44:
    [(FudPluginDelegate *)delegate log:v29 format:v28];
    [v26 setObject:v28 forKeyedSubscript:@"Notes"];
    uint64_t v7 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9216 userInfo:v26];

    goto LABEL_45;
  }
  pdControllers = self->_pdControllers;
  if (!pdControllers)
  {
    objc_super v5 = +[PDController knownPDControllers];
    v6 = self->_pdControllers;
    self->_pdControllers = v5;

    pdControllers = self->_pdControllers;
    if (!pdControllers)
    {
      v26 = +[NSMutableDictionary dictionary];
      delegate = self->_delegate;
      CFStringRef v28 = @"No PD Controllers array";
      goto LABEL_43;
    }
  }
  if (![(NSArray *)pdControllers count])
  {
    v26 = +[NSMutableDictionary dictionary];
    delegate = self->_delegate;
    CFStringRef v28 = @"No PD Controllers present";
LABEL_43:
    uint64_t v29 = 3;
    goto LABEL_44;
  }
  if (self->_pdController) {
    goto LABEL_47;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  p_pdController = (id *)&self->_pdController;
  do
  {
    unsigned int v35 = v8;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obj = self->_pdControllers;
    id v9 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (!v9) {
      goto LABEL_36;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v12);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v15 = off_1000243A0;
        if ((isKindOfClass & 1) == 0) {
          v15 = &off_1000243A8;
        }
        id v16 = [objc_alloc(*v15) initWithPDController:v13];
        objc_storeStrong((id *)&self->_pdAccess, v16);
        char v43 = 0;
        v17 = self->_delegate;
        unsigned int v18 = [v13 address];
        v19 = [v13 userClient];
        -[FudPluginDelegate log:format:](v17, "log:format:", 7, @"%s - Testing alternate mode for Port %u on RID %u...", "-[USBCFirmwareUpdater LocatePortMicroForSerialNumber:]", v18, [v19 routerID]);

        uint64_t v20 = [(USBCPDAccess *)self->_pdAccess DeviceInAlternateMode:&v43];

        if (v20)
        {
          gEnableDetailLogging = 0;
          uint64_t v7 = (void *)v20;
          goto LABEL_28;
        }
        if (!v43) {
          goto LABEL_25;
        }
        unsigned int v41 = 0;
        unsigned int v42 = 0;
        -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - Alternate mode ENABLED", "-[USBCFirmwareUpdater LocatePortMicroForSerialNumber:]");
        uint64_t v7 = [(USBCFirmwareUpdater *)self DeviceVIDDID:&v42 andDid:&v41 andUid:0];
        -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - DeviceVIDDID gave: %@ (vid = 0x%04X, did = 0x%04X)", "-[USBCFirmwareUpdater LocatePortMicroForSerialNumber:]", v7, v42, v41, v34);
        if (!v7)
        {
          io_registry_entry_t parent = 0;
          if (IORegistryEntryGetParentEntry(self->_registryEntry, "IOService", &parent)) {
            goto LABEL_22;
          }
          while (1)
          {
            if (IOObjectConformsTo(parent, "IOThunderboltSwitchType3"))
            {
              int v39 = 9999;
              if (!+[IOKitUtilities uint32ForRegistryEntry:parent andKey:@"Depth" outValue:&v39])break; {
            }
              }
            if (IORegistryEntryGetParentEntry(parent, "IOService", &parent)) {
              goto LABEL_22;
            }
          }
          if (!v39
            || (+[NSMutableDictionary dictionary],
                uint64_t v24 = objc_claimAutoreleasedReturnValue(),
                [v24 setObject:@"Depth != 0 - not direct attached" forKeyedSubscript:@"Notes"], +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"USBCAccessoryFirmwareUpdater Domain", 8960, v24), uint64_t v7 = objc_claimAutoreleasedReturnValue(), v24, !v7))
          {
LABEL_22:
            v21 = [(USBCFirmwareUpdater *)self DeviceSerialNumber:0];
            v22 = v21;
            if (v21 && ![v21 compare:v36])
            {
              -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - Validating pdAccess.... S/N Matched", "-[USBCFirmwareUpdater LocatePortMicroForSerialNumber:]");
              objc_storeStrong(p_pdController, v13);

              uint64_t v7 = 0;
              goto LABEL_36;
            }
            -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - Validating pdAccess.... S/N DID NOT Match.  (%@ vs. %@)", "-[USBCFirmwareUpdater LocatePortMicroForSerialNumber:]", v22, v36);
            [(NSMutableDictionary *)self->_hardwareProperties setObject:0 forKeyedSubscript:@"Hardware S/N"];

LABEL_25:
            if (!*p_pdController)
            {
              -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - Validating pdAccess.... _pdController was left as NULL - trying next interface", "-[USBCFirmwareUpdater LocatePortMicroForSerialNumber:]");
              pdAccess = self->_pdAccess;
              self->_pdAccess = 0;
            }
            uint64_t v7 = 0;
          }
        }
LABEL_28:

        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v25 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      id v10 = v25;
    }
    while (v25);
LABEL_36:

    if (*p_pdController) {
      break;
    }
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - Found no valid/connected H/W.  Pausing briefly and retrying", "-[USBCFirmwareUpdater LocatePortMicroForSerialNumber:]");
    usleep(0xF4240u);
    if (self->_pdController) {
      break;
    }
    unsigned int v8 = v35 + 1;
  }
  while (v35 < 4);
LABEL_45:
  if (v7)
  {
    v30 = +[NSMutableDictionary dictionary];
    [v30 setObject:v7 forKeyedSubscript:@"Previous Error Response"];
    v31 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9216 userInfo:v30];

    goto LABEL_50;
  }
LABEL_47:
  if (self->_pdAccess)
  {
    v31 = 0;
    v32 = v36;
  }
  else
  {
    v30 = +[NSMutableDictionary dictionary];
    [v30 setObject:@"No valid PD Controller" forKeyedSubscript:@"Notes"];
    v31 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9216 userInfo:v30];
LABEL_50:
    v32 = v36;
  }
  return v31;
}

- (id)DeviceSerialNumber:(BOOL)a3
{
  return 0;
}

- (id)DeviceSerialNumber
{
  return 0;
}

- (unsigned)DeviceFirmwareVersion
{
  return 0;
}

- (id)DeviceFirmwareVersionString
{
  return 0;
}

- (id)validateDevice:(id)a3 withFirmware:(id)a4
{
  return 0;
}

- (id)FirmwareFilename:(id)a3
{
  return 0;
}

- (id)FirmwareFromFile
{
  return 0;
}

- (unsigned)FirmwareFileVersion:(id)a3
{
  return 0;
}

- (id)FirmwareFileVersionString:(unsigned int)a3
{
  return +[NSString stringWithFormat:@"%X.%X.%X", HIWORD(a3), BYTE1(a3), a3];
}

- (BOOL)flashFirmwareToDevice:(id)a3
{
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

- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  -[USBCFirmwareUpdater doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  delegate = self->_delegate;
  id v9 = NSStringFromSelector(a2);
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - doesNotRecognizeSelector = %@", "-[USBCFirmwareUpdater validateFirmware:hardware:firmware:progress:]", v9);

  id v10 = NSStringFromSelector(a2);
  uint64_t v11 = +[NSString stringWithFormat:@"Unimplemented Selector: %@", v10];
  [0 setObject:v11 forKeyedSubscript:@"Notes"];

  v12 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13824 userInfo:0];
  [(FudPluginDelegate *)self->_delegate didFinish:0 info:0 error:v12];
  [(FudPluginDelegate *)self->_delegate progress:100.0];
  return v12;
}

- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  -[USBCFirmwareUpdater doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  delegate = self->_delegate;
  id v9 = NSStringFromSelector(a2);
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - doesNotRecognizeSelector = %@", "-[USBCFirmwareUpdater prepareFirmware:hardware:firmware:progress:]", v9);

  id v10 = NSStringFromSelector(a2);
  uint64_t v11 = +[NSString stringWithFormat:@"Unimplemented Selector: %@", v10];
  [0 setObject:v11 forKeyedSubscript:@"Notes"];

  v12 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13824 userInfo:0];
  [(FudPluginDelegate *)self->_delegate didFinish:0 info:0 error:v12];
  [(FudPluginDelegate *)self->_delegate progress:100.0];
  return v12;
}

- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  -[USBCFirmwareUpdater doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  delegate = self->_delegate;
  id v9 = NSStringFromSelector(a2);
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - doesNotRecognizeSelector = %@", "-[USBCFirmwareUpdater applyFirmware:hardware:firmware:progress:]", v9);

  id v10 = NSStringFromSelector(a2);
  uint64_t v11 = +[NSString stringWithFormat:@"Unimplemented Selector: %@", v10];
  [0 setObject:v11 forKeyedSubscript:@"Notes"];

  v12 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13824 userInfo:0];
  [(FudPluginDelegate *)self->_delegate didFinish:0 info:0 error:v12];
  [(FudPluginDelegate *)self->_delegate progress:100.0];
  return v12;
}

- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  -[USBCFirmwareUpdater doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  delegate = self->_delegate;
  id v9 = NSStringFromSelector(a2);
  -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - doesNotRecognizeSelector = %@", "-[USBCFirmwareUpdater finishFirmware:hardware:firmware:progress:]", v9);

  id v10 = NSStringFromSelector(a2);
  uint64_t v11 = +[NSString stringWithFormat:@"Unimplemented Selector: %@", v10];
  [0 setObject:v11 forKeyedSubscript:@"Notes"];

  v12 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13824 userInfo:0];
  [(FudPluginDelegate *)self->_delegate didFinish:0 info:0 error:v12];
  [(FudPluginDelegate *)self->_delegate progress:100.0];
  return v12;
}

- (id)BlessArgumentsWithRemoteReset:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSMutableArray arrayWithCapacity:16];
  id v6 = objc_alloc((Class)NSMutableString);
  uint64_t v7 = [(NSMutableDictionary *)self->_firmwareAssetProperties objectForKeyedSubscript:@"Firmware Asset Path"];
  id v8 = [v6 initWithString:v7];

  NSUInteger v9 = [(NSArray *)self->_pdControllers count];
  id v10 = +[NSFileManager defaultManager];
  uint64_t v11 = +[NSString stringWithFormat:@"%@/%@", @"/usr/standalone/firmware/FUD/USBCAccessoryFirmwareUpdater", @"HPMUtil.efi"];
  v26 = v10;
  if ([v10 fileExistsAtPath:v11])
  {
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - EFI tools found in modern location.  Using that one: %@", "-[USBCFirmwareUpdater BlessArgumentsWithRemoteReset:]", v11);
    id v12 = [v11 mutableCopy];

    id v8 = v12;
  }
  else
  {
    [v8 appendString:@"/"];
    [v8 appendString:@"HPMUtil.efi"];
  }
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 7, @"%s - flasher_filenameWithPath = %@", "-[USBCFirmwareUpdater BlessArgumentsWithRemoteReset:]", v8);
  [v5 addObject:@"/usr/sbin/bless"];
  [v5 addObject:@"-verbose"];
  [v5 addObject:@"--nextonly"];
  [v5 addObject:@"-mount"];
  [v5 addObject:@"/"];
  [v5 addObject:@"-firmware"];
  [v5 addObject:v8];
  [v5 addObject:@"-options"];
  v13 = +[NSMutableArray arrayWithCapacity:16];
  [v13 addObject:@"-g"];
  [v13 addObject:@"-os"];
  [v13 addObject:@"-o"];
  [v13 addObject:@"g"];
  [v13 addObject:@"-w1"];
  [v13 addObject:@"0x4"];
  if (v3) {
    [v13 addObject:@"-remote"];
  }
  id v25 = v11;
  if (v9 >= 2)
  {
    [v13 addObject:@"-sr"];
    id v14 = +[NSString stringWithFormat:@"%u", self->_rid];
    [v13 addObject:v14];

    v15 = +[NSString stringWithFormat:@"%llu", self->_route];
    [v13 addObject:v15];

    [v13 addObject:@"-pps"];
    id v16 = +[NSString stringWithFormat:@"%u", self->_address];
    [v13 addObject:v16];
  }
  [v13 addObject:@"-noreset"];
  id v17 = objc_alloc_init((Class)NSMutableString);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v13;
  id v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if ([v17 length]) {
          [v17 appendString:@" "];
        }
        [v17 appendString:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  [v5 addObject:v17];
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 1, @"%s - bless call requested", "-[USBCFirmwareUpdater BlessArgumentsWithRemoteReset:]");

  return v5;
}

- (FudPluginDelegate)delegate
{
  return (FudPluginDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)overrideFile
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOverrideFile:(id)a3
{
}

- (unsigned)registryEntry
{
  return self->_registryEntry;
}

- (void)setRegistryEntry:(unsigned int)a3
{
  self->_registryEntry = a3;
}

- (unint64_t)route
{
  return self->_route;
}

- (void)setRoute:(unint64_t)a3
{
  self->_route = a3;
}

- (unsigned)rid
{
  return self->_rid;
}

- (void)setRid:(unsigned __int8)a3
{
  self->_rid = a3;
}

- (unsigned)address
{
  return self->_address;
}

- (void)setAddress:(unsigned int)a3
{
  self->_address = a3;
}

- (PDController)pdController
{
  return (PDController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPdController:(id)a3
{
}

- (USBCPDAccess)pdAccess
{
  return (USBCPDAccess *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPdAccess:(id)a3
{
}

- (unsigned)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(unsigned int)a3
{
  self->_firmwareVersion = a3;
}

- (BOOL)updaterOperational
{
  return self->_updaterOperational;
}

- (void)setUpdaterOperational:(BOOL)a3
{
  self->_updaterOperational = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareProperties, 0);
  objc_storeStrong((id *)&self->_firmwareAssetProperties, 0);
  objc_storeStrong((id *)&self->_pdControllers, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pdAccess, 0);
  objc_storeStrong((id *)&self->_pdController, 0);
  objc_storeStrong((id *)&self->_overrideFile, 0);
}

@end