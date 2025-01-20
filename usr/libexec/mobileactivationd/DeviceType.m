@interface DeviceType
+ (id)sharedInstance;
- (BOOL)device_supports_dcrt_oob;
- (BOOL)device_supports_eda_certificates;
- (BOOL)device_supports_mfi_certificates;
- (BOOL)has_baseband;
- (BOOL)has_internal_diagnostics;
- (BOOL)is_audio_accessory;
- (BOOL)is_dev_board;
- (BOOL)is_devfused_undemoted;
- (BOOL)is_fpga;
- (BOOL)is_internal_build;
- (BOOL)is_ipad;
- (BOOL)is_iphone;
- (BOOL)is_ipod;
- (BOOL)is_prodfused_demoted;
- (BOOL)runningInRAMDisk;
- (BOOL)should_hactivate;
- (DeviceType)init;
- (NSString)device_class;
- (NSString)hardware_model;
- (NSString)product_type;
- (NSString)soc_generation;
- (id)copyBootArgs;
- (id)copyBootSessionUUID;
- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5;
- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4;
- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5;
@end

@implementation DeviceType

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_device_type;

  return v2;
}

void __28__DeviceType_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(DeviceType);
  v2 = (void *)sharedInstance_device_type;
  sharedInstance_device_type = (uint64_t)v1;
}

- (DeviceType)init
{
  v60.receiver = self;
  v60.super_class = (Class)DeviceType;
  v2 = [(DeviceType *)&v60 init];
  if (v2)
  {
    [@"com.apple.mobileactivationd" UTF8String];
    v2->_is_internal_build = os_variant_allows_internal_security_policies();
    [@"com.apple.mobileactivationd" UTF8String];
    v2->_has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id v3 = +[GestaltHlpr getSharedInstance];
    id v4 = [v3 copyAnswer:@"ProductType"];
    v5 = (NSString *)isNSString(v4);
    product_type = v2->_product_type;
    v2->_product_type = v5;

    id v7 = [v3 copyAnswer:@"HWModelStr"];
    v8 = (NSString *)isNSString(v7);
    hardware_model = v2->_hardware_model;
    v2->_hardware_model = v8;

    v2->_is_ipod = [(NSString *)v2->_product_type hasPrefix:@"iPod"];
    v2->_is_ipad = [(NSString *)v2->_product_type hasPrefix:@"iPad"];
    v2->_is_iphone = [(NSString *)v2->_product_type hasPrefix:@"iPhone"];
    v2->_is_audio_accessory = [(NSString *)v2->_product_type hasPrefix:@"AudioAccessory"];
    v2->_is_dev_board = [(NSString *)v2->_hardware_model hasSuffix:@"DEV"];
    id v10 = [v3 copyAnswer:@"DeviceClass"];
    v11 = (NSString *)isNSString(v10);
    device_class = v2->_device_class;
    v2->_device_class = v11;

    v2->_has_baseband = [v3 getBoolAnswer:@"HasBaseband"];
    id v13 = [@"IODeviceTree" stringByAppendingString:@":/arm-io"];
    id v14 = [(DeviceType *)v2 copyDeviceTreeString:v13 key:@"soc-generation" defaultValue:0];
    v15 = (NSString *)[v14 uppercaseString];
    soc_generation = v2->_soc_generation;
    v2->_soc_generation = v15;

    id v17 = +[GestaltHlpr getSharedInstance];
    id v18 = [v17 copyAnswer:@"ChipID"];
    id v19 = isNSNumber(v18);

    if (([v19 isEqualToNumber:&off_10027EDE0] & 1) != 0
      || ([v19 isEqualToNumber:&off_10027EDF8] & 1) != 0
      || ([v19 isEqualToNumber:&off_10027EE10] & 1) != 0)
    {
      LOBYTE(v20) = 0;
    }
    else
    {
      unsigned int v20 = [v19 isEqualToNumber:&off_10027EE28] ^ 1;
    }
    v2->_device_supports_mfi_certificates = v20;
    if (([v19 isEqualToNumber:&off_10027EE28] & 1) != 0
      || ([v19 isEqualToNumber:&off_10027EDF8] & 1) != 0)
    {
      LOBYTE(v21) = 0;
    }
    else
    {
      unsigned int v21 = [v19 isEqualToNumber:&off_10027EE10] ^ 1;
    }
    v2->_device_supports_eda_certificates = v21;
    v2->_device_supports_dcrt_oob = [v3 getBoolAnswer:@"DeviceSupportsFairPlaySecureVideoPath"];
    id v22 = [@"IODeviceTree" stringByAppendingString:@":/product"];
    id v23 = [(DeviceType *)v2 copyDeviceTreeInt:v22 key:@"allow-hactivation" defaultValue:0];

    id v24 = [v3 copyAnswer:@"CertificateProductionStatus"];
    id v25 = isNSNumber(v24);

    id v26 = [v3 copyAnswer:@"EffectiveProductionStatusAp"];
    id v27 = isNSNumber(v26);

    id v28 = [v3 copyAnswer:@"CertificateSecurityMode"];
    id v29 = isNSNumber(v28);

    id v30 = [v3 copyAnswer:@"EffectiveSecurityModeSEP"];
    id v31 = isNSNumber(v30);

    if (v25 && v27 && v31 && v29)
    {
      if ([v25 isEqualToNumber:&off_10027EE40]
        && [v27 isEqualToNumber:&off_10027EE58]
        && [v29 isEqualToNumber:&off_10027EE40]
        && [v31 isEqualToNumber:&off_10027EE40])
      {
        v2->_should_hactivate = 1;
        v2->_is_prodfused_demoted = 1;
      }
      if ([v25 isEqualToNumber:&off_10027EE58]
        && [v27 isEqualToNumber:&off_10027EE58]
        && [v29 isEqualToNumber:&off_10027EE40]
        && [v31 isEqualToNumber:&off_10027EE40])
      {
        v2->_should_hactivate = 1;
        v2->_is_devfused_undemoted = 1;
      }
    }
    if (!v2->_is_internal_build) {
      goto LABEL_50;
    }
    if (!v2->_should_hactivate) {
      v2->_should_hactivate = [v3 getBoolAnswer:@"ShouldHactivate"];
    }
    id v32 = [(DeviceType *)v2 copyBootArgs];
    v33 = +[NSCharacterSet whitespaceCharacterSet];
    id v55 = v32;
    id v34 = [v32 componentsSeparatedByCharactersInSet:v33];

    if ([(NSString *)v2->_product_type containsString:@"iFPGA"])
    {
      v2->_should_hactivate = 1;
      v2->_is_fpga = 1;
    }
    id v56 = v29;
    if (v2->_is_dev_board) {
      v2->_should_hactivate = 1;
    }
    id v35 = isNSNumber(v23);
    if (v35)
    {
      v36 = v35;
      unsigned int v37 = [v23 BOOLValue];

      if (v37) {
        v2->_should_hactivate = 1;
      }
    }
    if ([v34 containsObject:@"disable-hactivation-ma=1"]) {
      v2->_should_hactivate = 0;
    }
    id v58 = v27;
    id v59 = v34;
    id v57 = v23;
    v38 = +[NSFileManager defaultManager];
    unsigned int v39 = [(NSFileManager *)v38 fileExistsAtPath:@"/AppleInternal/Lockdown/.hactivateoff"];

    if (v39) {
      v2->_should_hactivate = 0;
    }
    id v40 = v31;
    id v41 = objc_alloc((Class)NSUserDefaults);
    id v42 = [v41 persistentDomainForName:@"com.apple.mobileactivationd"];

    id v43 = [v42 objectForKeyedSubscript:@"DisableHactivation"];
    id v44 = isNSNumber(v43);
    if (v44)
    {
      v45 = v44;
      id v46 = [v42 objectForKeyedSubscript:@"DisableHactivation"];
      unsigned int v47 = [v46 BOOLValue];

      if (v47) {
        v2->_should_hactivate = 0;
      }
    }
    else
    {
    }
    v48 = v59;
    if (is_virtual_machine())
    {
      id v49 = [@"IODeviceTree" stringByAppendingString:@":/chosen"];
      id v50 = [(DeviceType *)v2 copyDeviceTreeInt:v49 key:@"enable-avp-fairplay" defaultValue:0];

      id v51 = isNSNumber(v50);
      id v31 = v40;
      if (v51)
      {
        v52 = v51;
        unsigned int v53 = [v50 BOOLValue];

        id v27 = v58;
        if (v53) {
          v2->_should_hactivate = 0;
        }
        id v23 = v57;
        v48 = v59;
        goto LABEL_49;
      }
    }
    else
    {
      id v50 = 0;
      id v31 = v40;
    }
    id v23 = v57;
    id v27 = v58;
LABEL_49:

    id v29 = v56;
LABEL_50:
  }
  return v2;
}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  v5 = (__CFString *)a4;
  v6 = v5;
  CFTypeRef CFProperty = 0;
  if (a3 && v5)
  {
    io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMasterPortDefault, (const char *)[a3 fileSystemRepresentation]);
    if (v8)
    {
      io_object_t v9 = v8;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      CFTypeRef CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

- (id)copyBootSessionUUID
{
  size_t size = 0;
  id v2 = 0;
  if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    id v3 = malloc_type_malloc(size, 0x14BD9A43uLL);
    if (v3)
    {
      id v4 = v3;
      id v2 = 0;
      if (!sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0)) {
        id v2 = [objc_alloc((Class)NSString) initWithUTF8String:v4];
      }
      free(v4);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (id)copyBootArgs
{
  bzero(v5, 0x400uLL);
  size_t v4 = 1024;
  int v2 = sysctlbyname("kern.bootargs", v5, &v4, 0, 0);
  id result = 0;
  if (!v2) {
    return [objc_alloc((Class)NSString) initWithUTF8String:v5];
  }
  return result;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSNumber numberWithInt:v5];
  v11 = 0;
  unsigned int v17 = v5;
  if (v8 && v9)
  {
    v11 = [(DeviceType *)self copyDeviceTreeProperty:v8 key:v9];
    id v12 = isNSData(v11);
    if (v12)
    {
    }
    else
    {
      id v13 = isNSNumber(v11);

      if (!v13) {
        goto LABEL_10;
      }
    }
    id v14 = isNSData(v11);

    if (v14)
    {
      if ([(NSNumber *)v11 length] == (id)4)
      {
        [(NSNumber *)v11 getBytes:&v17 length:4];
        v15 = +[NSNumber numberWithInt:v17];

        id v10 = v15;
      }
    }
    else
    {
      v11 = v11;

      id v10 = v11;
    }
  }
LABEL_10:

  return v10;
}

- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  id v10 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  id v11 = v8;
  if (a4)
  {
    id v10 = [(DeviceType *)self copyDeviceTreeProperty:a3 key:a4];
    id v12 = isNSData(v10);
    if (v12)
    {
      id v13 = v12;
      id v14 = [v10 length];

      if (v14)
      {
        id v15 = objc_alloc((Class)NSString);
        id v10 = v10;
        id v11 = [v15 initWithUTF8String:objc_msgSend(v10, "bytes")];

        goto LABEL_7;
      }
    }
LABEL_6:
    id v11 = v9;
  }
LABEL_7:

  return v11;
}

- (BOOL)runningInRAMDisk
{
  id v2 = [(DeviceType *)self copyBootArgs];
  if (v2
    && (id v3 = +[NSCharacterSet whitespaceCharacterSet],
        id v4 = [v2 componentsSeparatedByCharactersInSet:v3],
        v3,
        v4))
  {
    unsigned __int8 v5 = [v4 containsObject:@"-restore"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (NSString)product_type
{
  return self->_product_type;
}

- (NSString)device_class
{
  return self->_device_class;
}

- (NSString)hardware_model
{
  return self->_hardware_model;
}

- (NSString)soc_generation
{
  return self->_soc_generation;
}

- (BOOL)device_supports_dcrt_oob
{
  return self->_device_supports_dcrt_oob;
}

- (BOOL)device_supports_mfi_certificates
{
  return self->_device_supports_mfi_certificates;
}

- (BOOL)device_supports_eda_certificates
{
  return self->_device_supports_eda_certificates;
}

- (BOOL)is_prodfused_demoted
{
  return self->_is_prodfused_demoted;
}

- (BOOL)is_devfused_undemoted
{
  return self->_is_devfused_undemoted;
}

- (BOOL)is_dev_board
{
  return self->_is_dev_board;
}

- (BOOL)is_fpga
{
  return self->_is_fpga;
}

- (BOOL)is_ipod
{
  return self->_is_ipod;
}

- (BOOL)is_ipad
{
  return self->_is_ipad;
}

- (BOOL)is_iphone
{
  return self->_is_iphone;
}

- (BOOL)is_audio_accessory
{
  return self->_is_audio_accessory;
}

- (BOOL)has_baseband
{
  return self->_has_baseband;
}

- (BOOL)should_hactivate
{
  return self->_should_hactivate;
}

- (BOOL)is_internal_build
{
  return self->_is_internal_build;
}

- (BOOL)has_internal_diagnostics
{
  return self->_has_internal_diagnostics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soc_generation, 0);
  objc_storeStrong((id *)&self->_hardware_model, 0);
  objc_storeStrong((id *)&self->_device_class, 0);

  objc_storeStrong((id *)&self->_product_type, 0);
}

@end