@interface USBCUSBFirmwareUpdater
- (USBCUSBFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3;
- (id)DeviceAlternateFirmwareVersionString;
- (id)DeviceFirmwareVersionString;
- (id)DeviceSerialNumber;
- (id)DeviceSerialNumber:(BOOL)a3;
- (id)EnterUpdateMode;
- (id)ExitUpdateMode:(BOOL)a3;
- (id)FirmwareFilename:(id)a3;
- (id)RetrieveA11xQApp:(id *)a3;
- (id)RetrieveA11xSerialNumber:(char *)a3;
- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)validateDevice:(id)a3 withFirmware:(id)a4;
- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)validateUSBCBillboard;
- (unsigned)DeviceAlternateFirmwareVersion;
- (unsigned)DeviceFirmwareVersion;
- (unsigned)FirmwareFileVersion:(id)a3;
- (unsigned)FirmwareFileVersion:(id)a3 firmware:(id *)a4 isSecure:(BOOL *)a5 andSignature:(id *)a6 withPartition:(unsigned int)a7;
- (void)setPreferredFirmwarePartition:(BOOL)a3;
@end

@implementation USBCUSBFirmwareUpdater

- (id)RetrieveA11xSerialNumber:(char *)a3
{
  memset(v10, 0, 46);
  int v9 = 46;
  uint64_t v4 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:v10 bufferLength:46 registerAddress:23 returnedBufferLength:&v9];
  if (v4)
  {
    v7 = (void *)v4;
    v8 = +[NSMutableDictionary dictionary];
    [v8 setObject:v7 forKeyedSubscript:@"Previous Error Response"];
    v5 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7936 userInfo:v8];
  }
  else
  {
    v5 = 0;
    *(_OWORD *)a3 = *(_OWORD *)((char *)&v10[1] + 12);
    *((_WORD *)a3 + 8) = WORD6(v10[2]);
  }
  return v5;
}

- (id)RetrieveA11xQApp:(id *)a3
{
  int v10 = 4;
  uint64_t v5 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1886404945 withDelay:500000 canRetry:1 canRecover:1];
  if (v5
    || (int v10 = 64,
        *(_OWORD *)&a3->var0.var0 = 0u,
        *(_OWORD *)&a3->var4 = 0u,
        *(_OWORD *)&a3->var6[8] = 0u,
        *(_OWORD *)&a3->var7[4] = 0u,
        [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:a3 bufferLength:64 registerAddress:9 returnedBufferLength:&v10], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v5;
    int v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:v8 forKeyedSubscript:@"Previous Error Response"];
    v6 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7936 userInfo:v9];
  }
  else
  {
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"    Current firmware info:"];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        Active Region:              %u\n", a3->var0.var0 format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        Preferred Region:           %u\n", a3->var0.var1 format];
    [(FudPluginDelegate *)self->super._delegate log:7 format:@" "];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        Target Region Start Addr:   0x%04X\n", a3->var1 format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        Target Region End Addr:     0x%04X\n", a3->var2 format];
    [(FudPluginDelegate *)self->super._delegate log:7 format:@" "];
    [(FudPluginDelegate *)self->super._delegate log:7, @"    Current Bootloader Version:     %08X\n", a3->var5 format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        Current App1 Version:       %08X\n", a3->var3 format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        Current App2 Version:       %08X\n", a3->var4 format];
    [(FudPluginDelegate *)self->super._delegate log:7 format:@" "];
    v6 = 0;
  }
  return v6;
}

- (id)DeviceSerialNumber:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];

    if (v5)
    {
      v6 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];
      goto LABEL_12;
    }
  }
  v12[0] = 0;
  uint64_t v7 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:v12];
  if (v7)
  {
    int v10 = (void *)v7;
    goto LABEL_10;
  }
  if (!v12[0])
  {
    int v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:@"Not in alternate mode" forKeyedSubscript:@"Notes"];
    int v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9472 userInfo:v9];

LABEL_10:
    goto LABEL_11;
  }
  v8 = [(USBCUSBFirmwareUpdater *)self RetrieveA11xSerialNumber:v12];

  if (v8)
  {
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v6 = +[NSString stringWithUTF8String:v12];
  if (v3) {
    [(NSMutableDictionary *)self->super._hardwareProperties setObject:v6 forKeyedSubscript:@"Hardware S/N"];
  }
LABEL_12:
  return v6;
}

- (id)DeviceSerialNumber
{
  return [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber:1];
}

- (unsigned)DeviceFirmwareVersion
{
  unsigned int result = self->super._firmwareVersion;
  if (!result)
  {
    long long v6 = 0u;
    memset(v7, 0, sizeof(v7));
    uint64_t v4 = [(USBCUSBFirmwareUpdater *)self RetrieveA11xQApp:&v6];
    if (!v4)
    {
      if (v6 == 2)
      {
        uint64_t v5 = (unsigned int *)v7;
        goto LABEL_7;
      }
      if (v6 == 1)
      {
        uint64_t v5 = (unsigned int *)((unint64_t)&v6 | 0xC);
LABEL_7:
        self->super._firmwareVersion = *v5;
      }
    }

    return self->super._firmwareVersion;
  }
  return result;
}

- (unsigned)DeviceAlternateFirmwareVersion
{
  long long v7 = 0u;
  memset(v8, 0, sizeof(v8));
  v2 = [(USBCUSBFirmwareUpdater *)self RetrieveA11xQApp:&v7];
  if (v2 || v7 == BYTE1(v7)) {
    goto LABEL_6;
  }
  if (BYTE1(v7) != 2)
  {
    if (BYTE1(v7) == 1)
    {
      BOOL v3 = (unsigned int *)((unint64_t)&v7 | 0xC);
      goto LABEL_9;
    }
LABEL_6:
    unsigned int v4 = 0;
    goto LABEL_7;
  }
  BOOL v3 = (unsigned int *)v8;
LABEL_9:
  unsigned int v6 = *v3;
  if (v6 == -1) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = v6;
  }
LABEL_7:

  return v4;
}

- (id)DeviceFirmwareVersionString
{
  unsigned int v2 = [(USBCUSBFirmwareUpdater *)self DeviceFirmwareVersion];
  if (v2)
  {
    BOOL v3 = +[NSString stringWithFormat:@"%X.%X.%X", HIWORD(v2), BYTE1(v2), v2];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)DeviceAlternateFirmwareVersionString
{
  unsigned int v2 = [(USBCUSBFirmwareUpdater *)self DeviceAlternateFirmwareVersion];
  if (v2)
  {
    BOOL v3 = +[NSString stringWithFormat:@"%X.%X.%X", HIWORD(v2), BYTE1(v2), v2];
  }
  else
  {
    BOOL v3 = @"(Invalid F/W Image)";
  }
  return v3;
}

- (id)validateUSBCBillboard
{
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(self->super._registryEntry, &properties, kCFAllocatorDefault, 0);
  BOOL v3 = properties;
  unsigned int v4 = v3;
  if (!v3)
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];
    [v5 setObject:@"Bad registry entry" forKeyedSubscript:@"Notes"];
    v20 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8704 userInfo:v5];
    unsigned int v21 = 0;
    unsigned __int8 v22 = 0;
    goto LABEL_26;
  }
  uint64_t v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"IOClassName"];
  unsigned int v6 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"IOClassNameOverride"];
  uint64_t v7 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"USB Serial Number"];
  id v8 = v6;
  id v9 = v8;
  if (!v8 && (id v9 = v5) == 0
    || [v9 compare:@"IOUSBDevice"] && objc_msgSend(v9, "compare:", @"IOUSBHostDevice"))
  {
    [(FudPluginDelegate *)self->super._delegate log:7, @"Provider class didn't make sense: %@", v4 format];
  }
  int v10 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"bcdDevice"];
  unsigned int v11 = [v10 unsignedLongValue];
  v12 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];

  if (!v12) {
    [(NSMutableDictionary *)self->super._hardwareProperties setObject:v7 forKeyedSubscript:@"Hardware S/N"];
  }
  uint64_t v13 = v11 << 8;
  v14 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware Installed firmware version"];

  if (!v14)
  {
    v15 = +[NSNumber numberWithUnsignedLong:v13];
    [(NSMutableDictionary *)self->super._hardwareProperties setObject:v15 forKeyedSubscript:@"Hardware Installed firmware version"];
  }
  v37 = (void *)v7;
  if (v10 && v13)
  {
    v16 = [(NSMutableDictionary *)self->super._firmwareAssetProperties objectForKeyedSubscript:@"Firmware Asset Version"];
    id v17 = [v16 unsignedLongValue];
    if (v16)
    {
      if ((v17 & 0x800000) == 0)
      {
        uint64_t v18 = v17 & 0x7FFFFF;
        uint64_t v19 = v13 & 0x7FFF00;
        if (v19 >= v18)
        {
          [(FudPluginDelegate *)self->super._delegate log:7, @"Reported firmware version do not support install of new firmware.  Aborting (0x%06X / 0x%06X)", v19, v18 format];
          v36 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware Device Class"];
          v28 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware Installed firmware version"];
          unsigned int v33 = [v28 unsignedLongValue];

          if (!self->super._firmwareVersion) {
            self->super._firmwareVersion = v33;
          }
          delegate = self->super._delegate;
          v29 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
          v30 = [(USBCUSBFirmwareUpdater *)self DeviceFirmwareVersionString];
          [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ is up to date.  Installed firmware version is %@", v36, v29, v30 format];

          v35 = +[NSMutableDictionary dictionary];
          [v35 setObject:@"Firmware not new enough" forKeyedSubscript:@"Notes"];
          v20 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9728 userInfo:v35];
          v32 = (void *)_previouslyUpdatedObjects;
          v31 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];
          [v32 setObject:&off_100027758 forKeyedSubscript:v31];

          goto LABEL_21;
        }
      }
    }
  }
  if (!self->startupPauseCompleted)
  {
    -[FudPluginDelegate log:format:](self->super._delegate, "log:format:", 7, @"%s - Pausing here to let the host clear any attachment-related traffic...", "-[USBCUSBFirmwareUpdater validateUSBCBillboard]");
    usleep(0xE4E1C0u);
    self->startupPauseCompleted = 1;
  }
  v20 = [(USBCFirmwareUpdater *)self LocatePortMicroForSerialNumber:v7];
  if (!v20)
  {
    pdController = self->super._pdController;
    if (pdController)
    {
      v24 = [(PDController *)pdController userClient];
      unsigned __int8 v22 = [v24 routerID];

      unsigned int v21 = [(PDController *)self->super._pdController address];
      -[FudPluginDelegate log:format:](self->super._delegate, "log:format:", 3, @"%s - Everything OK.  S/N: %@", "-[USBCUSBFirmwareUpdater validateUSBCBillboard]", v37);
      v20 = 0;
      goto LABEL_25;
    }
  }
  [(FudPluginDelegate *)self->super._delegate log:3 format:@"AppleHPM instance not found or you are running as a non-root user"];
  [(FudPluginDelegate *)self->super._delegate log:7, @"S/N error returnValue: %@", v20 format];
LABEL_21:
  unsigned int v21 = 0;
  unsigned __int8 v22 = 0;
LABEL_25:

LABEL_26:
  if (v20)
  {
    v25 = +[NSMutableDictionary dictionary];
    [v25 setObject:v20 forKeyedSubscript:@"Previous Error Response"];
    v26 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8704 userInfo:v25];
  }
  else
  {
    v26 = 0;
    self->super._route = 0;
    self->super._rid = v22;
    self->super._address = v21;
  }

  return v26;
}

- (id)validateDevice:(id)a3 withFirmware:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v36 = 0;
  p_hardwareProperties = &self->super._hardwareProperties;
  if (!self->super._hardwareProperties) {
    objc_storeStrong((id *)&self->super._hardwareProperties, a3);
  }
  if (!self->super._firmwareAssetProperties) {
    objc_storeStrong((id *)&self->super._firmwareAssetProperties, a4);
  }
  int v10 = (void *)_previouslyUpdatedObjects;
  unsigned int v11 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];
  v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"This registry entry appears to have been previously updated.  Aborting"];
    [(FudPluginDelegate *)self->super._delegate log:7, @"%u Previously updated - aborting", self->super._registryEntry format];
    uint64_t v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:@"Previously updated" forKeyedSubscript:@"Notes"];
    v14 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8448 userInfo:v13];

    v15 = 0;
    if (v14) {
      goto LABEL_21;
    }
    goto LABEL_28;
  }
  v16 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware Installed firmware version"];
  if (!v16)
  {
    if (!self->super._firmwareVersion) {
      goto LABEL_12;
    }
    v16 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:");
    [(NSMutableDictionary *)*p_hardwareProperties setObject:v16 forKeyedSubscript:@"Hardware Installed firmware version"];
  }

LABEL_12:
  uint64_t v17 = [(USBCUSBFirmwareUpdater *)self validateUSBCBillboard];
  if (v17)
  {
    v14 = (void *)v17;
    [(FudPluginDelegate *)self->super._delegate log:7, @"validateUSBCBillboard gave: %@", v17 format];
    v15 = 0;
LABEL_21:
    delegate = self->super._delegate;
    v27 = [v14 description];
    [(FudPluginDelegate *)delegate log:7, @"validateDevice has an error: %@", v27 format];

    v28 = +[NSMutableDictionary dictionary];
    [v28 setObject:v14 forKeyedSubscript:@"Previous Error Response"];
    v29 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8448 userInfo:v28];

    v30 = 0;
    goto LABEL_30;
  }
  uint64_t v18 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware VID"];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware DID"];
    if (v20)
    {
      unsigned int v21 = (void *)v20;
      unsigned __int8 v22 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware UID"];

      if (v22)
      {
        v23 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware VID"];
        HIDWORD(v36) = [v23 unsignedLongValue];

        v24 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware DID"];
        LODWORD(v36) = [v24 unsignedLongValue];

        v15 = [(NSMutableDictionary *)*p_hardwareProperties objectForKeyedSubscript:@"Hardware UID"];
        goto LABEL_24;
      }
    }
    else
    {
    }
  }
  [(NSMutableDictionary *)*p_hardwareProperties setObject:0 forKeyedSubscript:@"Hardware VID"];
  [(NSMutableDictionary *)*p_hardwareProperties setObject:0 forKeyedSubscript:@"Hardware DID"];
  [(NSMutableDictionary *)*p_hardwareProperties setObject:0 forKeyedSubscript:@"Hardware UID"];
  id v35 = 0;
  v14 = [(USBCFirmwareUpdater *)self DeviceVIDDID:(char *)&v36 + 4 andDid:&v36 andUid:&v35];
  id v25 = v35;
  v15 = v25;
  if (v14)
  {
    [(FudPluginDelegate *)self->super._delegate log:7, @"DeviceVIDDID gave: %@", v14 format];
    goto LABEL_21;
  }
  if (v25) {
    [(NSMutableDictionary *)*p_hardwareProperties setObject:v25 forKeyedSubscript:@"Hardware UID"];
  }
LABEL_24:
  if (v36 == 0xA2700000019)
  {
    v31 = [v7 objectForKeyedSubscript:@"Hardware Installed firmware version"];

    if (v31)
    {
      v32 = [v7 objectForKeyedSubscript:@"Hardware Installed firmware version"];
      [v32 unsignedLongValue];
    }
    else
    {
      v32 = +[NSNumber numberWithUnsignedLong:[(USBCUSBFirmwareUpdater *)self DeviceFirmwareVersion]];
      [v7 setObject:v32 forKeyedSubscript:@"Hardware Installed firmware version"];
    }

    v30 = [(USBCUSBFirmwareUpdater *)self DeviceFirmwareVersionString];
    [(FudPluginDelegate *)self->super._delegate log:7, @"Firmware version: %@", v30 format];
    goto LABEL_29;
  }
  unsigned int v33 = +[NSMutableDictionary dictionary];
  [(FudPluginDelegate *)self->super._delegate log:7, @"Wrong VID/DID: 0x%04X / 0x%04X", HIDWORD(v36), v36 format];
  [v33 setObject:@"Wrong VID/DID" forKeyedSubscript:@"Notes"];
  v14 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8448 userInfo:v33];

  if (v14) {
    goto LABEL_21;
  }
LABEL_28:
  v30 = 0;
LABEL_29:
  v29 = 0;
LABEL_30:

  return v29;
}

- (USBCUSBFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)USBCUSBFirmwareUpdater;
  BOOL v3 = [(USBCFirmwareUpdater *)&v8 initWithRegistryEntry:*(void *)&a3];
  unsigned int v4 = v3;
  if (v3)
  {
    v3->startupPauseCompleted = 0;
    v3->receptacleDisabled = 0;
  }
  if (!_previouslyUpdatedObjects)
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];
    unsigned int v6 = (void *)_previouslyUpdatedObjects;
    _previouslyUpdatedObjects = v5;
  }
  return v4;
}

- (id)FirmwareFilename:(id)a3
{
  return +[NSString stringWithFormat:@"%@/%s", a3, "usbcfw-0x1460-2.35.bin"];
}

- (unsigned)FirmwareFileVersion:(id)a3 firmware:(id *)a4 isSecure:(BOOL *)a5 andSignature:(id *)a6 withPartition:(unsigned int)a7
{
  id v12 = a3;
  unsigned int v13 = [v12 length];
  v14 = (char *)malloc_type_malloc(v13, 0x8F3DAF76uLL);
  [v12 getBytes:v14 length:v13];
  v30 = a5;
  v31 = a6;
  v29 = a4;
  if (a7 == 1)
  {
    uint64_t v15 = 4096;
  }
  else
  {
    if (a7 != 2) {
      sub_100019884();
    }
    uint64_t v15 = 69632;
  }
  uint64_t v16 = v15;
  uint64_t v17 = (unsigned int *)&v14[v15];
  uint64_t v18 = *v17;
  CFStringRef v19 = @"NO";
  if (v13 > 0x20000) {
    CFStringRef v19 = @"YES";
  }
  CFStringRef v27 = v19;
  unsigned int v28 = v13;
  if (v13 <= 0x20000) {
    uint64_t v20 = (v18 + 256);
  }
  else {
    uint64_t v20 = v18;
  }
  uint64_t v22 = v17[5];
  uint64_t v21 = v17[6];
  uint64_t v23 = v17[4];
  free(v14);
  [(FudPluginDelegate *)self->super._delegate log:7, @"    VID: %u (0x%X)", v21, v21 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    DID: %u (0x%X)", v22, v22 format];
  [(FudPluginDelegate *)self->super._delegate log:7 format:@" "];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    Offset: %u (0x%X)", v16, v16 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    Length: %u (0x%X)", v18, v18 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    LengthTotal: %u (0x%X)", v20, v20 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    appendedSigs: %@", v27 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    fwVersion: %u (0x%X)", v23, v23 format];
  [(FudPluginDelegate *)self->super._delegate log:7 format:@" "];
  if (v29)
  {
    objc_msgSend(v12, "subdataWithRange:", v16, v20);
    id *v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v30) {
    BOOL *v30 = v28 > 0x20000;
  }
  if (v31)
  {
    v24 = (char *)[v12 length];
    if (v20 - v28 < 0x100)
    {
      id v25 = 0;
    }
    else
    {
      objc_msgSend(v12, "subdataWithRange:", &v24[256 * a7 - 768], 256);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    id *v31 = v25;
  }

  return v23;
}

- (id)EnterUpdateMode
{
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"Enabling lock (does nothing)"];
  id result = [(USBCPDAccess *)self->super._pdAccess EnterUpdateMode:0];
  self->receptacleDisabled = 1;
  return result;
}

- (id)ExitUpdateMode:(BOOL)a3
{
  BOOL v3 = a3;
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"Disabling lock (does nothing)"];
  pdAccess = self->super._pdAccess;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F084;
  _OWORD v8[3] = &unk_100024540;
  v8[4] = self;
  unsigned int v6 = [(USBCPDAccess *)pdAccess ExitUpdateMode:v8 remoteReset:v3];
  return v6;
}

- (unsigned)FirmwareFileVersion:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (!self->super._pdAccess) {
    goto LABEL_6;
  }
  uint64_t v5 = [(USBCUSBFirmwareUpdater *)self RetrieveA11xQApp:&v9];
  if (v5)
  {
LABEL_8:

    unsigned int v7 = -1;
    goto LABEL_9;
  }
  if (DWORD1(v9) == 4096)
  {
LABEL_6:
    uint64_t v6 = 1;
    goto LABEL_7;
  }
  if (DWORD1(v9) != 69632) {
    goto LABEL_8;
  }
  uint64_t v6 = 2;
LABEL_7:
  unsigned int v7 = -[USBCUSBFirmwareUpdater FirmwareFileVersion:firmware:isSecure:andSignature:withPartition:](self, "FirmwareFileVersion:firmware:isSecure:andSignature:withPartition:", v4, 0, 0, 0, v6, v9, v10, v11, v12);
LABEL_9:

  return v7;
}

- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  long long v10 = (void (**)(id, uint64_t, void, void *))a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = (void (**)(void, double))a6;
  unsigned __int8 v71 = 0;
  v66 = [v12 objectForKeyedSubscript:@"Firmware Asset Version"];
  v14 = [v12 objectForKeyedSubscript:@"Firmware Asset Is Secure"];
  uint64_t v15 = [v12 objectForKeyedSubscript:@"Firmware Asset File"];
  v68 = [v12 objectForKeyedSubscript:@"Firmware Asset Payload"];
  id v16 = [v12 objectForKeyedSubscript:@"Firmware Asset Signature"];
  v67 = [v11 objectForKeyedSubscript:@"Hardware Partition"];
  uint64_t v17 = (void *)_previouslyUpdatedObjects;
  uint64_t v18 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];
  CFStringRef v19 = [v17 objectForKeyedSubscript:v18];

  if (v19)
  {
    uint64_t v20 = 0;
LABEL_29:
    uint64_t v41 = 0;
    v34 = 0;
    goto LABEL_30;
  }
  if (!v15)
  {
    v24 = +[NSMutableDictionary dictionary];
    [v24 setObject:@"Firmware file was missing" forKeyedSubscript:@"Notes"];
    uint64_t v25 = 12290;
LABEL_28:
    uint64_t v20 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v25 userInfo:v24];

    goto LABEL_29;
  }
  if (v68 && v16 && v14 && v66 && v67)
  {
    id v59 = [v66 unsignedLongValue];
    unsigned __int8 v71 = [v14 BOOLValue];
    uint64_t v21 = [v12 objectForKeyedSubscript:@"Firmware Asset Payload"];

    uint64_t v22 = [v12 objectForKeyedSubscript:@"Firmware Asset Signature"];

    uint64_t v23 = [v11 objectForKeyedSubscript:@"Hardware Partition"];

    v67 = (void *)v23;
    v68 = (void *)v21;
    id v16 = (id)v22;
    goto LABEL_17;
  }
  memset(v72, 0, sizeof(v72));
  uint64_t v26 = [(USBCUSBFirmwareUpdater *)self RetrieveA11xQApp:v72];
  if (v26)
  {
    uint64_t v20 = (void *)v26;
    goto LABEL_29;
  }
  if (DWORD1(v72[0]) == 4096)
  {
    uint64_t v27 = 1;
    goto LABEL_16;
  }
  if (DWORD1(v72[0]) != 69632)
  {
    v24 = +[NSMutableDictionary dictionary];
    [v24 setObject:@"Failed to get valid active partition data from qApp" forKeyedSubscript:@"Notes"];
    uint64_t v25 = 12289;
    goto LABEL_28;
  }
  uint64_t v27 = 2;
LABEL_16:
  v63 = +[NSNumber numberWithUnsignedLong:v27];

  [v11 setObject:v63 forKeyedSubscript:@"Hardware Partition"];
  id v69 = v16;
  id v70 = v68;
  unsigned int v28 = (void *)-[USBCUSBFirmwareUpdater FirmwareFileVersion:firmware:isSecure:andSignature:withPartition:](self, "FirmwareFileVersion:firmware:isSecure:andSignature:withPartition:", v15, &v70, &v71, &v69, [v63 unsignedLongValue]);
  id v60 = v70;

  id v29 = v69;
  v30 = v16;
  id v16 = v29;

  id v59 = v28;
  uint64_t v31 = +[NSNumber numberWithUnsignedLong:v28];

  [v12 setObject:v31 forKeyedSubscript:@"Firmware Asset Version"];
  uint64_t v32 = +[NSNumber numberWithBool:v71];

  [v12 setObject:v32 forKeyedSubscript:@"Firmware Asset Is Secure"];
  [v12 setObject:v60 forKeyedSubscript:@"Firmware Asset Payload"];
  [v12 setObject:v16 forKeyedSubscript:@"Firmware Asset Signature"];
  v67 = v63;
  v68 = v60;
  v14 = (void *)v32;
  v66 = (void *)v31;
LABEL_17:
  unsigned int v33 = [v11 objectForKeyedSubscript:@"Hardware Installed firmware version"];
  v34 = v33;
  if (v33)
  {
    id v61 = [v33 unsignedLongValue];
  }
  else
  {
    id v61 = (id)[(USBCUSBFirmwareUpdater *)self DeviceFirmwareVersion];
    id v35 = +[NSNumber numberWithUnsignedLong:v61];
    [v11 setObject:v35 forKeyedSubscript:@"Hardware Installed firmware version"];
  }
  if (v71)
  {
    v56 = v34;
    v57 = v15;
    id v64 = v16;
    uint64_t v36 = v59 & 0x7FFFFF;
    unsigned int v37 = [(USBCUSBFirmwareUpdater *)self DeviceAlternateFirmwareVersion];
    v58 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
    delegate = self->super._delegate;
    v38 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
    v39 = [(USBCUSBFirmwareUpdater *)self DeviceFirmwareVersionString];
    if (v61 >= v36 || v37 >= v36)
    {
      v43 = [(USBCUSBFirmwareUpdater *)self DeviceAlternateFirmwareVersionString];
      [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ is up to date.  Installed firmware version is %@.  Alternate firmware is: %@", v58, v38, v39, v43 format];

      [(FudPluginDelegate *)self->super._delegate log:7, @"Firmware older/equal than what is currently installed (0x%08X vs. 0x%08X)", v61, v36 format];
      v44 = +[NSMutableDictionary dictionary];
      [v44 setObject:@"Firmware older/equal than what is currently installed" forKeyedSubscript:@"Notes"];
      uint64_t v20 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:2816 userInfo:v44];

      uint64_t v41 = 0;
    }
    else
    {
      v40 = [(USBCFirmwareUpdater *)self FirmwareFileVersionString:v59];
      uint64_t v41 = 1;
      [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ is in need of an update.  Installed firmware version %@ will be replaced with %@", v58, v38, v39, v40 format];

      uint64_t v20 = 0;
    }
    v34 = v56;
    uint64_t v15 = v57;
    id v16 = v64;
  }
  else
  {
    v42 = +[NSMutableDictionary dictionary];
    [v42 setObject:@"Firmware file was bad" forKeyedSubscript:@"Notes"];
    uint64_t v20 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:12291 userInfo:v42];

    uint64_t v41 = 0;
  }
LABEL_30:
  v62 = v12;
  if (v13) {
    v13[2](v13, 100.0);
  }
  v65 = v16;
  if (v20)
  {
    +[NSMutableDictionary dictionary];
    uint64_t v45 = v41;
    v46 = v34;
    v47 = v13;
    v48 = v10;
    id v49 = v11;
    v50 = v14;
    v52 = v51 = v15;
    [v52 setObject:v20 forKeyedSubscript:@"Previous Error Response"];
    v53 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:12292 userInfo:v52];

    uint64_t v15 = v51;
    v14 = v50;
    id v11 = v49;
    long long v10 = v48;
    unsigned int v13 = v47;
    v34 = v46;
    uint64_t v41 = v45;
    if (!v10) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  v53 = 0;
  if (v10) {
LABEL_34:
  }
    v10[2](v10, v41, 0, v53);
LABEL_35:

  return v53;
}

- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  long long v9 = (void (**)(id, void, void *))a3;
  id v10 = a4;
  id v11 = (void (**)(void, double))a6;
  id v12 = [v10 objectForKeyedSubscript:@"Hardware Partition"];
  unsigned int v13 = (void *)MGCopyAnswer();
  if (v12) {
    goto LABEL_8;
  }
  memset(v45, 0, sizeof(v45));
  uint64_t v14 = [(USBCUSBFirmwareUpdater *)self RetrieveA11xQApp:v45];
  if (v14)
  {
    id v16 = (void *)v14;
LABEL_38:
    id v12 = 0;
    if (v11) {
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  if (DWORD1(v45[0]) == 4096)
  {
    uint64_t v15 = 1;
    goto LABEL_7;
  }
  if (DWORD1(v45[0]) != 69632)
  {
    id v35 = +[NSMutableDictionary dictionary];
    [v35 setObject:@"Failed to get valid active partition data from qApp" forKeyedSubscript:@"Notes"];
    id v16 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:12033 userInfo:v35];

    goto LABEL_38;
  }
  uint64_t v15 = 2;
LABEL_7:
  id v12 = +[NSNumber numberWithUnsignedLong:v15];
  [v10 setObject:v12 forKeyedSubscript:@"Hardware Partition"];
LABEL_8:
  if ([v13 containsString:@"arm"])
  {
    id v16 = 0;
    if (!v11) {
      goto LABEL_29;
    }
LABEL_28:
    v11[2](v11, 100.0);
    goto LABEL_29;
  }
  unsigned int v37 = v13;
  id v38 = v10;
  id v17 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  if (!v17)
  {
    id v17 = +[NSMutableDictionary dictionaryWithCapacity:1];
  }
  v39 = v9;
  uint64_t v18 = [(USBCFirmwareUpdater *)self BlessArgumentsWithRemoteReset:1];
  if (v18)
  {
    CFStringRef v19 = +[NSString stringWithFormat:@"%u %u", self->super._rid, self->super._address];
    uint64_t v20 = +[NSNumber numberWithInt:500];
    uint64_t v21 = +[NSDictionary dictionaryWithObjectsAndKeys:v18, @"BlessArguments", v20, @"Priority", v19, @"UniqueID", 0, 0];

    [v17 setObject:v21 forKeyedSubscript:@"BlessSettings"];
  }
  uint64_t v36 = self;
  id v22 = objc_alloc_init((Class)NSMutableString);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v23 = v18;
  id v24 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        unsigned int v28 = *(__CFString **)(*((void *)&v40 + 1) + 8 * i);
        if ([v22 length]) {
          [v22 appendString:@" "];
        }
        [(__CFString *)v28 rangeOfString:@" "];
        id v29 = v22;
        if (v30)
        {
          [v22 appendString:@"\""];
          [v22 appendString:v28];
          id v29 = v22;
          CFStringRef v31 = @"\"";
        }
        else
        {
          CFStringRef v31 = v28;
        }
        [v29 appendString:v31];
      }
      id v25 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v25);
  }

  [(FudPluginDelegate *)v36->super._delegate log:7, @"Bless Invocation string: %@", v22 format];
  id v16 = 0;
  id v10 = v38;
  long long v9 = v39;
  unsigned int v13 = v37;
  if (v11) {
    goto LABEL_28;
  }
LABEL_29:
  if (v16)
  {
    uint64_t v32 = +[NSMutableDictionary dictionary];
    [v32 setObject:v16 forKeyedSubscript:@"Previous Error Response"];
    unsigned int v33 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:12032 userInfo:v32];

    if (!v9) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  unsigned int v33 = 0;
  if (v9) {
LABEL_31:
  }
    v9[2](v9, 0, v33);
LABEL_32:

  return v33;
}

- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v101 = (void (**)(void, double))a6;
  memset(__s1, 0, sizeof(__s1));
  int v103 = 4;
  unsigned int v13 = [v12 objectForKeyedSubscript:@"Firmware Asset Is Secure"];
  uint64_t v14 = [v12 objectForKeyedSubscript:@"Firmware Asset File"];
  v100 = [v12 objectForKeyedSubscript:@"Firmware Asset Payload"];
  v98 = [v12 objectForKeyedSubscript:@"Firmware Asset Signature"];
  v96 = v12;
  v97 = (void (**)(void, void, void))v10;
  v99 = v11;
  v94 = (void *)v14;
  v95 = v13;
  if (!self->super._updaterOperational)
  {
    long long v43 = +[NSMutableDictionary dictionary];
    [v43 setObject:@"Update Aborted before it began" forKeyedSubscript:@"Notes"];
    uint64_t v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v43];
    delegate = self->super._delegate;
LABEL_70:
    v46 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
    v47 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ - Update aborted", v46, v47 format];

LABEL_77:
    id v55 = [(USBCUSBFirmwareUpdater *)self ExitUpdateMode:0];
    goto LABEL_78;
  }
  if (!v14)
  {
    long long v43 = +[NSMutableDictionary dictionary];
    [v43 setObject:@"Firmware file was missing" forKeyedSubscript:@"Notes"];
    uint64_t v45 = 10496;
    goto LABEL_68;
  }
  [v13 BOOLValue];
  uint64_t v15 = self->super._delegate;
  id v16 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
  id v17 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
  [(FudPluginDelegate *)v15 log:1, @"%@ with S/N %@ - Accessory firmware update started", v16, v17 format];

  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-=-= Initiating Update Mode -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  uint64_t v18 = [(USBCUSBFirmwareUpdater *)self EnterUpdateMode];
  if (v18) {
    goto LABEL_173;
  }
  if (!self->super._updaterOperational)
  {
    long long v43 = +[NSMutableDictionary dictionary];
    [v43 setObject:@"Update Aborted at start" forKeyedSubscript:@"Notes"];
    uint64_t v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v43];
    delegate = self->super._delegate;
    goto LABEL_70;
  }
  id v19 = [(USBCPDAccess *)self->super._pdAccess VerifyPowerRole];
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-= Sending Firmware Update Start Command =-=-=-=-=-=-=-=-=-=-=-=-"];
  uint64_t v18 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1213418566 withDelay:1000000 canRetry:1 canRecover:1];
  if (v18) {
    goto LABEL_173;
  }
  int v103 = 4;
  uint64_t v18 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:__s1 bufferLength:4 registerAddress:9 returnedBufferLength:&v103];
  if (v18) {
    goto LABEL_173;
  }
  if (LODWORD(__s1[0]))
  {
LABEL_172:
    uint64_t v27 = 0;
    goto LABEL_79;
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-=- Sending Firmware Payload =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  uint64_t v20 = v100;
  uint64_t v21 = v101;
  if (!self->super._updaterOperational) {
    goto LABEL_74;
  }
  unsigned int v22 = 0;
  int v23 = 0;
  double v24 = 0.0;
  while (1)
  {
    uint64_t v25 = v22;
    if ((unint64_t)[v20 length] <= v22) {
      break;
    }
    if ([v20 length] - v22 <= 0x40) {
      uint64_t v26 = [v20 length] - v22;
    }
    else {
      uint64_t v26 = 64;
    }
    objc_msgSend(v20, "getBytes:range:", __s1, v22, v26);
    uint64_t v27 = 0;
    int v28 = 4;
    do
    {
      int v29 = v28;
      if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27]) {
        break;
      }
      if (v27)
      {
        if (![(USBCPDAccess *)self->super._pdAccess attemptErrorRecovery:v27 lastAttempt:v29 == 0])
        {
          long long v41 = +[NSMutableDictionary dictionary];
          [v41 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
          uint64_t v42 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13066 userInfo:v41];

          uint64_t v27 = (void *)v42;
          if (!v42) {
            goto LABEL_60;
          }
LABEL_56:
          uint64_t v21 = v101;
          if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
          {
            v39 = +[NSMutableDictionary dictionary];
            [v39 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
            uint64_t v40 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13070 userInfo:v39];

            uint64_t v20 = v100;
            if (!v40) {
              goto LABEL_61;
            }
            uint64_t v27 = (void *)v40;
          }
          goto LABEL_79;
        }
      }
      uint64_t v27 = 0;
      int v30 = 5;
      while (1)
      {
        if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
        {
LABEL_29:
          if (v27) {
            goto LABEL_54;
          }
          goto LABEL_30;
        }
        if (v27) {
          break;
        }
LABEL_24:
        long long v106 = 0u;
        long long v107 = 0u;
        long long __s2 = 0u;
        long long v105 = 0u;
        uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSWriteReg:__s1 bufferLength:v26 registerAddress:19];
        if (!v27)
        {
          int v103 = v26;
          uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:&__s2 bufferLength:v26 registerAddress:19 returnedBufferLength:&v103];
          if (!v27)
          {
            if (!memcmp(__s1, &__s2, v26)) {
              goto LABEL_30;
            }
            uint64_t v27 = 0;
          }
        }
        if (!--v30) {
          goto LABEL_29;
        }
      }
      if ([(USBCPDAccess *)self->super._pdAccess attemptErrorRecovery:v27 lastAttempt:v30 == 1])
      {

        goto LABEL_24;
      }
      v34 = +[NSMutableDictionary dictionary];
      [v34 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
      uint64_t v35 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13067 userInfo:v34];

      uint64_t v27 = (void *)v35;
      if (v35) {
        goto LABEL_54;
      }
LABEL_30:
      unsigned int v102 = v26;
      int v31 = v26;
      if (v23 == v26)
      {
LABEL_43:
        uint64_t v33 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1414682438 withDelay:1000 canRetry:1 canRecover:1];
        if (v33
          || (int v103 = 4,
              [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:__s1 bufferLength:4 registerAddress:9 returnedBufferLength:&v103], (uint64_t v33 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v27 = (void *)v33;
          int v23 = v31;
          goto LABEL_54;
        }
        if (!LOBYTE(__s1[0]))
        {
          int v23 = v31;
          goto LABEL_60;
        }
        [(FudPluginDelegate *)self->super._delegate log:7, @"            RemoteIECSReadReg:kIECSRegisterData returned: 0x%08X with buffer[0] = 0x%02X", 0, LOBYTE(__s1[0]) format];
        id v38 = self->super._delegate;
        if ((LODWORD(__s1[0]) - 1) < 5)
        {
          [(FudPluginDelegate *)v38 log:7 format:off_100024560[LODWORD(__s1[0]) - 1]];
        }
        else
        {
          [(FudPluginDelegate *)v38 log:7, @"            FWRT_cmd Command returned: %02X %02X%02X%02X %02X%02X%02X%02X", LOBYTE(__s1[0]), BYTE1(__s1[0]), BYTE2(__s1[0]), HIBYTE(LODWORD(__s1[0])), BYTE4(__s1[0]), BYTE5(__s1[0]), BYTE6(__s1[0]), BYTE7(__s1[0]) format];
          if (v29)
          {
            uint64_t v27 = 0;
            int v23 = v31;
            goto LABEL_54;
          }
        }
        long long v43 = +[NSMutableDictionary dictionary];
        v66 = +[NSString stringWithFormat:@"FWRT_cmd Command failed.  flashStatus = 0x%02X %02X%02X%02X", LOBYTE(__s1[0]), BYTE1(__s1[0]), BYTE2(__s1[0]), BYTE3(__s1[0])];
        [v43 setObject:v66 forKeyedSubscript:@"Notes"];

        uint64_t v45 = 11018;
        goto LABEL_68;
      }
      uint64_t v27 = 0;
      int v32 = 5;
      while (2)
      {
        if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
        {
LABEL_41:
          if (v27) {
            goto LABEL_54;
          }
          goto LABEL_42;
        }
        if (!v27)
        {
LABEL_36:
          long long v106 = 0u;
          long long v107 = 0u;
          long long __s2 = 0u;
          long long v105 = 0u;
          uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSWriteReg:&v102 bufferLength:4 registerAddress:18];
          if (!v27)
          {
            int v103 = 4;
            uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:&__s2 bufferLength:4 registerAddress:18 returnedBufferLength:&v103];
            if (!v27)
            {
              if (v102 == __s2) {
                goto LABEL_42;
              }
              uint64_t v27 = 0;
            }
          }
          if (!--v32) {
            goto LABEL_41;
          }
          continue;
        }
        break;
      }
      if ([(USBCPDAccess *)self->super._pdAccess attemptErrorRecovery:v27 lastAttempt:v32 == 1])
      {

        goto LABEL_36;
      }
      uint64_t v36 = +[NSMutableDictionary dictionary];
      [v36 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
      uint64_t v37 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13068 userInfo:v36];

      uint64_t v27 = (void *)v37;
      if (!v37)
      {
LABEL_42:
        int v31 = v102;
        goto LABEL_43;
      }
LABEL_54:
      int v28 = v29 - 1;
    }
    while (v29);
    if (v27) {
      goto LABEL_56;
    }
LABEL_60:
    uint64_t v20 = v100;
    uint64_t v21 = v101;
LABEL_61:
    gEnableDetailLogging = 0;
    if (v21)
    {
      double v24 = v24 + (double)v26 * 100.0 / (double)(unint64_t)[v20 length] * 0.9;
      v21[2](v21, v24);
    }
    unsigned int v22 = v26 + v25;
    if (!self->super._updaterOperational)
    {
LABEL_74:
      id v49 = +[NSMutableDictionary dictionary];
      long long v43 = v49;
      CFStringRef v50 = @"Update Aborted during payload xmit";
      goto LABEL_75;
    }
  }
  if (!self->super._updaterOperational) {
    goto LABEL_74;
  }
  if ((unint64_t)[v20 length] > v22)
  {
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"******** ERROR: Data size did not match what the micro was expecting"];
    [(FudPluginDelegate *)self->super._delegate log:7, @"    FWRT_cmd Command returned: %02X %02X%02X%02X %02X%02X%02X%02X", LOBYTE(__s1[0]), BYTE1(__s1[0]), BYTE2(__s1[0]), BYTE3(__s1[0]), BYTE4(__s1[0]), BYTE5(__s1[0]), BYTE6(__s1[0]), BYTE7(__s1[0]) format];
    long long v43 = +[NSMutableDictionary dictionary];
    v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Payload size did not match what the micro was expecting.  Sent = 0x%X.  Expected = 0x%lX", v25, [v20 length]);
    [v43 setObject:v48 forKeyedSubscript:@"Notes"];

    uint64_t v45 = 11019;
    goto LABEL_68;
  }
  -[FudPluginDelegate log:format:](self->super._delegate, "log:format:", 7, @"Firmware data length was: %lu bytes (0x%lX)", [v20 length], objc_msgSend(v20, "length"));
  v67 = v98;
  if (v21)
  {
    double v24 = 90.0;
    v21[2](v21, 90.0);
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-=- Sending Firmware Signature =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  if (!self->super._updaterOperational) {
    goto LABEL_163;
  }
  unsigned int v68 = 0;
  uint64_t v69 = 0;
  while (1)
  {
    uint64_t v70 = v68;
    if ((unint64_t)[v67 length] <= v68)
    {
      if (self->super._updaterOperational)
      {
        if ((unint64_t)[v67 length] > v68)
        {
          [(FudPluginDelegate *)self->super._delegate log:7 format:@"******** ERROR: Signature size did not match what the micro was expecting"];
          [(FudPluginDelegate *)self->super._delegate log:7, @"    FWRT_cmd Command returned: %02X %02X%02X%02X %02X%02X%02X%02X", LOBYTE(__s1[0]), BYTE1(__s1[0]), BYTE2(__s1[0]), BYTE3(__s1[0]), BYTE4(__s1[0]), BYTE5(__s1[0]), BYTE6(__s1[0]), BYTE7(__s1[0]) format];
          long long v43 = +[NSMutableDictionary dictionary];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Signature size did not match what the micro was expecting.  Sent = 0x%X.  Expected = 0x%lX", v70, [v67 length], v92, v93);
          v88 = LABEL_162:;
          [v43 setObject:v88 forKeyedSubscript:@"Notes"];

          uint64_t v45 = 11264;
LABEL_68:
          uint64_t v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v45 userInfo:v43];
LABEL_78:

          goto LABEL_79;
        }
        -[FudPluginDelegate log:format:](self->super._delegate, "log:format:", 7, @"Firmware signature length was: %lu bytes (0x%lX)", [v67 length], objc_msgSend(v67, "length"));
        if (v21) {
          v21[2](v21, 95.0);
        }
        [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-= Verifying Update Operation -=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
        uint64_t v18 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1497781830 withDelay:2000000 canRetry:1 canRecover:1];
        if (!v18)
        {
          int v103 = 4;
          uint64_t v18 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:__s1 bufferLength:4 registerAddress:9 returnedBufferLength:&v103];
          if (!v18)
          {
            if (LODWORD(__s1[0])) {
              [(FudPluginDelegate *)self->super._delegate log:7, @"    FVFY_cmd Command returned: %02X %02X%02X%02X", LOBYTE(__s1[0]), BYTE1(__s1[0]), BYTE2(__s1[0]), HIBYTE(LODWORD(__s1[0])) format];
            }
            if (self->super._updaterOperational)
            {
              v89 = self->super._delegate;
              v90 = [v99 objectForKeyedSubscript:@"Hardware Device Class"];
              v91 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
              [(FudPluginDelegate *)v89 log:1, @"%@ with S/N %@ - Accessory firmware update succeeded", v90, v91 format];

              goto LABEL_172;
            }
            long long v43 = +[NSMutableDictionary dictionary];
            [v43 setObject:@"Update Aborted after signature xmit" forKeyedSubscript:@"Notes"];
            uint64_t v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v43];
            v51 = self->super._delegate;
            v52 = v99;
            goto LABEL_76;
          }
        }
LABEL_173:
        uint64_t v27 = (void *)v18;
        goto LABEL_79;
      }
LABEL_163:
      id v49 = +[NSMutableDictionary dictionary];
      long long v43 = v49;
      CFStringRef v50 = @"Update Aborted during signature xmit";
LABEL_75:
      [v49 setObject:v50 forKeyedSubscript:@"Notes"];
      uint64_t v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v43];
      v51 = self->super._delegate;
      v52 = v99;
LABEL_76:
      v53 = [v52 objectForKeyedSubscript:@"Hardware Device Class"];
      v54 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
      [(FudPluginDelegate *)v51 log:1, @"%@ with S/N %@ - Update aborted", v53, v54 format];

      goto LABEL_77;
    }
    if ([v67 length] - v68 <= 0x40) {
      uint64_t v71 = [v67 length] - v68;
    }
    else {
      uint64_t v71 = 64;
    }
    objc_msgSend(v67, "getBytes:range:", __s1, v68, v71);
    uint64_t v27 = 0;
    int v72 = 4;
    uint64_t v73 = v69;
LABEL_104:
    int v74 = v72;
    if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27]) {
      goto LABEL_141;
    }
    if (!v27) {
      goto LABEL_108;
    }
    if ([(USBCPDAccess *)self->super._pdAccess attemptErrorRecovery:v27 lastAttempt:v74 == 0])
    {
      break;
    }
    v81 = +[NSMutableDictionary dictionary];
    [v81 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v82 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13071 userInfo:v81];

    uint64_t v27 = (void *)v82;
LABEL_141:
    uint64_t v69 = v73;
    if (v27) {
      goto LABEL_79;
    }
LABEL_142:
    uint64_t v21 = v101;
    v67 = v98;
    if (v101)
    {
      double v24 = v24 + (double)v71 * 100.0 / (double)(unint64_t)[v98 length] * 0.05;
      v101[2](v101, v24);
    }
    unsigned int v68 = v71 + v70;
    if (!self->super._updaterOperational) {
      goto LABEL_163;
    }
  }

LABEL_108:
  uint64_t v27 = 0;
  int v75 = 5;
  while (2)
  {
    if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
    {
LABEL_118:
      if (v27) {
        goto LABEL_138;
      }
      goto LABEL_119;
    }
    if (!v27)
    {
LABEL_113:
      long long v106 = 0u;
      long long v107 = 0u;
      long long __s2 = 0u;
      long long v105 = 0u;
      uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSWriteReg:__s1 bufferLength:v71 registerAddress:19];
      if (!v27)
      {
        int v103 = v71;
        uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:&__s2 bufferLength:v71 registerAddress:19 returnedBufferLength:&v103];
        if (!v27)
        {
          if (!memcmp(__s1, &__s2, v71)) {
            goto LABEL_119;
          }
          uint64_t v27 = 0;
        }
      }
      if (!--v75) {
        goto LABEL_118;
      }
      continue;
    }
    break;
  }
  if ([(USBCPDAccess *)self->super._pdAccess attemptErrorRecovery:v27 lastAttempt:v75 == 1])
  {

    goto LABEL_113;
  }
  v77 = +[NSMutableDictionary dictionary];
  [v77 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
  uint64_t v78 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13072 userInfo:v77];

  uint64_t v27 = (void *)v78;
  if (v78) {
    goto LABEL_138;
  }
LABEL_119:
  unsigned int v102 = v71;
  uint64_t v69 = v71;
  if (v73 != v71)
  {
    uint64_t v27 = 0;
    int v76 = 5;
    while (![(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
    {
      if (v27)
      {
        if (![(USBCPDAccess *)self->super._pdAccess attemptErrorRecovery:v27 lastAttempt:v76 == 1])
        {
          v79 = +[NSMutableDictionary dictionary];
          [v79 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
          uint64_t v80 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13073 userInfo:v79];

          uint64_t v27 = (void *)v80;
          break;
        }
      }
      long long v106 = 0u;
      long long v107 = 0u;
      long long __s2 = 0u;
      long long v105 = 0u;
      uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSWriteReg:&v102 bufferLength:4 registerAddress:18];
      if (!v27)
      {
        int v103 = 4;
        uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:&__s2 bufferLength:4 registerAddress:18 returnedBufferLength:&v103];
        if (!v27)
        {
          if (v102 == __s2) {
            goto LABEL_135;
          }
          uint64_t v27 = 0;
        }
      }
      if (!--v76) {
        break;
      }
    }
    if (v27) {
      goto LABEL_138;
    }
LABEL_135:
    uint64_t v69 = v102;
  }
  uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1414682438];
  if (!v27)
  {
    int v83 = 5;
    while (v83 && ![(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
    {
      if (v27)
      {
        if (![(USBCPDAccess *)self->super._pdAccess attemptErrorRecovery:v27 lastAttempt:v83 == 1])
        {
          v84 = +[NSMutableDictionary dictionary];
          [v84 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
          uint64_t v85 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13074 userInfo:v84];

          uint64_t v27 = (void *)v85;
          break;
        }
      }
      int v103 = 4;
      uint64_t v27 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:__s1 bufferLength:4 registerAddress:9 returnedBufferLength:&v103];
      --v83;
      if (!v27)
      {
        if (!LODWORD(__s1[0])) {
          goto LABEL_142;
        }
        [(FudPluginDelegate *)self->super._delegate log:7, @"    flashStatus: 0x%02X %02X%02X%02X", LOBYTE(__s1[0]), BYTE1(__s1[0]), BYTE2(__s1[0]), HIBYTE(LODWORD(__s1[0])) format];
        long long v43 = +[NSMutableDictionary dictionary];
        +[NSString stringWithFormat:@"FWRT_cmd Command failed.  flashStatus = 0x%02X %02X%02X%02X", LOBYTE(__s1[0]), BYTE1(__s1[0]), BYTE2(__s1[0]), BYTE3(__s1[0])];
        goto LABEL_162;
      }
    }
    if (!v27) {
      goto LABEL_142;
    }
    if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
    {
      v86 = +[NSMutableDictionary dictionary];
      [v86 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
      uint64_t v87 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13075 userInfo:v86];

      uint64_t v27 = (void *)v87;
    }
    goto LABEL_79;
  }
  uint64_t v73 = v69;
LABEL_138:
  int v72 = v74 - 1;
  if (v74) {
    goto LABEL_104;
  }
LABEL_79:
  if (v101) {
    v101[2](v101, 100.0);
  }
  if (v27)
  {
    if ([(USBCPDAccess *)self->super._pdAccess didFailErrorRecovery:v27])
    {
      v56 = +[NSMutableDictionary dictionary];
      [v56 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
      uint64_t v57 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13076 userInfo:v56];

      uint64_t v27 = (void *)v57;
    }
    v58 = v99;
    id v59 = +[NSMutableDictionary dictionary];
    id v60 = v59;
    if (v27) {
      [v59 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
    }
    id v61 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:10496 userInfo:v60];

    v62 = self->super._delegate;
    v63 = [v99 objectForKeyedSubscript:@"Hardware Device Class"];
    id v64 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)v62 log:1, @"%@ with S/N %@ - Accessory firmware update failed: %@", v63, v64, v61 format];
  }
  else
  {
    id v61 = 0;
    v58 = v99;
  }
  if (v97) {
    ((void (**)(void, void, void *))v97)[2](v97, 0, v61);
  }

  return v61;
}

- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  long long v9 = (void (**)(id, id, void *))a3;
  id v10 = a4;
  id v11 = (void (**)(double))a6;
  id v12 = &CFRelease_ptr;
  id v46 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  unsigned int v13 = (void *)MGCopyAnswer();
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=- Completing Update Operation -=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  uint64_t v14 = &CFRelease_ptr;
  v47 = v11;
  if (self->super._updaterOperational)
  {
    [(USBCUSBFirmwareUpdater *)self setPreferredFirmwarePartition:1];
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-= Completing Reset Operation -=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
    if (v11) {
      ((void (*)(void (**)(double), double))v11[2])(v11, 50.0);
    }
    if (([v13 containsString:@"arm"] & 1) == 0)
    {
      long long v43 = v13;
      uint64_t v15 = v46;
      if (!v46)
      {
        uint64_t v15 = +[NSMutableDictionary dictionaryWithCapacity:1];
      }
      id v44 = v10;
      uint64_t v45 = v9;
      id v16 = [(USBCFirmwareUpdater *)self BlessArgumentsWithRemoteReset:1];
      if (v16)
      {
        id v17 = +[NSString stringWithFormat:@"%u %u", self->super._rid, self->super._address];
        uint64_t v18 = +[NSNumber numberWithInt:500];
        id v19 = +[NSDictionary dictionaryWithObjectsAndKeys:v16, @"BlessArguments", v18, @"Priority", v17, @"UniqueID", 0, 0];

        [v15 setObject:v19 forKeyedSubscript:@"BlessSettings"];
      }
      id v46 = v15;
      id v20 = objc_alloc_init((Class)NSMutableString);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v21 = v16;
      id v22 = [v21 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v49;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v49 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(__CFString **)(*((void *)&v48 + 1) + 8 * i);
            if ([v20 length]) {
              [v20 appendString:@" "];
            }
            [(__CFString *)v26 rangeOfString:@" "];
            uint64_t v27 = v20;
            if (v28)
            {
              [v20 appendString:@"\""];
              [v20 appendString:v26];
              uint64_t v27 = v20;
              CFStringRef v29 = @"\"";
            }
            else
            {
              CFStringRef v29 = v26;
            }
            [v27 appendString:v29];
          }
          id v23 = [v21 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v23);
      }

      [(FudPluginDelegate *)self->super._delegate log:7, @"Bless Invocation string: %@", v20 format];
      id v10 = v44;
      long long v9 = v45;
      unsigned int v13 = v43;
      id v12 = &CFRelease_ptr;
      uint64_t v14 = &CFRelease_ptr;
    }
    int v30 = (void *)_previouslyUpdatedObjects;
    int v31 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];
    [v30 setObject:&off_100027758 forKeyedSubscript:v31];

    int v32 = 0;
  }
  else
  {
    uint64_t v33 = +[NSMutableDictionary dictionary];
    [v33 setObject:@"Update Aborted at finish start" forKeyedSubscript:@"Notes"];
    int v32 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v33];
    delegate = self->super._delegate;
    [v10 objectForKeyedSubscript:@"Hardware Device Class"];
    v36 = uint64_t v35 = v13;
    uint64_t v37 = [(USBCUSBFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ - Update aborted", v36, v37 format];

    uint64_t v14 = &CFRelease_ptr;
    unsigned int v13 = v35;
    id v12 = &CFRelease_ptr;
    id v38 = [(USBCUSBFirmwareUpdater *)self ExitUpdateMode:0];
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-= Completing Reset Operation -=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  id v39 = [(USBCUSBFirmwareUpdater *)self ExitUpdateMode:0];
  if (v47) {
    v47[2](100.0);
  }
  if (v32)
  {
    uint64_t v40 = [v12[106] dictionary];
    [v40 setObject:v32 forKeyedSubscript:@"Previous Error Response"];
    long long v41 = [v14[102] errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:12544 userInfo:v40];

    if (!v9) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  long long v41 = 0;
  if (v9) {
LABEL_28:
  }
    v9[2](v9, v46, v41);
LABEL_29:

  return v41;
}

- (void)setPreferredFirmwarePartition:(BOOL)a3
{
  BOOL v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = [(USBCUSBFirmwareUpdater *)self RetrieveA11xQApp:&v9];
  uint64_t v6 = 0;
  int v8 = 0;
  if (!v5)
  {
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"    QApp info:"];
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"        regionInfo:"];
    [(FudPluginDelegate *)self->super._delegate log:7, @"            activeRegion:    %u", v9 format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"            preferredRegion: %u", BYTE1(v9) format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        targetStartAddress: %lu", DWORD1(v9) format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        targetEndAddress:   %lu", DWORD2(v9) format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        app1Version:        0x%lX", HIDWORD(v9) format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        app2Version:        0x%lX", v10 format];
    [(FudPluginDelegate *)self->super._delegate log:7, @"        bootVersion:        0x%lX", DWORD1(v10) format];
    if (HIDWORD(v9) <= v10)
    {
      if (HIDWORD(v9) >= v10)
      {
        if (HIDWORD(v9) != v10)
        {
          uint64_t v6 = 0;
          goto LABEL_17;
        }
        [(FudPluginDelegate *)self->super._delegate log:7 format:@"    Not changing preferred region as both partitions have the same firmware"];
        uint64_t v6 = v9;
        if (v9 == BYTE1(v9))
        {
          if (v9 == 1) {
            uint64_t v6 = 2;
          }
          else {
            uint64_t v6 = 1;
          }
        }
      }
      else if (v3)
      {
        uint64_t v6 = 2;
      }
      else
      {
        uint64_t v6 = 1;
      }
    }
    else if (v3)
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 2;
    }
    int v8 = v6;
  }
LABEL_17:
  [(FudPluginDelegate *)self->super._delegate log:7, @"    Setting preferred region to: %u", v6 format];
  unsigned int v7 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSWriteReg:&v8 bufferLength:4 registerAddress:9];
  if (!v7)
  {
    unsigned int v7 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1313296976 withDelay:1000000 canRetry:1 canRecover:1];
  }
}

@end