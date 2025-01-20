@interface UIGestureRecognizer
+ (BOOL)_shouldDefaultToTouches;
+ (BOOL)_shouldUseLinearForceLevelClassifier;
+ (BOOL)_supportsDefaultTouchTypes;
+ (BOOL)_supportsStylusTouches;
+ (BOOL)_supportsTouchContinuation;
+ (BOOL)supportsSecureCoding;
- (BOOL)_acceptsFailureRequirements;
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_analyticsIsGestureHandled;
- (BOOL)_canExcludeOtherExcludables;
- (BOOL)_canExcludeWithActiveRequirements;
- (BOOL)_hasUnmetFailureRequirements;
- (BOOL)_inForceCapableEnvironment;
- (BOOL)_isExcludedByExcludable:(id)a3;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_isPaused;
- (BOOL)_isTouchGestureRecognizer;
- (BOOL)_keepTouchesOnContinuation;
- (BOOL)_needsDynamicDependentRequirementForGestureRecognizer:(id)a3;
- (BOOL)_needsDynamicFailureRequirementForGestureRecognizer:(id)a3;
- (BOOL)_requiresSystemGesturesToFail;
- (BOOL)_shouldBegin;
- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet;
- (BOOL)_shouldReceiveDynamicButton:(id)a3;
- (BOOL)_shouldReceiveEvent:(id)a3;
- (BOOL)_shouldReceivePress:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)_wantsGESEvents;
- (BOOL)_wantsHoverEventsWhilePointerIsLocked;
- (BOOL)_wantsPartialTouchSequences;
- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer;
- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer;
- (BOOL)cancelsTouchesInView;
- (BOOL)delaysTouchesBegan;
- (BOOL)delaysTouchesEnded;
- (BOOL)isEnabled;
- (BOOL)requiresExclusiveTouchType;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;
- (BOOL)shouldReceiveEvent:(UIEvent *)event;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;
- (CGPoint)_centroidOfTouches:(id)a3 excludingEnded:(BOOL)a4;
- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4;
- (CGPoint)locationInView:(UIView *)view;
- (CGPoint)locationOfTouch:(NSUInteger)touchIndex inView:(UIView *)view;
- (NSArray)allowedPressTypes;
- (NSArray)allowedTouchTypes;
- (NSMutableSet)_pairedGestureIdentifiers;
- (NSSet)_allActiveTouches;
- (NSString)_briefDescription;
- (NSString)description;
- (NSString)name;
- (NSUInteger)numberOfTouches;
- (UIGestureRecognizer)init;
- (UIGestureRecognizer)initWithCoder:(NSCoder *)coder;
- (UIGestureRecognizer)initWithTarget:(id)target action:(SEL)action;
- (UIGestureRecognizerState)state;
- (UIView)view;
- (_UIGestureRecognizerDriver)_driver;
- (double)lastTouchTimestamp;
- (id)_activeComponentsForEvent:(uint64_t)a1;
- (id)_activeEventOfType:(int64_t)a3;
- (id)_activeEvents;
- (id)_activePressesEvent;
- (id)_activeTouchesEvent;
- (id)_activeTouchesForEvent:(id)a3;
- (id)_beganObservable;
- (id)_defaultAllowedTouchTypes;
- (id)_failureDependents;
- (id)_forceLevelClassifier;
- (id)_gatherViewsToQueryForDelegateCall;
- (id)_isActive;
- (id)_pairedGestureIdentifiersAndCreate:(BOOL)a3;
- (id)_rawBriefDescription;
- (id)_touchForceObservable;
- (id)delegate;
- (int64_t)_buttonMask;
- (int64_t)_defaultAllowedMouseButtons;
- (int64_t)_depthFirstCompare:(id)a3;
- (int64_t)_modifierFlags;
- (int64_t)_recognitionEvent;
- (int64_t)currentPreviewForceState;
- (int64_t)requiredPreviewForceState;
- (uint64_t)_addActiveEvent:(uint64_t)result;
- (uint64_t)_addActiveTouches:(uint64_t)result;
- (uint64_t)_appendDescription:(uint64_t)a1 forDependencies:(void *)a2 toString:(void *)a3 atLevel:(int)a4;
- (uint64_t)_defaultAllowedTouchTypesMask;
- (uint64_t)_delegateCanBeCancelledByGestureRecognizer:(uint64_t)a1;
- (uint64_t)_delegateCanBePreventedByGestureRecognizer:(uint64_t)a1;
- (uint64_t)_delegateCanCancelGestureRecognizer:(uint64_t)a1;
- (uint64_t)_delegateCanPreventGestureRecognizer:(uint64_t)a1;
- (uint64_t)_delegateShouldReceiveDynamicButton:(uint64_t)a1;
- (uint64_t)_delegateShouldReceiveDynamicButtonEvent:(uint64_t)result;
- (uint64_t)_delegateShouldReceiveEvent:(uint64_t)a1;
- (uint64_t)_delegateShouldReceivePress:(uint64_t)a1;
- (uint64_t)_delegateShouldReceivePressesEvent:(uint64_t)result;
- (uint64_t)_internalShouldReceiveEvent:(uint64_t)a1;
- (uint64_t)_invalidateInitialTouchType;
- (uint64_t)_removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:(uint64_t)result;
- (uint64_t)_shouldReceiveDynamicButton:(uint64_t)a3 forEvent:;
- (uint64_t)_shouldReceivePress:(uint64_t)a3 forPressesEvent:;
- (void)_addForceTarget:(void *)a3 action:;
- (void)_addTouch:(id)a3 forEvent:(id)a4;
- (void)_appendDescriptionToString:(int)a3 atLevel:(int)a4 includingDependencies:;
- (void)_clearDelayedPresses;
- (void)_clearDelayedTouches;
- (void)_componentsBegan:(id)a3 withEvent:(id)a4;
- (void)_componentsCancelled:(id)a3 withEvent:(id)a4;
- (void)_componentsChanged:(id)a3 withEvent:(id)a4;
- (void)_componentsEnded:(id)a3 withEvent:(id)a4;
- (void)_connectInterfaceBuilderEventConnection:(id)a3;
- (void)_delayPressesForEvent:(uint64_t)a3 inPhase:;
- (void)_delayPressesForEventIfNeeded:(uint64_t)a1;
- (void)_delayTouchesForEvent:(uint64_t)a3 inPhase:;
- (void)_delayTouchesForEventIfNeeded:(uint64_t)a1;
- (void)_enqueueDelayedPressesToSend;
- (void)_enqueueDelayedTouchesToSend;
- (void)_ensureForceObservationChain;
- (void)_exclude;
- (void)_forceLevelClassifier:(id)a3 currentForceLevelDidChange:(int64_t)a4;
- (void)_gestureRecognizerDriver:(id)a3 didUpdateState:(int64_t)a4 previousState:(int64_t)a5;
- (void)_ignoreActiveEvents;
- (void)_pressWasCancelled:(uint64_t)a1;
- (void)_removeTouch:(id)a3 forEvent:(id)a4;
- (void)_removeTouch:(uint64_t)a3 forEvent:(char)a4 byCancellingTouches:;
- (void)_requiredGestureRecognizerCompletedOrWasUnrelated:(uint64_t)a1;
- (void)_resetGestureRecognizer;
- (void)_setAcceptsFailureRequiments:(BOOL)a3;
- (void)_setAnalyticsGestureHandled:(BOOL)a3;
- (void)_setCanExcludeWithActiveRequirements:(BOOL)a3;
- (void)_setForceLevelClassifier:(id)a3;
- (void)_setKeepTouchesOnContinuation:(BOOL)a3;
- (void)_setRecognitionEvent:(int64_t)a3;
- (void)_setRequiresSystemGesturesToFail:(BOOL)a3;
- (void)_touchWasCancelled:(uint64_t)a1;
- (void)_updateCachedActiveEventProperties;
- (void)_updateContainer:(uint64_t)a1;
- (void)_updateForceClassifierWithEvent:(uint64_t)a1;
- (void)_updateGestureForActiveEvents;
- (void)_wantsGESEvents:(BOOL)a3;
- (void)addTarget:(id)target action:(SEL)action;
- (void)addTouchesFromGestureRecognizer:(void *)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)ignorePress:(UIPress *)button forEvent:(UIPressesEvent *)event;
- (void)ignoreTouch:(UITouch *)touch forEvent:(UIEvent *)event;
- (void)removeFailureRequirement:(id)a3;
- (void)removeTarget:(id)target action:(SEL)action;
- (void)requireGestureRecognizerToFail:(UIGestureRecognizer *)otherGestureRecognizer;
- (void)setAllowedPressTypes:(NSArray *)allowedPressTypes;
- (void)setAllowedTouchTypes:(NSArray *)allowedTouchTypes;
- (void)setCancelsTouchesInView:(BOOL)cancelsTouchesInView;
- (void)setContainer:(uint64_t)a1;
- (void)setDelayedEventComponentDispatcher:(uint64_t)a1;
- (void)setDelaysTouchesBegan:(BOOL)delaysTouchesBegan;
- (void)setDelaysTouchesEnded:(BOOL)delaysTouchesEnded;
- (void)setDelegate:(id)delegate;
- (void)setEnabled:(BOOL)enabled;
- (void)setGestureEnvironment:(uint64_t)a1;
- (void)setName:(NSString *)name;
- (void)setRequiredPreviewForceState:(int64_t)a3;
- (void)setRequiresExclusiveTouchType:(BOOL)requiresExclusiveTouchType;
- (void)setState:(UIGestureRecognizerState)state;
- (void)setView:(id)a3;
- (void)transferTouchesFromGestureRecognizer:(void *)a1;
@end

@implementation UIGestureRecognizer

- (int64_t)_depthFirstCompare:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (a3)
  {
    id v6 = objc_loadWeakRetained((id *)a3 + 6);

    if (WeakRetained && v6)
    {
      int64_t result = [WeakRetained _compareGestureRecognizerContainer:v6];
      if (!result)
      {
        v8 = [WeakRetained gestureRecognizers];
        int v9 = [v8 indexOfObject:self];

        v10 = [v6 gestureRecognizers];
        int v11 = [v10 indexOfObject:a3];

        if (v9 < v11) {
          return -1;
        }
        else {
          return 1;
        }
      }
      return result;
    }
  }
  else
  {
    id v6 = 0;
  }
  if (v6) {
    int64_t v12 = 0;
  }
  else {
    int64_t v12 = -1;
  }
  if (WeakRetained) {
    return v12;
  }
  else {
    return 1;
  }
}

- (BOOL)_affectedByGesture:(id)a3
{
  if (!self)
  {
    id WeakRetained = 0;
    if (a3) {
      goto LABEL_3;
    }
LABEL_18:
    v7 = 0;
    char v8 = 0;
    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (!a3) {
    goto LABEL_18;
  }
LABEL_3:
  id v6 = objc_loadWeakRetained((id *)a3 + 6);
  v7 = v6;
  char v8 = 0;
  if (WeakRetained && v6)
  {
    if (self && (*(void *)&self->_gestureFlags & 0x1000000000000) != 0
      || (*((void *)a3 + 1) & 0x1000000000000) != 0)
    {
      id v9 = [(UIGestureRecognizer *)self view];
      id v10 = (id)[a3 view];
      char v8 = 0;
      if (v9)
      {
        int v11 = v10;
        if (v10)
        {
          int64_t v12 = [v9 _window];
          v13 = [v12 windowScene];
          v14 = [v11 _window];
          v15 = [v14 windowScene];
          char v8 = v13 == v15;
        }
      }
    }
    else if (v6 == WeakRetained)
    {
      char v8 = 1;
      v7 = WeakRetained;
    }
    else if (isDescendantOfContainer(WeakRetained, v6, 0))
    {
      char v8 = 1;
    }
    else
    {
      char v8 = isDescendantOfContainer(v7, WeakRetained, 0);
    }
  }
LABEL_14:

  return v8;
}

- (BOOL)_needsDynamicFailureRequirementForGestureRecognizer:(id)a3
{
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x10000000000) == 0) {
    return 0;
  }
  if ((gestureFlags & 0x400000) != 0)
  {
    if ([(UIGestureRecognizer *)self shouldRequireFailureOfGestureRecognizer:a3])
    {
      return 1;
    }
    uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  }
  if ((gestureFlags & 0x80) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained gestureRecognizer:self shouldRequireFailureOfGestureRecognizer:a3])
    {
      char v5 = 1;
      goto LABEL_15;
    }
    if ((*(void *)&self->_gestureFlags & 0x20000) == 0)
    {
      char v5 = 0;
      goto LABEL_15;
    }
LABEL_14:
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = [v8 _gestureRecognizer:self shouldRequireFailureOfGestureRecognizer:a3];

    if ((gestureFlags & 0x80) == 0) {
      return v5;
    }
LABEL_15:

    return v5;
  }
  if ((gestureFlags & 0x20000) != 0) {
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)_needsDynamicDependentRequirementForGestureRecognizer:(id)a3
{
  if ((*((void *)a3 + 1) & 0x10000000000) == 0) {
    return 0;
  }
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x800000) != 0)
  {
    if ([(UIGestureRecognizer *)self shouldBeRequiredToFailByGestureRecognizer:a3])
    {
      return 1;
    }
    uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  }
  if ((gestureFlags & 0x100) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained gestureRecognizer:self shouldBeRequiredToFailByGestureRecognizer:a3])
    {
      char v4 = 1;
      goto LABEL_15;
    }
    if ((*(void *)&self->_gestureFlags & 0x40000) == 0)
    {
      char v4 = 0;
      goto LABEL_15;
    }
LABEL_14:
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v4 = [v8 _gestureRecognizer:self shouldBeRequiredToFailByGestureRecognizer:a3];

    if ((gestureFlags & 0x100) == 0) {
      return v4;
    }
LABEL_15:

    return v4;
  }
  if ((gestureFlags & 0x40000) != 0) {
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)_requiresSystemGesturesToFail
{
  return (*(void *)&self->_gestureFlags >> 39) & 1;
}

- (UIGestureRecognizerState)state
{
  return self->_state;
}

- (BOOL)_wantsGESEvents
{
  return self->_wantsGESEvents;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
  return 0;
}

- (void)_requiredGestureRecognizerCompletedOrWasUnrelated:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 72);
    if (v3 > 3)
    {
      if ([*(id *)(a1 + 32) count]
        && (-[UIGestureEnvironment unmetRequirementsForGestureRecognizer:](*(void *)(a1 + 256), a1) & 1) == 0)
      {
        -[UIGestureRecognizer _enqueueDelayedTouchesToSend](a1);
        -[UIGestureRecognizer _enqueueDelayedPressesToSend](a1);
      }
      -[UIGestureRecognizer _ignoreActiveEvents]((id *)a1);
    }
    else
    {
      if (a2 && (unint64_t)(a2[9] - 1) <= 2)
      {
        -[UIGestureRecognizer _ignoreActiveEvents]((id *)a1);
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_requiredGestureRecognizerCompletedOrWasUnrelated____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          v13 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = v13;
            v15 = [(id)a1 _briefDescription];
            v16 = [a2 _briefDescription];
            int v17 = 138412546;
            v18 = v15;
            __int16 v19 = 2112;
            v20 = v16;
            _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%@: Failing due to recognition of %@", (uint8_t *)&v17, 0x16u);
          }
        }
        if ((unint64_t)(*(void *)(a1 + 72) - 1) > 3)
        {
          uint64_t v3 = 5;
        }
        else
        {
          uint64_t v3 = 4;
          if ((*(void *)(a1 + 8) & 0x400000000) == 0) {
            uint64_t v3 = 5;
          }
        }
        *(void *)(a1 + 72) = v3;
      }
      BOOL v6 = v3 <= 1;
      unint64_t v7 = v3 - 1;
      uint64_t v8 = *(void *)(a1 + 8);
      BOOL v9 = !v6 && (v8 & 0x1400000000) == 0x1000000000;
      uint64_t v10 = 0x2000000000;
      if (!v9) {
        uint64_t v10 = 0;
      }
      BOOL v11 = (v8 & 0x400000000) != 0 || v7 >= 3;
      uint64_t v12 = 0x4000000000;
      if (v11) {
        uint64_t v12 = 0;
      }
      *(void *)(a1 + 8) = v12 | v8 & 0xFFFFFF9FFFFFFFFFLL | v10;
      -[UIGestureEnvironment setGestureNeedsUpdate:](*(void *)(a1 + 256), a1);
    }
  }
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
  return 0;
}

- (BOOL)_isExcludedByExcludable:(id)a3
{
  char v4 = (UIGestureRecognizer *)a3;
  uint64_t v5 = (uint64_t)v4;
  LOBYTE(WeakRetained) = 0;
  if (v4 != self)
  {
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_container);

      if (WeakRetained)
      {
        if ((unint64_t)(*(void *)(v5 + 72) - 1) > 2) {
          goto LABEL_22;
        }
        if (![*(id *)(v5 + 176) intersectsSet:self->_activeEvents]) {
          goto LABEL_22;
        }
        int v7 = [(id)v5 _shouldDelayUntilForceLevelRequirementIsMet];
        uint64_t v8 = *(void *)(v5 + 8);
        if (v7)
        {
          if ((v8 & 0x80000000000) == 0) {
            goto LABEL_22;
          }
        }
        if ((v8 & 0x800000000000) == 0
          && (-[UIGestureEnvironment unmetRequirementsForGestureRecognizer:](*(void *)(v5 + 256), v5) & 1) != 0
          || ![(UIGestureRecognizer *)self _affectedByGesture:v5])
        {
          goto LABEL_22;
        }
        if ((*(void *)&self->_gestureFlags & 0x400000000) != 0 && (unint64_t)(self->_state - 1) <= 2)
        {
          if (!-[UIGestureRecognizer _delegateCanBeCancelledByGestureRecognizer:]((uint64_t)self, v5)
            || (-[UIGestureRecognizer _delegateCanCancelGestureRecognizer:](v5, (uint64_t)self) & 1) == 0)
          {
LABEL_22:
            LOBYTE(WeakRetained) = 0;
            goto LABEL_23;
          }
        }
        else if ((-[UIGestureEnvironment gestureRecognizer:requiresGestureRecognizerToFail:]((uint64_t)self->_gestureEnvironment, v5, (uint64_t)self) & 1) != 0|| ![(id)v5 canPreventGestureRecognizer:self]|| !-[UIGestureRecognizer canBePreventedByGestureRecognizer:](self, "canBePreventedByGestureRecognizer:", v5)|| !-[UIGestureRecognizer _delegateCanBePreventedByGestureRecognizer:]((uint64_t)self, v5)|| (-[UIGestureRecognizer _delegateCanPreventGestureRecognizer:](v5, (uint64_t)self) & 1) == 0)
        {
          goto LABEL_22;
        }
        LOBYTE(WeakRetained) = 1;
      }
    }
  }
LABEL_23:

  return (char)WeakRetained;
}

- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet
{
  return self->_requiredPreviewForceState != 0;
}

- (BOOL)_canExcludeOtherExcludables
{
  if (self)
  {
    v2 = self;
    if ((unint64_t)(self->_state - 1) <= 2
      && ((v3 = [(UIGestureRecognizer *)self _shouldDelayUntilForceLevelRequirementIsMet], uint64_t gestureFlags = (uint64_t)v2->_gestureFlags, !v3)|| (gestureFlags & 0x80000000000) != 0))
    {
      if ((gestureFlags & 0x800000000000) != 0) {
        LOBYTE(self) = 1;
      }
      else {
        LOBYTE(self) = -[UIGestureEnvironment unmetRequirementsForGestureRecognizer:]((uint64_t)v2->_gestureEnvironment, (uint64_t)v2) ^ 1;
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (uint64_t)_delegateCanBePreventedByGestureRecognizer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  uint64_t v5 = WeakRetained;
  uint64_t v6 = *(void *)(a1 + 8);
  if ((v6 & 4) != 0)
  {
    if (![WeakRetained gestureRecognizer:a1 canBePreventedByGestureRecognizer:a2]) {
      goto LABEL_10;
    }
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if ((v6 & 0x1000) == 0) {
    goto LABEL_8;
  }
  if ([v5 _gestureRecognizer:a1 canBePreventedByGestureRecognizer:a2])
  {
    uint64_t v6 = *(void *)(a1 + 8);
LABEL_8:
    if ((v6 & 8) != 0)
    {
      if ([v5 gestureRecognizer:a1 shouldRecognizeSimultaneouslyWithGestureRecognizer:a2]) {
        goto LABEL_10;
      }
      uint64_t v6 = *(void *)(a1 + 8);
    }
    if ((v6 & 0x2000) != 0) {
      uint64_t v7 = [v5 _gestureRecognizer:a1 shouldRecognizeSimultaneouslyWithGestureRecognizer:a2] ^ 1;
    }
    else {
      uint64_t v7 = 1;
    }
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_15:

  return v7;
}

- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer
{
  return 1;
}

- (uint64_t)_delegateCanPreventGestureRecognizer:(uint64_t)a1
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  uint64_t v5 = WeakRetained;
  uint64_t v6 = *(void *)(a1 + 8);
  if ((v6 & 2) != 0)
  {
    if (![WeakRetained gestureRecognizer:a1 canPreventGestureRecognizer:a2]) {
      goto LABEL_9;
    }
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if ((v6 & 0x800) == 0) {
    goto LABEL_7;
  }
  if (![v5 _gestureRecognizer:a1 canPreventGestureRecognizer:a2])
  {
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)(a1 + 8);
LABEL_7:
  if ((v6 & 8) != 0)
  {
    if ([v5 gestureRecognizer:a1 shouldRecognizeSimultaneouslyWithGestureRecognizer:a2]) {
      goto LABEL_9;
    }
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if ((v6 & 0x2000) != 0) {
    uint64_t v7 = [v5 _gestureRecognizer:a1 shouldRecognizeSimultaneouslyWithGestureRecognizer:a2] ^ 1;
  }
  else {
    uint64_t v7 = 1;
  }
LABEL_14:

  return v7;
}

- (int64_t)_recognitionEvent
{
  v2 = objc_getAssociatedObject(self, sel__recognitionEvent);
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)_exclude
{
  if (self)
  {
    int64_t state = self->_state;
    if ((unint64_t)(state - 1) < 3) {
      goto LABEL_4;
    }
  }
  else
  {
    int64_t state = MEMORY[0x48];
  }
  if (state != 4)
  {
    int64_t v3 = 5;
    goto LABEL_8;
  }
LABEL_4:
  int64_t v3 = 4;
  if ((*(void *)&self->_gestureFlags & 0x400000000) == 0) {
    int64_t v3 = 5;
  }
LABEL_8:
  self->_int64_t state = v3;
  -[UIGestureEnvironment setGestureNeedsUpdate:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
}

- (UIGestureRecognizer)init
{
  return [(UIGestureRecognizer *)self initWithTarget:0 action:0];
}

- (void)setGestureEnvironment:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 256), a2);
  }
}

- (void)setContainer:(uint64_t)a1
{
  if (a1)
  {
    char v4 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    if (WeakRetained != a2)
    {
      id v6 = objc_loadWeakRetained(v4);
      -[UIGestureRecognizer _updateContainer:](a1, a2);
      if (a2)
      {
        id v7 = viewFromContainer(a2);
        if (v7)
        {
          *(unsigned char *)(a1 + 16) |= 0x80u;
          [(id)a1 setView:v7];
          *(unsigned char *)(a1 + 16) &= ~0x80u;
        }
        int has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (v6) {
          BOOL v9 = v7 == 0;
        }
        else {
          BOOL v9 = 0;
        }
        char v10 = !v9;
        if (has_internal_diagnostics)
        {
          if ((v10 & 1) == 0)
          {
            v13 = viewFromContainer(v6);

            if (v13)
            {
              v14 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Re-attaching UIGestureRecognizer to a container without a view is unsupported", buf, 2u);
              }
            }
          }
        }
        else if ((v10 & 1) == 0)
        {
          BOOL v11 = viewFromContainer(v6);

          if (v11)
          {
            uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setContainer____s_category) + 8);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v15 = 0;
              _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Re-attaching UIGestureRecognizer to a container without a view is unsupported", v15, 2u);
            }
          }
        }
      }
      else if (viewFromContainer(v6))
      {
        *(unsigned char *)(a1 + 16) |= 0x80u;
        [(id)a1 setView:0];
        *(unsigned char *)(a1 + 16) &= ~0x80u;
      }
    }
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  int64_t v3 = viewFromContainer(WeakRetained);

  return (UIView *)v3;
}

- (void)setView:(id)a3
{
  if ((*((char *)&self->_gestureFlags + 8) & 0x8000000000000000) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

    if (WeakRetained != a3)
    {
      -[UIGestureRecognizer _updateContainer:]((uint64_t)self, a3);
    }
  }
}

- (void)_updateContainer:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    char v4 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_storeWeak(v4, a2);
    int v5 = dyld_program_sdk_at_least();
    if (!a2 && v5 && WeakRetained && (*(void *)(a1 + 8) & 0x200000000) != 0)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", _cancelGestureForNewContainerIfNecessary_previousContainer____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v33 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = [(id)a1 _briefDescription];
          v35 = (void *)v34;
          unint64_t v36 = *(void *)(a1 + 72);
          if (v36 > 5) {
            v37 = 0;
          }
          else {
            v37 = off_1E52F0F58[v36];
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v34;
          __int16 v44 = 2112;
          v45 = v37;
          _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "%@: Cancelling gesture because the container was set to nil while in state %@", buf, 0x16u);
        }
      }
      uint64_t v7 = *(void *)(a1 + 256);
      *(void *)buf = a1;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
      -[UIGestureEnvironment _cancelGestureRecognizers:](v7, v8);
    }
    BOOL v9 = viewFromContainer(a2);
    if (v9)
    {
      if (*(void *)(a1 + 112) && -[UIGestureRecognizer _inForceCapableEnvironment]((void *)a1)) {
        -[UIGestureRecognizer _ensureForceObservationChain](a1);
      }
      if ((*(void *)(a1 + 8) & 0x8000000000) != 0)
      {
        char v10 = [v9 window];
        BOOL v11 = v10;
        if (v10)
        {
          [v10 _createSystemGestureGateGestureRecognizerIfNeeded];
          [v11 _createOtherSystemGateGestureRecognizersIfNeeded];
        }
      }
      uint64_t v12 = [v9 _window];
      if (v12)
      {
        v13 = (void *)v12;
        int v14 = [(id)a1 _wantsPartialTouchSequences];

        if (v14)
        {
          v15 = (void *)UIApp;
          v16 = [v9 _window];
          id v17 = (id)[v15 _touchesEventForWindow:v16];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v18 = [v17 allTouches];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:buf count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v40 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                v24 = [v23 view];
                if (!v24)
                {
                  v25 = [v23 window];
                  v24 = objc_msgSend(v25, "hitTest:withEvent:", 0, -[UITouch _locationInWindow:]((double *)v23, 0));
                }
                if ([(id)a1 _shouldReceiveTouch:v23 forEvent:v17 recognizerView:v9])
                {
                  -[UITouch _addGestureRecognizer:]((uint64_t)v23, (void *)a1);
                  v26 = [v17 _touchesForKey:a1];
                  [v26 addObject:v23];

                  [v17 _invalidateGestureRecognizerForWindowCache];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:buf count:16];
            }
            while (v20);
          }
        }
      }
      v27 = [v9 _window];
      if (v27)
      {
        uint64_t v28 = *(void *)(a1 + 8);

        if ((v28 & 0x800000000000000) != 0)
        {
          v29 = (void *)UIApp;
          v30 = [v9 _window];
          id v31 = (id)[v29 _hoverEventForWindow:v30];

          v32 = [v9 _window];
          [v31 setNeedsHitTestResetForWindow:v32];
        }
      }
    }
  }
}

- (void)setDelayedEventComponentDispatcher:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 264), a2);
  }
}

- (BOOL)_wantsPartialTouchSequences
{
  return 0;
}

- (BOOL)isEnabled
{
  return (*(void *)&self->_gestureFlags & 0x100000000) == 0;
}

- (void)_componentsBegan:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer _addActiveEvent:]((uint64_t)self, (uint64_t)a4);
  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  uint64_t v7 = [a4 type];
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _addActiveTouches:]((uint64_t)self, (uint64_t)a3);
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((unsigned char *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        BOOL v9 = [(UIGestureRecognizer *)self _driver];
        [v9 touchesBegan:a3 withEvent:a4];
      }
      [(UIGestureRecognizer *)self touchesBegan:a3 withEvent:a4];
      if ((*(void *)&self->_gestureFlags & 0x4000000) != 0) {
        [(id)UIApp _registerEstimatedTouches:a3 event:a4 forTouchable:self];
      }
      break;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      return;
    case 3:
    case 4:
      [(UIGestureRecognizer *)self pressesBegan:a3 withEvent:a4];
      break;
    case 9:
      if ((~*(void *)&self->_gestureFlags & 0x300000000000) != 0) {
        return;
      }
      [(UIGestureRecognizer *)self _draggingEnteredWithEvent:a4];
      break;
    case 11:
      if ((*(void *)&self->_gestureFlags & 0x800000000000000) == 0) {
        return;
      }
      -[UIGestureRecognizer _addActiveTouches:]((uint64_t)self, (uint64_t)a3);
      [(UIGestureRecognizer *)self _hoverEntered:a3 withEvent:a4];
      break;
    default:
      if (v7 != 16 || (*(void *)&self->_gestureFlags & 0x4000000000000000) == 0) {
        return;
      }
      [(UIGestureRecognizer *)self _dynamicButtonsBegan:a3 withEvent:a4];
      break;
  }
  if (self->_firstEventTimestamp == 0.0)
  {
    [a4 timestamp];
    self->_firstEventTimestamp = v8;
  }
}

- (void)_updateGestureForActiveEvents
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v1 = a1;
  id v2 = *((id *)v1 + 33);
  [v1 _updateForActiveEvents];
  int64_t v3 = [v1 _activeEventOfType:0];
  char v4 = [v1 _activeEventOfType:3];
  char v5 = -[UIGestureEnvironment unmetRequirementsForGestureRecognizer:](*((void *)v1 + 32), (uint64_t)v1);
  if ([v1 _shouldDelayUntilForceLevelRequirementIsMet]) {
    uint64_t v6 = (*((void *)v1 + 1) >> 43) & 1;
  }
  else {
    LOBYTE(v6) = 1;
  }
  char v7 = v5 | v6 ^ 1;
  [v3 timestamp];
  *((void *)v1 + 7) = v8;
  uint64_t v9 = *((void *)v1 + 9);
  if ((unint64_t)(v9 - 1) <= 2)
  {
    if ((v7 & 1) == 0)
    {
      char v10 = *((unsigned char *)v1 + 16);
      uint64_t v11 = *((void *)v1 + 1);
      if (v9 == 1 && (v11 & 0x400000000) != 0)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_updateGestureForActiveEvents___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v21 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            v23 = [v1 _briefDescription];
            int v24 = 138412802;
            v25 = v23;
            __int16 v26 = 2112;
            v27 = @"Began";
            __int16 v28 = 2112;
            v29 = @"Changed";
            _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "%@: Automatically moving a gesture from state %@ to state %@ because another event was received.", (uint8_t *)&v24, 0x20u);
          }
        }
        [v1 setState:2];
        uint64_t v11 = *((void *)v1 + 1);
        char v10 = *((unsigned char *)v1 + 16);
      }
      if ((v11 & 0x4000000000) != 0)
      {
        *((void *)v1 + 1) = v11 & 0xFFFFFFBFFFFFFFFFLL;
        *((unsigned char *)v1 + 16) = v10;
        [v1 _willBeginAfterSatisfyingFailureRequirements];
        uint64_t v11 = *((void *)v1 + 1);
        if ((v11 & 0x400000000) != 0)
        {
LABEL_13:
          if ((v11 & 0x2000000000) == 0) {
            goto LABEL_32;
          }
LABEL_27:
          uint64_t v14 = *((void *)v1 + 9);
          if (v14 >= 2)
          {
            *((void *)v1 + 9) = 1;
            _UIGestureRecognizerSendActions((uint64_t)v1, 1);
            uint64_t v15 = *((void *)v1 + 9);
            if (v15 == 1)
            {
              *((void *)v1 + 9) = v14;
              uint64_t v15 = v14;
            }
            if (v15 == 2) {
              goto LABEL_35;
            }
            int v16 = 1;
            goto LABEL_34;
          }
LABEL_32:
          if ([v1 _isPaused])
          {
LABEL_35:
            if ((*((void *)v1 + 1) & 0x20000000) != 0)
            {
              id v17 = (void *)*((void *)v1 + 4);
              v18 = [v3 touchesForGestureRecognizer:v1];
              -[UIGestureDelayedEventComponentDispatcher cancelDelayedTouches:touches:fromEvent:]((uint64_t)v2, v17, v18, v3);

              uint64_t v19 = (void *)*((void *)v1 + 5);
              uint64_t v20 = [v4 pressesForGestureRecognizer:v1];
              -[UIGestureDelayedEventComponentDispatcher cancelDelayedPresses:presses:fromEvent:]((uint64_t)v2, v19, v20, v4);
            }
            -[UIGestureRecognizer _clearDelayedTouches]((uint64_t)v1);
            -[UIGestureRecognizer _clearDelayedPresses]((uint64_t)v1);
            goto LABEL_38;
          }
          int v16 = 0;
LABEL_34:
          _UIGestureRecognizerSendActions((uint64_t)v1, v16);
          goto LABEL_35;
        }
      }
      else if ((v11 & 0x400000000) != 0)
      {
        goto LABEL_13;
      }
      [*((id *)v1 + 19) receiveObservedValue:MEMORY[0x1E4F1CC38]];
      if ((*((void *)v1 + 1) & 0x2000000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  if (v9 == 4)
  {
    if ((*((void *)v1 + 1) & 0x400000000) != 0) {
      _UIGestureRecognizerSendActions((uint64_t)v1, 0);
    }
LABEL_24:
    -[UIGestureRecognizer _enqueueDelayedTouchesToSend]((uint64_t)v1);
    -[UIGestureRecognizer _enqueueDelayedPressesToSend]((uint64_t)v1);
    goto LABEL_38;
  }
  if (v9 == 5)
  {
    if ((*((void *)v1 + 1) & 0x200) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)v1 + 29);
      [WeakRetained _gestureRecognizerFailed:v1];
    }
    [*((id *)v1 + 19) receiveObservedValue:MEMORY[0x1E4F1CC28]];
    if (v7) {
      goto LABEL_38;
    }
    goto LABEL_24;
  }
LABEL_21:
  -[UIGestureRecognizer _delayTouchesForEventIfNeeded:]((uint64_t)v1, v3);
  -[UIGestureRecognizer _delayPressesForEventIfNeeded:]((uint64_t)v1, v4);
LABEL_38:
  if (*((uint64_t *)v1 + 9) >= 3)
  {
    if ((v5 & 1) == 0) {
      -[UIGestureRecognizer _ignoreActiveEvents]((id *)v1);
    }
    [*((id *)v1 + 15) receiveObservedValue:0];
  }
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  char v5 = self;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if ([(UIGestureRecognizer *)self requiresExclusiveTouchType]
      && (*(void *)&v5->_gestureFlags & 0x40000000000) != 0)
    {
      uint64_t v16 = [a3 type];
      int64_t initialTouchType = v5->_initialTouchType;
      BOOL v8 = v16 == initialTouchType;
      if ((*(unsigned char *)__UILogGetCategoryCachedImpl("Gesture", &qword_1EB260C70) & 1) != 0 && v16 != initialTouchType)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &qword_1EB260C78);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          v50 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v51 = v50;
            v52 = [(UIGestureRecognizer *)v5 _briefDescription];
            v53 = [NSNumber numberWithInteger:v5->_initialTouchType];
            *(_DWORD *)buf = 138412546;
            v59 = v52;
            __int16 v60 = 2112;
            v61 = v53;
            _os_log_impl(&dword_1853B0000, v51, OS_LOG_TYPE_ERROR, "%@: Disallowing touch for gesture recognizer because it does not match _initialTouchType(%@)", buf, 0x16u);
          }
        }
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
    uint64_t v9 = [a4 type];
    int v10 = dyld_program_sdk_at_least();
    if (v9) {
      int v11 = v10;
    }
    else {
      int v11 = 1;
    }
    uint64_t v12 = [(UIGestureRecognizer *)v5 view];
    if (!v8
      || (v5->_allowedTouchTypes & (1 << [a3 type])) == 0
      || ![(UIGestureRecognizer *)v5 isEnabled]
      || [(UIGestureRecognizer *)v5 state] > UIGestureRecognizerStateChanged)
    {
      goto LABEL_76;
    }
    if (v9 || !v12)
    {
      if (v9)
      {
        if (![(UIGestureRecognizer *)v5 _shouldReceiveEvent:a4]
          || (-[UIGestureRecognizer _delegateShouldReceiveEvent:]((uint64_t)v5, (uint64_t)a4) & 1) == 0)
        {
          goto LABEL_76;
        }
LABEL_35:
        if (![(UIGestureRecognizer *)v5 _shouldReceiveTouch:a3 withEvent:a4]) {
          goto LABEL_76;
        }
        if (!v11)
        {
LABEL_65:
          if ((*((unsigned char *)&v5->_gestureFlags + 8) & 0x40) == 0
            || ([(UIGestureRecognizer *)v5 _driver],
                v37 = objc_claimAutoreleasedReturnValue(),
                int v38 = [v37 shouldReceiveComponent:a3 withEvent:a4],
                v37,
                v38))
          {
            if ((*(void *)&v5->_gestureFlags & 0x40000000000) == 0)
            {
              uint64_t v39 = [a3 type];
              unint64_t v40 = __UILogGetCategoryCachedImpl("Gesture", &qword_1EB260C80);
              if (*(unsigned char *)v40)
              {
                v43 = *(NSObject **)(v40 + 8);
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  __int16 v44 = v43;
                  v45 = [(UIGestureRecognizer *)v5 _briefDescription];
                  uint64_t v46 = [NSNumber numberWithInteger:v39];
                  *(_DWORD *)buf = 138412802;
                  v59 = v45;
                  __int16 v60 = 2080;
                  v61 = "-[UIGestureRecognizer _setInitialTouchType:]";
                  __int16 v62 = 2112;
                  v63 = v46;
                  _os_log_impl(&dword_1853B0000, v44, OS_LOG_TYPE_ERROR, "%@: %s (type=%@)", buf, 0x20u);
                }
              }
              if ((v5->_allowedTouchTypes & (1 << v39)) != 0)
              {
                v5->_int64_t initialTouchType = v39;
                *(void *)&v5->_gestureFlags |= 0x40000000000uLL;
              }
              else
              {
                unint64_t v41 = __UILogGetCategoryCachedImpl("Gesture", &qword_1EB260C88);
                if (*(unsigned char *)v41)
                {
                  v47 = *(NSObject **)(v41 + 8);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    v48 = v47;
                    v49 = [(UIGestureRecognizer *)v5 _briefDescription];
                    *(_DWORD *)buf = 138412290;
                    v59 = v49;
                    _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_ERROR, "%@: Attempting to set initial touch type, that is not allowed...", buf, 0xCu);
                  }
                }
              }
            }
            LOBYTE(v5) = 1;
            goto LABEL_77;
          }
LABEL_76:
          LOBYTE(v5) = 0;
LABEL_77:

          return (char)v5;
        }
        if (![a4 type] && (*(void *)&v5->_gestureFlags & 0x20000000) != 0)
        {
          -[UIGestureRecognizer _gatherViewsToQueryForDelegateCall]((uint64_t)v5);
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = [v24 countByEnumeratingWithState:&v54 objects:buf count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v55 != v34) {
                  objc_enumerationMutation(v24);
                }
                if (!objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "_gestureRecognizerShouldReceiveTouch:", v5, (void)v54))
                {
                  int v25 = 0;
                  goto LABEL_74;
                }
              }
              uint64_t v33 = [v24 countByEnumeratingWithState:&v54 objects:buf count:16];
              if (v33) {
                continue;
              }
              break;
            }
          }
          int v25 = 1;
LABEL_74:
        }
        else
        {
          id v24 = 0;
          int v25 = 1;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
        v27 = WeakRetained;
        uint64_t gestureFlags = (uint64_t)v5->_gestureFlags;
        if ((gestureFlags & 0x8000) != 0) {
          int v29 = 0;
        }
        else {
          int v29 = v25;
        }
        if ((gestureFlags & 0x8000) != 0 && v25)
        {
          int v29 = [WeakRetained _gestureRecognizer:v5 shouldReceiveTouch:a3];
          uint64_t gestureFlags = (uint64_t)v5->_gestureFlags;
        }
        if ((gestureFlags & 0x20) == 0)
        {
          int v30 = v29;
          goto LABEL_48;
        }
        if (v24)
        {
          int v31 = [v24 containsObject:v27];
          int v30 = v31 & v29;
          if (v31 & 1) != 0 || ((v29 ^ 1))
          {
LABEL_48:

            if (!v30) {
              goto LABEL_76;
            }
            goto LABEL_65;
          }
        }
        else if ((v29 & 1) == 0)
        {

          goto LABEL_76;
        }
        char v36 = objc_msgSend(v27, "gestureRecognizer:shouldReceiveTouch:", v5, a3, (void)v54);

        if ((v36 & 1) == 0) {
          goto LABEL_76;
        }
        goto LABEL_65;
      }
    }
    else
    {
      v13 = [v12 _window];
      uint64_t v14 = [v13 _exclusiveTouchView];

      if (v14)
      {
        char v15 = [v14 isDescendantOfView:v12];

        if ((v15 & 1) == 0) {
          goto LABEL_76;
        }
      }
    }
    unint64_t v19 = (unint64_t)v5->_gestureFlags;
    if ((~v19 & 0x8000200000000) != 0)
    {
      BOOL v20 = [(UIGestureRecognizer *)v5 _shouldReceiveEvent:a4];
      uint64_t v21 = 0x8000000000000;
      if (v20) {
        uint64_t v21 = 0x18000000000000;
      }
      unint64_t v19 = *(void *)&v5->_gestureFlags & 0xFFE7FFFFFFFFFFFFLL | v21;
      *(void *)&v5->_uint64_t gestureFlags = v19;
    }
    if ((v19 & 0x10000000000000) == 0) {
      goto LABEL_76;
    }
    if ((~v19 & 0x20000200000000) != 0)
    {
      int v22 = -[UIGestureRecognizer _delegateShouldReceiveEvent:]((uint64_t)v5, (uint64_t)a4);
      uint64_t v23 = 0x20000000000000;
      if (v22) {
        uint64_t v23 = 0x60000000000000;
      }
      unint64_t v19 = *(void *)&v5->_gestureFlags & 0xFF9FFFFFFFFFFFFFLL | v23;
      *(void *)&v5->_uint64_t gestureFlags = v19;
    }
    if ((v19 & 0x40000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_35;
  }
  return (char)v5;
}

- (id)_activeEventOfType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = self->_activeEvents;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)requiresExclusiveTouchType
{
  return (*(void *)&self->_gestureFlags >> 41) & 1;
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  return -[UIGestureRecognizer _internalShouldReceiveEvent:]((uint64_t)self, a3);
}

- (uint64_t)_internalShouldReceiveEvent:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 16) & 0x40) != 0)
  {
    uint64_t v5 = [(id)a1 _driver];
    int v4 = [v5 shouldReceiveEvent:a2];
  }
  else
  {
    int v4 = 0;
  }
  uint64_t v6 = 0;
  switch([a2 type])
  {
    case 0:
      if (*(void *)(a1 + 80)) {
        int v7 = 1;
      }
      else {
        int v7 = v4;
      }
      if (v7) {
        goto LABEL_21;
      }
      goto LABEL_15;
    case 3:
    case 4:
      goto LABEL_21;
    case 9:
      unint64_t v8 = *(void *)(a1 + 8);
      if ((v8 & 0x100000000000) != 0) {
        int v9 = (v8 >> 45) & 1;
      }
      else {
        int v9 = 0;
      }
      if (!(v9 | v4)) {
        goto LABEL_15;
      }
      goto LABEL_21;
    case 10:
      uint64_t v10 = (*(void *)(a1 + 8) >> 60) & 1;
      goto LABEL_20;
    case 11:
      uint64_t v10 = (*(void *)(a1 + 8) >> 59) & 1;
      goto LABEL_20;
    case 14:
      uint64_t v10 = (*(void *)(a1 + 8) >> 61) & 1;
      goto LABEL_20;
    case 16:
      uint64_t v10 = (*(void *)(a1 + 8) >> 62) & 1;
LABEL_20:
      if (v10 | v4) {
LABEL_21:
      }
        uint64_t v6 = [(id)a1 shouldReceiveEvent:a2];
      else {
LABEL_15:
      }
        uint64_t v6 = 0;
      break;
    default:
      break;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_internalShouldReceiveEvent____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    long long v13 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = v13;
      long long v15 = [(id)a1 _briefDescription];
      if (v6) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      int v18 = 138412802;
      unint64_t v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = (id)objc_opt_class();
      id v17 = v23;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%@: Returning %@ for event class: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  return v6;
}

- (uint64_t)_delegateShouldReceiveEvent:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  uint64_t v5 = WeakRetained;
  uint64_t v6 = *(void *)(a1 + 8);
  if ((v6 & 0x4000) != 0)
  {
    unsigned int v7 = [WeakRetained _gestureRecognizer:a1 shouldReceiveEvent:a2];
    uint64_t v6 = *(void *)(a1 + 8);
  }
  else
  {
    unsigned int v7 = 1;
  }
  if ((v6 & 0x10) != 0) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  if ((v6 & 0x10) != 0 && v7) {
    uint64_t v8 = [v5 gestureRecognizer:a1 shouldReceiveEvent:a2];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_delegateShouldReceiveEvent____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    int v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = v11;
      long long v13 = [(id)a1 _briefDescription];
      if (v8) {
        long long v14 = @"YES";
      }
      else {
        long long v14 = @"NO";
      }
      int v16 = 138412802;
      id v17 = v13;
      __int16 v18 = 2112;
      unint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = (id)objc_opt_class();
      id v15 = v21;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Delegate is returning %@ for event class: %@", (uint8_t *)&v16, 0x20u);
    }
  }

  return v8;
}

- (void)_updateCachedActiveEventProperties
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)(a1 + 192) = 0;
    *(void *)(a1 + 200) = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(a1 + 176);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
          *(void *)(a1 + 192) |= objc_msgSend(v7, "_buttonMask", (void)v8);
          *(void *)(a1 + 200) |= [v7 _modifierFlags];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_updateForceClassifierWithEvent:(uint64_t)a1
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 120);
    id v3 = [a2 touchesForGestureRecognizer:a1];
    [v2 receiveObservedValue:v3];
  }
}

- (BOOL)shouldReceiveEvent:(UIEvent *)event
{
  return 1;
}

- (void)_ignoreActiveEvents
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v2 = (void *)[a1[22] copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v8 = [v7 touchesForGestureRecognizer:a1];
          long long v9 = (void *)[v8 copy];

          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                [a1 ignoreTouch:*(void *)(*((void *)&v23 + 1) + 8 * i) forEvent:v7];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
            }
            while (v11);
          }
LABEL_15:

          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v9 = objc_msgSend(v7, "pressesForGestureRecognizer:", a1, 0);
          uint64_t v14 = [v9 countByEnumeratingWithState:&v19 objects:v31 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v20 != v16) {
                  objc_enumerationMutation(v9);
                }
                [a1 ignorePress:*(void *)(*((void *)&v19 + 1) + 8 * j) forEvent:v7];
              }
              uint64_t v15 = [v9 countByEnumeratingWithState:&v19 objects:v31 count:16];
            }
            while (v15);
          }
          goto LABEL_15;
        }
        -[UIEvent _removeGestureRecognizer:](v7, a1);
LABEL_16:
        ++v6;
      }
      while (v6 != v4);
      uint64_t v18 = [v2 countByEnumeratingWithState:&v27 objects:v33 count:16];
      uint64_t v4 = v18;
    }
    while (v18);
  }
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (id)_gatherViewsToQueryForDelegateCall
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1 && (*(void *)(a1 + 8) & 0x20000000) != 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v2 = 0;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (v8) {
            long long v8 = (void *)v8[4];
          }
          long long v9 = v8;
          uint64_t v10 = [v9 view];

          if (v10)
          {
            if (!v2) {
              id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
            }
            [v2 addObject:v10];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v5);
    }
    else
    {
      id v2 = 0;
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = objc_msgSend((id)a1, "_activeEventOfType:", 0, 0);
    uint64_t v12 = [v11 touchesForGestureRecognizer:a1];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) view];
          if (v17)
          {
            if (!v2) {
              id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
            }
            [v2 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (uint64_t)_addActiveTouches:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(result + 96);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v6 = *(void **)(v3 + 96);
      *(void *)(v3 + 96) = v5;

      uint64_t v4 = *(void **)(v3 + 96);
    }
    return [v4 unionSet:a2];
  }
  return result;
}

- (uint64_t)_addActiveEvent:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(result + 176);
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void **)(v3 + 176);
      *(void *)(v3 + 176) = v5;

      uint64_t v4 = *(void **)(v3 + 176);
    }
    return [v4 addObject:a2];
  }
  return result;
}

- (void)ignoreTouch:(UITouch *)touch forEvent:(UIEvent *)event
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    _UIGestureDelayedTouchForUITouch(touch, self->_delayedTouches);
    unsigned int v7 = (id *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_enqueueDelayedTouchToSend____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        long long v9 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          loga = v9;
          uint64_t v16 = [(UIGestureRecognizer *)self _briefDescription];
          id v10 = v7[3];
          uint64_t v11 = (objc_class *)objc_opt_class();
          uint64_t v12 = NSStringFromClass(v11);
          id v13 = v7[3];
          id v14 = v7[4];
          uint64_t v15 = [v14 _phaseDescription];
          *(_DWORD *)buf = 138413058;
          long long v20 = v16;
          __int16 v21 = 2112;
          long long v22 = v12;
          __int16 v23 = 2048;
          id v24 = v13;
          __int16 v25 = 2112;
          long long v26 = v15;
          _os_log_impl(&dword_1853B0000, loga, OS_LOG_TYPE_ERROR, "%@: Enqueueing delayed touch <%@: %p; phase = %@>",
            buf,
            0x2Au);
        }
      }
      -[UIGestureDelayedEventComponentDispatcher enqueueDelayedTouchToSend:]((uint64_t)self->_delayedEventComponentDispatcher, (uint64_t)v7);
      [(NSMutableArray *)self->_delayedTouches removeObject:v7];
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", touch, v16);
  os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
  [(UIEvent *)event _removeGestureRecognizer:self fromComponents:log];
  -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)log);
}

- (uint64_t)_removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    [*(id *)(result + 96) minusSet:a2];
    int64_t result = [*(id *)(v2 + 96) count];
    if (!result)
    {
      return -[UIGestureRecognizer _invalidateInitialTouchType](v2);
    }
  }
  return result;
}

- (void)_resetGestureRecognizer
{
  [(UIGestureRecognizer *)self reset];
  [(NSMutableSet *)self->_activeEvents removeAllObjects];
  self->_forcePressCount = 0;
  *(void *)&self->_gestureFlags &= 0xFFF9FFFFFFFFFFFFLL;
  self->_firstEventTimestamp = 0.0;
  self->_buttonMask = 0;
  self->_modifierFlags = 0;
  -[UIGestureRecognizer _invalidateInitialTouchType]((uint64_t)self);
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  char v4 = *((unsigned char *)&self->_gestureFlags + 8);
  self->_machTimeEnqueuedForReset = 0;
  *(void *)&self->_uint64_t gestureFlags = gestureFlags & 0xFFFEFF81FFFFFFFFLL;
  *((unsigned char *)&self->_gestureFlags + 8) = v4 & 0xEF;
  -[UIGestureRecognizer _enqueueDelayedTouchesToSend]((uint64_t)self);
  -[UIGestureRecognizer _enqueueDelayedPressesToSend]((uint64_t)self);
  *(void *)&self->_gestureFlags &= ~0x10000000uLL;
  self->_int64_t state = 0;
  [(_UITouchForceObservable *)self->_touchForceObservable receiveObservedValue:0];
  uint64_t v5 = (uint64_t)self->_gestureFlags;
  char v6 = *((unsigned char *)&self->_gestureFlags + 8);
  self->_inputPrecision = 0;
  *(void *)&self->_uint64_t gestureFlags = v5 & 0x7807F7FFFFFFFFFFLL;
  *((unsigned char *)&self->_gestureFlags + 8) = v6 & 0xF8;
  if ((v6 & 0x40) != 0)
  {
    id v7 = [(UIGestureRecognizer *)self _driver];
    [v7 reset];
  }
}

- (void)_enqueueDelayedTouchesToSend
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v3 = v2;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        id v6 = 0;
        uint64_t v7 = *(void *)v25;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v25 != v7) {
              objc_enumerationMutation(v3);
            }
            uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * v8);
            if (v9) {
              id v10 = *(void **)(v9 + 24);
            }
            else {
              id v10 = 0;
            }
            id v11 = v10;
            if ([v11 isDelayed] && v9)
            {
              uint64_t v12 = *(void *)(v9 + 8);

              if (v12 == 1)
              {
                unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_enqueueDelayedTouchesToSend___s_category);
                if (*(unsigned char *)CategoryCachedImpl)
                {
                  id v14 = *(NSObject **)(CategoryCachedImpl + 8);
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                  {
                    os_log_t log = v14;
                    __int16 v23 = [(id)a1 _briefDescription];
                    id v21 = *(id *)(v9 + 24);
                    uint64_t v15 = (objc_class *)objc_opt_class();
                    long long v20 = NSStringFromClass(v15);
                    id v16 = *(id *)(v9 + 24);
                    id v18 = *(id *)(v9 + 32);
                    long long v19 = [v18 _phaseDescription];
                    *(_DWORD *)buf = 138413058;
                    uint64_t v29 = v23;
                    __int16 v30 = 2112;
                    int v31 = v20;
                    __int16 v32 = 2048;
                    id v33 = v16;
                    __int16 v34 = 2112;
                    v35 = v19;
                    _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "%@: Enqueueing delayed touch <%@: %p; phase = %@>",
                      buf,
                      0x2Au);
                  }
                }
                -[UIGestureDelayedEventComponentDispatcher enqueueDelayedTouchToSend:](*(void *)(a1 + 264), v9);
                if (!v6) {
                  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                [v6 addObject:v9];
              }
            }
            else
            {
            }
            ++v8;
          }
          while (v5 != v8);
          uint64_t v17 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
          uint64_t v5 = v17;
        }
        while (v17);
      }
      else
      {
        id v6 = 0;
      }

      [*(id *)(a1 + 32) removeObjectsInArray:v6];
      -[UIGestureRecognizer _clearDelayedTouches](a1);
    }
  }
}

- (void)_enqueueDelayedPressesToSend
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    if (v2)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v3 = v2;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        id v6 = 0;
        uint64_t v7 = *(void *)v15;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v15 != v7) {
              objc_enumerationMutation(v3);
            }
            uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
            if (v9) {
              id v10 = *(void **)(v9 + 24);
            }
            else {
              id v10 = 0;
            }
            id v11 = v10;
            if (objc_msgSend(v11, "isDelayed", (void)v14) && v9)
            {
              uint64_t v12 = *(void *)(v9 + 8);

              if (v12 == 1)
              {
                -[UIGestureDelayedEventComponentDispatcher enqueueDelayedPressToSend:](*(void *)(a1 + 264), v9);
                if (!v6)
                {
                  id v6 = [MEMORY[0x1E4F1CA48] array];
                }
                [v6 addObject:v9];
              }
            }
            else
            {
            }
            ++v8;
          }
          while (v5 != v8);
          uint64_t v13 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
          uint64_t v5 = v13;
        }
        while (v13);
      }
      else
      {
        id v6 = 0;
      }

      [*(id *)(a1 + 40) removeObjectsInArray:v6];
      -[UIGestureRecognizer _clearDelayedPresses](a1);
    }
  }
}

- (uint64_t)_invalidateInitialTouchType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_invalidateInitialTouchType___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v3 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = v3;
        uint64_t v5 = [(id)v1 _briefDescription];
        int v6 = 138412546;
        uint64_t v7 = v5;
        __int16 v8 = 2080;
        uint64_t v9 = "-[UIGestureRecognizer _invalidateInitialTouchType]";
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%@: %s", (uint8_t *)&v6, 0x16u);
      }
    }
    *(void *)(v1 + 8) &= ~0x40000000000uLL;
    return [*(id *)(v1 + 96) removeAllObjects];
  }
  return result;
}

- (void)_delayTouchesForEventIfNeeded:(uint64_t)a1
{
  if (([(id)a1 delaysTouchesBegan] & 1) != 0 || objc_msgSend(*(id *)(a1 + 32), "count")) {
    -[UIGestureRecognizer _delayTouchesForEvent:inPhase:](a1, a2, 0);
  }
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0)
  {
    -[UIGestureRecognizer _delayTouchesForEvent:inPhase:](a1, a2, 3);
  }
}

- (void)_delayPressesForEventIfNeeded:(uint64_t)a1
{
  if (([(id)a1 delaysTouchesBegan] & 1) != 0 || objc_msgSend(*(id *)(a1 + 40), "count")) {
    -[UIGestureRecognizer _delayPressesForEvent:inPhase:](a1, a2, 0);
  }
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0)
  {
    -[UIGestureRecognizer _delayPressesForEvent:inPhase:](a1, a2, 3);
  }
}

- (BOOL)delaysTouchesBegan
{
  return (*(void *)&self->_gestureFlags >> 30) & 1;
}

- (id)_isActive
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    if (a1[9] <= 2 && [a1 isEnabled] && ((unint64_t)v1[1] & 0x200000000) != 0)
    {
      id WeakRetained = objc_loadWeakRetained(v1 + 6);
      uint64_t v1 = (id *)(WeakRetained != 0);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)_delayTouchesForEvent:(uint64_t)a3 inPhase:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_delayTouchesForEvent_inPhase____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    long long v17 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v28.receiver = (id)a1;
      v28.super_class = (Class)UIGestureRecognizer;
      id v18 = objc_msgSendSuper2(&v28, sel_description);
      if (a2)
      {
        uint64_t v19 = NSString;
        id v20 = a2;
        id v21 = (objc_class *)objc_opt_class();
        long long v22 = NSStringFromClass(v21);
        __int16 v23 = [v19 stringWithFormat:@"<%@: %p>", v22, v20];
      }
      else
      {
        __int16 v23 = @"(nil)";
      }
      *(_DWORD *)buf = 138412802;
      int v31 = v18;
      __int16 v32 = 2112;
      id v33 = v23;
      __int16 v34 = 2048;
      uint64_t v35 = a3;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "%@: Delaying touches for event: %@; phase: %li",
        buf,
        0x20u);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [a2 _touchesForGesture:a1 withPhase:a3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = _UIGestureDelayedTouchForUITouch(v12, *(void **)(a1 + 32));

        if (!v13)
        {
          if (!*(void *)(a1 + 32))
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v15 = *(void **)(a1 + 32);
            *(void *)(a1 + 32) = v14;
          }
          long long v16 = -[UIGestureDelayedEventComponentDispatcher delayedTouchForTouch:event:](*(void ***)(a1 + 264), v12, a2);
          [*(id *)(a1 + 32) addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
}

- (void)_delayPressesForEvent:(uint64_t)a3 inPhase:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend(a2, "_pressesForGestureRecognizer:withPhase:", a1, a3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = _UIGestureDelayedTouchForUITouch(v10, *(void **)(a1 + 40));

        if (!v11)
        {
          if (!*(void *)(a1 + 40))
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v13 = *(void **)(a1 + 40);
            *(void *)(a1 + 40) = v12;
          }
          id v14 = -[UIGestureDelayedEventComponentDispatcher delayedPressForPress:event:](*(void ***)(a1 + 264), v10, a2);
          [*(id *)(a1 + 40) addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_clearDelayedTouches
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", _clearDelayedTouches___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            os_log_t log = v9;
            uint64_t v10 = [(id)a1 _briefDescription];
            if (v7) {
              id v11 = *(void **)(v7 + 24);
            }
            else {
              id v11 = 0;
            }
            id v12 = v11;
            *(_DWORD *)buf = 138412546;
            id v21 = v10;
            __int16 v22 = 2112;
            id v23 = v12;
            _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "%@: Clearing delay on touch %@", buf, 0x16u);
          }
        }
        -[UIGestureDelayedEventComponentDispatcher removeDelayedTouch:](*(id **)(a1 + 264), v7);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v13 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
      uint64_t v4 = v13;
    }
    while (v13);
  }

  id v14 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
}

- (void)_clearDelayedPresses
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_clearDelayedPresses___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            os_log_t log = v9;
            uint64_t v10 = [(id)a1 _briefDescription];
            if (v7) {
              id v11 = *(void **)(v7 + 24);
            }
            else {
              id v11 = 0;
            }
            id v12 = v11;
            *(_DWORD *)buf = 138412546;
            id v21 = v10;
            __int16 v22 = 2112;
            id v23 = v12;
            _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "%@: Clearing delay on press %@", buf, 0x16u);
          }
        }
        -[UIGestureDelayedEventComponentDispatcher removeDelayedPress:](*(void *)(a1 + 264), v7);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v13 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
      uint64_t v4 = v13;
    }
    while (v13);
  }

  id v14 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;
}

- (BOOL)_isPaused
{
  return 0;
}

- (void)setName:(NSString *)name
{
}

- (void)setDelaysTouchesEnded:(BOOL)delaysTouchesEnded
{
  uint64_t v3 = 0x80000000;
  if (!delaysTouchesEnded) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (void)setEnabled:(BOOL)enabled
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  if ((BYTE4(gestureFlags) & 1) == enabled)
  {
    uint64_t v4 = 0x100000000;
    if (enabled) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_gestureFlags + 8) = *((unsigned char *)&self->_gestureFlags + 8);
    *(void *)&self->_uint64_t gestureFlags = gestureFlags & 0xFFFFFFFEFFFFFFFFLL | v4;
    if ((gestureFlags & 0x200000000) != 0 && !enabled)
    {
      gestureEnvironment = self->_gestureEnvironment;
      v7[0] = self;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)gestureEnvironment, v6);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return 0;
}

- (void)dealloc
{
  failureDependents = self->_failureDependents;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __30__UIGestureRecognizer_dealloc__block_invoke;
  v7[3] = &unk_1E52F0E40;
  v7[4] = self;
  [(NSMutableSet *)failureDependents enumerateObjectsUsingBlock:v7];
  failureRequirements = self->_failureRequirements;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__UIGestureRecognizer_dealloc__block_invoke_2;
  v6[3] = &unk_1E52F0E40;
  v6[4] = self;
  [(NSMutableSet *)failureRequirements enumerateObjectsUsingBlock:v6];
  -[UIGestureRecognizer _enqueueDelayedTouchesToSend]((uint64_t)self);
  -[UIGestureRecognizer _enqueueDelayedPressesToSend]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)UIGestureRecognizer;
  [(UIGestureRecognizer *)&v5 dealloc];
}

- (void)setDelegate:(id)delegate
{
  char v5 = objc_opt_respondsToSelector();
  uint64_t v6 = 16;
  if ((v5 & 1) == 0) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFEFLL | v6;
  char v7 = objc_opt_respondsToSelector();
  uint64_t v8 = 32;
  if ((v7 & 1) == 0) {
    uint64_t v8 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFDFLL | v8;
  char v9 = objc_opt_respondsToSelector();
  uint64_t v10 = 64;
  if ((v9 & 1) == 0) {
    uint64_t v10 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFBFLL | v10;
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFFELL | objc_opt_respondsToSelector() & 1;
  char v11 = objc_opt_respondsToSelector();
  uint64_t v12 = 8;
  if ((v11 & 1) == 0) {
    uint64_t v12 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFF7 | v12;
  char v13 = objc_opt_respondsToSelector();
  uint64_t v14 = 128;
  if ((v13 & 1) == 0) {
    uint64_t v14 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFF7FLL | v14;
  char v15 = objc_opt_respondsToSelector();
  uint64_t v16 = 256;
  if ((v15 & 1) == 0) {
    uint64_t v16 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFEFFLL | v16;
  char v17 = objc_opt_respondsToSelector();
  uint64_t v18 = 1024;
  if ((v17 & 1) == 0) {
    uint64_t v18 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFBFFLL | v18;
  char v19 = objc_opt_respondsToSelector();
  uint64_t v20 = 2048;
  if ((v19 & 1) == 0) {
    uint64_t v20 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFF7FFLL | v20;
  char v21 = objc_opt_respondsToSelector();
  uint64_t v22 = 4096;
  if ((v21 & 1) == 0) {
    uint64_t v22 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFEFFFLL | v22;
  char v23 = objc_opt_respondsToSelector();
  uint64_t v24 = 0x2000;
  if ((v23 & 1) == 0) {
    uint64_t v24 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFDFFFLL | v24;
  char v25 = objc_opt_respondsToSelector();
  uint64_t v26 = 0x4000;
  if ((v25 & 1) == 0) {
    uint64_t v26 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFBFFFLL | v26;
  char v27 = objc_opt_respondsToSelector();
  uint64_t v28 = 0x8000;
  if ((v27 & 1) == 0) {
    uint64_t v28 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFF7FFFLL | v28;
  char v29 = objc_opt_respondsToSelector();
  uint64_t v30 = 0x10000;
  if ((v29 & 1) == 0) {
    uint64_t v30 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFEFFFFLL | v30;
  char v31 = objc_opt_respondsToSelector();
  uint64_t v32 = 0x20000;
  if ((v31 & 1) == 0) {
    uint64_t v32 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFDFFFFLL | v32;
  char v33 = objc_opt_respondsToSelector();
  uint64_t v34 = 0x40000;
  if ((v33 & 1) == 0) {
    uint64_t v34 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFBFFFFLL | v34;
  char v35 = objc_opt_respondsToSelector();
  uint64_t v36 = 0x80000;
  if ((v35 & 1) == 0) {
    uint64_t v36 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFF7FFFFLL | v36;
  char v37 = objc_opt_respondsToSelector();
  uint64_t v38 = 0x100000;
  if ((v37 & 1) == 0) {
    uint64_t v38 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFEFFFFFLL | v38;
  char v39 = objc_opt_respondsToSelector();
  uint64_t v40 = 0x200000;
  if ((v39 & 1) == 0) {
    uint64_t v40 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFDFFFFFLL | v40;
  char v41 = objc_opt_respondsToSelector();
  uint64_t v42 = 2;
  if ((v41 & 1) == 0) {
    uint64_t v42 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFFDLL | v42;
  char v43 = objc_opt_respondsToSelector();
  uint64_t v44 = 4;
  if ((v43 & 1) == 0) {
    uint64_t v44 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFFBLL | v44;
  char v45 = objc_opt_respondsToSelector();
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  uint64_t v47 = 512;
  if ((v45 & 1) == 0) {
    uint64_t v47 = 0;
  }
  unint64_t v48 = gestureFlags & 0xFFFFFFFFFDFFFDFFLL | v47;
  uint64_t v49 = (gestureFlags << 17) & 0x2000000;
  BOOL v50 = (gestureFlags & 0x60080) == 0;
  uint64_t v51 = 0x2000000;
  if (v50) {
    uint64_t v51 = v49;
  }
  *(void *)&self->_uint64_t gestureFlags = v48 | v51;
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)setCancelsTouchesInView:(BOOL)cancelsTouchesInView
{
  uint64_t v3 = 0x20000000;
  if (!cancelsTouchesInView) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (void)setDelaysTouchesBegan:(BOOL)delaysTouchesBegan
{
  uint64_t v3 = 0x40000000;
  if (!delaysTouchesBegan) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFFFFBFFFFFFFLL | v3;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return !_UIDeviceHasExternalTouchInput();
}

- (UIGestureRecognizer)initWithTarget:(id)target action:(SEL)action
{
  v11.receiver = self;
  v11.super_class = (Class)UIGestureRecognizer;
  uint64_t v6 = [(UIGestureRecognizer *)&v11 init];
  char v7 = v6;
  if (v6)
  {
    _UIGestureRecognizerCommonInit((uint64_t)v6);
    if (target)
    {
      if ((dyld_program_sdk_at_least() & 1) != 0
        || (objc_msgSend(target, sel_allowsWeakReference) & 1) != 0)
      {
        if (action) {
          _UIGestureRecognizerAddTargetToArray((id *)&v7->_targets, target, (void *)action);
        }
      }
      else
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __45__UIGestureRecognizer_initWithTarget_action___block_invoke;
        v9[3] = &unk_1E52D9F98;
        v9[4] = target;
        uint64_t v10 = v7;
        if (initWithTarget_action__once != -1) {
          dispatch_once(&initWithTarget_action__once, v9);
        }
      }
    }
  }
  return v7;
}

- (uint64_t)_defaultAllowedTouchTypesMask
{
  if (result)
  {
    if ([(id)objc_opt_class() _supportsDefaultTouchTypes]) {
      goto LABEL_11;
    }
    uint64_t v1 = [(id)objc_opt_class() methodForSelector:sel__shouldDefaultToTouches];
    if (v1 == +[UIGestureRecognizer methodForSelector:sel__shouldDefaultToTouches])return 0; {
    _UIIsPrivateMainBundle();
    }
    if (dyld_program_sdk_at_least())
    {
      id v2 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v3 = [NSString stringWithUTF8String:"BOOL _shouldDefaultToTouchesOverride(UIGestureRecognizer *const __strong)"];
      [v2 handleFailureInFunction:v3 file:@"UIGestureRecognizer.m" lineNumber:3195 description:@"Overriding _shouldDefaultToTouches is no longer supported. Please explicitly set allowedTouchTypes and allowedPressTypes."];
    }
    else
    {
      if (!os_variant_has_internal_diagnostics())
      {
        uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_shouldDefaultToTouchesOverride___s_category) + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)char v5 = 0;
          _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Overriding _shouldDefaultToTouches is no longer supported. Please explicitly set allowedTouchTypes and allowedPressTypes.  This will become an assert in a future version.", v5, 2u);
        }
LABEL_10:
        if ([(id)objc_opt_class() _shouldDefaultToTouches])
        {
LABEL_11:
          if ([(id)objc_opt_class() _supportsStylusTouches]) {
            return 15;
          }
          else {
            return 11;
          }
        }
        return 0;
      }
      id v2 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v2, OS_LOG_TYPE_FAULT, "Overriding _shouldDefaultToTouches is no longer supported. Please explicitly set allowedTouchTypes and allowedPressTypes.  This will become an assert in a future version.", buf, 2u);
      }
    }

    goto LABEL_10;
  }
  return result;
}

- (_UIGestureRecognizerDriver)_driver
{
  return 0;
}

+ (BOOL)_supportsStylusTouches
{
  return 1;
}

- (void)setRequiresExclusiveTouchType:(BOOL)requiresExclusiveTouchType
{
  uint64_t v3 = 0x20000000000;
  if (!requiresExclusiveTouchType) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (void)setAllowedPressTypes:(NSArray *)allowedPressTypes
{
  uint64_t v4 = (NSArray *)[(NSArray *)allowedPressTypes copy];
  char v5 = self->_allowedPressTypes;
  self->_allowedPressTypes = v4;
}

- (NSArray)allowedPressTypes
{
  return self->_allowedPressTypes;
}

- (void)setAllowedTouchTypes:(NSArray *)allowedTouchTypes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_allowedTouchTypes = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = allowedTouchTypes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) integerValue];
        switch(v10)
        {
          case 0:
            int64_t v11 = self->_allowedTouchTypes | 1;
            goto LABEL_11;
          case 1:
            int64_t v11 = self->_allowedTouchTypes | 2;
            goto LABEL_11;
          case 2:
            int64_t v11 = self->_allowedTouchTypes | 4;
            goto LABEL_11;
          case 3:
            int64_t v11 = self->_allowedTouchTypes | 8;
LABEL_11:
            self->_allowedTouchTypes = v11;
            break;
          default:
            [MEMORY[0x1E4F1CA00] raise:v8, @"Invalid value for touch type: %ld. Must be one of UITouchTypeDirect, UITouchTypeIndirect, UITouchTypeStylus, or UITouchTypeIndirectPointer", v10 format];
            break;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v12 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }
}

- (void)_setRequiresSystemGesturesToFail:(BOOL)a3
{
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  if (((((gestureFlags & 0x8000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x8000000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    *((unsigned char *)&self->_gestureFlags + 8) = *((unsigned char *)&self->_gestureFlags + 8);
    *(void *)&self->_uint64_t gestureFlags = gestureFlags & 0xFFFFFF7FFFFFFFFFLL | v4;
    if (a3)
    {
      id v7 = [(UIGestureRecognizer *)self view];
      uint64_t v5 = [v7 window];
      uint64_t v6 = v5;
      if (v5)
      {
        [v5 _createSystemGestureGateGestureRecognizerIfNeeded];
        [v6 _createOtherSystemGateGestureRecognizersIfNeeded];
      }
    }
  }
}

- (void)addTarget:(id)target action:(SEL)action
{
}

- (void)_setRecognitionEvent:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, sel__recognitionEvent, v4, (void *)1);
}

- (NSArray)allowedTouchTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  int64_t allowedTouchTypes = self->_allowedTouchTypes;
  if (allowedTouchTypes)
  {
    [v3 addObject:&unk_1ED3F42D8];
    int64_t allowedTouchTypes = self->_allowedTouchTypes;
    if ((allowedTouchTypes & 2) == 0)
    {
LABEL_3:
      if ((allowedTouchTypes & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((allowedTouchTypes & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:&unk_1ED3F42F0];
  int64_t allowedTouchTypes = self->_allowedTouchTypes;
  if ((allowedTouchTypes & 4) == 0)
  {
LABEL_4:
    if ((allowedTouchTypes & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v4 addObject:&unk_1ED3F4308];
  if ((self->_allowedTouchTypes & 8) != 0) {
LABEL_5:
  }
    [v4 addObject:&unk_1ED3F4320];
LABEL_6:
  uint64_t v6 = (void *)[v4 copy];

  return (NSArray *)v6;
}

- (void)_setKeepTouchesOnContinuation:(BOOL)a3
{
  self->_keepTouchesOnContinuation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedEventComponentDispatcher, 0);
  objc_storeStrong((id *)&self->_gestureEnvironment, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_allowedPressTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeEvents, 0);
  objc_storeStrong((id *)&self->_failureDependents, 0);
  objc_storeStrong((id *)&self->_failureRequirements, 0);
  objc_storeStrong((id *)&self->_beganObservable, 0);
  objc_storeStrong((id *)&self->_forceTargets, 0);
  objc_storeStrong((id *)&self->_touchForceObservableAndClassifierObservation, 0);
  objc_storeStrong((id *)&self->_touchForceObservable, 0);
  objc_storeStrong((id *)&self->_forceClassifier, 0);
  objc_storeStrong((id *)&self->_internalActiveTouches, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_delayedPresses, 0);
  objc_storeStrong((id *)&self->_delayedTouches, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

- (CGPoint)_centroidOfTouches:(id)a3 excludingEnded:(BOOL)a4
{
  double v4 = _CentroidOfTouches(a3, a4);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_componentsEnded:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  uint64_t v7 = [a4 type];
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((unsigned char *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        uint64_t v8 = [(UIGestureRecognizer *)self _driver];
        [v8 touchesEnded:a3 withEvent:a4];
      }
      [(UIGestureRecognizer *)self touchesEnded:a3 withEvent:a4];
      if ((*(void *)&self->_gestureFlags & 0x4000000) != 0)
      {
        uint64_t v9 = (void *)UIApp;
        [v9 _registerEstimatedTouches:a3 event:a4 forTouchable:self];
      }
      break;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      return;
    case 3:
    case 4:
      [(UIGestureRecognizer *)self pressesEnded:a3 withEvent:a4];
      break;
    case 9:
      if ((~*(void *)&self->_gestureFlags & 0x300000000000) == 0)
      {
        [(UIGestureRecognizer *)self _draggingEndedWithEvent:a4];
      }
      break;
    case 11:
      if ((*(void *)&self->_gestureFlags & 0x800000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _hoverExited:a3 withEvent:a4];
        -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      }
      break;
    default:
      if (v7 == 16 && (*(void *)&self->_gestureFlags & 0x4000000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _dynamicButtonsEnded:a3 withEvent:a4];
      }
      break;
  }
}

- (void)setState:(UIGestureRecognizerState)state
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_MergedGlobals_1080);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    char v29 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = [(UIGestureRecognizer *)self _briefDescription];
      char v31 = (void *)v30;
      if ((unint64_t)state > UIGestureRecognizerStateFailed) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = off_1E52F0F58[state];
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = v30;
      __int16 v60 = 2112;
      v61 = v32;
      _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "%@: Setting state to %@", buf, 0x16u);
    }
  }
  int64_t v6 = self->_state;
  if (state < UIGestureRecognizerStateBegan || v6) {
    goto LABEL_6;
  }
  gestureEnvironment = self->_gestureEnvironment;
  if (gestureEnvironment)
  {
    gestureEnvironment->_updateExclusivity = 1;
    int64_t v6 = self->_state;
LABEL_6:
    UIGestureRecognizerState v8 = state;
    switch(v6)
    {
      case 0:
        goto LABEL_7;
      case 1:
        if (state == UIGestureRecognizerStateFailed) {
          goto LABEL_19;
        }
        if (state == UIGestureRecognizerStateBegan) {
          goto LABEL_18;
        }
        UIGestureRecognizerState v8 = state;
        if (state == UIGestureRecognizerStatePossible) {
          UIGestureRecognizerState v8 = UIGestureRecognizerStateBegan;
        }
        break;
      case 2:
        if (state == UIGestureRecognizerStateFailed)
        {
LABEL_19:
          UIGestureRecognizerState v8 = UIGestureRecognizerStateCancelled;
        }
        else if (state == UIGestureRecognizerStateBegan || (UIGestureRecognizerState v8 = state) == UIGestureRecognizerStatePossible)
        {
LABEL_18:
          UIGestureRecognizerState v8 = UIGestureRecognizerStateChanged;
        }
        break;
      case 3:
      case 4:
      case 5:
        return;
      default:
        goto LABEL_24;
    }
    goto LABEL_24;
  }
LABEL_7:
  if ((unint64_t)(state - 1) < 2)
  {
    UIGestureRecognizerState v8 = UIGestureRecognizerStateBegan;
    goto LABEL_23;
  }
  UIGestureRecognizerState v8 = state;
  if (state == UIGestureRecognizerStatePossible) {
    goto LABEL_24;
  }
  if (state == UIGestureRecognizerStateCancelled)
  {
    UIGestureRecognizerState v8 = UIGestureRecognizerStateFailed;
    goto LABEL_24;
  }
  UIGestureRecognizerState v8 = state;
  if ((state & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    UIGestureRecognizerState v8 = UIGestureRecognizerStateEnded;
LABEL_23:
    if (![(UIGestureRecognizer *)self _shouldBegin])
    {
      unint64_t v27 = __UILogGetCategoryCachedImpl("Gesture", &qword_1EB260C58);
      if (*(unsigned char *)v27)
      {
        uint64_t v38 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          char v39 = v38;
          uint64_t v40 = [(UIGestureRecognizer *)self _briefDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = (uint64_t)v40;
          _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "%@: Failing due to NO from gestureRecognizerShouldBegin", buf, 0xCu);
        }
      }
      int64_t state = UIGestureRecognizerStateFailed;
      goto LABEL_26;
    }
  }
LABEL_24:
  if (*(unsigned char *)__UILogGetCategoryCachedImpl("Gesture", &qword_1EB260C60))
  {
    if (v8 == state) {
      goto LABEL_26;
    }
    unint64_t v33 = __UILogGetCategoryCachedImpl("Gesture", &qword_1EB260C68);
    if (*(unsigned char *)v33)
    {
      uint64_t v34 = *(id *)(v33 + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = [(UIGestureRecognizer *)self _briefDescription];
        uint64_t v36 = (void *)v35;
        if ((unint64_t)v8 > UIGestureRecognizerStateFailed) {
          char v37 = 0;
        }
        else {
          char v37 = off_1E52F0F58[v8];
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v59 = v35;
        __int16 v60 = 2112;
        v61 = v37;
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "%@: Invalid state machine transition. Instead setting state to %@", buf, 0x16u);
      }
    }
  }
  int64_t state = v8;
LABEL_26:
  int64_t v9 = self->_state;
  if (v9 != state || v9 == 2)
  {
    self->_int64_t state = state;
    if (state == UIGestureRecognizerStateBegan) {
      *(void *)&self->_gestureFlags |= 0x1000000000uLL;
    }
    uint64_t v10 = state;
    if (v9 != state)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      obuint64_t j = self->_activeEvents;
      uint64_t v43 = [(NSMutableSet *)obj countByEnumeratingWithState:&v52 objects:buf count:16];
      if (v43)
      {
        uint64_t v42 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v53 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(id **)(*((void *)&v52 + 1) + 8 * i);
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v13 = -[UITabBarControllerSidebar _actualFooterContentConfiguration](v12);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v49;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v49 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                  if (objc_opt_respondsToSelector()) {
                    [v18 _gestureRecognizer:self didTransitionToState:state];
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
              }
              while (v15);
            }
          }
          uint64_t v43 = [(NSMutableSet *)obj countByEnumeratingWithState:&v52 objects:buf count:16];
        }
        while (v43);
      }

      uint64_t v10 = self->_state;
    }
    if ((unint64_t)(v10 - 1) <= 2
      && [(UIGestureRecognizer *)self _analyticsIsGestureHandled])
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      char v19 = [(UIGestureRecognizer *)self _allActiveTouches];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v45;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v45 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * k);
            if (v24) {
              *(_WORD *)(v24 + 236) |= 0x400u;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v56 count:16];
        }
        while (v21);
      }
    }
    if (dyld_program_sdk_at_least())
    {
      uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
      if ((gestureFlags & 0x2000000000) == 0)
      {
        BOOL v26 = (gestureFlags & 0x1400000000) == 0x1000000000 && self->_state > 1;
        *((unsigned char *)&self->_gestureFlags + 8) = *((unsigned char *)&self->_gestureFlags + 8);
        *(void *)&self->_uint64_t gestureFlags = gestureFlags & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)v26 << 37);
      }
    }
    -[UIGestureEnvironment setGestureNeedsUpdate:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
    if ((state & 0xFFFFFFFFFFFFFFFELL) == 4 && (*((unsigned char *)&self->_gestureFlags + 8) & 0x40) != 0)
    {
      uint64_t v28 = [(UIGestureRecognizer *)self _driver];
      [v28 fail];
    }
  }
}

- (NSUInteger)numberOfTouches
{
  id v3 = -[UIGestureRecognizer _activeTouchesEvent](self);
  double v4 = [v3 touchesForGestureRecognizer:self];
  NSUInteger v5 = [v4 count];

  return v5;
}

- (id)_activeTouchesEvent
{
  if (a1)
  {
    a1 = [a1 _activeEventOfType:0];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)_analyticsIsGestureHandled
{
  return self->_analyticsGestureHandled;
}

- (NSSet)_allActiveTouches
{
  id v2 = (void *)[(NSMutableSet *)self->_internalActiveTouches copy];
  return (NSSet *)v2;
}

- (void)_touchWasCancelled:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v4 = _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32));
    if (v4)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_touchWasCancelled____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        int64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = v6;
          UIGestureRecognizerState v8 = [(id)a1 _briefDescription];
          int v9 = 138412546;
          uint64_t v10 = v8;
          __int16 v11 = 2112;
          uint64_t v12 = a2;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%@: Cancelling delay of touch %@", (uint8_t *)&v9, 0x16u);
        }
      }
      -[UIGestureDelayedEventComponentDispatcher removeDelayedTouch:](*(id **)(a1 + 264), (uint64_t)v4);
      [*(id *)(a1 + 32) removeObject:v4];
    }
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  -[UIGestureRecognizer _appendDescriptionToString:atLevel:includingDependencies:]((uint64_t)self, v3, 0, 1);
  return (NSString *)v3;
}

- (void)_appendDescriptionToString:(int)a3 atLevel:(int)a4 includingDependencies:
{
  if (a1)
  {
    UIGestureRecognizerState v8 = (void *)MEMORY[0x18C108260]();
    if ([a2 length]) {
      [a2 appendString:@"\n"];
    }
    int v30 = a4;
    if (a3)
    {
      unint64_t v9 = 1;
      do
      {
        [a2 appendString:@"    "];
        ++v9;
      }
      while (v9 <= a3);
    }
    uint64_t v10 = -[UIGestureRecognizer _rawBriefDescription]((void *)a1);
    [a2 appendFormat:@"<%@", v10];

    __int16 v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:v12];
    if ((void *)v13 == v11)
    {
LABEL_11:
    }
    else
    {
      uint64_t v14 = (void *)v13;
      while (1)
      {
        uint64_t v15 = objc_opt_class();

        if (v12 == (void *)v15) {
          break;
        }
        uint64_t v12 = (void *)[v12 superclass];
        uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:v12];
        if (v14 == v11) {
          goto LABEL_11;
        }
      }
    }
    if (objc_opt_class() != v12 && objc_opt_class() != v12)
    {
      uint64_t v16 = NSStringFromClass((Class)v12);
      [a2 appendFormat:@"; baseClass = %@", v16];
    }
    unint64_t v17 = [(id)a1 state];
    if (v17 > 5) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = off_1E52F0F58[v17];
    }
    [a2 appendFormat:@"; int64_t state = %@", v18];
    if (([(id)a1 isEnabled] & 1) == 0) {
      [a2 appendString:@"; enabled = NO"];
    }
    if (([(id)a1 cancelsTouchesInView] & 1) == 0) {
      [a2 appendString:@"; cancelsTouchesInView = NO"];
    }
    if ([(id)a1 delaysTouchesBegan]) {
      [a2 appendString:@"; delaysTouchesBegan = YES"];
    }
    if (([(id)a1 delaysTouchesEnded] & 1) == 0) {
      [a2 appendString:@"; delaysTouchesEnded = NO"];
    }
    char v19 = [(id)a1 view];
    if (v19)
    {
      uint64_t v20 = NSString;
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      char v23 = [v20 stringWithFormat:@"<%@: %p>", v22, v19];
    }
    else
    {
      char v23 = @"(nil)";
    }
    [a2 appendFormat:@"; view = %@", v23];

    uint64_t v24 = [*(id *)(a1 + 24) count];
    char v25 = *(void **)(a1 + 24);
    if (v24 == 1)
    {
      BOOL v26 = [v25 objectAtIndex:0];
      [a2 appendFormat:@"; target= <%@>", v26];

      int v27 = v30;
    }
    else
    {
      int v27 = v30;
      if ((unint64_t)[v25 count] >= 2) {
        [a2 appendFormat:@"; targets= <%@>", *(void *)(a1 + 24)];
      }
    }
    [(id)a1 _appendSubclassDescription:a2];
    if (v27)
    {
      uint64_t v28 = *(void **)(a1 + 160);
      if (v28) {
        -[UIGestureRecognizer _appendDescription:forDependencies:toString:atLevel:](@"must-fail", v28, a2, a3 + 1);
      }
      char v29 = *(void **)(a1 + 168);
      if (v29) {
        -[UIGestureRecognizer _appendDescription:forDependencies:toString:atLevel:](@"must-fail-for", v29, a2, a3 + 1);
      }
    }
    [a2 appendFormat:@">"];
  }
}

- (BOOL)cancelsTouchesInView
{
  return (*(void *)&self->_gestureFlags >> 29) & 1;
}

- (BOOL)delaysTouchesEnded
{
  return (*(void *)&self->_gestureFlags >> 31) & 1;
}

- (id)_rawBriefDescription
{
  if (a1)
  {
    id v2 = (void *)MEMORY[0x1E4F28E78];
    id v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
    NSUInteger v5 = [v2 stringWithFormat:@"%@: %p", v4, a1];

    uint64_t v6 = [a1 name];
    uint64_t v7 = (void *)v6;
    if (v6) {
      [v5 appendFormat:@" (%@)", v6];
    }
  }
  else
  {
    NSUInteger v5 = 0;
  }
  return v5;
}

- (void)_setAcceptsFailureRequiments:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)_shouldBegin
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (~*(_DWORD *)&self->_gestureFlags & 0x20000000 | (unint64_t)(~*((unsigned char *)&self->_gestureFlags + 8) & 8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v3 = 0;
    if ((*(void *)&self->_gestureFlags & 1) == 0) {
      goto LABEL_21;
    }
LABEL_20:
    if (objc_msgSend(WeakRetained, "gestureRecognizerShouldBegin:", self, (void)v21)) {
      goto LABEL_21;
    }
LABEL_31:
    BOOL v19 = 0;
    goto LABEL_32;
  }
  -[UIGestureRecognizer _gatherViewsToQueryForDelegateCall]((uint64_t)self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "gestureRecognizerShouldBegin:", self, (void)v21))
        {
          int v8 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v8 = 1;
LABEL_14:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((*(void *)&self->_gestureFlags & 1) != 0
    && (!v3 || ([v3 containsObject:WeakRetained] & 1) == 0))
  {
    if (!v8) {
      goto LABEL_31;
    }
    goto LABEL_20;
  }
  if (!v8) {
    goto LABEL_31;
  }
LABEL_21:
  if ((*(void *)&self->_gestureFlags & 0x400) != 0
    && ![WeakRetained _gestureRecognizerShouldBegin:self])
  {
    goto LABEL_31;
  }
  uint64_t v10 = [(UIGestureRecognizer *)self _activeEvents];
  __int16 v11 = [MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = [*(id *)(*((void *)&v25 + 1) + 8 * j) touchesForGestureRecognizer:self];
        [v11 unionSet:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v14);
  }

  unint64_t v18 = +[UIEvent _inputPrecisionForTouches:v11];
  self->_inputPrecision = v18;

  BOOL v19 = 1;
LABEL_32:

  return v19;
}

- (id)_activeEvents
{
  id v2 = (void *)[(NSMutableSet *)self->_activeEvents copy];
  return v2;
}

- (BOOL)_inForceCapableEnvironment
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 view];
  id v2 = [v1 traitCollection];
  BOOL v3 = [v2 forceTouchCapability] == 2;

  return v3;
}

- (int64_t)_modifierFlags
{
  return self->_modifierFlags;
}

- (NSMutableSet)_pairedGestureIdentifiers
{
  return (NSMutableSet *)[(UIGestureRecognizer *)self _pairedGestureIdentifiersAndCreate:1];
}

- (id)_pairedGestureIdentifiersAndCreate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = objc_getAssociatedObject(self, a2);
  if (!v6 && v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    objc_setAssociatedObject(self, a2, v6, (void *)1);
  }
  return v6;
}

- (void)_setAnalyticsGestureHandled:(BOOL)a3
{
  self->_analyticsGestureHandled = a3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (id)_activeTouchesForEvent:(id)a3
{
  return -[UIGestureRecognizer _activeComponentsForEvent:]((uint64_t)self, a3);
}

- (id)_activeComponentsForEvent:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = objc_msgSend(a2, "_componentsForGestureRecognizer:", a1, 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v2);
          }
          int v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          unint64_t v9 = [v8 _eventComponentPhase];
          uint64_t v10 = [v9 value];

          if (v10 <= 2)
          {
            if (!v5)
            {
              uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
            }
            [v5 addObject:v8];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)removeTarget:(id)target action:(SEL)action
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  targets = self->_targets;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = targets;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        if (target)
        {
          id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v12) target];
          if (v14 == target)
          {
            id v15 = target;
            if (!action) {
              goto LABEL_23;
            }
            uint64_t v17 = (const char *)[v13 action];

            if (v17 == action)
            {
LABEL_12:
              if (!v10) {
                goto LABEL_13;
              }
              goto LABEL_14;
            }
          }
          else
          {
            id v15 = v14;
            uint64_t v16 = [v13 target];
            if (v16)
            {

              goto LABEL_15;
            }
            if (!action)
            {
LABEL_23:

              if (!v10) {
LABEL_13:
              }
                uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
LABEL_14:
              -[NSMutableArray addObject:](v10, "addObject:", v13, (void)v20);
              goto LABEL_15;
            }
            unint64_t v18 = (const char *)[v13 action];

            if (v18 == action) {
              goto LABEL_12;
            }
          }
        }
        else if (!action {
               || (SEL)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v12), "action", (void)v20) == action)
        }
        {
          goto LABEL_12;
        }
LABEL_15:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v19 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v9 = v19;
      if (!v19)
      {

        if (v10)
        {
          [(NSMutableArray *)v7 removeObjectsInArray:v10];
          goto LABEL_29;
        }
        return;
      }
    }
  }
  uint64_t v10 = v7;
LABEL_29:
}

- (void)_setCanExcludeWithActiveRequirements:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)requireGestureRecognizerToFail:(UIGestureRecognizer *)otherGestureRecognizer
{
  if (otherGestureRecognizer == self)
  {
    if (dyld_program_sdk_at_least())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__UIGestureRecognizer_requireGestureRecognizerToFail___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = otherGestureRecognizer;
      if (requireGestureRecognizerToFail__once != -1) {
        dispatch_once(&requireGestureRecognizerToFail__once, block);
      }
    }
  }
  else if ((*(void *)&self->_gestureFlags & 0x10000000000) != 0 {
         && (!dyld_program_sdk_at_least()
  }
          || [(UIGestureRecognizer *)otherGestureRecognizer _acceptsFailureRequirements]))
  {
    -[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
    failureRequirements = self->_failureRequirements;
    if (!failureRequirements)
    {
      Mutable = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
      uint64_t v7 = self->_failureRequirements;
      self->_failureRequirements = Mutable;

      failureRequirements = self->_failureRequirements;
    }
    [(NSMutableSet *)failureRequirements addObject:otherGestureRecognizer];
    if (otherGestureRecognizer)
    {
      failureDependents = otherGestureRecognizer->_failureDependents;
      if (!failureDependents)
      {
        uint64_t v9 = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
        uint64_t v10 = otherGestureRecognizer->_failureDependents;
        otherGestureRecognizer->_failureDependents = v9;

        failureDependents = otherGestureRecognizer->_failureDependents;
      }
      [(NSMutableSet *)failureDependents addObject:self];
    }
  }
}

- (BOOL)_acceptsFailureRequirements
{
  return (*(void *)&self->_gestureFlags >> 40) & 1;
}

- (double)lastTouchTimestamp
{
  return self->_lastTouchTimestamp;
}

uint64_t __30__UIGestureRecognizer_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 160) removeObject:*(void *)(a1 + 32)];
}

- (CGPoint)locationInView:(UIView *)view
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[UIGestureRecognizer _activeTouchesEvent](self);
  uint64_t v6 = [v5 touchesForGestureRecognizer:self];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "locationInView:", view, (void)v21);
        int v11 = (int)(v15 + (double)v11);
        int v12 = (int)(v16 + (double)v12);
      }
      v10 += v9;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);

    double v17 = (double)(v11 / v10);
    double v18 = (double)(v12 / v10);
  }
  else
  {

    double v17 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v19 = v17;
  double v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)_componentsChanged:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = [a4 type];
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 0xA) {
    -[UIGestureRecognizer _addActiveEvent:]((uint64_t)self, (uint64_t)a4);
  }
  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((unsigned char *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        uint64_t v8 = [(UIGestureRecognizer *)self _driver];
        [v8 touchesMoved:a3 withEvent:a4];
      }
      [(UIGestureRecognizer *)self touchesMoved:a3 withEvent:a4];
      if ((*(void *)&self->_gestureFlags & 0x4000000) != 0)
      {
        uint64_t v9 = (void *)UIApp;
        [v9 _registerEstimatedTouches:a3 event:a4 forTouchable:self];
      }
      break;
    case 3:
    case 4:
      [(UIGestureRecognizer *)self pressesChanged:a3 withEvent:a4];
      break;
    case 9:
      if ((~*(void *)&self->_gestureFlags & 0x300000000000) == 0)
      {
        [(UIGestureRecognizer *)self _draggingUpdatedWithEvent:a4];
      }
      break;
    case 10:
      if ((*(void *)&self->_gestureFlags & 0x1000000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _scrollingChangedWithEvent:a4];
      }
      break;
    case 11:
      if ((*(void *)&self->_gestureFlags & 0x800000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _hoverMoved:a3 withEvent:a4];
      }
      break;
    case 14:
      if ((*((unsigned char *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        int v10 = [(UIGestureRecognizer *)self _driver];
        [v10 transformChangedWithEvent:a4];
      }
      if ((*(void *)&self->_gestureFlags & 0x2000000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _transformChangedWithEvent:a4];
      }
      break;
    case 16:
      if ((*(void *)&self->_gestureFlags & 0x4000000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _dynamicButtonsChanged:a3 withEvent:a4];
      }
      break;
    default:
      return;
  }
}

- (BOOL)_hasUnmetFailureRequirements
{
  if (-[UIGestureEnvironment unmetRequirementsForGestureRecognizer:]((uint64_t)self->_gestureEnvironment, (uint64_t)self))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(UIGestureRecognizer *)self _shouldDelayUntilForceLevelRequirementIsMet];
    if (v3) {
      LOBYTE(v3) = (*(void *)&self->_gestureFlags & 0x80000000000) == 0;
    }
  }
  return v3;
}

- (BOOL)_isTouchGestureRecognizer
{
  id v2 = [(UIGestureRecognizer *)self allowedTouchTypes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (BOOL)_shouldDefaultToTouches
{
  return 1;
}

+ (BOOL)_shouldUseLinearForceLevelClassifier
{
  return 0;
}

void __45__UIGestureRecognizer_initWithTarget_action___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_6)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a target. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v5, 0x16u);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIGestureRecognizer)initWithCoder:(NSCoder *)coder
{
  if (dyld_program_sdk_at_least())
  {
    int v5 = [(UIGestureRecognizer *)self init];
    if (!v5) {
      return v5;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UIGestureRecognizer;
    uint64_t v6 = [(UIGestureRecognizer *)&v23 init];
    int v5 = v6;
    if (!v6) {
      return v5;
    }
    _UIGestureRecognizerCommonInit((uint64_t)v6);
  }
  BOOL v7 = [(NSCoder *)coder decodeBoolForKey:@"UIGestureRecognizer.disabled"];
  uint64_t v8 = 0x100000000;
  if (!v7) {
    uint64_t v8 = 0;
  }
  *(void *)&v5->_uint64_t gestureFlags = *(void *)&v5->_gestureFlags & 0xFFFFFFFEFFFFFFFFLL | v8;
  if ([(NSCoder *)coder containsValueForKey:@"UIGestureRecognizer.cancelsTouchesInView"])
  {
    BOOL v9 = [(NSCoder *)coder decodeBoolForKey:@"UIGestureRecognizer.cancelsTouchesInView"];
    uint64_t v10 = 0x20000000;
    if (!v9) {
      uint64_t v10 = 0;
    }
    *(void *)&v5->_uint64_t gestureFlags = *(void *)&v5->_gestureFlags & 0xFFFFFFFFDFFFFFFFLL | v10;
  }
  if ([(NSCoder *)coder containsValueForKey:@"UIGestureRecognizer.delaysTouchesBegan"])
  {
    BOOL v11 = [(NSCoder *)coder decodeBoolForKey:@"UIGestureRecognizer.delaysTouchesBegan"];
    uint64_t v12 = 0x40000000;
    if (!v11) {
      uint64_t v12 = 0;
    }
    *(void *)&v5->_uint64_t gestureFlags = *(void *)&v5->_gestureFlags & 0xFFFFFFFFBFFFFFFFLL | v12;
  }
  if ([(NSCoder *)coder containsValueForKey:@"UIGestureRecognizer.delaysTouchesEnded"])
  {
    BOOL v13 = [(NSCoder *)coder decodeBoolForKey:@"UIGestureRecognizer.delaysTouchesEnded"];
    uint64_t v14 = 0x80000000;
    if (!v13) {
      uint64_t v14 = 0;
    }
    *(void *)&v5->_uint64_t gestureFlags = *(void *)&v5->_gestureFlags & 0xFFFFFFFF7FFFFFFFLL | v14;
  }
  if ([(NSCoder *)coder containsValueForKey:@"UIGestureRecognizer.allowedTouchTypes"]) {
    v5->_int64_t allowedTouchTypes = [(NSCoder *)coder decodeIntegerForKey:@"UIGestureRecognizer.allowedTouchTypes"];
  }
  double v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  double v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  uint64_t v18 = [(NSCoder *)coder decodeObjectOfClasses:v17 forKey:@"UIGestureRecognizer.allowedPressTypes"];
  allowedPressTypes = v5->_allowedPressTypes;
  v5->_allowedPressTypes = (NSArray *)v18;

  if ([(NSCoder *)coder containsValueForKey:@"UIGestureRecognizer.requiredPreviewForceState"])
  {
    v5->_requiredPreviewForceState = [(NSCoder *)coder decodeIntegerForKey:@"UIGestureRecognizer.requiredPreviewForceState"];
  }
  if ([(NSCoder *)coder containsValueForKey:@"UIGestureRecognizer.requiresExclusiveTouchType"])
  {
    BOOL v20 = [(NSCoder *)coder decodeBoolForKey:@"UIGestureRecognizer.requiresExclusiveTouchType"];
    uint64_t v21 = 0x20000000000;
    if (!v20) {
      uint64_t v21 = 0;
    }
    *(void *)&v5->_uint64_t gestureFlags = *(void *)&v5->_gestureFlags & 0xFFFFFDFFFFFFFFFFLL | v21;
  }
  if ([(NSCoder *)coder containsValueForKey:@"UIGestureRecognizer._analyticsGestureHandled"])
  {
    v5->_analyticsGestureHandled = [(NSCoder *)coder decodeBoolForKey:@"UIGestureRecognizer._analyticsGestureHandled"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x100000000) != 0)
  {
    [a3 encodeBool:1 forKey:@"UIGestureRecognizer.disabled"];
    uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
    if ((gestureFlags & 0x20000000) != 0)
    {
LABEL_3:
      if ((gestureFlags & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((gestureFlags & 0x20000000) != 0)
  {
    goto LABEL_3;
  }
  [a3 encodeBool:0 forKey:@"UIGestureRecognizer.cancelsTouchesInView"];
  uint64_t gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x40000000) == 0)
  {
LABEL_4:
    if ((gestureFlags & 0x80000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  [a3 encodeBool:1 forKey:@"UIGestureRecognizer.delaysTouchesBegan"];
  if ((*(void *)&self->_gestureFlags & 0x80000000) == 0) {
LABEL_5:
  }
    [a3 encodeBool:0 forKey:@"UIGestureRecognizer.delaysTouchesEnded"];
LABEL_6:
  [a3 encodeInteger:self->_allowedTouchTypes forKey:@"UIGestureRecognizer.allowedTouchTypes"];
  if ([(NSArray *)self->_allowedPressTypes count]) {
    [a3 encodeObject:self->_allowedPressTypes forKey:@"UIGestureRecognizer.allowedPressTypes"];
  }
  int64_t requiredPreviewForceState = self->_requiredPreviewForceState;
  if (requiredPreviewForceState) {
    [a3 encodeInteger:requiredPreviewForceState forKey:@"UIGestureRecognizer.requiredPreviewForceState"];
  }
  [a3 encodeBool:(*(void *)&self->_gestureFlags >> 41) & 1 forKey:@"UIGestureRecognizer.requiresExclusiveTouchType"];
  BOOL analyticsGestureHandled = self->_analyticsGestureHandled;
  [a3 encodeBool:analyticsGestureHandled forKey:@"UIGestureRecognizer._analyticsGestureHandled"];
}

uint64_t __30__UIGestureRecognizer_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 168) removeObject:*(void *)(a1 + 32)];
}

- (void)_componentsCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  uint64_t v7 = [a4 type];
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((unsigned char *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        uint64_t v8 = [(UIGestureRecognizer *)self _driver];
        [v8 touchesCancelled:a3 withEvent:a4];
      }
      [(UIGestureRecognizer *)self touchesCancelled:a3 withEvent:a4];
      if ((*(void *)&self->_gestureFlags & 0x4000000) != 0)
      {
        BOOL v9 = (void *)UIApp;
        [v9 _registerEstimatedTouches:a3 event:a4 forTouchable:self];
      }
      break;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      return;
    case 3:
    case 4:
      [(UIGestureRecognizer *)self pressesCancelled:a3 withEvent:a4];
      break;
    case 9:
      if ((~*(void *)&self->_gestureFlags & 0x300000000000) == 0)
      {
        [(UIGestureRecognizer *)self _draggingExitedWithEvent:a4];
      }
      break;
    case 11:
      if ((*(void *)&self->_gestureFlags & 0x800000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _hoverCancelled:a3 withEvent:a4];
        -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      }
      break;
    default:
      if (v7 == 16 && (*(void *)&self->_gestureFlags & 0x4000000000000000) != 0)
      {
        [(UIGestureRecognizer *)self _dynamicButtonsCancelled:a3 withEvent:a4];
      }
      break;
  }
}

+ (BOOL)_supportsTouchContinuation
{
  return 1;
}

- (void)_addTouch:(id)a3 forEvent:(id)a4
{
  if ([(id)objc_opt_class() _supportsTouchContinuation]
    && ([(NSMutableSet *)self->_internalActiveTouches containsObject:a3] & 1) == 0)
  {
    -[UITouch _addGestureRecognizer:]((uint64_t)a3, self);
    [a4 _addTouch:a3 forDelayedDelivery:1];
    if ((unint64_t)([a3 phase] - 5) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      gestureEnvironment = self->_gestureEnvironment;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __42__UIGestureRecognizer__addTouch_forEvent___block_invoke;
      aBlock[3] = &unk_1E52DCB30;
      aBlock[4] = a3;
      aBlock[5] = self;
      aBlock[6] = a4;
      -[UIGestureEnvironment _addPreUpdateAction:]((uint64_t)gestureEnvironment, aBlock);
    }
  }
}

uint64_t __42__UIGestureRecognizer__addTouch_forEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) phase];
  [*(id *)(a1 + 32) setPhase:0];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  [v3 _componentsBegan:v4 withEvent:*(void *)(a1 + 48)];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    *(void *)(v5 + 8) |= 0x200000000uLL;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 setPhase:v2];
}

- (void)_removeTouch:(id)a3 forEvent:(id)a4
{
}

- (void)_removeTouch:(uint64_t)a3 forEvent:(char)a4 byCancellingTouches:
{
  if (a1)
  {
    if ([*(id *)(a1 + 96) containsObject:a2])
    {
      uint64_t v8 = *(void *)(a1 + 256);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65__UIGestureRecognizer__removeTouch_forEvent_byCancellingTouches___block_invoke;
      v9[3] = &unk_1E52DC3F8;
      v9[4] = a1;
      void v9[5] = a2;
      char v10 = a4;
      v9[6] = a3;
      -[UIGestureEnvironment _addPreUpdateAction:](v8, v9);
    }
  }
}

uint64_t __65__UIGestureRecognizer__removeTouch_forEvent_byCancellingTouches___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(void *)(v2 + 8) |= 0x200000000uLL;
  }
  uint64_t v3 = [*(id *)(a1 + 40) phase];
  uint64_t v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 56))
  {
    [v4 setPhase:4];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v5 _componentsCancelled:v6 withEvent:*(void *)(a1 + 48)];
  }
  else
  {
    [v4 setPhase:3];
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v7 _componentsEnded:v6 withEvent:*(void *)(a1 + 48)];
  }

  [*(id *)(a1 + 48) _removeTouch:*(void *)(a1 + 40) fromGestureRecognizer:*(void *)(a1 + 32)];
  -[UITouch _removeGestureRecognizer:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  uint64_t v8 = *(void **)(a1 + 40);
  return [v8 setPhase:v3];
}

- (void)transferTouchesFromGestureRecognizer:(void *)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a2;
    if (a2)
    {
      uint64_t v3 = a1;
      uint64_t v4 = (void *)UIApp;
      uint64_t v5 = [a1 view];
      uint64_t v6 = [v5 _window];
      id v7 = (id)[v4 _touchesEventForWindow:v6];

      uint64_t v8 = (void *)UIApp;
      BOOL v9 = [v2 view];
      char v10 = [v9 _window];
      id v11 = (id)[v8 _touchesEventForWindow:v10];

      if (v7 != v11)
      {
        long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:sel_transferTouchesFromGestureRecognizer_, v3, @"UIGestureRecognizer.m", 1433, @"%@ is not in the same window scene as %@", v2, v3 object file lineNumber description];
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      obuint64_t j = v2[12];
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v36;
        long long v28 = v3;
        do
        {
          uint64_t v15 = 0;
          uint64_t v29 = v13;
          do
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
            double v17 = [v3 view];
            uint64_t v18 = [v17 _window];

            if (!v18
              || ([v16 window],
                  double v19 = objc_claimAutoreleasedReturnValue(),
                  v19,
                  v18 == v19))
            {
              [v2 _removeTouch:v16 forEvent:v7];
            }
            else
            {
              uint64_t v20 = v14;
              uint64_t v21 = v2;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              long long v22 = [v16 gestureRecognizers];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v32;
                do
                {
                  uint64_t v26 = 0;
                  do
                  {
                    if (*(void *)v32 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    [*(id *)(*((void *)&v31 + 1) + 8 * v26++) _removeTouch:v16 forEvent:v7];
                  }
                  while (v24 != v26);
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
                }
                while (v24);
              }

              [v16 setWindow:v18];
              uint64_t v2 = v21;
              uint64_t v14 = v20;
              uint64_t v3 = v28;
              uint64_t v13 = v29;
            }
            [v3 _addTouch:v16 forEvent:v7];

            ++v15;
          }
          while (v15 != v13);
          uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)addTouchesFromGestureRecognizer:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    uint64_t v4 = (void *)UIApp;
    uint64_t v5 = [a1 view];
    uint64_t v6 = [v5 _window];
    id v7 = (id)[v4 _touchesEventForWindow:v6];

    uint64_t v8 = (void *)UIApp;
    BOOL v9 = [a2 view];
    char v10 = [v9 _window];
    id v11 = (id)[v8 _touchesEventForWindow:v10];

    if (v7 != v11)
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel_addTouchesFromGestureRecognizer_, a1, @"UIGestureRecognizer.m", 1456, @"%@ is not in the same window scene as %@", a2, a1 object file lineNumber description];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = a2[12];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [a1 _addTouch:*(void *)(*((void *)&v18 + 1) + 8 * v16++) forEvent:v7];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)ignorePress:(UIPress *)button forEvent:(UIPressesEvent *)event
{
  if (self)
  {
    uint64_t v6 = _UIGestureDelayedTouchForUITouch(button, self->_delayedPresses);
    if (v6)
    {
      -[UIGestureDelayedEventComponentDispatcher enqueueDelayedPressToSend:]((uint64_t)self->_delayedEventComponentDispatcher, (uint64_t)v6);
      [(NSMutableArray *)self->_delayedPresses removeObject:v6];
    }
  }
  -[UIPress _removeGestureRecognizer:](button, "_removeGestureRecognizer:", self, event);
}

- (id)_activePressesEvent
{
  if (a1)
  {
    a1 = [a1 _activeEventOfType:3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_pressWasCancelled:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 40));
    if (v4)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_pressWasCancelled____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v7 = v6;
          uint64_t v8 = [(id)a1 _briefDescription];
          int v9 = 138412546;
          char v10 = v8;
          __int16 v11 = 2112;
          id v12 = a2;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%@: Cancelling delay of press %@", (uint8_t *)&v9, 0x16u);
        }
      }
      -[UIGestureDelayedEventComponentDispatcher removeDelayedPress:](*(void *)(a1 + 264), (uint64_t)v4);
      [*(id *)(a1 + 40) removeObject:v4];
    }
  }
}

- (BOOL)_wantsHoverEventsWhilePointerIsLocked
{
  return 0;
}

- (uint64_t)_shouldReceivePress:(uint64_t)a3 forPressesEvent:
{
  if (result)
  {
    uint64_t v5 = result;
    unint64_t v6 = *(void *)(result + 8);
    if ((~v6 & 0x80000200000000) != 0)
    {
      int v7 = [(id)result _shouldReceiveEvent:a3];
      uint64_t v8 = 0x80000000000000;
      if (v7) {
        uint64_t v8 = 0x180000000000000;
      }
      unint64_t v6 = *(void *)(v5 + 8) & 0xFE7FFFFFFFFFFFFFLL | v8;
      *(void *)(v5 + 8) = v6;
    }
    if ((v6 & 0x100000000000000) != 0)
    {
      CGPoint result = -[UIGestureRecognizer _delegateShouldReceivePressesEvent:](v5, a3);
      if (result)
      {
        CGPoint result = [(id)v5 _shouldReceivePress:a2];
        if (result)
        {
          CGPoint result = -[UIGestureRecognizer _delegateShouldReceivePress:](v5, a2);
          if (result)
          {
            if ((*(unsigned char *)(v5 + 16) & 0x40) != 0)
            {
              int v9 = [(id)v5 _driver];
              uint64_t v10 = [v9 shouldReceiveComponent:a2 withEvent:a3];

              return v10;
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_delegateShouldReceivePressesEvent:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    unint64_t v3 = *(void *)(result + 8);
    if ((~v3 & 0x200000200000000) != 0)
    {
      int v4 = -[UIGestureRecognizer _delegateShouldReceiveEvent:](result, a2);
      uint64_t v5 = 0x200000000000000;
      if (v4) {
        uint64_t v5 = 0x600000000000000;
      }
      unint64_t v3 = *(void *)(v2 + 8) & 0xF9FFFFFFFFFFFFFFLL | v5;
      *(void *)(v2 + 8) = v3;
    }
    return (v3 >> 58) & 1;
  }
  return result;
}

- (uint64_t)_delegateShouldReceivePress:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  uint64_t v5 = WeakRetained;
  uint64_t v6 = *(void *)(a1 + 8);
  if ((v6 & 0x10000) == 0) {
    goto LABEL_5;
  }
  if ([WeakRetained _gestureRecognizer:a1 shouldReceivePress:a2])
  {
    uint64_t v6 = *(void *)(a1 + 8);
LABEL_5:
    if ((v6 & 0x40) != 0) {
      uint64_t v7 = [v5 gestureRecognizer:a1 shouldReceivePress:a2];
    }
    else {
      uint64_t v7 = 1;
    }
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  if (!a3) {
    return 1;
  }
  int v4 = [(UIGestureRecognizer *)self allowedPressTypes];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "type"));
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (uint64_t)_delegateShouldReceiveDynamicButtonEvent:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    unint64_t v3 = *(unsigned __int8 *)(result + 16);
    if (~*(void *)(result + 8) & 0x200000000 | ~(_BYTE)v3 & 2)
    {
      int v4 = -[UIGestureRecognizer _delegateShouldReceiveEvent:](result, a2);
      uint64_t v5 = 2;
      if (v4) {
        uint64_t v5 = 6;
      }
      unint64_t v3 = *(unsigned char *)(v2 + 16) & 0xF9 | (unint64_t)v5;
      *(unsigned char *)(v2 + 16) = v3;
    }
    return (v3 >> 2) & 1;
  }
  return result;
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  return 1;
}

- (uint64_t)_delegateShouldReceiveDynamicButton:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  uint64_t v5 = WeakRetained;
  if ((*(void *)(a1 + 8) & 0x200000) != 0) {
    uint64_t v6 = [WeakRetained _gestureRecognizer:a1 shouldReceiveDynamicButton:a2];
  }
  else {
    uint64_t v6 = 1;
  }

  return v6;
}

- (uint64_t)_shouldReceiveDynamicButton:(uint64_t)a3 forEvent:
{
  if (!a1) {
    return 0;
  }
  if ((~*(void *)(a1 + 8) & 0x8000000200000000) != 0)
  {
    char v6 = *(unsigned char *)(a1 + 16) & 0xFE | ([(id)a1 _shouldReceiveEvent:a3] != 0);
    *(void *)(a1 + 8) |= 0x8000000000000000;
    *(unsigned char *)(a1 + 16) = v6;
    if ((v6 & 1) == 0) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a1 + 16) & 1) == 0)
  {
    return 0;
  }
  if (!-[UIGestureRecognizer _delegateShouldReceiveDynamicButtonEvent:](a1, a3)
    || ![(id)a1 _shouldReceiveDynamicButton:a2])
  {
    return 0;
  }
  return -[UIGestureRecognizer _delegateShouldReceiveDynamicButton:](a1, a2);
}

- (int64_t)_buttonMask
{
  return self->_buttonMask;
}

- (int64_t)_defaultAllowedMouseButtons
{
  return 1;
}

- (id)_beganObservable
{
  if (a1)
  {
    a1 = (id *)a1[19];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_ensureForceObservationChain
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 104);
    if (!v2)
    {
      int v3 = [(id)objc_opt_class() _shouldUseLinearForceLevelClassifier];
      int v4 = off_1E52D5A88;
      if (!v3) {
        int v4 = off_1E52D5D38;
      }
      id v5 = objc_alloc_init(*v4);
      char v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      uint64_t v2 = *(void **)(a1 + 104);
    }
    uint64_t v7 = [v2 delegate];

    if (v7 != (void *)a1) {
      [*(id *)(a1 + 104) setDelegate:a1];
    }
    if (!*(void *)(a1 + 120))
    {
      uint64_t v8 = objc_alloc_init(_UITouchForceObservable);
      int v9 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v8;

      *(void *)(a1 + 144) = 0;
      *(void *)(a1 + 8) &= 0xFFF9FFFFFFFFFFFFLL;
      id v10 = objc_alloc_init(MEMORY[0x1E4F28EF0]);
      __int16 v11 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v10;
    }
    if (!*(void *)(a1 + 128))
    {
      uint64_t v12 = [*(id *)(a1 + 120) addObserver:*(void *)(a1 + 104)];
      uint64_t v13 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v12;
    }
  }
}

- (uint64_t)_delegateCanCancelGestureRecognizer:(uint64_t)a1
{
  if ((*(void *)(a1 + 8) & 0x80000) == 0) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  uint64_t v6 = [WeakRetained _gestureRecognizer:a1 canCancelGestureRecognizer:a2];

  return v6;
}

- (uint64_t)_delegateCanBeCancelledByGestureRecognizer:(uint64_t)a1
{
  if (!a1 || (*(void *)(a1 + 8) & 0x100000) == 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  uint64_t v6 = [WeakRetained _gestureRecognizer:a1 canBeCancelledByGestureRecognizer:a2];

  return v6;
}

void __54__UIGestureRecognizer_requireGestureRecognizerToFail___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_LinkCheckShouldFailOnPressesBeganIfNotTrackingTouches_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Attempting set a failure requirement between a gesture recognizer and itself. (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_failureDependents
{
  if (a1)
  {
    a1 = (id *)a1[21];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)removeFailureRequirement:(id)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    -[UIGestureEnvironment removeRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self->_gestureEnvironment, (uint64_t)self, (uint64_t)a3);
    [(NSMutableSet *)self->_failureRequirements removeObject:a3];
    [*((id *)a3 + 21) removeObject:self];
    -[UIGestureRecognizer _requiredGestureRecognizerCompletedOrWasUnrelated:]((uint64_t)self, a3);
    gestureEnvironment = self->_gestureEnvironment;
    v7[0] = self;
    v7[1] = a3;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
    -[UIGestureEnvironment _queueGestureRecognizersForResetIfFinished:]((uint64_t)gestureEnvironment, v6);
  }
}

- (BOOL)_canExcludeWithActiveRequirements
{
  return (*(void *)&self->_gestureFlags >> 47) & 1;
}

- (int64_t)requiredPreviewForceState
{
  return self->_requiredPreviewForceState;
}

- (void)setRequiredPreviewForceState:(int64_t)a3
{
  if (a3 && -[UIGestureRecognizer _inForceCapableEnvironment](self)) {
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
  }
  [(UIGestureRecognizer *)self willChangeValueForKey:@"requiredPreviewForceState"];
  self->_int64_t requiredPreviewForceState = a3;
  [(UIGestureRecognizer *)self didChangeValueForKey:@"requiredPreviewForceState"];
}

- (int64_t)currentPreviewForceState
{
  int64_t result = (int64_t)self->_forceClassifier;
  if (result) {
    return [(id)result currentForceLevel];
  }
  return result;
}

- (id)_touchForceObservable
{
  touchForceObservable = self->_touchForceObservable;
  if (!touchForceObservable)
  {
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
    touchForceObservable = self->_touchForceObservable;
  }
  return touchForceObservable;
}

- (id)_forceLevelClassifier
{
  forceClassifier = self->_forceClassifier;
  if (!forceClassifier)
  {
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
    forceClassifier = self->_forceClassifier;
  }
  return forceClassifier;
}

- (void)_setForceLevelClassifier:(id)a3
{
  p_forceClassifier = &self->_forceClassifier;
  forceClassifier = self->_forceClassifier;
  if (forceClassifier != a3)
  {
    [(_UIForceLevelClassifier *)forceClassifier setDelegate:0];
    touchForceObservableAndClassifierObservation = self->_touchForceObservableAndClassifierObservation;
    self->_touchForceObservableAndClassifierObservation = 0;

    objc_storeStrong((id *)p_forceClassifier, a3);
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
  }
}

- (void)_forceLevelClassifier:(id)a3 currentForceLevelDidChange:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((*(void *)&self->_gestureFlags & 0x80000000000) == 0
    && -[UIGestureRecognizer _shouldDelayUntilForceLevelRequirementIsMet](self, "_shouldDelayUntilForceLevelRequirementIsMet")&& self->_requiredPreviewForceState <= [a3 currentForceLevel])
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_forceLevelClassifier_currentForceLevelDidChange____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      __int16 v11 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v11;
        uint64_t v13 = [(UIGestureRecognizer *)self _briefDescription];
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Force requirement for satisfied", (uint8_t *)&v14, 0xCu);
      }
    }
    *(void *)&self->_gestureFlags |= 0x80000000000uLL;
    -[UIGestureEnvironment setGestureNeedsUpdate:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
  }
  if ([a3 currentForceLevel] != a4)
  {
    if (!self->_state && (*(void *)&self->_gestureFlags & 0x2000000000000) == 0)
    {
      BOOL v8 = [(UIGestureRecognizer *)self _shouldBegin];
      uint64_t v9 = 0x2000000000000;
      if (v8) {
        uint64_t v9 = 0x6000000000000;
      }
      *(void *)&self->_uint64_t gestureFlags = *(void *)&self->_gestureFlags & 0xFFF9FFFFFFFFFFFFLL | v9;
    }
    if ([a3 currentForceLevel] > a4)
    {
      uint64_t v10 = [a3 currentForceLevel];
      if (v10 == [(UIGestureRecognizer *)self requiredPreviewForceState]) {
        ++self->_forcePressCount;
      }
    }
    if ((*(void *)&self->_gestureFlags & 0x4000000000000) != 0)
    {
      if ([(NSMutableArray *)self->_forceTargets count]) {
        _UIGestureRecognizerSendTargetActions((uint64_t)self, self->_forceTargets);
      }
    }
  }
}

- (void)_addForceTarget:(void *)a3 action:
{
  if (a1)
  {
    uint64_t v5 = (id *)(a1 + 136);
    if (!*(void *)(a1 + 136))
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      id v7 = *v5;
      *uint64_t v5 = (id)v6;
    }
    _UIGestureRecognizerAddTargetToArray(v5, a2, a3);
  }
}

- (NSString)_briefDescription
{
  uint64_t v3 = NSString;
  int v4 = -[UIGestureRecognizer _rawBriefDescription](self);
  UIGestureRecognizerState v5 = [(UIGestureRecognizer *)self state];
  if ((unint64_t)v5 > UIGestureRecognizerStateFailed) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E52F0F58[v5];
  }
  id v7 = [v3 stringWithFormat:@"<%@ state = %@>", v4, v6];;

  return (NSString *)v7;
}

- (uint64_t)_appendDescription:(uint64_t)a1 forDependencies:(void *)a2 toString:(void *)a3 atLevel:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a3 appendFormat:@"; %@ = {", a1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a2;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((v11 & 1) == 0) {
          [a3 appendString:@","];
        }
        -[UIGestureRecognizer _appendDescriptionToString:atLevel:includingDependencies:](v13, a3, (a4 + 1), 0);
        char v11 = 0;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      char v11 = 0;
    }
    while (v9);
  }

  [a3 appendString:@"\n"];
  if (a4)
  {
    unint64_t v14 = 1;
    do
    {
      [a3 appendString:@"    "];
      ++v14;
    }
    while (v14 <= a4);
  }
  return [a3 appendString:@"}"];
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    id v6 = a4;
  }
  else
  {
    id v7 = [(UIGestureRecognizer *)self view];
    id v6 = [v7 window];
  }
  uint64_t v8 = [v6 _window];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_convertPointFromSceneReferenceSpace:", x, y);
    double x = v10;
    double y = v11;
  }
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    id v6 = a4;
  }
  else
  {
    id v7 = [(UIGestureRecognizer *)self view];
    id v6 = [v7 window];
  }
  uint64_t v8 = [v6 _window];
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  double v11 = v9;
  double v12 = v10;
  if (v8)
  {
    objc_msgSend(v8, "_convertPointToSceneReferenceSpace:", v9, v10);
    double v11 = v13;
    double v12 = v14;
  }

  double v15 = v11;
  double v16 = v12;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)locationOfTouch:(NSUInteger)touchIndex inView:(UIView *)view
{
  uint64_t v8 = -[UIGestureRecognizer _activeTouchesEvent](self);
  double v9 = [v8 touchesForGestureRecognizer:self];

  if ([v9 count] <= touchIndex)
  {
    double v17 = NSString;
    long long v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    long long v20 = NSStringFromSelector(a2);
    double v11 = [v17 stringWithFormat:@"-[%@ %@]", v19, v20];

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%ld) beyond bounds (%ld).", v11, touchIndex, objc_msgSend(v9, "count") format];
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double v10 = [v9 allObjects];
    double v11 = [v10 sortedArrayUsingSelector:sel__compareIndex_];

    double v12 = [v11 objectAtIndex:touchIndex];
    [v12 locationInView:view];
    double v14 = v13;
    double v16 = v15;
  }
  double v21 = v14;
  double v22 = v16;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (id)_defaultAllowedTouchTypes
{
  if (a1)
  {
    unint64_t v2 = -[UIGestureRecognizer _defaultAllowedTouchTypesMask]((uint64_t)a1);
    a1 = _UIGestureRecognizerAllowedTouchTypesArrayFromMask(v2);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_gestureRecognizerDriver:(id)a3 didUpdateState:(int64_t)a4 previousState:(int64_t)a5
{
  UIGestureRecognizerState v9 = [(UIGestureRecognizer *)self state];
  if (v9 > UIGestureRecognizerStateChanged) {
    return;
  }
  switch(a4)
  {
    case 3:
      if (v9 < UIGestureRecognizerStateBegan)
      {
        uint64_t v10 = 5;
      }
      else if ((*(void *)&self->_gestureFlags & 0x400000000) != 0)
      {
        uint64_t v10 = 4;
      }
      else
      {
        uint64_t v10 = 5;
      }
      goto LABEL_15;
    case 2:
      uint64_t v10 = 3;
LABEL_15:
      [(UIGestureRecognizer *)self setState:v10];
      break;
    case 1:
      if (v9) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }
      goto LABEL_15;
  }
  [(UIGestureRecognizer *)self _stateUpdatedForDriver:a3 previousState:a5];
}

- (BOOL)_keepTouchesOnContinuation
{
  return self->_keepTouchesOnContinuation;
}

- (void)_wantsGESEvents:(BOOL)a3
{
  self->_wantsGESEvents = a3;
}

- (void)_connectInterfaceBuilderEventConnection:(id)a3
{
  id v4 = a3;
  id v6 = [v4 target];
  uint64_t v5 = [v4 action];

  [(UIGestureRecognizer *)self addTarget:v6 action:v5];
}

@end