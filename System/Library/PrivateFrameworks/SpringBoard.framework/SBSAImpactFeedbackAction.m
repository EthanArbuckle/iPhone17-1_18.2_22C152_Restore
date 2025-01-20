@interface SBSAImpactFeedbackAction
- (BOOL)isEqual:(id)a3;
- (BOOL)prepareOnly;
- (NSArray)reasons;
- (NSString)description;
- (SBSAImpactFeedbackAction)initWithImpactFeedbackStyle:(int64_t)a3 prepareOnly:(BOOL)a4 reasons:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)impactFeedbackStyle;
- (unint64_t)hash;
@end

@implementation SBSAImpactFeedbackAction

- (SBSAImpactFeedbackAction)initWithImpactFeedbackStyle:(int64_t)a3 prepareOnly:(BOOL)a4 reasons:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSAImpactFeedbackAction;
  v9 = [(SBSAImpactFeedbackAction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_impactFeedbackStyle = a3;
    v9->_prepareOnly = a4;
    uint64_t v11 = [v8 copy];
    reasons = v10->_reasons;
    v10->_reasons = (NSArray *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t impactFeedbackStyle = self->_impactFeedbackStyle;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __36__SBSAImpactFeedbackAction_isEqual___block_invoke;
  v21[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v22 = v7;
  id v8 = [v5 appendInteger:impactFeedbackStyle counterpart:v21];
  BOOL prepareOnly = self->_prepareOnly;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__SBSAImpactFeedbackAction_isEqual___block_invoke_2;
  v19[3] = &unk_1E6AF99E8;
  id v10 = v7;
  id v20 = v10;
  uint64_t v11 = [v8 appendBool:prepareOnly counterpart:v19];
  reasons = self->_reasons;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __36__SBSAImpactFeedbackAction_isEqual___block_invoke_3;
  v17[3] = &unk_1E6AF9E90;
  id v18 = v10;
  id v13 = v10;
  objc_super v14 = [v11 appendObject:reasons counterpart:v17];
  char v15 = [v14 isEqual];

  return v15;
}

uint64_t __36__SBSAImpactFeedbackAction_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) impactFeedbackStyle];
}

uint64_t __36__SBSAImpactFeedbackAction_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareOnly];
}

uint64_t __36__SBSAImpactFeedbackAction_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reasons];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendInteger:self->_impactFeedbackStyle];
  v5 = [v4 appendBool:self->_prepareOnly];
  v6 = [v5 appendObject:self->_reasons];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t impactFeedbackStyle = self->_impactFeedbackStyle;
  v6 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; impactFeedbackStyle: %ld; prepareOnly: %@; reasons: %@>",
    v4,
    self,
    impactFeedbackStyle,
    v6,
  unint64_t v7 = self->_reasons);

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL prepareOnly = self->_prepareOnly;
  reasons = self->_reasons;
  int64_t impactFeedbackStyle = self->_impactFeedbackStyle;
  return (id)[v4 initWithImpactFeedbackStyle:impactFeedbackStyle prepareOnly:prepareOnly reasons:reasons];
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (int64_t)impactFeedbackStyle
{
  return self->_impactFeedbackStyle;
}

- (BOOL)prepareOnly
{
  return self->_prepareOnly;
}

- (void).cxx_destruct
{
}

@end