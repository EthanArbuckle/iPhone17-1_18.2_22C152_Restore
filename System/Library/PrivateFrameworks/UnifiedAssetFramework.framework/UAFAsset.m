@interface UAFAsset
- (BOOL)isEqual:(id)a3;
- (BOOL)isPresentOnDevice;
- (NSDictionary)metadata;
- (NSString)name;
- (NSURL)location;
- (UAFAsset)initWithName:(id)a3 location:(id)a4 metadata:(id)a5;
- (id)description;
- (id)propertiesAsDictionary:(BOOL)a3;
- (unint64_t)_generateHash;
- (unint64_t)hash;
@end

@implementation UAFAsset

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (UAFAsset)initWithName:(id)a3 location:(id)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UAFAsset;
  v12 = [(UAFAsset *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_location, a4);
    if (v11) {
      v14 = (NSDictionary *)v11;
    }
    else {
      v14 = (NSDictionary *)MEMORY[0x263EFFA78];
    }
    metadata = v13->_metadata;
    v13->_metadata = v14;

    v13->_hash = [(UAFAsset *)v13 _generateHash];
  }

  return v13;
}

- (unint64_t)_generateHash
{
  v3 = NSString;
  name = self->_name;
  v5 = [(NSURL *)self->_location path];
  v6 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"version"];
  v7 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"language"];
  v8 = [v3 stringWithFormat:@"%@%@%@%@", name, v5, v6, v7];

  unint64_t v9 = [v8 hash];
  return v9;
}

- (NSURL)location
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (id)propertiesAsDictionary:(BOOL)a3
{
  v17[4] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v16[0] = @"name";
    v5 = [(UAFAsset *)self name];
    if (v5)
    {
      v6 = [(UAFAsset *)self name];
    }
    else
    {
      v6 = &stru_26EA999B8;
    }
    v17[0] = v6;
    v16[1] = @"location";
    v7 = [(UAFAsset *)self location];
    if (v7)
    {
      v3 = [(UAFAsset *)self location];
      v8 = [v3 path];
    }
    else
    {
      v8 = &stru_26EA999B8;
    }
    v17[1] = v8;
    v16[2] = @"metadata";
    unint64_t v9 = [(UAFAsset *)self metadata];
    if (v9)
    {
      id v10 = [(UAFAsset *)self metadata];
    }
    else
    {
      id v10 = (void *)MEMORY[0x263EFFA78];
    }
    v17[2] = v10;
    v16[3] = @"isPresentOnDevice";
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[UAFAsset isPresentOnDevice](self, "isPresentOnDevice"));
    v17[3] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];

    if (!v9) {
      goto LABEL_24;
    }
LABEL_23:

    goto LABEL_24;
  }
  v14[0] = @"name";
  v5 = [(UAFAsset *)self name];
  if (v5)
  {
    v6 = [(UAFAsset *)self name];
  }
  else
  {
    v6 = &stru_26EA999B8;
  }
  v15[0] = v6;
  v14[1] = @"location";
  v7 = [(UAFAsset *)self location];
  if (v7)
  {
    v3 = [(UAFAsset *)self location];
    v8 = [v3 path];
  }
  else
  {
    v8 = &stru_26EA999B8;
  }
  v15[1] = v8;
  v14[2] = @"metadata";
  unint64_t v9 = [(UAFAsset *)self metadata];
  if (v9)
  {
    id v10 = [(UAFAsset *)self metadata];
  }
  else
  {
    id v10 = (void *)MEMORY[0x263EFFA78];
  }
  v15[2] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v9) {
    goto LABEL_23;
  }
LABEL_24:

  if (v7)
  {
  }
  if (v5) {

  }
  return v12;
}

- (BOOL)isPresentOnDevice
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(v23, 0, sizeof(v23));
  v4 = [(UAFAsset *)self location];
  v5 = [v4 path];
  id v22 = 0;
  int v6 = +[UAFCommonUtilities stat:v5 withBuf:v23 error:&v22];
  id v7 = v22;

  if (v6 || (int v15 = WORD2(v23[0]) & 0xF000, v16 = 1, v15 != 0x4000) && v15 != 0x8000)
  {
    uint64_t v8 = [(UAFAsset *)self name];
    unint64_t v9 = (void *)v8;
    id v10 = &stru_26EA999B8;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    id v11 = v10;

    v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(UAFAsset *)self location];
      if (v13)
      {
        v2 = [(UAFAsset *)self location];
        v14 = [v2 path];
      }
      else
      {
        v14 = &stru_26EA999B8;
      }
      *(_DWORD *)buf = 136316418;
      v25 = "-[UAFAsset isPresentOnDevice]";
      __int16 v26 = 2114;
      v27 = (UAFAsset *)v14;
      __int16 v28 = 1024;
      int v29 = v6;
      __int16 v30 = 1024;
      int v31 = WORD2(v23[0]);
      __int16 v32 = 1024;
      int v33 = WORD3(v23[0]);
      __int16 v34 = 2114;
      id v35 = v7;
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s stat(%{public}@) = %d, type: %x, link count: %d, error: %{public}@", buf, 0x32u);
      if (v13)
      {
      }
    }

    objc_super v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[UAFAsset isPresentOnDevice]";
      __int16 v26 = 2114;
      v27 = self;
      _os_log_fault_impl(&dword_23797A000, v17, OS_LOG_TYPE_FAULT, "%s Asset missing: %{public}@", buf, 0x16u);
    }

    v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v19 = kUAFABCMissingAssetFailure;
    v20 = [NSString stringWithString:v11];
    UAFFaultCapture((uint64_t)v18, (uint64_t)v19, (uint64_t)v20, 0);

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UAFAsset *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 != self)
    {
      v5 = v4;
      name = self->_name;
      id v7 = [(UAFAsset *)v5 name];
      LODWORD(name) = [(NSString *)name isEqualToString:v7];

      if (!name)
      {
        BOOL v13 = 0;
LABEL_34:

        goto LABEL_35;
      }
      location = self->_location;
      unint64_t v9 = [(UAFAsset *)v5 location];
      id v10 = location;
      id v11 = v9;
      v12 = v11;
      if (!v10 && v11)
      {
        id v10 = 0;
        goto LABEL_8;
      }
      if (v10 && !v11)
      {
        id v14 = 0;
        BOOL v13 = 0;
        goto LABEL_33;
      }
      if (v10 && ![(NSURL *)v10 isEqual:v11])
      {
LABEL_8:
        BOOL v13 = 0;
        id v14 = v12;
LABEL_33:

        goto LABEL_34;
      }

      int v15 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"version"];
      id v10 = [(UAFAsset *)v5 metadata];
      BOOL v16 = [(NSURL *)v10 objectForKeyedSubscript:@"version"];
      id v14 = v15;
      id v17 = v16;
      v12 = v17;
      if (!v14 && v17) {
        goto LABEL_19;
      }
      if (v14 && !v17 || v14 && ![v14 isEqual:v17]) {
        goto LABEL_31;
      }

      v18 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"language"];
      id v10 = [(UAFAsset *)v5 metadata];
      v19 = [(NSURL *)v10 objectForKeyedSubscript:@"language"];
      id v14 = v18;
      id v20 = v19;
      v12 = v20;
      if (v14) {
        goto LABEL_38;
      }
      if (v20)
      {
LABEL_19:
        id v14 = 0;
      }
      else
      {
LABEL_38:
        if ((!v14 || v20) && (!v14 || [v14 isEqual:v20]))
        {
          BOOL v13 = 1;
LABEL_32:

          goto LABEL_33;
        }
      }
LABEL_31:
      BOOL v13 = 0;
      goto LABEL_32;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_35:

  return v13;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (id)description
{
  v2 = [(UAFAsset *)self propertiesAsDictionary:0];
  v3 = +[UAFCommonUtilities serializeDictToJSONStr:v2 error:0];

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

@end