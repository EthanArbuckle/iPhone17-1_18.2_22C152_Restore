@interface SBActivityItem
- (ACActivityContentUpdate)contentUpdate;
- (ACActivityDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (SBActivityItem)initWithContentUpdate:(id)a3;
- (double)relevanceScore;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setContentUpdate:(id)a3;
@end

@implementation SBActivityItem

- (SBActivityItem)initWithContentUpdate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBActivityItem;
  v6 = [(SBActivityItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentUpdate, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  identifier = self->_identifier;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __26__SBActivityItem_isEqual___block_invoke;
  v18[3] = &unk_1E6AF5180;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:identifier counterpart:v18];
  double relevanceScore = self->_relevanceScore;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __26__SBActivityItem_isEqual___block_invoke_2;
  v16 = &unk_1E6AFD028;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendDouble:&v13 counterpart:relevanceScore];
  LOBYTE(v7) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)v7;
}

uint64_t __26__SBActivityItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

uint64_t __26__SBActivityItem_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) relevanceScore];
}

- (void)setContentUpdate:(id)a3
{
  id v5 = (ACActivityContentUpdate *)a3;
  contentUpdate = self->_contentUpdate;
  p_contentUpdate = &self->_contentUpdate;
  if (contentUpdate != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_contentUpdate, a3);
    id v5 = v8;
  }
}

- (ACActivityContentUpdate)contentUpdate
{
  return self->_contentUpdate;
}

- (NSString)identifier
{
  return (NSString *)[(ACActivityContentUpdate *)self->_contentUpdate identifier];
}

- (ACActivityDescriptor)descriptor
{
  return (ACActivityDescriptor *)[(ACActivityContentUpdate *)self->_contentUpdate descriptor];
}

- (double)relevanceScore
{
  v2 = [(ACActivityContentUpdate *)self->_contentUpdate content];
  [v2 relevanceScore];
  double v4 = v3;

  return v4;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)SBActivityItem;
  double v3 = [(SBActivityItem *)&v6 description];
  double v4 = [(SBActivityItem *)self descriptionWithMultilinePrefix:v3];

  return (NSString *)v4;
}

- (id)succinctDescription
{
  v2 = [(SBActivityItem *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBActivityItem *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [(SBActivityItem *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];
  id v6 = (id)[v4 appendObject:self->_descriptor withName:@"descriptor"];
  id v7 = (id)[v4 appendDouble:@"relevanceScore" withName:2 decimalPrecision:self->_relevanceScore];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentUpdate, 0);
}

@end