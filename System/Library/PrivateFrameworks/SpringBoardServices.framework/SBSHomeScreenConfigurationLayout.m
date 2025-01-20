@interface SBSHomeScreenConfigurationLayout
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)dockItems;
- (NSArray)items;
- (NSString)description;
- (SBSHomeScreenConfigurationLayout)initWithBSXPCCoder:(id)a3;
- (SBSHomeScreenConfigurationLayout)initWithItems:(id)a3 dockItems:(id)a4;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation SBSHomeScreenConfigurationLayout

- (SBSHomeScreenConfigurationLayout)initWithItems:(id)a3 dockItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSHomeScreenConfigurationLayout;
  v8 = [(SBSHomeScreenConfigurationLayout *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    items = v8->_items;
    v8->_items = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    dockItems = v8->_dockItems;
    v8->_dockItems = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  items = self->_items;
  id v5 = a3;
  [v5 encodeCollection:items forKey:@"items"];
  [v5 encodeCollection:self->_dockItems forKey:@"dockItems"];
}

- (SBSHomeScreenConfigurationLayout)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSHomeScreenConfigurationLayout;
  id v5 = [(SBSHomeScreenConfigurationLayout *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"dockItems"];
    dockItems = v5->_dockItems;
    v5->_dockItems = (NSArray *)v10;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = (id)[v3 appendObject:self->_items];
  id v5 = (id)[v3 appendObject:self->_dockItems];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  items = self->_items;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke;
  v18[3] = &unk_1E566B958;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:items counterpart:v18];
  dockItems = self->_dockItems;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke_2;
  v16 = &unk_1E566B958;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:dockItems counterpart:&v13];
  LOBYTE(dockItems) = [v5 isEqual:v13 v14 v15 v16];

  return (char)dockItems;
}

id __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_items withName:@"items"];
  id v5 = (id)[v3 appendObject:self->_dockItems withName:@"dockItems"];
  unint64_t v6 = [v3 build];

  return (NSString *)v6;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)dockItems
{
  return self->_dockItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end