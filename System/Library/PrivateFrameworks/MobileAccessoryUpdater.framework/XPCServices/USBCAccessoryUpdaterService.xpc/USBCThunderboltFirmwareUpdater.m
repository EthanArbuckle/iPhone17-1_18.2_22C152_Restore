@interface USBCThunderboltFirmwareUpdater
- (USBCThunderboltFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3;
- (id)DeviceFirmwareVersionString;
- (id)DeviceSerialNumber;
- (id)DeviceVIDDID:(unsigned int *)a3 andDid:(unsigned int *)a4 andUid:(id *)a5;
- (id)FirmwareFilename:(id)a3;
- (id)RetrieveA115SerialNumber:(char *)a3;
- (id)RetrieveAceFirmwareVersion:(char *)a3;
- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)validateDevice:(id)a3 withFirmware:(id)a4;
- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
- (id)validateThunderboltSwitch;
- (unsigned)DeviceFirmwareVersion;
- (unsigned)FirmwareFileVersion:(id)a3;
- (unsigned)FirmwareFileVersion:(id)a3 firmware:(id *)a4 isSecure:(BOOL *)a5 andSignature:(id *)a6;
@end

@implementation USBCThunderboltFirmwareUpdater

- (id)FirmwareFilename:(id)a3
{
  return +[NSString stringWithFormat:@"%@/%s", a3, "usbcfw-0x1657-3.56.bin"];
}

- (unsigned)FirmwareFileVersion:(id)a3 firmware:(id *)a4 isSecure:(BOOL *)a5 andSignature:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 length];
  v11 = malloc_type_malloc(v10, 0xFB596C5EuLL);
  [v9 getBytes:v11 length:v10];
  int v12 = *v11;
  if (*v11 == -1394606079)
  {
    uint64_t v13 = 0;
    v14 = v11;
  }
  else
  {
    if ((v12 + 1) > 1)
    {
      v16 = v11 + 1023;
    }
    else
    {
      int v12 = v11[1024];
      if ((v12 + 1) < 2)
      {
        LODWORD(v15) = -1;
        goto LABEL_38;
      }
      v16 = v11 + 2047;
    }
    uint64_t v13 = (*v16 + v12);
    v14 = (_DWORD *)((char *)v11 + v13);
  }
  v32 = a6;
  if (v13 >= v10)
  {
    delegate = self->super._delegate;
    CFStringRef v26 = @"Invalid Ace Image (1)\n";
  }
  else
  {
    if (*v14 == -1394606079 && v14[2] == 4096)
    {
      uint64_t v17 = (v14[3] + 4096);
      int v18 = v14[6];
      unsigned int v19 = v18 + 1;
      unsigned int v20 = v18 + 4096;
      if (v19 >= 2) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v17;
      }
      if (v19 >= 2) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
      unsigned int v23 = v21 + v13;
      if (v21 > 0x18000 || v23 > v10)
      {
        [(FudPluginDelegate *)self->super._delegate log:7 format:@"Invalid Ace Image (2)\n"];
        [(FudPluginDelegate *)self->super._delegate log:7, @"aceLength %08x aceOffset %08x len %08x imageLength %08x APP_SIZE_ACE %08x\n", v21, v13, (v17 + v13), v10, 98304 format];
        BOOL v31 = 0;
        uint64_t v15 = 0xFFFFFFFFLL;
      }
      else
      {
        BOOL v31 = v23 < v10;
        uint64_t v15 = (v14[13] << 8);
      }
      goto LABEL_27;
    }
    delegate = self->super._delegate;
    CFStringRef v26 = @"Not an Ace image\n";
  }
  [(FudPluginDelegate *)delegate log:7 format:v26];
  uint64_t v17 = 0;
  BOOL v31 = 0;
  uint64_t v22 = 0xFFFFFFFFLL;
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_27:
  free(v11);
  [(FudPluginDelegate *)self->super._delegate log:7, @"    aceOffset: %u (0x%X)", v13, v13 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    aceLength: %u (0x%X)", v17, v17 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    aceLengthTotal: %u (0x%X)", v22, v22 format];
  CFStringRef v27 = @"NO";
  if (v31) {
    CFStringRef v27 = @"YES";
  }
  [(FudPluginDelegate *)self->super._delegate log:7, @"    signedBinary: %@", v27 format];
  [(FudPluginDelegate *)self->super._delegate log:7, @"    fwVersion: %u (0x%X)", v15, v15 format];
  if (a4)
  {
    objc_msgSend(v9, "subdataWithRange:", v13, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5) {
    *a5 = v31;
  }
  if (v32)
  {
    v28 = (char *)[v9 length];
    if ((v22 - v17) < 0x100)
    {
      id v29 = 0;
    }
    else
    {
      objc_msgSend(v9, "subdataWithRange:", v28 - 256, 256);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    id *v32 = v29;
  }
LABEL_38:

  return v15;
}

- (unsigned)FirmwareFileVersion:(id)a3
{
  return [(USBCThunderboltFirmwareUpdater *)self FirmwareFileVersion:a3 firmware:0 isSecure:0 andSignature:0];
}

- (id)RetrieveAceFirmwareVersion:(char *)a3
{
  int v15 = 4;
  int v16 = 0;
  char v14 = 0;
  uint64_t v5 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:&v14];
  if (v5)
  {
LABEL_11:
    v11 = (void *)v5;
    goto LABEL_6;
  }
  if (v14)
  {
    uint64_t v5 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:&v16 bufferLength:4 registerAddress:15 returnedBufferLength:&v15];
    if (!v5)
    {
      int v6 = HIWORD(v16);
      int v7 = BYTE1(v16);
      int v8 = v16;
      sprintf(a3, "%X.%X.%X", HIWORD(v16), BYTE1(v16), v16);
      id v9 = 0;
      self->super._firmwareVersion = (v7 << 8) | (v6 << 16) | v8;
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  id v10 = +[NSMutableDictionary dictionary];
  [v10 setObject:@"Not in alternate mode" forKeyedSubscript:@"Notes"];
  v11 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9472 userInfo:v10];

  if (v11)
  {
LABEL_6:
    int v12 = +[NSMutableDictionary dictionary];
    [v12 setObject:v11 forKeyedSubscript:@"Previous Error Response"];
    id v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9472 userInfo:v12];

    goto LABEL_8;
  }
  id v9 = 0;
LABEL_8:
  return v9;
}

- (id)RetrieveA115SerialNumber:(char *)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  int v10 = 64;
  uint64_t v5 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1917081416];
  if (v5
    || ([(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:v11 bufferLength:64 registerAddress:9 returnedBufferLength:&v10], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = (void *)v5;
    id v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:v8 forKeyedSubscript:@"Previous Error Response"];
    int v6 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7936 userInfo:v9];
  }
  else
  {
    int v6 = 0;
    *(_OWORD *)a3 = v12;
    *((_WORD *)a3 + 8) = v13;
  }
  return v6;
}

- (unsigned)DeviceFirmwareVersion
{
  unsigned int result = self->super._firmwareVersion;
  if (!result)
  {
    id v4 = [(USBCThunderboltFirmwareUpdater *)self RetrieveAceFirmwareVersion:v5];
    return self->super._firmwareVersion;
  }
  return result;
}

- (id)DeviceFirmwareVersionString
{
  v2 = [(USBCThunderboltFirmwareUpdater *)self RetrieveAceFirmwareVersion:v5];

  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v3 = +[NSString stringWithFormat:@"%s", v5];
  }
  return v3;
}

- (id)DeviceSerialNumber
{
  v11[0] = 0;
  uint64_t v3 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:v11];
  if (v3)
  {
    id v4 = (void *)v3;
  }
  else if (v11[0])
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];
    [v5 setObject:@"Not in alternate mode" forKeyedSubscript:@"Notes"];
    id v4 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9472 userInfo:v5];
  }
  int v6 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];

  if (!v6)
  {
    int v7 = [(USBCThunderboltFirmwareUpdater *)self RetrieveA115SerialNumber:v11];

    if (!v7)
    {
      int v8 = +[NSString stringWithUTF8String:v11];
      [(NSMutableDictionary *)self->super._hardwareProperties setObject:v8 forKeyedSubscript:@"Hardware S/N"];
    }
  }
  id v9 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware S/N"];
  return v9;
}

- (id)DeviceVIDDID:(unsigned int *)a3 andDid:(unsigned int *)a4 andUid:(id *)a5
{
  memset(v29, 0, sizeof(v29));
  int v27 = 32;
  if (!self->super._pdAccess)
  {
    -[FudPluginDelegate log:format:](self->super._delegate, "log:format:", 7, @"%s - _pdAccess: %@ / %@", "-[USBCThunderboltFirmwareUpdater DeviceVIDDID:andDid:andUid:]", 0);
    if (!self->super._pdAccess) {
      goto LABEL_20;
    }
  }
  uint64_t v9 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware VID"];
  if (v9)
  {
    int v10 = (void *)v9;
    v11 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware DID"];

    if (v11)
    {
      if (a3)
      {
        long long v12 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware VID"];
        *a3 = [v12 unsignedLongValue];
      }
      if (a4)
      {
        long long v13 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware DID"];
        *a4 = [v13 unsignedLongValue];
      }
      goto LABEL_17;
    }
  }
  char v14 = [(USBCPDAccess *)self->super._pdAccess LocalIECSReadReg:v29 bufferLength:32 registerAddress:72 returnedBufferLength:&v27];
  if (v14)
  {
LABEL_14:
    if (a5) {
      goto LABEL_18;
    }
LABEL_15:
    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  uint64_t v15 = *(unsigned __int16 *)((char *)v29 + 1);
  uint64_t v16 = *(unsigned __int16 *)((char *)v29 + 11);
  -[FudPluginDelegate log:format:](self->super._delegate, "log:format:", 7, @"%s - Vendor: %04X, Product: %04X", "-[USBCThunderboltFirmwareUpdater DeviceVIDDID:andDid:andUid:]", *(unsigned __int16 *)((char *)v29 + 1), *(unsigned __int16 *)((char *)v29 + 11));
  uint64_t v17 = +[NSNumber numberWithUnsignedLong:v15];
  [(NSMutableDictionary *)self->super._hardwareProperties setObject:v17 forKeyedSubscript:@"Hardware VID"];

  int v18 = +[NSNumber numberWithUnsignedLong:v16];
  [(NSMutableDictionary *)self->super._hardwareProperties setObject:v18 forKeyedSubscript:@"Hardware DID"];

  if (a3) {
    *(_WORD *)a3 = v15;
  }
  if (a4)
  {
    char v14 = 0;
    *(_WORD *)a4 = v16;
    goto LABEL_14;
  }
LABEL_17:
  char v14 = 0;
  if (!a5) {
    goto LABEL_15;
  }
LABEL_18:
  unsigned int v19 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware UID"];

  if (v19)
  {
    unsigned int v20 = [(NSMutableDictionary *)self->super._hardwareProperties objectForKeyedSubscript:@"Hardware UID"];
    *a5 = [v20 copy];

    if (!v14)
    {
LABEL_20:
      uint64_t v21 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    int v27 = 16;
    uint64_t v22 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:v28 bufferLength:16 registerAddress:5 returnedBufferLength:&v27];

    delegate = self->super._delegate;
    if (!v22)
    {
      -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - UUID: %02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X%02X%02X", "-[USBCThunderboltFirmwareUpdater DeviceVIDDID:andDid:andUid:]", v28[0], v28[1], v28[2], v28[3], v28[4], v28[5], v28[6], v28[7], v28[8], v28[9], v28[10], v28[11], v28[12], v28[13],
        v28[14],
        v28[15]);
      id v26 = [objc_alloc((Class)NSData) initWithBytes:v28 length:16];
      *a5 = v26;
      id v24 = [v26 copy];
      [(NSMutableDictionary *)self->super._hardwareProperties setObject:v24 forKeyedSubscript:@"Hardware UID"];
      uint64_t v21 = 0;
      goto LABEL_24;
    }
    -[FudPluginDelegate log:format:](delegate, "log:format:", 7, @"%s - RemoteIECSReadReg UUID gave: %@", "-[USBCThunderboltFirmwareUpdater DeviceVIDDID:andDid:andUid:]", v22);
    char v14 = (void *)v22;
  }
LABEL_23:
  id v24 = +[NSMutableDictionary dictionary];
  [v24 setObject:v14 forKeyedSubscript:@"Previous Error Response"];
  uint64_t v21 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:9988 userInfo:v24];

LABEL_24:
LABEL_25:
  return v21;
}

- (id)validateThunderboltSwitch
{
  io_registry_entry_t parent = 0;
  __int16 v43 = 0;
  unint64_t v42 = 0;
  uint64_t v3 = 0;
  id v4 = &CFRelease_ptr;
  uint64_t v5 = &CFRelease_ptr;
  if (IORegistryEntryGetParentEntry(self->super._registryEntry, "IOService", &parent)) {
    goto LABEL_12;
  }
  while (1)
  {
    if (IOObjectConformsTo(parent, "IOThunderboltPort"))
    {
      unsigned int v6 = +[IOKitUtilities uint8ForRegistryEntry:parent andKey:@"Dual-Link Port RID" outValue:(char *)&v43 + 1];
      if (!v6) {
        unsigned int v6 = +[IOKitUtilities uint8ForRegistryEntry:parent andKey:@"Micro Address" outValue:&v43];
      }
    }
    else
    {
      unsigned int v6 = 0;
    }
    if (IOObjectConformsTo(parent, "IOThunderboltSwitchType3"))
    {
      LODWORD(v45[0]) = 9999;
      if (!v6
        && !+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", parent, @"Depth", v45)&& !+[IOKitUtilities uint64ForRegistryEntry:parent andKey:@"Route String" outValue:&v42])
      {
        break;
      }
    }
    if (IORegistryEntryGetParentEntry(parent, "IOService", &parent))
    {
      uint64_t v3 = 0;
      uint64_t v5 = &CFRelease_ptr;
      id v4 = &CFRelease_ptr;
      goto LABEL_12;
    }
  }
  if (LODWORD(v45[0]))
  {
    id v4 = &CFRelease_ptr;
    long long v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:@"Depth != 0 - not direct attached" forKeyedSubscript:@"Notes"];
    uint64_t v5 = &CFRelease_ptr;
    uint64_t v3 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8962 userInfo:v13];

LABEL_12:
    int v7 = [v4[106] dictionary];
    int v8 = v7;
    if (v3) {
      [v7 setObject:v3 forKeyedSubscript:@"Previous Error Response"];
    }
    [v8 setObject:@"No USB-C switch?" forKeyedSubscript:@"Notes"];
    uint64_t v9 = [v5[102] errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8963 userInfo:v8];
    goto LABEL_15;
  }
  uint64_t v5 = &CFRelease_ptr;
  id v4 = &CFRelease_ptr;
  if (self->super._pdControllers
    || (+[PDController knownPDControllers],
        char v14 = (NSArray *)objc_claimAutoreleasedReturnValue(),
        pdControllers = self->super._pdControllers,
        self->super._pdControllers = v14,
        pdControllers,
        self->super._pdControllers))
  {
    uint64_t v16 = +[AppleHPMUserClientManager sharedInstance];
    if (v16)
    {
      int v8 = v16;
      uint64_t v3 = [v16 userClientForRouterID:HIBYTE(v43) andRoute:v42];
      if (v3)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v36 = 48;
        uint64_t v17 = self->super._pdControllers;
        id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v39;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              pdController = objc_msgSend(v22, "userClient", v36);
              if (pdController == v3)
              {
                unsigned int v24 = [v22 address];
                int v25 = v43;

                if (v24 != v25) {
                  continue;
                }
                id v26 = v22;
                pdController = self->super._pdController;
                self->super._pdController = v26;
              }
            }
            id v19 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v19);
        }

        uint64_t v5 = &CFRelease_ptr;
        id v4 = &CFRelease_ptr;
        if (self->super._pdController) {
          goto LABEL_46;
        }
        if ([*(id *)((char *)&self->super.super.isa + v36) count] == (id)1)
        {
          int v27 = [*(id *)((char *)&self->super.super.isa + v36) objectAtIndexedSubscript:0];
          v28 = self->super._pdController;
          self->super._pdController = v27;
        }
        if (self->super._pdController)
        {
LABEL_46:
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v30 = off_1000243A0;
          if ((isKindOfClass & 1) == 0) {
            v30 = &off_1000243A8;
          }
          BOOL v31 = (USBCPDAccess *)[objc_alloc(*v30) initWithPDController:self->super._pdController];
          pdAccess = self->super._pdAccess;
          self->super._pdAccess = v31;

          memset(v45, 0, sizeof(v45));
          int v37 = 32;
          uint64_t v9 = [(USBCPDAccess *)self->super._pdAccess LocalIECSReadReg:v45 bufferLength:32 registerAddress:72 returnedBufferLength:&v37];
          if (v9) {
            goto LABEL_15;
          }
          if (*(unsigned __int16 *)((char *)v45 + 11) == 5719)
          {
            uint64_t v9 = 0;
LABEL_15:

            goto LABEL_16;
          }
          v34 = +[NSMutableDictionary dictionary];
          [v34 setObject:@"Incorrect productID value" forKeyedSubscript:@"Notes"];
          uint64_t v35 = 8448;
        }
        else
        {
          v34 = +[NSMutableDictionary dictionary];
          [v34 setObject:@"No _pdController?" forKeyedSubscript:@"Notes"];
          uint64_t v35 = 8967;
        }
      }
      else
      {
        v34 = +[NSMutableDictionary dictionary];
        [v34 setObject:@"No userClient?" forKeyedSubscript:@"Notes"];
        uint64_t v35 = 8966;
      }
      uint64_t v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain", v35, v34, v36 code userInfo];

      goto LABEL_15;
    }
    int v8 = +[NSMutableDictionary dictionary];
    [v8 setObject:@"No userClientMgr?" forKeyedSubscript:@"Notes"];
    uint64_t v33 = 8965;
  }
  else
  {
    int v8 = +[NSMutableDictionary dictionary];
    [v8 setObject:@"No pdControllers array?" forKeyedSubscript:@"Notes"];
    uint64_t v33 = 8964;
  }
  uint64_t v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v33 userInfo:v8];
LABEL_16:

  if (v9)
  {
    int v10 = [v4[106] dictionary];
    [v10 setObject:v9 forKeyedSubscript:@"Previous Error Response"];
    v11 = [v5[102] errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8960 userInfo:v10];

LABEL_18:
    goto LABEL_21;
  }
  self->super._route = v42;
  self->super._rid = HIBYTE(v43);
  self->super._address = v43;
  if (!self->super._pdAccess)
  {
    int v10 = [v4[106] dictionary];
    [v10 setObject:@"_pdAccess == nil" forKeyedSubscript:@"Notes"];
    v11 = [v5[102] errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8960 userInfo:v10];
    goto LABEL_18;
  }
  v11 = 0;
LABEL_21:
  return v11;
}

- (id)validateDevice:(id)a3 withFirmware:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  if (!self->super._hardwareProperties) {
    objc_storeStrong((id *)&self->super._hardwareProperties, a3);
  }
  if (!self->super._firmwareAssetProperties) {
    objc_storeStrong((id *)&self->super._firmwareAssetProperties, a4);
  }
  uint64_t v9 = [(USBCThunderboltFirmwareUpdater *)self validateThunderboltSwitch];
  if (v9)
  {
    int v10 = (void *)v9;
    id v11 = 0;
LABEL_11:
    char v14 = +[NSMutableDictionary dictionary];
    [v14 setObject:v10 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v15 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8448 userInfo:v14];

    goto LABEL_13;
  }
  id v17 = 0;
  int v10 = [(USBCThunderboltFirmwareUpdater *)self DeviceVIDDID:(char *)&v18 + 4 andDid:&v18 andUid:&v17];
  id v11 = v17;
  if (v10) {
    goto LABEL_11;
  }
  if (v18 == 0x5AC00001657)
  {
    int v10 = 0;
  }
  else
  {
    long long v12 = +[NSMutableDictionary dictionary];
    [v12 setObject:@"Wrong VID/DID" forKeyedSubscript:@"Notes"];
    int v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:8448 userInfo:v12];
  }
  long long v13 = +[NSNumber numberWithUnsignedLong:[(USBCThunderboltFirmwareUpdater *)self DeviceFirmwareVersion]];
  [(NSMutableDictionary *)self->super._hardwareProperties setObject:v13 forKeyedSubscript:@"Hardware Installed firmware version"];

  if (v10) {
    goto LABEL_11;
  }
  char v14 = [(USBCThunderboltFirmwareUpdater *)self DeviceFirmwareVersionString];
  uint64_t v15 = 0;
LABEL_13:

  return v15;
}

- (USBCThunderboltFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)USBCThunderboltFirmwareUpdater;
  return [(USBCFirmwareUpdater *)&v4 initWithRegistryEntry:*(void *)&a3];
}

- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v53 = a6;
  unsigned __int8 v56 = 0;
  long long v13 = [v12 objectForKeyedSubscript:@"Firmware Asset Version"];
  char v14 = [v12 objectForKeyedSubscript:@"Firmware Asset Is Secure"];
  uint64_t v15 = [v12 objectForKeyedSubscript:@"Firmware Asset File"];
  uint64_t v16 = [v12 objectForKeyedSubscript:@"Firmware Asset Payload"];
  id v17 = [v12 objectForKeyedSubscript:@"Firmware Asset Signature"];
  uint64_t v18 = v17;
  v51 = (void (**)(void, void, void, void))v10;
  v52 = v11;
  v50 = (void *)v15;
  if (v15)
  {
    if (v16 && v17 && v14 && v13)
    {
      v48 = v13;
      id v19 = [v13 unsignedLongValue];
      unsigned __int8 v56 = [v14 BOOLValue];
      uint64_t v20 = [v12 objectForKeyedSubscript:@"Firmware Asset Payload"];

      uint64_t v21 = [v12 objectForKeyedSubscript:@"Firmware Asset Signature"];

      uint64_t v18 = (void *)v21;
      uint64_t v16 = (void *)v20;
    }
    else
    {
      id v54 = v17;
      id v55 = v16;
      int v25 = (void *)[(USBCThunderboltFirmwareUpdater *)self FirmwareFileVersion:v15 firmware:&v55 isSecure:&v56 andSignature:&v54];
      id v26 = v55;

      id v27 = v54;
      uint64_t v28 = +[NSNumber numberWithUnsignedLong:v25];
      id v29 = v13;
      v30 = (void *)v28;

      [v12 setObject:v30 forKeyedSubscript:@"Firmware Asset Version"];
      id v19 = v25;
      uint64_t v31 = +[NSNumber numberWithBool:v56];

      [v12 setObject:v31 forKeyedSubscript:@"Firmware Asset Is Secure"];
      [v12 setObject:v26 forKeyedSubscript:@"Firmware Asset Payload"];
      [v12 setObject:v27 forKeyedSubscript:@"Firmware Asset Signature"];
      uint64_t v18 = v27;
      uint64_t v16 = v26;
      char v14 = (void *)v31;
      id v11 = v52;
      v48 = v30;
    }
    v32 = [v11 objectForKeyedSubscript:@"Hardware Installed firmware version"];
    unsigned int v24 = v32;
    if (v32)
    {
      unsigned int v33 = [v32 unsignedLongValue];
    }
    else
    {
      unsigned int v33 = [(USBCThunderboltFirmwareUpdater *)self DeviceFirmwareVersion];
      v34 = +[NSNumber numberWithUnsignedLong:v33];
      [v11 setObject:v34 forKeyedSubscript:@"Hardware Installed firmware version"];
    }
    v49 = v14;
    if (v16 && (!v56 || [v18 length]))
    {
      if (v33 < (v19 & 0x7FFFFF))
      {
        uint64_t v35 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
        delegate = self->super._delegate;
        uint64_t v36 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
        int v37 = [(USBCThunderboltFirmwareUpdater *)self DeviceFirmwareVersionString];
        long long v38 = [(USBCFirmwareUpdater *)self FirmwareFileVersionString:v19];
        uint64_t v39 = 1;
        [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ is in need of an update.  Installed firmware version %@ will be replaced with %@", v35, v36, v37, v38 format];

        unsigned int v23 = 0;
        goto LABEL_21;
      }
      long long v40 = +[NSMutableDictionary dictionary];
      [v40 setObject:@"Firmware older than/equal to what is currently installed" forKeyedSubscript:@"Notes"];
      uint64_t v41 = 2817;
    }
    else
    {
      long long v40 = +[NSMutableDictionary dictionary];
      [v40 setObject:@"Firmware file was bad" forKeyedSubscript:@"Notes"];
      uint64_t v41 = 12290;
    }
    unsigned int v23 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v41 userInfo:v40];
  }
  else
  {
    v48 = v13;
    v49 = v14;
    uint64_t v22 = +[NSMutableDictionary dictionary];
    [v22 setObject:@"Firmware file was missing" forKeyedSubscript:@"Notes"];
    unsigned int v23 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:12289 userInfo:v22];

    unsigned int v24 = 0;
  }
  uint64_t v35 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
  unint64_t v42 = self->super._delegate;
  uint64_t v36 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
  int v37 = [(USBCThunderboltFirmwareUpdater *)self DeviceFirmwareVersionString];
  [(FudPluginDelegate *)v42 log:1, @"%@ with S/N %@ is up to date.  Installed firmware version is %@", v35, v36, v37 format];
  uint64_t v39 = 0;
LABEL_21:

  __int16 v43 = v53;
  if (v53) {
    (*((void (**)(id, double))v53 + 2))(v53, 100.0);
  }
  if (v23)
  {
    v44 = +[NSMutableDictionary dictionary];
    [v44 setObject:v23 forKeyedSubscript:@"Previous Error Response"];
    v45 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:12292 userInfo:v44];

    __int16 v43 = v53;
  }
  else
  {
    v45 = 0;
  }
  if (v51) {
    ((void (**)(void, uint64_t, void, void *))v51)[2](v51, v39, 0, v45);
  }

  return v45;
}

- (id)prepareFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  id v8 = (void (**)(id, id, void))a3;
  uint64_t v9 = (void (**)(void, double))a6;
  id v10 = (void *)MGCopyAnswer();
  id v11 = 0;
  if (([v10 containsString:@"arm"] & 1) == 0)
  {
    id v29 = v8;
    id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    if (!v11)
    {
      id v11 = +[NSMutableDictionary dictionaryWithCapacity:1];
    }
    uint64_t v28 = v10;
    id v12 = [(USBCFirmwareUpdater *)self BlessArgumentsWithRemoteReset:0];
    if (v12)
    {
      long long v13 = +[NSString stringWithFormat:@"%u %u", self->super._rid, self->super._address];
      char v14 = +[NSNumber numberWithInt:500];
      uint64_t v15 = +[NSDictionary dictionaryWithObjectsAndKeys:v12, @"BlessArguments", v14, @"Priority", v13, @"UniqueID", 0, 0];

      [v11 setObject:v15 forKeyedSubscript:@"BlessSettings"];
    }
    id v27 = self;
    id v16 = objc_alloc_init((Class)NSMutableString);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v12;
    id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(__CFString **)(*((void *)&v30 + 1) + 8 * i);
          if ([v16 length]) {
            [v16 appendString:@" "];
          }
          [(__CFString *)v22 rangeOfString:@" "];
          unsigned int v23 = v16;
          if (v24)
          {
            [v16 appendString:@"\""];
            [v16 appendString:v22];
            unsigned int v23 = v16;
            CFStringRef v25 = @"\"";
          }
          else
          {
            CFStringRef v25 = v22;
          }
          [v23 appendString:v25];
        }
        id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }

    self = v27;
    [(FudPluginDelegate *)v27->super._delegate log:7, @"Bless Invocation string: %@", v16 format];

    id v10 = v28;
    id v8 = v29;
  }
  if (v9) {
    v9[2](v9, 100.0);
  }
  if (v8)
  {
    [(FudPluginDelegate *)self->super._delegate log:7, @"Info Dict: %@", v11 format];
    v8[2](v8, v11, 0);
  }

  return 0;
}

- (id)applyFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  id v10 = (void (**)(id, void, void *))a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void (**)(void, double))a6;
  memset(v111, 0, sizeof(v111));
  int v110 = 4;
  char v14 = [v12 objectForKeyedSubscript:@"Firmware Asset Is Secure"];
  uint64_t v15 = [v12 objectForKeyedSubscript:@"Firmware Asset File"];
  v107 = [v12 objectForKeyedSubscript:@"Firmware Asset Payload"];
  v108 = [v12 objectForKeyedSubscript:@"Firmware Asset Signature"];
  v104 = (void *)v15;
  v105 = v14;
  v106 = v11;
  if (!v15)
  {
    unsigned int v23 = +[NSMutableDictionary dictionary];
    [v23 setObject:@"Firmware file was missing" forKeyedSubscript:@"Notes"];
    uint64_t v26 = 10496;
    goto LABEL_9;
  }
  unsigned int v16 = [v14 BOOLValue];
  if (!self->super._updaterOperational)
  {
    unsigned int v23 = +[NSMutableDictionary dictionary];
    [v23 setObject:@"Update Aborted before it began" forKeyedSubscript:@"Notes"];
    id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v23];
    delegate = self->super._delegate;
    id v29 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
    long long v30 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ - Update aborted", v29, v30 format];

LABEL_11:
    id v31 = [(USBCFirmwareUpdater *)self ExitUpdateMode:0];
    goto LABEL_12;
  }
  unsigned int v102 = v16;
  id v17 = self->super._delegate;
  id v18 = [v11 objectForKeyedSubscript:@"Hardware Device Class"];
  id v19 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
  [(FudPluginDelegate *)v17 log:1, @"%@ with S/N %@  - Accessory firmware update started", v18, v19 format];

  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-=-= Initiating Update Mode -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"Enabling lock (does nothing)"];
  uint64_t v20 = [(USBCPDAccess *)self->super._pdAccess EnterUpdateMode:0];
  if (v20
    || ([(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-= Sending Firmware Update Start Command =-=-=-=-=-=-=-=-=-=-=-=-"], [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1767327315], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0)|| (v110 = 4, [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:v111 bufferLength:4 registerAddress:9 returnedBufferLength:&v110], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_141:
    id v27 = (void *)v20;
    goto LABEL_13;
  }
  uint64_t v21 = LOBYTE(v111[0]);
  uint64_t v22 = self->super._delegate;
  if (LOBYTE(v111[0]))
  {
    [(FudPluginDelegate *)v22 log:7 format:@"******** ERROR: Firmware update failed to initiate"];
    [(FudPluginDelegate *)self->super._delegate log:7, @"    SFWi Command returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0]) format];
    unsigned int v23 = +[NSMutableDictionary dictionary];
    uint64_t v24 = +[NSNumber numberWithUnsignedLong:v21];
    [v23 setObject:v24 forKeyedSubscript:@"IOReturn result"];

    CFStringRef v25 = +[NSString stringWithFormat:@"SFWi Command returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0])];
    [v23 setObject:v25 forKeyedSubscript:@"Notes"];

    uint64_t v26 = 10752;
LABEL_9:
    id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v26 userInfo:v23];
    goto LABEL_12;
  }
  [(FudPluginDelegate *)v22 log:7 format:@"Flash process successfully initiated..."];
  int v39 = BYTE2(v111[0]) & ((BYTE2(v111[0]) & 6) != 0);
  if ((BYTE2(v111[0]) & ((BYTE2(v111[0]) & 6) != 0)) != 0) {
    CFStringRef v40 = @"YES";
  }
  else {
    CFStringRef v40 = @"NO";
  }
  [(FudPluginDelegate *)self->super._delegate log:7, @"    deviceIsSecureUpdateCapable: %@\n", v40 format];
  uint64_t v41 = LODWORD(v111[0]);
  BOOL v42 = [v108 length] != 0;
  [(FudPluginDelegate *)self->super._delegate log:7, @"    extendedResultCode32: 0x%08X\n", v41 format];
  BOOL v56 = (v41 & 0x30000) == 0;
  BOOL v43 = v56;
  if (v56) {
    CFStringRef v44 = @"NO";
  }
  else {
    CFStringRef v44 = @"YES";
  }
  [(FudPluginDelegate *)self->super._delegate log:7, @"    legacy deviceIsSecureUpdateCapable: %@\n", v44 format];
  int v45 = v43 ^ v39 & v42;
  if ((v39 & v42) != 0) {
    CFStringRef v46 = @"YES";
  }
  else {
    CFStringRef v46 = @"NO";
  }
  [(FudPluginDelegate *)self->super._delegate log:7, @"    isSecureUpdate: %@\n", v46 format];
  if (v45) {
    CFStringRef v47 = @"YES";
  }
  else {
    CFStringRef v47 = @"NO";
  }
  [(FudPluginDelegate *)self->super._delegate log:7, @"    okayToUpdate: %@\n", v47 format];
  if ((v45 & 1) == 0)
  {
    v49 = +[NSMutableDictionary dictionary];
    [v49 setObject:@"NOT OK to update this device... aborting" forKeyedSubscript:@"Notes"];
    id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:10752 userInfo:v49];

    goto LABEL_13;
  }
  if (v13)
  {
    double v48 = 5.0;
    v13[2](v13, 5.0);
  }
  else
  {
    double v48 = 0.0;
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-=- Sending Firmware Payload =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  if (!self->super._updaterOperational)
  {
    v68 = +[NSMutableDictionary dictionary];
    unsigned int v23 = v68;
    CFStringRef v69 = @"Update Aborted before payload xmit";
LABEL_138:
    [v68 setObject:v69 forKeyedSubscript:@"Notes"];
    id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v23];
LABEL_139:
    v88 = self->super._delegate;
    v89 = [v106 objectForKeyedSubscript:@"Hardware Device Class"];
    v90 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)v88 log:1, @"%@ with S/N %@ - Update aborted", v89, v90 format];

    goto LABEL_11;
  }
  int v100 = v39;
  uint64_t v50 = 0;
  do
  {
    if ((unint64_t)[v107 length] <= v50)
    {
      if (self->super._updaterOperational) {
        goto LABEL_135;
      }
LABEL_137:
      v68 = +[NSMutableDictionary dictionary];
      unsigned int v23 = v68;
      CFStringRef v69 = @"Update Aborted during payload xmit";
      goto LABEL_138;
    }
    if ([v107 length] - v50 <= 0x40) {
      uint64_t v51 = [v107 length] - v50;
    }
    else {
      uint64_t v51 = 64;
    }
    int v101 = v50;
    objc_msgSend(v107, "getBytes:range:", v111, v50, v51);
    v52 = 0;
    int v53 = -4;
    while (1)
    {
      BOOL v54 = __CFADD__(v53++, 1);
      if (v54) {
        break;
      }
      id v55 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSWriteReg:v111 bufferLength:v51 registerAddress:9];

      if (!v55)
      {
        uint64_t v20 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1683441235];
        if (v20) {
          goto LABEL_141;
        }
        v52 = 0;
        int v57 = -4;
        while (1)
        {
          BOOL v54 = __CFADD__(v57++, 1);
          if (v54) {
            goto LABEL_65;
          }
          int v110 = 4;
          v58 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:v111 bufferLength:4 registerAddress:9 returnedBufferLength:&v110];

          if (!v58)
          {
            BOOL v60 = SLOBYTE(v111[0]) < 0;
            if ((v111[0] & 0xF) == 0) {
              goto LABEL_67;
            }
            int v63 = SLOBYTE(v111[0]);
            [(FudPluginDelegate *)self->super._delegate log:7 format:@"******** ERROR: Firmware upload failed"];
            [(FudPluginDelegate *)self->super._delegate log:7, @"    SFWd_cmd Command returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0]) format];
            CFStringRef v64 = @"NO";
            if (v63 < 0) {
              CFStringRef v64 = @"YES";
            }
            [(FudPluginDelegate *)self->super._delegate log:7, @"    - isMoreDataExpected: %@", v64 format];
            int v61 = v101;
            if ((v111[0] & 0xF) != 0)
            {
              v65 = +[NSMutableDictionary dictionary];
              v66 = +[NSString stringWithFormat:@"SFWd_cmd Command returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0])];
              [v65 setObject:v66 forKeyedSubscript:@"Notes"];

              uint64_t v67 = 11008;
              goto LABEL_136;
            }
            goto LABEL_68;
          }
          char v109 = 1;
          v52 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:&v109];

          id v27 = 0;
          if (v52) {
            BOOL v59 = 0;
          }
          else {
            BOOL v59 = v109 == 0;
          }
          if (v59) {
            goto LABEL_13;
          }
        }
      }
      char v109 = 1;
      v52 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:&v109];

      id v27 = 0;
      if (v52) {
        BOOL v56 = 0;
      }
      else {
        BOOL v56 = v109 == 0;
      }
      if (v56) {
        goto LABEL_13;
      }
    }
LABEL_65:
    id v27 = v52;
    if (v52) {
      goto LABEL_13;
    }
    LOBYTE(v60) = 1;
LABEL_67:
    int v61 = v101;
LABEL_68:
    if (v13)
    {
      double v48 = v48 + (double)v51 * 100.0 / (double)(unint64_t)[v107 length] * 0.9;
      v13[2](v13, v48);
    }
    uint64_t v50 = (v51 + v61);
  }
  while (self->super._updaterOperational && v60);
  if (!self->super._updaterOperational) {
    goto LABEL_137;
  }
  if (v60 || (unint64_t)[v107 length] > v50)
  {
LABEL_135:
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"******** ERROR: Data size did not match what the micro was expecting"];
    [(FudPluginDelegate *)self->super._delegate log:7, @"    SFWd_cmd Command returned: %02X%02X%02X%02X %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0]), BYTE4(v111[0]), BYTE5(v111[0]), BYTE6(v111[0]), BYTE7(v111[0]) format];
    v65 = +[NSMutableDictionary dictionary];
    v87 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Data size did not match what the micro was expecting.  Sent = 0x%X.  Expected = 0x%lX", v50, [v107 length]);
    [v65 setObject:v87 forKeyedSubscript:@"Notes"];

    uint64_t v67 = 11009;
LABEL_136:
    id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v67 userInfo:v65];

    goto LABEL_13;
  }
  -[FudPluginDelegate log:format:](self->super._delegate, "log:format:", 7, @"Firmware data length was: %lu bytes (0x%lX)", [v107 length], objc_msgSend(v107, "length"));
  if (v13)
  {
    double v48 = 95.0;
    v13[2](v13, 95.0);
  }
  usleep(0xC350u);
  v70 = v108;
  if ((v102 & v100) != 1 || ![v108 length])
  {
    [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=- Completing Update Operation -=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
    if (self->super._updaterOperational)
    {
      uint64_t v20 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1968653907];
      if (v20) {
        goto LABEL_141;
      }
      v72 = 0;
      int v84 = -4;
      while (1)
      {
        BOOL v54 = __CFADD__(v84++, 1);
        if (v54) {
          goto LABEL_150;
        }
        int v110 = 4;
        v85 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:v111 bufferLength:4 registerAddress:9 returnedBufferLength:&v110];

        if (!v85)
        {
          if ((v111[0] & 0xF) != 0)
          {
            [(FudPluginDelegate *)self->super._delegate log:7 format:@"******** ERROR: Flash complete failed"];
            [(FudPluginDelegate *)self->super._delegate log:7, @"    SFWu_cmd returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0]) format];
            v65 = +[NSMutableDictionary dictionary];
            v91 = +[NSString stringWithFormat:@"SFWu_cmd Command returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0])];
            [v65 setObject:v91 forKeyedSubscript:@"Notes"];

            uint64_t v67 = 11776;
            goto LABEL_136;
          }
          v72 = 0;
          goto LABEL_150;
        }
        char v109 = 1;
        v72 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:&v109];

        id v27 = 0;
        if (v72) {
          BOOL v86 = 0;
        }
        else {
          BOOL v86 = v109 == 0;
        }
        if (v86) {
          goto LABEL_13;
        }
      }
    }
    v68 = +[NSMutableDictionary dictionary];
    unsigned int v23 = v68;
    CFStringRef v69 = @"Update Aborted before update complete call";
    goto LABEL_138;
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-= Sending Signature Payload =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  BOOL updaterOperational = self->super._updaterOperational;
  if (!self->super._updaterOperational)
  {
    uint64_t v73 = 0;
    v72 = 0;
    BOOL v78 = 1;
    goto LABEL_145;
  }
  v72 = 0;
  uint64_t v73 = 0;
  while (2)
  {
    if ((unint64_t)[v70 length] <= v73)
    {
      if (self->super._updaterOperational) {
        goto LABEL_152;
      }
      goto LABEL_155;
    }
    if ([v70 length] - v73 <= 0x40) {
      uint64_t v74 = [v70 length] - v73;
    }
    else {
      uint64_t v74 = 64;
    }
    int v103 = v73;
    objc_msgSend(v70, "getBytes:range:", v111, v73, v74);
    int v75 = -4;
    while (1)
    {
      BOOL v54 = __CFADD__(v75++, 1);
      if (v54)
      {
        BOOL v78 = 1;
        v70 = v108;
        goto LABEL_116;
      }
      v76 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSWriteReg:v111 bufferLength:v74 registerAddress:9];

      if (!v76) {
        break;
      }
      char v109 = 1;
      v72 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:&v109];

      id v27 = 0;
      if (v72) {
        BOOL v77 = 0;
      }
      else {
        BOOL v77 = v109 == 0;
      }
      if (v77) {
        goto LABEL_13;
      }
    }
    uint64_t v20 = [(USBCPDAccess *)self->super._pdAccess RemoteExecuteCommand:1935099475];
    if (v20) {
      goto LABEL_141;
    }
    v72 = 0;
    int v79 = -4;
    while (1)
    {
      BOOL v54 = __CFADD__(v79++, 1);
      if (v54) {
        break;
      }
      int v110 = 4;
      v80 = [(USBCPDAccess *)self->super._pdAccess RemoteIECSReadReg:v111 bufferLength:4 registerAddress:9 returnedBufferLength:&v110];

      if (!v80)
      {
        v72 = 0;
        break;
      }
      char v109 = 1;
      v72 = [(USBCPDAccess *)self->super._pdAccess DeviceInAlternateMode:&v109];

      id v27 = 0;
      if (v72) {
        BOOL v81 = 0;
      }
      else {
        BOOL v81 = v109 == 0;
      }
      if (v81) {
        goto LABEL_13;
      }
    }
    BOOL v78 = SLOBYTE(v111[0]) < 0;
    v70 = v108;
    if ((v111[0] & 0xF) != 0)
    {
      [(FudPluginDelegate *)self->super._delegate log:7 format:@"******** ERROR: Signature upload failed"];
      [(FudPluginDelegate *)self->super._delegate log:7, @"    SFWs_cmd Command returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0]) format];
      v97 = +[NSMutableDictionary dictionary];
      v98 = v97;
      if (v72) {
        [v97 setObject:v72 forKeyedSubscript:@"Previous Error Response"];
      }
      v99 = +[NSString stringWithFormat:@"SFWs_cmd Command returned: %02X%02X%02X%02X", LOBYTE(v111[0]), BYTE1(v111[0]), BYTE2(v111[0]), BYTE3(v111[0])];
      [v98 setObject:v99 forKeyedSubscript:@"Notes"];

      id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:11264 userInfo:v98];

      goto LABEL_13;
    }
LABEL_116:
    if (v13)
    {
      BOOL v82 = v78;
      double v48 = v48 + (double)v74 * 100.0 / (double)(unint64_t)[v70 length] * 0.05;
      v13[2](v13, v48);
      BOOL v78 = v82;
    }
    uint64_t v73 = (v74 + v103);
    BOOL updaterOperational = self->super._updaterOperational;
    if (self->super._updaterOperational && v78) {
      continue;
    }
    break;
  }
LABEL_145:
  if (!updaterOperational)
  {
LABEL_155:
    unsigned int v23 = +[NSMutableDictionary dictionary];
    [v23 setObject:@"Update Aborted during signature xmit" forKeyedSubscript:@"Notes"];
    id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v23];

    goto LABEL_139;
  }
  if (!v78 && (unint64_t)[v70 length] <= v73)
  {
LABEL_150:
    v92 = self->super._delegate;
    v93 = [v106 objectForKeyedSubscript:@"Hardware Device Class"];
    v94 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)v92 log:1, @"%@ with S/N %@ - Accessory firmware update succeeded", v93, v94 format];

    id v27 = v72;
    goto LABEL_13;
  }
LABEL_152:
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"******** ERROR: Signature size did not match what the micro was expecting"];
  v95 = +[NSMutableDictionary dictionary];
  unsigned int v23 = v95;
  if (v72) {
    [v95 setObject:v72 forKeyedSubscript:@"Previous Error Response"];
  }
  v96 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Signature size did not match what the micro was expecting.  Sent = 0x%X.  Expected = 0x%lX", v73, [v108 length]);
  [v23 setObject:v96 forKeyedSubscript:@"Notes"];

  id v27 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:11264 userInfo:v23];

LABEL_12:
LABEL_13:
  if (v13) {
    v13[2](v13, 100.0);
  }
  if (v27)
  {
    long long v32 = +[NSMutableDictionary dictionary];
    [v32 setObject:v27 forKeyedSubscript:@"Previous Error Response"];
    long long v33 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:10496 userInfo:v32];

    v34 = self->super._delegate;
    uint64_t v35 = v106;
    uint64_t v36 = [v106 objectForKeyedSubscript:@"Hardware Device Class"];
    int v37 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)v34 log:1, @"%@ with S/N %@ - Accessory firmware update failed: %@", v36, v37, v33 format];
  }
  else
  {
    long long v33 = 0;
    uint64_t v35 = v106;
  }
  if (v10) {
    v10[2](v10, 0, v33);
  }

  return v33;
}

- (id)finishFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  uint64_t v9 = (void (**)(id, void *, void *))a3;
  id v10 = a4;
  id v11 = (void (**)(void, double))a6;
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=- Completing Update Operation -=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  if (self->super._updaterOperational)
  {
    id v12 = v10;
    if (v11) {
      v11[2](v11, 50.0);
    }
    long long v13 = 0;
  }
  else
  {
    char v14 = +[NSMutableDictionary dictionary];
    [v14 setObject:@"Update Aborted at start of finish" forKeyedSubscript:@"Notes"];
    uint64_t v15 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13312 userInfo:v14];
    delegate = self->super._delegate;
    id v12 = v10;
    id v17 = [v10 objectForKeyedSubscript:@"Hardware Device Class"];
    id v18 = [(USBCThunderboltFirmwareUpdater *)self DeviceSerialNumber];
    [(FudPluginDelegate *)delegate log:1, @"%@ with S/N %@ - Update aborted", v17, v18 format];

    long long v13 = (void *)v15;
    id v19 = [(USBCFirmwareUpdater *)self ExitUpdateMode:0];
  }
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"-=-=-=-=-=-=-=-=-=-=-= Completing Reset Operation -=-=-=-=-=-=-=-=-=-=-=-=-=-=-"];
  uint64_t v20 = (void *)MGCopyAnswer();
  CFStringRef v46 = 0;
  if (([v20 containsString:@"arm"] & 1) == 0)
  {
    BOOL v42 = v20;
    BOOL v43 = v13;
    CFStringRef v44 = v11;
    int v45 = v9;
    uint64_t v21 = +[NSMutableDictionary dictionaryWithCapacity:1];
    uint64_t v22 = [(USBCFirmwareUpdater *)self BlessArgumentsWithRemoteReset:0];
    if (v22)
    {
      unsigned int v23 = +[NSString stringWithFormat:@"%u %u", self->super._rid, self->super._address];
      uint64_t v24 = +[NSNumber numberWithInt:500];
      CFStringRef v25 = +[NSDictionary dictionaryWithObjectsAndKeys:v22, @"BlessArguments", v24, @"Priority", v23, @"UniqueID", 0, 0];

      [v21 setObject:v25 forKeyedSubscript:@"BlessSettings"];
    }
    CFStringRef v46 = v21;
    id v26 = objc_alloc_init((Class)NSMutableString);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v27 = v22;
    id v28 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v49;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(__CFString **)(*((void *)&v48 + 1) + 8 * i);
          if ([v26 length]) {
            [v26 appendString:@" "];
          }
          [(__CFString *)v32 rangeOfString:@" "];
          long long v33 = v26;
          if (v34)
          {
            [v26 appendString:@"\""];
            [v26 appendString:v32];
            long long v33 = v26;
            CFStringRef v35 = @"\"";
          }
          else
          {
            CFStringRef v35 = v32;
          }
          [v33 appendString:v35];
        }
        id v29 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v29);
    }

    [(FudPluginDelegate *)self->super._delegate log:7, @"Bless Invocation: %@", v26 format];
    uint64_t v9 = v45;
    long long v13 = v43;
    id v11 = v44;
    uint64_t v20 = v42;
  }
  pdAccess = self->super._pdAccess;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000173A8;
  v47[3] = &unk_100024540;
  v47[4] = self;
  id v37 = [(USBCPDAccess *)pdAccess ExitUpdateMode:v47 remoteReset:0];
  [(FudPluginDelegate *)self->super._delegate log:7 format:@"Past 'Gaid' calls"];
  if (v11) {
    v11[2](v11, 100.0);
  }
  if (v13)
  {
    long long v38 = +[NSMutableDictionary dictionary];
    [v38 setObject:v13 forKeyedSubscript:@"Previous Error Response"];
    int v39 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:10496 userInfo:v38];
  }
  else
  {
    int v39 = 0;
  }
  CFStringRef v40 = self->super._delegate;
  if (v9)
  {
    [(FudPluginDelegate *)v40 log:7, @"Info Dict: %@", v46 format];
    v9[2](v9, v46, v39);
  }
  else
  {
    [(FudPluginDelegate *)v40 log:7 format:@"No callback?"];
  }

  return v39;
}

@end