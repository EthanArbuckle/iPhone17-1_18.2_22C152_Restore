@interface SBMoveGestureFloatingSwitcherModifier
- (BOOL)hideSlideOverTongueForDragFromStashedConfiguration;
- (CGPoint)translation;
- (CGRect)containerViewBounds;
- (SBMoveGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 initialFloatingConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)_updateForGestureDidBeginWithEvent:(id)a3;
- (id)_updateForGestureDidChangeWithEvent:(id)a3;
- (id)_updateForGestureDidEndWithEvent:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutToAttachSlideOverTongue;
- (id)appLayoutsToCacheSnapshots;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)visibleAppLayouts;
- (int64_t)initialFloatingConfiguration;
- (int64_t)interfaceOrientation;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (void)setHideSlideOverTongueForDragFromStashedConfiguration:(BOOL)a3;
- (void)setInitialFloatingConfiguration:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setTranslation:(CGPoint)a3;
@end

@implementation SBMoveGestureFloatingSwitcherModifier

- (SBMoveGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 initialFloatingConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  v7 = [(SBGestureSwitcherModifier *)&v11 initWithGestureID:a3];
  if (v7)
  {
    BOOL IsValid = SBFloatingConfigurationIsValid(a4);
    int64_t v9 = 4;
    if (IsValid) {
      int64_t v9 = a4;
    }
    v7->_initialFloatingConfiguration = v9;
    v7->_interfaceOrientation = a5;
  }
  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  id v4 = a3;
  v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  unint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  unint64_t v6 = [(SBGestureSwitcherModifier *)&v12 handleGestureEvent:v5];
  switch([v5 phase])
  {
    case 0:
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBMoveGestureFloatingSwitcherModifier.m" lineNumber:64 description:@"Should not be getting PhasePossible"];

      goto LABEL_3;
    case 1:
      uint64_t v9 = [(SBMoveGestureFloatingSwitcherModifier *)self _updateForGestureDidBeginWithEvent:v5];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [(SBMoveGestureFloatingSwitcherModifier *)self _updateForGestureDidChangeWithEvent:v5];
      goto LABEL_7;
    case 3:
      uint64_t v9 = [(SBMoveGestureFloatingSwitcherModifier *)self _updateForGestureDidEndWithEvent:v5];
LABEL_7:
      objc_super v8 = (void *)v9;
      break;
    default:
LABEL_3:
      objc_super v8 = 0;
      break;
  }
  v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v6];

  return v10;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  self->_translation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:10 updateMode:2];
  return v3;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  p_translation = &self->_translation;
  [a3 translationInContainerView];
  p_translation->x = v4;
  p_translation->y = v5;
  return 0;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v4 = a3;
  [v4 velocityInContainerView];
  double v35 = v5;
  [(SBMoveGestureFloatingSwitcherModifier *)self containerViewBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  int64_t initialFloatingConfiguration = self->_initialFloatingConfiguration;
  [(SBMoveGestureFloatingSwitcherModifier *)self switcherViewBounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v34 = v21;
  v37.origin.x = v7;
  v37.origin.y = v9;
  v37.size.width = v11;
  v37.size.height = v13;
  double Width = CGRectGetWidth(v37);
  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  double MidX = CGRectGetMidX(v38);
  v24 = [(SBMoveGestureFloatingSwitcherModifier *)self medusaSettings];
  uint64_t v25 = SBFloatingConfigurationForMovingFloatingApplication(initialFloatingConfiguration, v24, v35, v16, v18, v20, v34, Width, MidX);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 indirectPanEndReason] == 3)
  {
    unint64_t v26 = self->_initialFloatingConfiguration - 1;
    if (v26 <= 3) {
      uint64_t v25 = qword_1D8FD2DF0[v26];
    }
  }
  if (objc_msgSend(v4, "touchType", *(void *)&v34) == 1
    && (self->_initialFloatingConfiguration == 4 ? (BOOL v27 = v25 == 1) : (BOOL v27 = 0), v27))
  {
    uint64_t v25 = 1;
  }
  else if ([v4 touchType] == 1 && v25 == 2 && self->_initialFloatingConfiguration == 3)
  {
    uint64_t v25 = 2;
  }
  v29 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  if (!SBFloatingConfigurationIsStashed(v25))
  {
    v30 = [(SBMoveGestureFloatingSwitcherModifier *)self appLayouts];
    v31 = [v30 firstObject];
    [(SBSwitcherTransitionRequest *)v29 setAppLayout:v31];
  }
  [(SBSwitcherTransitionRequest *)v29 setFloatingConfiguration:v25];
  [(SBSwitcherTransitionRequest *)v29 setPreferredInterfaceOrientation:[(SBMoveGestureFloatingSwitcherModifier *)self switcherInterfaceOrientation]];
  v32 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v29 gestureInitiated:1];

  return v32;
}

- (CGRect)containerViewBounds
{
  v19.receiver = self;
  v19.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  [(SBMoveGestureFloatingSwitcherModifier *)&v19 containerViewBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = fmin(v3, 0.0);
  [(SBMoveGestureFloatingSwitcherModifier *)self switcherViewBounds];
  double MaxX = CGRectGetMaxX(v20);
  if ([(SBMoveGestureFloatingSwitcherModifier *)self isRTLEnabled])
  {
    double v11 = v11 - v8;
    if (self->_initialFloatingConfiguration == 4) {
      double v13 = v8;
    }
    else {
      double v13 = 0.0;
    }
    double MaxX = MaxX - v13;
  }
  if (v11 >= v4) {
    double v14 = v11;
  }
  else {
    double v14 = v4;
  }
  if (MaxX <= v14) {
    double v14 = MaxX;
  }
  double v15 = v14 + self->_translation.x;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)visibleAppLayouts
{
  if (SBFloatingConfigurationIsStashed(self->_initialFloatingConfiguration))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v4 = [(SBMoveGestureFloatingSwitcherModifier *)self appLayouts];
    if ([v4 count])
    {
      if ([v4 count] == 1) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2;
      }
      double v6 = objc_msgSend(v4, "subarrayWithRange:", 0, v5);
      [v3 addObjectsFromArray:v6];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
    id v3 = [(SBMoveGestureFloatingSwitcherModifier *)&v8 visibleAppLayouts];
  }
  return v3;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  double v4 = [(SBGestureSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  uint64_t v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBMoveGestureFloatingSwitcherModifier *)self medusaSettings];
  double v7 = [v6 medusaAnimationSettings];
  [v5 setLayoutSettings:v7];

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  [(SBMoveGestureFloatingSwitcherModifier *)self containerViewBounds];
  double MidX = CGRectGetMidX(v17);
  char v7 = [(SBMoveGestureFloatingSwitcherModifier *)self isRTLEnabled];
  [(SBMoveGestureFloatingSwitcherModifier *)self switcherViewBounds];
  double v8 = CGRectGetMidX(v18);
  if (v7)
  {
    if (MidX <= v8)
    {
LABEL_3:
      uint64_t v9 = 4;
      uint64_t v10 = 2;
      goto LABEL_6;
    }
  }
  else if (MidX > v8)
  {
    goto LABEL_3;
  }
  uint64_t v9 = 3;
  uint64_t v10 = 1;
LABEL_6:
  [(SBMoveGestureFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_interfaceOrientation floatingConfiguration:v10];
  double v11 = CGRectGetMidX(v19);
  [(SBMoveGestureFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_interfaceOrientation floatingConfiguration:v9];
  double v12 = fmin(fmax(1.0 - (MidX - v11) / (CGRectGetMidX(v20) - v11), 0.0), 1.0);
  if (a4) {
    double v13 = 0.25;
  }
  else {
    double v13 = 1.0;
  }
  if ([(SBGestureSwitcherModifier *)self gesturePhase] >= 2 || a4 == 0) {
    double v15 = v13;
  }
  else {
    double v15 = 0.0;
  }
  return v12 * v15;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  [(SBMoveGestureFloatingSwitcherModifier *)self containerViewBounds];
  double MidX = CGRectGetMidX(v7);
  [(SBMoveGestureFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_interfaceOrientation floatingConfiguration:1];
  double v5 = CGRectGetMidX(v8);
  [(SBMoveGestureFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_interfaceOrientation floatingConfiguration:2];
  return fmin(fmax((MidX - v5 + MidX - v5) / (CGRectGetMidX(v9) - v5) + -1.0, -1.0), 1.0);
}

- (id)appLayoutsToCacheSnapshots
{
  if (SBFloatingConfigurationIsStashed(self->_initialFloatingConfiguration))
  {
    id v3 = [(SBMoveGestureFloatingSwitcherModifier *)self appLayouts];
    v10.length = [v3 count];
    v9.location = 0;
    v9.length = 1;
    v10.location = 0;
    NSRange v4 = NSIntersectionRange(v9, v10);
    double v5 = objc_msgSend(v3, "subarrayWithRange:", v4.location, v4.length);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
    double v5 = [(SBMoveGestureFloatingSwitcherModifier *)&v7 appLayoutsToCacheSnapshots];
  }
  return v5;
}

- (unint64_t)slideOverTongueState
{
  if (!SBFloatingConfigurationIsStashed(self->_initialFloatingConfiguration)
    || self->_hideSlideOverTongueForDragFromStashedConfiguration)
  {
    return 0;
  }
  if (self->_initialFloatingConfiguration == 4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  if (self->_initialFloatingConfiguration == 4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 3;
  }
  [(SBMoveGestureFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_interfaceOrientation floatingConfiguration:v5];
  CGRectGetMidX(v7);
  [(SBMoveGestureFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_interfaceOrientation floatingConfiguration:v4];
  CGRectGetMidX(v8);
  [(SBMoveGestureFloatingSwitcherModifier *)self containerViewBounds];
  CGRectGetMidX(v9);
  char v6 = self->_hideSlideOverTongueForDragFromStashedConfiguration | BSFloatIsOne();
  unint64_t result = v6 == 0;
  self->_hideSlideOverTongueForDragFromStashedConfiguration = v6;
  return result;
}

- (unint64_t)slideOverTongueDirection
{
  [(SBMoveGestureFloatingSwitcherModifier *)self containerViewBounds];
  UIRectGetCenter();
  double v4 = v3;
  [(SBMoveGestureFloatingSwitcherModifier *)self switcherViewBounds];
  double v6 = v5;
  if ([(SBMoveGestureFloatingSwitcherModifier *)self isRTLEnabled])
  {
    if (v4 <= v6 * 0.5) {
      return 1;
    }
  }
  else if (v4 > v6 * 0.5)
  {
    return 1;
  }
  return 2;
}

- (id)appLayoutToAttachSlideOverTongue
{
  v2 = [(SBMoveGestureFloatingSwitcherModifier *)self appLayouts];
  double v3 = [v2 firstObject];

  return v3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  int v6 = objc_msgSend(v5, "sbf_isLowEndForSlideOverMoveGesture");

  if (v6)
  {
    unsigned __int16 v7 = SBSwitcherAsyncRenderingAttributesMake(1u, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
    unsigned __int16 v7 = (unsigned __int16)[(SBMoveGestureFloatingSwitcherModifier *)&v10 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v8 = (SBSwitcherAsyncRenderingAttributes)v7;

  return v8;
}

- (int64_t)initialFloatingConfiguration
{
  return self->_initialFloatingConfiguration;
}

- (void)setInitialFloatingConfiguration:(int64_t)a3
{
  self->_int64_t initialFloatingConfiguration = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (BOOL)hideSlideOverTongueForDragFromStashedConfiguration
{
  return self->_hideSlideOverTongueForDragFromStashedConfiguration;
}

- (void)setHideSlideOverTongueForDragFromStashedConfiguration:(BOOL)a3
{
  self->_hideSlideOverTongueForDragFromStashedConfiguration = a3;
}

@end