@interface SESConfig
- (NSString)cachedFileName;
- (SESConfig)initWithDeviceClass:(id)a3 productVersion:(float)a4;
- (SESConfig)initWithDeviceClass:(id)a3 productVersion:(float)a4 path:(id)a5;
- (id)getConfigForManufacturer:(id)a3 component:(unint64_t)a4 error:(id *)a5;
- (id)getContentsOfAssetFile:(id)a3 component:(unint64_t)a4 error:(id *)a5;
- (id)readContentsOfPlist:(id)a3 component:(id)a4 isProfile:(BOOL)a5 error:(id *)a6;
@end

@implementation SESConfig

- (SESConfig)initWithDeviceClass:(id)a3 productVersion:(float)a4
{
  v6 = NSURL;
  id v7 = a3;
  v8 = [v6 fileURLWithPath:@"/private/var/mobile/Library/SecureElementService/Asset/"];
  *(float *)&double v9 = a4;
  v10 = [(SESConfig *)self initWithDeviceClass:v7 productVersion:v8 path:v9];

  return v10;
}

- (SESConfig)initWithDeviceClass:(id)a3 productVersion:(float)a4 path:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SESConfig;
  v10 = [(SESConfig *)&v19 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v10->_path, a5);
  if ([@"iPhone" isEqualToString:v8])
  {
    minOSKey = v11->_minOSKey;
    v13 = @"MinOSPhone";
LABEL_6:
    v11->_minOSKey = &v13->isa;

    v11->_productVersion = a4;
    v11->_cachedComponent = 0;
    cachedFileName = v11->_cachedFileName;
    v11->_cachedFileName = 0;

    cache = v11->_cache;
    v11->_cache = 0;

LABEL_7:
    v16 = v11;
    goto LABEL_8;
  }
  if ([@"Watch" isEqualToString:v8])
  {
    minOSKey = v11->_minOSKey;
    v13 = @"MinOSWatch";
    goto LABEL_6;
  }
  v18 = SESDefaultLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl(&dword_263826000, v18, OS_LOG_TYPE_ERROR, "Unknown device class %@", buf, 0xCu);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

- (id)getConfigForManufacturer:(id)a3 component:(unint64_t)a4 error:(id *)a5
{
  id v25 = 0;
  id v7 = [(SESConfig *)self getContentsOfAssetFile:a3 component:a4 error:&v25];
  id v8 = v25;
  id v9 = v8;
  if (!v8)
  {
    v11 = [v7 objectForKeyedSubscript:self->_minOSKey];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        +[SESConfigUtilities getVersion:v11 error:0];
        float v13 = v12;
        if (v12 <= self->_productVersion)
        {
          id v10 = v7;
          goto LABEL_17;
        }
        if (a5)
        {
          v14 = SESDefaultLogObject();
          SESCreateAndLogError(0, v14, SESErrorDomain, 6, @"MinOS not satisfied config %f > %f current", v15, v16, v17, COERCE__INT64(v13));
LABEL_15:
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_16:
        id v10 = 0;
LABEL_17:

        goto LABEL_18;
      }
      if (!a5) {
        goto LABEL_16;
      }
      v14 = SESDefaultLogObject();
      id v21 = SESErrorDomain;
      minOSKey = self->_minOSKey;
      v23 = @"Wrong class for key %@";
    }
    else
    {
      if (!a5) {
        goto LABEL_16;
      }
      v14 = SESDefaultLogObject();
      id v21 = SESErrorDomain;
      minOSKey = self->_minOSKey;
      v23 = @"Missing key %@";
    }
    SESCreateAndLogError(0, v14, v21, 0, v23, v18, v19, v20, (uint64_t)minOSKey);
    goto LABEL_15;
  }
  id v10 = 0;
  if (a5) {
    *a5 = v8;
  }
LABEL_18:

  return v10;
}

- (id)getContentsOfAssetFile:(id)a3 component:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = v9;
  if (self->_cachedComponent == a4 && [v9 isEqualToString:self->_cachedFileName])
  {
    v11 = self->_cache;
    goto LABEL_21;
  }
  if (a4 == 1)
  {
    id v22 = 0;
    float v12 = [(SESConfig *)self readContentsOfPlist:v10 component:@"DCK" isProfile:1 error:&v22];
    id v13 = v22;
    if (v13)
    {
      id v14 = v13;
      if ([v13 code] != 4)
      {
        if (a5)
        {
          id v14 = v14;
          v11 = 0;
          *a5 = v14;
        }
        else
        {
          v11 = 0;
        }
        goto LABEL_20;
      }

      id v21 = 0;
      uint64_t v15 = [(SESConfig *)self readContentsOfPlist:v10 component:@"DCK" isProfile:0 error:&v21];
      id v14 = v21;

      float v12 = v15;
      if (v14)
      {
        if (!a5)
        {
LABEL_10:
          v11 = v15;
          float v12 = v11;
LABEL_20:

          goto LABEL_21;
        }
LABEL_9:
        *a5 = v14;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v15 = v12;
    }
    objc_storeStrong((id *)&self->_cachedFileName, a3);
    self->_cachedComponent = 1;
    objc_storeStrong((id *)&self->_cache, v12);
    id v14 = 0;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (a5)
  {
    uint64_t v16 = SESDefaultLogObject();
    SESCreateAndLogError(0, v16, SESErrorDomain, 1, @"Invalid component", v17, v18, v19, (uint64_t)v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (id)readContentsOfPlist:(id)a3 component:(id)a4 isProfile:(BOOL)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = &stru_270EB2CA0;
  if (a5) {
    id v8 = @"profile_";
  }
  id v9 = [NSString stringWithFormat:@"%@/%@%@.plist", a4, v8, a3];
  id v10 = [(NSURL *)self->_path URLByAppendingPathComponent:v9];
  v11 = [MEMORY[0x263F08850] defaultManager];
  float v12 = [v10 path];
  char v13 = [v11 isReadableFileAtPath:v12];

  if (v13)
  {
    id v31 = 0;
    id v14 = [NSDictionary dictionaryWithContentsOfURL:v10 error:&v31];
    id v15 = v31;
    if (v15)
    {
      if (a6)
      {
        uint64_t v16 = SESDefaultLogObject();
        uint64_t v17 = SESErrorDomain;
        uint64_t v18 = [v10 path];
        SESCreateAndLogError(v15, v16, v17, 0, @"Failed to load contents from %@", v19, v20, v21, (uint64_t)v18);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        a6 = 0;
      }
    }
    else
    {
      v28 = SESDefaultLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = [v10 path];
        *(_DWORD *)buf = 138412290;
        v33 = v29;
        _os_log_impl(&dword_263826000, v28, OS_LOG_TYPE_INFO, "Contents retrieved from %@", buf, 0xCu);
      }
      a6 = v14;
    }
  }
  else if (a6)
  {
    id v22 = SESDefaultLogObject();
    v23 = SESErrorDomain;
    v24 = [v10 path];
    SESCreateAndLogError(0, v22, v23, 4, @"File not found %@", v25, v26, v27, (uint64_t)v24);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

- (NSString)cachedFileName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFileName, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_minOSKey, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end