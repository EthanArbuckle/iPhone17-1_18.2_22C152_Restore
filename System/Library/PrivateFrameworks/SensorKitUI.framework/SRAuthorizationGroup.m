@interface SRAuthorizationGroup
+ (id)authorizationGroupWithServiceName:(id)a3;
+ (void)initialize;
- (NSArray)localizedCollectedData;
- (NSArray)localizedNotCollectedData;
- (NSArray)localizedSampleData;
- (NSArray)localizedWhatIsShared;
- (NSArray)localizedWhenShared;
- (NSArray)platforms;
- (NSString)authorizationService;
- (NSString)localizedDescription;
- (NSString)localizedDisplayName;
- (NSString)localizedPlatforms;
- (NSString)localizedRequiredAuthAlertDetail;
- (NSString)localizedRevokeRequiredAuthAlertDetail;
- (NSString)writerAuthorizationService;
- (SRAuthorizationGroup)initWithBundle:(id)a3;
- (UIImage)illustration;
- (id)infoPlistAuthorizationCategory;
- (id)localizedExampleDataValue:(id)a3;
- (void)dealloc;
@end

@implementation SRAuthorizationGroup

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_6 = (uint64_t)os_log_create("com.apple.SensorKit", "SRAuthorizationGroup");
    qword_26870D048 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);
  }
}

+ (id)authorizationGroupWithServiceName:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend((id)qword_26870D048, "objectForKey:");
  if (v4)
  {
LABEL_4:
    v6 = [[SRAuthorizationGroup alloc] initWithBundle:v4];
    return v6;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x263F086E0], "skui_bundleForAuthorizationService:", a3);
  if (v5)
  {
    uint64_t v4 = v5;
    [(id)qword_26870D048 setObject:v5 forKey:a3];
    goto LABEL_4;
  }
  v8 = _MergedGlobals_6;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = a3;
    _os_log_error_impl(&dword_230B11000, v8, OS_LOG_TYPE_ERROR, "Unable to find a bundle for %{public}@", (uint8_t *)&v9, 0xCu);
  }
  return 0;
}

- (SRAuthorizationGroup)initWithBundle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRAuthorizationGroup;
  uint64_t v4 = [(SRAuthorizationGroup *)&v6 init];
  if (v4) {
    v4->_bundle = (NSBundle *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_bundle = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationGroup;
  [(SRAuthorizationGroup *)&v3 dealloc];
}

- (NSString)localizedDisplayName
{
  return (NSString *)[(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRDisplayName"];
}

- (NSString)localizedDescription
{
  return (NSString *)[(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRDescription"];
}

- (NSArray)localizedCollectedData
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRCollectedData"];
  uint64_t v4 = (NSArray *)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:v9];
        if (v10) {
          id v11 = v10;
        }
        else {
          id v11 = v9;
        }
        [(NSArray *)v4 addObject:v11];
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v4;
}

- (NSArray)localizedNotCollectedData
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRNotCollectedData"];
  uint64_t v4 = (NSArray *)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:v9];
        if (v10) {
          id v11 = v10;
        }
        else {
          id v11 = v9;
        }
        [(NSArray *)v4 addObject:v11];
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v4;
}

- (NSArray)localizedWhenShared
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRWhenShared"];
  uint64_t v4 = (NSArray *)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:v9];
        if (v10) {
          id v11 = v10;
        }
        else {
          id v11 = v9;
        }
        [(NSArray *)v4 addObject:v11];
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v4;
}

- (NSArray)localizedWhatIsShared
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRWhatIsShared"];
  uint64_t v4 = (NSArray *)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:v9];
        if (v10) {
          id v11 = v10;
        }
        else {
          id v11 = v9;
        }
        [(NSArray *)v4 addObject:v11];
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v4;
}

- (NSString)localizedRequiredAuthAlertDetail
{
  id v3 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRRequiredAuthAlertDetail"];
  result = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:v3];
  if (!result) {
    return v3;
  }
  return result;
}

- (NSString)localizedRevokeRequiredAuthAlertDetail
{
  id v3 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRRevokeRequiredAuthAlertDetail"];
  result = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:v3];
  if (!result) {
    return v3;
  }
  return result;
}

- (NSString)localizedPlatforms
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [(SRAuthorizationGroup *)self platforms];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v2, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v8 isEqualToString:@"Phone"])
        {
          uint64_t v9 = 42;
        }
        else if ([v8 isEqualToString:@"Watch"])
        {
          uint64_t v9 = 43;
        }
        else
        {
          uint64_t v9 = 0;
        }
        uint64_t v10 = objc_msgSend(NSString, "srui_localizedStringForCode:", v9);
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v5 = [(NSArray *)v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v11 = objc_msgSend(v3, "componentsJoinedByString:", objc_msgSend(NSString, "srui_localizedStringForCode:", 44));
    return (NSString *)[v11 localizedUppercaseString];
  }
  if ([v3 count] == 1)
  {
    uint64_t v16 = 0;
    uint64_t v12 = objc_msgSend(NSString, "srui_localizedStringForCode:", 45);
    uint64_t v13 = [NSString stringWithValidatedFormat:v12, @"%@", &v16, objc_msgSend(v3, "firstObject") validFormatSpecifiers error];
    if (!v13)
    {
      long long v14 = _MergedGlobals_6;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = v16;
        _os_log_fault_impl(&dword_230B11000, v14, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
      }
    }
    id v11 = (void *)v13;
    return (NSString *)[v11 localizedUppercaseString];
  }
  return 0;
}

- (NSArray)platforms
{
  result = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRPlatforms"];
  if (!result) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  return result;
}

- (UIImage)illustration
{
  return (UIImage *)[MEMORY[0x263F1C6B0] imageNamed:@"Illustration" inBundle:self->_bundle];
}

- (NSArray)localizedSampleData
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRSampleData"];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v4, "addObject:", -[SRAuthorizationGroup localizedExampleDataValue:](self, "localizedExampleDataValue:", *(void *)(*((void *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:v4];
}

- (id)localizedExampleDataValue:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 hasSuffix:@"<no loc>"])
    {
      return (id)[a3 stringByReplacingOccurrencesOfString:@"<no loc>" withString:&stru_26E558AB8];
    }
    else
    {
      bundle = self->_bundle;
      return [(NSBundle *)bundle objectForInfoDictionaryKey:a3];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (void *)MEMORY[0x263F08A30];
    return (id)[v6 localizedStringFromNumber:a3 numberStyle:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (void *)MEMORY[0x263F08790];
    return (id)[v8 localizedStringFromDate:a3 dateStyle:1 timeStyle:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (!v10) {
      return (id)[NSDictionary dictionaryWithDictionary:v9];
    }
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v44;
    *(void *)&long long v11 = 138543618;
    long long v37 = v11;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(a3);
        }
        uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
        if (objc_msgSend(v15, "hasSuffix:", @"<no loc>", v37)) {
          id v16 = (id)[v15 stringByReplacingOccurrencesOfString:@"<no loc>" withString:&stru_26E558AB8];
        }
        else {
          id v16 = [(NSBundle *)self->_bundle objectForInfoDictionaryKey:v15];
        }
        id v17 = v16;
        if (!v16)
        {
          uint64_t v19 = _MergedGlobals_6;
          if (!os_log_type_enabled((os_log_t)_MergedGlobals_6, OS_LOG_TYPE_FAULT)) {
            goto LABEL_32;
          }
          long long v20 = [(NSBundle *)self->_bundle bundlePath];
          *(_DWORD *)buf = v37;
          uint64_t v49 = (uint64_t)v15;
          __int16 v50 = 2114;
          v51 = v20;
          v21 = v19;
          uint64_t v22 = "Failed to find key: %{public}@ in %{public}@/Info.plist";
          goto LABEL_35;
        }
        id v18 = -[SRAuthorizationGroup localizedExampleDataValue:](self, "localizedExampleDataValue:", [a3 objectForKeyedSubscript:v15]);
        if (v18)
        {
          [v9 setObject:v18 forKeyedSubscript:v17];
          goto LABEL_32;
        }
        uint64_t v23 = _MergedGlobals_6;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_6, OS_LOG_TYPE_FAULT))
        {
          uint64_t v24 = [a3 objectForKeyedSubscript:v15];
          v25 = [(NSBundle *)self->_bundle bundlePath];
          *(_DWORD *)buf = v37;
          uint64_t v49 = v24;
          __int16 v50 = 2114;
          v51 = v25;
          v21 = v23;
          uint64_t v22 = "Failed to find value: %{public}@ in %{public}@/Info.plist";
LABEL_35:
          _os_log_fault_impl(&dword_230B11000, v21, OS_LOG_TYPE_FAULT, v22, buf, 0x16u);
        }
LABEL_32:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v26 = [a3 countByEnumeratingWithState:&v43 objects:v52 count:16];
      uint64_t v12 = v26;
      if (!v26) {
        return (id)[NSDictionary dictionaryWithDictionary:v9];
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v27 = (void *)[MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v28 = [a3 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v40;
    *(void *)&long long v29 = 138543618;
    long long v38 = v29;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(a3);
        }
        v33 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v34 = -[SRAuthorizationGroup localizedExampleDataValue:](self, "localizedExampleDataValue:", v33, v38);
        if (v34)
        {
          [v27 addObject:v34];
        }
        else
        {
          v35 = _MergedGlobals_6;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_6, OS_LOG_TYPE_FAULT))
          {
            v36 = [(NSBundle *)self->_bundle bundlePath];
            *(_DWORD *)buf = v38;
            uint64_t v49 = (uint64_t)v33;
            __int16 v50 = 2114;
            v51 = v36;
            _os_log_fault_impl(&dword_230B11000, v35, OS_LOG_TYPE_FAULT, "Failed to find value: %{public}@ in %{public}@/Info.plist", buf, 0x16u);
          }
        }
      }
      uint64_t v30 = [a3 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v30);
  }
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:v27];
}

- (NSString)authorizationService
{
  return (NSString *)[(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRAuthService"];
}

- (NSString)writerAuthorizationService
{
  return (NSString *)[(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRWriterAuthService"];
}

- (id)infoPlistAuthorizationCategory
{
  return [(NSBundle *)self->_bundle objectForInfoDictionaryKey:@"SRInfoPlistAuthCategory"];
}

@end