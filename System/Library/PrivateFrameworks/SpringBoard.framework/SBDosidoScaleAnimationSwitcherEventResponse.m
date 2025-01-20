@interface SBDosidoScaleAnimationSwitcherEventResponse
- (SBAppLayout)appLayout;
- (SBDosidoScaleAnimationSwitcherEventResponse)initWithAppLayout:(id)a3;
- (int64_t)type;
@end

@implementation SBDosidoScaleAnimationSwitcherEventResponse

- (int64_t)type
{
  return 19;
}

- (SBDosidoScaleAnimationSwitcherEventResponse)initWithAppLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDosidoScaleAnimationSwitcherEventResponse;
  v6 = [(SBChainableModifierEventResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appLayout, a3);
  }

  return v7;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void).cxx_destruct
{
}

@end