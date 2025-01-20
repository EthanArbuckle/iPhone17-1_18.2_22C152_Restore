@interface AXPhoenixConfiguration
- (AXPhoenixClassifierConfiguration)classifierConfiguration;
- (AXPhoenixConfiguration)init;
- (AXPhoenixConfiguration)initWithContentsOfFileAtPath:(id)a3;
- (AXPhoenixMitigatorConfiguration)mitigatorConfiguration;
- (NSString)classifierConfigurationKey;
- (NSString)majorVersion;
- (NSString)majorVersionKey;
- (NSString)minorVersion;
- (NSString)minorVersionKey;
- (NSString)mitigatorConfigurationKey;
- (id)_updateConfigWithContentsOfDictionary:(id)a3;
- (id)toStringifiedJSON;
- (unint64_t)assetVersion;
- (void)_initializeKeys;
- (void)_setDefaultConfiguration;
- (void)setAssetVersion:(unint64_t)a3;
- (void)setClassifierConfiguration:(id)a3;
- (void)setClassifierConfigurationKey:(id)a3;
- (void)setConfigurationAssetVersion:(unint64_t)a3;
- (void)setMajorVersion:(id)a3;
- (void)setMajorVersionKey:(id)a3;
- (void)setMinorVersion:(id)a3;
- (void)setMinorVersionKey:(id)a3;
- (void)setMitigatorConfiguration:(id)a3;
- (void)setMitigatorConfigurationKey:(id)a3;
@end

@implementation AXPhoenixConfiguration

- (AXPhoenixConfiguration)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixConfiguration;
  v6 = [(AXPhoenixConfiguration *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    [(AXPhoenixConfiguration *)v6 _initializeKeys];
    [(AXPhoenixConfiguration *)v6 _setDefaultConfiguration];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (AXPhoenixConfiguration)initWithContentsOfFileAtPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v21;
  id v21 = 0;
  v19.receiver = v3;
  v19.super_class = (Class)AXPhoenixConfiguration;
  id v21 = [(AXPhoenixConfiguration *)&v19 init];
  objc_storeStrong(&v21, v21);
  if (!v21) {
    goto LABEL_18;
  }
  [v21 _initializeKeys];
  id v18 = 0;
  id v16 = 0;
  id v6 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:location[0] options:0 error:&v16];
  objc_storeStrong(&v18, v16);
  id v17 = v6;
  if (v6)
  {
    id obj = v18;
    id v5 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v17 options:1 error:&obj];
    objc_storeStrong(&v18, obj);
    id v12 = v5;
    if (v18)
    {
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v24, (uint64_t)"-[AXPhoenixConfiguration initWithContentsOfFileAtPath:]", (uint64_t)location[0], (uint64_t)v18);
        _os_log_error_impl(&dword_2372C8000, oslog, v9, "[PHOENIX] %s Could not create dictionary from %@. Error:%@", v24, 0x20u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v22 = 0;
      int v13 = 1;
    }
    else
    {
      id v8 = (id)[v21 _updateConfigWithContentsOfDictionary:v12];
      if ([v8 count])
      {
        os_log_t v7 = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v23, (uint64_t)"-[AXPhoenixConfiguration initWithContentsOfFileAtPath:]", (uint64_t)v8);
          _os_log_error_impl(&dword_2372C8000, v7, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Missing keys detected in configuration file: %@", v23, 0x16u);
        }
        objc_storeStrong((id *)&v7, 0);
        v22 = 0;
        int v13 = 1;
      }
      else
      {
        int v13 = 0;
      }
      objc_storeStrong(&v8, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  else
  {
    id v15 = (id)AXLogBackTap();
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v25, (uint64_t)"-[AXPhoenixConfiguration initWithContentsOfFileAtPath:]", (uint64_t)location[0], (uint64_t)v18);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v15, v14, "[PHOENIX] %s Could not read configuration from %@. Error:%@", v25, 0x20u);
    }
    objc_storeStrong(&v15, 0);
    v22 = 0;
    int v13 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  if (!v13)
  {
LABEL_18:
    v22 = (AXPhoenixConfiguration *)v21;
    int v13 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v21, 0);
  return v22;
}

- (void)_initializeKeys
{
}

- (void)_setDefaultConfiguration
{
  [(AXPhoenixConfiguration *)self setConfigurationAssetVersion:0];
  -[AXPhoenixConfiguration setMajorVersion:](self, "setMajorVersion:");
  [(AXPhoenixConfiguration *)self setMinorVersion:@"0.0"];
  v2 = objc_alloc_init(AXPhoenixClassifierConfiguration);
  -[AXPhoenixConfiguration setClassifierConfiguration:](self, "setClassifierConfiguration:");

  id v3 = objc_alloc_init(AXPhoenixMitigatorConfiguration);
  -[AXPhoenixConfiguration setMitigatorConfiguration:](self, "setMitigatorConfiguration:");
}

- (void)setConfigurationAssetVersion:(unint64_t)a3
{
}

- (id)_updateConfigWithContentsOfDictionary:(id)a3
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = (id)[MEMORY[0x263EFF980] array];
  id v28 = location[0];
  v29 = [(AXPhoenixConfiguration *)v35 majorVersionKey];
  id v30 = (id)objc_msgSend(v28, "objectForKey:");

  if (v30)
  {
    v25 = v35;
    id v24 = location[0];
    v27 = [(AXPhoenixConfiguration *)v35 majorVersionKey];
    id v26 = (id)objc_msgSend(v24, "objectForKey:");
    -[AXPhoenixConfiguration setMajorVersion:](v25, "setMajorVersion:");
  }
  else
  {
    v23 = [(AXPhoenixConfiguration *)v35 majorVersionKey];
    objc_msgSend(v33, "addObject:");
  }
  id v20 = location[0];
  id v21 = [(AXPhoenixConfiguration *)v35 minorVersionKey];
  id v22 = (id)objc_msgSend(v20, "objectForKey:");

  if (v22)
  {
    id v17 = v35;
    id v16 = location[0];
    objc_super v19 = [(AXPhoenixConfiguration *)v35 minorVersionKey];
    id v18 = (id)objc_msgSend(v16, "objectForKey:");
    -[AXPhoenixConfiguration setMinorVersion:](v17, "setMinorVersion:");
  }
  else
  {
    id v15 = [(AXPhoenixConfiguration *)v35 minorVersionKey];
    objc_msgSend(v33, "addObject:");
  }
  id v13 = location[0];
  os_log_type_t v14 = [(AXPhoenixConfiguration *)v35 classifierConfigurationKey];
  id v32 = (id)objc_msgSend(v13, "objectForKey:");

  if (v32)
  {
    v11 = v35;
    id v12 = [[AXPhoenixClassifierConfiguration alloc] initWithDictionary:v32 missingKeys:v33];
    -[AXPhoenixConfiguration setClassifierConfiguration:](v11, "setClassifierConfiguration:");
  }
  else
  {
    v10 = [(AXPhoenixConfiguration *)v35 classifierConfigurationKey];
    objc_msgSend(v33, "addObject:");
  }
  id v8 = location[0];
  os_log_type_t v9 = [(AXPhoenixConfiguration *)v35 mitigatorConfigurationKey];
  id v31 = (id)objc_msgSend(v8, "objectForKey:");

  if (v31)
  {
    id v6 = v35;
    os_log_t v7 = [[AXPhoenixMitigatorConfiguration alloc] initWithDictionary:v31 missingKeys:v33];
    -[AXPhoenixConfiguration setMitigatorConfiguration:](v6, "setMitigatorConfiguration:");
  }
  else
  {
    id v5 = [(AXPhoenixConfiguration *)v35 mitigatorConfigurationKey];
    objc_msgSend(v33, "addObject:");
  }
  id v4 = v33;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)toStringifiedJSON
{
  v33[4] = *MEMORY[0x263EF8340];
  id v28 = self;
  v27[1] = (id)a2;
  id v17 = [(AXPhoenixConfiguration *)self majorVersionKey];
  v32[0] = v17;
  id v16 = [(AXPhoenixConfiguration *)v28 majorVersion];
  v33[0] = v16;
  id v15 = [(AXPhoenixConfiguration *)v28 minorVersionKey];
  v32[1] = v15;
  os_log_type_t v14 = [(AXPhoenixConfiguration *)v28 minorVersion];
  v33[1] = v14;
  id v13 = [(AXPhoenixConfiguration *)v28 classifierConfigurationKey];
  v32[2] = v13;
  id v12 = [(AXPhoenixConfiguration *)v28 classifierConfiguration];
  id v11 = [(AXPhoenixClassifierConfiguration *)v12 toDictionary];
  v33[2] = v11;
  v10 = [(AXPhoenixConfiguration *)v28 mitigatorConfigurationKey];
  v32[3] = v10;
  os_log_type_t v9 = [(AXPhoenixConfiguration *)v28 mitigatorConfiguration];
  id v8 = [(AXPhoenixMitigatorConfiguration *)v9 toDictionary];
  v33[3] = v8;
  v27[0] = (id)[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];

  if ([MEMORY[0x263F08900] isValidJSONObject:v27[0]])
  {
    id v23 = 0;
    id v21 = 0;
    id v7 = (id)[MEMORY[0x263F08900] dataWithJSONObject:v27[0] options:1 error:&v21];
    objc_storeStrong(&v23, v21);
    id v22 = v7;
    if (v7)
    {
      id v2 = [NSString alloc];
      uint64_t v29 = [v2 initWithData:v22 encoding:4];
      int v24 = 1;
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v5 = oslog;
        os_log_type_t v6 = v19;
        id v18 = (id)objc_opt_class();
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v30, (uint64_t)"-[AXPhoenixConfiguration toStringifiedJSON]", (uint64_t)v18, (uint64_t)v23);
        _os_log_error_impl(&dword_2372C8000, v5, v6, "[PHOENIX] %s Error serializing %@: Got error: %@", v30, 0x20u);
        objc_storeStrong(&v18, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      uint64_t v29 = 0;
      int v24 = 1;
    }
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    id location = (id)AXLogBackTap();
    os_log_type_t v25 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v31, (uint64_t)"-[AXPhoenixConfiguration toStringifiedJSON]");
      _os_log_error_impl(&dword_2372C8000, (os_log_t)location, v25, "[PHOENIX] %s Invalid JSON object!", v31, 0xCu);
    }
    objc_storeStrong(&location, 0);
    uint64_t v29 = 0;
    int v24 = 1;
  }
  objc_storeStrong(v27, 0);
  id v3 = (void *)v29;
  return v3;
}

- (unint64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(unint64_t)a3
{
  self->_assetVersion = a3;
}

- (NSString)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(id)a3
{
}

- (NSString)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(id)a3
{
}

- (AXPhoenixClassifierConfiguration)classifierConfiguration
{
  return self->_classifierConfiguration;
}

- (void)setClassifierConfiguration:(id)a3
{
}

- (AXPhoenixMitigatorConfiguration)mitigatorConfiguration
{
  return self->_mitigatorConfiguration;
}

- (void)setMitigatorConfiguration:(id)a3
{
}

- (NSString)majorVersionKey
{
  return self->_majorVersionKey;
}

- (void)setMajorVersionKey:(id)a3
{
}

- (NSString)minorVersionKey
{
  return self->_minorVersionKey;
}

- (void)setMinorVersionKey:(id)a3
{
}

- (NSString)classifierConfigurationKey
{
  return self->_classifierConfigurationKey;
}

- (void)setClassifierConfigurationKey:(id)a3
{
}

- (NSString)mitigatorConfigurationKey
{
  return self->_mitigatorConfigurationKey;
}

- (void)setMitigatorConfigurationKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end