@interface SBContinuousExposeIdentifierSlideModifier
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (NSArray)previousContinuousExposeIdentifiersInStrip;
- (NSArray)previousContinuousExposeIdentifiersInSwitcher;
- (NSString)continuousExposeIdentifier;
- (SBContinuousExposeIdentifierSlideModifier)initWithContinuousExposeIdentifier:(id)a3 previousContinuousExposeIdentifiersInSwitcher:(id)a4 previousContinuousExposeIdentifiersInStrip:(id)a5 direction:(unint64_t)a6;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_beginAnimation;
- (id)_waitingToAnimateReason;
- (id)_waitingToPrepareLayoutReason;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (unint64_t)direction;
- (void)_performBlockWithIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4 block:(id)a5;
@end

@implementation SBContinuousExposeIdentifierSlideModifier

- (SBContinuousExposeIdentifierSlideModifier)initWithContinuousExposeIdentifier:(id)a3 previousContinuousExposeIdentifiersInSwitcher:(id)a4 previousContinuousExposeIdentifiersInStrip:(id)a5 direction:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  v14 = [(SBSwitcherModifier *)&v28 init];
  if (v14)
  {
    if (v11)
    {
      if (v12) {
        goto LABEL_4;
      }
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v14, @"SBContinuousExposeIdentifierSlideModifier.m", 32, @"Invalid parameter not satisfying: %@", @"continuousExposeIdentifier" object file lineNumber description];

      if (v12)
      {
LABEL_4:
        if (v13)
        {
LABEL_5:
          uint64_t v15 = [v11 copy];
          continuousExposeIdentifier = v14->_continuousExposeIdentifier;
          v14->_continuousExposeIdentifier = (NSString *)v15;

          uint64_t v17 = [v12 copy];
          previousContinuousExposeIdentifiersInSwitcher = v14->_previousContinuousExposeIdentifiersInSwitcher;
          v14->_previousContinuousExposeIdentifiersInSwitcher = (NSArray *)v17;

          uint64_t v19 = [v13 copy];
          previousContinuousExposeIdentifiersInStrip = v14->_previousContinuousExposeIdentifiersInStrip;
          v14->_previousContinuousExposeIdentifiersInStrip = (NSArray *)v19;

          v14->_direction = a6;
          v21 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v22 = [v21 UUIDString];
          uniqueAnimationIdentifier = v14->_uniqueAnimationIdentifier;
          v14->_uniqueAnimationIdentifier = (NSString *)v22;

          goto LABEL_6;
        }
LABEL_9:
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:a2, v14, @"SBContinuousExposeIdentifierSlideModifier.m", 34, @"Invalid parameter not satisfying: %@", @"previousContinuousExposeIdentifiersInStrip" object file lineNumber description];

        goto LABEL_5;
      }
    }
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, v14, @"SBContinuousExposeIdentifierSlideModifier.m", 33, @"Invalid parameter not satisfying: %@", @"previousContinuousExposeIdentifiersInSwitcher" object file lineNumber description];

    if (v13) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v14;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v38.receiver = self;
  v38.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier frameForIndex:](&v38, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(SBContinuousExposeIdentifierSlideModifier *)self appLayouts];
  v14 = [v13 objectAtIndex:a3];

  uint64_t v15 = [v14 continuousExposeIdentifier];
  if (![v15 isEqualToString:self->_continuousExposeIdentifier])
  {
LABEL_12:

    goto LABEL_13;
  }
  v16 = [(SBContinuousExposeIdentifierSlideModifier *)self appLayoutOnStage];
  char v17 = [v16 isOrContainsAppLayout:v14];

  if ((v17 & 1) == 0)
  {
    if (self->_isWaitingToPrepareLayout && !self->_direction)
    {
LABEL_8:
      uint64_t v15 = [(SBContinuousExposeIdentifierSlideModifier *)self chamoisLayoutAttributes];
      [v15 stripWidth];
      double v21 = v20;
      [v15 screenEdgePadding];
      double v23 = v22;
      if ([(SBContinuousExposeIdentifierSlideModifier *)self isRTLEnabled])
      {
        [(SBContinuousExposeIdentifierSlideModifier *)self containerViewBounds];
        double v26 = v21 + v23 + v24 + v25;
      }
      else
      {
        double v26 = -(v21 + v23);
      }
      double v6 = v26 + v10 * -0.5;
      goto LABEL_12;
    }
    if (self->_isWaitingToBeginAnimation && self->_direction == 1)
    {
      uint64_t v32 = 0;
      v33 = (double *)&v32;
      uint64_t v34 = 0x4010000000;
      v35 = &unk_1D90ED3C6;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      long long v36 = 0u;
      long long v37 = 0u;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __59__SBContinuousExposeIdentifierSlideModifier_frameForIndex___block_invoke;
      v31[3] = &unk_1E6AF6358;
      v31[5] = &v32;
      v31[6] = a3;
      v31[4] = self;
      [(SBContinuousExposeIdentifierSlideModifier *)self _performBlockWithIdentifiersInSwitcher:previousContinuousExposeIdentifiersInSwitcher identifiersInStrip:previousContinuousExposeIdentifiersInStrip block:v31];
      double v8 = v33[5];
      double v10 = v33[6];
      double v12 = v33[7];
      _Block_object_dispose(&v32, 8);
      goto LABEL_8;
    }
  }
LABEL_13:

  double v27 = v6;
  double v28 = v8;
  double v29 = v10;
  double v30 = v12;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

id __59__SBContinuousExposeIdentifierSlideModifier_frameForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  id result = objc_msgSendSuper2(&v9, sel_frameForIndex_, v2);
  v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier anchorPointForIndex:](&v25, sel_anchorPointForIndex_);
  double v6 = v5;
  double v8 = v7;
  objc_super v9 = [(SBContinuousExposeIdentifierSlideModifier *)self appLayouts];
  double v10 = [v9 objectAtIndex:a3];

  double v11 = [v10 continuousExposeIdentifier];
  if ([v11 isEqualToString:self->_continuousExposeIdentifier])
  {
    double v12 = [(SBContinuousExposeIdentifierSlideModifier *)self appLayoutOnStage];
    char v13 = [v12 isOrContainsAppLayout:v10];

    if ((v13 & 1) == 0
      && (!self->_isWaitingToPrepareLayout || self->_direction)
      && self->_isWaitingToBeginAnimation
      && self->_direction == 1)
    {
      uint64_t v19 = 0;
      double v20 = (double *)&v19;
      uint64_t v21 = 0x3010000000;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      double v22 = &unk_1D90ED3C6;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __65__SBContinuousExposeIdentifierSlideModifier_anchorPointForIndex___block_invoke;
      v18[3] = &unk_1E6AF6358;
      v18[5] = &v19;
      v18[6] = a3;
      v18[4] = self;
      [(SBContinuousExposeIdentifierSlideModifier *)self _performBlockWithIdentifiersInSwitcher:previousContinuousExposeIdentifiersInSwitcher identifiersInStrip:previousContinuousExposeIdentifiersInStrip block:v18];
      double v6 = v20[4];
      double v8 = v20[5];
      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
  }
  double v16 = v6;
  double v17 = v8;
  result.y = v17;
  result.x = v16;
  return result;
}

id __65__SBContinuousExposeIdentifierSlideModifier_anchorPointForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  id result = objc_msgSendSuper2(&v7, sel_anchorPointForIndex_, v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier scaleForIndex:](&v20, sel_scaleForIndex_);
  double v6 = v5;
  objc_super v7 = [(SBContinuousExposeIdentifierSlideModifier *)self appLayouts];
  double v8 = [v7 objectAtIndex:a3];

  objc_super v9 = [v8 continuousExposeIdentifier];
  if ([v9 isEqualToString:self->_continuousExposeIdentifier])
  {
    double v10 = [(SBContinuousExposeIdentifierSlideModifier *)self appLayoutOnStage];
    char v11 = [v10 isOrContainsAppLayout:v8];

    if ((v11 & 1) == 0
      && (!self->_isWaitingToPrepareLayout || self->_direction)
      && self->_isWaitingToBeginAnimation
      && self->_direction == 1)
    {
      uint64_t v16 = 0;
      double v17 = (double *)&v16;
      uint64_t v18 = 0x2020000000;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      uint64_t v19 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__SBContinuousExposeIdentifierSlideModifier_scaleForIndex___block_invoke;
      v15[3] = &unk_1E6AF6358;
      v15[5] = &v16;
      v15[6] = a3;
      v15[4] = self;
      [(SBContinuousExposeIdentifierSlideModifier *)self _performBlockWithIdentifiersInSwitcher:previousContinuousExposeIdentifiersInSwitcher identifiersInStrip:previousContinuousExposeIdentifiersInStrip block:v15];
      double v6 = v17[3];
      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
  }
  return v6;
}

id __59__SBContinuousExposeIdentifierSlideModifier_scaleForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  id result = objc_msgSendSuper2(&v5, sel_scaleForIndex_, v2);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v48, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = [v9 continuousExposeIdentifier];
  if (![v18 isEqualToString:self->_continuousExposeIdentifier])
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v19 = [(SBContinuousExposeIdentifierSlideModifier *)self appLayoutOnStage];
  char v20 = [v19 isOrContainsAppLayout:v9];

  if ((v20 & 1) == 0)
  {
    if (self->_isWaitingToPrepareLayout && !self->_direction)
    {
LABEL_8:
      uint64_t v18 = [(SBContinuousExposeIdentifierSlideModifier *)self chamoisLayoutAttributes];
      [v18 stripWidth];
      double v24 = v23;
      [v18 screenEdgePadding];
      double v26 = v25;
      if ([(SBContinuousExposeIdentifierSlideModifier *)self isRTLEnabled])
      {
        [(SBContinuousExposeIdentifierSlideModifier *)self containerViewBounds];
        double v29 = v24 + v26 + v27 + v28;
      }
      else
      {
        double v29 = -(v24 + v26);
      }
      double v11 = v29 + v15 * -0.5;
      goto LABEL_12;
    }
    if (self->_isWaitingToBeginAnimation && self->_direction == 1)
    {
      uint64_t v42 = 0;
      v43 = (double *)&v42;
      uint64_t v44 = 0x4010000000;
      v45 = &unk_1D90ED3C6;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      long long v46 = 0u;
      long long v47 = 0u;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __90__SBContinuousExposeIdentifierSlideModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
      v34[3] = &unk_1E6AF6448;
      long long v37 = &v42;
      double v38 = x;
      double v39 = y;
      double v40 = width;
      double v41 = height;
      id v35 = v9;
      long long v36 = self;
      [(SBContinuousExposeIdentifierSlideModifier *)self _performBlockWithIdentifiersInSwitcher:previousContinuousExposeIdentifiersInSwitcher identifiersInStrip:previousContinuousExposeIdentifiersInStrip block:v34];
      double v13 = v43[5];
      double v15 = v43[6];
      double v17 = v43[7];

      _Block_object_dispose(&v42, 8);
      goto LABEL_8;
    }
  }
LABEL_13:

  double v30 = v11;
  double v31 = v13;
  double v32 = v15;
  double v33 = v17;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

id __90__SBContinuousExposeIdentifierSlideModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v9.receiver = *(id *)(a1 + 40);
  v9.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  id result = objc_msgSendSuper2(&v9, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v2, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v4 = *(void **)(*(void *)(a1 + 48) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_isWaitingToBeginAnimation
    || [v4 switcherLayoutElementType]
    || ([(SBContinuousExposeIdentifierSlideModifier *)self appLayoutOnStage],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqual:v5],
        v6,
        (v7 & 1) != 0))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
    uint64_t v8 = [(SBContinuousExposeIdentifierSlideModifier *)&v14 animationAttributesForLayoutElement:v5];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
    double v10 = [(SBContinuousExposeIdentifierSlideModifier *)&v15 animationAttributesForLayoutElement:v5];
    uint64_t v8 = (void *)[v10 mutableCopy];

    [v8 setLayoutUpdateMode:3];
    double v11 = [(SBContinuousExposeIdentifierSlideModifier *)self switcherSettings];
    double v12 = [v11 chamoisSettings];
    double v13 = [v12 appToAppLayoutSettings];
    [v8 setLayoutSettings:v13];
  }
  return v8;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v14 handleContinuousExposeIdentifiersChangedEvent:v4];
  int v6 = objc_msgSend(v4, "isAnimated", v14.receiver, v14.super_class);

  if (v6)
  {
    unint64_t direction = self->_direction;
    if (direction == 1)
    {
      if (self->_isWaitingToBeginAnimation) {
        goto LABEL_10;
      }
      uint64_t v8 = [(SBContinuousExposeIdentifierSlideModifier *)self _beginAnimation];
      uint64_t v12 = SBAppendSwitcherModifierResponse(v8, v5);
      goto LABEL_9;
    }
    if (!direction && !self->_isWaitingToPrepareLayout && !self->_isWaitingToBeginAnimation)
    {
      uint64_t v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
      objc_super v9 = SBAppendSwitcherModifierResponse(v8, v5);

      double v10 = [SBTimerEventSwitcherEventResponse alloc];
      double v11 = [(SBContinuousExposeIdentifierSlideModifier *)self _waitingToPrepareLayoutReason];
      uint64_t v5 = [(SBTimerEventSwitcherEventResponse *)v10 initWithDelay:0 validator:v11 reason:0.0];

      uint64_t v12 = SBAppendSwitcherModifierResponse(v5, v9);

      self->_isWaitingToPrepareLayout = 1;
LABEL_9:

      uint64_t v5 = (SBTimerEventSwitcherEventResponse *)v12;
    }
  }
LABEL_10:
  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  uint64_t v5 = [(SBSwitcherModifier *)&v15 handleTimerEvent:v4];
  if (!self->_direction
    && self->_isWaitingToPrepareLayout
    && ([v4 reason],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        -[SBContinuousExposeIdentifierSlideModifier _waitingToPrepareLayoutReason](self, "_waitingToPrepareLayoutReason"), v10 = objc_claimAutoreleasedReturnValue(), int v11 = [v9 isEqualToString:v10], v10, v9, v11))
  {
    self->_isWaitingToPrepareLayout = 0;
    uint64_t v12 = [(SBContinuousExposeIdentifierSlideModifier *)self _beginAnimation];
    uint64_t v13 = SBAppendSwitcherModifierResponse(v12, v5);

    uint64_t v5 = (void *)v13;
  }
  else if (self->_isWaitingToBeginAnimation)
  {
    int v6 = [v4 reason];
    char v7 = [(SBContinuousExposeIdentifierSlideModifier *)self _waitingToAnimateReason];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      self->_isWaitingToBeginAnimation = 0;
      [(SBChainableModifier *)self setState:1];
    }
  }

  return v5;
}

- (id)_beginAnimation
{
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:3];
  id v4 = [(SBContinuousExposeIdentifierSlideModifier *)self switcherSettings];
  uint64_t v5 = [v4 chamoisSettings];
  int v6 = [v5 appToAppLayoutSettings];
  [v6 response];
  double v8 = v7 * 0.5;

  objc_super v9 = [SBTimerEventSwitcherEventResponse alloc];
  double v10 = [(SBContinuousExposeIdentifierSlideModifier *)self _waitingToAnimateReason];
  int v11 = [(SBTimerEventSwitcherEventResponse *)v9 initWithDelay:0 validator:v10 reason:v8];

  uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v3);

  self->_isWaitingToBeginAnimation = 1;
  return v12;
}

- (id)_waitingToPrepareLayoutReason
{
  return (id)[NSString stringWithFormat:@"%@-WaitingToPrepareLayout", self->_uniqueAnimationIdentifier];
}

- (id)_waitingToAnimateReason
{
  return (id)[NSString stringWithFormat:@"%@-WaitingToAnimate", self->_uniqueAnimationIdentifier];
}

- (void)_performBlockWithIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [[SBOverrideContinuousExposeIdentifiersSwitcherModifier alloc] initWithContinuousExposeIdentifiersInSwitcher:v10 continuousExposeIdentifiersInStrip:v9];

  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v11 usingBlock:v8];
}

- (NSString)continuousExposeIdentifier
{
  return self->_continuousExposeIdentifier;
}

- (NSArray)previousContinuousExposeIdentifiersInSwitcher
{
  return self->_previousContinuousExposeIdentifiersInSwitcher;
}

- (NSArray)previousContinuousExposeIdentifiersInStrip
{
  return self->_previousContinuousExposeIdentifiersInStrip;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInStrip, 0);
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInSwitcher, 0);
  objc_storeStrong((id *)&self->_continuousExposeIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueAnimationIdentifier, 0);
}

@end