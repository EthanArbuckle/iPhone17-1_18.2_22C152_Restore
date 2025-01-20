@interface SBContinuousExposeToHomeSwitcherModifier
- (BOOL)_isEffectivelyHome;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (SBContinuousExposeToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 continuousExposeModifier:(id)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (id)_newContinuousExposeModifier;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
@end

@implementation SBContinuousExposeToHomeSwitcherModifier

- (SBContinuousExposeToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 continuousExposeModifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v17 initWithTransitionID:v9];
  if (v11)
  {
    if (!v10)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v11, @"SBContinuousExposeToHomeSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"continuousExposeModifier" object file lineNumber description];
    }
    v11->_direction = a4;
    objc_storeStrong((id *)&v11->_continuousExposeModifier, a5);
    v12 = [SBHomeToGridSwitcherModifier alloc];
    id v13 = [(SBContinuousExposeToHomeSwitcherModifier *)v11 _newContinuousExposeModifier];
    v14 = [(SBHomeToSwitcherSwitcherModifier *)v12 initWithTransitionID:v9 direction:a4 != 0 multitaskingModifier:v13];

    [(SBChainableModifier *)v11 addChildModifier:v14];
  }

  return v11;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  continuousExposeModifier = self->_continuousExposeModifier;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBContinuousExposeToHomeSwitcherModifier_headerStyleForIndex___block_invoke;
  v6[3] = &unk_1E6AF6358;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeModifier usingBlock:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __64__SBContinuousExposeToHomeSwitcherModifier_headerStyleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) headerStyleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  continuousExposeModifier = self->_continuousExposeModifier;
  uint64_t v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__SBContinuousExposeToHomeSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  id v13 = &v15;
  int64_t v14 = a3;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeModifier usingBlock:v11];
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __81__SBContinuousExposeToHomeSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) shadowStyleForLayoutRole:a1[7] inAppLayout:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  continuousExposeModifier = self->_continuousExposeModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBContinuousExposeToHomeSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeModifier usingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__SBContinuousExposeToHomeSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) homeScreenBackdropBlurType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5 = [(SBContinuousExposeToHomeSwitcherModifier *)self _isEffectivelyHome];
  double v6 = 0.5;
  double v7 = 0.5;
  if (!v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    -[SBContinuousExposeToHomeSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3, 0.5, 0.5);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if ([(SBContinuousExposeToHomeSwitcherModifier *)self _isEffectivelyHome]) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
  return [(SBContinuousExposeToHomeSwitcherModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (![(SBContinuousExposeToHomeSwitcherModifier *)self _isEffectivelyHome])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    [(SBContinuousExposeToHomeSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (![(SBContinuousExposeToHomeSwitcherModifier *)self _isEffectivelyHome])
  {
    v18.receiver = self;
    v18.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    -[SBContinuousExposeToHomeSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v18, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = 0.5;
  double v9 = 0.5;
  if (![(SBContinuousExposeToHomeSwitcherModifier *)self _isEffectivelyHome])
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    -[SBContinuousExposeToHomeSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    double v8 = v10;
    double v9 = v11;
  }

  double v12 = v8;
  double v13 = v9;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)_newContinuousExposeModifier
{
  return (id)[(SBAppSwitcherContinuousExposeSwitcherModifier *)self->_continuousExposeModifier copy];
}

- (BOOL)_isEffectivelyHome
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = self->_direction == 0;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 || v4;
}

- (void).cxx_destruct
{
}

@end