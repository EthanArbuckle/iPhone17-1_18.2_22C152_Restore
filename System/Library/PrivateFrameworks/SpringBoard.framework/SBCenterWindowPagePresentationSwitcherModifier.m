@interface SBCenterWindowPagePresentationSwitcherModifier
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBCenterWindowPagePresentationSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4 isMorph:(BOOL)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
@end

@implementation SBCenterWindowPagePresentationSwitcherModifier

- (SBCenterWindowPagePresentationSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4 isMorph:(BOOL)a5
{
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v16 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_toAppLayout, a4);
    v11->_isInAppMorphAnimation = a5;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    defaultCriticallyDampedSettings = v11->_defaultCriticallyDampedSettings;
    v11->_defaultCriticallyDampedSettings = (SBFFluidBehaviorSettings *)v12;

    [(SBFFluidBehaviorSettings *)v11->_defaultCriticallyDampedSettings setDefaultCriticallyDampedValues];
    v14 = v11->_defaultCriticallyDampedSettings;
    CAFrameRateRange v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
  }

  return v11;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if ([(SBTransitionSwitcherModifier *)self isInterrupted])
  {
    v4 = objc_alloc_init(SBCancelWindowMorphingSwitcherEventResponse);
    uint64_t v5 = SBAppendSwitcherModifierResponse(v4, v3);

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  return !self->_isInAppMorphAnimation;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_toAppLayout] && self->_isInAppMorphAnimation)
  {
    unsigned __int16 v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    unsigned __int16 v5 = (unsigned __int16)[(SBTransitionSwitcherModifier *)&v8 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  unsigned __int16 v5 = [(SBCenterWindowPagePresentationSwitcherModifier *)self appLayouts];
  SBSwitcherAsyncRenderingAttributes v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_toAppLayout]
    && [(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    [(SBCenterWindowPagePresentationSwitcherModifier *)self containerViewBounds];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    [(SBCenterWindowPagePresentationSwitcherModifier *)&v19 frameForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  unsigned __int16 v5 = [(SBCenterWindowPagePresentationSwitcherModifier *)self appLayouts];
  SBSwitcherAsyncRenderingAttributes v6 = [v5 objectAtIndex:a3];

  if (![v6 isEqual:self->_toAppLayout]
    || (double v7 = 1.0, ![(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    [(SBCenterWindowPagePresentationSwitcherModifier *)&v10 scaleForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  id v11 = a4;
  -[SBCenterWindowPagePresentationSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v31, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  CGFloat v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  int v20 = objc_msgSend(v11, "isEqual:", self->_toAppLayout, v31.receiver, v31.super_class);

  if (v20) {
    BOOL v21 = a3 == 4;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21
    && [(SBTransitionSwitcherModifier *)self isPreparingLayout]
    && !self->_isInAppMorphAnimation)
  {
    v32.origin.double x = v13;
    v32.origin.double y = v15;
    v32.size.double width = v17;
    v32.size.double height = v19;
    double v22 = CGRectGetHeight(v32);
    v23 = [(SBCenterWindowPagePresentationSwitcherModifier *)self entityRemovalSettings];
    v24 = [v23 dosidoDeclineIntentAnimationSettings];
    [v24 fromViewSlideOutHeightOffsetMultiplier];
    double v26 = v22 * v25;

    double v15 = v15 + v26;
  }
  double v27 = v13;
  double v28 = v15;
  double v29 = v17;
  double v30 = v19;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  id v8 = a4;
  [(SBCenterWindowPagePresentationSwitcherModifier *)&v13 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  double v10 = v9;
  LODWORD(a5) = objc_msgSend(v8, "isEqual:", self->_toAppLayout, v13.receiver, v13.super_class);

  if (a5) {
    BOOL v11 = a3 == 4;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 && self->_isInAppMorphAnimation) {
    return 0.0;
  }
  return v10;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if (![v4 isEqual:self->_toAppLayout]
    || (double v5 = 0.0, ![(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    [(SBCenterWindowPagePresentationSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  double v5 = v4;
  if (!self->_isInAppMorphAnimation)
  {
    double v6 = (void *)[v4 mutableCopy];
    [v6 setLayoutSettings:self->_defaultCriticallyDampedSettings];
    [v6 setPositionSettings:self->_defaultCriticallyDampedSettings];
    [v6 setScaleSettings:self->_defaultCriticallyDampedSettings];

    double v5 = v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCriticallyDampedSettings, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end