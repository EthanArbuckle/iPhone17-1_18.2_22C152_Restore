@interface MSDKManifestComponent
- (BOOL)isOfType:(int64_t)a3;
- (MSDKManifestComponent)initWithIdentifier:(id)a3 componentType:(int64_t)a4 andDictionary:(id)a5;
- (NSArray)data;
- (NSData)signature;
- (NSDictionary)rawDependencyDict;
- (NSMutableArray)mutableDependencies;
- (NSString)certificate;
- (NSString)identifier;
- (NSString)osVersion;
- (NSString)platformType;
- (id)_parseDataItem:(id)a3;
- (id)_parseDataItemsForAppComponent:(id)a3;
- (id)_parseFileItems:(id)a3;
- (int64_t)type;
- (void)addDependency:(id)a3;
- (void)setMutableDependencies:(id)a3;
- (void)setRawDependencyDict:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MSDKManifestComponent

- (MSDKManifestComponent)initWithIdentifier:(id)a3 componentType:(int64_t)a4 andDictionary:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)MSDKManifestComponent;
  v11 = [(MSDKManifestComponent *)&v37 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_19;
  }
  [(MSDKManifestComponent *)v11 setType:a4];
  objc_storeStrong((id *)&v12->_identifier, a3);
  v13 = objc_opt_new();
  [(MSDKManifestComponent *)v12 setMutableDependencies:v13];

  uint64_t v14 = [v10 objectForKey:@"Manifest" ofType:objc_opt_class()];
  v15 = (void *)v14;
  if (!v14)
  {
    v15 = [v10 objectForKey:@"Settings" ofType:objc_opt_class()];
    if (!v15)
    {
      v36 = defaultLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.6();
      }
      v17 = 0;
      v15 = 0;
      goto LABEL_35;
    }
  }
  uint64_t v16 = [v15 objectForKey:@"Info" ofType:objc_opt_class()];
  if (!v16)
  {
    v36 = defaultLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:]();
    }
    v17 = 0;
    goto LABEL_35;
  }
  v17 = (void *)v16;
  if (![(MSDKManifestComponent *)v12 isOfType:0]
    && ![(MSDKManifestComponent *)v12 isOfType:1])
  {
    BOOL v22 = [(MSDKManifestComponent *)v12 isOfType:4];
    if (!v14 && !v22)
    {
      v36 = defaultLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.5();
      }
      goto LABEL_35;
    }
    [(MSDKManifestComponent *)v12 setRawDependencyDict:0];
    uint64_t v23 = [v15 objectForKey:@"Data" ofType:objc_opt_class()];
    if (!v23)
    {
      v36 = defaultLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.4();
      }
      goto LABEL_35;
    }
    v18 = (NSArray *)v23;
    if (v14) {
      [(MSDKManifestComponent *)v12 _parseFileItems:v23];
    }
    else {
    uint64_t v24 = [(MSDKManifestComponent *)v12 _parseDataItem:v23];
    }
    data = v12->_data;
    v12->_data = (NSArray *)v24;

    if (v24) {
      goto LABEL_18;
    }
    goto LABEL_36;
  }
  if (!v14)
  {
    v36 = defaultLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:]();
    }
    goto LABEL_35;
  }
  v18 = [(MSDKManifestComponent *)v12 _parseDataItemsForAppComponent:v17];
  v19 = v12->_data;
  v12->_data = v18;

  if (!v18)
  {
LABEL_36:

    v34 = 0;
    goto LABEL_20;
  }
  v20 = [v15 objectForKey:@"Dependencies" ofType:objc_opt_class()];
  [(MSDKManifestComponent *)v12 setRawDependencyDict:v20];

  v21 = [(MSDKManifestComponent *)v12 rawDependencyDict];

  if (!v21)
  {
    v36 = defaultLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:]();
    }
LABEL_35:

    v18 = 0;
    goto LABEL_36;
  }
  v18 = 0;
LABEL_18:
  uint64_t v26 = [v17 objectForKey:@"OSVersion" ofType:objc_opt_class()];
  osVersion = v12->_osVersion;
  v12->_osVersion = (NSString *)v26;

  uint64_t v28 = [v17 objectForKey:@"PlatformType" ofType:objc_opt_class()];
  platformType = v12->_platformType;
  v12->_platformType = (NSString *)v28;

  uint64_t v30 = [v10 objectForKey:@"Certificate" ofType:objc_opt_class()];
  certificate = v12->_certificate;
  v12->_certificate = (NSString *)v30;

  uint64_t v32 = [v10 objectForKey:@"Signature" ofType:objc_opt_class()];
  signature = v12->_signature;
  v12->_signature = (NSData *)v32;

LABEL_19:
  v34 = v12;
LABEL_20:

  return v34;
}

- (BOOL)isOfType:(int64_t)a3
{
  return a3 == 3
      && ([(MSDKManifestComponent *)self type] == 4 || [(MSDKManifestComponent *)self type] == 5)
      || [(MSDKManifestComponent *)self type] == a3;
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDKManifestComponent *)self mutableDependencies];
  [v5 addObject:v4];
}

- (id)_parseDataItemsForAppComponent:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [MSDKManifestInstallableItem alloc];
  v7 = [(MSDKManifestComponent *)self identifier];
  v8 = [(MSDKManifestInstallableItem *)v6 initWithIdentifier:v7 andDictionary:v4 forComponent:self];

  if (v8)
  {
    [v5 addObject:v8];
    id v9 = v5;
  }
  else
  {
    v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestComponent _parseDataItemsForAppComponent:](self);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)_parseDataItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [MSDKManifestDataItem alloc];
  v7 = [(MSDKManifestComponent *)self identifier];
  v8 = [(MSDKManifestDataItem *)v6 initWithIdentifier:v7 andDictionary:v4 forComponent:self];

  if (v8)
  {
    [v5 addObject:v8];
    id v9 = v5;
  }
  else
  {
    v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestComponent _parseDataItemsForAppComponent:](self);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)_parseFileItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
      v12 = objc_msgSend(v6, "objectForKey:ofType:", v11, objc_opt_class(), (void)v18);
      if (!v12) {
        break;
      }
      v13 = [[MSDKManifestFileItem alloc] initWithIdentifier:v11 andDictionary:v12 forComponent:self];
      if (!v13)
      {
        uint64_t v16 = defaultLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[MSDKManifestComponent _parseFileItems:](v11, self);
        }
LABEL_15:

        id v15 = 0;
        goto LABEL_16;
      }
      uint64_t v14 = v13;
      [v5 addObject:v13];

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestComponent _parseFileItems:](self);
    }
    goto LABEL_15;
  }
LABEL_10:

  id v15 = v5;
LABEL_16:

  return v15;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)certificate
{
  return self->_certificate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (NSArray)data
{
  return self->_data;
}

- (NSDictionary)rawDependencyDict
{
  return self->_rawDependencyDict;
}

- (void)setRawDependencyDict:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSMutableArray)mutableDependencies
{
  return self->_mutableDependencies;
}

- (void)setMutableDependencies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDependencies, 0);
  objc_storeStrong((id *)&self->_rawDependencyDict, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_platformType, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ dict for component: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ dict for component: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Cannot parse %{public}@ dictionary for component %{public}@ of Apps/SystemApps section", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ dict for component: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Cannot parse %{public}@ dictionary for component %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.6()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3[0] = 136315906;
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v0;
  __int16 v5 = v1;
  id v6 = @"Manifest";
  __int16 v7 = v1;
  uint64_t v8 = @"Settings";
  _os_log_error_impl(&dword_21EF08000, v2, OS_LOG_TYPE_ERROR, "%s: Component %{public}@ does not have %{public}@ or %{public}@ key", (uint8_t *)v3, 0x2Au);
}

- (void)_parseDataItemsForAppComponent:(void *)a1 .cold.1(void *a1)
{
  __int16 v1 = [a1 identifier];
  OUTLINED_FUNCTION_3_2(&dword_21EF08000, v2, v3, "Failed to parse data items for component %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_parseFileItems:(void *)a1 .cold.1(void *a1)
{
  __int16 v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_0(&dword_21EF08000, v2, v3, "Failed to parse data items for component %{public}@ because item dictionary for %{public}@ is in wrong format", v4, v5, v6, v7, 2u);
}

- (void)_parseFileItems:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 identifier];
  OUTLINED_FUNCTION_2_0(&dword_21EF08000, v2, v3, "Failed to parse item %{public}@ for component %{public}@", v4, v5, v6, v7, 2u);
}

@end