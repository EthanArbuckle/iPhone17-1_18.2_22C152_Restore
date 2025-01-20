@interface MSUBootFirmwareUpdater
+ (BOOL)isSingleStageBoot;
+ (BOOL)requiresSEPInFW;
+ (BOOL)supportsAFUH;
+ (BOOL)supportsDualSPINAND;
+ (BOOL)supportsDualiBoot;
+ (BOOL)supportsPCIeNANDBoot;
+ (id)IOMatchingPropertyTable;
+ (id)_updaterClasses;
+ (id)updater;
+ (id)updaterForDevice;
+ (id)updaterWithIOService:(unsigned int)a3;
+ (id)updaterWithTimeout:(double)a3;
- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4;
- (BOOL)isErase;
- (BOOL)shouldCommit;
- (BOOL)supportsSlotIDs;
- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5;
- (BOOL)updateBootFirmwareWithError:(id *)a3;
- (MSUBootFirmwareUpdater)init;
- (MSUBootFirmwareUpdater)initWithIOService:(unsigned int)a3;
- (MSUBootFirmwareUpdater)initWithIOServiceMatching:(id)a3;
- (NSArray)bootBlockImages;
- (NSArray)firmwareImages;
- (NSData)ans2Data;
- (NSData)apNonce;
- (NSData)daliData;
- (NSData)ibootData;
- (NSData)llbData;
- (NSData)logoData;
- (id)_encodeFirmware:(id)a3 withRestoreInfo:(id)a4;
- (id)_restoreInfoDictionary;
- (id)copyFirmwareWithRestoreInfo:(id)a3;
- (int)_encodeAndWriteFirmware:(id)a3 toWriter:(id)a4 withError:(id *)a5;
- (unsigned)apNonceSlotID;
- (unsigned)matchedService;
- (void)dealloc;
- (void)setAns2Data:(id)a3;
- (void)setApNonce:(id)a3;
- (void)setApNonceSlotID:(unsigned int)a3;
- (void)setBootBlockImages:(id)a3;
- (void)setDaliData:(id)a3;
- (void)setFirmwareImages:(id)a3;
- (void)setIbootData:(id)a3;
- (void)setIsErase:(BOOL)a3;
- (void)setLlbData:(id)a3;
- (void)setLogoData:(id)a3;
- (void)setShouldCommit:(BOOL)a3;
@end

@implementation MSUBootFirmwareUpdater

+ (id)_updaterClasses
{
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v7[2] = objc_opt_class();
    v7[3] = objc_opt_class();
    v7[4] = objc_opt_class();
    v3 = (id *)v7;
    uint64_t v4 = 5;
  }
  else
  {
    id v6 = a1;
    v3 = &v6;
    uint64_t v4 = 1;
  }
  return +[NSArray arrayWithObjects:v3 count:v4];
}

+ (id)updater
{
  if ((id)objc_opt_class() != a1)
  {
    id v3 = objc_alloc_init((Class)a1);
    return v3;
  }
  if ([a1 supportsPCIeNANDBoot])
  {
    v5 = PCIeNANDiBootUpdater;
LABEL_9:
    return [(__objc2_class *)v5 updater];
  }
  if ([a1 supportsDualiBoot])
  {
    v5 = SPIiBootUpdater;
    goto LABEL_9;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [a1 _updaterClasses];
  id result = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
LABEL_14:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v6);
      }
      id result = [*(id *)(*((void *)&v10 + 1) + 8 * v9) updater];
      if (result) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id result = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v7 = result;
        if (result) {
          goto LABEL_14;
        }
        return result;
      }
    }
  }
  return result;
}

+ (id)updaterWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((id)objc_opt_class() == a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = [a1 _updaterClasses];
    id result = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      id v8 = result;
      uint64_t v9 = *(void *)v12;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        id result = [*(id *)(*((void *)&v11 + 1) + 8 * v10) updaterWithIOService:v3];
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id result = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
          id v8 = result;
          if (result) {
            goto LABEL_7;
          }
          return result;
        }
      }
    }
  }
  else
  {
    id v5 = [objc_alloc((Class)a1) initWithIOService:v3];
    return v5;
  }
  return result;
}

+ (id)updaterWithTimeout:(double)a3
{
  id v5 = +[NSProcessInfo processInfo];
  [(NSProcessInfo *)v5 systemUptime];
  double v7 = v6 + a3;
  NSStringFromClass((Class)a1);
  iBU_LOG_real(@"Waiting %ld seconds for %@\n", "+[MSUBootFirmwareUpdater updaterWithTimeout:]", v8, v9, v10, v11, v12, v13, llround(a3));
  while (1)
  {
    id v14 = [a1 updater];
    if (v14) {
      break;
    }
    [(NSProcessInfo *)v5 systemUptime];
    uint64_t v16 = llround(v7 - v15);
    sleep(v16 > 0);
    if (v16 <= 0)
    {
      CFStringRef v23 = @"Found no matching service.";
      goto LABEL_6;
    }
  }
  v24 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v24);
  CFStringRef v23 = @"Created an instance of %@ to update this device's firmware and boot images";
LABEL_6:
  iBU_LOG_real((uint64_t)v23, "+[MSUBootFirmwareUpdater updaterWithTimeout:]", v17, v18, v19, v20, v21, v22, (uint64_t)v26);
  return v14;
}

+ (id)updaterForDevice
{
  return [a1 updaterWithTimeout:60.0];
}

+ (id)IOMatchingPropertyTable
{
  return 0;
}

- (MSUBootFirmwareUpdater)init
{
  id v3 = [(id)objc_opt_class() IOMatchingPropertyTable];

  return [(MSUBootFirmwareUpdater *)self initWithIOServiceMatching:v3];
}

- (MSUBootFirmwareUpdater)initWithIOService:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MSUBootFirmwareUpdater;
  uint64_t v4 = [(MSUBootFirmwareUpdater *)&v10 init];
  if (v4)
  {
    BOOLean_t matches = 0;
    CFDictionaryRef v5 = (const __CFDictionary *)[(id)objc_opt_class() IOMatchingPropertyTable];
    if (a3
      && (CFDictionaryRef v6 = v5, [(__CFDictionary *)v5 count])
      && (!IOServiceMatchPropertyTable(a3, v6, &matches) ? (BOOL v7 = matches == 0) : (BOOL v7 = 1), !v7))
    {
      IOServiceWaitQuiet(a3, 0);
      IOObjectRetain(a3);
      v4->_matchedService = a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (MSUBootFirmwareUpdater)initWithIOServiceMatching:(id)a3
{
  if ([a3 count])
  {
    if (a3) {
      CFDictionaryRef v5 = (const __CFDictionary *)CFRetain(a3);
    }
    else {
      CFDictionaryRef v5 = 0;
    }
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  }
  else
  {
    uint64_t MatchingService = 0;
  }
  BOOL v7 = [(MSUBootFirmwareUpdater *)self initWithIOService:MatchingService];
  if (MatchingService && IOObjectRelease(MatchingService)) {
    sub_100015D54(&v9, v10);
  }
  return v7;
}

- (void)setApNonce:(id)a3
{
  uint64_t v4 = (NSData *)[a3 copy];

  self->_apNonce = v4;
  self->_apNonceSlotID = 0;
  self->_supportsSlotIDs = 0;
}

- (void)setApNonceSlotID:(unsigned int)a3
{
  self->_apNonce = 0;
  self->_apNonceSlotID = a3;
  self->_supportsSlotIDs = 1;
}

- (void)dealloc
{
  io_object_t matchedService = self->_matchedService;
  if (matchedService) {
    IOObjectRelease(matchedService);
  }
  v4.receiver = self;
  v4.super_class = (Class)MSUBootFirmwareUpdater;
  [(MSUBootFirmwareUpdater *)&v4 dealloc];
}

+ (BOOL)supportsAFUH
{
  return sub_100004904("IODeviceTree:/product", @"atomic-firmware-update-support");
}

+ (BOOL)supportsPCIeNANDBoot
{
  return sub_100004904("IODeviceTree:/defaults", @"pcie-nand-boot-supported");
}

+ (BOOL)supportsDualiBoot
{
  int v3 = sub_100004904("IODeviceTree:/product", @"dual-iboot-support");
  if (v3) {
    LOBYTE(v3) = [a1 supportsPCIeNANDBoot] ^ 1;
  }
  return v3;
}

+ (BOOL)supportsDualSPINAND
{
  return sub_100004A54(@"dual-spi-nand");
}

+ (BOOL)requiresSEPInFW
{
  return sub_100004A54(@"sep-is-firmware-payload");
}

+ (BOOL)isSingleStageBoot
{
  return sub_100004904("IODeviceTree:/product", @"single-stage-boot");
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  return 0;
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  return -[MSUBootFirmwareUpdater updateBootFirmwareWithError:](self, "updateBootFirmwareWithError:", a5, a4);
}

- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4
{
  BOOL v7 = objc_opt_new();
  id v77 = (id)objc_opt_new();
  v88[0] = @"iBoot";
  v88[1] = @"ANS";
  v88[2] = @"iBootData";
  v88[3] = @"DCP";
  v88[4] = @"AppleLogo";
  obj = +[NSArray arrayWithObjects:v88 count:5];
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 1;
  uint64_t v8 = (void *)((uint64_t (*)(firmware_update_context *))a3->var2)(a4);
  [v7 addObject:v8];
  uint64_t v9 = (void *)((uint64_t (*)(firmware_update_context *))a3->var3)(a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 mutableCopy];
    if ([(id)objc_opt_class() isSingleStageBoot])
    {
      iBU_LOG_real(@"iBoot data provided in firmware images yet this is single-stage-boot device - removing from firmware images being updated.", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v11, v12, v13, v14, v15, v16, v70);
      [v10 removeObjectForKey:@"iBoot"];
      id v17 = 0;
    }
    else
    {
      id v17 = [v10 objectForKey:@"iBoot"];
    }
    id v75 = [v10 objectForKey:@"Dali"];
    iBU_LOG_real(@"Ordered firmware image names: %@.", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v27, v28, v29, v30, v31, v32, (uint64_t)obj);
    v74 = a3;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v33 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v87 count:16];
    id v71 = v17;
    v72 = a4;
    v73 = v9;
    id v25 = 0;
    id v26 = 0;
    if (v33)
    {
      uint64_t v34 = *(void *)v80;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v80 != v34) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if ([v10 objectForKeyedSubscript:v36])
          {
            if ([v36 isEqualToString:@"ANS"])
            {
              iBU_LOG_real(@"Pulling ANS out of the list of firmwares.", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v37, v38, v39, v40, v41, v42, v70);
              id v25 = [v10 objectForKeyedSubscript:v36];
            }
            if ([v36 isEqualToString:@"AppleLogo"])
            {
              iBU_LOG_real(@"Pulling Logo out of the list of firmwares.", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v43, v44, v45, v46, v47, v48, v70);
              id v26 = [v10 objectForKeyedSubscript:v36];
            }
            [v77 addObject:[v10 objectForKeyedSubscript:v36]];
            [v10 removeObjectForKey:v36];
          }
        }
        id v33 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v33);
    }
    uint64_t v9 = v73;
    id v24 = v71;
    a4 = v72;
    a3 = v74;
    [v77 addObjectsFromArray:[v10 allValues]];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      iBU_LOG_real(@"request for images data returned non-Array and non-Dictionary. Type returned was: %@", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v18, v19, v20, v21, v22, v23, (uint64_t)v9);
LABEL_29:
      BOOL v68 = 0;
      goto LABEL_30;
    }
    [v77 addObjectsFromArray:v9];
    id v75 = 0;
    id v24 = 0;
    id v25 = 0;
    id v26 = 0;
  }
  if ([(id)objc_opt_class() requiresSEPInFW])
  {
    v49 = (void *)((uint64_t (*)(firmware_update_context *))a3->var6)(a4);
    iBU_LOG_real(@"Appending SEP to firmwareImages", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v50, v51, v52, v53, v54, v55, v70);
    if (!v49)
    {
      iBU_LOG_real(@"NULL returned from copy_sep()!", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v56, v57, v58, v59, v60, v61, v70);
      goto LABEL_29;
    }
    [v77 addObject:v49];
  }
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3254779904;
  v78[2] = sub_100005054;
  v78[3] = &unk_1000249D0;
  v78[4] = &v83;
  [v77 enumerateObjectsUsingBlock:v78];
  if (!*((unsigned char *)v84 + 24))
  {
    iBU_LOG_real(@"Firmware images array contains non-CFDataRef/non-NSArray.", "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v62, v63, v64, v65, v66, v67, v70);
    goto LABEL_29;
  }
  ((void (*)(void, void, firmware_update_context *))a3->var1)(0, 0, a4);
  [(MSUBootFirmwareUpdater *)self setBootBlockImages:v7];
  [(MSUBootFirmwareUpdater *)self setFirmwareImages:v77];
  [(MSUBootFirmwareUpdater *)self setDaliData:v75];
  [(MSUBootFirmwareUpdater *)self setIbootData:v24];
  [(MSUBootFirmwareUpdater *)self setLlbData:v8];
  [(MSUBootFirmwareUpdater *)self setAns2Data:v25];
  [(MSUBootFirmwareUpdater *)self setLogoData:v26];
  BOOL v68 = 1;
LABEL_30:

  _Block_object_dispose(&v83, 8);
  return v68;
}

- (id)copyFirmwareWithRestoreInfo:(id)a3
{
  id v5 = [(MSUBootFirmwareUpdater *)self _restoreInfoDictionary];

  return [(MSUBootFirmwareUpdater *)self _encodeFirmware:a3 withRestoreInfo:v5];
}

- (id)_restoreInfoDictionary
{
  if ([(MSUBootFirmwareUpdater *)self supportsSlotIDs])
  {
    CFStringRef v10 = @"anid";
    uint64_t v11 = +[NSNumber numberWithUnsignedInt:[(MSUBootFirmwareUpdater *)self apNonceSlotID]];
    int v3 = &v11;
    objc_super v4 = &v10;
  }
  else
  {
    id v5 = [(MSUBootFirmwareUpdater *)self apNonce];
    if (!v5)
    {
      CFTypeRef v6 = sub_100005210("IODeviceTree:/chosen", @"boot-nonce");
      id v5 = (id)CFMakeCollectable(v6);
      if (!v5) {
        return (id)__NSDictionary0__;
      }
    }
    CFStringRef v8 = @"BNCN";
    uint64_t v9 = v5;
    int v3 = (NSNumber **)&v9;
    objc_super v4 = &v8;
  }
  return +[NSDictionary dictionaryWithObjects:v3 forKeys:v4 count:1];
}

- (int)_encodeAndWriteFirmware:(id)a3 toWriter:(id)a4 withError:(id *)a5
{
  id v9 = [(MSUBootFirmwareUpdater *)self _restoreInfoDictionary];
  if (!a3)
  {
    if (!a5) {
      return -536870212;
    }
    CFStringRef v19 = @"_encodeAndWriteFirmware called with NULL data?";
LABEL_9:
    uint64_t v20 = 7;
LABEL_12:
    *a5 = MSUBootFirmwareError(v20, 0, (uint64_t)v19, v10, v11, v12, v13, v14, v21);
    return -536870212;
  }
  uint64_t v10 = (uint64_t)v9;
  if (!v9)
  {
    if (!a5) {
      return -536870212;
    }
    CFStringRef v19 = @"_encodeAndWriteFirmware retrieved a null restoreInfo dictionary?";
    goto LABEL_9;
  }
  id v15 = [(MSUBootFirmwareUpdater *)self _encodeFirmware:a3 withRestoreInfo:v9];
  if (v15)
  {
    uint64_t v16 = v15;
    int v17 = [a4 writeData:v15 withError:a5];

    return v17;
  }
  if (a5)
  {
    CFStringRef v19 = @"_encodeAndWriteFirmware failed to encode Img4 data.";
    uint64_t v20 = 9;
    goto LABEL_12;
  }
  return -536870212;
}

- (id)_encodeFirmware:(id)a3 withRestoreInfo:(id)a4
{
  id result = [a3 length];
  if (result)
  {
    uint64_t v6 = AMAuthInstallApImg4EncodeRestoreInfo();
    if (v6)
    {
      iBU_LOG_real(@"AMAuthInstallApImg4EncodeRestoreInfo returned %d during Img4 encoding?", "-[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]", v7, v8, v9, v10, v11, v12, v6);
    }
    else
    {
      id v13 = [a3 length];
      [0 length];
      iBU_LOG_real(@"original data length: %lu. img4_restore_data length: %lu", "-[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    }
    return 0;
  }
  return result;
}

- (unsigned)matchedService
{
  return self->_matchedService;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)shouldCommit
{
  return self->_shouldCommit;
}

- (void)setShouldCommit:(BOOL)a3
{
  self->_shouldCommit = a3;
}

- (NSArray)bootBlockImages
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBootBlockImages:(id)a3
{
}

- (NSArray)firmwareImages
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFirmwareImages:(id)a3
{
}

- (NSData)llbData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLlbData:(id)a3
{
}

- (NSData)ans2Data
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAns2Data:(id)a3
{
}

- (NSData)daliData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDaliData:(id)a3
{
}

- (NSData)ibootData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIbootData:(id)a3
{
}

- (NSData)logoData
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLogoData:(id)a3
{
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (unsigned)apNonceSlotID
{
  return self->_apNonceSlotID;
}

- (BOOL)supportsSlotIDs
{
  return self->_supportsSlotIDs;
}

@end