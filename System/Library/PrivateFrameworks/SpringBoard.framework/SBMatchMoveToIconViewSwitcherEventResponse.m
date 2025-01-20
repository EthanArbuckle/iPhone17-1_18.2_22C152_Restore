@interface SBMatchMoveToIconViewSwitcherEventResponse
- (BOOL)isActive;
- (CGRect)iconFrame;
- (SBAppLayout)appLayout;
- (SBMatchMoveToIconViewSwitcherEventResponse)initWithActivatingAppLayout:(id)a3 iconFrame:(CGRect)a4;
- (SBMatchMoveToIconViewSwitcherEventResponse)initWithDeactivatingAppLayout:(id)a3;
- (id)_initWithAppLayout:(id)a3 active:(BOOL)a4 iconFrame:(CGRect)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBMatchMoveToIconViewSwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBMatchMoveToIconViewSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v10 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_active withName:@"active"];
  v6 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v7 = (id)[v4 appendObject:v6 withName:@"appLayout"];

  if (self->_active) {
    id v8 = (id)objc_msgSend(v4, "appendRect:withName:", @"iconFrame", self->_iconFrame.origin.x, self->_iconFrame.origin.y, self->_iconFrame.size.width, self->_iconFrame.size.height);
  }
  return v4;
}

- (int64_t)type
{
  return 15;
}

- (SBMatchMoveToIconViewSwitcherEventResponse)initWithDeactivatingAppLayout:(id)a3
{
  return (SBMatchMoveToIconViewSwitcherEventResponse *)-[SBMatchMoveToIconViewSwitcherEventResponse _initWithAppLayout:active:iconFrame:](self, "_initWithAppLayout:active:iconFrame:", a3, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (id)_initWithAppLayout:(id)a3 active:(BOOL)a4 iconFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBMatchMoveToIconViewSwitcherEventResponse;
  v13 = [(SBChainableModifierEventResponse *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_appLayout, a3);
    v14->_active = a4;
    v14->_iconFrame.origin.CGFloat x = x;
    v14->_iconFrame.origin.CGFloat y = y;
    v14->_iconFrame.size.CGFloat width = width;
    v14->_iconFrame.size.CGFloat height = height;
  }

  return v14;
}

- (void).cxx_destruct
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBMatchMoveToIconViewSwitcherEventResponse)initWithActivatingAppLayout:(id)a3 iconFrame:(CGRect)a4
{
  return (SBMatchMoveToIconViewSwitcherEventResponse *)-[SBMatchMoveToIconViewSwitcherEventResponse _initWithAppLayout:active:iconFrame:](self, "_initWithAppLayout:active:iconFrame:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (CGRect)iconFrame
{
  double x = self->_iconFrame.origin.x;
  double y = self->_iconFrame.origin.y;
  double width = self->_iconFrame.size.width;
  double height = self->_iconFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end