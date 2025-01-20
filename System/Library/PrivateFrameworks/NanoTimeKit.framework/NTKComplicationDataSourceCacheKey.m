@interface NTKComplicationDataSourceCacheKey
- (BOOL)isEqual:(id)a3;
- (NSUUID)nrDeviceUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)complicationFamily;
- (unint64_t)complicationType;
- (unint64_t)hash;
- (void)setComplicationFamily:(int64_t)a3;
- (void)setComplicationType:(unint64_t)a3;
- (void)setNrDeviceUUID:(id)a3;
@end

@implementation NTKComplicationDataSourceCacheKey

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_nrDeviceUUID];
  id v5 = (id)[v3 appendUnsignedInteger:self->_complicationType];
  id v6 = (id)[v3 appendInteger:self->_complicationFamily];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  nrDeviceUUID = self->_nrDeviceUUID;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke;
  v20[3] = &unk_1E62C2690;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:nrDeviceUUID counterpart:v20];
  unint64_t complicationType = self->_complicationType;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_2;
  v18[3] = &unk_1E62C3A20;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendUnsignedInteger:complicationType counterpart:v18];
  int64_t complicationFamily = self->_complicationFamily;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_3;
  v16[3] = &unk_1E62C24A0;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendInteger:complicationFamily counterpart:v16];
  LOBYTE(complicationFamily) = [v5 isEqual];

  return complicationFamily;
}

id __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16);
}

uint64_t __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->_nrDeviceUUID);
  *(void *)(v4 + 16) = self->_complicationType;
  *(void *)(v4 + 24) = self->_complicationFamily;
  return (id)v4;
}

- (NSUUID)nrDeviceUUID
{
  return self->_nrDeviceUUID;
}

- (void)setNrDeviceUUID:(id)a3
{
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (void)setComplicationType:(unint64_t)a3
{
  self->_unint64_t complicationType = a3;
}

- (int64_t)complicationFamily
{
  return self->_complicationFamily;
}

- (void)setComplicationFamily:(int64_t)a3
{
  self->_int64_t complicationFamily = a3;
}

- (void).cxx_destruct
{
}

@end