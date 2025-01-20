@interface SBSHomeScreenConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (SBSHomeScreenConfiguration)initWithBSXPCCoder:(id)a3;
- (SBSHomeScreenConfigurationLayout)layout;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setLayout:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SBSHomeScreenConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_layout forKey:@"layout"];
}

- (SBSHomeScreenConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenConfiguration;
  id v5 = [(SBSHomeScreenConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layout"];
    layout = v5->_layout;
    v5->_layout = (SBSHomeScreenConfigurationLayout *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[[objc_opt_class() allocWithZone:a3] init] autorelease];
  uint64_t v5 = [(NSString *)self->_name copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(SBSHomeScreenConfigurationLayout *)self->_layout copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_name];
  id v5 = (id)[v3 appendObject:self->_layout];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  name = self->_name;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__SBSHomeScreenConfiguration_isEqual___block_invoke;
  v18[3] = &unk_1E566CB30;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendString:name counterpart:v18];
  layout = self->_layout;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __38__SBSHomeScreenConfiguration_isEqual___block_invoke_2;
  v16 = &unk_1E566B958;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:layout counterpart:&v13];
  LOBYTE(layout) = [v5 isEqual:v13 v14 v15 v16];

  return (char)layout;
}

id __38__SBSHomeScreenConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __38__SBSHomeScreenConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_name withName:@"name"];
  id v4 = (id)[v3 appendObject:self->_layout withName:@"layout"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (SBSHomeScreenConfigurationLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end