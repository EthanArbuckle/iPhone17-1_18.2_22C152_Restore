@interface GTDeviceProperties
+ (BOOL)supportsSecureCoding;
+ (id)hardwareUUID;
+ (id)uniqueDeviceID;
- (BOOL)appleInternal;
- (BOOL)deviceSupportsLockdown;
- (BOOL)effectiveProductionStatusAp;
- (BOOL)isUIBuild;
- (BOOL)osInstallEnvironment;
- (BOOL)storeDemoMode;
- (GTDeviceProperties)initWithCoder:(id)a3;
- (GTDeviceProperties)initWithXPCObject:(id)a3;
- (NSString)buildVersion;
- (NSString)cpuArchitecture;
- (NSString)deviceClass;
- (NSString)hardwareModel;
- (NSString)mobileDeviceMinimumVersion;
- (NSString)osVersion;
- (NSString)productName;
- (NSString)productType;
- (NSString)reality;
- (NSString)releaseType;
- (NSString)uniqueDeviceID;
- (id)description;
- (id)initForEmbeddedSystem;
- (unint64_t)locationID;
- (unint64_t)remoteXPCVersionFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleInternal:(BOOL)a3;
- (void)setBuildVersion:(id)a3;
- (void)setCpuArchitecture:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceSupportsLockdown:(BOOL)a3;
- (void)setEffectiveProductionStatusAp:(BOOL)a3;
- (void)setHardwareModel:(id)a3;
- (void)setIsUIBuild:(BOOL)a3;
- (void)setLocationID:(unint64_t)a3;
- (void)setMobileDeviceMinimumVersion:(id)a3;
- (void)setOsInstallEnvironment:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setReality:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRemoteXPCVersionFlags:(unint64_t)a3;
- (void)setStoreDemoMode:(BOOL)a3;
- (void)setUniqueDeviceID:(id)a3;
@end

@implementation GTDeviceProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hardwareUUID
{
  memset(v6, 0, sizeof(v6));
  v5.tv_sec = 0;
  v5.tv_nsec = 0;
  int v2 = gethostuuid(v6, &v5);
  id v3 = 0;
  if (!v2) {
    id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v6];
  }

  return v3;
}

+ (id)uniqueDeviceID
{
  int v2 = (void *)MGCopyAnswer();

  return v2;
}

- (GTDeviceProperties)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)GTDeviceProperties;
  timespec v5 = [(GTDeviceProperties *)&v51 init];
  if (v5)
  {
    v5->_LocationID = xpc_dictionary_get_uint64(v4, "LocationID");
    string = xpc_dictionary_get_string(v4, "OSVersion");
    if (string) {
      v7 = string;
    }
    else {
      v7 = "";
    }
    uint64_t v8 = +[NSString stringWithUTF8String:v7];
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v8;

    v10 = xpc_dictionary_get_string(v4, "BuildVersion");
    if (v10) {
      v11 = v10;
    }
    else {
      v11 = "";
    }
    uint64_t v12 = +[NSString stringWithUTF8String:v11];
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v12;

    v14 = xpc_dictionary_get_string(v4, "ProductType");
    if (v14) {
      v15 = v14;
    }
    else {
      v15 = "";
    }
    uint64_t v16 = +[NSString stringWithUTF8String:v15];
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v16;

    v18 = xpc_dictionary_get_string(v4, "HWModel");
    if (v18) {
      v19 = v18;
    }
    else {
      v19 = "";
    }
    uint64_t v20 = +[NSString stringWithUTF8String:v19];
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v20;

    v22 = xpc_dictionary_get_string(v4, "UniqueDeviceID");
    if (v22) {
      v23 = v22;
    }
    else {
      v23 = "";
    }
    uint64_t v24 = +[NSString stringWithUTF8String:v23];
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v24;

    v26 = xpc_dictionary_get_string(v4, "Reality");
    if (v26) {
      v27 = v26;
    }
    else {
      v27 = "";
    }
    uint64_t v28 = +[NSString stringWithUTF8String:v27];
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v28;

    v5->_RemoteXPCVersionFlags = xpc_dictionary_get_uint64(v4, "RemoteXPCVersionFlags");
    v30 = xpc_dictionary_get_string(v4, "CPUArchitecture");
    if (v30) {
      v31 = v30;
    }
    else {
      v31 = "";
    }
    uint64_t v32 = +[NSString stringWithUTF8String:v31];
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v32;

    v34 = xpc_dictionary_get_string(v4, "DeviceClass");
    if (v34) {
      v35 = v34;
    }
    else {
      v35 = "";
    }
    uint64_t v36 = +[NSString stringWithUTF8String:v35];
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v36;

    v38 = xpc_dictionary_get_string(v4, "MobileDeviceMinimumVersion");
    if (v38) {
      v39 = v38;
    }
    else {
      v39 = "";
    }
    uint64_t v40 = +[NSString stringWithUTF8String:v39];
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v40;

    v42 = xpc_dictionary_get_string(v4, "ProductName");
    if (v42) {
      v43 = v42;
    }
    else {
      v43 = "";
    }
    uint64_t v44 = +[NSString stringWithUTF8String:v43];
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v44;

    v46 = xpc_dictionary_get_string(v4, "ReleaseType");
    if (v46) {
      v47 = v46;
    }
    else {
      v47 = "";
    }
    uint64_t v48 = +[NSString stringWithUTF8String:v47];
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v48;

    v5->_AppleInternal = xpc_dictionary_get_BOOL(v4, "AppleInternal");
    v5->_DeviceSupportsLockdown = xpc_dictionary_get_BOOL(v4, "DeviceSupportsLockdown");
    v5->_EffectiveProductionStatusAp = xpc_dictionary_get_BOOL(v4, "EffectiveProductionStatusAp");
    v5->_IsUIBuild = xpc_dictionary_get_BOOL(v4, "IsUIBuild");
    v5->_OSInstallEnvironment = xpc_dictionary_get_BOOL(v4, "OSInstallEnvironment");
    v5->_StoreDemoMode = xpc_dictionary_get_BOOL(v4, "StoreDemoMode");
  }

  return v5;
}

- (GTDeviceProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GTDeviceProperties;
  timespec v5 = [(GTDeviceProperties *)&v29 init];
  if (v5)
  {
    v5->_LocationID = (unint64_t)[v4 decodeIntegerForKey:@"LocationID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BuildVersion"];
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HWModel"];
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OSVersion"];
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueDeviceID"];
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Reality"];
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v16;

    v5->_RemoteXPCVersionFlags = (unint64_t)[v4 decodeIntegerForKey:@"RemoteXPCVersionFlags"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPUArchitecture"];
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceClass"];
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MobileDeviceMinimumVersion"];
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductName"];
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseType"];
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v26;

    v5->_AppleInternal = [v4 decodeBoolForKey:@"AppleInternal"];
    v5->_DeviceSupportsLockdown = [v4 decodeBoolForKey:@"DeviceSupportsLockdown"];
    v5->_EffectiveProductionStatusAp = [v4 decodeBoolForKey:@"EffectiveProductionStatusAp"];
    v5->_IsUIBuild = [v4 decodeBoolForKey:@"IsUIBuild"];
    v5->_OSInstallEnvironment = [v4 decodeBoolForKey:@"OSInstallEnvironment"];
    v5->_StoreDemoMode = [v4 decodeBoolForKey:@"StoreDemoMode"];
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@ %@", self->_ProductName, self->_UniqueDeviceID];
}

- (id)initForEmbeddedSystem
{
  v14.receiver = self;
  v14.super_class = (Class)GTDeviceProperties;
  int v2 = [(GTDeviceProperties *)&v14 init];
  if (v2)
  {
    [(GTDeviceProperties *)v2 setAppleInternal:os_variant_has_internal_content()];
    CFDictionaryRef v3 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v3)
    {
      CFDictionaryRef v4 = v3;
      [(GTDeviceProperties *)v2 setOsVersion:CFDictionaryGetValue(v3, _kCFSystemVersionProductVersionKey)];
      [(GTDeviceProperties *)v2 setBuildVersion:CFDictionaryGetValue(v4, _kCFSystemVersionBuildVersionKey)];
      [(GTDeviceProperties *)v2 setProductName:CFDictionaryGetValue(v4, _kCFSystemVersionProductNameKey)];
      [(GTDeviceProperties *)v2 setReleaseType:CFDictionaryGetValue(v4, @"ReleaseType")];
      CFRelease(v4);
    }
    *__error() = 0;
    size_t size = 128;
    int v5 = sysctlbyname("kern.osversion", values, &size, 0, 0);
    if (!v5 || *__error() == 12)
    {
      if (size != 128 || *__error() != 12)
      {
        v7 = 0;
        uint64_t v6 = values;
        if (v5) {
          goto LABEL_13;
        }
        goto LABEL_15;
      }
      if (!sysctlbyname("kern.osversion", 0, &size, 0, 0))
      {
        if (size >= 0x81)
        {
          uint64_t v6 = malloc_type_malloc(size, 0x9ADD76BCuLL);
          v7 = v6;
          if (!sysctlbyname("kern.osversion", v6, &size, 0, 0)) {
            goto LABEL_15;
          }
LABEL_13:
          uint64_t v8 = 0;
          size_t size = 0;
          goto LABEL_16;
        }
        v7 = 0;
        uint64_t v6 = values;
LABEL_15:
        uint64_t v8 = strdup((const char *)v6);
LABEL_16:
        free(v7);
        if (size)
        {
          if (!v8)
          {
LABEL_19:
            long long v18 = *(_OWORD *)off_100034C88;
            long long v19 = *(_OWORD *)off_100034C98;
            long long v20 = *(_OWORD *)off_100034CA8;
            CFStringRef v21 = @"re6Zb+zwFKJNlkQTUeT+/w";
            *(_OWORD *)values = *(_OWORD *)off_100034C68;
            long long v17 = *(_OWORD *)off_100034C78;
            CFArrayRef v10 = CFArrayCreate(0, (const void **)values, 11, &kCFTypeArrayCallBacks);
            CFDictionaryRef v11 = (const __CFDictionary *)MGCopyMultipleAnswers();
            CFRelease(v10);
            [(GTDeviceProperties *)v2 setCpuArchitecture:CFDictionaryGetValue(v11, @"k7QIBwZJJOVw+Sej/8h8VA")];
            [(GTDeviceProperties *)v2 setCpuArchitecture:CFDictionaryGetValue(v11, @"k7QIBwZJJOVw+Sej/8h8VA")];
            [(GTDeviceProperties *)v2 setDeviceClass:CFDictionaryGetValue(v11, @"+3Uf0Pm5F8Xy7Onyvko0vA")];
            [(GTDeviceProperties *)v2 setDeviceSupportsLockdown:MGGetBoolAnswer()];
            [(GTDeviceProperties *)v2 setEffectiveProductionStatusAp:MGGetBoolAnswer()];
            [(GTDeviceProperties *)v2 setHardwareModel:CFDictionaryGetValue(v11, @"/YYygAofPDbhrwToVsXdeA")];
            [(GTDeviceProperties *)v2 setIsUIBuild:MGGetBoolAnswer()];
            [(GTDeviceProperties *)v2 setMobileDeviceMinimumVersion:CFDictionaryGetValue(v11, @"k+KTni1jrwErpcDMEnn3aw")];
            [(GTDeviceProperties *)v2 setProductName:CFDictionaryGetValue(v11, @"ivIu8YTDnBSrYv/SN4G8Ag")];
            [(GTDeviceProperties *)v2 setProductType:CFDictionaryGetValue(v11, @"h9jDsbgj7xIVeIQ8S3/X3Q")];
            [(GTDeviceProperties *)v2 setReleaseType:CFDictionaryGetValue(v11, @"9UCjT7Qfi4xLVvPAKIzTCQ")];
            [(GTDeviceProperties *)v2 setUniqueDeviceID:CFDictionaryGetValue(v11, @"re6Zb+zwFKJNlkQTUeT+/w")];
            CFRelease(v11);
            [(GTDeviceProperties *)v2 setOsInstallEnvironment:getenv("__OSINSTALL_ENVIRONMENT") != 0];
            uint64_t v12 = v2;
            goto LABEL_20;
          }
LABEL_18:
          v9 = +[NSString stringWithUTF8String:v8];
          [(GTDeviceProperties *)v2 setBuildVersion:v9];

          free(v8);
          goto LABEL_19;
        }
LABEL_22:
        _os_assumes_log();
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_22;
  }
LABEL_20:

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t LocationID = self->_LocationID;
  id v5 = a3;
  [v5 encodeInteger:LocationID forKey:@"LocationID"];
  [v5 encodeObject:self->_BuildVersion forKey:@"BuildVersion"];
  [v5 encodeObject:self->_HWModelStr forKey:@"HWModel"];
  [v5 encodeObject:self->_OSVersion forKey:@"OSVersion"];
  [v5 encodeObject:self->_ProductType forKey:@"ProductType"];
  [v5 encodeObject:self->_UniqueDeviceID forKey:@"UniqueDeviceID"];
  [v5 encodeObject:self->_Reality forKey:@"Reality"];
  [v5 encodeInteger:self->_RemoteXPCVersionFlags forKey:@"RemoteXPCVersionFlags"];
  [v5 encodeObject:self->_CPUArchitecture forKey:@"CPUArchitecture"];
  [v5 encodeObject:self->_DeviceClass forKey:@"DeviceClass"];
  [v5 encodeObject:self->_MobileDeviceMinimumVersion forKey:@"MobileDeviceMinimumVersion"];
  [v5 encodeObject:self->_ProductName forKey:@"ProductName"];
  [v5 encodeObject:self->_ReleaseType forKey:@"ReleaseType"];
  [v5 encodeBool:self->_AppleInternal forKey:@"AppleInternal"];
  [v5 encodeBool:self->_DeviceSupportsLockdown forKey:@"DeviceSupportsLockdown"];
  [v5 encodeBool:self->_EffectiveProductionStatusAp forKey:@"EffectiveProductionStatusAp"];
  [v5 encodeBool:self->_IsUIBuild forKey:@"IsUIBuild"];
  [v5 encodeBool:self->_OSInstallEnvironment forKey:@"OSInstallEnvironment"];
  [v5 encodeBool:self->_StoreDemoMode forKey:@"StoreDemoMode"];
}

- (unint64_t)locationID
{
  return self->_LocationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_unint64_t LocationID = a3;
}

- (NSString)buildVersion
{
  return self->_BuildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)hardwareModel
{
  return self->_HWModelStr;
}

- (void)setHardwareModel:(id)a3
{
}

- (NSString)osVersion
{
  return self->_OSVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)productType
{
  return self->_ProductType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)uniqueDeviceID
{
  return self->_UniqueDeviceID;
}

- (void)setUniqueDeviceID:(id)a3
{
}

- (NSString)reality
{
  return self->_Reality;
}

- (void)setReality:(id)a3
{
}

- (unint64_t)remoteXPCVersionFlags
{
  return self->_RemoteXPCVersionFlags;
}

- (void)setRemoteXPCVersionFlags:(unint64_t)a3
{
  self->_RemoteXPCVersionFlags = a3;
}

- (NSString)cpuArchitecture
{
  return self->_CPUArchitecture;
}

- (void)setCpuArchitecture:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_DeviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)mobileDeviceMinimumVersion
{
  return self->_MobileDeviceMinimumVersion;
}

- (void)setMobileDeviceMinimumVersion:(id)a3
{
}

- (NSString)productName
{
  return self->_ProductName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)releaseType
{
  return self->_ReleaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (BOOL)appleInternal
{
  return self->_AppleInternal;
}

- (void)setAppleInternal:(BOOL)a3
{
  self->_AppleInternal = a3;
}

- (BOOL)deviceSupportsLockdown
{
  return self->_DeviceSupportsLockdown;
}

- (void)setDeviceSupportsLockdown:(BOOL)a3
{
  self->_DeviceSupportsLockdown = a3;
}

- (BOOL)effectiveProductionStatusAp
{
  return self->_EffectiveProductionStatusAp;
}

- (void)setEffectiveProductionStatusAp:(BOOL)a3
{
  self->_EffectiveProductionStatusAp = a3;
}

- (BOOL)isUIBuild
{
  return self->_IsUIBuild;
}

- (void)setIsUIBuild:(BOOL)a3
{
  self->_IsUIBuild = a3;
}

- (BOOL)osInstallEnvironment
{
  return self->_OSInstallEnvironment;
}

- (void)setOsInstallEnvironment:(BOOL)a3
{
  self->_OSInstallEnvironment = a3;
}

- (BOOL)storeDemoMode
{
  return self->_StoreDemoMode;
}

- (void)setStoreDemoMode:(BOOL)a3
{
  self->_StoreDemoMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ReleaseType, 0);
  objc_storeStrong((id *)&self->_ProductName, 0);
  objc_storeStrong((id *)&self->_MobileDeviceMinimumVersion, 0);
  objc_storeStrong((id *)&self->_DeviceClass, 0);
  objc_storeStrong((id *)&self->_CPUArchitecture, 0);
  objc_storeStrong((id *)&self->_Reality, 0);
  objc_storeStrong((id *)&self->_UniqueDeviceID, 0);
  objc_storeStrong((id *)&self->_ProductType, 0);
  objc_storeStrong((id *)&self->_OSVersion, 0);
  objc_storeStrong((id *)&self->_HWModelStr, 0);

  objc_storeStrong((id *)&self->_BuildVersion, 0);
}

@end