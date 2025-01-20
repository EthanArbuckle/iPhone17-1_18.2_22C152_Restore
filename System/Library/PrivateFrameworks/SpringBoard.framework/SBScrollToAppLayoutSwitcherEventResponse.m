@interface SBScrollToAppLayoutSwitcherEventResponse
- (BOOL)animated;
- (SBAppLayout)appLayout;
- (SBScrollToAppLayoutSwitcherEventResponse)initWithAppLayout:(id)a3 alignment:(int64_t)a4 animated:(BOOL)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)alignment;
- (int64_t)type;
@end

@implementation SBScrollToAppLayoutSwitcherEventResponse

- (int64_t)type
{
  return 11;
}

- (SBScrollToAppLayoutSwitcherEventResponse)initWithAppLayout:(id)a3 alignment:(int64_t)a4 animated:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBScrollToAppLayoutSwitcherEventResponse;
  v10 = [(SBChainableModifierEventResponse *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a3);
    v11->_alignment = a4;
    v11->_animated = a5;
  }

  return v11;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBScrollToAppLayoutSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  v5 = [(SBAppLayout *)self->_appLayout succinctDescription];
  [v4 appendString:v5 withName:@"appLayout"];

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void).cxx_destruct
{
}

@end