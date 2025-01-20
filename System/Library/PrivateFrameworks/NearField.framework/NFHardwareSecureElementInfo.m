@interface NFHardwareSecureElementInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)jcopTooOld;
- (BOOL)osUpdateMode;
- (BOOL)personalisable;
- (BOOL)restrictedMode;
- (BOOL)restrictedPerformanceMode;
- (NFHardwareSecureElementInfo)initWithCoder:(id)a3;
- (NFHardwareSecureElementInfo)initWithDictionary:(id)a3;
- (NSArray)bootHistory;
- (NSData)manifestQuery;
- (NSNumber)compiledFWVersion;
- (NSNumber)expectedSequenceCounter;
- (NSNumber)migrationInstances;
- (NSNumber)migrationPackages;
- (NSNumber)otherOSValid;
- (NSNumber)persistentConfigID;
- (NSNumber)referenceCounter;
- (NSNumber)sequenceCounter;
- (NSString)atrString;
- (NSString)ecdsaCertificate;
- (NSString)eckaCertificate;
- (NSString)firmwareKeyID;
- (NSString)identifier;
- (NSString)nonce;
- (NSString)osKeyID;
- (NSString)platformIdentifier;
- (NSString)rootKeyID;
- (NSString)rsaCertificate;
- (NSString)serialNumber;
- (NSString)systemOSSerialNumber;
- (id)asDictionary;
- (unint64_t)OSMode;
- (unint64_t)OSVersion;
- (unint64_t)appletMap;
- (unint64_t)deviceType;
- (unint64_t)firmwareVersion;
- (unint64_t)fullOSVersion;
- (unint64_t)hardwareVersion;
- (unint64_t)migrationContext;
- (unint64_t)migrationState;
- (unint64_t)osid;
- (unint64_t)seType;
- (unint64_t)signingKeyType;
- (unint64_t)supportedTechnologies;
- (void)_setIsInRestrictedMode:(BOOL)a3;
- (void)_setIsInRestrictedPerformanceMode:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBootHistory:(id)a3;
@end

@implementation NFHardwareSecureElementInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFHardwareSecureElementInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NFHardwareSecureElementInfo;
  v5 = [(NFHardwareSecureElementInfo *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_OSVersion = [v4 decodeIntegerForKey:@"OSVersion"];
    v5->_fullOSVersion = [v4 decodeIntegerForKey:@"fullOSVersion"];
    v5->_firmwareVersion = [v4 decodeIntegerForKey:@"firmwareVersion"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compiledFWVersion"];
    compiledFWVersion = v5->_compiledFWVersion;
    v5->_compiledFWVersion = (NSNumber *)v8;

    v5->_hardwareVersion = [v4 decodeIntegerForKey:@"hardwareVersion"];
    v5->_deviceType = [v4 decodeIntegerForKey:@"deviceType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequenceCounter"];
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceCounter"];
    referenceCounter = v5->_referenceCounter;
    v5->_referenceCounter = (NSNumber *)v12;

    v5->_osid = [v4 decodeIntegerForKey:@"osid"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherOSValid"];
    otherOSValid = v5->_otherOSValid;
    v5->_otherOSValid = (NSNumber *)v14;

    v5->_restrictedMode = [v4 decodeBoolForKey:@"restrictedMode"];
    v5->_osUpdateMode = [v4 decodeBoolForKey:@"osUpdateMode"];
    v5->_OSMode = [v4 decodeIntegerForKey:@"OSMode"];
    v5->_signingKeyType = [v4 decodeIntegerForKey:@"signingKeyType"];
    v5->_migrationState = [v4 decodeIntegerForKey:@"migrationState"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"migrationPackages"];
    migrationPackages = v5->_migrationPackages;
    v5->_migrationPackages = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"migrationInstances"];
    migrationInstances = v5->_migrationInstances;
    v5->_migrationInstances = (NSNumber *)v18;

    v5->_migrationContext = [v4 decodeIntegerForKey:@"migrationContext"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformIdentifier"];
    platformIdentifier = v5->_platformIdentifier;
    v5->_platformIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumberAsData = v5->_serialNumberAsData;
    v5->_serialNumberAsData = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemOSSerialNumber"];
    systemOSSerialNumberAsData = v5->_systemOSSerialNumberAsData;
    v5->_systemOSSerialNumberAsData = (NSData *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rsaCertificate"];
    rsaCertificateAsData = v5->_rsaCertificateAsData;
    v5->_rsaCertificateAsData = (NSData *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ecdsaCertificate"];
    ecdsaCertificateAsData = v5->_ecdsaCertificateAsData;
    v5->_ecdsaCertificateAsData = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eckaCertificate"];
    eckaCertificateAsData = v5->_eckaCertificateAsData;
    v5->_eckaCertificateAsData = (NSData *)v30;

    v5->_appletMap = [v4 decodeIntegerForKey:@"appletMap"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentConfigID"];
    persistentConfigID = v5->_persistentConfigID;
    v5->_persistentConfigID = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestQuery"];
    manifestQuery = v5->_manifestQuery;
    v5->_manifestQuery = (NSData *)v34;

    v5->_personalisable = [v4 decodeBoolForKey:@"personalisable"];
    v5->_supportedTechnologies = [v4 decodeIntegerForKey:@"supportedTechnologies"];
    v5->_seType = [v4 decodeIntegerForKey:@"seType"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atrString"];
    atrString = v5->_atrString;
    v5->_atrString = (NSString *)v36;

    v5->_jcopTooOld = [v4 decodeBoolForKey:@"jcopTooOld"];
    uint64_t v38 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"bootHistory"];
    bootHistory = v5->_bootHistory;
    v5->_bootHistory = (NSArray *)v38;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)jcopTooOld
{
  return self->_jcopTooOld;
}

- (unint64_t)OSMode
{
  return self->_OSMode;
}

- (NSString)rsaCertificate
{
  return (NSString *)[(NSData *)self->_rsaCertificateAsData NF_asHexString];
}

- (NSString)ecdsaCertificate
{
  return (NSString *)[(NSData *)self->_ecdsaCertificateAsData NF_asHexString];
}

- (NSString)eckaCertificate
{
  return (NSString *)[(NSData *)self->_eckaCertificateAsData NF_asHexString];
}

- (NSString)serialNumber
{
  return (NSString *)[(NSData *)self->_serialNumberAsData NF_asHexString];
}

- (NSString)systemOSSerialNumber
{
  return (NSString *)[(NSData *)self->_systemOSSerialNumberAsData NF_asHexString];
}

- (NFHardwareSecureElementInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)NFHardwareSecureElementInfo;
  v5 = [(NFHardwareSecureElementInfo *)&v56 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"OSVersion"];
    v5->_OSVersion = [v8 unsignedIntegerValue];

    v9 = [v4 objectForKeyedSubscript:@"fullOSVersion"];
    v5->_fullOSVersion = [v9 unsignedIntegerValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"firmwareVersion"];
    v5->_firmwareVersion = [v10 unsignedIntegerValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"compiledFWVersion"];
    compiledFWVersion = v5->_compiledFWVersion;
    v5->_compiledFWVersion = (NSNumber *)v11;

    v13 = [v4 objectForKeyedSubscript:@"hardwareVersion"];
    v5->_hardwareVersion = [v13 unsignedIntegerValue];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"deviceType"];
    v5->_deviceType = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 objectForKeyedSubscript:@"sequenceCounter"];
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"referenceCounter"];
    referenceCounter = v5->_referenceCounter;
    v5->_referenceCounter = (NSNumber *)v17;

    v19 = [v4 objectForKeyedSubscript:@"osid"];
    v5->_osid = [v19 unsignedIntegerValue];

    uint64_t v20 = [v4 objectForKeyedSubscript:@"otherOSValid"];
    otherOSValid = v5->_otherOSValid;
    v5->_otherOSValid = (NSNumber *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"restrictedMode"];
    v5->_restrictedMode = [v22 BOOLValue];

    v23 = [v4 objectForKeyedSubscript:@"osUpdateMode"];
    v5->_osUpdateMode = [v23 BOOLValue];

    uint64_t v24 = [v4 objectForKeyedSubscript:@"OSMode"];
    v5->_OSMode = [v24 unsignedIntegerValue];

    v25 = [v4 objectForKeyedSubscript:@"signingKeyType"];
    v5->_signingKeyType = [v25 unsignedIntegerValue];

    uint64_t v26 = [v4 objectForKeyedSubscript:@"migrationState"];
    v5->_migrationState = [v26 unsignedIntegerValue];

    uint64_t v27 = [v4 objectForKeyedSubscript:@"migrationPackages"];
    migrationPackages = v5->_migrationPackages;
    v5->_migrationPackages = (NSNumber *)v27;

    uint64_t v29 = [v4 objectForKeyedSubscript:@"migrationInstances"];
    migrationInstances = v5->_migrationInstances;
    v5->_migrationInstances = (NSNumber *)v29;

    v31 = [v4 objectForKeyedSubscript:@"migrationContext"];
    v5->_migrationContext = [v31 unsignedIntegerValue];

    uint64_t v32 = [v4 objectForKeyedSubscript:@"platformIdentifier"];
    platformIdentifier = v5->_platformIdentifier;
    v5->_platformIdentifier = (NSString *)v32;

    uint64_t v34 = [v4 objectForKeyedSubscript:@"serialNumber"];
    serialNumberAsData = v5->_serialNumberAsData;
    v5->_serialNumberAsData = (NSData *)v34;

    uint64_t v36 = [v4 objectForKeyedSubscript:@"systemOSSerialNumber"];
    systemOSSerialNumberAsData = v5->_systemOSSerialNumberAsData;
    v5->_systemOSSerialNumberAsData = (NSData *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"rsaCertificate"];
    rsaCertificateAsData = v5->_rsaCertificateAsData;
    v5->_rsaCertificateAsData = (NSData *)v38;

    uint64_t v40 = [v4 objectForKeyedSubscript:@"ecdsaCertificate"];
    ecdsaCertificateAsData = v5->_ecdsaCertificateAsData;
    v5->_ecdsaCertificateAsData = (NSData *)v40;

    uint64_t v42 = [v4 objectForKeyedSubscript:@"eckaCertificate"];
    eckaCertificateAsData = v5->_eckaCertificateAsData;
    v5->_eckaCertificateAsData = (NSData *)v42;

    v44 = [v4 objectForKeyedSubscript:@"appletMap"];
    v5->_appletMap = [v44 unsignedIntegerValue];

    uint64_t v45 = [v4 objectForKeyedSubscript:@"persistentConfigID"];
    persistentConfigID = v5->_persistentConfigID;
    v5->_persistentConfigID = (NSNumber *)v45;

    uint64_t v47 = [v4 objectForKeyedSubscript:@"manifestQuery"];
    manifestQuery = v5->_manifestQuery;
    v5->_manifestQuery = (NSData *)v47;

    v49 = [v4 objectForKeyedSubscript:@"personalisable"];
    v5->_personalisable = [v49 BOOLValue];

    v50 = [v4 objectForKeyedSubscript:@"supportedTechnologies"];
    v5->_supportedTechnologies = [v50 unsignedIntegerValue];

    v51 = [v4 objectForKeyedSubscript:@"seType"];
    v5->_seType = [v51 unsignedIntegerValue];

    uint64_t v52 = [v4 objectForKeyedSubscript:@"atrString"];
    atrString = v5->_atrString;
    v5->_atrString = (NSString *)v52;

    v54 = [v4 objectForKeyedSubscript:@"jcopTooOld"];
    v5->_jcopTooOld = [v54 BOOLValue];
  }
  return v5;
}

- (void)_setIsInRestrictedMode:(BOOL)a3
{
  self->_restrictedMode = a3;
}

- (void)_setIsInRestrictedPerformanceMode:(BOOL)a3
{
  self->_restrictedPerformanceMode = a3;
}

- (void)setBootHistory:(id)a3
{
}

- (NSNumber)expectedSequenceCounter
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FBA880] TLVWithData:self->_manifestQuery];
  v5 = [v4 childWithTag:65343];
  uint64_t v6 = [v5 childWithTag:135];

  v7 = [v6 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    [(NFHardwareSecureElementInfo *)self signingKeyType];
    if ([(NFHardwareSecureElementInfo *)self seType] == 6
      && [(NFHardwareSecureElementInfo *)self deviceType] == 56)
    {
      v9 = [(NFHardwareSecureElementInfo *)self persistentConfigID];
      [v9 unsignedIntValue];
    }
    id v10 = [v6 value];
    int v11 = *(unsigned __int8 *)[v10 bytes];
    uint64_t v12 = (NSNumber *)&unk_1EEF35A58;
    v13 = (NSNumber *)&unk_1EEF35A58;
    if (v11 != 210) {
      v13 = 0;
    }
    if (v11 != 200) {
      uint64_t v12 = v13;
    }
    uint64_t v14 = (NSNumber *)&unk_1EEF35A58;
    uint64_t v15 = (NSNumber *)&unk_1EEF35A70;
    if (v11 != 115) {
      uint64_t v15 = 0;
    }
    if (v11 != 100) {
      uint64_t v14 = v15;
    }
    if (v11 <= 199) {
      uint64_t v12 = v14;
    }
    uint64_t v16 = (NSNumber *)&unk_1EEF35A28;
    uint64_t v17 = (NSNumber *)&unk_1EEF35A40;
    if (v11 != 56) {
      uint64_t v17 = 0;
    }
    if (v11 != 55) {
      uint64_t v16 = v17;
    }
    uint64_t v18 = (NSNumber *)&unk_1EEF35A10;
    v19 = (NSNumber *)&unk_1EEF35A28;
    if (v11 != 54) {
      v19 = 0;
    }
    if (v11 != 44) {
      uint64_t v18 = v19;
    }
    if (v11 <= 54) {
      uint64_t v16 = v18;
    }
    if (v11 <= 99) {
      uint64_t v20 = v16;
    }
    else {
      uint64_t v20 = v12;
    }
  }
  else
  {
    v21 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v28 = [(NSData *)self->_manifestQuery debugDescription];
      uint64_t v29 = 45;
      if (isMetaClass) {
        uint64_t v29 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Invalid manifest query %@", v29, ClassName, Name, 116, v28);
    }
    dispatch_get_specific(*v21);
    uint64_t v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      v33 = object_getClassName(self);
      uint64_t v34 = sel_getName(a2);
      v35 = [(NSData *)self->_manifestQuery debugDescription];
      *(_DWORD *)buf = 67110146;
      int v38 = v32;
      __int16 v39 = 2082;
      uint64_t v40 = v33;
      __int16 v41 = 2082;
      uint64_t v42 = v34;
      __int16 v43 = 1024;
      int v44 = 116;
      __int16 v45 = 2112;
      v46 = v35;
      _os_log_impl(&dword_19D636000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid manifest query %@", buf, 0x2Cu);
    }
    uint64_t v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v23 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v23;
  }
  [v4 encodeInteger:self->_OSVersion forKey:@"OSVersion"];
  [v23 encodeInteger:self->_fullOSVersion forKey:@"fullOSVersion"];
  [v23 encodeInteger:self->_firmwareVersion forKey:@"firmwareVersion"];
  compiledFWVersion = self->_compiledFWVersion;
  if (compiledFWVersion) {
    [v23 encodeObject:compiledFWVersion forKey:@"compiledFWVersion"];
  }
  [v23 encodeInteger:self->_hardwareVersion forKey:@"hardwareVersion"];
  [v23 encodeInteger:self->_deviceType forKey:@"deviceType"];
  sequenceCounter = self->_sequenceCounter;
  if (sequenceCounter) {
    [v23 encodeObject:sequenceCounter forKey:@"sequenceCounter"];
  }
  referenceCounter = self->_referenceCounter;
  if (referenceCounter) {
    [v23 encodeObject:referenceCounter forKey:@"referenceCounter"];
  }
  [v23 encodeInteger:self->_osid forKey:@"osid"];
  otherOSValid = self->_otherOSValid;
  if (otherOSValid) {
    [v23 encodeObject:otherOSValid forKey:@"otherOSValid"];
  }
  [v23 encodeBool:self->_restrictedMode forKey:@"restrictedMode"];
  [v23 encodeBool:self->_osUpdateMode forKey:@"osUpdateMode"];
  [v23 encodeInteger:self->_OSMode forKey:@"OSMode"];
  [v23 encodeInteger:self->_signingKeyType forKey:@"signingKeyType"];
  [v23 encodeInteger:self->_migrationState forKey:@"migrationState"];
  migrationPackages = self->_migrationPackages;
  if (migrationPackages) {
    [v23 encodeObject:migrationPackages forKey:@"migrationPackages"];
  }
  migrationInstances = self->_migrationInstances;
  if (migrationInstances) {
    [v23 encodeObject:migrationInstances forKey:@"migrationInstances"];
  }
  [v23 encodeInteger:self->_migrationContext forKey:@"migrationContext"];
  platformIdentifier = self->_platformIdentifier;
  if (platformIdentifier) {
    [v23 encodeObject:platformIdentifier forKey:@"platformIdentifier"];
  }
  serialNumberAsData = self->_serialNumberAsData;
  if (serialNumberAsData) {
    [v23 encodeObject:serialNumberAsData forKey:@"serialNumber"];
  }
  systemOSSerialNumberAsData = self->_systemOSSerialNumberAsData;
  uint64_t v15 = v23;
  if (systemOSSerialNumberAsData)
  {
    [v23 encodeObject:systemOSSerialNumberAsData forKey:@"systemOSSerialNumber"];
    uint64_t v15 = v23;
  }
  rsaCertificateAsData = self->_rsaCertificateAsData;
  if (rsaCertificateAsData)
  {
    [v23 encodeObject:rsaCertificateAsData forKey:@"rsaCertificate"];
    uint64_t v15 = v23;
  }
  ecdsaCertificateAsData = self->_ecdsaCertificateAsData;
  if (ecdsaCertificateAsData)
  {
    [v23 encodeObject:ecdsaCertificateAsData forKey:@"ecdsaCertificate"];
    uint64_t v15 = v23;
  }
  eckaCertificateAsData = self->_eckaCertificateAsData;
  if (eckaCertificateAsData)
  {
    [v23 encodeObject:eckaCertificateAsData forKey:@"eckaCertificate"];
    uint64_t v15 = v23;
  }
  [v15 encodeInteger:self->_appletMap forKey:@"appletMap"];
  persistentConfigID = self->_persistentConfigID;
  if (persistentConfigID) {
    [v23 encodeObject:persistentConfigID forKey:@"persistentConfigID"];
  }
  manifestQuery = self->_manifestQuery;
  if (manifestQuery) {
    [v23 encodeObject:manifestQuery forKey:@"manifestQuery"];
  }
  [v23 encodeBool:self->_personalisable forKey:@"personalisable"];
  [v23 encodeInteger:self->_supportedTechnologies forKey:@"supportedTechnologies"];
  [v23 encodeInteger:self->_seType forKey:@"seType"];
  atrString = self->_atrString;
  if (atrString) {
    [v23 encodeObject:atrString forKey:@"atrString"];
  }
  [v23 encodeBool:self->_jcopTooOld forKey:@"jcopTooOld"];
  bootHistory = self->_bootHistory;
  if (bootHistory) {
    [v23 encodeObject:bootHistory forKey:@"bootHistory"];
  }
}

- (id)asDictionary
{
  v3 = objc_opt_new();
  id v4 = v3;
  if (self->_identifier) {
    identifier = (__CFString *)self->_identifier;
  }
  else {
    identifier = &stru_1EEF24A78;
  }
  [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  if (self->_compiledFWVersion) {
    compiledFWVersion = self->_compiledFWVersion;
  }
  else {
    compiledFWVersion = (NSNumber *)&stru_1EEF24A78;
  }
  [v4 setObject:compiledFWVersion forKeyedSubscript:@"compiledFWVersion"];
  if (self->_sequenceCounter) {
    sequenceCounter = self->_sequenceCounter;
  }
  else {
    sequenceCounter = (NSNumber *)&stru_1EEF24A78;
  }
  [v4 setObject:sequenceCounter forKeyedSubscript:@"sequenceCounter"];
  if (self->_referenceCounter) {
    referenceCounter = self->_referenceCounter;
  }
  else {
    referenceCounter = (NSNumber *)&stru_1EEF24A78;
  }
  [v4 setObject:referenceCounter forKeyedSubscript:@"referenceCounter"];
  if (self->_otherOSValid) {
    otherOSValid = self->_otherOSValid;
  }
  else {
    otherOSValid = (NSNumber *)&stru_1EEF24A78;
  }
  [v4 setObject:otherOSValid forKeyedSubscript:@"otherOSValid"];
  if (self->_migrationPackages) {
    migrationPackages = self->_migrationPackages;
  }
  else {
    migrationPackages = (NSNumber *)&stru_1EEF24A78;
  }
  [v4 setObject:migrationPackages forKeyedSubscript:@"migrationPackages"];
  if (self->_migrationInstances) {
    migrationInstances = self->_migrationInstances;
  }
  else {
    migrationInstances = (NSNumber *)&stru_1EEF24A78;
  }
  [v4 setObject:migrationInstances forKeyedSubscript:@"migrationInstances"];
  uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%04x", self->_OSVersion);
  [v4 setObject:v12 forKeyedSubscript:@"OSVersion"];

  v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%06x", self->_fullOSVersion);
  [v4 setObject:v13 forKeyedSubscript:@"fullOSVersion"];

  uint64_t v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%04x", self->_firmwareVersion);
  [v4 setObject:v14 forKeyedSubscript:@"firmwareVersion"];

  uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%04x", self->_hardwareVersion);
  [v4 setObject:v15 forKeyedSubscript:@"hardwareVersion"];

  uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%04x", self->_deviceType);
  [v4 setObject:v16 forKeyedSubscript:@"deviceType"];

  uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%04x", self->_osid);
  [v4 setObject:v17 forKeyedSubscript:@"osid"];

  uint64_t v18 = [NSNumber numberWithBool:self->_restrictedMode];
  [v4 setObject:v18 forKeyedSubscript:@"restrictedMode"];

  v19 = [NSNumber numberWithBool:self->_osUpdateMode];
  [v4 setObject:v19 forKeyedSubscript:@"osUpdateMode"];

  uint64_t v20 = [NSNumber numberWithInt:LODWORD(self->_OSMode)];
  [v4 setObject:v20 forKeyedSubscript:@"OSMode"];

  v21 = [NSNumber numberWithInt:LODWORD(self->_signingKeyType)];
  [v4 setObject:v21 forKeyedSubscript:@"signingKeyType"];

  uint64_t v22 = [NSNumber numberWithInt:LODWORD(self->_migrationState)];
  [v4 setObject:v22 forKeyedSubscript:@"migrationState"];

  id v23 = [NSNumber numberWithInt:LODWORD(self->_migrationContext)];
  [v4 setObject:v23 forKeyedSubscript:@"migrationContext"];

  if (self->_platformIdentifier) {
    platformIdentifier = (__CFString *)self->_platformIdentifier;
  }
  else {
    platformIdentifier = &stru_1EEF24A78;
  }
  [v4 setObject:platformIdentifier forKeyedSubscript:@"platformIdentifier"];
  serialNumberAsData = self->_serialNumberAsData;
  if (serialNumberAsData)
  {
    uint64_t v26 = [(NSData *)serialNumberAsData NF_asHexString];
    [v4 setObject:v26 forKeyedSubscript:@"serialNumber"];
  }
  else
  {
    [v4 setObject:&stru_1EEF24A78 forKeyedSubscript:@"serialNumber"];
  }
  systemOSSerialNumberAsData = self->_systemOSSerialNumberAsData;
  if (systemOSSerialNumberAsData)
  {
    uint64_t v28 = [(NSData *)systemOSSerialNumberAsData NF_asHexString];
    [v4 setObject:v28 forKeyedSubscript:@"systemOSSerialNumber"];
  }
  else
  {
    [v4 setObject:&stru_1EEF24A78 forKeyedSubscript:@"systemOSSerialNumber"];
  }
  rsaCertificateAsData = self->_rsaCertificateAsData;
  if (rsaCertificateAsData)
  {
    uint64_t v30 = [(NSData *)rsaCertificateAsData NF_asHexString];
    [v4 setObject:v30 forKeyedSubscript:@"rsaCertificate"];
  }
  else
  {
    [v4 setObject:&stru_1EEF24A78 forKeyedSubscript:@"rsaCertificate"];
  }
  ecdsaCertificateAsData = self->_ecdsaCertificateAsData;
  if (ecdsaCertificateAsData)
  {
    int v32 = [(NSData *)ecdsaCertificateAsData NF_asHexString];
    [v4 setObject:v32 forKeyedSubscript:@"ecdsaCertificate"];
  }
  else
  {
    [v4 setObject:&stru_1EEF24A78 forKeyedSubscript:@"ecdsaCertificate"];
  }
  eckaCertificateAsData = self->_eckaCertificateAsData;
  if (eckaCertificateAsData)
  {
    uint64_t v34 = [(NSData *)eckaCertificateAsData NF_asHexString];
    [v4 setObject:v34 forKeyedSubscript:@"eckaCertificate"];
  }
  else
  {
    [v4 setObject:&stru_1EEF24A78 forKeyedSubscript:@"eckaCertificate"];
  }
  v35 = [NSNumber numberWithInt:LODWORD(self->_appletMap)];
  [v4 setObject:v35 forKeyedSubscript:@"appletMap"];

  if (self->_persistentConfigID) {
    persistentConfigID = self->_persistentConfigID;
  }
  else {
    persistentConfigID = (NSNumber *)&stru_1EEF24A78;
  }
  [v4 setObject:persistentConfigID forKeyedSubscript:@"persistentConfigID"];
  v37 = [NSNumber numberWithBool:self->_personalisable];
  [v4 setObject:v37 forKeyedSubscript:@"personalisable"];

  if (self->_bootHistory) {
    bootHistory = self->_bootHistory;
  }
  else {
    bootHistory = (NSArray *)&stru_1EEF24A78;
  }
  [v4 setObject:bootHistory forKeyedSubscript:@"bootHistory"];
  __int16 v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%04x", self->_supportedTechnologies);
  [v4 setObject:v39 forKeyedSubscript:@"supportedTechnologies"];

  uint64_t v40 = [NSNumber numberWithUnsignedInteger:self->_seType];
  [v4 setObject:v40 forKeyedSubscript:@"seType"];

  if (self->_atrString) {
    atrString = (__CFString *)self->_atrString;
  }
  else {
    atrString = &stru_1EEF24A78;
  }
  [v4 setObject:atrString forKeyedSubscript:@"atrString"];
  uint64_t v42 = [NSNumber numberWithBool:self->_jcopTooOld];
  [v4 setObject:v42 forKeyedSubscript:@"jcopTooOld"];

  return v4;
}

- (unint64_t)OSVersion
{
  return self->_OSVersion;
}

- (unint64_t)fullOSVersion
{
  return self->_fullOSVersion;
}

- (unint64_t)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSNumber)compiledFWVersion
{
  return self->_compiledFWVersion;
}

- (unint64_t)hardwareVersion
{
  return self->_hardwareVersion;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (NSNumber)sequenceCounter
{
  return self->_sequenceCounter;
}

- (NSNumber)referenceCounter
{
  return self->_referenceCounter;
}

- (unint64_t)osid
{
  return self->_osid;
}

- (NSNumber)otherOSValid
{
  return self->_otherOSValid;
}

- (BOOL)restrictedMode
{
  return self->_restrictedMode;
}

- (BOOL)restrictedPerformanceMode
{
  return self->_restrictedPerformanceMode;
}

- (BOOL)osUpdateMode
{
  return self->_osUpdateMode;
}

- (unint64_t)signingKeyType
{
  return self->_signingKeyType;
}

- (unint64_t)migrationState
{
  return self->_migrationState;
}

- (unint64_t)migrationContext
{
  return self->_migrationContext;
}

- (NSNumber)migrationPackages
{
  return self->_migrationPackages;
}

- (NSNumber)migrationInstances
{
  return self->_migrationInstances;
}

- (NSString)platformIdentifier
{
  return self->_platformIdentifier;
}

- (unint64_t)appletMap
{
  return self->_appletMap;
}

- (NSNumber)persistentConfigID
{
  return self->_persistentConfigID;
}

- (NSString)rootKeyID
{
  return self->_rootKeyID;
}

- (NSString)osKeyID
{
  return self->_osKeyID;
}

- (NSString)firmwareKeyID
{
  return self->_firmwareKeyID;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSData)manifestQuery
{
  return self->_manifestQuery;
}

- (BOOL)personalisable
{
  return self->_personalisable;
}

- (NSArray)bootHistory
{
  return self->_bootHistory;
}

- (unint64_t)supportedTechnologies
{
  return self->_supportedTechnologies;
}

- (unint64_t)seType
{
  return self->_seType;
}

- (NSString)atrString
{
  return self->_atrString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atrString, 0);
  objc_storeStrong((id *)&self->_bootHistory, 0);
  objc_storeStrong((id *)&self->_manifestQuery, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_firmwareKeyID, 0);
  objc_storeStrong((id *)&self->_osKeyID, 0);
  objc_storeStrong((id *)&self->_rootKeyID, 0);
  objc_storeStrong((id *)&self->_persistentConfigID, 0);
  objc_storeStrong((id *)&self->_platformIdentifier, 0);
  objc_storeStrong((id *)&self->_migrationInstances, 0);
  objc_storeStrong((id *)&self->_migrationPackages, 0);
  objc_storeStrong((id *)&self->_otherOSValid, 0);
  objc_storeStrong((id *)&self->_referenceCounter, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
  objc_storeStrong((id *)&self->_compiledFWVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_systemOSSerialNumberAsData, 0);
  objc_storeStrong((id *)&self->_serialNumberAsData, 0);
  objc_storeStrong((id *)&self->_eckaCertificateAsData, 0);
  objc_storeStrong((id *)&self->_ecdsaCertificateAsData, 0);
  objc_storeStrong((id *)&self->_rsaCertificateAsData, 0);
}

@end