@interface RPRemoteDisplayDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToDevice:(id)a3;
- (NSDictionary)cameraCapabilities;
- (NSString)persistentIdentifier;
- (OS_dispatch_source)cameraCapabilitiesRefetchTimer;
- (RPRemoteDisplayDevice)initWithCoder:(id)a3;
- (RPRemoteDisplayDevice)initWithIdentifier:(id)a3 name:(id)a4 model:(id)a5 accountID:(id)a6;
- (RPRemoteDisplayDevice)initWithKeychainDictionaryRepresentation:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)keychainDictionaryRepresentation;
- (unsigned)flags;
- (unsigned)updateWithEndpoint:(id)a3;
- (void)clearCameraCapabilitiesRefetchTimer;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraCapabilities:(id)a3;
- (void)setCameraCapabilitiesRefetchTimer:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
@end

@implementation RPRemoteDisplayDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayDevice)initWithIdentifier:(id)a3 name:(id)a4 model:(id)a5 accountID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RPRemoteDisplayDevice;
  v14 = [(RPRemoteDisplayDevice *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    idsDeviceIdentifier = v14->super._idsDeviceIdentifier;
    v14->super._idsDeviceIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    name = v14->super._name;
    v14->super._name = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    model = v14->super._model;
    v14->super._model = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    accountID = v14->super._accountID;
    v14->super._accountID = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

- (RPRemoteDisplayDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPRemoteDisplayDevice;
  v5 = [(RPEndpoint *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"ccap"];
    cameraCapabilities = v5->_cameraCapabilities;
    v5->_cameraCapabilities = (NSDictionary *)v6;

    uint64_t v12 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_flags = v12;
    }
    id v8 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPRemoteDisplayDevice;
  [(RPEndpoint *)&v8 encodeWithCoder:v4];
  cameraCapabilities = self->_cameraCapabilities;
  if (cameraCapabilities) {
    [v4 encodeObject:cameraCapabilities forKey:@"ccap"];
  }
  uint64_t flags = self->_flags;
  if (flags) {
    [v4 encodeInt64:flags forKey:@"fl"];
  }
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier) {
    [v4 encodeObject:persistentIdentifier forKey:@"pi"];
  }
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v7 = [v4 identifier];
    v26.receiver = self;
    v26.super_class = (Class)RPRemoteDisplayDevice;
    unsigned __int8 v8 = [(RPEndpoint *)&v26 compareWithDeviceIdentifier:v7];

    if (v8) {
      goto LABEL_7;
    }
  }
  uint64_t v9 = [v4 idsDeviceIdentifier];
  if (v9)
  {
    id v10 = (void *)v9;
    objc_super v11 = [v4 idsDeviceIdentifier];
    v25.receiver = self;
    v25.super_class = (Class)RPRemoteDisplayDevice;
    unsigned __int8 v12 = [(RPEndpoint *)&v25 compareWithDeviceIdentifier:v11];

    if (v12) {
      goto LABEL_7;
    }
  }
  uint64_t v13 = [v4 verifiedIdentity];
  if (!v13) {
    goto LABEL_8;
  }
  v14 = (void *)v13;
  uint64_t v15 = [v4 verifiedIdentity];
  v24.receiver = self;
  v24.super_class = (Class)RPRemoteDisplayDevice;
  unsigned __int8 v16 = [(RPEndpoint *)&v24 compareWithDeviceIdentifier:v15];

  if (v16)
  {
LABEL_7:
    BOOL v17 = 1;
  }
  else
  {
LABEL_8:
    v18 = [v4 bleDevice];
    uint64_t v19 = [v18 rapportIdentifier];
    if (v19)
    {
      v20 = [v4 bleDevice];
      uint64_t v21 = [v20 rapportIdentifier];
      v23.receiver = self;
      v23.super_class = (Class)RPRemoteDisplayDevice;
      BOOL v17 = [(RPEndpoint *)&v23 compareWithDeviceIdentifier:v21];
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  return v17;
}

- (id)description
{
  return [(RPRemoteDisplayDevice *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  BOOL v4 = shouldPrintSensitiveData();
  uint64_t v47 = 0;
  NSAppendPrintF();
  id v5 = 0;
  uint64_t v6 = self->super._accountAltDSID;
  v7 = self->super._identifier;
  unsigned __int8 v8 = self->super._idsDeviceIdentifier;
  if ([(NSString *)v8 isEqual:v7])
  {

    v7 = 0;
  }
  if (v6)
  {
    id v46 = v5;
    formatSensitiveData((uint64_t)", AltDSID ", v4);
    v32 = v6;
    NSAppendPrintF();
    id v9 = v5;

    id v5 = v9;
  }
  if (v8)
  {
    id v45 = v5;
    formatSensitiveData((uint64_t)", IDS ", v4);
    v32 = v8;
    NSAppendPrintF();
    id v10 = v5;

    id v5 = v10;
  }
  if (v7)
  {
    id v44 = v5;
    formatSensitiveData((uint64_t)", ID ", v4);
    v32 = v7;
    NSAppendPrintF();
    id v11 = v5;

    id v5 = v11;
  }
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier)
  {
    id v43 = v5;
    uint64_t v13 = persistentIdentifier;
    formatSensitiveData((uint64_t)", PI ", v4);
    v32 = v13;
    NSAppendPrintF();
    id v14 = v5;

    id v5 = v14;
  }
  name = self->super._name;
  if (name)
  {
    id v42 = v5;
    unsigned __int8 v16 = name;
    formatSensitiveData((uint64_t)", Nm ", v4);
    v32 = v16;
    NSAppendPrintF();
    id v17 = v5;

    id v5 = v17;
  }
  model = self->super._model;
  if (model)
  {
    id v41 = v5;
    uint64_t v19 = model;
    formatSensitiveData((uint64_t)", Md ", v4);
    v32 = v19;
    NSAppendPrintF();
    id v20 = v5;

    id v5 = v20;
  }
  if (v4)
  {
    v40.receiver = self;
    v40.super_class = (Class)RPRemoteDisplayDevice;
    [(RPEndpoint *)&v40 operatingSystemVersion];
    if (v39)
    {
      id v38 = v5;
      v36.receiver = self;
      v36.super_class = (Class)RPRemoteDisplayDevice;
      [(RPEndpoint *)&v36 operatingSystemVersion];
      RPNSOperatingSystemVersionToString(v37);
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF();
      id v21 = v38;

      id v5 = v21;
    }
    sourceVersion = self->super._sourceVersion;
    if (sourceVersion)
    {
      id v35 = v5;
      v32 = sourceVersion;
      NSAppendPrintF();
      id v23 = v5;

      id v5 = v23;
    }
  }
  cameraCapabilities = self->_cameraCapabilities;
  if (cameraCapabilities)
  {
    id v34 = v5;
    v32 = [(NSDictionary *)cameraCapabilities count];
    NSAppendPrintF();
    id v25 = v5;

    id v5 = v25;
  }
  v33.receiver = self;
  v33.super_class = (Class)RPRemoteDisplayDevice;
  if ([(RPEndpoint *)&v33 cameraState])
  {
    NSAppendPrintF();
    id v27 = v5;

    id v5 = v27;
  }
  if (self->_flags)
  {
    NSAppendPrintF();
    id v28 = v5;

    id v5 = v28;
  }
  if (self->super._statusFlags)
  {
    NSAppendPrintF();
    id v29 = v5;

    id v5 = v29;
  }
  id v30 = v5;

  return v30;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RPRemoteDisplayDevice;
  unsigned int v4 = [(RPEndpoint *)&v7 updateWithEndpoint:a3];
  idsDeviceIdentifier = self->super._idsDeviceIdentifier;
  if (idsDeviceIdentifier && !self->_persistentIdentifier)
  {
    objc_storeStrong((id *)&self->_persistentIdentifier, idsDeviceIdentifier);
    v4 |= 2u;
  }
  return v4;
}

- (NSString)persistentIdentifier
{
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier || (persistentIdentifier = self->super._idsDeviceIdentifier) != 0) {
    v3 = persistentIdentifier;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (void)clearCameraCapabilitiesRefetchTimer
{
  cameraCapabilitiesRefetchTimer = self->_cameraCapabilitiesRefetchTimer;
  if (cameraCapabilitiesRefetchTimer)
  {
    id v5 = cameraCapabilitiesRefetchTimer;
    dispatch_source_cancel(v5);
    unsigned int v4 = self->_cameraCapabilitiesRefetchTimer;
    self->_cameraCapabilitiesRefetchTimer = 0;
  }
}

- (RPRemoteDisplayDevice)initWithKeychainDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"idsD"];

  if (!v5)
  {
    if (gLogCategory_RPRemoteDisplayDevice <= 90
      && (gLogCategory_RPRemoteDisplayDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_38;
  }
  v38.receiver = self;
  v38.super_class = (Class)RPRemoteDisplayDevice;
  self = [(RPRemoteDisplayDevice *)&v38 init];
  if (!self)
  {
LABEL_38:
    objc_super v36 = 0;
    goto LABEL_39;
  }
  uint64_t v6 = [v4 objectForKey:@"idsD"];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  [(RPEndpoint *)self setIdsDeviceIdentifier:v10];
  id v11 = [v4 objectForKey:@"idsD"];
  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;

  [(RPRemoteDisplayDevice *)self setPersistentIdentifier:v15];
  unsigned __int8 v16 = [v4 objectForKey:@"nm"];
  uint64_t v17 = objc_opt_class();
  id v18 = v16;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = v19;

  [(RPEndpoint *)self setName:v20];
  id v21 = [v4 objectForKey:@"md"];
  uint64_t v22 = objc_opt_class();
  id v23 = v21;
  if (v22)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v24 = v23;
    }
    else {
      objc_super v24 = 0;
    }
  }
  else
  {
    objc_super v24 = 0;
  }
  id v25 = v24;

  [(RPEndpoint *)self setModel:v25];
  objc_super v26 = [v4 objectForKey:@"aid"];
  uint64_t v27 = objc_opt_class();
  id v28 = v26;
  if (v27)
  {
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }
  }
  else
  {
    id v29 = 0;
  }
  id v30 = v29;

  [(RPEndpoint *)self setAccountID:v30];
  v31 = [v4 objectForKey:@"altDSID"];
  uint64_t v32 = objc_opt_class();
  id v33 = v31;
  if (v32)
  {
    if (objc_opt_isKindOfClass()) {
      id v34 = v33;
    }
    else {
      id v34 = 0;
    }
  }
  else
  {
    id v34 = 0;
  }
  id v35 = v34;

  [(RPEndpoint *)self setAccountAltDSID:v35];
  self = self;
  objc_super v36 = self;
LABEL_39:

  return v36;
}

- (id)keychainDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  idsDeviceIdentifier = self->super._idsDeviceIdentifier;
  if (idsDeviceIdentifier)
  {
    id v5 = (void *)[(NSString *)idsDeviceIdentifier copy];
    [v3 setObject:v5 forKey:@"idsD"];
  }
  name = self->super._name;
  if (name)
  {
    uint64_t v7 = (void *)[(NSString *)name copy];
    [v3 setObject:v7 forKey:@"nm"];
  }
  model = self->super._model;
  if (model)
  {
    id v9 = (void *)[(NSString *)model copy];
    [v3 setObject:v9 forKey:@"md"];
  }
  accountID = self->super._accountID;
  if (accountID)
  {
    id v11 = (void *)[(NSString *)accountID copy];
    [v3 setObject:v11 forKey:@"aid"];
  }
  accountAltDSID = self->super._accountAltDSID;
  if (accountAltDSID)
  {
    id v13 = (void *)[(NSString *)accountAltDSID copy];
    [v3 setObject:v13 forKey:@"altDSID"];
  }
  id v14 = (void *)[v3 copy];

  return v14;
}

- (NSDictionary)cameraCapabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCameraCapabilities:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (OS_dispatch_source)cameraCapabilitiesRefetchTimer
{
  return self->_cameraCapabilitiesRefetchTimer;
}

- (void)setCameraCapabilitiesRefetchTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraCapabilitiesRefetchTimer, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraCapabilities, 0);
}

@end