@interface _NTKComplicationCacheKey
+ (id)keyWithVariant:(id)a3 complication:(id)a4 forDevice:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSUUID)deviceUUID;
- (NTKComplication)complication;
- (NTKComplicationVariant)variant;
- (unint64_t)hash;
@end

@implementation _NTKComplicationCacheKey

+ (id)keyWithVariant:(id)a3 complication:(id)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  v12 = (void *)v11[1];
  v11[1] = v8;
  id v13 = v8;

  v14 = (void *)v11[2];
  v11[2] = v9;
  id v15 = v9;

  uint64_t v16 = [v10 nrDeviceUUID];

  v17 = (void *)v11[3];
  v11[3] = v16;

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_variant];
  id v5 = (id)[v3 appendObject:self->_complication];
  id v6 = (id)[v3 appendObject:self->_deviceUUID];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  variant = self->_variant;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36___NTKComplicationCacheKey_isEqual___block_invoke;
  v20[3] = &unk_1E62C2690;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:variant counterpart:v20];
  complication = self->_complication;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36___NTKComplicationCacheKey_isEqual___block_invoke_2;
  v18[3] = &unk_1E62C2690;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:complication counterpart:v18];
  deviceUUID = self->_deviceUUID;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36___NTKComplicationCacheKey_isEqual___block_invoke_3;
  v16[3] = &unk_1E62C2690;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendObject:deviceUUID counterpart:v16];
  LOBYTE(deviceUUID) = [v5 isEqual];

  return (char)deviceUUID;
}

- (NTKComplication)complication
{
  return (NTKComplication *)objc_getProperty(self, a2, 16, 1);
}

- (NTKComplicationVariant)variant
{
  return (NTKComplicationVariant *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)deviceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_variant, 0);
}

@end