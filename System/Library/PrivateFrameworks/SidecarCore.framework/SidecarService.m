@interface SidecarService
+ (NSArray)allMenuServices;
+ (NSArray)allServices;
+ (NSArray)returnTypes;
+ (NSSet)allReturnTypes;
+ (NSSet)allSendTypes;
+ (id)extensionForIdentifier:(id)a3;
+ (id)menuServices;
+ (id)name;
+ (id)serviceWithIdentifier:(id)a3;
+ (id)serviceWithName:(id)a3;
+ (id)services;
+ (id)servicesForPasteboardSendTypes:(id)a3 returnTypes:(id)a4;
+ (id)servicesForPasteboardTypes:(id)a3;
+ (int64_t)minimumRapportVersion;
- (BOOL)isEnabled;
- (NSArray)devices;
- (NSArray)returnTypes;
- (NSArray)sendTypes;
- (NSString)localizedDescription;
- (NSString)localizedItemName;
- (NSString)name;
- (NSString)serviceExtension;
- (NSString)serviceIdentifier;
- (SidecarService)init;
- (SidecarService)initWithDevice:(id)a3;
- (id)_devicesByForcingFetchFromRelay:(BOOL)a3;
- (id)copyWithDevice:(id)a3;
- (id)makeRequest;
- (id)makeRequestToDevice:(id)a3;
- (id)makeRequestWithResponder:(id)a3 sendTypes:(id)a4 returnTypes:(id)a5;
- (id)mutableRequestMessage;
@end

@implementation SidecarService

void __37__SidecarService_Scanner_returnTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF8C0];
  id v5 = [(id)*MEMORY[0x263F1DB40] identifier];
  v1 = [(id)*MEMORY[0x263F1DBF0] identifier];
  v2 = [(id)*MEMORY[0x263F1DCE0] identifier];
  uint64_t v3 = objc_msgSend(v0, "arrayWithObjects:", v5, v1, v2, 0);
  v4 = (void *)returnTypes_types;
  returnTypes_types = v3;
}

uint64_t __45__SidecarService_LosslessScanner_returnTypes__block_invoke()
{
  returnTypes_types_320 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"com.apple.DocumentCamera.scan-archive", 0);

  return MEMORY[0x270F9A758]();
}

void __36__SidecarService_Camera_returnTypes__block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 stringForKey:@"ContinuityCameraImageType"];

  if (v1)
  {
    v2 = [MEMORY[0x263F1D920] _typeWithIdentifier:v1 allowUndeclared:1];
    if ([v2 conformsToType:*MEMORY[0x263F1DB18]]) {
      id v8 = v1;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(id)*MEMORY[0x263F1DB40] identifier];
  id v5 = [(id)*MEMORY[0x263F1DCE0] identifier];
  uint64_t v6 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v8, 0);
  v7 = (void *)returnTypes_types_588;
  returnTypes_types_588 = v6;
}

- (void).cxx_destruct
{
}

- (id)copyWithDevice:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDevice:v3];

  return v4;
}

- (id)makeRequestToDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = filterTargetDevice(self, v4, 0);
  if (v5) {
    goto LABEL_4;
  }
  uint64_t v6 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  v7 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v4 identifier];
    int v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_22D954000, v7, OS_LOG_TYPE_DEFAULT, "While trying to make a request to device with IDS identifier [%@], the target device was not found. Forcing a fetch to SidecarRelay to find the device.", (uint8_t *)&v13, 0xCu);
  }
  id v5 = filterTargetDevice(self, v4, 1);
  if (v5)
  {
LABEL_4:
    id v8 = makeRequest(self, v5);
  }
  else
  {
    v10 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
    id v5 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v4 identifier];
      int v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_DEFAULT, "Even after forcing a fetch to SidecarRelay, the device with identifier [%@] could not be found.  Will not be able to make a request to it.", (uint8_t *)&v13, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)makeRequestWithResponder:(id)a3 sendTypes:(id)a4 returnTypes:(id)a5
{
  return makeRequest(self, self->_targetDevice);
}

- (id)makeRequest
{
  return makeRequest(self, self->_targetDevice);
}

- (NSString)localizedItemName
{
  return (NSString *)&stru_26E18A930;
}

- (NSString)localizedDescription
{
  return (NSString *)&stru_26E18A930;
}

- (id)mutableRequestMessage
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  SidecarMessageSetType(v3, 1);
  id v4 = [(SidecarService *)self name];
  [v3 setObject:v4 forKey:&unk_26E18EAF0];

  return v3;
}

- (NSString)serviceExtension
{
  return 0;
}

- (NSString)serviceIdentifier
{
  return 0;
}

- (BOOL)isEnabled
{
  v2 = [(SidecarService *)self devices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)sendTypes
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSArray)returnTypes
{
  v2 = objc_opt_class();

  return (NSArray *)[v2 returnTypes];
}

- (NSString)name
{
  v2 = objc_opt_class();

  return (NSString *)[v2 name];
}

- (id)_devicesByForcingFetchFromRelay:(BOOL)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  if (self->_targetDevice)
  {
    v14[0] = self->_targetDevice;
    BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  }
  else
  {
    id v4 = +[SidecarDevice allDevicesByForcingFetchFromRelay:a3];
    uint64_t v5 = [(id)objc_opt_class() minimumRapportVersion];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __filterSupportedDevices_block_invoke;
    v11[3] = &__block_descriptor_40_e23_B16__0__SidecarDevice_8l;
    v11[4] = v5;
    uint64_t v6 = v11;
    v7 = (objc_class *)MEMORY[0x263EFF980];
    id v8 = v4;
    v9 = objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __filterDevices_block_invoke;
    v12[3] = &unk_2649C6418;
    v12[4] = v9;
    id v13 = v6;
    [v8 enumerateObjectsUsingBlock:v12];

    BOOL v3 = (void *)[v9 copy];
  }

  return v3;
}

- (NSArray)devices
{
  return (NSArray *)[(SidecarService *)self _devicesByForcingFetchFromRelay:0];
}

- (SidecarService)initWithDevice:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() minimumRapportVersion];
  if ([v5 rapportVersion] >= v6)
  {
    id v8 = [(SidecarService *)self init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_targetDevice, a3);
    }
    self = v9;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SidecarService)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    _NSRequestConcreteObject();
    id v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SidecarService;
    self = [(SidecarService *)&v6 init];
    id v4 = self;
  }

  return v4;
}

+ (int64_t)minimumRapportVersion
{
  return -1;
}

+ (NSSet)allSendTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

+ (NSSet)allReturnTypes
{
  if (allReturnTypes_once != -1) {
    dispatch_once(&allReturnTypes_once, &__block_literal_global_48);
  }
  v2 = (void *)allReturnTypes_allTypes;

  return (NSSet *)v2;
}

void __32__SidecarService_allReturnTypes__block_invoke()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v0 = +[SidecarService services];
  v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v0, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = (void *)MEMORY[0x263EFFA08];
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v6), "returnTypes", (void)v12);
        v9 = [v7 setWithArray:v8];

        [v1 unionSet:v9];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [v1 copy];
  v11 = (void *)allReturnTypes_allTypes;
  allReturnTypes_allTypes = v10;
}

+ (NSArray)returnTypes
{
  return 0;
}

+ (id)name
{
  return 0;
}

+ (id)servicesForPasteboardTypes:(id)a3
{
  return (id)[a1 servicesForPasteboardSendTypes:0 returnTypes:a3];
}

+ (id)servicesForPasteboardSendTypes:(id)a3 returnTypes:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = +[SidecarService services];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v18 = v4;
  v7 = [MEMORY[0x263EFFA08] setWithArray:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = (void *)MEMORY[0x263EFFA08];
        long long v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) returnTypes];
        long long v15 = [v13 setWithArray:v14];

        if ([v15 intersectsSet:v7])
        {
          v16 = objc_opt_new();
          [v6 addObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v6;
}

+ (id)extensionForIdentifier:(id)a3
{
  uint64_t v3 = extensionForIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&extensionForIdentifier__onceToken, &__block_literal_global_44);
  }
  uint64_t v5 = [(id)extensionForIdentifier__serviceToExtension objectForKeyedSubscript:v4];

  return v5;
}

void __41__SidecarService_extensionForIdentifier___block_invoke()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v0 = +[SidecarService allServices];
  v1 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v0, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "serviceExtension", (void)v11);
        uint64_t v9 = [v7 serviceIdentifier];
        [v1 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v10 = (void *)extensionForIdentifier__serviceToExtension;
  extensionForIdentifier__serviceToExtension = (uint64_t)v1;
}

+ (NSArray)allMenuServices
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = +[SidecarService menuServices];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_opt_new();
        objc_msgSend(v3, "addObject:", v9, v11);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (NSArray)allServices
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = +[SidecarService services];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_opt_new();
        objc_msgSend(v3, "addObject:", v9, v11);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (id)serviceWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[SidecarService services];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "name", (void)v11);
        char v9 = [v3 isEqualToString:v8];

        if (v9)
        {
          uint64_t v5 = objc_opt_new();
          goto LABEL_11;
        }
      }
      uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)serviceWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[SidecarService allServices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = objc_msgSend(v8, "serviceIdentifier", (void)v12);
        char v10 = [v3 isEqualToString:v9];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)menuServices
{
  if (menuServices_once != -1) {
    dispatch_once(&menuServices_once, &__block_literal_global_39);
  }
  id v2 = (void *)menuServices_services;

  return v2;
}

void __30__SidecarService_menuServices__block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = self;
  v5[0] = v0;
  v1 = self;
  v5[1] = v1;
  id v2 = self;
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  id v4 = (void *)menuServices_services;
  menuServices_services = v3;
}

+ (id)services
{
  if (services_once != -1) {
    dispatch_once(&services_once, &__block_literal_global_890);
  }
  id v2 = (void *)services_services;

  return v2;
}

void __26__SidecarService_services__block_invoke()
{
  v10[8] = *MEMORY[0x263EF8340];
  v0 = self;
  v10[0] = v0;
  v1 = self;
  v10[1] = v1;
  id v2 = self;
  v10[2] = v2;
  uint64_t v3 = self;
  v10[3] = v3;
  id v4 = self;
  v10[4] = v4;
  id v5 = self;
  v10[5] = v5;
  uint64_t v6 = self;
  v10[6] = v6;
  uint64_t v7 = self;
  v10[7] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:8];
  char v9 = (void *)services_services;
  services_services = v8;
}

void __36__SidecarService_Sketch_returnTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(id)*MEMORY[0x263F1DC08] identifier];
  uint64_t v1 = objc_msgSend(v0, "arrayWithObjects:", v3, @"com.apple.drawing", 0);
  id v2 = (void *)returnTypes_types_1015;
  returnTypes_types_1015 = v1;
}

@end