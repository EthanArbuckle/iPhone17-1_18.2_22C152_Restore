@interface WLSourceDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)canAddAccessibility;
- (BOOL)canAddDisplay;
- (BOOL)canAddFiles;
- (BOOL)isLocal;
- (BOOL)isSelectingDataTypeInHandshake;
- (BOOL)supportsFileLength;
- (BOOL)useMigrationKit;
- (NSString)api;
- (NSString)apiLevel;
- (NSString)brand;
- (NSString)clientVersion;
- (NSString)hardwareBrand;
- (NSString)hardwareDesign;
- (NSString)hardwareMaker;
- (NSString)hardwareModel;
- (NSString)hardwareProduct;
- (NSString)ipAddress;
- (NSString)locale;
- (NSString)model;
- (NSString)name;
- (NSString)osAPIVersion;
- (NSString)osVersion;
- (NSString)persistentIdentifier;
- (NSString)version;
- (NSString)versionCode;
- (WLSourceDevice)init;
- (WLSourceDevice)initWithCoder:(id)a3;
- (unsigned)httpPort;
- (unsigned)socketPort;
- (void)encodeWithCoder:(id)a3;
- (void)setApi:(id)a3;
- (void)setApiLevel:(id)a3;
- (void)setBrand:(id)a3;
- (void)setCanAddAccessibility:(BOOL)a3;
- (void)setCanAddDisplay:(BOOL)a3;
- (void)setCanAddFiles:(BOOL)a3;
- (void)setClientVersion:(id)a3;
- (void)setHardwareBrand:(id)a3;
- (void)setHardwareDesign:(id)a3;
- (void)setHardwareMaker:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setHardwareProduct:(id)a3;
- (void)setHttpPort:(unsigned __int16)a3;
- (void)setIpAddress:(id)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setIsSelectingDataTypeInHandshake:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setOsAPIVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setSocketPort:(unsigned __int16)a3;
- (void)setSupportsFileLength:(BOOL)a3;
- (void)setUseMigrationKit:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)setVersionCode:(id)a3;
@end

@implementation WLSourceDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLSourceDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLSourceDevice;
  v2 = [(WLSourceDevice *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(WLSourceDevice *)v2 setIsSelectingDataTypeInHandshake:0];
    [(WLSourceDevice *)v3 setUseMigrationKit:0];
    [(WLSourceDevice *)v3 setApi:@"1"];
    [(WLSourceDevice *)v3 setApiLevel:@"?"];
    [(WLSourceDevice *)v3 setBrand:@"?"];
    [(WLSourceDevice *)v3 setLocale:@"?"];
    [(WLSourceDevice *)v3 setModel:@"?"];
    [(WLSourceDevice *)v3 setOsVersion:@"?"];
    [(WLSourceDevice *)v3 setVersion:@"?"];
    [(WLSourceDevice *)v3 setVersionCode:@"?"];
  }
  return v3;
}

- (WLSourceDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WLSourceDevice *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ipAddress"];
    ipAddress = v5->_ipAddress;
    v5->_ipAddress = (NSString *)v6;

    v5->_httpPort = [v4 decodeIntegerForKey:@"_httpPort"];
    v5->_socketPort = [v4 decodeIntegerForKey:@"_socketPort"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_persistentIdentifier"];
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSString *)v8;

    v5->_isLocal = [v4 decodeBoolForKey:@"_isLocal"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_osAPIVersion"];
    osAPIVersion = v5->_osAPIVersion;
    v5->_osAPIVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hardwareBrand"];
    hardwareBrand = v5->_hardwareBrand;
    v5->_hardwareBrand = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hardwareModel"];
    hardwareModel = v5->_hardwareModel;
    v5->_hardwareModel = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hardwareDesign"];
    hardwareDesign = v5->_hardwareDesign;
    v5->_hardwareDesign = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hardwareMaker"];
    hardwareMaker = v5->_hardwareMaker;
    v5->_hardwareMaker = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientVersion"];
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v22;

    v5->_isSelectingDataTypeInHandshake = [v4 decodeBoolForKey:@"_isSelectingDataTypeInHandshake"];
    v5->_useMigrationKit = [v4 decodeBoolForKey:@"_useMigrationKit"];
    v5->_supportsFileLength = [v4 decodeBoolForKey:@"_supportsFileLength"];
    v5->_canAddDisplay = [v4 decodeBoolForKey:@"_canAddDisplay"];
    v5->_canAddAccessibility = [v4 decodeBoolForKey:@"_canAddAccessibility"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_apiLevel"];
    apiLevel = v5->_apiLevel;
    v5->_apiLevel = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_brand"];
    brand = v5->_brand;
    v5->_brand = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_locale"];
    locale = v5->_locale;
    v5->_locale = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_model"];
    model = v5->_model;
    v5->_model = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_osVersion"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_version"];
    version = v5->_version;
    v5->_version = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_versionCode"];
    versionCode = v5->_versionCode;
    v5->_versionCode = (NSString *)v36;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ipAddress = self->_ipAddress;
  id v5 = a3;
  [v5 encodeObject:ipAddress forKey:@"_ipAddress"];
  [v5 encodeInteger:self->_httpPort forKey:@"_httpPort"];
  [v5 encodeInteger:self->_socketPort forKey:@"_socketPort"];
  [v5 encodeObject:self->_persistentIdentifier forKey:@"_persistentIdentifier"];
  [v5 encodeBool:self->_isLocal forKey:@"_isLocal"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeObject:self->_osAPIVersion forKey:@"_osAPIVersion"];
  [v5 encodeObject:self->_hardwareBrand forKey:@"_hardwareBrand"];
  [v5 encodeObject:self->_hardwareModel forKey:@"_hardwareModel"];
  [v5 encodeObject:self->_hardwareDesign forKey:@"_hardwareDesign"];
  [v5 encodeObject:self->_hardwareMaker forKey:@"_hardwareMaker"];
  [v5 encodeObject:self->_clientVersion forKey:@"_clientVersion"];
  [v5 encodeBool:self->_isSelectingDataTypeInHandshake forKey:@"_isSelectingDataTypeInHandshake"];
  [v5 encodeBool:self->_useMigrationKit forKey:@"_useMigrationKit"];
  [v5 encodeBool:self->_supportsFileLength forKey:@"_supportsFileLength"];
  [v5 encodeBool:self->_canAddDisplay forKey:@"_canAddDisplay"];
  [v5 encodeBool:self->_canAddAccessibility forKey:@"_canAddAccessibility"];
  [v5 encodeObject:self->_apiLevel forKey:@"_apiLevel"];
  [v5 encodeObject:self->_brand forKey:@"_brand"];
  [v5 encodeObject:self->_locale forKey:@"_locale"];
  [v5 encodeObject:self->_model forKey:@"_model"];
  [v5 encodeObject:self->_osVersion forKey:@"_osVersion"];
  [v5 encodeObject:self->_version forKey:@"_version"];
  [v5 encodeObject:self->_versionCode forKey:@"_versionCode"];
}

- (NSString)api
{
  return self->_api;
}

- (void)setApi:(id)a3
{
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
}

- (unsigned)socketPort
{
  return self->_socketPort;
}

- (void)setSocketPort:(unsigned __int16)a3
{
  self->_socketPort = a3;
}

- (unsigned)httpPort
{
  return self->_httpPort;
}

- (void)setHttpPort:(unsigned __int16)a3
{
  self->_httpPort = a3;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (BOOL)isSelectingDataTypeInHandshake
{
  return self->_isSelectingDataTypeInHandshake;
}

- (void)setIsSelectingDataTypeInHandshake:(BOOL)a3
{
  self->_isSelectingDataTypeInHandshake = a3;
}

- (BOOL)useMigrationKit
{
  return self->_useMigrationKit;
}

- (void)setUseMigrationKit:(BOOL)a3
{
  self->_useMigrationKit = a3;
}

- (BOOL)supportsFileLength
{
  return self->_supportsFileLength;
}

- (void)setSupportsFileLength:(BOOL)a3
{
  self->_supportsFileLength = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)osAPIVersion
{
  return self->_osAPIVersion;
}

- (void)setOsAPIVersion:(id)a3
{
}

- (NSString)hardwareBrand
{
  return self->_hardwareBrand;
}

- (void)setHardwareBrand:(id)a3
{
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
}

- (NSString)hardwareDesign
{
  return self->_hardwareDesign;
}

- (void)setHardwareDesign:(id)a3
{
}

- (NSString)hardwareMaker
{
  return self->_hardwareMaker;
}

- (void)setHardwareMaker:(id)a3
{
}

- (NSString)hardwareProduct
{
  return self->_hardwareProduct;
}

- (void)setHardwareProduct:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
}

- (BOOL)canAddDisplay
{
  return self->_canAddDisplay;
}

- (void)setCanAddDisplay:(BOOL)a3
{
  self->_canAddDisplay = a3;
}

- (BOOL)canAddAccessibility
{
  return self->_canAddAccessibility;
}

- (void)setCanAddAccessibility:(BOOL)a3
{
  self->_canAddAccessibility = a3;
}

- (BOOL)canAddFiles
{
  return self->_canAddFiles;
}

- (void)setCanAddFiles:(BOOL)a3
{
  self->_canAddFiles = a3;
}

- (NSString)apiLevel
{
  return self->_apiLevel;
}

- (void)setApiLevel:(id)a3
{
}

- (NSString)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)versionCode
{
  return self->_versionCode;
}

- (void)setVersionCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionCode, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_apiLevel, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_hardwareProduct, 0);
  objc_storeStrong((id *)&self->_hardwareMaker, 0);
  objc_storeStrong((id *)&self->_hardwareDesign, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_hardwareBrand, 0);
  objc_storeStrong((id *)&self->_osAPIVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);

  objc_storeStrong((id *)&self->_api, 0);
}

@end