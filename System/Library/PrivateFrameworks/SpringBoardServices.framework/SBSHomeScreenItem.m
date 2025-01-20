@interface SBSHomeScreenItem
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBSHomeScreenItem)initWithBSXPCCoder:(id)a3;
- (int64_t)kind;
- (unint64_t)hash;
@end

@implementation SBSHomeScreenItem

- (int64_t)kind
{
  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SBSHomeScreenItem)initWithBSXPCCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSHomeScreenItem;
  return [(SBSHomeScreenItem *)&v4 init];
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = (id)[v3 appendUnsignedInteger:-[SBSHomeScreenItem kind](self, "kind")];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  int64_t v6 = [(SBSHomeScreenItem *)self kind];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__SBSHomeScreenItem_isEqual___block_invoke;
  v10[3] = &unk_1E566CB08;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v10];
  LOBYTE(v6) = [v5 isEqual];

  return v6;
}

uint64_t __29__SBSHomeScreenItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) kind];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendUnsignedInteger:-[SBSHomeScreenItem kind](self, "kind") withName:@"kind"];
  unint64_t v5 = [v3 build];

  return (NSString *)v5;
}

@end