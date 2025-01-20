@interface UIViewAnimationState
+ (id)originalAnimationForKeyPath:(id)a3 inLayer:(id)a4;
+ (void)_addConstraintPendingAnimation:(id)a3 container:(id)a4;
+ (void)_addSystemPostAnimationAction:(id)a3;
+ (void)_addViewForConstraintBasedAnimation:(id)a3;
+ (void)popAnimationState;
+ (void)pushViewAnimationState:(id)a3 context:(void *)a4;
- (BOOL)_addCompletion:(id)a3;
- (BOOL)_addCompletionWithPosition:(id)a3;
- (BOOL)_allowsHitTesting;
- (BOOL)_allowsUserInteraction;
- (BOOL)_allowsUserInteractionToCutOffEndOfAnimation;
- (BOOL)_hasDeferredAnimationForView:(id)a3 key:(id)a4;
- (BOOL)_isKeyframeAnimation;
- (BOOL)_isTrackingEnabled;
- (BOOL)_runsAlongsideAnimations;
- (BOOL)_shouldAnimateAdditivelyForKey:(id)a3 onLayer:(id)a4 forView:(id)a5;
- (BOOL)_shouldStartFromCurrentStateForLayer:(id)a3 key:(id)a4 forView:(id)a5;
- (BOOL)disallowInheritance;
- (BOOL)isInProcess;
- (BOOL)shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)shouldDecomposeGeometricTypes;
- (CAFrameRateRange)preferredFrameRateRange;
- (UIViewAnimationState)init;
- (UIViewAnimationState)nextState;
- (double)_canonicalTrackedUnpacedFractionComplete;
- (double)_elapsedTimeForCanonicallyTrackedAnimation;
- (double)_unpacedFractionCompleteForAnimation:(id)a3 inLayer:(id)a4 duration:(double)a5;
- (id)_canonicalTrackedLayerAnimationInLayer:(id *)a3;
- (id)_createDeferredAnimationForKey:(id)a3 ignoringKeyFrames:(BOOL)a4;
- (id)_defaultAnimationForKey:(id)a3;
- (id)_deferredAnimationForView:(id)a3 key:(id)a4 ignoringKeyFrames:(BOOL)a5;
- (id)_outerPropertyAnimator:(BOOL)a3;
- (id)_trackedAnimations;
- (id)_updateAnimationFrameWithAnimationProperties:(id)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5;
- (id)animationForLayer:(id)a3 forKey:(id)a4 forView:(id)a5;
- (id)delegate;
- (int)_didEndCount;
- (unsigned)updateReason;
- (void)_acceptEarlyAnimationCutoff:(id)a3;
- (void)_addAnimationStateForTracking:(id)a3;
- (void)_animationDidStopWithNilAnimationFinished:(BOOL)a3;
- (void)_decrementDidEndCount;
- (void)_finalizeDeferredAnimations;
- (void)_incrementDidEndCount;
- (void)_performWithCompletionCallbacksDisabledOnPop:(id)a3;
- (void)_prepareForViewAnimationAfterPush;
- (void)_removeAnimationStateFromTrackingMap:(BOOL)a3;
- (void)_removeAnimationStateFromTrackingMap:(BOOL)a3 disableTrackingIfNeeded:(BOOL)a4;
- (void)_removeLastCompletion;
- (void)_runAlongsideAnimations;
- (void)_runConstraintBasedLayoutAnimations;
- (void)_setAlongsideAnimations:(id)a3;
- (void)_setCustomCurve:(id)a3;
- (void)_setFinishedPosition:(int64_t)a3;
- (void)_trackAnimation:(id)a3 nonAdditiveAnimation:(id)a4 withAnimationKey:(id)a5 forKeyPath:(id)a6 inLayer:(id)a7;
- (void)_trackAnimation:(id)a3 withAnimationKey:(id)a4 forKeyPath:(id)a5 inLayer:(id)a6;
- (void)_trackObject:(id)a3 withAnimationPropertyName:(id)a4 inLayer:(id)a5;
- (void)_transferAnimationToTrackingAnimator:(id)a3;
- (void)_transformIntoAdditiveAnimationAndNoteOriginal:(id)a3 inLayer:(id)a4 animationKey:(id)a5;
- (void)_untrackAnimationsWithIdentifier:(id)a3 keyPath:(id)a4 inLayer:(id)a5 removeFromLayer:(BOOL)a6;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)configureAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5;
- (void)pop;
- (void)pushWithViewAnimationID:(id)a3 context:(void *)a4;
- (void)sendDelegateAnimationDidStop:(id)a3 finished:(BOOL)a4;
- (void)sendDelegateDidStopManually:(BOOL)a3;
- (void)setAnimationAttributes:(id)a3;
- (void)setAnimationAttributes:(id)a3 skipDelegateAssignment:(BOOL)a4;
- (void)setAnimationAttributes:(id)a3 skipDelegateAssignment:(BOOL)a4 customCurve:(id)a5;
- (void)setDisallowInheritance:(BOOL)a3;
- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10;
@end

@implementation UIViewAnimationState

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum = self->_preferredFrameRateRange.minimum;
  float maximum = self->_preferredFrameRateRange.maximum;
  float preferred = self->_preferredFrameRateRange.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (UIViewAnimationState)init
{
  v7.receiver = self;
  v7.super_class = (Class)UIViewAnimationState;
  v2 = [(UIViewAnimationState *)&v7 init];
  if (v2) {
    BOOL v3 = qword_1EB25C0E0 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    trackedAnimations = v2->_trackedAnimations;
    v2->_trackedAnimations = v4;
  }
  return v2;
}

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  id v49 = a5;
  id v19 = a7;
  v20 = (char *)a8;
  id v21 = a9;
  signed int v22 = WORD1(a6) & 7;
  id v50 = a10;
  if (!v20 || v20[238])
  {
    id v23 = 0;
    id v24 = 0;
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);

  if (WeakRetained)
  {
    id v23 = 0;
LABEL_34:
    if ((a6 & 0x20) == 0 && (*((char *)self + 172) & 0x80000000) == 0) {
      a3 = *((double *)v20 + 5);
    }
    goto LABEL_58;
  }
  id v48 = v21;
  v36 = v20;
  id v23 = 0;
  v37 = (id *)v36;
  while (1)
  {
    v38 = v23;
    id v23 = objc_loadWeakRetained(v37 + 34);

    if (v23)
    {
      if ([v23 isInterruptible]) {
        break;
      }
    }
    v39 = (id *)v37[1];

    v37 = v39;
    if (!v39)
    {

      id v23 = 0;
      goto LABEL_50;
    }
  }

  *((unsigned char *)self + 172) = *((unsigned char *)self + 172) & 0x7F | (((a6 & 0x2008) != 0) << 7);
  a6 = [v23 _optionsForNestedLegacyAnimation:a6];
  if ((a6 & 0x20) == 0)
  {
    a3 = v36[5] - a4;
    a4 = v36[6] + a4;
    id v21 = v48;
    if (*((char *)self + 172) < 0) {
      goto LABEL_58;
    }
    char v47 = 1;
    goto LABEL_52;
  }
LABEL_50:
  id v21 = v48;
  if (*((char *)self + 172) < 0) {
    goto LABEL_34;
  }
  char v47 = 0;
LABEL_52:
  v40 = v36;
  do
  {
    id v41 = objc_loadWeakRetained(v40 + 34);
    if (v41) {
      break;
    }
    v42 = (id *)v40[1];

    v40 = v42;
  }
  while (v42);

  if (([v41 isInterruptible] & 1) == 0)
  {
    v43 = [v41 _viewAnimationState];
    [v43 _incrementDidEndCount];
  }
  id v21 = v48;
  if ((v47 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_58:
  if ((a6 & 0x40) == 0)
  {
    signed int v22 = *((_DWORD *)v20 + 22);
    if (v22 == 6)
    {
      id v24 = *((id *)v20 + 25);
      signed int v22 = 6;
      if ((a6 & 0x200) != 0) {
        goto LABEL_64;
      }
      goto LABEL_63;
    }
  }
  id v24 = 0;
  if ((a6 & 0x200) == 0)
  {
LABEL_63:
    id v44 = *((id *)v20 + 24);

    id v19 = v44;
  }
LABEL_64:
  double v45 = *((double *)v20 + 7);
  if (v45 > 0.0) {
    self->_frameInterval = v45;
  }
  if (!CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)(v20 + 64), *MEMORY[0x1E4F39AF0]))
  {
    uint64_t v46 = *((void *)v20 + 8);
    self->_preferredFrameRateRange.float preferred = *((float *)v20 + 18);
    *(void *)&self->_preferredFrameRateRange.float minimum = v46;
    self->_updateReason = *((_DWORD *)v20 + 19);
  }
LABEL_4:
  self->_duration = a3;
  self->_delay = a4;
  float v25 = 3.4028e38;
  if ((a6 & 8) == 0) {
    float v25 = 0.0;
  }
  self->_repeatCount = v25;
  char v26 = a6 >> 1;
  char v27 = *((unsigned char *)self + 172) & 0xE5;
  self->_curve = v22;
  *((unsigned char *)self + 172) = ((a6 & 0xFE) >> 1) & 0xA | (16 * (a6 & 1)) | v27;
  self->_transition = (a6 >> 20) & 7;
  objc_storeStrong((id *)&self->_transitionView, a5);
  *((unsigned char *)self + 172) = (*((unsigned char *)self + 172) & 0xFB | (a6 >> 5) & 4) ^ 4;
  objc_storeStrong((id *)&self->_animationFactory, v19);
  unsigned int v28 = BYTE3(a6) & 0xF;
  if (v28)
  {
    double v29 = 1.0 / (240.0 / (double)(int)(v28 + 1));
    if (v29 > 0.0) {
      self->_frameInterval = v29;
    }
  }
  if (v20 && !v20[238])
  {
    if (v20[235]) {
      unint64_t v30 = a6 | 0x400;
    }
    else {
      unint64_t v30 = a6;
    }
    if (v20[236]) {
      a6 = v30 | 0x1000;
    }
    else {
      a6 = v30;
    }
    char v26 = a6 >> 1;
  }
  self->_allowUserInteraction = v26 & 1;
  self->_allowUserInteractionToCutOffEndOfAnimation = (a6 & 0x400) != 0;
  self->_disallowAdditiveAnimations = (a6 & 0x800) != 0;
  self->_allowsHitTesting = (a6 & 0x1000) != 0;
  v31 = v50;
  v32 = +[UIViewAnimationBlockDelegate animationBlockDelegateWithDuration:a6 options:v21 start:v50 completion:a3];
  objc_msgSend(v32, "set_animationState:", self);
  objc_storeStrong(&self->_delegate, v32);
  self->_willStartSelector = sel__willBeginBlockAnimation_context_;
  self->_didEndSelector = sel__didEndBlockAnimation_finished_context_;
  if (v24) {
    objc_storeStrong((id *)&self->_customCurve, v24);
  }
  if (v19 && v22 == 6)
  {
    if (!self->_customCurve && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v33 = [(_UIBasicAnimationFactory *)self->_animationFactory _timingFunctionForAnimation];
      if (v33) {
        objc_storeStrong((id *)&self->_customCurve, v33);
      }

      v31 = v50;
    }
    if (objc_opt_respondsToSelector()) {
      self->_animationFactoryMakesPerAnimationCustomCurves = 1;
    }
    if (!self->_customCurve)
    {
      if (v20) {
        int64_t v34 = *((void *)v20 + 11);
      }
      else {
        int64_t v34 = 5;
      }
      self->_curve = v34;
    }
  }
}

+ (void)pushViewAnimationState:(id)a3 context:(void *)a4
{
  id v8 = a3;
  id v6 = objc_alloc_init((Class)a1);
  objc_super v7 = v6;
  if (v6) {
    [v6 pushWithViewAnimationID:v8 context:a4];
  }
}

- (void)pushWithViewAnimationID:(id)a3 context:(void *)a4
{
  id v13 = a3;
  id v6 = (NSString *)[v13 copy];
  animationID = self->_animationID;
  self->_animationID = v6;

  self->_context = a4;
  self->_duration = 0.2;
  if (__currentViewAnimationState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(__currentViewAnimationState + 272));
    if (WeakRetained) {
      char v9 = 32;
    }
    else {
      char v9 = *(unsigned char *)(__currentViewAnimationState + 172) & 0x20;
    }
    *((unsigned char *)self + 172) = *((unsigned char *)self + 172) & 0xDF | v9;

    v10 = (void *)__currentViewAnimationState;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong((id *)&self->_nextState, v10);
  objc_storeStrong((id *)&__currentViewAnimationState, self);
  if (__animate)
  {
    id v11 = v13;
    if ([v11 isEqualToString:@"UICalloutBarAnimationFade"])
    {
    }
    else
    {
      char v12 = [v11 isEqualToString:@"UITextSelectionView"];

      if ((v12 & 1) == 0) {
        [(UIViewAnimationState *)self _prepareForViewAnimationAfterPush];
      }
    }
  }
}

- (void)_incrementDidEndCount
{
  ++self->_didEndCount;
  if (self->_belongsToTrackingAnimator)
  {
    nextState = self->_nextState;
    if (nextState) {
      [(UIViewAnimationState *)nextState _incrementDidEndCount];
    }
  }
}

- (void)_prepareForViewAnimationAfterPush
{
  if (qword_1EB25C0F0
    && !self->_belongsToTrackingAnimator
    && [(UIViewAnimationState *)self _runsAlongsideAnimations])
  {
    [(UIViewAnimationState *)self _setAlongsideAnimations:qword_1EB25C0F0];
    BOOL v3 = (void *)qword_1EB25C0F0;
    qword_1EB25C0F0 = 0;
  }
  if (qword_1EB25C0E0)
  {
    if (!self->_trackedAnimations)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      trackedAnimations = self->_trackedAnimations;
      self->_trackedAnimations = v4;
    }
    if (!self->_uuid)
    {
      [(UIViewAnimationState *)self _addAnimationStateForTracking:qword_1EB25C0E0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
      char v7 = *((unsigned char *)self + 172);
      if ((v7 & 0x20) != 0)
      {
        char v8 = 64;
        if (WeakRetained)
        {
          id v10 = WeakRetained;
          BOOL v9 = [WeakRetained isInterruptible] == 0;
          id WeakRetained = v10;
          if (v9) {
            char v8 = 64;
          }
          else {
            char v8 = 0;
          }
          char v7 = *((unsigned char *)self + 172);
        }
      }
      else
      {
        char v8 = 0;
      }
      *((unsigned char *)self + 172) = v7 & 0xBF | v8;
    }
  }
}

- (unsigned)updateReason
{
  return self->_updateReason;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  BOOL belongsToTrackingAnimator = self->_belongsToTrackingAnimator;
  char v7 = self->_nextState;
  if (!self->_animationDidStopSent)
  {
    [(UIViewAnimationState *)self _decrementDidEndCount];
    if (!self->_didEndCount)
    {
      char v8 = [(UIViewAnimationState *)self _outerPropertyAnimator:0];
      if (![v8 _pausesOnCompletion] || *((char *)self + 172) < 0)
      {
        self->_animationDidStopSent = 1;
        if (!self->_animationDidStopForced) {
          [(UIViewAnimationState *)self sendDelegateAnimationDidStop:v14 finished:v4];
        }
        if (v8 && (*((char *)self + 172) & 0x80000000) == 0 && ([v8 isInterruptible] & 1) == 0)
        {
          id v10 = [v8 _viewAnimationState];
          [v10 _animationDidStopWithNilAnimationFinished:v4];
        }
        id delegate = self->_delegate;
        self->_id delegate = 0;

        retainedSelf = self->_retainedSelf;
        if (retainedSelf)
        {
          self->_retainedSelf = 0;
        }
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);

        if (WeakRetained) {
          [(UIViewAnimationState *)self sendDelegateAnimationDidStop:v14 finished:v4];
        }
      }
    }
  }
  if (belongsToTrackingAnimator && v7 != 0) {
    [(UIViewAnimationState *)v7 animationDidStop:v14 finished:v4];
  }
}

- (void)_decrementDidEndCount
{
}

- (BOOL)shouldDecomposeGeometricTypes
{
  return (*((unsigned __int8 *)self + 173) >> 1) & 1;
}

- (void)setDisallowInheritance:(BOOL)a3
{
  self->_disallowInheritance = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)_animationDidStopWithNilAnimationFinished:(BOOL)a3
{
}

- (void)_addAnimationStateForTracking:(id)a3
{
  BOOL v4 = (NSUUID *)a3;
  id v6 = [(id)qword_1EB25C0E8 objectForKey:v4];
  [v6 addObject:self];
  uuid = self->_uuid;
  self->_uuid = v4;
}

- (void)_setAlongsideAnimations:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  id alongsideAnimations = self->_alongsideAnimations;
  self->_id alongsideAnimations = v4;
}

- (BOOL)_runsAlongsideAnimations
{
  return 1;
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  return _CASupportsAnimationForKey(a3);
}

- (id)_outerPropertyAnimator:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (v4)
  {
    p_isa = (id *)&v4->super.isa;
    id WeakRetained = 0;
    while (1)
    {
      char v7 = WeakRetained;
      id WeakRetained = objc_loadWeakRetained(p_isa + 34);

      if (WeakRetained)
      {
        if (!v3 || ([WeakRetained isInterruptible] & 1) != 0) {
          break;
        }
      }
      char v8 = (id *)p_isa[1];

      p_isa = v8;
      if (!v8)
      {
        p_isa = (id *)WeakRetained;
        id WeakRetained = 0;
        break;
      }
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

- (BOOL)isInProcess
{
  return 0;
}

uint64_t __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke(uint64_t a1)
{
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_2;
  v24[3] = &unk_1E52D9F70;
  id v25 = *(id *)(a1 + 32);
  +[UIView performWithoutAnimation:v24];
  v2 = [*(id *)(a1 + 32) _layoutEngine];
  BOOL v3 = [v2 delegate];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(*(void *)(v4 + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_3;
  v15[3] = &unk_1E530FBB8;
  uint64_t v18 = v4;
  int8x16_t v14 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v14.i64[0];
  int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
  id v19 = &v20;
  id v6 = v3;
  id v17 = v6;
  [v5 _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:v15];
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v8 = v21[3];
  if ((unint64_t)(v8 + 1) < *(void *)(a1 + 56)) {
    unint64_t v9 = v8 + 1;
  }
  else {
    unint64_t v9 = *(void *)(a1 + 56);
  }
  while (v7 < v9)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 256) objectAtIndex:v7];
    [v10 _setInAnimatedLayout:0];
    id v11 = [v10 _layoutEngine];
    char v12 = [v11 delegate];
    [v12 _setInAnimatedLayout:0];

    ++v7;
    uint64_t v13 = v21[3];
    if ((unint64_t)(v13 + 1) < *(void *)(a1 + 56)) {
      unint64_t v9 = v13 + 1;
    }
    else {
      unint64_t v9 = *(void *)(a1 + 56);
    }
  }
  [v6 _setInAnimatedLayout:0];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v21[3];

  _Block_object_dispose(&v20, 8);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_propertyAnimator);
  objc_storeStrong((id *)&self->_viewToDeferredAnimationsMap, 0);
  objc_storeStrong((id *)&self->_viewsPendingConstraintBasedAnimation, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_addedCompletions, 0);
  objc_storeStrong(&self->_alongsideAnimations, 0);
  objc_storeStrong((id *)&self->_customCurve, 0);
  objc_storeStrong((id *)&self->_animationFactory, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_trackedAnimations, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_transitionOptions, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_animationID, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)sendDelegateAnimationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_delegate)
  {
    if (self->_didEndSelector)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_23;
      }
      id delegate = self->_delegate;
      if (self->_didEndSelector) {
        didEndSelector = self->_didEndSelector;
      }
      else {
        didEndSelector = 0;
      }
      animationID = self->_animationID;
      char v12 = [NSNumber numberWithBool:v4];
      objc_msgSend(delegate, didEndSelector, animationID, v12, self->_context);
      goto LABEL_14;
    }
    char v9 = objc_opt_respondsToSelector();
    id v10 = self->_delegate;
    if (v9)
    {
      id v11 = self->_animationID;
      char v12 = [NSNumber numberWithBool:v4];
      objc_msgSend(v10, sel_animationDidStop_finished_context_, v11, v12, self->_context);
LABEL_14:

      goto LABEL_23;
    }
    char v13 = objc_opt_respondsToSelector();
    id v14 = self->_delegate;
    if (v13)
    {
      v15 = self->_animationID;
      int8x16_t v16 = [NSNumber numberWithBool:v4];
      [v14 performSelector:sel_animationDidStop_finished_ withObject:v15 withObject:v16];
    }
    else if (objc_opt_respondsToSelector())
    {
      [self->_delegate performSelector:sel_animationDidStop_ withObject:self->_animationID];
    }
  }
LABEL_23:
  while (1)
  {
    addedCompletions = self->_addedCompletions;
    if (!addedCompletions) {
      break;
    }
    uint64_t v18 = (void *)[(NSMutableArray *)addedCompletions copy];
    id v19 = self->_addedCompletions;
    self->_addedCompletions = 0;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v20);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v35 + 1) + 8 * i) + 16))();
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v22);
    }
  }
  if ((*((unsigned char *)self + 172) & 0x40) != 0)
  {
    unint64_t v30 = [(UIViewAnimationState *)self _outerPropertyAnimator:1];
    if (!v30)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__UIViewAnimationState_sendDelegateAnimationDidStop_finished___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
    if (!WeakRetained
      || (char v27 = WeakRetained,
          id v28 = objc_loadWeakRetained((id *)&self->_propertyAnimator),
          char v29 = [v28 _pausesOnCompletion],
          v28,
          v27,
          (v29 & 1) == 0))
    {
      [(UIViewAnimationState *)self _removeAnimationStateFromTrackingMap:1 disableTrackingIfNeeded:(byte_1EB25C09A & 1) == 0];
    }
  }
  if (self->_animationID) {
    v31 = (__CFString *)self->_animationID;
  }
  else {
    v31 = &stru_1ED0E84C0;
  }
  v32 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v31, @"name", self->_delegate, @"delegate", 0);
  v33 = +[NSNotificationCenter uikitInternalCenter]();
  [v33 postNotificationName:@"UIViewAnimationDidStopInternalNotification" object:self userInfo:v32];
}

+ (void)popAnimationState
{
  if (!__currentViewAnimationState) {
    return;
  }
  id v10 = (id)__currentViewAnimationState;
  [v10 pop];
  if (*(void *)(__currentViewAnimationState + 16)) {
    BOOL v3 = *(__CFString **)(__currentViewAnimationState + 16);
  }
  else {
    BOOL v3 = &stru_1ED0E84C0;
  }
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v3, @"name", *((void *)v10 + 4), @"delegate", 0);
  id v5 = +[NSNotificationCenter uikitInternalCenter]();
  [v5 postNotificationName:@"UIViewAnimationDidCommitInternalNotification" object:a1 userInfo:v4];

  id v6 = *(id *)(__currentViewAnimationState + 16);
  objc_storeStrong((id *)&__currentViewAnimationState, *(id *)(__currentViewAnimationState + 8));
  if (!*((_DWORD *)v10 + 42) && (*((unsigned char *)v10 + 173) & 1) == 0)
  {
    [v10 sendDelegateAnimationDidStop:0 finished:1];
    unint64_t v7 = (void *)*((void *)v10 + 4);
    *((void *)v10 + 4) = 0;
  }
  if (!__currentViewAnimationState && qword_1EB25C0E0 && __animate)
  {
    id v8 = v6;
    if (([v8 isEqualToString:@"UICalloutBarAnimationFade"] & 1) == 0)
    {
      char v9 = [v8 isEqualToString:@"UITextSelectionView"];

      if (v9 & 1) != 0 || (byte_1EB25C09A) {
        goto LABEL_16;
      }
      id v8 = (id)qword_1EB25C0E0;
      qword_1EB25C0E0 = 0;
    }
  }
LABEL_16:
  if (!__currentViewAnimationState) {
    [(id)qword_1EB25C108 removeAllObjects];
  }
}

- (void)pop
{
  [(UIViewAnimationState *)self _runAlongsideAnimations];
  [(UIViewAnimationState *)self _finalizeDeferredAnimations];
  transitionView = self->_transitionView;
  if (transitionView)
  {
    id v6 = 0;
    int64_t transition = self->_transition;
    id v8 = @"pageCurl";
    if (!(!v4 & v3))
    {
      switch(transition)
      {
        case 'e':
          goto LABEL_18;
        case 'f':
          goto LABEL_7;
        case 'g':
          id v6 = 0;
          id v8 = @"suckEffect";
          goto LABEL_18;
        case 'h':
          id v6 = 0;
          id v8 = @"spewEffect";
          goto LABEL_18;
        case 'i':
          id v6 = 0;
          id v8 = @"cameraIris";
          goto LABEL_18;
        case 'j':
          id v6 = 0;
          id v8 = @"cameraIrisHollowClose";
          goto LABEL_18;
        case 'k':
          id v6 = 0;
          id v8 = @"cameraIrisHollowOpen";
          goto LABEL_18;
        case 'l':
          id v6 = 0;
          id v8 = @"genieEffect";
          goto LABEL_18;
        default:
          JUMPOUT(0);
      }
    }
    switch(transition)
    {
      case 1:
        id v8 = @"oglFlip";
        id v6 = @"fromLeft";
        goto LABEL_18;
      case 2:
        id v8 = @"oglFlip";
        id v6 = @"fromRight";
        goto LABEL_18;
      case 3:
        goto LABEL_18;
      case 4:
LABEL_7:
        id v6 = 0;
        id v8 = @"pageUnCurl";
        goto LABEL_18;
      case 5:
        id v6 = 0;
        id v8 = @"fade";
        goto LABEL_18;
      case 6:
        id v8 = @"oglFlip";
        id v6 = @"fromTop";
        goto LABEL_18;
      case 7:
        id v8 = @"oglFlip";
        id v6 = @"fromBottom";
LABEL_18:
        char v9 = [MEMORY[0x1E4F39D18] animation];
        [v9 setType:v8];
        [v9 setSubtype:v6];
        [(UIViewAnimationState *)self setAnimationAttributes:v9 skipDelegateAssignment:0];
        double frameInterval = self->_frameInterval;
        if (frameInterval > 0.0) {
          [v9 setFrameInterval:self->_frameInterval];
        }
        if (CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E4F39AF0]))
        {
          if (frameInterval > 0.0) {
            goto LABEL_25;
          }
          LODWORD(v12) = 1123024896;
          LODWORD(v11) = 30.0;
          LODWORD(v13) = 1123024896;
          objc_msgSend(v9, "setPreferredFrameRateRange:", v11, v12, v13);
          uint64_t updateReason = 1048609;
        }
        else
        {
          *(float *)&double v11 = self->_preferredFrameRateRange.minimum;
          *(float *)&double v12 = self->_preferredFrameRateRange.maximum;
          *(float *)&double v13 = self->_preferredFrameRateRange.preferred;
          objc_msgSend(v9, "setPreferredFrameRateRange:", v11, v12, v13);
          uint64_t updateReason = self->_updateReason;
        }
        [v9 setHighFrameRateReason:updateReason];
LABEL_25:
        if ((*((unsigned char *)self + 172) & 4) != 0) {
          [v9 setTransitionFlags:3];
        }
        if (self->_transitionOptions) {
          objc_msgSend(v9, "setOptions:");
        }
        if (+[UIView _shouldTrackActionWithAnimator:v9]) {
          id v15 = +[UIViewPropertyAnimator _trackNonAdditiveAnimationWithAnimator:v9 forLayer:self->_transitionView->_layer forKey:@"transition"];
        }
        [(CALayer *)self->_transitionView->_layer addAnimation:v9 forKey:0];
        if (+[UIView _isAnimationTracking]) {
          [(UIViewAnimationState *)self _trackAnimation:v9 withAnimationKey:@"transition" forKeyPath:@"transition" inLayer:self->_transitionView->_layer];
        }

        transitionView = self->_transitionView;
LABEL_34:
        self->_transitionView = 0;

        break;
      default:
        goto LABEL_34;
    }
  }
  filterView = self->_filterView;
  if (filterView)
  {
    int filter = self->_filter;
    if ((filter & 0xFFFFFFFE) == 0xC8)
    {
      if (filter == 200)
      {
        [(UIView *)filterView bounds];
        double filterValue = self->_filterValue;
        _UIViewCurlUpTransitionToTime(&filterValue, v18, v19);
        int v21 = v20;
        id v22 = objc_alloc(MEMORY[0x1E4F39BC0]);
        uint64_t v23 = (void *)[v22 initWithType:*MEMORY[0x1E4F3A2D0]];
        [v23 setName:@"curl"];
        [v23 setCachesInputImage:1];
        LODWORD(v24) = 1128792064;
        id v25 = [NSNumber numberWithFloat:v24];
        [v23 setValue:v25 forKey:@"inputRadius"];

        LODWORD(v26) = 1083258398;
        char v27 = [NSNumber numberWithFloat:v26];
        [v23 setValue:v27 forKey:@"inputAngle"];

        LODWORD(v28) = v21;
        char v29 = [NSNumber numberWithFloat:v28];
        [v23 setValue:v29 forKey:@"inputTime"];

        unint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObject:v23];
        v31 = [(UIView *)self->_filterView layer];
        [v31 setFilters:v30];
      }
      v32 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.curl.inputTime"];
      [(UIViewAnimationState *)self setAnimationAttributes:v32];
      [v32 setFillMode:*MEMORY[0x1E4F39FB0]];
      if (filter == 200)
      {
        v33 = [NSNumber numberWithFloat:0.0];
        [v32 setFromValue:v33];

        [v32 setToValue:0];
        int64_t v34 = [(UIView *)self->_filterView layer];
        [v34 addAnimation:v32 forKey:0];
      }
      else
      {
        [v32 setFromValue:0];
        [v32 setToValue:0];
        long long v35 = [(UIView *)self->_filterView layer];
        [v35 addAnimation:v32 forKey:0];

        long long v36 = [(UIView *)self->_filterView layer];
        long long v37 = [NSNumber numberWithFloat:0.0];
        [v36 setValue:v37 forKeyPath:@"filters.curl.inputTime"];

        [(UIView *)self->_filterView performSelector:sel__clearAnimationFilters withObject:0 afterDelay:self->_delay + self->_duration];
      }

      filterView = self->_filterView;
    }
    self->_filterView = 0;
  }
  [(UIViewAnimationState *)self _runConstraintBasedLayoutAnimations];
}

- (void)_runAlongsideAnimations
{
  id alongsideAnimations = (void (**)(id, SEL))self->_alongsideAnimations;
  if (alongsideAnimations)
  {
    alongsideAnimations[2](alongsideAnimations, a2);
    id v4 = self->_alongsideAnimations;
    self->_id alongsideAnimations = 0;
  }
}

- (void)_finalizeDeferredAnimations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = self->_viewToDeferredAnimationsMap; i; uint64_t i = self->_viewToDeferredAnimationsMap)
  {
    id v4 = i;
    viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
    self->_viewToDeferredAnimationsMap = 0;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8 * j);
          double v12 = [(NSMapTable *)v6 objectForKey:v11];
          [v12 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_657];
          [v11 _generateDeferredAnimations:v12];
        }
        uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_runConstraintBasedLayoutAnimations
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_viewsPendingConstraintBasedAnimation count])
  {
    uint64_t v27 = 0;
    double v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    unint64_t v3 = [(NSMutableArray *)self->_viewsPendingConstraintBasedAnimation count];
    v28[3] = 0;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; v28[3] = i)
      {
        id v5 = [(NSMutableArray *)self->_viewsPendingConstraintBasedAnimation objectAtIndex:i];
        id v6 = [v5 layer];
        uint64_t v7 = [v6 context];
        if (v7)
        {
          BOOL v8 = 1;
        }
        else
        {
          uint64_t v9 = [v5 _layoutEngine];
          id v10 = [v9 delegate];
          BOOL v8 = v10 != 0;
        }
        if (objc_msgSend(v5, "_is_needsLayout"))
        {
          BOOL v11 = !v8;
          LODWORD(v12) = 1;
        }
        else
        {
          long long v13 = [(id)qword_1EB25C108 objectForKey:v5];
          LODWORD(v12) = [v13 count] != 0;

          BOOL v11 = !v8;
          if (((!v8 | v12) & 1) == 0)
          {
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v14 = [v5 _mutableLayoutArrangements];
            uint64_t v12 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v12)
            {
              uint64_t v15 = *(void *)v24;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v24 != v15) {
                    objc_enumerationMutation(v14);
                  }
                  if ([*(id *)(*((void *)&v23 + 1) + 8 * j) _awaitingAnimationLayoutPass])
                  {
                    LODWORD(v12) = 1;
                    goto LABEL_20;
                  }
                }
                uint64_t v12 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }
LABEL_20:

            BOOL v11 = 0;
          }
        }
        if (!v11)
        {
          if (v12)
          {
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke;
            v18[3] = &unk_1E5306868;
            id v19 = v5;
            int v20 = self;
            int v21 = &v27;
            unint64_t v22 = v3;
            [v19 _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:v18];
          }
        }

        unint64_t i = v28[3] + 1;
      }
    }
    viewsPendingConstraintBasedAnimation = self->_viewsPendingConstraintBasedAnimation;
    self->_viewsPendingConstraintBasedAnimation = 0;

    _Block_object_dispose(&v27, 8);
  }
}

- (void)_removeAnimationStateFromTrackingMap:(BOOL)a3 disableTrackingIfNeeded:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_uuid)
  {
    BOOL v14 = a4;
    uint64_t v15 = objc_msgSend((id)qword_1EB25C0E8, "objectForKey:");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = self->_trackedAnimations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = objc_getAssociatedObject(v11, &unk_1EB25C09C);
          objc_setAssociatedObject(v12, &unk_1EB25C099, 0, (void *)1);
          objc_setAssociatedObject(v11, &unk_1EB25C09C, 0, (void *)1);
          objc_setAssociatedObject(v11, &unk_1EB25C09B, 0, (void *)1);
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_trackedAnimations removeAllObjects];
    if (v4)
    {
      [v15 removeObject:self];
      if (v14 && ![v15 count]) {
        +[UIView _disableAnimationTracking:self->_uuid clearTrackedAnimations:0];
      }
    }
    uuid = self->_uuid;
    self->_uuid = 0;
  }
}

- (void)setAnimationAttributes:(id)a3 skipDelegateAssignment:(BOOL)a4
{
}

uint64_t __39__UIViewAnimationState__addCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIViewAnimationState)nextState
{
  return self->_nextState;
}

+ (void)_addSystemPostAnimationAction:(id)a3
{
  unint64_t v3 = (void (**)(void))a3;
  BOOL v4 = (void *)__currentViewAnimationState;
  BOOL v11 = v3;
  if (__currentViewAnimationState) {
    BOOL v4 = *(void **)(__currentViewAnimationState + 32);
  }
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v5[4])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = (void *)v5[4];
      v5[4] = v6;
    }
    uint64_t v8 = (void *)[v11 copy];
    uint64_t v9 = (void *)v5[4];
    id v10 = _Block_copy(v8);
    [v9 addObject:v10];
  }
  else
  {
    v11[2]();
  }
}

+ (void)_addViewForConstraintBasedAnimation:(id)a3
{
  id v3 = a3;
  if (__currentViewAnimationState)
  {
    id v10 = v3;
    BOOL v4 = [v3 _window];
    if (v4)
    {
      id v5 = *(void **)(__currentViewAnimationState + 256);
      if (!v5)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v7 = *(void **)(__currentViewAnimationState + 256);
        *(void *)(__currentViewAnimationState + 256) = v6;

        id v5 = *(void **)(__currentViewAnimationState + 256);
      }
      if ([v5 count])
      {
        uint64_t v8 = 0;
        while (1)
        {
          id v9 = [*(id *)(__currentViewAnimationState + 256) objectAtIndex:v8];
          if (v9 == v10)
          {

            goto LABEL_16;
          }
          if ([v10 isDescendantOfView:v9]) {
            break;
          }
          if ([v9 isDescendantOfView:v10]) {
            goto LABEL_14;
          }

          if (++v8 >= (unint64_t)[*(id *)(__currentViewAnimationState + 256) count]) {
            goto LABEL_11;
          }
        }
        ++v8;
LABEL_14:
      }
      else
      {
LABEL_11:
        uint64_t v8 = 0;
      }
      [v10 setNeedsLayout];
      [*(id *)(__currentViewAnimationState + 256) insertObject:v10 atIndex:v8];
    }
LABEL_16:

    id v3 = v10;
  }
}

- (BOOL)_hasDeferredAnimationForView:(id)a3 key:(id)a4
{
  viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)viewToDeferredAnimationsMap objectForKey:a3];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8 != 0;
}

- (id)_deferredAnimationForView:(id)a3 key:(id)a4 ignoringKeyFrames:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
  if (!viewToDeferredAnimationsMap)
  {
    BOOL v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v12 = self->_viewToDeferredAnimationsMap;
    self->_viewToDeferredAnimationsMap = v11;

    viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
  }
  long long v13 = [(NSMapTable *)viewToDeferredAnimationsMap objectForKey:v8];
  if (!v13)
  {
    long long v13 = objc_opt_new();
    [(NSMapTable *)self->_viewToDeferredAnimationsMap setObject:v13 forKey:v8];
  }
  BOOL v14 = [v13 objectForKeyedSubscript:v9];
  if (!v14)
  {
    BOOL v14 = [(UIViewAnimationState *)self _createDeferredAnimationForKey:v9 ignoringKeyFrames:v5];
    [v14 setKey:v9];
    [v14 setDuration:self->_duration];
    uint64_t v15 = [v8 _initialValueForKey:v9];
    [v14 setInitialValue:v15];

    [v14 setRepeatCount:self->_repeatCount];
    [v14 setAutoreverses:(*((unsigned __int8 *)self + 172) >> 3) & 1];
    [v13 setObject:v14 forKeyedSubscript:v9];
  }

  return v14;
}

- (id)_createDeferredAnimationForKey:(id)a3 ignoringKeyFrames:(BOOL)a4
{
  BOOL v4 = objc_alloc_init(_UIViewDeferredBasicAnimation);
  return v4;
}

- (BOOL)_shouldStartFromCurrentStateForLayer:(id)a3 key:(id)a4 forView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
  if (WeakRetained)
  {
    BOOL v5 = [v9 animationForKey:v10];
    if (!v5)
    {
      LOBYTE(v13) = 0;
      goto LABEL_9;
    }
  }
  if ((*((unsigned char *)self + 172) & 2) != 0 && [v9 hasBeenCommitted])
  {
    int v13 = ![(UIViewAnimationState *)self _shouldAnimateAdditivelyForKey:v10 onLayer:v9 forView:v11];
    BOOL v14 = v13;
    if (!WeakRetained) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  LOBYTE(v13) = 0;
  BOOL v14 = 0;
  if (WeakRetained)
  {
LABEL_9:

    BOOL v14 = v13;
  }
LABEL_10:

  return v14;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UIViewAnimationState *)self animationForLayer:v8 forKey:v9 forView:v10];
  if (!v11)
  {
    long long v18 = 0;
    goto LABEL_16;
  }
  uint64_t v12 = [(UIViewAnimationState *)self _outerPropertyAnimator:1];
  BOOL v13 = [(UIViewAnimationState *)self _shouldAnimateAdditivelyForKey:v9 onLayer:v8 forView:v10];
  BOOL v14 = v13;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (([v11 isAdditive] | v14) & 1) == 0)
    {
      memset(v21, 0, 24);
      uint64_t v15 = [v12 _previousAnimatorForKeyPath:v9 inLayer:v8 compoundKeys:v21];
      long long v16 = v15;
      if (v15 && v15 != v12) {
        [v15 _untrackPropertyAnimationsForKeys:v21 inLayer:v8];
      }

      for (uint64_t i = 2; i != -1; --i)
    }
    if ([(UIViewAnimationState *)self _isTrackingEnabled]) {
      [v11 setRemovedOnCompletion:0];
    }
  }
  else if (!v13)
  {
    long long v19 = v11;
    goto LABEL_15;
  }
  long long v19 = [[_UIViewAdditiveAnimationAction alloc] initWithPendingAnimation:v11 withAnimationObject:v12 forView:v10];
LABEL_15:
  long long v18 = v19;

LABEL_16:
  return v18;
}

- (id)animationForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10 && (*((void *)v10 + 12) & 0x4000000) != 0)
  {
    long long v17 = 0;
    goto LABEL_36;
  }
  uint64_t v12 = self->_customCurve;
  animationFactory = self->_animationFactory;
  if (animationFactory)
  {
    uint64_t v14 = [(_UIBasicAnimationFactory *)animationFactory _basicAnimationForView:v11 withKeyPath:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
    if (WeakRetained)
    {
      uint64_t v16 = [(id)v14 timingFunction];

      uint64_t v12 = v16;
    }
    else if (!v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = _UIGetAnimationCurveSpline(3uLL, v18, v19, v20, v21);
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    if (self->_animationFactoryMakesPerAnimationCustomCurves)
    {
      uint64_t v22 = [(_UIBasicAnimationFactory *)self->_animationFactory _timingFunctionForAnimationInView:v11 withKeyPath:v9];

      uint64_t v12 = v22;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (!(v14 | v12))
  {
    if (self->_curve != 7)
    {
      if (![(UIViewAnimationState *)self _shouldStartFromCurrentStateForLayer:v8 key:v9 forView:v11])goto LABEL_30; {
      goto LABEL_28;
      }
    }
    _UILoadDefaultSpringParameters();
    uint64_t v14 = +[UIViewSpringAnimationState defaultSpringAnimationForKey:v9 mass:*(double *)&_UIViewDefaultSpringMass stiffness:*(double *)&_UIViewDefaultSpringStiffness damping:*(double *)&_UIViewDefaultSpringDamping velocity:0.0];
  }
  BOOL v23 = [(UIViewAnimationState *)self _shouldStartFromCurrentStateForLayer:v8 key:v9 forView:v11];
  if (v14)
  {
    if (!v23) {
      goto LABEL_23;
    }
    long long v24 = [v8 implicitAnimationForKeyPath:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = [v24 fromValue];
      [(id)v14 setFromValue:v25];
    }
    if (!v24)
    {
LABEL_23:
      long long v26 = [v8 valueForKeyPath:v9];
      [(id)v14 setFromValue:v26];

      long long v24 = 0;
    }
    id v27 = (id)v14;
    long long v17 = v27;
    goto LABEL_34;
  }
  if (!v23)
  {
LABEL_30:
    if (v11) {
      [v11 _basicAnimationWithKeyPath:v9];
    }
    else {
    long long v17 = [(UIViewAnimationState *)self _defaultAnimationForKey:v9];
    }
    long long v24 = [v8 valueForKeyPath:v9];
    [v17 setFromValue:v24];
    id v27 = 0;
LABEL_34:

    goto LABEL_35;
  }
LABEL_28:
  double v28 = [v8 implicitAnimationForKeyPath:v9];
  long long v17 = (void *)[v28 copy];

  if (!v17) {
    goto LABEL_30;
  }
  id v27 = 0;
LABEL_35:
  [(UIViewAnimationState *)self configureAnimation:v17 forLayer:v8 forKey:v9];
  [(UIViewAnimationState *)self setAnimationAttributes:v17 skipDelegateAssignment:0 customCurve:v12];

LABEL_36:
  return v17;
}

- (void)setAnimationAttributes:(id)a3 skipDelegateAssignment:(BOOL)a4 customCurve:(id)a5
{
  id v41 = a3;
  id v8 = (CAMediaTimingFunction *)a5;
  if (!v41) {
    goto LABEL_41;
  }
  double duration = self->_duration;
  float v10 = UIAnimationDragCoefficient();
  double v11 = v10;
  if (duration == 0.0) {
    double duration = 0.001;
  }
  uint64_t v12 = self->_customCurve;
  unint64_t curve = self->_curve;
  if (curve == 7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    uint64_t v12 = 0;
    id v8 = 0;
    double duration = *(double *)&_UIViewDefaultSpringDuration;
    unint64_t curve = 3;
  }
  else if (v10 != 1.0 && duration > 0.001)
  {
    uint64_t v14 = +[UIViewPropertyAnimator _getPropertyAnimationForState:self];
    uint64_t v15 = v41;
    if (v14)
    {
      [v14 _drag];
      double v11 = 1.0;
      double v17 = 1.0 / v16;
      *(float *)&double v17 = v17;
      [v41 setSpeed:v17];
      uint64_t v15 = v41;
    }
    id v18 = v15;
    float v19 = UIAnimationDragCoefficient();
    if (v19 == 1.0)
    {

      float v25 = duration;
      double duration = v11 * v25;
    }
    else
    {
      double v20 = v19;
      [v18 speed];
      double v22 = fabs(v21 + -1.0 / v20);

      float v23 = duration;
      double v24 = v11 * v23;
      if (v22 >= 0.00000011920929) {
        double duration = v24;
      }
    }
  }
  double frameInterval = self->_frameInterval;
  if (frameInterval > 0.0) {
    [v41 setFrameInterval:self->_frameInterval];
  }
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E4F39AF0]))
  {
    *(float *)&double v27 = self->_preferredFrameRateRange.minimum;
    *(float *)&double v28 = self->_preferredFrameRateRange.maximum;
    *(float *)&double v29 = self->_preferredFrameRateRange.preferred;
    objc_msgSend(v41, "setPreferredFrameRateRange:", v27, v28, v29);
    uint64_t updateReason = self->_updateReason;
    goto LABEL_23;
  }
  uint64_t v30 = v41;
  if (frameInterval <= 0.0)
  {
    LODWORD(v28) = 1123024896;
    LODWORD(v27) = 30.0;
    LODWORD(v29) = 1123024896;
    objc_msgSend(v41, "setPreferredFrameRateRange:", v27, v28, v29);
    uint64_t updateReason = 1048609;
LABEL_23:
    [v41 setHighFrameRateReason:updateReason];
    uint64_t v30 = v41;
  }
  [v30 setDuration:duration];
  long long v36 = v8;
  if (v8 || (long long v36 = v12) != 0)
  {
    [v41 setTimingFunction:v36];
  }
  else
  {
    uint64_t v40 = _UIGetAnimationCurveSpline(curve, v32, v33, v34, v35);
    [v41 setTimingFunction:v40];
  }
  double delay = self->_delay;
  double start = self->_start;
  if (delay > 0.0 && start == 0.0)
  {
    [v41 setBeginTime:v11 * delay];
    [v41 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
LABEL_32:
    v39 = v41;
    goto LABEL_33;
  }
  v39 = v41;
  if (start > 0.0)
  {
    [v41 setBeginTime:v11 * delay + start];
    goto LABEL_32;
  }
LABEL_33:
  [v39 setFillMode:*MEMORY[0x1E4F39FA0]];
  if (self->_repeatCount > 0.0) {
    objc_msgSend(v41, "setRepeatCount:");
  }
  if ((*((unsigned char *)self + 172) & 8) != 0) {
    [v41 setAutoreverses:1];
  }
  if (!a4)
  {
    [v41 setDelegate:self];
    [(UIViewAnimationState *)self _incrementDidEndCount];
    if (self->_didEndCount == 1) {
      objc_storeStrong((id *)&self->_retainedSelf, self);
    }
  }

LABEL_41:
}

- (void)configureAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v8 isEqualToString:@"contents"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v7 implicitAnimationForKeyPath:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v10 = [v9 fromValue];
        [v11 setFromValue:v10];
      }
    }
  }
}

- (BOOL)_shouldAnimateAdditivelyForKey:(id)a3 onLayer:(id)a4 forView:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_disallowAdditiveAnimations)
  {
    uint64_t v12 = _normalizedAnimationKey(v8);
    BOOL v13 = v12;
    if (v10) {
      int isAdditivelyAnimatableKeyForLayer = [v10 _shouldAnimatePropertyAdditivelyWithKey:v12];
    }
    else {
      int isAdditivelyAnimatableKeyForLayer = _isAdditivelyAnimatableKeyForLayer(v12, v9);
    }
    int v15 = isAdditivelyAnimatableKeyForLayer;
    int v16 = dyld_program_sdk_at_least();
    if (self->_animationFactory)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        BOOL v11 = 0;
LABEL_33:

        goto LABEL_34;
      }
      int v17 = [(_UIBasicAnimationFactory *)self->_animationFactory _shouldAnimateAdditivelyForView:v10 withKeyPath:v8] ^ 1;
    }
    else
    {
      LOBYTE(v17) = 0;
    }
    BOOL v11 = 0;
    if ((v15 & v16) == 1 && (v17 & 1) == 0)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v18 = [v9 animationKeys];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        double v29 = v13;
        id v30 = v10;
        uint64_t v21 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            float v23 = objc_msgSend(v9, "animationForKey:", *(void *)(*((void *)&v31 + 1) + 8 * i), v29, v30);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v23;
              float v25 = [v24 keyPath];
              if ([v25 isEqualToString:v8])
              {
                if (![v24 isAdditive])
                {

LABEL_30:
                  BOOL v11 = 0;
                  goto LABEL_31;
                }
                [v24 repeatCount];
                float v27 = v26;

                if (v27 > 0.0) {
                  goto LABEL_30;
                }
              }
              else
              {
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v20) {
            continue;
          }
          break;
        }
        BOOL v11 = 1;
LABEL_31:
        BOOL v13 = v29;
        id v10 = v30;
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    goto LABEL_33;
  }
  BOOL v11 = 0;
LABEL_34:

  return v11;
}

- (id)_defaultAnimationForKey:(id)a3
{
  return (id)[MEMORY[0x1E4F39B48] animationWithKeyPath:a3];
}

- (void)_trackAnimation:(id)a3 nonAdditiveAnimation:(id)a4 withAnimationKey:(id)a5 forKeyPath:(id)a6 inLayer:(id)a7
{
  id v59 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([(UIViewAnimationState *)self _isTrackingEnabled])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      if (!v13 || !v14) {
        goto LABEL_58;
      }
LABEL_10:
      int v17 = +[UIViewPropertyAnimator _propertyAnimatorWithUUID:qword_1EB25C0E0];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      if (!v17 || (int v19 = isKindOfClass, objc_opt_class(), ((objc_opt_isKindOfClass() | v19) & 1) == 0))
      {
        if (v12)
        {
          id v24 = objc_getAssociatedObject(v15, &unk_1EB25C099);
          if (!v24)
          {
            id v24 = objc_opt_new();
            objc_setAssociatedObject(v15, &unk_1EB25C099, v24, (void *)1);
          }
          [v24 setObject:v12 forKeyedSubscript:v14];
        }
        id v22 = v12;
        if (!v17) {
          goto LABEL_57;
        }
        goto LABEL_54;
      }
      uint64_t v20 = [v17 _originalFromValueForKey:v14 inLayer:v15];
      if (v19) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = v59;
      }
      id v22 = v21;

      if (v20)
      {
        if (v22 && [v22 isAdditive])
        {
          float v23 = [v15 animationForKey:v14];
          if (!v23)
          {
            if ([v14 hasPrefix:@"position"])
            {
              float v23 = [v15 animationForKey:@"position.x"];
            }
            else
            {
              float v23 = 0;
            }
          }
          uint64_t v36 = objc_msgSend(v23, "beginTimeMode", v23);
          int v37 = [v36 isEqualToString:*MEMORY[0x1E4F39D60]];

          if (v37)
          {
            [v15 convertTime:0 fromLayer:CACurrentMediaTime()];
            double v39 = v38;
            uint64_t v40 = v58;
            [v58 beginTime];
            double v42 = v39 - v41;
            [v58 speed];
            double v44 = v42 * v43;
            [v58 timeOffset];
            double v46 = v44 - v45;
            [v17 duration];
            double v48 = v46 / v47;
            if (v48 > 1.0) {
              double v48 = 1.0;
            }
          }
          else
          {
            [v22 beginTime];
            double v50 = v49;
            [v17 duration];
            double v48 = v50 / v51;
            uint64_t v40 = v58;
          }
          [v17 _setAdditiveOffset:v13 forKey:v15 inLayer:v48];
        }
        goto LABEL_53;
      }
      if ([v13 hasPrefix:@"UIPacingAnimationForAnimatorsKey"])
      {
        uint64_t v20 = 0;
        goto LABEL_53;
      }
      if (v19)
      {
        float v25 = [v59 values];
        uint64_t v20 = [v25 objectAtIndex:0];
      }
      else
      {
        if (([v59 isAdditive] & 1) == 0)
        {
          uint64_t v20 = [v59 fromValue];
LABEL_35:
          [v17 _setOriginalFromValue:v20 forKey:v14 inLayer:v15];
          if ([v17 state] == 1)
          {
            [v59 beginTime];
            double v28 = v27;
            if (([v17 _isStarting] & 1) != 0
              || ([v17 isRunning] & 1) == 0 && (objc_msgSend(v17, "fractionComplete"), v32 <= 0.001))
            {
              if (![v17 _isStarting] || v28 <= 0.0) {
                goto LABEL_53;
              }
              [v17 _dragAdjustedDuration];
              double v30 = v28 / v29;
              long long v31 = v17;
            }
            else
            {
              [(UIViewAnimationState *)self _canonicalTrackedUnpacedFractionComplete];
              double v34 = v33;
              if (v28 > 0.0)
              {
                [v17 _dragAdjustedDuration];
                double v34 = v34 + v28 / v35;
              }
              long long v31 = v17;
              double v30 = v34;
            }
            [v31 _setAdditiveOffset:v13 forKey:v15 inLayer:v30];
          }
LABEL_53:

LABEL_54:
          if (([v17 _addedPacingAnimation] & 1) == 0)
          {
            v52 = [NSNumber numberWithFloat:0.0];
            v53 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"uiFractionalProgress"];
            [v53 setFromValue:v52];
            LODWORD(v54) = 1120403456;
            v55 = [NSNumber numberWithFloat:v54];
            [v53 setToValue:v55];

            [v17 _setOriginalFromValue:v52 forKey:@"uiFractionalProgress" inLayer:v15];
            v56 = [v17 _viewAnimationState];
            [v56 setAnimationAttributes:v53 skipDelegateAssignment:0 customCurve:0];
            [v53 setRemovedOnCompletion:0];
            v57 = UniqueAnimationKeyForLayer(v15, @"UIPacingAnimationForAnimatorsKey", 0);
            [v15 addAnimation:v53 forKey:v57];
            [v17 _setAddedPacingAnimation:1 animationKey:v57];
            [v56 _trackObject:v53 withAnimationPropertyName:v57 inLayer:v15];
          }
          id v12 = v22;
LABEL_57:
          [(UIViewAnimationState *)self _trackObject:v59 withAnimationPropertyName:v13 inLayer:v15];

          goto LABEL_58;
        }
        float v25 = [v15 valueForKeyPath:v14];
        float v26 = [v59 fromValue];
        uint64_t v20 = objc_msgSend(v25, "CA_addValue:multipliedBy:", v26, 1);
      }
      goto LABEL_35;
    }
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();
    if (v13 && v14 && (v16 & 1) != 0) {
      goto LABEL_10;
    }
  }
LABEL_58:
}

- (BOOL)_isTrackingEnabled
{
  return self->_uuid && self->_trackedAnimations != 0;
}

- (void)_trackObject:(id)a3 withAnimationPropertyName:(id)a4 inLayer:(id)a5
{
  id v8 = a4;
  id object = a3;
  objc_setAssociatedObject(object, &unk_1EB25C09C, a5, (void *)1);
  objc_setAssociatedObject(object, &unk_1EB25C09B, v8, (void *)1);

  [(NSMutableArray *)self->_trackedAnimations addObject:object];
}

- (double)_canonicalTrackedUnpacedFractionComplete
{
  id v10 = 0;
  id v3 = [(UIViewAnimationState *)self _canonicalTrackedLayerAnimationInLayer:&v10];
  id v4 = v10;
  BOOL v5 = [v3 beginTimeMode];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F39D60]];

  double v7 = -1.0;
  if (v6)
  {
    [v3 duration];
    -[UIViewAnimationState _unpacedFractionCompleteForAnimation:inLayer:duration:](self, "_unpacedFractionCompleteForAnimation:inLayer:duration:", v3, v4);
    double v7 = v8;
  }

  return v7;
}

- (id)_canonicalTrackedLayerAnimationInLayer:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend((id)qword_1EB25C0E8, "objectForKeyedSubscript:", self->_uuid, 0);
  BOOL v5 = (void *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _trackedAnimations];
        if ([v8 count])
        {
          id v9 = [v8 objectAtIndex:0];
          if (v9)
          {
            id v10 = v9;
            BOOL v11 = objc_getAssociatedObject(v9, &unk_1EB25C09B);
            id v12 = objc_getAssociatedObject(v10, &unk_1EB25C09C);
            if ([v12 hasBeenCommitted])
            {
              BOOL v5 = [v12 animationForKey:v11];
              if (v12) {
                *a3 = v12;
              }

              goto LABEL_16;
            }
          }
        }
      }
      BOOL v5 = (void *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v5;
}

- (id)_trackedAnimations
{
  return self->_trackedAnimations;
}

- (void)_transferAnimationToTrackingAnimator:(id)a3
{
  id v5 = a3;
  int v6 = dyld_program_sdk_at_least();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);

  if (v6)
  {
    if (!WeakRetained)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:1137 description:@"Attempting to transfer an animation to an animation state that does not belong to a property animator."];
    }
  }
  else if (!WeakRetained)
  {
    long long v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C0F8) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Attempting to transfer an animation to an animation state that does not belong to a property animator.", buf, 2u);
    }
  }
  int v9 = dyld_program_sdk_at_least();
  id v10 = [v5 delegate];
  nextState = self->_nextState;

  if (v9)
  {
    if (v10 != nextState)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:1138 description:@"Attempting to transfer an animation to an animation state that is not a direct child of the animation's animation state."];
    }
  }
  else if (v10 != nextState)
  {
    long long v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C100) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Attempting to transfer an animation to an animation state that is not a direct child of the animation's animation state.", v19, 2u);
    }
  }
  if (!self->_belongsToTrackingAnimator)
  {
    id v13 = self->_nextState;
    self->_allowsHitTesting = v13->_allowsHitTesting;
    self->_allowUserInteractionToCutOffEndOfAnimation = v13->_allowUserInteractionToCutOffEndOfAnimation;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id delegate = self->_delegate;
      long long v15 = self->_nextState->_delegate;
      delegate[12] = v15[12];
      delegate[9] = v15[9];
      delegate[11] = v15[11];
    }
    self->_BOOL belongsToTrackingAnimator = 1;
    objc_storeStrong((id *)&self->_retainedSelf, self);
  }
  [v5 setDelegate:self];
  [v5 setRemovedOnCompletion:0];
  ++self->_didEndCount;
}

- (void)_trackAnimation:(id)a3 withAnimationKey:(id)a4 forKeyPath:(id)a5 inLayer:(id)a6
{
}

- (void)animationDidStart:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)self + 172) & 1) == 0 && !self->_animationDidStopSent && !self->_animationDidStopForced)
  {
    *((unsigned char *)self + 172) |= 1u;
    if (self->_delegate)
    {
      context = (const char *)self->_context;
      id v11 = v4;
      if (!self->_willStartSelector)
      {
        if (objc_opt_respondsToSelector())
        {
          [self->_delegate performSelector:sel_animationWillStart_context_ withObject:self->_animationID withObject:context];
        }
        else
        {
          char v9 = objc_opt_respondsToSelector();
          id v4 = v11;
          if ((v9 & 1) == 0) {
            goto LABEL_4;
          }
          [self->_delegate performSelector:sel_animationWillStart_ withObject:self->_animationID];
        }
LABEL_21:
        id v4 = v11;
        goto LABEL_4;
      }
      char v7 = objc_opt_respondsToSelector();
      id v4 = v11;
      if (v7)
      {
        if (self->_willStartSelector) {
          willStartSelector = self->_willStartSelector;
        }
        else {
          willStartSelector = 0;
        }
        _UIPerformVoidSelector2(self->_delegate, willStartSelector, (const char *)self->_animationID, context);
        goto LABEL_21;
      }
    }
  }
LABEL_4:
  if (self->_belongsToTrackingAnimator)
  {
    nextState = self->_nextState;
    if (nextState)
    {
      id v10 = v4;
      -[UIViewAnimationState animationDidStart:](nextState, "animationDidStart:");
      id v4 = v10;
    }
  }
}

- (void)_removeAnimationStateFromTrackingMap:(BOOL)a3
{
}

- (void)_setCustomCurve:(id)a3
{
}

uint64_t __51__UIViewAnimationState__finalizeDeferredAnimations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _finalize];
}

- (BOOL)_addCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__UIViewAnimationState__addCompletion___block_invoke;
  v7[3] = &unk_1E530FBE0;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(UIViewAnimationState *)self _addCompletionWithPosition:v7];

  return (char)self;
}

- (int)_didEndCount
{
  return self->_didEndCount;
}

- (BOOL)_addCompletionWithPosition:(id)a3
{
  id v4 = a3;
  addedCompletions = self->_addedCompletions;
  if (!addedCompletions)
  {
    int v6 = (NSMutableArray *)objc_opt_new();
    char v7 = self->_addedCompletions;
    self->_addedCompletions = v6;

    addedCompletions = self->_addedCompletions;
  }
  id v8 = (void *)[v4 copy];
  [(NSMutableArray *)addedCompletions addObject:v8];

  return 1;
}

- (id)_updateAnimationFrameWithAnimationProperties:(id)a3
{
  id v4 = (_UIViewAnimationFrame *)a3;
  if (!v4) {
    id v4 = objc_alloc_init(_UIViewAnimationFrame);
  }
  [(_UIViewAnimationFrame *)v4 setStartTime:0.0];
  [(_UIViewAnimationFrame *)v4 setDuration:self->_duration];
  return v4;
}

void __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_3(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  for (uint64_t i = *(void *)(a1 + 32); v2 < [*(id *)(i + 256) count]; uint64_t i = *(void *)(a1 + 32))
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 256) objectAtIndex:v2];
    if (![v4 isDescendantOfView:*(void *)(a1 + 40)])
    {

      break;
    }
    [v4 _setNeedsUpdateConstraintsNeedingLayout:0];
    [v4 _setInAnimatedLayout:1];
    id v5 = [v4 _layoutEngine];
    int v6 = [v5 delegate];
    [v6 _setInAnimatedLayout:1];

    [v4 _flushConstraintsPendingAnimatedChanges];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v2;

    ++v2;
  }
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  if (!objc_msgSend(*(id *)(a1 + 48), "_is_needsLayout") || (id v7 = *(id *)(a1 + 48)) == 0)
  {
    if ([*(id *)(a1 + 40) _hostsLayoutEngine])
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [*(id *)(a1 + 40) superview];
      if (v7)
      {
        id v8 = v7;
        id v9 = 0;
        do
        {
          id v12 = v9;
          if (v8 == *(void **)(a1 + 48)) {
            break;
          }
          if (objc_msgSend(v8, "_is_needsLayout"))
          {
            id v10 = v8;

            id v12 = v10;
          }
          uint64_t v11 = [v8 superview];

          id v8 = (void *)v11;
          id v9 = v12;
        }
        while (v11);

        id v7 = v12;
      }
    }
  }
  id v13 = v7;
  [*(id *)(a1 + 48) _setInAnimatedLayout:1];
  [v13 layoutIfNeeded];
}

- (void)_performWithCompletionCallbacksDisabledOnPop:(id)a3
{
  char v4 = *((unsigned char *)self + 173);
  *((unsigned char *)self + 173) = v4 | 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *((unsigned char *)self + 173) = *((unsigned char *)self + 173) & 0xFE | v4 & 1;
}

- (BOOL)_isKeyframeAnimation
{
  return 0;
}

- (void)_transformIntoAdditiveAnimationAndNoteOriginal:(id)a3 inLayer:(id)a4 animationKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 isAdditive] & 1) == 0 && !self->_disallowAdditiveAnimations)
  {
    uint64_t v11 = [v8 keyPath];
    id v12 = [v9 delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v9 delegate];

      if (v13)
      {
        if (([v13 _shouldAnimatePropertyAdditivelyWithKey:v11] & 1) == 0) {
          goto LABEL_23;
        }
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v13 = 0;
    if (!_isAdditivelyAnimatableKeyForLayer(v11, v9))
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_9:
    long long v14 = [v8 toValue];
    long long v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      long long v17 = [v8 keyPath];
      id v16 = [v9 valueForKeyPath:v17];
    }
    id v18 = [v8 fromValue];
    uint64_t v19 = [v8 toValue];

    if (v19)
    {
      if ([v10 hasPrefix:@"position"]) {
        [v16 CGPointValue];
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __92__UIViewAnimationState__transformIntoAdditiveAnimationAndNoteOriginal_inLayer_animationKey___block_invoke;
      v31[3] = &unk_1E52DCB30;
      id v32 = v9;
      id v33 = v16;
      id v34 = v8;
      +[UIView performWithoutAnimation:v31];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v10 hasPrefix:@"position"]) {
      goto LABEL_22;
    }
    [v16 CGPointValue];
    double v21 = v20;
    double v23 = v22;
    [v18 CGPointValue];
    double v25 = v24;
    double v27 = v26;
    if (([v10 hasSuffix:@".x"] & 1) == 0)
    {
      if (![v10 hasSuffix:@".y"])
      {
LABEL_22:
        double v29 = objc_msgSend(v18, "CA_addValue:multipliedBy:", v16, 0xFFFFFFFFLL);
        [v8 setAdditive:1];
        [v8 setFromValue:v29];
        double v30 = objc_msgSend(v16, "CA_addValue:multipliedBy:", v16, 0xFFFFFFFFLL);
        [v8 setToValue:v30];

        goto LABEL_23;
      }
      double v21 = v25;
      double v27 = v23;
    }
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v21, v27);

    id v16 = (id)v28;
    goto LABEL_22;
  }
LABEL_24:
}

void __92__UIViewAnimationState__transformIntoAdditiveAnimationAndNoteOriginal_inLayer_animationKey___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) keyPath];
  [v1 setValue:v2 forKeyPath:v3];
}

- (double)_unpacedFractionCompleteForAnimation:(id)a3 inLayer:(id)a4 duration:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  double v10 = -1.0;
  if (v7)
  {
    if ([v8 hasBeenCommitted])
    {
      uint64_t v11 = [v7 beginTimeMode];
      int v12 = [v11 isEqualToString:*MEMORY[0x1E4F39D60]];

      double v10 = 0.0;
      if (v12)
      {
        if (a5 == 0.0)
        {
          [v7 duration];
          a5 = v13;
        }
        [v9 convertTime:0 fromLayer:CACurrentMediaTime()];
        double v15 = v14;
        [v7 beginTime];
        double v17 = v15 - v16;
        [v7 speed];
        double v19 = v17 * fabsf(v18);
        [v7 timeOffset];
        double v21 = v19 - v20;
        if (v21 > 0.0)
        {
          double v22 = v21 / a5;
          if (v22 <= 1.0) {
            double v10 = v22;
          }
          else {
            double v10 = 1.0;
          }
        }
      }
    }
  }

  return v10;
}

- (double)_elapsedTimeForCanonicallyTrackedAnimation
{
  id v16 = 0;
  uint64_t v2 = [(UIViewAnimationState *)self _canonicalTrackedLayerAnimationInLayer:&v16];
  id v3 = v16;
  char v4 = v3;
  double v5 = -1.0;
  if (v2)
  {
    if (v3)
    {
      if ([v3 hasBeenCommitted])
      {
        int v6 = [v2 beginTimeMode];
        int v7 = [v6 isEqualToString:*MEMORY[0x1E4F39D60]];

        if (v7)
        {
          [v4 convertTime:0 fromLayer:CACurrentMediaTime()];
          double v9 = v8;
          [v2 beginTime];
          double v11 = v9 - v10;
          [v2 speed];
          double v13 = v11 * fabsf(v12);
          [v2 timeOffset];
          double v5 = v13 - v14;
        }
      }
    }
  }

  return v5;
}

+ (void)_addConstraintPendingAnimation:(id)a3 container:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6)
  {
    [a1 _addViewForConstraintBasedAnimation:v6];
    int v7 = (void *)qword_1EB25C108;
    if (!qword_1EB25C108)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
      double v9 = (void *)qword_1EB25C108;
      qword_1EB25C108 = v8;

      int v7 = (void *)qword_1EB25C108;
    }
    id v10 = [v7 objectForKey:v6];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [(id)qword_1EB25C108 setObject:v10 forKey:v6];
    }
    [v10 addObject:v11];
  }
}

- (void)setAnimationAttributes:(id)a3
{
}

- (void)_removeLastCompletion
{
}

uint64_t __62__UIViewAnimationState_sendDelegateAnimationDidStop_finished___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAnimationStateFromTrackingMap:1 disableTrackingIfNeeded:(byte_1EB25C09A & 1) == 0];
}

- (void)sendDelegateDidStopManually:(BOOL)a3
{
  if (!self->_animationDidStopSent && !self->_animationDidStopForced)
  {
    BOOL v4 = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [self->_delegate _setForcingImmediateCompletion:1];
    }
    [(UIViewAnimationState *)self sendDelegateAnimationDidStop:0 finished:v4];
    self->_animationDidStopForced = 1;
    if (self->_belongsToTrackingAnimator)
    {
      nextState = self->_nextState;
      if (nextState)
      {
        [(UIViewAnimationState *)nextState sendDelegateDidStopManually:v4];
      }
    }
  }
}

- (void)_setFinishedPosition:(int64_t)a3
{
  self->_finishedPosition = a3;
  if (self->_belongsToTrackingAnimator)
  {
    nextState = self->_nextState;
    if (nextState) {
      -[UIViewAnimationState _setFinishedPosition:](nextState, "_setFinishedPosition:");
    }
  }
}

- (BOOL)_allowsUserInteraction
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id delegate = self->_delegate;
  return [delegate _allowsUserInteraction];
}

- (BOOL)_allowsUserInteractionToCutOffEndOfAnimation
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id delegate = self->_delegate;
  return [delegate _allowsUserInteractionToCutOffEndOfAnimation];
}

- (BOOL)_allowsHitTesting
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id delegate = self->_delegate;
  return [delegate _allowsHitTesting];
}

- (void)_acceptEarlyAnimationCutoff:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_animationDidStopSent && self->_allowUserInteractionToCutOffEndOfAnimation)
  {
    self->_animationDidStopSent = 1;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    double v5 = [(id)qword_1EB25C0E8 objectForKeyedSubscript:self->_uuid];
    id v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * i) _acceptEarlyAnimationCutoff:v4];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v8);
    }

    if (self->_belongsToTrackingAnimator)
    {
      nextState = self->_nextState;
      if (nextState) {
        [(UIViewAnimationState *)nextState _acceptEarlyAnimationCutoff:v4];
      }
    }
    objc_msgSend((id)qword_1EB25C0E8, "objectForKeyedSubscript:", self->_uuid, v4);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(obj);
          }
          double v13 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          double v14 = self;
          double v15 = [(UIViewAnimationState *)self _trackedAnimations];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              for (uint64_t k = 0; k != v17; ++k)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                double v20 = *(void **)(*((void *)&v29 + 1) + 8 * k);
                double v21 = objc_getAssociatedObject(v20, &unk_1EB25C09B);
                double v22 = objc_getAssociatedObject(v20, &unk_1EB25C09C);
                [v22 removeAnimationForKey:v21];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
            }
            while (v17);
          }

          [v13 _incrementDidEndCount];
          self = v14;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v28);
    }
    id v4 = v25;
    [(UIViewAnimationState *)self sendDelegateAnimationDidStop:v25 finished:1];
    id delegate = self->_delegate;
    self->_id delegate = 0;

    retainedSelf = self->_retainedSelf;
    if (retainedSelf)
    {
      self->_retainedSelf = 0;
    }
  }
}

- (void)_untrackAnimationsWithIdentifier:(id)a3 keyPath:(id)a4 inLayer:(id)a5 removeFromLayer:(BOOL)a6
{
  BOOL v30 = a6;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v10 = a4;
  id v32 = a5;
  [(id)qword_1EB25C0E8 objectForKeyedSubscript:self->_uuid];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v11;
        float v12 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v11), "_trackedAnimations", v25);
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v34 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass)
              {
                double v20 = [v18 keyPath];
                if ([v20 isEqualToString:v10])
                {

LABEL_22:
                  uint64_t v23 = objc_getAssociatedObject(v18, &unk_1EB25C09C);
                  if ((id)v23 == v32)
                  {
                    double v24 = objc_getAssociatedObject(v18, &unk_1EB25C09B);
                    if (v30) {
                      [v32 removeAnimationForKey:v24];
                    }
                    objc_setAssociatedObject(v18, &unk_1EB25C09B, 0, (void *)1);
                    objc_setAssociatedObject(v18, &unk_1EB25C09C, 0, (void *)1);
                    [v31 addObject:v18];

                    id v6 = v32;
                  }
                  else
                  {
                    id v6 = (void *)v23;
                  }
LABEL_27:

                  id v6 = v20;
                  continue;
                }
                id v6 = v20;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v21 = [v10 isEqualToString:@"transition"];
                char v22 = v21;
                if ((isKindOfClass & 1) == 0)
                {
                  double v20 = v6;
                  if (!v21) {
                    continue;
                  }
                  goto LABEL_22;
                }

                double v20 = v6;
                if (v22) {
                  goto LABEL_22;
                }
              }
              else
              {
                double v20 = v6;
                if (isKindOfClass) {
                  goto LABEL_27;
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v15);
        }

        if ([v31 count]) {
          [v13 removeObjectsInArray:v31];
        }

        uint64_t v11 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v28);
  }
}

+ (id)originalAnimationForKeyPath:(id)a3 inLayer:(id)a4
{
  id v5 = a3;
  id v6 = objc_getAssociatedObject(a4, &unk_1EB25C099);
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)disallowInheritance
{
  return self->_disallowInheritance;
}

@end