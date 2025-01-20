@interface TPSCloudDeviceValidation
+ (NSArray)idsDevices;
+ (id)deviceInfoForIdentifier:(id)a3 preferredModels:(id)a4 dataSource:(id)a5;
+ (id)iPadDeviceInfoUsingDataSource:(id)a3;
+ (id)iPhoneDeviceInfoUsingDataSource:(id)a3;
+ (id)idsService;
+ (id)normalizedVersion:(id)a3;
+ (id)tvDeviceInfoUsingDataSource:(id)a3;
+ (id)visionProDeviceInfoUsingDataSource:(id)a3;
+ (id)watchDeviceInfoUsingDataSource:(id)a3;
- (TPSCloudDeviceDataSource)dataSource;
- (TPSCloudDeviceInfo)deviceInfo;
- (TPSCloudDeviceValidation)initWithDeviceInfo:(id)a3;
- (id)description;
- (void)setDataSource:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCloudDeviceValidation

+ (id)idsService
{
  if (idsService_predicate != -1) {
    dispatch_once(&idsService_predicate, &__block_literal_global_2);
  }
  v2 = (void *)idsService_service;

  return v2;
}

uint64_t __38__TPSCloudDeviceValidation_idsService__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F6AB90]);
  idsService_service = [v0 initWithService:*MEMORY[0x1E4FAF510]];

  return MEMORY[0x1F41817F8]();
}

+ (NSArray)idsDevices
{
  v2 = [a1 idsService];
  v3 = [v2 devices];

  return (NSArray *)v3;
}

+ (id)normalizedVersion:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"."];
  v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [v4 count];
  unint64_t v6 = v5 - 4;
  if (v5 <= 4)
  {
    if (v5 != 4)
    {
      unint64_t v7 = 4 - v5;
      do
      {
        objc_msgSend(v4, "addObject:", @"0", v6);
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(v4, "removeObjectsInRange:", 3, v6);
  }
  v8 = [v4 componentsJoinedByString:@"."];

  return v8;
}

+ (id)deviceInfoForIdentifier:(id)a3 preferredModels:(id)a4 dataSource:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 registeredDevices];
  v44 = v8;
  uint64_t v45 = [v8 count];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
  v46 = v11;
  if (!v12)
  {

    goto LABEL_28;
  }
  uint64_t v13 = v12;
  id v14 = 0;
  uint64_t v15 = *(void *)v48;
  id v41 = v9;
  uint64_t v42 = *(void *)v48;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      v18 = objc_msgSend(v17, "modelIdentifier", v41);
      v19 = [v18 lowercaseString];

      if ([v19 containsString:v7])
      {
        if (!v14)
        {
          id v14 = v17;
          goto LABEL_21;
        }
        if (v45)
        {
          v20 = v14;
          v21 = [v14 modelIdentifier];
          v22 = [v21 lowercaseString];

          int v23 = [v44 containsObject:v22];
          int v24 = [v44 containsObject:v19];
          if ((v24 & 1) == 0 && v23) {
            goto LABEL_20;
          }
          if (((v24 ^ 1 | v23) & 1) == 0)
          {
            id v14 = v17;

LABEL_20:
            id v11 = v46;
            goto LABEL_21;
          }
        }
        v25 = [v17 productVersion];
        v26 = [a1 normalizedVersion:v25];

        [v14 productVersion];
        v28 = v27 = v14;
        v29 = [a1 normalizedVersion:v28];

        if ([v29 compare:v26 options:64] == -1)
        {
          id v14 = v17;
        }
        else
        {
          id v14 = v27;
        }

        id v11 = v46;
        uint64_t v15 = v42;
      }
LABEL_21:
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
  }
  while (v13);

  id v9 = v41;
  if (v14)
  {
    v30 = [v14 modelIdentifier];
    [v30 lowercaseString];
    v31 = v14;
    id v32 = (id)objc_claimAutoreleasedReturnValue();

    v33 = v31;
    v34 = [v31 productVersion];
    uint64_t v35 = [v44 containsObject:v32];
    if (!v32) {
      goto LABEL_25;
    }
LABEL_31:
    v36 = [[TPSCloudDeviceInfo alloc] initWithModel:v32];
    [(TPSCloudDeviceInfo *)v36 setMaxOSVersion:v34];
    [(TPSCloudDeviceInfo *)v36 setPreferred:v35];
    goto LABEL_33;
  }
LABEL_28:
  v37 = (void *)MGCopyAnswer();
  v38 = [v37 lowercaseString];
  int v39 = [v38 containsString:v7];

  id v32 = 0;
  v34 = 0;
  if (v39)
  {
    id v32 = v37;
    v34 = [MEMORY[0x1E4FAF3F8] productVersion];
  }

  v33 = 0;
  uint64_t v35 = 0;
  if (v32) {
    goto LABEL_31;
  }
LABEL_25:
  if ([MEMORY[0x1E4FAF450] ignoreTargetingValidator]) {
    v36 = [[TPSCloudDeviceInfo alloc] initWithModel:v7];
  }
  else {
    v36 = 0;
  }
LABEL_33:

  return v36;
}

+ (id)iPadDeviceInfoUsingDataSource:(id)a3
{
  v3 = [a1 deviceInfoForIdentifier:@"ipad" preferredModels:0 dataSource:a3];
  v4 = v3;
  if (v3)
  {
    [v3 setModel:@"ipad"];
    [v4 setDisplayName:@"iPad"];
    [v4 setSymbolIdentifier:@"ipad"];
  }

  return v4;
}

+ (id)iPhoneDeviceInfoUsingDataSource:(id)a3
{
  v3 = [a1 deviceInfoForIdentifier:@"iphone" preferredModels:0 dataSource:a3];
  v4 = v3;
  if (v3)
  {
    [v3 setModel:@"iphone"];
    [v4 setDisplayName:@"iPhone"];
    [v4 setSymbolIdentifier:@"iphone"];
  }

  return v4;
}

+ (id)tvDeviceInfoUsingDataSource:(id)a3
{
  v3 = [a1 deviceInfoForIdentifier:@"tv" preferredModels:0 dataSource:a3];
  v4 = v3;
  if (v3)
  {
    [v3 setModel:@"tv"];
    [v4 setDisplayName:@"Apple TV"];
    [v4 setSymbolIdentifier:@"appletv"];
  }

  return v4;
}

+ (id)visionProDeviceInfoUsingDataSource:(id)a3
{
  v3 = [a1 deviceInfoForIdentifier:@"realitydevice" preferredModels:0 dataSource:a3];
  v4 = v3;
  if (v3)
  {
    [v3 setModel:@"apple-vision-pro"];
    [v4 setDisplayName:@"Apple Vision Pro"];
    [v4 setSymbolIdentifier:@"visionpro"];
  }

  return v4;
}

+ (id)watchDeviceInfoUsingDataSource:(id)a3
{
  v3 = [a1 deviceInfoForIdentifier:@"watch" preferredModels:0 dataSource:a3];
  v4 = v3;
  if (v3)
  {
    [v3 setModel:@"watch"];
    [v4 setDisplayName:@"Apple Watch"];
    [v4 setSymbolIdentifier:@"applewatch"];
  }

  return v4;
}

- (TPSCloudDeviceValidation)initWithDeviceInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudDeviceValidation;
  unint64_t v6 = [(TPSCloudDeviceValidation *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceInfo, a3);
  }

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v5 = [(TPSCloudDeviceValidation *)self dataSource];
  unint64_t v6 = [v5 registeredDevices];

  id v7 = [(TPSCloudDeviceValidation *)self deviceInfo];
  id v8 = [v7 model];

  objc_super v9 = [(TPSCloudDeviceValidation *)self deviceInfo];
  v10 = [v9 minOSVersion];

  id v11 = [(TPSCloudDeviceValidation *)self deviceInfo];
  uint64_t v12 = [v11 maxOSVersion];

  if ([v8 length])
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __51__TPSCloudDeviceValidation_validateWithCompletion___block_invoke;
    v21 = &unk_1E6E6BDB8;
    id v22 = v8;
    v25 = &v26;
    id v23 = v10;
    id v24 = v12;
    [v6 enumerateObjectsUsingBlock:&v18];
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4FAF480], "targeting", v18, v19, v20, v21);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(TPSTargetingValidation *)self name];
    uint64_t v15 = [(TPSCloudDeviceValidation *)self deviceInfo];
    v16 = [v15 debugDescription];
    int v17 = *((unsigned __int8 *)v27 + 24);
    *(_DWORD *)buf = 138412802;
    v31 = v14;
    __int16 v32 = 2112;
    v33 = v16;
    __int16 v34 = 1024;
    int v35 = v17;
    _os_log_debug_impl(&dword_1E4492000, v13, OS_LOG_TYPE_DEBUG, "%@ - device info: %@. Valid: %d", buf, 0x1Cu);
  }
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v27 + 24), 0);

  _Block_object_dispose(&v26, 8);
}

void __51__TPSCloudDeviceValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  unint64_t v6 = [v10 modelIdentifier];
  id v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:*(void *)(a1 + 32) options:1 error:0];
  if (objc_msgSend(v7, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if ([*(id *)(a1 + 40) length])
    {
      id v8 = [v10 productVersion];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 compare:*(void *)(a1 + 40) options:64] != -1;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && [*(id *)(a1 + 48) length])
    {
      objc_super v9 = [v10 productVersion];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v9 compare:*(void *)(a1 + 48) options:64] != 1;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(TPSCloudDeviceValidation *)self deviceInfo];
  id v7 = [v6 debugDescription];
  id v8 = [v3 stringWithFormat:@"<%@: %p deviceInfo = %@>", v5, self, v7];;

  return v8;
}

- (TPSCloudDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (TPSCloudDeviceDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (TPSCloudDeviceDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end