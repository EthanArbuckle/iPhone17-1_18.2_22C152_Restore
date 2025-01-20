@interface PRUISModalEntryPointPosterSelection
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)allowedConfigurationUUIDs;
- (NSUUID)selectedConfigurationUUID;
- (PRUISModalEntryPointPosterSelection)initWithAllowedConfigurationUUIDs:(id)a3;
- (PRUISModalEntryPointPosterSelection)initWithAllowedConfigurationUUIDs:(id)a3 selectedConfigurationUUID:(id)a4;
- (PRUISModalEntryPointPosterSelection)initWithBSXPCCoder:(id)a3;
- (id)_BSXPCSecureCodingEntryPointTypeString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRUISModalEntryPointPosterSelection

- (PRUISModalEntryPointPosterSelection)initWithAllowedConfigurationUUIDs:(id)a3
{
  return [(PRUISModalEntryPointPosterSelection *)self initWithAllowedConfigurationUUIDs:self->_allowedConfigurationUUIDs selectedConfigurationUUID:0];
}

- (PRUISModalEntryPointPosterSelection)initWithAllowedConfigurationUUIDs:(id)a3 selectedConfigurationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRUISModalEntryPointPosterSelection;
  v8 = [(PRUISModalEntryPointPosterSelection *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    allowedConfigurationUUIDs = v8->_allowedConfigurationUUIDs;
    v8->_allowedConfigurationUUIDs = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_selectedConfigurationUUID, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke;
  v19[3] = &unk_26546BEA0;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:allowedConfigurationUUIDs counterpart:v19];
  selectedConfigurationUUID = self->_selectedConfigurationUUID;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke_2;
  v17 = &unk_26546B108;
  id v18 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendObject:selectedConfigurationUUID counterpart:&v14];
  LOBYTE(selectedConfigurationUUID) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)selectedConfigurationUUID;
}

uint64_t __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowedConfigurationUUIDs];
}

uint64_t __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectedConfigurationUUID];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_allowedConfigurationUUIDs];
  id v5 = (id)[v3 appendObject:self->_selectedConfigurationUUID];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  selectedConfigurationUUID = self->_selectedConfigurationUUID;

  return (id)[v4 initWithAllowedConfigurationUUIDs:allowedConfigurationUUIDs selectedConfigurationUUID:selectedConfigurationUUID];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointPosterSelection)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = [v4 decodeCollectionOfClass:v5 containingClass:objc_opt_class() forKey:@"allowedConfigurationUUIDs"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedConfigurationUUID"];

  id v8 = [(PRUISModalEntryPointPosterSelection *)self initWithAllowedConfigurationUUIDs:v6 selectedConfigurationUUID:v7];
  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  id v5 = a3;
  [v5 encodeObject:allowedConfigurationUUIDs forKey:@"allowedConfigurationUUIDs"];
  [v5 encodeObject:self->_selectedConfigurationUUID forKey:@"selectedConfigurationUUID"];
}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return @"PosterSelection";
}

- (NSSet)allowedConfigurationUUIDs
{
  return self->_allowedConfigurationUUIDs;
}

- (NSUUID)selectedConfigurationUUID
{
  return self->_selectedConfigurationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedConfigurationUUID, 0);

  objc_storeStrong((id *)&self->_allowedConfigurationUUIDs, 0);
}

@end