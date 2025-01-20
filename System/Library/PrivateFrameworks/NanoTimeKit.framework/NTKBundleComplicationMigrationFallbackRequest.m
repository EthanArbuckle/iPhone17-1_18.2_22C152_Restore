@interface NTKBundleComplicationMigrationFallbackRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithComplication:(id)a3 families:(id)a4 device:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLKDevice)device;
- (NSArray)families;
- (NTKBundleComplicationMigrationFallbackRequest)initWithCoder:(id)a3;
- (NTKComplication)complication;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKBundleComplicationMigrationFallbackRequest

+ (id)requestWithComplication:(id)a3 families:(id)a4 device:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = (void *)v10[1];
  v10[1] = v7;
  id v12 = v7;

  uint64_t v13 = [v9 copy];
  v14 = (void *)v10[2];
  v10[2] = v13;

  v15 = (void *)v10[3];
  v10[3] = v8;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  complication = self->_complication;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke;
  v20[3] = &unk_1E62C2690;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:complication counterpart:v20];
  families = self->_families;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_2;
  v18[3] = &unk_1E62C2690;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:families counterpart:v18];
  device = self->_device;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_3;
  v16[3] = &unk_1E62C2690;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendObject:device counterpart:v16];
  LOBYTE(device) = [v5 isEqual];

  return (char)device;
}

id __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __57__NTKBundleComplicationMigrationFallbackRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_complication];
  id v5 = (id)[v3 appendObject:self->_families];
  id v6 = (id)[v3 appendObject:self->_device];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_complication withName:@"complication"];
  id v5 = (id)[v3 appendObject:self->_families withName:@"families"];
  id v6 = [(CLKDevice *)self->_device nrDeviceUUID];
  unint64_t v7 = [v6 UUIDString];
  [v3 appendString:v7 withName:@"deviceUUID" skipIfEmpty:1];

  id v8 = [v3 build];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKBundleComplicationMigrationFallbackRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKBundleComplicationMigrationFallbackRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NTKBundleComplicationMigrationFallbackRequestComplicationKey"];
    complication = v5->_complication;
    v5->_complication = (NTKComplication *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NTKBundleComplicationMigrationFallbackRequestFamiliesKey"];
    families = v5->_families;
    v5->_families = (NSArray *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NTKBundleComplicationMigrationFallbackRequestDeviceDescriptorKey"];
    uint64_t v11 = [MEMORY[0x1E4F19A30] deviceForDescriptor:v10];
    device = v5->_device;
    v5->_device = (CLKDevice *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  complication = self->_complication;
  id v5 = a3;
  [v5 encodeObject:complication forKey:@"NTKBundleComplicationMigrationFallbackRequestComplicationKey"];
  [v5 encodeObject:self->_families forKey:@"NTKBundleComplicationMigrationFallbackRequestFamiliesKey"];
  id v6 = [(CLKDevice *)self->_device descriptor];
  [v5 encodeObject:v6 forKey:@"NTKBundleComplicationMigrationFallbackRequestDeviceDescriptorKey"];
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (NSArray)families
{
  return self->_families;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_families, 0);
  objc_storeStrong((id *)&self->_complication, 0);
}

@end