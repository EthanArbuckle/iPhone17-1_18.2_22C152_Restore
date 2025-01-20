@interface SBSwitcherSwipeUpGestureFloatingSwitcherModifier
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBSwitcherSwipeUpGestureFloatingSwitcherModifier)initWithGestureID:(id)a3;
- (double)contentViewScale;
- (double)scaleForIndex:(unint64_t)a3;
- (id)handleGestureEvent:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
@end

@implementation SBSwitcherSwipeUpGestureFloatingSwitcherModifier

- (SBSwitcherSwipeUpGestureFloatingSwitcherModifier)initWithGestureID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  v5 = [(SBGestureSwitcherModifier *)&v11 initWithGestureID:v4];
  if (v5)
  {
    v6 = [[SBGridSwipeUpGestureSwitcherModifier alloc] initWithGestureID:v4];
    gridSwipeUpGestureModifier = v5->_gridSwipeUpGestureModifier;
    v5->_gridSwipeUpGestureModifier = v6;

    [(SBChainableModifier *)v5 addChildModifier:v5->_gridSwipeUpGestureModifier];
    v8 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v5->_dismissSiriModifier;
    v5->_dismissSiriModifier = v8;

    [(SBChainableModifier *)v5 addChildModifier:v5->_dismissSiriModifier];
  }

  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  v8 = (SBGridSwipeUpGestureSwitcherModifier *)a4;
  v9 = [(SBChainableModifier *)&v12 responseForProposedChildResponse:a3 childModifier:v8 event:a5];
  gridSwipeUpGestureModifier = self->_gridSwipeUpGestureModifier;

  if (gridSwipeUpGestureModifier == v8)
  {

    v9 = 0;
  }
  return v9;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  v5 = [(SBGestureSwitcherModifier *)&v15 handleGestureEvent:v4];
  if ([v4 phase] == 3)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    gridSwipeUpGestureModifier = self->_gridSwipeUpGestureModifier;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__SBSwitcherSwipeUpGestureFloatingSwitcherModifier_handleGestureEvent___block_invoke;
    v11[3] = &unk_1E6AF6380;
    v13 = v14;
    v11[4] = self;
    id v12 = v4;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridSwipeUpGestureModifier usingBlock:v11];
    v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    [(SBSwitcherTransitionRequest *)v7 setFloatingSwitcherVisible:BSSettingFlagIfYes()];
    v8 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:1];
    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

    [(SBChainableModifier *)self setState:1];
    _Block_object_dispose(v14, 8);
    v5 = (void *)v9;
  }

  return v5;
}

uint64_t __71__SBSwitcherSwipeUpGestureFloatingSwitcherModifier_handleGestureEvent___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 120) finalResponseForGestureEvent:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  [(SBSwitcherSwipeUpGestureFloatingSwitcherModifier *)self switcherViewBounds];
  UIRectGetCenter();
  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  [(SBSwitcherSwipeUpGestureFloatingSwitcherModifier *)&v12 frameForIndex:a3];
  UIRectGetCenter();
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  [(SBSwitcherSwipeUpGestureFloatingSwitcherModifier *)&v11 contentViewScale];
  CGAffineTransformMakeScale(&v10, v5, v5);
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  [(SBSwitcherSwipeUpGestureFloatingSwitcherModifier *)&v9 scaleForIndex:a3];
  double v5 = v4;
  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  [(SBSwitcherSwipeUpGestureFloatingSwitcherModifier *)&v8 contentViewScale];
  return v5 * v6;
}

- (double)contentViewScale
{
  return 1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_gridSwipeUpGestureModifier, 0);
}

@end