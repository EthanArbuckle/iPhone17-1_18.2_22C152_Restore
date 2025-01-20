@interface SidecarDevice
+ (BOOL)supportsSecureCoding;
+ (id)allDevices;
+ (id)allDevicesByForcingFetchFromRelay:(BOOL)a3;
+ (id)imageURLForDeviceTypeIdentifier:(id)a3;
- (BOOL)hasHomeButton;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRealityDevice;
- (BOOL)offersAdditionalDisplay;
- (NSDictionary)cameraCapabilities;
- (NSString)deviceTypeIdentifier;
- (NSString)localizedDeviceType;
- (NSString)mediaRouteIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)version;
- (NSURL)imageURL;
- (NSUUID)identifier;
- (SidecarDevice)initWithCoder:(id)a3;
- (SidecarDevice)initWithIdentifier:(id)a3 model:(id)a4 name:(id)a5;
- (SidecarDevice)initWithIdentifier:(id)a3 model:(id)a4 name:(id)a5 version:(id)a6;
- (UTType)deviceType;
- (id)description;
- (int64_t)rapportVersion;
- (unint64_t)cameraState;
- (unint64_t)hash;
- (unint64_t)status;
- (void)_updateFromDevice:(id)a3 generation:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraCapabilities:(id)a3;
- (void)setCameraState:(unint64_t)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation SidecarDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSURL)imageURL
{
  v2 = [(SidecarDevice *)self deviceTypeIdentifier];
  v3 = +[SidecarDevice imageURLForDeviceTypeIdentifier:v2];

  return (NSURL *)v3;
}

- (BOOL)isRealityDevice
{
  v3 = [(SidecarDevice *)self deviceType];
  char v4 = [v3 conformsToType:*MEMORY[0x263F1DDD0]];

  if (v4) {
    return 1;
  }
  v6 = [(SidecarDevice *)self model];
  char v7 = [v6 hasPrefix:@"RealityDevice"];

  return v7;
}

- (NSString)localizedDeviceType
{
  v2 = [(SidecarDevice *)self deviceType];
  v3 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iphone"];
  if ([v2 conformsToType:v3])
  {
    char v4 = [v3 localizedDescription];
  }
  else
  {
    v5 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.ipad"];
    if ([v2 conformsToType:v5])
    {
      char v4 = [v5 localizedDescription];
    }
    else
    {
      v6 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.ipod"];
      char v7 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.ipod"];
      int v8 = [v2 conformsToType:v7];

      if (v8) {
        v9 = v6;
      }
      else {
        v9 = v2;
      }
      char v4 = [v9 localizedDescription];
    }
  }

  return (NSString *)v4;
}

- (NSString)deviceTypeIdentifier
{
  v2 = [(SidecarDevice *)self deviceType];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (UTType)deviceType
{
  deviceType = self->_deviceType;
  if (!deviceType)
  {
    char v4 = [MEMORY[0x263F1D920] _typeWithDeviceModelCode:self->_model];
    v5 = self->_deviceType;
    self->_deviceType = v4;

    deviceType = self->_deviceType;
  }

  return deviceType;
}

- (BOOL)offersAdditionalDisplay
{
  return ![(SidecarDevice *)self isRealityDevice];
}

- (void)setMediaRouteIdentifier:(id)a3
{
  self->_mediaRouteIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void)setCameraCapabilities:(id)a3
{
  self->_cameraCapabilities = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (NSDictionary)cameraCapabilities
{
  return self->_cameraCapabilities;
}

- (void)setCameraState:(unint64_t)a3
{
  self->_cameraState = a3;
}

- (unint64_t)cameraState
{
  return self->_cameraState;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (BOOL)hasHomeButton
{
  v2 = [(SidecarDevice *)self deviceType];
  v3 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.homebuttonless-device"];
  char v4 = [v2 conformsToType:v3];

  return v4 ^ 1;
}

- (int64_t)rapportVersion
{
  int64_t result = self->_rapportVersion;
  if (!result)
  {
    char v4 = [(SidecarDevice *)self version];
    v5 = [v4 componentsSeparatedByString:@"."];

    uint64_t v6 = [v5 count];
    if (v6 < 1) {
      goto LABEL_6;
    }
    unint64_t v7 = v6;
    int v8 = [v5 objectAtIndexedSubscript:0];
    self->_rapportVersion += 10000 * [v8 integerValue];

    if (v7 == 1
      || ([v5 objectAtIndexedSubscript:1],
          v9 = objc_claimAutoreleasedReturnValue(),
          self->_rapportVersion = (uint64_t)(fmax((double)[v9 integerValue], 99.0) * 100.0
                                          + (double)self->_rapportVersion),
          v9,
          v7 <= 2))
    {
LABEL_6:
      self->_rapportVersion = (uint64_t)(double)self->_rapportVersion;
    }
    else
    {
      v10 = [v5 objectAtIndexedSubscript:2];
      self->_rapportVersion = (uint64_t)(fmax((double)[v10 integerValue], 99.0)
                                      + (double)self->_rapportVersion);
    }
    return self->_rapportVersion;
  }
  return result;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)description
{
  v2 = NSString;
  v3 = [(NSUUID *)self->_identifier UUIDString];
  char v4 = [v3 substringToIndex:8];
  v5 = [v2 stringWithFormat:@"IDS %@", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  encodeObject(v5, @"identifier", identifier);
  encodeObject(v5, @"model", self->_model);
  encodeObject(v5, @"name", self->_name);
  encodeInteger(v5, @"status", self->_status);
  encodeObject(v5, @"version", self->_version);
  encodeInteger(v5, @"cameraState", self->_cameraState);
  encodeObject(v5, @"cameraCapabilities", self->_cameraCapabilities);
  encodeObject(v5, @"mediaRouteIdentifier", self->_mediaRouteIdentifier);
}

- (SidecarDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = decodeObject(v4, @"identifier", v6);
  int v8 = decodeObject(v4, @"model", v5);
  v9 = decodeObject(v4, @"name", v5);
  uint64_t v25 = decodeInteger(v4, @"status");
  decodeObject(v4, @"version", v5);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = decodeInteger(v4, @"cameraState");
  v12 = @"cameraCapabilities";
  id v13 = v4;
  if ([v13 allowsKeyedCoding])
  {
    id v14 = [v13 decodePropertyListForKey:@"cameraCapabilities"];
    v15 = v13;
  }
  else
  {
    v15 = [v13 decodeObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v14 = v16;
  }

  decodeObject(v13, @"mediaRouteIdentifier", v5);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v26.receiver = self;
  v26.super_class = (Class)SidecarDevice;
  v18 = [(SidecarDevice *)&v26 init];
  v19 = v18;
  v20 = 0;
  if (v18 && v7 && v8 && v9)
  {
    objc_storeStrong((id *)&v18->_identifier, v7);
    objc_storeStrong((id *)&v19->_model, v8);
    objc_storeStrong((id *)&v19->_name, v9);
    v19->_status = v25;
    if (v10) {
      v21 = v10;
    }
    else {
      v21 = &stru_26E18A930;
    }
    objc_storeStrong((id *)&v19->_version, v21);
    v19->_cameraState = v11;
    if (v14) {
      v22 = v14;
    }
    else {
      v22 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v19->_cameraCapabilities, v22);
    if (v17) {
      v23 = v17;
    }
    else {
      v23 = &stru_26E18A930;
    }
    objc_storeStrong((id *)&v19->_mediaRouteIdentifier, v23);
    v20 = v19;
  }

  return v20;
}

- (unint64_t)hash
{
  v2 = [(SidecarDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SidecarDevice *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else if ([(SidecarDevice *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    uint64_t v6 = [(SidecarDevice *)v5 status];
    if (v6 == [(SidecarDevice *)self status])
    {
      unint64_t v7 = [(SidecarDevice *)v5 identifier];
      int v8 = [(SidecarDevice *)self identifier];
      if ([v7 isEqual:v8])
      {
        v9 = [(SidecarDevice *)v5 model];
        v10 = [(SidecarDevice *)self model];
        if ([v9 isEqual:v10])
        {
          uint64_t v11 = [(SidecarDevice *)v5 name];
          v12 = [(SidecarDevice *)self name];
          if ([v11 isEqual:v12])
          {
            id v13 = [(SidecarDevice *)v5 version];
            v19 = [(SidecarDevice *)self version];
            if (objc_msgSend(v13, "isEqual:"))
            {
              v18 = [(SidecarDevice *)v5 mediaRouteIdentifier];
              [(SidecarDevice *)self mediaRouteIdentifier];
              id v14 = v17 = v13;
              char v15 = [v18 isEqual:v14];

              id v13 = v17;
            }
            else
            {
              char v15 = 0;
            }
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)_updateFromDevice:(id)a3 generation:(unint64_t)a4
{
  id v22 = a3;
  uint64_t v6 = [v22 identifier];
  if (([v6 isEqual:self->_identifier] & 1) == 0) {
    __assert_rtn("-[SidecarDevice _updateFromDevice:generation:]", "SidecarDevice.m", 73, "[device.identifier isEqual:_identifier]");
  }

  if (self->_generation != a4)
  {
    self->_generation = a4;
    unint64_t v7 = [v22 model];
    char v8 = [v7 isEqualToString:self->_model];

    if ((v8 & 1) == 0)
    {
      v9 = [v22 model];
      model = self->_model;
      self->_model = v9;

      deviceType = self->_deviceType;
      self->_deviceType = 0;
    }
    v12 = [v22 name];
    char v13 = [v12 isEqualToString:self->_name];

    if ((v13 & 1) == 0)
    {
      id v14 = [v22 name];
      name = self->_name;
      self->_name = v14;
    }
    self->_status = [v22 status];
    v16 = [v22 version];
    version = self->_version;
    self->_version = v16;

    self->_cameraState = [v22 cameraState];
    v18 = [v22 cameraCapabilities];
    cameraCapabilities = self->_cameraCapabilities;
    self->_cameraCapabilities = v18;

    v20 = [v22 mediaRouteIdentifier];
    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    self->_mediaRouteIdentifier = v20;
  }
}

- (SidecarDevice)initWithIdentifier:(id)a3 model:(id)a4 name:(id)a5
{
  return [(SidecarDevice *)self initWithIdentifier:a3 model:a4 name:a5 version:&stru_26E18A930];
}

- (SidecarDevice)initWithIdentifier:(id)a3 model:(id)a4 name:(id)a5 version:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SidecarDevice;
  char v15 = [(SidecarDevice *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_model, a4);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_version, a6);
  }

  return v16;
}

+ (id)imageURLForDeviceTypeIdentifier:(id)a3
{
  unint64_t v3 = [MEMORY[0x263F1D920] typeWithIdentifier:a3];
  id v4 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.homebuttonless-device"];
  int v5 = [v3 conformsToType:v4];

  uint64_t v6 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iphone"];
  int v7 = [v3 conformsToType:v6];

  if (v7)
  {
    char v8 = @"com.apple.iphone-x";
    BOOL v9 = v5 == 0;
  }
  else
  {
    v10 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.ipad"];
    int v11 = [v3 conformsToType:v10];

    char v8 = @"com.apple.ipad-pro";
    if (!v5) {
      char v8 = @"com.apple.ipad";
    }
    BOOL v9 = v11 == 0;
  }
  if (v9) {
    id v12 = @"com.apple.iphone";
  }
  else {
    id v12 = v8;
  }
  id v13 = SidecarCoreBundle();
  id v14 = [v13 URLForResource:v12 withExtension:@"pdf"];

  return v14;
}

+ (id)allDevicesByForcingFetchFromRelay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v57 = *MEMORY[0x263EF8340];
  SidecarRegisterStateNotification();
  unint64_t v4 = atomic_load(&SidecarDeviceState);
  unint64_t v5 = atomic_exchange(&allDevicesByForcingFetchFromRelay__allDevicesGeneration, v4);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__474;
  v51 = __Block_byref_object_dispose__475;
  id v52 = 0;
  if (v5 != v4 || v3)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__474;
    v45 = __Block_byref_object_dispose__475;
    id v46 = 0;
    int v7 = SidecarQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke;
    block[3] = &unk_2649C60A0;
    block[4] = &v41;
    dispatch_sync(v7, block);

    if (v4 || v3)
    {
      char v8 = SidecarDevicesForService(@"*");
      if (v3)
      {
        BOOL v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v56 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v37 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = [*(id *)(*((void *)&v36 + 1) + 8 * i) identifier];
              [v9 addObject:v14];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v56 count:16];
          }
          while (v11);
        }

        char v15 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
        v16 = v15;
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v9;
          _os_log_impl(&dword_22D954000, v16, OS_LOG_TYPE_DEFAULT, "Forced a fetch of devices from SidecarRelay. Identifiers of devices fetched: [%@]", buf, 0xCu);
        }
      }
    }
    else
    {
      char v8 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v8, "count"));
    objc_super v18 = (void *)v48[5];
    v48[5] = v17;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v8;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          v24 = [v23 identifier];
          uint64_t v25 = [(id)v42[5] objectForKeyedSubscript:v24];
          objc_super v26 = v25;
          if (v25)
          {
            [v25 _updateFromDevice:v23 generation:v4];
            v23 = v26;
          }
          else
          {
            v23[8] = v4;
          }
          [(id)v48[5] setObject:v23 forKeyedSubscript:v24];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v53 count:16];
      }
      while (v20);
    }

    _Block_object_dispose(&v41, 8);
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__474;
  v45 = __Block_byref_object_dispose__475;
  id v46 = 0;
  v27 = SidecarQueue();
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_52;
  v31[3] = &unk_2649C60F0;
  v31[4] = &v47;
  v31[5] = &v41;
  dispatch_sync(v27, v31);

  v28 = (void *)v42[5];
  if (!v28) {
    v28 = (void *)MEMORY[0x263EFFA68];
  }
  id v29 = v28;
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);

  return v29;
}

void __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(id)allDevicesByForcingFetchFromRelay__allDevicesArray count];
  uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)allDevicesByForcingFetchFromRelay__allDevicesArray;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        id v13 = objc_msgSend(v11, "identifier", (void)v14);
        [v12 setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

void __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_52(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    uint64_t v3 = [v2 allValues];
    uint64_t v4 = (void *)allDevicesByForcingFetchFromRelay__allDevicesArray;
    allDevicesByForcingFetchFromRelay__allDevicesArray = v3;
  }
  unint64_t v5 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iphone"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_2;
  v9[3] = &unk_2649C60C8;
  v9[4] = v5;
  uint64_t v6 = [(id)allDevicesByForcingFetchFromRelay__allDevicesArray sortedArrayUsingComparator:v9];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = (void *)MEMORY[0x263F1D920];
  id v10 = [v7 deviceTypeIdentifier];
  uint64_t v11 = [v9 typeWithIdentifier:v10];

  uint64_t v12 = (void *)MEMORY[0x263F1D920];
  id v13 = [v8 deviceTypeIdentifier];
  long long v14 = [v12 typeWithIdentifier:v13];

  int v15 = [v11 conformsToType:*(void *)(a1 + 32)];
  int v16 = [v14 conformsToType:*(void *)(a1 + 32)];
  if (v15) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 1;
  }
  if (v15 == v16)
  {
    objc_super v18 = [v7 name];
    uint64_t v19 = [v8 name];
    uint64_t v17 = [v18 compare:v19 options:705];

    if (!v17)
    {
      uint64_t v20 = [v7 model];
      uint64_t v21 = [v8 model];
      uint64_t v17 = [v20 compare:v21 options:65];

      if (!v17)
      {
        id v22 = [v7 identifier];
        v23 = [v22 UUIDString];
        v24 = [v8 identifier];
        uint64_t v25 = [v24 UUIDString];
        uint64_t v17 = [v23 compare:v25 options:0];
      }
    }
  }

  return v17;
}

+ (id)allDevices
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 allDevicesByForcingFetchFromRelay:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end