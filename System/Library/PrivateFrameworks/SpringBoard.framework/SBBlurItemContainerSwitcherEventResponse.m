@interface SBBlurItemContainerSwitcherEventResponse
- (BOOL)shouldBlur;
- (SBAppLayout)appLayout;
- (SBBlurItemContainerParameters)blurParameters;
- (SBBlurItemContainerSwitcherEventResponse)initWithAppLayout:(id)a3 shouldBlur:(BOOL)a4 animationUpdateMode:(int64_t)a5;
- (SBBlurItemContainerSwitcherEventResponse)initWithAppLayout:(id)a3 shouldBlur:(BOOL)a4 blurParameters:(id)a5 animationUpdateMode:(int64_t)a6;
- (id)description;
- (int64_t)animationUpdateMode;
- (int64_t)type;
@end

@implementation SBBlurItemContainerSwitcherEventResponse

- (SBBlurItemContainerSwitcherEventResponse)initWithAppLayout:(id)a3 shouldBlur:(BOOL)a4 blurParameters:(id)a5 animationUpdateMode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBBlurItemContainerSwitcherEventResponse;
  v13 = [(SBChainableModifierEventResponse *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_shouldBlur = a4;
    objc_storeStrong((id *)&v13->_appLayout, a3);
    objc_storeStrong((id *)&v14->_blurParameters, a5);
    v14->_animationUpdateMode = a6;
  }

  return v14;
}

- (SBBlurItemContainerSwitcherEventResponse)initWithAppLayout:(id)a3 shouldBlur:(BOOL)a4 animationUpdateMode:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = +[SBBlurItemContainerParameters defaultCrossblurBlurParameters];
  v10 = [(SBBlurItemContainerSwitcherEventResponse *)self initWithAppLayout:v8 shouldBlur:v6 blurParameters:v9 animationUpdateMode:a5];

  return v10;
}

- (int64_t)type
{
  return 20;
}

- (id)description
{
  v3 = [(SBChainableModifierEventResponse *)self succinctDescriptionBuilder];
  id v4 = (id)[v3 appendSuper];
  [(SBBlurItemContainerSwitcherEventResponse *)self shouldBlur];
  v5 = NSStringFromBOOL();
  [v3 appendString:v5 withName:@"blur"];

  BOOL v6 = [v3 build];

  return v6;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (BOOL)shouldBlur
{
  return self->_shouldBlur;
}

- (SBBlurItemContainerParameters)blurParameters
{
  return self->_blurParameters;
}

- (int64_t)animationUpdateMode
{
  return self->_animationUpdateMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurParameters, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end