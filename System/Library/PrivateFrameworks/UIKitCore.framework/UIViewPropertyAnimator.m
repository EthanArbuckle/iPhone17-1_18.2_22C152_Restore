@interface UIViewPropertyAnimator
+ (BOOL)_canEnableTrackingAnimationsWithAnimators;
+ (BOOL)_containsAnimatorForTrackedAnimationsUUID:(id)a3;
+ (BOOL)_trackedAnimationsOptimizationsEnabled;
+ (BOOL)_trackedAnimationsScrubLinearly;
+ (BOOL)_trackedAnimationsStartPaused;
+ (BOOL)_trackedAnimationsUserInteractionEnabled;
+ (BOOL)_trackingAnimationsCurrentlyEnabled;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (UIViewPropertyAnimator)runningPropertyAnimatorWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void *)animations completion:(void *)completion;
+ (double)_delayForAnimation:(id)a3 forLayer:(id)a4;
+ (id)_animationBlockForTrackingAnimation:(id)a3 animator:(id)a4 trackingSetup:(id)a5;
+ (id)_animatorForTrackedAnimationsUUID:(id)a3;
+ (id)_animatorWithTimingAttributesMatchingAnimation:(id)a3 forLayer:(id)a4 wasReused:(BOOL *)a5;
+ (id)_animatorsForTrackedAnimationsUUID:(id)a3;
+ (id)_currentPropertyAnimator;
+ (id)_currentTrackedAnimationsState;
+ (id)_currentTrackedAnimationsUUID;
+ (id)_getPropertyAnimationForState:(id)a3;
+ (id)_originalFromValueForKey:(id)a3 inLayer:(id)a4 forAnimatorWithTrackingIdentifier:(id)a5;
+ (id)_performWhileTrackingAnimations:(id)a3;
+ (id)_propertyAnimatorWithUUID:(id)a3;
+ (id)_startTrackingAnimations;
+ (id)_trackAdditiveAnimationWithAnimator:(id)a3 nonAdditiveAnimation:(id)a4 withAnimationKey:(id)a5 forKeyPath:(id)a6 forLayer:(id)a7;
+ (id)_trackAnimationWithAnimator:(id)a3 forLayer:(id)a4 forAnimationKey:(id)a5 trackingSetup:(id)a6;
+ (id)_trackNonAdditiveAnimationWithAnimator:(id)a3 forLayer:(id)a4 forKey:(id)a5;
+ (id)observedsOfAnimatorWithTrackingId:(id)a3;
+ (void)_finishTrackingAnimations;
+ (void)_removeReferenceToActivePropertyAnimator:(id)a3;
+ (void)_removeReferenceToPropertyAnimatorWithTrackingIdentifier:(id)a3;
+ (void)_removeTrackingAnimator:(id)a3 forUUID:(id)a4 andDescription:(id)a5;
+ (void)_saveReferenceToActivePropertyAnimator:(id)a3;
+ (void)_saveReferenceToPropertyAnimator:(id)a3;
+ (void)_saveTrackingAnimator:(id)a3 forUUID:(id)a4 andDescription:(id)a5;
+ (void)_setTrackedAnimationsOptimizationsEnabled:(BOOL)a3;
+ (void)_setTrackedAnimationsScrubLinearly:(BOOL)a3;
+ (void)_setTrackedAnimationsStartPaused:(BOOL)a3;
+ (void)_setTrackedAnimationsUserInteractionEnabled:(BOOL)a3;
+ (void)animator:(id)a3 isObserving:(id)a4;
+ (void)removeAllObservedForObservingAnimatorWithId:(id)a3;
+ (void)removeObserved:(id)a3 forObservingAnimatorWithId:(id)a4;
- (BOOL)_addedPacingAnimation;
- (BOOL)_computeDisplacementFractionComplete:(id)a3 withKey:(id)a4 inLayer:(id)a5 fromValue:(id)a6 toValue:(id)a7 fractionComplete:(double *)a8 displacement:(double *)a9;
- (BOOL)_computeSmallestDisplacementFractionComplete:(double *)a3;
- (BOOL)_generatePointValueSpringAnimationsForKeyPath:(id)a3;
- (BOOL)_isActive;
- (BOOL)_isPausedOnCompletion;
- (BOOL)_isStarting;
- (BOOL)_pausesOnCompletion;
- (BOOL)_setContinuedWithNewSpring:(BOOL)a3 forAnimationKey:(id)a4 forLayer:(id)a5;
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (BOOL)_shouldBeginFromCurrentState;
- (BOOL)_wasContinuedWithNewSpringForAnimationKey:(id)a3 forLayer:(id)a4;
- (BOOL)isInterruptible;
- (BOOL)isIntrospectable;
- (BOOL)isManualHitTestingEnabled;
- (BOOL)isReversed;
- (BOOL)isRunning;
- (BOOL)isUserInteractionEnabled;
- (BOOL)pausesOnCompletion;
- (BOOL)scrubsLinearly;
- (BOOL)shouldLayoutSubviews;
- (NSArray)animationDescriptions;
- (NSMutableArray)_animations;
- (NSMutableArray)_completions;
- (NSMutableDictionary)_animationDescriptionMap;
- (NSString)_name;
- (NSString)description;
- (NSTimeInterval)delay;
- (NSTimeInterval)duration;
- (NSUUID)_trackingIdentifier;
- (UIViewAnimationState)_viewAnimationState;
- (UIViewPropertyAnimator)init;
- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration controlPoint1:(CGPoint)point1 controlPoint2:(CGPoint)point2 animations:(void *)animations;
- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve animations:(void *)animations;
- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration dampingRatio:(CGFloat)ratio animations:(void *)animations;
- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration timingParameters:(id)parameters;
- (UIViewPropertyAnimator)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(CGVector)a6 animations:(id)a7;
- (double)_additiveOffsetForKey:(id)a3 inLayer:(id)a4;
- (double)_drag;
- (double)_dragAdjustedDuration;
- (double)_effectiveAdditiveOffsetForKey:(id)a3 inLayer:(id)a4;
- (double)_pauseAnimation:(id)a3 fromStart:(BOOL)a4;
- (double)_pauseAnimation:(id)a3 fromStart:(BOOL)a4 minimizingStateModifications:(BOOL)a5;
- (double)computeCurrentTimingFunction:(double)a3;
- (double)computeInverseOfCurrentTimingFunction:(double)a3;
- (double)fractionComplete;
- (double)internalDuration;
- (double)pacedFractionComplete;
- (double)unitDuration;
- (id)_animationDescriptionForView:(id)a3;
- (id)_animationStateAsString;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_explicitAnimationUpdateForProperty:(id)a3 forView:(id)a4 withValue:(id)a5;
- (id)_newAnimationUpdateForProperty:(id)a3 implicit:(BOOL)a4 additive:(BOOL)a5;
- (id)_originalFromValueForKey:(id)a3 inLayer:(id)a4;
- (id)_originalToValueForKey:(id)a3 inLayer:(id)a4;
- (id)_previousAnimatorForKeyPath:(id)a3 inLayer:(id)a4 compoundKeys:(id *)a5;
- (id)_stateAsString;
- (id)animationsDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)timingFunctionForPause;
- (id)timingParameters;
- (int64_t)_animationState;
- (int64_t)_finishingPosition;
- (int64_t)state;
- (unint64_t)_options;
- (unint64_t)_optionsForNestedLegacyAnimation:(unint64_t)a3;
- (void)_clearAnimationState;
- (void)_continueWithTimingParameters:(id)a3 duration:(double)a4;
- (void)_executeCompletionHandlerWithFinalPosition:(int64_t)a3;
- (void)_notePropertyAnimationUpdate:(id)a3 forView:(id)a4;
- (void)_restoreLayerValueIfReversed:(id)a3 animation:(id)a4 toValue:(id)a5;
- (void)_runAnimations;
- (void)_runCompletions:(int64_t)a3 finished:(BOOL)a4;
- (void)_scheduleCACommitFuture;
- (void)_setAddedPacingAnimation:(BOOL)a3 animationKey:(id)a4;
- (void)_setAdditiveOffset:(double)a3 forKey:(id)a4 inLayer:(id)a5;
- (void)_setAnimationState:(int64_t)a3;
- (void)_setAnimations:(id)a3;
- (void)_setCompletions:(id)a3;
- (void)_setFinishingPosition:(int64_t)a3;
- (void)_setKVOCompliantReversed:(BOOL)a3;
- (void)_setKVOCompliantRunning:(BOOL)a3;
- (void)_setKVOCompliantState:(int64_t)a3;
- (void)_setKVOCompliantState:(int64_t)a3 fromState:(int64_t)a4;
- (void)_setOptions:(unint64_t)a3;
- (void)_setOriginalFromValue:(id)a3 forKey:(id)a4 inLayer:(id)a5;
- (void)_setOriginalToValue:(id)a3 forKey:(id)a4 inLayer:(id)a5;
- (void)_setPausedOnCompletion:(BOOL)a3;
- (void)_setPausesOnCompletion:(BOOL)a3;
- (void)_setShouldBeginFromCurrentState:(BOOL)a3;
- (void)_setShouldLayoutSubviews:(BOOL)a3;
- (void)_setStarting:(BOOL)a3;
- (void)_setTimingParameters:(id)a3;
- (void)_setTrackingIdentifier:(id)a3;
- (void)_setViewAnimationState:(id)a3;
- (void)_setupAnimationTracking:(id)a3;
- (void)_setupAssociatedViewAnimationState:(id)a3;
- (void)_setupWithDuration:(double)a3 timingParameters:(id)a4 animations:(id)a5;
- (void)_springAnimationForXComponent:(id *)a3 forYComponent:(id *)a4;
- (void)_untrackPropertyAnimationsForKeys:(id *)a3 inLayer:(id)a4;
- (void)_updateAnimationsToFractionComplete:(double)a3;
- (void)addAnimations:(id)a3 delayFactor:(double)a4 durationFactor:(double)a5;
- (void)addAnimations:(void *)animation;
- (void)addAnimations:(void *)animation delayFactor:(CGFloat)delayFactor;
- (void)addCompletion:(void *)completion;
- (void)clearAnimationDescriptions;
- (void)continueAnimation;
- (void)continueAnimationWithTimingParameters:(id)parameters durationFactor:(CGFloat)durationFactor;
- (void)dealloc;
- (void)finalizeStoppedAnimationWithPosition:(int64_t)a3;
- (void)finishAnimationAtPosition:(int64_t)a3;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseAnimation;
- (void)pauseAnimationTransiently;
- (void)setAnimationDescriptionMap:(id)a3;
- (void)setFractionComplete:(double)a3;
- (void)setInternalDuration:(double)a3;
- (void)setInterruptible:(BOOL)interruptible;
- (void)setIntrospectable:(BOOL)a3;
- (void)setManualHitTestingEnabled:(BOOL)manualHitTestingEnabled;
- (void)setPacedFractionComplete:(double)a3;
- (void)setPausesOnCompletion:(BOOL)pausesOnCompletion;
- (void)setReversed:(BOOL)a3;
- (void)setScrubsLinearly:(BOOL)scrubsLinearly;
- (void)setUnitDuration:(double)a3;
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled;
- (void)set_name:(id)a3;
- (void)startAnimation;
- (void)startAnimationAfterDelay:(double)a3;
- (void)startAnimationAsPaused:(BOOL)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation UIViewPropertyAnimator

+ (BOOL)_trackingAnimationsCurrentlyEnabled
{
  v2 = [a1 _currentTrackedAnimationsUUID];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)_currentTrackedAnimationsUUID
{
  v2 = [(id)__trackingAnimatorStates lastObject];
  BOOL v3 = [v2 uuid];

  return v3;
}

- (id)_originalToValueForKey:(id)a3 inLayer:(id)a4
{
  return [(_UICompoundObjectMap *)self->_originalToValueMap valueForObject:a4 andProperty:a3];
}

+ (id)_trackNonAdditiveAnimationWithAnimator:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__UIViewPropertyAnimator__trackNonAdditiveAnimationWithAnimator_forLayer_forKey___block_invoke;
  v16[3] = &unk_1E52DC810;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  v14 = [a1 _trackAnimationWithAnimator:v13 forLayer:v11 forAnimationKey:v12 trackingSetup:v16];

  return v14;
}

- (void)_setOriginalToValue:(id)a3 forKey:(id)a4 inLayer:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  originalToValueMap = self->_originalToValueMap;
  if (!originalToValueMap)
  {
    id v11 = +[_UICompoundObjectMap compoundObjectMap];
    id v12 = self->_originalToValueMap;
    self->_originalToValueMap = v11;

    originalToValueMap = self->_originalToValueMap;
  }
  [(_UICompoundObjectMap *)originalToValueMap setValue:v13 forObject:v9 andProperty:v8];
}

- (void)_setOriginalFromValue:(id)a3 forKey:(id)a4 inLayer:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  originalFromValueMap = self->_originalFromValueMap;
  if (!originalFromValueMap)
  {
    id v11 = +[_UICompoundObjectMap compoundObjectMap];
    id v12 = self->_originalFromValueMap;
    self->_originalFromValueMap = v11;

    originalFromValueMap = self->_originalFromValueMap;
  }
  [(_UICompoundObjectMap *)originalFromValueMap setValue:v13 forObject:v9 andProperty:v8];
}

- (id)_originalFromValueForKey:(id)a3 inLayer:(id)a4
{
  return [(_UICompoundObjectMap *)self->_originalFromValueMap valueForObject:a4 andProperty:a3];
}

+ (id)_propertyAnimatorWithUUID:(id)a3
{
  return (id)[(id)__ExtantPropertyAnimators objectForKey:a3];
}

- (BOOL)_isStarting
{
  return self->_starting;
}

- (BOOL)_addedPacingAnimation
{
  return self->_addedPacingAnimation;
}

- (void)_setAdditiveOffset:(double)a3 forKey:(id)a4 inLayer:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  if (a3 >= 0.0)
  {
    additiveOffsetsForAnimationKeysMap = self->_additiveOffsetsForAnimationKeysMap;
    if (!additiveOffsetsForAnimationKeysMap)
    {
      id v10 = +[_UICompoundObjectMap compoundObjectMap];
      id v11 = self->_additiveOffsetsForAnimationKeysMap;
      self->_additiveOffsetsForAnimationKeysMap = v10;

      additiveOffsetsForAnimationKeysMap = self->_additiveOffsetsForAnimationKeysMap;
    }
    id v12 = [NSNumber numberWithDouble:a3];
    [(_UICompoundObjectMap *)additiveOffsetsForAnimationKeysMap setValue:v12 forObject:v8 andProperty:v13];
  }
}

+ (id)_trackAdditiveAnimationWithAnimator:(id)a3 nonAdditiveAnimation:(id)a4 withAnimationKey:(id)a5 forKeyPath:(id)a6 forLayer:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120__UIViewPropertyAnimator__trackAdditiveAnimationWithAnimator_nonAdditiveAnimation_withAnimationKey_forKeyPath_forLayer___block_invoke;
  v24[3] = &unk_1E52DC838;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  v22 = [a1 _trackAnimationWithAnimator:v21 forLayer:v17 forAnimationKey:v19 trackingSetup:v24];

  return v22;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (BOOL)isIntrospectable
{
  return self->_introspectable;
}

- (NSTimeInterval)duration
{
  return self->_baseDuration;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (id)_previousAnimatorForKeyPath:(id)a3 inLayer:(id)a4 compoundKeys:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (([v8 hasPrefix:@"bounds"] & 1) != 0
    || ([v8 hasPrefix:@"contentsRect"] & 1) != 0
    || [v8 hasPrefix:@"contentsCenter"])
  {
    id v29 = [v8 stringByAppendingString:@".origin"];
    id v28 = [v8 stringByAppendingString:@".size"];
  }
  else
  {
    id v28 = 0;
    id v29 = 0;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)__ExtantPropertyAnimators;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    location = a5;
    uint64_t v12 = *(void *)v32;
    if (v29) {
      BOOL v13 = v28 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    int v14 = !v13;
LABEL_12:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(obj);
      }
      objc_msgSend((id)__ExtantPropertyAnimators, "objectForKey:", *(void *)(*((void *)&v31 + 1) + 8 * v15), location);
      id v16 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
      id v17 = v16;
      if (v16 != self)
      {
        id v18 = [(UIViewPropertyAnimator *)v16 _originalFromValueForKey:v8 inLayer:v9];

        if (v18)
        {
          v22 = v8;
          v23 = location;
          goto LABEL_26;
        }
        if (v14)
        {
          id v19 = [(UIViewPropertyAnimator *)v17 _originalFromValueForKey:v29 inLayer:v9];
          if (v19)
          {

LABEL_25:
            objc_storeStrong(location, v29);
            v23 = location + 1;
            v22 = v28;
LABEL_26:
            id v24 = v22;
            id v25 = *v23;
            *v23 = v24;

            id v21 = v17;
            goto LABEL_27;
          }
          id v20 = [(UIViewPropertyAnimator *)v17 _originalFromValueForKey:v28 inLayer:v9];

          if (v20) {
            goto LABEL_25;
          }
        }
      }

      if (v11 == ++v15)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v11) {
          goto LABEL_12;
        }
        break;
      }
    }
  }
  id v21 = 0;
LABEL_27:

  return v21;
}

- (BOOL)_generatePointValueSpringAnimationsForKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [(UITimingCurveProvider *)self->_timingParameters springTimingParameters];
  if (v5 && [v4 isEqualToString:@"position"])
  {
    [v5 initialVelocity];
    BOOL v8 = v7 != v6;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_setAddedPacingAnimation:(BOOL)a3 animationKey:(id)a4
{
  self->_addedPacingAnimation = a3;
  objc_storeStrong((id *)&self->_pacingAnimationKey, a4);
}

+ (id)_animatorWithTimingAttributesMatchingAnimation:(id)a3 forLayer:(id)a4 wasReused:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 _currentTrackedAnimationsState];
  uint64_t v11 = +[UIView _currentViewAnimationState];
  double v12 = v11[5];
  [a1 _delayForAnimation:v8 forLayer:v9];
  double v14 = v13;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v8;
    id v16 = [UISpringTimingParameters alloc];
    [v15 mass];
    double v18 = v17;
    [v15 stiffness];
    double v20 = v19;
    [v15 damping];
    double v22 = v21;
    [v15 initialVelocity];
    double v24 = v23;

    id v25 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](v16, "initWithMass:stiffness:damping:initialVelocity:", v18, v20, v22, v24, 0.0);
    id v26 = [(UISpringTimingParameters *)v25 springTimingParameters];
    [(__CFString *)v26 setImplicitDuration:0];
  }
  else
  {
    id v27 = [UICubicTimingParameters alloc];
    id v26 = [v8 timingFunction];
    id v25 = [(UICubicTimingParameters *)v27 initWithCustomCurve:v26];
  }

  if ([v10 optimizationsEnabled])
  {
    id v28 = v11;
    id v29 = v10;
    v30 = v25;
    long long v31 = v30;
    if (!v30)
    {
      id v26 = @"timing unknown;";
      goto LABEL_21;
    }
    unint64_t v32 = [(UISpringTimingParameters *)v30 timingCurveType];
    if (v32 < 2)
    {
      long long v33 = [(UISpringTimingParameters *)v31 cubicTimingParameters];
      uint64_t v50 = _cubicTimingProviderDescription(v33);
    }
    else
    {
      if (v32 != 2)
      {
        if (v32 != 3) {
          goto LABEL_21;
        }
        v73 = a5;
        id v69 = [NSString alloc];
        long long v33 = [(UISpringTimingParameters *)v31 cubicTimingParameters];
        v72 = _cubicTimingProviderDescription(v33);
        uint64_t v34 = [(UISpringTimingParameters *)v31 springTimingParameters];
        v71 = (void *)v34;
        if (v34)
        {
          v35 = (void *)v34;
          id v68 = [NSString alloc];
          [v35 dampingRatio];
          uint64_t v37 = v36;
          unsigned int v38 = [v35 implicitDuration];
          [v35 mass];
          uint64_t v40 = v39;
          [v35 stiffness];
          uint64_t v42 = v41;
          [v35 damping];
          uint64_t v44 = v43;
          [v35 initialVelocity];
          uint64_t v46 = v45;
          [v35 initialVelocity];
          v48 = (__CFString *)objc_msgSend(v68, "initWithFormat:", @"spring %f, %i, %f, %f, %f, %f, %f;",
                                v37,
                                v38,
                                v40,
                                v42,
                                v44,
                                v46,
                                v47);
        }
        else
        {
          v48 = @"spring unknown;";
        }
        v65 = v69;
        v70 = v48;
        id v26 = (__CFString *)[v65 initWithFormat:@"composed %@ %@", v72, v48];

        a5 = v73;
        goto LABEL_20;
      }
      long long v33 = [(UISpringTimingParameters *)v31 springTimingParameters];
      if (!v33)
      {
        id v26 = @"spring unknown;";
        goto LABEL_20;
      }
      id v74 = [NSString alloc];
      [v33 dampingRatio];
      uint64_t v52 = v51;
      v53 = a5;
      unsigned int v54 = [v33 implicitDuration];
      [v33 mass];
      uint64_t v56 = v55;
      [v33 stiffness];
      uint64_t v58 = v57;
      [v33 damping];
      uint64_t v60 = v59;
      [v33 initialVelocity];
      uint64_t v62 = v61;
      [v33 initialVelocity];
      uint64_t v63 = v54;
      a5 = v53;
      uint64_t v50 = objc_msgSend(v74, "initWithFormat:", @"spring %f, %i, %f, %f, %f, %f, %f;",
              v52,
              v63,
              v56,
              v58,
              v60,
              v62,
              v64);
    }
    id v26 = (__CFString *)v50;
LABEL_20:

LABEL_21:
    v49 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p; %p; %f; %f; %@",
                    v28,
                    v29,
                    *(void *)&v12,
                    *(void *)&v14,
                    v26);

    v66 = [(id)qword_1EB25EF70 objectForKey:v49];
    *a5 = v66 != 0;
    if (v66) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v49 = 0;
  *a5 = 0;
LABEL_22:
  v66 = [[UIViewPropertyAnimator alloc] initWithDuration:v25 timingParameters:v12];
  objc_storeStrong((id *)&v66->_trackingDescription, v49);
  objc_storeStrong((id *)&v66->_trackingState, v10);
  v66->_delay = v14;
  -[UIViewPropertyAnimator setScrubsLinearly:](v66, "setScrubsLinearly:", [v10 scrubsLinearly]);
  -[UIViewPropertyAnimator setUserInteractionEnabled:](v66, "setUserInteractionEnabled:", [v10 userInteractionEnabled]);
LABEL_23:

  return v66;
}

+ (double)_delayForAnimation:(id)a3 forLayer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 beginTimeMode];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F39D98]];

  [v5 beginTime];
  double v10 = v9;
  if ((v8 & 1) == 0)
  {
    double v10 = 0.0;
    if (v9 > 0.0)
    {
      [v6 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v12 = v11;
      [v5 beginTime];
      double v10 = (v13 - v12) / UIAnimationDragCoefficient();
    }
  }

  return v10;
}

+ (id)_trackAnimationWithAnimator:(id)a3 forLayer:(id)a4 forAnimationKey:(id)a5 trackingSetup:(id)a6
{
  char v18 = 0;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  double v12 = [a1 _currentTrackedAnimationsState];
  double v13 = [a1 _animatorWithTimingAttributesMatchingAnimation:v11 forLayer:v10 wasReused:&v18];

  double v14 = [a1 _animationBlockForTrackingAnimation:v11 animator:v13 trackingSetup:v9];

  if (v18)
  {
    id v15 = [v13 _viewAnimationState];
    id v16 = [v13 _trackingIdentifier];
    +[UIView _performWithState:v15 trackingIdentifier:v16 duration:v14 delay:-1.0 animations:-1.0];
  }
  else
  {
    [v13 addAnimations:v14];
    [v13 startAnimation];
    if ([v12 startPaused]) {
      [v13 pauseAnimation];
    }
    id v15 = [v12 uuid];
    [a1 _saveTrackingAnimator:v13 forUUID:v15 andDescription:v13[2]];
  }

  return v13;
}

+ (id)_currentTrackedAnimationsState
{
  return (id)[(id)__trackingAnimatorStates lastObject];
}

- (NSUUID)_trackingIdentifier
{
  return self->_trackingIdentifier;
}

+ (id)_animationBlockForTrackingAnimation:(id)a3 animator:(id)a4 trackingSetup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 _currentTrackedAnimationsState];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__UIViewPropertyAnimator__animationBlockForTrackingAnimation_animator_trackingSetup___block_invoke;
  v18[3] = &unk_1E52DC7E8;
  id v19 = v11;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  id v16 = _Block_copy(v18);

  return v16;
}

void __85__UIViewPropertyAnimator__animationBlockForTrackingAnimation_animator_trackingSetup___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) startPaused]) {
    [*(id *)(a1 + 40) setSpeed:0.0];
  }
  id v2 = [*(id *)(a1 + 48) _viewAnimationState];
  [v2 _transferAnimationToTrackingAnimator:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (UIViewAnimationState)_viewAnimationState
{
  return self->_viewAnimationState;
}

uint64_t __120__UIViewPropertyAnimator__trackAdditiveAnimationWithAnimator_nonAdditiveAnimation_withAnimationKey_forKeyPath_forLayer___block_invoke(void *a1, void *a2)
{
  return [a2 _trackAnimation:a1[4] nonAdditiveAnimation:a1[5] withAnimationKey:a1[6] forKeyPath:a1[7] inLayer:a1[8]];
}

- (void)startAnimation
{
  if ([(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    [(UIViewPropertyAnimator *)self continueAnimation];
  }
  else
  {
    if ([(UIViewPropertyAnimator *)self _animationState] == 3)
    {
      BOOL v3 = self;
      BOOL v4 = 0;
    }
    else
    {
      if ([(UIViewPropertyAnimator *)self _animationState]) {
        return;
      }
      BOOL v4 = [(UIViewPropertyAnimator *)self isInterruptible];
      BOOL v3 = self;
    }
    [(UIViewPropertyAnimator *)v3 startAnimationAsPaused:v4];
  }
}

- (void)_setTimingParameters:(id)a3
{
  id v4 = a3;
  id v5 = (UITimingCurveProvider *)[v4 copyWithZone:0];
  timingParameters = self->_timingParameters;
  self->_timingParameters = v5;

  id v11 = v4;
  if (v11)
  {
    if ([v11 timingCurveType] == 2)
    {
    }
    else
    {
      uint64_t v7 = [v11 timingCurveType];

      if (v7 != 3) {
        goto LABEL_7;
      }
    }
    id v8 = [v11 springTimingParameters];
    int v9 = [v8 implicitDuration];

    if (v9)
    {
      id v10 = [v11 springTimingParameters];
      [v10 settlingDuration];
      -[UIViewPropertyAnimator setUnitDuration:](self, "setUnitDuration:");

      self->_internalDuration = self->_baseDuration;
    }
  }
LABEL_7:
}

uint64_t __81__UIViewPropertyAnimator__trackNonAdditiveAnimationWithAnimator_forLayer_forKey___block_invoke(void *a1, void *a2)
{
  return [a2 _trackAnimation:a1[4] withAnimationKey:a1[5] forKeyPath:a1[5] inLayer:a1[6]];
}

- (void)setUnitDuration:(double)a3
{
  self->_baseDuration = a3;
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
  if ([(UIViewPropertyAnimator *)self _isActive]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"It is not allowed to set the userInteractionEnabled property of an active animator (%@)", self format];
  }
  self->_userInteractionEnabled = userInteractionEnabled;
}

- (void)setScrubsLinearly:(BOOL)scrubsLinearly
{
  if ([(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIViewPropertyAnimator.m" lineNumber:2711 description:@"Cannot modify scrubsLinearly while animation is already paused"];
  }
  self->_scrubsLinearly = scrubsLinearly;
}

+ (void)_saveTrackingAnimator:(id)a3 forUUID:(id)a4 andDescription:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  int v9 = (void *)_MergedGlobals_940;
  if (!_MergedGlobals_940)
  {
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v11 = (void *)_MergedGlobals_940;
    _MergedGlobals_940 = v10;

    int v9 = (void *)_MergedGlobals_940;
  }
  id v12 = [v9 objectForKey:v7];
  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(id)_MergedGlobals_940 setObject:v12 forKey:v7];
  }
  [v12 addObject:v16];
  if (v8)
  {
    id v13 = (void *)qword_1EB25EF70;
    if (!qword_1EB25EF70)
    {
      uint64_t v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      id v15 = (void *)qword_1EB25EF70;
      qword_1EB25EF70 = v14;

      id v13 = (void *)qword_1EB25EF70;
    }
    [v13 setObject:v16 forKey:v8];
  }
}

- (BOOL)_pausesOnCompletion
{
  return self->_pausesOnCompletion;
}

- (void)stopAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIViewPropertyAnimator *)self isInterruptible])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 3174, @"An animator %@ that is not interruptible cannot be stopped!", self object file lineNumber description];
  }
  if ([(UIViewPropertyAnimator *)self state] == 2)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 3175, @"Animator %@ is already stopped!", self object file lineNumber description];
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 1
    || [(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    id v6 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
    +[UIView _stopAnimationWithUUID:v6];

    if (v3) {
      [(UIViewPropertyAnimator *)self _setAnimationState:2];
    }
    else {
      [(UIViewPropertyAnimator *)self _setKVOCompliantState:2];
    }
    self->_pausedAsSpring = 0;
    [(UIViewPropertyAnimator *)self _setKVOCompliantRunning:0];
    [(UIViewPropertyAnimator *)self _setKVOCompliantReversed:0];
    if (v3)
    {
      [(UIViewPropertyAnimator *)self _setCompletions:0];
      [(UIViewPropertyAnimator *)self _setFinishingPosition:2];
      [(UIViewPropertyAnimator *)self _runCompletions:2 finished:0];
    }
  }
}

void __61__UIViewPropertyAnimator__setupAssociatedViewAnimationState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _animationState] == 1 || objc_msgSend(WeakRetained, "_animationState") == 4)
  {
    if ([WeakRetained pausesOnCompletion])
    {
      [WeakRetained _setPausedOnCompletion:1];
      [WeakRetained pauseAnimation];
    }
    else
    {
      objc_msgSend(WeakRetained, "_runCompletions:finished:", objc_msgSend(WeakRetained, "_finishingPosition"), a2);
    }
  }
}

- (BOOL)pausesOnCompletion
{
  return self->_pausesOnCompletion;
}

- (int64_t)_finishingPosition
{
  return self->_finishingPosition;
}

- (void)_clearAnimationState
{
  uint64_t v10 = self;
  id v2 = [(UIViewPropertyAnimator *)v10 _trackingIdentifier];
  BOOL v3 = v10;
  trackingState = v10->_trackingState;
  if (trackingState)
  {
    id v5 = objc_opt_class();
    id v6 = [(UIViewPropertyAnimatorTrackingState *)v10->_trackingState uuid];
    [v5 _removeTrackingAnimator:v10 forUUID:v6 andDescription:v10->_trackingDescription];

    BOOL v3 = v10;
    trackingState = v10->_trackingState;
  }
  v3->_trackingState = 0;

  +[UIView _disableAnimationTracking:v2];
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_outerAnimator);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained removeObserver:v10 forKeyPath:@"running"];
    [v8 removeObserver:v10 forKeyPath:@"state"];
    [v8 removeObserver:v10 forKeyPath:@"reversed"];
    +[UIViewPropertyAnimator removeObserved:v8 forObservingAnimatorWithId:v2];
    objc_storeWeak((id *)&v10->_outerAnimator, 0);
  }
  objc_storeWeak((id *)&v10->_viewAnimationState->_propertyAnimator, 0);
  [(UIViewPropertyAnimator *)v10 _setCompletions:0];
  [(UIViewPropertyAnimator *)v10 _setFinishingPosition:0];
  viewAnimationState = v10->_viewAnimationState;
  v10->_viewAnimationState = 0;

  [(_UICompoundObjectMap *)v10->_originalToValueMap removeAllMappings];
  [(_UICompoundObjectMap *)v10->_originalFromValueMap removeAllMappings];
  [(_UICompoundObjectMap *)v10->_additiveOffsetsForAnimationKeysMap removeAllMappings];
  [(_UICompoundObjectMap *)v10->_continuedWithSpringForAnimationKeyMap removeAllMappings];
  v10->_drag = 1.0;
  v10->_fractionComplete = 0.0;
  v10->_hasFinalized = 0;
  [(UIViewPropertyAnimator *)v10 _setKVOCompliantRunning:0];
  [(UIViewPropertyAnimator *)v10 _setKVOCompliantReversed:0];
  [(UIViewPropertyAnimator *)v10 _setKVOCompliantState:0];
  [(id)objc_opt_class() _removeReferenceToPropertyAnimatorWithTrackingIdentifier:v2];
}

- (void)startAnimationAsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(UIViewPropertyAnimator *)self isInterruptible])
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 3486, @"An animator (%@) can be only started in the paused state if it is interruptible!", self object file lineNumber description];
  }
  if ([(UIViewPropertyAnimator *)self _animationState]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v3;
  }
  id v7 = [(id)objc_opt_class() _currentPropertyAnimator];
  [(UIViewPropertyAnimator *)self clearAnimationDescriptions];
  id v8 = objc_opt_new();
  [(UIViewPropertyAnimator *)self _setViewAnimationState:v8];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke;
  aBlock[3] = &unk_1E52DCA30;
  BOOL v30 = v6;
  aBlock[4] = self;
  int v9 = _Block_copy(aBlock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_2;
  v25[3] = &unk_1E52DCA58;
  id v10 = v7;
  id v26 = v10;
  id v11 = v9;
  id v27 = self;
  id v28 = v11;
  id v12 = (void (**)(void))_Block_copy(v25);
  [(UIViewPropertyAnimator *)self _setKVOCompliantState:1 fromState:0];
  if (!v3
    && ([(UIViewPropertyAnimator *)self isInterruptible]
     || [v10 isRunning]))
  {
    [(UIViewPropertyAnimator *)self _setKVOCompliantRunning:1];
  }
  if (v10 && ![(UIViewPropertyAnimator *)self isInterruptible]) {
    -[UIViewPropertyAnimator _setKVOCompliantReversed:](self, "_setKVOCompliantReversed:", [v10 isReversed]);
  }
  if (v3) {
    [(UIViewPropertyAnimator *)self _setAnimationState:4];
  }
  [(UIViewPropertyAnimator *)self _setStarting:1];
  BOOL v13 = [(UIViewPropertyAnimator *)self isInterruptible];
  if (!v10)
  {
    if (v13)
    {
      [(UIViewPropertyAnimator *)self _setupAnimationTracking:v12];
      if (!v3) {
        goto LABEL_24;
      }
LABEL_28:
      id v21 = [(UIViewPropertyAnimator *)self _viewAnimationState];
      -[UIViewPropertyAnimator _setStarting:](self, "_setStarting:", [v21 _didEndCount] == 0);

      goto LABEL_29;
    }
    id v20 = [MEMORY[0x1E4F29128] UUID];
    [(UIViewPropertyAnimator *)self _setTrackingIdentifier:v20];

LABEL_27:
    [(id)objc_opt_class() _saveReferenceToPropertyAnimator:self];
    v12[2](v12);
    if (!v3) {
      goto LABEL_24;
    }
    goto LABEL_28;
  }
  if (!v13)
  {
    objc_storeWeak((id *)&self->_outerAnimator, v10);
    [v10 addObserver:self forKeyPath:@"running" options:1 context:0];
    [v10 addObserver:self forKeyPath:@"state" options:1 context:0];
    [v10 addObserver:self forKeyPath:@"reversed" options:1 context:0];
    id v19 = [MEMORY[0x1E4F29128] UUID];
    [(UIViewPropertyAnimator *)self _setTrackingIdentifier:v19];

    +[UIViewPropertyAnimator animator:self isObserving:v10];
    goto LABEL_27;
  }
  uint64_t v14 = +[UIView _enableAnimationTracking:1];
  id v15 = +[UIView _currentViewAnimationState];
  [(UIViewPropertyAnimator *)self _setTrackingIdentifier:v14];
  [(id)objc_opt_class() _saveReferenceToPropertyAnimator:self];
  [(UIViewPropertyAnimator *)self _setupAssociatedViewAnimationState:v15];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_4;
  v23[3] = &unk_1E52D9F98;
  v23[4] = self;
  id v24 = v14;
  id v16 = (void (*)(void *, void *))v11[2];
  id v17 = v14;
  v16(v11, v23);
  if (v3)
  {
    char v18 = [(UIViewPropertyAnimator *)self timingFunctionForPause];
    [(UIViewPropertyAnimator *)self _pauseAnimation:v18 fromStart:1];
  }
  if (v3) {
    goto LABEL_28;
  }
LABEL_24:
  [(UIViewPropertyAnimator *)self _setStarting:0];
LABEL_29:
}

- (BOOL)isInterruptible
{
  return self->_interruptible;
}

- (void)_setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (void)clearAnimationDescriptions
{
  id v2 = [(UIViewPropertyAnimator *)self _animationDescriptionMap];
  [v2 removeAllObjects];
}

- (void)_setupWithDuration:(double)a3 timingParameters:(id)a4 animations:(id)a5
{
  id v13 = a5;
  self->_pausedOnCompletion = 0;
  self->_pausesOnCompletion = 0;
  self->_scrubsLinearly = 1;
  id v8 = a4;
  [(UIViewPropertyAnimator *)self _setAnimationState:0];
  [(UIViewPropertyAnimator *)self _setFinishingPosition:0];
  int v9 = [MEMORY[0x1E4F1CA60] dictionary];
  [(UIViewPropertyAnimator *)self setAnimationDescriptionMap:v9];

  self->_hasFinalized = 0;
  *(_WORD *)&self->_userInteractionEnabled = 1;
  double v10 = 0.2;
  if (a3 != 0.0) {
    double v10 = a3;
  }
  self->_baseDuration = v10;
  self->_internalDuration = v10;
  self->_options = 0;
  self->_optionsAreExplicit = 0;
  self->_drag = UIAnimationDragCoefficient();
  *(_WORD *)&self->_running = 0;
  self->_addedPacingAnimation = 0;
  pacingAnimationKey = self->_pacingAnimationKey;
  self->_pacingAnimationKey = 0;

  self->_fractionComplete = 0.0;
  [(UIViewPropertyAnimator *)self _setTimingParameters:v8];

  id v12 = v13;
  self->_interruptible = 1;
  *(_WORD *)&self->_shouldLayoutSubviews = 1;
  self->_shouldBeginFromCurrentState = 1;
  if (v13)
  {
    [(UIViewPropertyAnimator *)self addAnimations:v13];
    id v12 = v13;
  }
}

- (void)_setFinishingPosition:(int64_t)a3
{
  self->_finishingPosition = a3;
}

- (void)setAnimationDescriptionMap:(id)a3
{
}

- (void)_setupAnimationTracking:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = +[UIView _startAnimationTracking];
  trackingIdentifier = self->_trackingIdentifier;
  self->_trackingIdentifier = v5;

  [(id)objc_opt_class() _saveReferenceToPropertyAnimator:self];
  v4[2](v4);

  +[UIView _finishAnimationTracking];
  if ([(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    id v7 = [(UIViewPropertyAnimator *)self timingFunctionForPause];
    [(UIViewPropertyAnimator *)self _pauseAnimation:v7 fromStart:1];
  }
}

+ (void)_saveReferenceToPropertyAnimator:(id)a3
{
  id v3 = a3;
  id v4 = (void *)__ExtantPropertyAnimators;
  id v8 = v3;
  if (!__ExtantPropertyAnimators)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    BOOL v6 = (void *)__ExtantPropertyAnimators;
    __ExtantPropertyAnimators = v5;

    id v3 = v8;
    id v4 = (void *)__ExtantPropertyAnimators;
  }
  id v7 = [v3 _trackingIdentifier];
  [v4 setObject:v8 forKey:v7];
}

void __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _viewAnimationState];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_3;
  v6[3] = &unk_1E52D9F98;
  uint64_t v3 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v2;
  id v4 = *(void (**)(uint64_t, void *))(v3 + 16);
  id v5 = v2;
  v4(v3, v6);
}

void __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = a2;
    id v5 = [v2 _viewAnimationState];
    [v5 _performWithCompletionCallbacksDisabledOnPop:v3];
  }
  else
  {
    id v4 = (void (*)(void))a2[2];
    id v5 = a2;
    v4();
  }
}

uint64_t __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _viewAnimationState];
  [v2 pushWithViewAnimationID:0 context:0];

  [*(id *)(a1 + 32) _setupAssociatedViewAnimationState:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _runAnimations];
  return +[UIViewAnimationState popAnimationState];
}

- (void)_setViewAnimationState:(id)a3
{
  objc_storeStrong((id *)&self->_viewAnimationState, a3);
  id v5 = (id *)a3;
  objc_storeWeak(v5 + 34, self);
}

- (void)_runAnimations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIViewPropertyAnimator *)self _animations];
  [(UIViewPropertyAnimator *)self _setAnimations:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _animations];

  if (!v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = objc_opt_new();
    [v3 _setAnimations:v4];
  }
  double v5 = *(double *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 32) _animations];
  BOOL v7 = v5 > 0.0 && v5 < 1.0;
  id v11 = (id)v6;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_2;
    aBlock[3] = &unk_1E52DC8B0;
    uint64_t v14 = *(void *)(a1 + 48);
    long long v9 = *(void **)(a1 + 40);
    aBlock[4] = *(void *)(a1 + 32);
    id v13 = v9;
    long long v10 = _Block_copy(aBlock);
    [v11 addObject:v10];
  }
  else
  {
    uint64_t v8 = _Block_copy(*(const void **)(a1 + 40));
    [v11 addObject:v8];
  }
}

- (NSMutableArray)_animations
{
  return self->_animations;
}

- (void)_setAnimations:(id)a3
{
}

- (NSMutableDictionary)_animationDescriptionMap
{
  return self->_animationDescriptionMap;
}

+ (id)_currentPropertyAnimator
{
  id v2 = +[UIView _currentViewAnimationState];
  uint64_t v3 = [v2 _outerPropertyAnimator:1];

  return v3;
}

- (void)_setKVOCompliantState:(int64_t)a3
{
  int64_t v5 = [(UIViewPropertyAnimator *)self _animationState];
  [(UIViewPropertyAnimator *)self _setKVOCompliantState:a3 fromState:v5];
}

- (void)_setKVOCompliantReversed:(BOOL)a3
{
  if (self->_reversed != a3)
  {
    [(UIViewPropertyAnimator *)self willChangeValueForKey:@"reversed"];
    self->_reversed = a3;
    [(UIViewPropertyAnimator *)self didChangeValueForKey:@"reversed"];
  }
}

- (void)_runCompletions:(int64_t)a3 finished:(BOOL)a4
{
  -[UIViewPropertyAnimator finalizeStoppedAnimationWithPosition:](self, "finalizeStoppedAnimationWithPosition:", a3, a4);
  int64_t v6 = [(UIViewPropertyAnimator *)self _animationState];
  if ([(UIViewPropertyAnimator *)self _animationState] != 2) {
    [(UIViewPropertyAnimator *)self _setAnimationState:5];
  }
  [(UIViewPropertyAnimator *)self _executeCompletionHandlerWithFinalPosition:a3];
  [(UIViewPropertyAnimator *)self _setAnimationState:v6];
  [(UIViewPropertyAnimator *)self _clearAnimationState];
}

- (void)addAnimations:(id)a3 delayFactor:(double)a4 durationFactor:(double)a5
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v45 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v46 = *MEMORY[0x1E4F1C3C8];
    uint64_t v47 = NSStringFromSelector(a2);
    [v45 raise:v46, @"%@ requires a non nil animation arg!", v47 format];
  }
  if (a5 < 0.0)
  {
    v48 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v49 = *MEMORY[0x1E4F1C3C8];
    uint64_t v50 = NSStringFromSelector(a2);
    [v48 raise:v49, @"%@ requires a durationFactor greater than or equal to zero!", v50 format];
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 2)
  {
    uint64_t v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 2221, @"Attempt to add an animation to an animator %@ that is in a stopped state", self object file lineNumber description];
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 5)
  {
    uint64_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 2222, @"Attempt to add an animation to an animator %@ as it is completing", self object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke;
  aBlock[3] = &unk_1E52DC8B0;
  aBlock[4] = self;
  double v59 = a4;
  id v10 = v9;
  id v58 = v10;
  id v11 = (void (**)(void, __n128, __n128))_Block_copy(aBlock);
  if ([(UIViewPropertyAnimator *)self _isActive])
  {
    if ([(UIViewPropertyAnimator *)self _animationState] == 4)
    {
      if ([(UIViewPropertyAnimator *)self _isStarting]
        && ([(UIViewPropertyAnimator *)self fractionComplete], v12 == 0.0))
      {
        id v13 = [(UIViewPropertyAnimator *)self _viewAnimationState];
        uint64_t v14 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
        [(UIViewPropertyAnimator *)self internalDuration];
        double v16 = (1.0 - a4) * v15;
        [(UIViewPropertyAnimator *)self internalDuration];
        double v18 = v17 * a4;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_4;
        v55[3] = &unk_1E52DA040;
        id v56 = v10;
        +[UIView _performWithState:v13 trackingIdentifier:v14 duration:v55 delay:v16 animations:v18];

        id v19 = [(UIViewPropertyAnimator *)self _viewAnimationState];
        LODWORD(v13) = [v19 _didEndCount];

        if ((int)v13 >= 1)
        {
          [(UIViewPropertyAnimator *)self _setAnimationState:1];
          [(UIViewPropertyAnimator *)self _setStarting:0];
          if ([(UIViewPropertyAnimator *)self isInterruptible]) {
            [(UIViewPropertyAnimator *)self _setKVOCompliantRunning:1];
          }
        }
      }
      else
      {
        [(UIViewPropertyAnimator *)self fractionComplete];
        double v33 = v32;
        [(UIViewPropertyAnimator *)self internalDuration];
        double v35 = (1.0 - v33) * v34;
        [(UIViewPropertyAnimator *)self delay];
        double v38 = 0.0;
        if (v36.n128_f64[0] > 0.0 && v33 == 0.0)
        {
          uint64_t v39 = [(UIViewPropertyAnimator *)self _viewAnimationState];
          [v39 _elapsedTimeForCanonicallyTrackedAnimation];
          double v41 = v40;

          v36.n128_u64[0] = -1.0;
          v37.n128_u64[0] = 0;
          if (v41 < 0.0) {
            v37.n128_f64[0] = -v41;
          }
          if (v41 == -1.0) {
            double v38 = -1.0;
          }
          else {
            double v38 = v37.n128_f64[0];
          }
        }
        v11[2](v11, v36, v37);
        uint64_t v42 = [(UIViewPropertyAnimator *)self _viewAnimationState];
        uint64_t v43 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_5;
        v54[3] = &unk_1E52D9F70;
        v54[4] = self;
        +[UIView _performWithState:v42 trackingIdentifier:v43 duration:v54 delay:v35 animations:v38];

        uint64_t v44 = [(UIViewPropertyAnimator *)self timingFunctionForPause];
        [(UIViewPropertyAnimator *)self _pauseAnimation:v44 fromStart:1 minimizingStateModifications:1];

        [(UIViewPropertyAnimator *)self _updateAnimationsToFractionComplete:v33];
      }
    }
    else if ([(UIViewPropertyAnimator *)self _animationState] == 1)
    {
      [(UIViewPropertyAnimator *)self fractionComplete];
      double v21 = v20;
      [(UIViewPropertyAnimator *)self internalDuration];
      double v23 = (1.0 - v21) * v22;
      [(UIViewPropertyAnimator *)self delay];
      double v26 = 0.0;
      if (v24.n128_f64[0] > 0.0 && v21 == 0.0)
      {
        id v27 = [(UIViewPropertyAnimator *)self _viewAnimationState];
        [v27 _elapsedTimeForCanonicallyTrackedAnimation];
        double v29 = v28;

        v24.n128_u64[0] = -1.0;
        v25.n128_u64[0] = 0;
        if (v29 < 0.0) {
          v25.n128_f64[0] = -v29;
        }
        if (v29 == -1.0) {
          double v26 = -1.0;
        }
        else {
          double v26 = v25.n128_f64[0];
        }
      }
      v11[2](v11, v24, v25);
      BOOL v30 = [(UIViewPropertyAnimator *)self _viewAnimationState];
      long long v31 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_6;
      v53[3] = &unk_1E52D9F70;
      v53[4] = self;
      +[UIView _performWithState:v30 trackingIdentifier:v31 duration:v53 delay:v23 animations:v26];
    }
  }
  else
  {
    ((void (*)(void (**)(void, __n128, __n128)))v11[2])(v11);
    [(UIViewPropertyAnimator *)self _setAnimationState:3];
  }
}

- (BOOL)_isActive
{
  int64_t v3 = [(UIViewPropertyAnimator *)self _animationState];
  if (v3) {
    LOBYTE(v3) = [(UIViewPropertyAnimator *)self _animationState] != 3;
  }
  return v3;
}

- (void)_setKVOCompliantState:(int64_t)a3 fromState:(int64_t)a4
{
  if ([(UIViewPropertyAnimator *)self _animationState] != a3)
  {
    if ([(UIViewPropertyAnimator *)self _animationState] != a4) {
      [(UIViewPropertyAnimator *)self _setAnimationState:a4];
    }
    [(UIViewPropertyAnimator *)self willChangeValueForKey:@"state"];
    [(UIViewPropertyAnimator *)self _setAnimationState:a3];
    [(UIViewPropertyAnimator *)self didChangeValueForKey:@"state"];
  }
}

- (void)_setAnimationState:(int64_t)a3
{
  self->_animationState = a3;
  int64_t v5 = objc_opt_class();
  if (a3 == 1)
  {
    [v5 _saveReferenceToActivePropertyAnimator:self];
  }
  else
  {
    [v5 _removeReferenceToActivePropertyAnimator:self];
  }
}

+ (void)_removeReferenceToActivePropertyAnimator:(id)a3
{
  [(id)__ActivePropertyAnimators removeObject:a3];
  if (![(id)__ActivePropertyAnimators count])
  {
    int64_t v3 = (void *)__ActivePropertyAnimators;
    __ActivePropertyAnimators = 0;
  }
}

- (int64_t)state
{
  unint64_t v3 = [(UIViewPropertyAnimator *)self _animationState];
  if (v3 < 5 && ((0x1Bu >> v3) & 1) != 0) {
    return qword_186B92A20[v3];
  }
  return [(UIViewPropertyAnimator *)self _animationState];
}

- (int64_t)_animationState
{
  return self->_animationState;
}

+ (void)_saveReferenceToActivePropertyAnimator:(id)a3
{
  id v3 = a3;
  id v4 = (void *)__ActivePropertyAnimators;
  id v7 = v3;
  if (!__ActivePropertyAnimators)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int64_t v6 = (void *)__ActivePropertyAnimators;
    __ActivePropertyAnimators = (uint64_t)v5;

    id v3 = v7;
    id v4 = (void *)__ActivePropertyAnimators;
  }
  [v4 addObject:v3];
}

- (void)_setKVOCompliantRunning:(BOOL)a3
{
  if (self->_running != a3)
  {
    [(UIViewPropertyAnimator *)self willChangeValueForKey:@"running"];
    self->_running = a3;
    [(UIViewPropertyAnimator *)self didChangeValueForKey:@"running"];
  }
}

- (void)finalizeStoppedAnimationWithPosition:(int64_t)a3
{
  if ([(UIViewPropertyAnimator *)self _animationState] == 1
    || [(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    BOOL v5 = [(UIViewPropertyAnimator *)self isReversed];
    int64_t v6 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
    id v19 = v6;
    if (v5) {
      +[UIView _updateModelValuesForAnimationWithUUID:v6 useInitialValues:1 animatable:0 stateBlock:0 animationBlock:&__block_literal_global_604];
    }
    else {
      +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v6, &__block_literal_global_606);
    }
  }
  else if ([(UIViewPropertyAnimator *)self _animationState] == 2)
  {
    id v7 = +[UIView _currentViewAnimationState];
    [(UIViewPropertyAnimator *)self _setFinishingPosition:a3];
    self->_hasFinalized = 1;
    if (a3 == 2)
    {
      uint64_t v8 = [(UIViewPropertyAnimator *)self _viewAnimationState];
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v10 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_3;
      v25[3] = &unk_1E52DC9E0;
      id v11 = v8;
      id v26 = v11;
      id v12 = v9;
      id v27 = v12;
      +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v10, v25);

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_4;
      aBlock[3] = &unk_1E52D9F98;
      id v13 = v12;
      id v23 = v13;
      id v14 = v11;
      id v24 = v14;
      double v15 = (void (**)(void))_Block_copy(aBlock);
      double v16 = v15;
      if (v7)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_5;
        v20[3] = &unk_1E52D9FE8;
        double v21 = v15;
        [v7 _addCompletion:v20];
      }
      else
      {
        v15[2](v15);
      }
    }
    else
    {
      double v17 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
      +[UIView _finalizeStoppedAnimationWithUUID:v17 reverseAnimation:a3 != 0 state:v7 performCompletionsImmediately:1];

      if (!+[UIViewController _shouldDeferTransitions])
      {
        double v18 = [(UIViewPropertyAnimator *)self _viewAnimationState];
        [v18 sendDelegateDidStopManually:a3 == 0];
      }
    }
  }
}

- (BOOL)isReversed
{
  return self->_reversed;
}

- (void)_executeCompletionHandlerWithFinalPosition:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(UIViewPropertyAnimator *)self _completions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        id v7 = _Block_copy(*(const void **)(*((void *)&v11 + 1) + 8 * v9));

        (*((void (**)(void *, int64_t))v7 + 2))(v7, a3);
        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addCompletion:(void *)completion
{
  id v4 = completion;
  uint64_t v5 = [(UIViewPropertyAnimator *)self _completions];

  if (!v5)
  {
    uint64_t v6 = objc_opt_new();
    [(UIViewPropertyAnimator *)self _setCompletions:v6];
  }
  id v8 = [(UIViewPropertyAnimator *)self _completions];
  id v7 = _Block_copy(v4);

  [v8 addObject:v7];
}

- (NSMutableArray)_completions
{
  return self->_completions;
}

- (void)_setCompletions:(id)a3
{
}

+ (void)_removeReferenceToPropertyAnimatorWithTrackingIdentifier:(id)a3
{
  [(id)__ExtantPropertyAnimators removeObjectForKey:a3];
  if (![(id)__ExtantPropertyAnimators count])
  {
    id v3 = (void *)__ExtantPropertyAnimators;
    __ExtantPropertyAnimators = 0;
  }
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  return 0;
}

- (unint64_t)_optionsForNestedLegacyAnimation:(unint64_t)a3
{
  unint64_t options = self->_options;
  BOOL v6 = [(UIViewPropertyAnimator *)self isUserInteractionEnabled];
  if ([(UIViewPropertyAnimator *)self isInterruptible]
    && [(UIViewPropertyAnimator *)self isUserInteractionEnabled]
    && ![(UIViewPropertyAnimator *)self isManualHitTestingEnabled])
  {
    a3 |= 0x1000uLL;
  }
  if (v6) {
    uint64_t v7 = options & 4 | 2;
  }
  else {
    uint64_t v7 = options & 4;
  }
  return a3 | [(UIViewPropertyAnimator *)self shouldLayoutSubviews] | v7;
}

- (void)_setupAssociatedViewAnimationState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIViewPropertyAnimator *)self _viewAnimationState];
  objc_initWeak(&location, self);
  if (!self->_optionsAreExplicit)
  {
    if ([(UIViewPropertyAnimator *)self isUserInteractionEnabled]) {
      uint64_t v10 = 614;
    }
    else {
      uint64_t v10 = 612;
    }
    if ([(UIViewPropertyAnimator *)self isInterruptible]
      && [(UIViewPropertyAnimator *)self isUserInteractionEnabled]
      && ![(UIViewPropertyAnimator *)self isManualHitTestingEnabled])
    {
      v10 |= 0x1000uLL;
    }
    long long v11 = self->_timingParameters;
    if (!v11) {
      goto LABEL_22;
    }
    long long v12 = v11;
    if ([(UITimingCurveProvider *)v11 timingCurveType])
    {
      uint64_t v13 = [(UITimingCurveProvider *)v12 timingCurveType];

      if (v13 != 3) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    double v15 = [(UITimingCurveProvider *)self->_timingParameters cubicTimingParameters];
    v10 |= [v15 animationCurve] << 16;

LABEL_22:
    BOOL v16 = [(UIViewPropertyAnimator *)self shouldLayoutSubviews];
    if ([(UIViewPropertyAnimator *)self _shouldBeginFromCurrentState]) {
      unint64_t options = v10 | v16;
    }
    else {
      unint64_t options = (v10 | v16) & 0xFFFFFFFFFFFFFFFBLL;
    }
    self->_unint64_t options = options;
    goto LABEL_26;
  }
  unint64_t options = self->_options;
  self->_userInteractionEnabled = (options & 2) != 0;
  uint64_t v7 = self->_timingParameters;
  if (v7)
  {
    id v8 = v7;
    if ([(UITimingCurveProvider *)v7 timingCurveType])
    {
      uint64_t v9 = [(UITimingCurveProvider *)v8 timingCurveType];

      if (v9 != 3) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    long long v14 = [(UITimingCurveProvider *)self->_timingParameters cubicTimingParameters];
    [v14 _setAnimationCurve:(options >> 16) & 7];
  }
LABEL_19:
  self->_shouldLayoutSubviews = options & 1;
LABEL_26:
  if ([(UITimingCurveProvider *)self->_timingParameters timingCurveType] == 1)
  {
    double v17 = mediaTimingFunctionForTimingProvider(self->_timingParameters);
    [v5 _setCustomCurve:v17];
    options |= 0x60000uLL;
  }
  double v18 = self->_timingParameters;
  if (!v18) {
    goto LABEL_33;
  }
  id v19 = v18;
  if ([(UITimingCurveProvider *)v18 timingCurveType] != 2)
  {
    uint64_t v20 = [(UITimingCurveProvider *)v19 timingCurveType];

    if (v20 == 3) {
      goto LABEL_32;
    }
LABEL_33:
    double v21 = 0;
    goto LABEL_34;
  }

LABEL_32:
  double v21 = self;
LABEL_34:
  double v22 = v21;
  [(UIViewPropertyAnimator *)self internalDuration];
  double v24 = v23;
  double delay = self->_delay;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__UIViewPropertyAnimator__setupAssociatedViewAnimationState___block_invoke;
  v26[3] = &unk_1E52DC888;
  objc_copyWeak(&v27, &location);
  [v5 setupWithDuration:0 delay:options view:v22 options:v4 factory:0 parentState:v26 start:v24 completion:delay];
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)shouldLayoutSubviews
{
  return self->_shouldLayoutSubviews;
}

- (BOOL)isManualHitTestingEnabled
{
  return self->_manualHitTestingEnabled;
}

- (double)internalDuration
{
  return self->_internalDuration;
}

- (BOOL)_shouldBeginFromCurrentState
{
  return self->_shouldBeginFromCurrentState;
}

+ (void)_removeTrackingAnimator:(id)a3 forUUID:(id)a4 andDescription:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = (void *)_MergedGlobals_940;
  id v9 = a3;
  uint64_t v10 = [v8 objectForKey:v13];
  [v10 removeObject:v9];

  if (!v10)
  {
    [(id)_MergedGlobals_940 removeObjectForKey:v13];
    if (![(id)_MergedGlobals_940 count])
    {
      long long v11 = (void *)_MergedGlobals_940;
      _MergedGlobals_940 = 0;
    }
  }
  if (v7)
  {
    [(id)qword_1EB25EF70 removeObjectForKey:v7];
    if (![(id)qword_1EB25EF70 count])
    {
      long long v12 = (void *)qword_1EB25EF70;
      qword_1EB25EF70 = 0;
    }
  }
}

+ (id)_startTrackingAnimations
{
  if (!__trackingAnimatorStates)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = (void *)__trackingAnimatorStates;
    __trackingAnimatorStates = (uint64_t)v2;
  }
  id v4 = objc_alloc_init(UIViewPropertyAnimatorTrackingState);
  [(id)__trackingAnimatorStates addObject:v4];
  uint64_t v5 = [(UIViewPropertyAnimatorTrackingState *)v4 uuid];

  return v5;
}

+ (void)_finishTrackingAnimations
{
  [(id)__trackingAnimatorStates removeLastObject];
  if (![(id)__trackingAnimatorStates count])
  {
    id v2 = (void *)__trackingAnimatorStates;
    __trackingAnimatorStates = 0;
  }
}

+ (BOOL)_canEnableTrackingAnimationsWithAnimators
{
  if (!dyld_program_sdk_at_least()
    || +[UIView _isAnimationTracking])
  {
    return 0;
  }
  id v3 = +[UIView _currentViewAnimationState];
  id v4 = [v3 _outerPropertyAnimator:0];
  BOOL v2 = v4 == 0;

  return v2;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  timingParameters = self->_timingParameters;
  id v6 = a4;
  id v7 = [(UITimingCurveProvider *)timingParameters springTimingParameters];
  [v7 initialVelocity];
  double v9 = v8;
  if (![(UIViewPropertyAnimator *)self isInterruptible]
    && [(UITimingCurveProvider *)self->_timingParameters timingCurveType] == 3
    && ([(UITimingCurveProvider *)self->_timingParameters cubicTimingParameters],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    uint64_t v11 = mediaTimingFunctionForTimingProvider(self->_timingParameters);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  }
  long long v12 = (void *)v11;
  double v30 = 0.0;
  id v13 = objc_msgSend(MEMORY[0x1E4F39C90], "animationWithKeyPath:", v6, 0);

  [(UIViewPropertyAnimator *)self internalDuration];
  double v15 = v14;
  uint64_t v16 = +[UIView _currentViewAnimationState];
  double v17 = (double *)v16;
  if (*(double *)(v16 + 48) > 0.0) {
    double v15 = *(double *)(v16 + 40);
  }
  if ([v7 implicitDuration])
  {
    if (v17[6] > 0.0)
    {
      [v7 dampingRatio];
      double v19 = v18;
      [v7 mass];
      +[UIViewSpringAnimationState computeDerivedSpringParameters:&v30 zeta:&v29 mass:v15 velocity:v19 epsilon:v20 stiffness:v9 damping:0.001];
    }
    [v7 mass];
    double v22 = v21;
    [v7 stiffness];
    double v30 = v23;
    [v7 damping];
  }
  else
  {
    [v7 dampingRatio];
    double v22 = 1.0;
    +[UIViewSpringAnimationState computeDerivedSpringParameters:&v30 zeta:&v29 mass:v15 velocity:v25 epsilon:1.0 stiffness:v9 damping:0.001];
    double v24 = v29;
  }
  double v29 = fmax(fabs(v24), 0.0);
  double v30 = fmax(fabs(v30), 0.01);
  objc_msgSend(v13, "setTimingFunction:", v12, *(void *)&v29);
  [v13 setMass:v22];
  [v13 setStiffness:v30];
  [v13 setDamping:v29];
  [v13 setVelocity:v9];
  [v13 speed];
  double v27 = v26 / self->_drag;
  *(float *)&double v27 = v27;
  [v13 setSpeed:v27];

  return v13;
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration dampingRatio:(CGFloat)ratio animations:(void *)animations
{
  double v8 = animations;
  double v9 = [[UISpringTimingParameters alloc] initWithDampingRatio:ratio];
  uint64_t v10 = [(UIViewPropertyAnimator *)self initWithDuration:v9 timingParameters:duration];
  uint64_t v11 = v10;
  if (v8) {
    [(UIViewPropertyAnimator *)v10 addAnimations:v8];
  }

  return v11;
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve animations:(void *)animations
{
  double v8 = animations;
  double v9 = [[UICubicTimingParameters alloc] initWithAnimationCurve:curve];
  uint64_t v10 = [(UIViewPropertyAnimator *)self initWithDuration:v9 timingParameters:duration];
  uint64_t v11 = v10;
  if (v8) {
    [(UIViewPropertyAnimator *)v10 addAnimations:v8];
  }

  return v11;
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration timingParameters:(id)parameters
{
  id v6 = parameters;
  v10.receiver = self;
  v10.super_class = (Class)UIViewPropertyAnimator;
  id v7 = [(UIViewPropertyAnimator *)&v10 init];
  double v8 = v7;
  if (v7) {
    [(UIViewPropertyAnimator *)v7 _setupWithDuration:v6 timingParameters:0 animations:duration];
  }

  return v8;
}

- (void)addAnimations:(void *)animation
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationDescriptionMap, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_timingParameters, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_trackingIdentifier, 0);
  objc_storeStrong((id *)&self->_viewAnimationState, 0);
  objc_destroyWeak((id *)&self->_caContinuationCommitFuture);
  objc_storeStrong((id *)&self->_continuedWithSpringForAnimationKeyMap, 0);
  objc_storeStrong((id *)&self->_additiveOffsetsForAnimationKeysMap, 0);
  objc_storeStrong((id *)&self->_originalFromValueMap, 0);
  objc_storeStrong((id *)&self->_originalToValueMap, 0);
  objc_storeStrong((id *)&self->_timingProviderWhenContinued, 0);
  objc_storeStrong((id *)&self->_timingFunctionWhenPaused, 0);
  objc_storeStrong((id *)&self->_timingFunctionPriorToPause, 0);
  objc_storeStrong((id *)&self->_pacingAnimationKey, 0);
  objc_destroyWeak((id *)&self->_outerAnimator);
  objc_storeStrong((id *)&self->_trackingDescription, 0);
  objc_storeStrong((id *)&self->_trackingState, 0);
}

- (void)dealloc
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
  id v4 = +[UIViewPropertyAnimator observedsOfAnimatorWithTrackingId:v3];

  if (v4 && [v4 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v10 removeObserver:self forKeyPath:@"running"];
          [v10 removeObserver:self forKeyPath:@"state"];
          [v10 removeObserver:self forKeyPath:@"reversed"];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    uint64_t v11 = objc_opt_class();
    long long v12 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
    [v11 removeAllObservedForObservingAnimatorWithId:v12];
  }
  if (dyld_program_sdk_at_least() && [(UIViewPropertyAnimator *)self _isActive])
  {
    int64_t v13 = [(UIViewPropertyAnimator *)self _animationState];
    if (os_variant_has_internal_diagnostics())
    {
      if (v13 != 2 && v13 != 4)
      {
        double v28 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v35 = v13;
          _os_log_fault_impl(&dword_1853B0000, v28, OS_LOG_TYPE_FAULT, "Animation state expected to be in paused or stopped state when deallocating while Active. Actual state %i", buf, 8u);
        }
      }
    }
    else if (v13 != 2 && v13 != 4)
    {
      double v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dealloc___s_category_0) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v35 = v13;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Animation state expected to be in paused or stopped state when deallocating while Active. Actual state %i", buf, 8u);
      }
    }
    BOOL v15 = [(UIViewPropertyAnimator *)self _isStarting];
    BOOL hasFinalized = self->_hasFinalized;
    BOOL v17 = v13 == 4 && v15;
    BOOL v18 = v13 != 2 || !hasFinalized;
    if (v18 && !v17)
    {
      BOOL v19 = v15;
      BOOL v20 = [(UIViewPropertyAnimator *)self _isPausedOnCompletion];
      double v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3B8];
      uint64_t v23 = [(UIViewPropertyAnimator *)self _animationStateAsString];
      double v24 = (void *)v23;
      double v25 = @"NO";
      if (v19) {
        float v26 = @"YES";
      }
      else {
        float v26 = @"NO";
      }
      if (hasFinalized) {
        double v25 = @"YES";
      }
      if (v20) {
        double v27 = @"It is an error to release a property animator that has paused on completion. Property animators must either finish animating or be explicitly stopped and finished before they can be released. (animationState = %@, isStarting = %@, hasFinalized = %@, name = %@)";
      }
      else {
        double v27 = @"It is an error to release a paused or stopped property animator. Property animators must either finish animating or be explicitly stopped and finished before they can be released. (animationState = %@, isStarting = %@, hasFinalized = %@, name = %@)";
      }
      objc_msgSend(v21, "raise:format:", v22, v27, v23, v26, v25, self->_name);
    }
  }

  v29.receiver = self;
  v29.super_class = (Class)UIViewPropertyAnimator;
  [(UIViewPropertyAnimator *)&v29 dealloc];
}

+ (id)observedsOfAnimatorWithTrackingId:(id)a3
{
  return (id)[(id)__ObservedByMapping objectForKey:a3];
}

- (void)_setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_unint64_t options = a3;
    self->_optionsAreExplicit = 1;
  }
}

- (void)_setPausesOnCompletion:(BOOL)a3
{
  if (!self->_interruptible) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"It is not allowed to set the pausesOnCompletion property on a non-interruptible animator (%@)", self format];
  }
  self->_pausesOnCompletion = a3;
}

- (void)setInterruptible:(BOOL)interruptible
{
  if ([(UIViewPropertyAnimator *)self _isActive]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"It is not allowed to set the interruptible property of an active animator (%@)", self format];
  }
  self->_interruptible = interruptible;
}

- (void)_setShouldLayoutSubviews:(BOOL)a3
{
  if ([(UIViewPropertyAnimator *)self _isActive]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"shouldLayoutSubviews may not be set on an active animator (%@)", self format];
  }
  self->_shouldLayoutSubviews = a3;
}

- (void)_setShouldBeginFromCurrentState:(BOOL)a3
{
  if ([(UIViewPropertyAnimator *)self _isActive]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"_shouldBeginFromCurrentState may not be set on an active animator (%@)", self format];
  }
  self->_shouldBeginFromCurrentState = a3;
}

- (UIViewPropertyAnimator)init
{
  id v3 = objc_opt_new();
  id v4 = [(UIViewPropertyAnimator *)self initWithDuration:v3 timingParameters:0.0];

  return v4;
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration controlPoint1:(CGPoint)point1 controlPoint2:(CGPoint)point2 animations:(void *)animations
{
  double y = point2.y;
  double x = point2.x;
  double v8 = point1.y;
  double v9 = point1.x;
  long long v12 = animations;
  int64_t v13 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]([UICubicTimingParameters alloc], "initWithControlPoint1:controlPoint2:", v9, v8, x, y);
  double v14 = [(UIViewPropertyAnimator *)self initWithDuration:v13 timingParameters:duration];
  BOOL v15 = v14;
  if (v12) {
    [(UIViewPropertyAnimator *)v14 addAnimations:v12];
  }

  return v15;
}

- (UIViewPropertyAnimator)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(CGVector)a6 animations:(id)a7
{
  ddouble y = a6.dy;
  ddouble x = a6.dx;
  id v13 = a7;
  double v14 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, dx, dy);
  BOOL v15 = [(UIViewPropertyAnimator *)self initWithDuration:v14 timingParameters:0.0];
  uint64_t v16 = v15;
  if (v13) {
    [(UIViewPropertyAnimator *)v15 addAnimations:v13];
  }

  return v16;
}

+ (UIViewPropertyAnimator)runningPropertyAnimatorWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void *)animations completion:(void *)completion
{
  long long v12 = completion;
  id v13 = animations;
  double v14 = (unsigned char *)[objc_alloc((Class)a1) initWithDuration:(options >> 16) & 7 curve:v13 animations:duration];

  objc_msgSend(v14, "setInterruptible:", +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled") ^ 1);
  [v14 setManualHitTestingEnabled:1];
  v14[51] = 1;
  [v14 _setOptions:options & 0xF0F0267];
  if (v12) {
    [v14 addCompletion:v12];
  }
  [v14 startAnimationAfterDelay:delay];

  return (UIViewPropertyAnimator *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(UIViewPropertyAnimator *)self duration];
  double v6 = v5;
  uint64_t v7 = [(UIViewPropertyAnimator *)self timingParameters];
  [v4 _setupWithDuration:v7 timingParameters:0 animations:v6];

  objc_msgSend(v4, "setUserInteractionEnabled:", -[UIViewPropertyAnimator isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  objc_msgSend(v4, "setInterruptible:", -[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"));
  objc_msgSend(v4, "_setShouldLayoutSubviews:", -[UIViewPropertyAnimator shouldLayoutSubviews](self, "shouldLayoutSubviews"));
  return v4;
}

+ (BOOL)_trackedAnimationsStartPaused
{
  BOOL v2 = [a1 _currentTrackedAnimationsState];
  char v3 = [v2 startPaused];

  return v3;
}

+ (void)_setTrackedAnimationsStartPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 _currentTrackedAnimationsState];
  [v4 setStartPaused:v3];
}

+ (BOOL)_trackedAnimationsScrubLinearly
{
  BOOL v2 = [a1 _currentTrackedAnimationsState];
  char v3 = [v2 scrubsLinearly];

  return v3;
}

+ (void)_setTrackedAnimationsScrubLinearly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 _currentTrackedAnimationsState];
  [v4 setScrubsLinearly:v3];
}

+ (BOOL)_trackedAnimationsUserInteractionEnabled
{
  BOOL v2 = [a1 _currentTrackedAnimationsState];
  char v3 = [v2 userInteractionEnabled];

  return v3;
}

+ (void)_setTrackedAnimationsUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 _currentTrackedAnimationsState];
  [v4 setUserInteractionEnabled:v3];
}

+ (BOOL)_trackedAnimationsOptimizationsEnabled
{
  BOOL v2 = [a1 _currentTrackedAnimationsState];
  char v3 = [v2 optimizationsEnabled];

  return v3;
}

+ (void)_setTrackedAnimationsOptimizationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 _currentTrackedAnimationsState];
  [v4 setOptimizationsEnabled:v3];
}

+ (id)_animatorForTrackedAnimationsUUID:(id)a3
{
  BOOL v3 = [a1 _animatorsForTrackedAnimationsUUID:a3];
  id v4 = [[_UIViewPropertyAnimatorTrackingGroup alloc] initWithAnimators:v3];

  return v4;
}

+ (id)_performWhileTrackingAnimations:(id)a3
{
  id v4 = (void (**)(void))a3;
  double v5 = [a1 _startTrackingAnimations];
  if (v4) {
    v4[2](v4);
  }
  [a1 _finishTrackingAnimations];
  double v6 = [a1 _animatorForTrackedAnimationsUUID:v5];

  return v6;
}

+ (id)_animatorsForTrackedAnimationsUUID:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 alloc];
  double v6 = [(id)_MergedGlobals_940 objectForKey:v4];

  uint64_t v7 = [v6 array];
  double v8 = (void *)[v5 initWithArray:v7];

  return v8;
}

+ (BOOL)_containsAnimatorForTrackedAnimationsUUID:(id)a3
{
  BOOL v3 = [(id)_MergedGlobals_940 objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setReversed:(BOOL)a3
{
  if (self->_reversed != a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__UIViewPropertyAnimator_setReversed___block_invoke;
    v6[3] = &unk_1E52D9FC0;
    v6[4] = self;
    BOOL v7 = a3;
    BOOL v4 = (void (**)(void))_Block_copy(v6);
    int64_t v5 = [(UIViewPropertyAnimator *)self _animationState];
    if ((unint64_t)(v5 - 3) >= 2)
    {
      if (v5 != 1)
      {
LABEL_7:

        return;
      }
      [(UIViewPropertyAnimator *)self willChangeValueForKey:@"reversed"];
      [(UIViewPropertyAnimator *)self pauseAnimationTransiently];
      v4[2](v4);
      [(UIViewPropertyAnimator *)self _continueWithTimingParameters:0 duration:0.0];
    }
    else
    {
      [(UIViewPropertyAnimator *)self willChangeValueForKey:@"reversed"];
      v4[2](v4);
    }
    [(UIViewPropertyAnimator *)self didChangeValueForKey:@"reversed"];
    goto LABEL_7;
  }
}

uint64_t __38__UIViewPropertyAnimator_setReversed___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) _setFinishingPosition:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) fractionComplete];
  double v3 = 1.0 - v2;
  BOOL v4 = *(void **)(a1 + 32);
  return [v4 setFractionComplete:v3];
}

- (double)_dragAdjustedDuration
{
  double drag = self->_drag;
  [(UIViewPropertyAnimator *)self internalDuration];
  return v3 * fmax(drag, 1.0);
}

- (double)unitDuration
{
  return self->_baseDuration;
}

- (NSTimeInterval)delay
{
  return self->_delay;
}

- (double)_drag
{
  return self->_drag;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([@"running" isEqualToString:v4] & 1) != 0
    || ([@"reversed" isEqualToString:v4] & 1) != 0
    || ([@"fractionComplete" isEqualToString:v4] & 1) != 0
    || ([@"state" isEqualToString:v4] & 1) != 0
    || ([@"animationState" isEqualToString:v4] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___UIViewPropertyAnimator;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)_springAnimationForXComponent:(id *)a3 forYComponent:(id *)a4
{
  objc_super v7 = [(UITimingCurveProvider *)self->_timingParameters springTimingParameters];
  id v8 = *a3;
  [v7 initialVelocity];
  double v10 = v9;
  if (([v7 implicitDuration] & 1) == 0)
  {
    double v18 = 0.0;
    double v19 = 0.0;
    [(UIViewPropertyAnimator *)self internalDuration];
    double v12 = v11;
    [v7 dampingRatio];
    +[UIViewSpringAnimationState computeDerivedSpringParameters:&v18 zeta:&v19 mass:v12 velocity:v13 epsilon:1.0 stiffness:v10 damping:0.001];
    [v8 stiffness];
    if (v14 < v18) {
      double v14 = v18;
    }
    objc_msgSend(v8, "damping", *(void *)&v14);
    if (v15 < v19) {
      double v15 = v19;
    }
    double v19 = v15;
    [v8 setStiffness:v18];
    [v8 setDamping:v19];
  }
  uint64_t v16 = (void *)[v8 copy];
  [v16 setVelocity:v10];
  id v17 = v16;
  *a4 = v17;
}

- (id)animationsDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__UIViewPropertyAnimator_animationsDescription__block_invoke;
  v7[3] = &unk_1E52DC860;
  id v5 = v3;
  id v8 = v5;
  +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v4, v7);

  return v5;
}

uint64_t __47__UIViewPropertyAnimator_animationsDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 debugDescription];
  [v3 appendFormat:@"<%@>\n", v4];

  return 0;
}

+ (id)_getPropertyAnimationForState:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)a3 + 34);
  return WeakRetained;
}

+ (void)animator:(id)a3 isObserving:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  double v6 = (void *)__ObservedByMapping;
  if (!__ObservedByMapping)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v8 = (void *)__ObservedByMapping;
    __ObservedByMapping = v7;

    double v6 = (void *)__ObservedByMapping;
  }
  double v9 = [v13 _trackingIdentifier];
  double v10 = [v6 objectForKey:v9];

  if (!v10)
  {
    double v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v11 = (void *)__ObservedByMapping;
    double v12 = [v13 _trackingIdentifier];
    [v11 setObject:v10 forKey:v12];
  }
  [v10 addObject:v5];
}

+ (void)removeObserved:(id)a3 forObservingAnimatorWithId:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  double v6 = [(id)__ObservedByMapping objectForKey:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 removeObject:v9];
    if (![v7 count])
    {
      [(id)__ObservedByMapping removeObjectForKey:v5];
      if (![(id)__ObservedByMapping count])
      {
        id v8 = (void *)__ObservedByMapping;
        __ObservedByMapping = 0;
      }
    }
  }
}

+ (void)removeAllObservedForObservingAnimatorWithId:(id)a3
{
  id v6 = a3;
  id v3 = objc_msgSend((id)__ObservedByMapping, "objectForKey:");
  id v4 = v3;
  if (v3)
  {
    [v3 removeAllObjects];
    [(id)__ObservedByMapping removeObjectForKey:v6];
    if (![(id)__ObservedByMapping count])
    {
      id v5 = (void *)__ObservedByMapping;
      __ObservedByMapping = 0;
    }
  }
}

- (id)_stateAsString
{
  unint64_t v2 = [(UIViewPropertyAnimator *)self state];
  if (v2 > 2) {
    return @"unknown";
  }
  else {
    return off_1E52DCB80[v2];
  }
}

- (id)_animationStateAsString
{
  unint64_t v2 = [(UIViewPropertyAnimator *)self _animationState];
  if (v2 > 5) {
    return @"unknown";
  }
  else {
    return off_1E52DCB98[v2];
  }
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  if ([(UIViewPropertyAnimator *)self _animationState] != 2
    && [(UIViewPropertyAnimator *)self _animationState])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIViewPropertyAnimator.m" lineNumber:2206 description:@"finishAnimationAtPosition: should only be called on a stopped animator!"];
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 2)
  {
    [(UIViewPropertyAnimator *)self _runCompletions:a3 finished:1];
  }
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(UIViewPropertyAnimator *)self _stateAsString];
  if ([(UIViewPropertyAnimator *)self isRunning]) {
    uint64_t v7 = @" running";
  }
  else {
    uint64_t v7 = &stru_1ED0E84C0;
  }
  if ([(UIViewPropertyAnimator *)self isReversed]) {
    id v8 = @" reversed";
  }
  else {
    id v8 = &stru_1ED0E84C0;
  }
  BOOL v9 = [(UIViewPropertyAnimator *)self isInterruptible];
  double v10 = @" interruptible";
  if (!v9) {
    double v10 = &stru_1ED0E84C0;
  }
  double v11 = [v3 stringWithFormat:@"<%@(%p) [%@]%@%@%@>", v5, self, v6, v7, v8, v10];

  return (NSString *)v11;
}

void __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_2(uint64_t a1)
{
  double v2 = 1.0 - *(double *)(a1 + 48);
  [*(id *)(a1 + 32) internalDuration];
  double v4 = v2 * v3;
  double v5 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) internalDuration];
  double v7 = v5 * v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_3;
  v8[3] = &unk_1E52DA040;
  id v9 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:0 delay:v8 options:0 animations:v4 completion:v7];
}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runAnimations];
}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runAnimations];
}

- (void)addAnimations:(void *)animation delayFactor:(CGFloat)delayFactor
{
}

- (id)_animationDescriptionForView:(id)a3
{
  id v4 = a3;
  double v5 = [(UIViewPropertyAnimator *)self _animationDescriptionMap];
  double v6 = [MEMORY[0x1E4F29238] valueWithPointer:v4];

  double v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)_explicitAnimationUpdateForProperty:(id)a3 forView:(id)a4 withValue:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double v10 = [(UIViewPropertyAnimator *)self _animationDescriptionForView:a4];
  double v11 = [v10 updates];
  double v12 = [v11 objectForKey:v9];

  id v13 = [v12 lastObject];
  double v14 = v13;
  if (v13 && ([v13 isImplicit] & 1) == 0)
  {
    uint64_t v16 = [v14 fromValue];
    if (v16)
    {
      id v15 = 0;
    }
    else
    {
      id v17 = [v14 toValue];
      if ([v17 isEqualToValue:v8]) {
        double v18 = v14;
      }
      else {
        double v18 = 0;
      }
      id v15 = v18;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_newAnimationUpdateForProperty:(id)a3 implicit:(BOOL)a4 additive:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [[_UIViewPropertyAnimationUpdate alloc] initWithPropertyName:v7 implicit:v6 additive:v5];

  return v8;
}

- (void)_notePropertyAnimationUpdate:(id)a3 forView:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F29238] valueWithPointer:v6];
  id v8 = [(UIViewPropertyAnimator *)self _animationDescriptionMap];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    id v9 = [[_UIViewPropertyAnimationDescription alloc] initWithView:v6];
    double v10 = [(UIViewPropertyAnimator *)self _animationDescriptionMap];
    [v10 setObject:v9 forKeyedSubscript:v7];
  }
  [(_UIViewPropertyAnimationDescription *)v9 _addUpdate:v11];
}

- (NSArray)animationDescriptions
{
  double v2 = [(UIViewPropertyAnimator *)self _animationDescriptionMap];
  double v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (double)_additiveOffsetForKey:(id)a3 inLayer:(id)a4
{
  id v4 = [(_UICompoundObjectMap *)self->_additiveOffsetsForAnimationKeysMap valueForObject:a4 andProperty:a3];
  BOOL v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = -1.0;
  }

  return v7;
}

- (double)_effectiveAdditiveOffsetForKey:(id)a3 inLayer:(id)a4
{
  [(UIViewPropertyAnimator *)self _additiveOffsetForKey:a3 inLayer:a4];
  double v6 = v5;
  if (v5 > 0.0)
  {
    [(UIViewPropertyAnimator *)self delay];
    if (v7 > 0.0)
    {
      [(UIViewPropertyAnimator *)self delay];
      double v9 = v8;
      [(UIViewPropertyAnimator *)self duration];
      double v6 = v6 - v9 / v10;
    }
  }
  double result = 1.0;
  if (v6 <= 1.0) {
    double result = v6;
  }
  if (v6 < 0.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)_setContinuedWithNewSpring:(BOOL)a3 forAnimationKey:(id)a4 forLayer:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  continuedWithSpringForAnimationKeyMap = self->_continuedWithSpringForAnimationKeyMap;
  if (!continuedWithSpringForAnimationKeyMap)
  {
    id v11 = +[_UICompoundObjectMap compoundObjectMap];
    double v12 = self->_continuedWithSpringForAnimationKeyMap;
    self->_continuedWithSpringForAnimationKeyMap = v11;

    continuedWithSpringForAnimationKeyMap = self->_continuedWithSpringForAnimationKeyMap;
  }
  id v13 = [NSNumber numberWithBool:v6];
  [(_UICompoundObjectMap *)continuedWithSpringForAnimationKeyMap setValue:v13 forObject:v9 andProperty:v8];

  return 1;
}

- (BOOL)_wasContinuedWithNewSpringForAnimationKey:(id)a3 forLayer:(id)a4
{
  id v4 = [(_UICompoundObjectMap *)self->_continuedWithSpringForAnimationKeyMap valueForObject:a4 andProperty:a3];
  double v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (id)_originalFromValueForKey:(id)a3 inLayer:(id)a4 forAnimatorWithTrackingIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [a1 _propertyAnimatorWithUUID:a5];
  id v11 = v10;
  if (v10)
  {
    double v12 = [v10 _originalFromValueForKey:v8 inLayer:v9];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)_untrackPropertyAnimationsForKeys:(id *)a3 inLayer:(id)a4
{
  id v10 = a4;
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    if (!a3[v6]) {
      break;
    }
    id v9 = [(UIViewPropertyAnimator *)self _viewAnimationState];
    [v9 _untrackAnimationsWithIdentifier:self->_trackingIdentifier keyPath:a3[v6] inLayer:v10 removeFromLayer:0];

    [(UIViewPropertyAnimator *)self _setOriginalFromValue:0 forKey:a3[v6] inLayer:v10];
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
}

- (double)_pauseAnimation:(id)a3 fromStart:(BOOL)a4
{
  [(UIViewPropertyAnimator *)self _pauseAnimation:a3 fromStart:a4 minimizingStateModifications:0];
  return result;
}

- (double)_pauseAnimation:(id)a3 fromStart:(BOOL)a4 minimizingStateModifications:(BOOL)a5
{
  id v9 = a3;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  uint64_t v67 = 0;
  id v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  char v66 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = (double *)&v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v60[3] = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__11;
  v58[4] = __Block_byref_object_dispose__11;
  id v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__11;
  v56[4] = __Block_byref_object_dispose__11;
  id v57 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  char v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 0;
  timingProviderWhenContinued = self->_timingProviderWhenContinued;
  if (timingProviderWhenContinued)
  {
    id v11 = timingProviderWhenContinued;
  }
  else
  {
    id v11 = [(UIViewPropertyAnimator *)self timingParameters];
    if (!v11)
    {
      uint64_t v22 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v22 = v11;
  if ([(UITimingCurveProvider *)v11 timingCurveType] == 2)
  {
  }
  else
  {
    uint64_t v12 = [(UITimingCurveProvider *)v11 timingCurveType];

    if (v12 != 3) {
      goto LABEL_8;
    }
  }
  BOOL v13 = [(UIViewPropertyAnimator *)self _computeSmallestDisplacementFractionComplete:v68 + 3];
  *((unsigned char *)v72 + 24) = v13;
LABEL_8:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke;
  aBlock[3] = &unk_1E52DC8D8;
  double v40 = v48;
  double v41 = v46;
  uint64_t v42 = &v52;
  uint64_t v43 = v50;
  id v14 = v9;
  id v38 = v14;
  uint64_t v39 = self;
  uint64_t v44 = v58;
  uint64_t v45 = v56;
  id v15 = _Block_copy(aBlock);
  uint64_t v16 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke_2;
  v23[3] = &unk_1E52DC900;
  double v25 = v60;
  float v26 = &v52;
  v23[4] = self;
  BOOL v35 = a4;
  double v27 = v50;
  double v28 = v58;
  objc_super v29 = v56;
  long long v30 = v48;
  long long v31 = &v71;
  long long v32 = &v67;
  id v17 = v14;
  BOOL v36 = a5;
  id v24 = v17;
  long long v33 = v65;
  double v34 = &v61;
  +[UIView modifyTrackedAnimations:removeOnCompletion:animationFactory:block:]((uint64_t)UIView, v16, 0, v15, v23);

  if (!a5)
  {
    self->_pausedAsSpring = *((unsigned char *)v53 + 24);
    objc_storeStrong((id *)&self->_timingFunctionWhenPaused, a3);
    self->_fractionCompleteWhenContinued = 0.0;
    double v18 = self->_timingProviderWhenContinued;
    self->_timingProviderWhenContinued = 0;
  }
  BOOL v19 = [(UIViewPropertyAnimator *)self isReversed];
  double v20 = v62[3];
  if (v19)
  {
    double v20 = 1.0 - v20;
    v62[3] = v20;
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);

  return v20;
}

id __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    char v10 = 0;
  }
  else {
    char v10 = [v8 hasPrefix:@"UIPacingAnimationForAnimatorsKey"];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v11 + 24)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  }
  *(unsigned char *)(v11 + 24) = v12;
  objc_opt_class();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_opt_isKindOfClass() & 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    char v13 = 0;
  }
  else if (*(void *)(a1 + 32))
  {
    char v13 = 1;
  }
  else
  {
    char v13 = [*(id *)(a1 + 40) _wasContinuedWithNewSpringForAnimationKey:v8 forLayer:v9];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v14 = v7;
    uint64_t v15 = [*(id *)(a1 + 40) _originalFromValueForKey:v8 inLayer:v9];
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      double v18 = [v14 keyPath];
      BOOL v19 = [*(id *)(a1 + 40) _trackingIdentifier];
      uint64_t v20 = _UIFromValueForAnimation(v14, v18, v9, v19);
      uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      uint64_t v23 = *(void **)(a1 + 40);
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      double v25 = [v14 keyPath];
      [v23 _setOriginalFromValue:v24 forKey:v25 inLayer:v9];
    }
    float v26 = *(void **)(a1 + 40);
    double v27 = [v14 keyPath];
    uint64_t v28 = [v26 _originalToValueForKey:v27 inLayer:v9];
    uint64_t v29 = *(void *)(*(void *)(a1 + 88) + 8);
    long long v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    long long v31 = (void *)MEMORY[0x1E4F39B48];
    long long v32 = [v14 keyPath];
    long long v33 = [v31 animationWithKeyPath:v32];

    double v34 = [v14 delegate];
    [v33 setDelegate:v34];

    BOOL v35 = [v14 timingFunction];
    [v33 setTimingFunction:v35];

    [v33 setToValue:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    [v33 setFromValue:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    [v14 duration];
    objc_msgSend(v33, "setDuration:");
    [v14 preferredFrameRateRange];
    objc_msgSend(v33, "setPreferredFrameRateRange:");
    objc_msgSend(v33, "setHighFrameRateReason:", objc_msgSend(v14, "highFrameRateReason"));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v7;
      uint64_t v37 = [v36 animations];
      id v38 = [v37 firstObject];
      long long v33 = (void *)[v38 copy];

      id v14 = [v36 delegate];

      [v33 setDelegate:v14];
    }
    else
    {
      long long v33 = (void *)[v7 copy];
      uint64_t v39 = *(void *)(*(void *)(a1 + 88) + 8);
      double v40 = *(void **)(v39 + 40);
      *(void *)(v39 + 40) = 0;

      uint64_t v41 = *(void *)(*(void *)(a1 + 80) + 8);
      id v14 = *(id *)(v41 + 40);
      *(void *)(v41 + 40) = 0;
    }
  }

  [v33 setBeginTime:0.0];
  [v33 setBeginTimeMode:@"relative"];

  return v33;
}

uint64_t __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, id *a7)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0xBFF0000000000000;
  double v46 = 1.0;
  id v14 = *a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
  if (WeakRetained
    && (double v18 = WeakRetained,
        id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152)),
        char v20 = [v19 _isFinished],
        v19,
        v18,
        (v20 & 1) == 0))
  {
    double v25 = *(double **)(a1 + 32);
    double v24 = v25[3];
  }
  else
  {
    uint64_t v21 = [*(id *)(a1 + 32) _viewAnimationState];
    [v12 duration];
    objc_msgSend(v21, "_unpacedFractionCompleteForAnimation:inLayer:duration:", v12, v11);
    double v23 = 1.0;
    if (v22 <= 1.0) {
      double v23 = v22;
    }
    if (v22 >= 0.0) {
      double v24 = v23;
    }
    else {
      double v24 = 0.0;
    }

    double v25 = *(double **)(a1 + 32);
  }
  if ([v25 isReversed]) {
    double v26 = 1.0 - v24;
  }
  else {
    double v26 = v24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v27 = [v12 animations];
    uint64_t v28 = [v27 firstObject];

    [*(id *)(a1 + 32) _effectiveAdditiveOffsetForKey:v13 inLayer:v11];
    double v30 = 0.0;
    if (v29 < v26) {
      double v30 = (v26 - v29) / (1.0 - v29);
    }

    double v26 = v30;
    id v12 = (id)v28;
  }
  double v32 = 0.0;
  if ([v11 hasBeenCommitted] && !*(unsigned char *)(a1 + 128))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        double v32 = v26;
        goto LABEL_22;
      }
    }
    else if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      goto LABEL_46;
    }
    int v41 = [*(id *)(a1 + 32) _computeDisplacementFractionComplete:v16 withKey:v13 inLayer:v11 fromValue:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) toValue:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fractionComplete:*(void *)(*(void *)(a1 + 48) + 8) + 24 displacement:&v46];
    [*(id *)(a1 + 32) _restoreLayerValueIfReversed:v11 animation:v16 toValue:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
      {
        double v31 = v46;
        if (v46 != 0.0 && v41 == 1)
        {
LABEL_52:
          double v45 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          if (v45 > 0.0) {
            double v32 = computeInverseOfTimingFunction(*(void **)(a1 + 40), v45);
          }
          goto LABEL_22;
        }
      }
    }
LABEL_46:
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                              + 24);
    }
    else if (v26 > 0.0)
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v42 = objc_msgSend(v12, "timingFunction", v31);
        *(float *)&double v43 = v26;
        [v42 _solveForInput:v43];
        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v44;
      }
      else
      {
        double v32 = v26;
      }
    }
    goto LABEL_52;
  }
LABEL_22:
  double v33 = 0.99999;
  if (v32 <= 0.99999) {
    double v33 = v32;
  }
  if (v32 >= 0.0) {
    double v34 = v33;
  }
  else {
    double v34 = 0.0;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 96) && !*(unsigned char *)(a1 + 129))
  {
    uint64_t v35 = objc_msgSend(v14, "timingFunction", v33);
    uint64_t v36 = *(void *)(a1 + 32);
    uint64_t v37 = *(void **)(v36 + 96);
    *(void *)(v36 + 96) = v35;
  }
  uint64_t v38 = *(void *)(*(void *)(a1 + 112) + 8);
  if (!*(unsigned char *)(v38 + 24))
  {
    *(unsigned char *)(v38 + 24) = 1;
    *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = v34;
  }
  [v14 setSpeed:0.0];
  [v14 setFillMode:*MEMORY[0x1E4F39FA0]];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v16 setFromValue:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    }
  }
  [v12 duration];
  [v14 setTimeOffset:v34 * v39];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v14, "setTimingFunction:");
  }

  return 0;
}

- (void)pauseAnimationTransiently
{
  [(UIViewPropertyAnimator *)self _setAnimationState:4];
  id v4 = [(UIViewPropertyAnimator *)self timingFunctionForPause];
  [(UIViewPropertyAnimator *)self _pauseAnimation:v4 fromStart:0];
  self->_fractionComplete = v3;
}

- (id)timingFunctionForPause
{
  if (self->_scrubsLinearly)
  {
    double v2 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (void)pauseAnimation
{
  if (![(UIViewPropertyAnimator *)self isInterruptible])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 2717, @"An animator %@ that is not interruptible cannot be paused!", self object file lineNumber description];
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 3) {
    [(UIViewPropertyAnimator *)self startAnimationAsPaused:1];
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 1)
  {
    [(UIViewPropertyAnimator *)self willChangeValueForKey:@"fractionComplete"];
    [(UIViewPropertyAnimator *)self _setAnimationState:4];
    id v4 = [(UIViewPropertyAnimator *)self timingFunctionForPause];
    [(UIViewPropertyAnimator *)self _pauseAnimation:v4 fromStart:0];
    self->_fractionComplete = v5;

    [(UIViewPropertyAnimator *)self didChangeValueForKey:@"fractionComplete"];
    [(UIViewPropertyAnimator *)self _setKVOCompliantRunning:0];
  }
}

- (void)_restoreLayerValueIfReversed:(id)a3 animation:(id)a4 toValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UIViewPropertyAnimator *)self isReversed])
  {
    if (v10)
    {
      id v11 = v10;
LABEL_5:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __73__UIViewPropertyAnimator__restoreLayerValueIfReversed_animation_toValue___block_invoke;
      v14[3] = &unk_1E52DCB30;
      id v15 = v8;
      id v16 = v11;
      id v17 = v9;
      id v13 = v11;
      +[UIView performWithoutAnimation:v14];

      goto LABEL_6;
    }
    id v12 = [v9 keyPath];
    id v11 = [v8 valueForKeyPath:v12];

    if (v11) {
      goto LABEL_5;
    }
  }
LABEL_6:
}

void __73__UIViewPropertyAnimator__restoreLayerValueIfReversed_animation_toValue___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) keyPath];
  [v1 setValue:v2 forKeyPath:v3];
}

- (BOOL)_computeDisplacementFractionComplete:(id)a3 withKey:(id)a4 inLayer:(id)a5 fromValue:(id)a6 toValue:(id)a7 fractionComplete:(double *)a8 displacement:(double *)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  double v100 = 0.0;
  v101[0] = 1.0;
  id v18 = a4;
  int v19 = [v18 hasSuffix:@".x"];
  int v20 = [v18 hasSuffix:@".y"];
  LODWORD(a5) = [v18 hasPrefix:@"transform"];

  int v56 = (int)a5;
  if (v17)
  {
    id v21 = v17;
  }
  else
  {
    double v22 = [v14 keyPath];
    id v21 = [v15 valueForKeyPath:v22];
  }
  id v57 = v17;
  int v23 = v20;
  if (v16)
  {
    double v24 = v16;
    id v25 = v16;
  }
  else
  {
    double v24 = 0;
    double v26 = [v14 keyPath];
    double v27 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
    _UIFromValueForAnimation(v14, v26, v15, v27);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v28 = [v15 presentationLayer];
  double v29 = (void *)v28;
  id v59 = v15;
  if (v28) {
    double v30 = (void *)v28;
  }
  else {
    double v30 = v15;
  }
  double v31 = v14;
  double v32 = [v14 keyPath];
  uint64_t v33 = [v30 valueForKeyPath:v32];
  double v34 = (void *)v33;
  if (v33) {
    uint64_t v35 = (void *)v33;
  }
  else {
    uint64_t v35 = v25;
  }
  id v36 = v35;

  if (v19)
  {
    [v21 CGPointValue];
    double v38 = v37;
    [v25 CGPointValue];
    double v40 = vabdd_f64(v38, v39);
    v101[0] = v40;
    [v21 CGPointValue];
    double v42 = v41;
    [v36 CGPointValue];
    double v44 = vabdd_f64(v42, v43);
  }
  else if (v23)
  {
    [v21 CGPointValue];
    double v46 = v45;
    [v25 CGPointValue];
    double v40 = vabdd_f64(v46, v47);
    v101[0] = v40;
    [v21 CGPointValue];
    double v49 = v48;
    [v36 CGPointValue];
    double v44 = vabdd_f64(v49, v50);
  }
  else
  {
    objc_msgSend(v21, "CA_distanceToValue:", v25);
    double v40 = fabs(v51);
    v101[0] = v40;
    objc_msgSend(v21, "CA_distanceToValue:", v36);
    double v44 = fabs(v52);
  }
  double v100 = v44;
  if (v40 == 0.0)
  {
    double v53 = -1.0;
    if (v56)
    {
      long long v54 = 0uLL;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      if (v25)
      {
        [v25 CATransform3DValue];
        long long v54 = 0uLL;
      }
      long long v90 = v54;
      long long v91 = v54;
      long long v88 = v54;
      long long v89 = v54;
      long long v86 = v54;
      long long v87 = v54;
      long long v84 = v54;
      long long v85 = v54;
      if (v21) {
        [v21 CATransform3DValue];
      }
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      if (v36) {
        [v36 CATransform3DValue];
      }
      long long v72 = v96;
      long long v73 = v97;
      long long v74 = v98;
      long long v75 = v99;
      long long v68 = v92;
      long long v69 = v93;
      long long v70 = v94;
      long long v71 = v95;
      long long v64 = v88;
      long long v65 = v89;
      long long v66 = v90;
      long long v67 = v91;
      long long v60 = v84;
      long long v61 = v85;
      long long v62 = v86;
      long long v63 = v87;
      if (_UIVPA_CATransformDisplacement(&v68, &v60, v101))
      {
        long long v72 = v96;
        long long v73 = v97;
        long long v74 = v98;
        long long v75 = v99;
        long long v68 = v92;
        long long v69 = v93;
        long long v70 = v94;
        long long v71 = v95;
        long long v64 = v80;
        long long v65 = v81;
        long long v66 = v82;
        long long v67 = v83;
        long long v60 = v76;
        long long v61 = v77;
        long long v62 = v78;
        long long v63 = v79;
        if (_UIVPA_CATransformDisplacement(&v68, &v60, &v100)) {
          double v53 = v100 / v101[0];
        }
      }
    }
  }
  else
  {
    double v53 = fabs((v40 - v44) / v40);
  }
  if (a8) {
    *a8 = v53;
  }
  if (a9) {
    *a9 = v101[0];
  }

  return v53 != -1.0;
}

- (BOOL)_computeSmallestDisplacementFractionComplete:(double *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x3FF0000000000000;
  double v5 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__UIViewPropertyAnimator__computeSmallestDisplacementFractionComplete___block_invoke;
  v8[3] = &unk_1E52DC928;
  void v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v13;
  +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v5, v8);

  if (a3) {
    *a3 = v10[3];
  }
  char v6 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __71__UIViewPropertyAnimator__computeSmallestDisplacementFractionComplete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 animationForKey:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v10 keyPath];
    uint64_t v13 = [v11 _originalFromValueForKey:v12 inLayer:v7];

    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = [v10 keyPath];
    char v16 = [v14 _originalToValueForKey:v15 inLayer:v7];

    id v17 = *(void **)(a1 + 32);
    double v21 = 0.0;
    LODWORD(v15) = [v17 _computeDisplacementFractionComplete:v10 withKey:v8 inLayer:v7 fromValue:v13 toValue:v16 fractionComplete:&v21 displacement:0];
    [*(id *)(a1 + 32) _restoreLayerValueIfReversed:v7 animation:v10 toValue:v16];
    if (v15)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      double v19 = *(double *)(v18 + 24);
      if (v19 >= v21) {
        double v19 = v21;
      }
      *(double *)(v18 + 24) = v19;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return 0;
}

- (void)_continueWithTimingParameters:(id)a3 duration:(double)a4
{
  id v7 = a3;
  if ([(UIViewPropertyAnimator *)self _animationState] != 4) {
    goto LABEL_39;
  }
  if ([(UIViewPropertyAnimator *)self _isStarting])
  {
    [(UIViewPropertyAnimator *)self addAnimations:&__block_literal_global_591];
    goto LABEL_39;
  }
  id v8 = [(UIViewPropertyAnimator *)self _trackingIdentifier];

  if (!v8) {
    goto LABEL_39;
  }
  uint64_t v9 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
  BOOL pausedAsSpring = self->_pausedAsSpring;
  double v38 = self->_timingFunctionPriorToPause;
  uint64_t v11 = self->_timingFunctionWhenPaused;
  [(UIViewPropertyAnimator *)self internalDuration];
  double v13 = v12;
  id v14 = [(UIViewPropertyAnimator *)self timingParameters];
  uint64_t v15 = v14;
  if (v14) {
    BOOL v16 = [v14 timingCurveType] == 2 || objc_msgSend(v15, "timingCurveType") == 3;
  }
  else {
    BOOL v16 = 0;
  }

  id v17 = v7;
  uint64_t v18 = v17;
  if (v17)
  {
    if ([v17 timingCurveType] == 2)
    {

      BOOL v16 = 1;
    }
    else
    {
      BOOL v16 = [v18 timingCurveType] == 3;
    }
    int v20 = mediaTimingFunctionForTimingProvider(v18);
  }
  else
  {
    double v19 = [(UIViewPropertyAnimator *)self timingParameters];
    int v20 = mediaTimingFunctionForTimingProvider(v19);
  }
  self->_BOOL pausedAsSpring = 0;
  timingFunctionPriorToPause = self->_timingFunctionPriorToPause;
  self->_timingFunctionPriorToPause = 0;

  timingFunctionWhenPaused = self->_timingFunctionWhenPaused;
  self->_timingFunctionWhenPaused = 0;

  [(UIViewPropertyAnimator *)self _setAnimationState:1];
  self->_double fractionCompleteWhenContinued = self->_fractionComplete;
  objc_storeStrong((id *)&self->_timingProviderWhenContinued, a3);
  self->_pausedOnCompletion = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  char v50 = 0;
  if (a4 != 0.0)
  {
    double fractionComplete = self->_fractionComplete;
    [(UIViewPropertyAnimator *)self internalDuration];
    double v13 = a4 / (1.0 - fractionComplete);
    if (v24 != v13) {
      [(UIViewPropertyAnimator *)self setInternalDuration:v13];
    }
  }
  double v25 = self->_fractionComplete;
  BOOL v26 = [(UIViewPropertyAnimator *)self isReversed];
  double v27 = 1.0 - v25;
  if (!v26) {
    double v27 = v25;
  }
  *(double *)&unint64_t v48 = -1.0;
  if (!v16)
  {
    if (pausedAsSpring)
    {
      if (-[UIViewPropertyAnimator _computeSmallestDisplacementFractionComplete:](self, "_computeSmallestDisplacementFractionComplete:", &v48, v27))
      {
        double v25 = *(double *)&v48;
LABEL_30:
        if (v20) {
          double v25 = computeInverseOfTimingFunction(v20, v25);
        }
        if ([(UIViewPropertyAnimator *)self isReversed]) {
          double v25 = 1.0 - v25;
        }
        goto LABEL_34;
      }
    }
    else
    {
      *(float *)&double v27 = v27;
      if (v11) {
        [(CAMediaTimingFunction *)v11 _solveForInput:v27];
      }
      else {
        [(CAMediaTimingFunction *)v38 _solveForInput:v27];
      }
      double v25 = v28;
    }
    *(double *)&unint64_t v48 = v25;
    goto LABEL_30;
  }
LABEL_34:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_2;
  aBlock[3] = &unk_1E52DC950;
  void aBlock[5] = v51;
  aBlock[6] = v49;
  void aBlock[4] = self;
  BOOL v46 = v16;
  BOOL v47 = pausedAsSpring;
  double v29 = _Block_copy(aBlock);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_3;
  v40[3] = &unk_1E52DC978;
  v40[4] = self;
  double v43 = v13;
  double v44 = v25;
  id v41 = v18;
  id v30 = v20;
  id v42 = v30;
  +[UIView modifyTrackedAnimations:removeOnCompletion:animationFactory:block:]((uint64_t)UIView, v9, 0, v29, v40);
  self->_double fractionComplete = v25;
  double v31 = [(UIViewPropertyAnimator *)self _animations];

  if (v31)
  {
    BOOL v32 = [(UIViewPropertyAnimator *)self isReversed];
    double fractionCompleteWhenContinued = self->_fractionCompleteWhenContinued;
    [(UIViewPropertyAnimator *)self internalDuration];
    double v35 = v34;
    if (!v32) {
      double fractionCompleteWhenContinued = 1.0 - fractionCompleteWhenContinued;
    }
    id v36 = [(UIViewPropertyAnimator *)self _viewAnimationState];
    double v37 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_4;
    v39[3] = &unk_1E52D9F70;
    v39[4] = self;
    +[UIView _performWithState:v36 trackingIdentifier:v37 duration:v39 delay:v35 * fractionCompleteWhenContinued animations:0.0];
  }
  [(UIViewPropertyAnimator *)self _scheduleCACommitFuture];

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

LABEL_39:
}

id __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v10 + 24))
  {
    char v11 = 0;
    char v12 = 1;
  }
  else
  {
    char v13 = [v8 hasPrefix:@"UIPacingAnimationForAnimatorsKey"];
    char v11 = v13;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v10 + 24)) {
      char v12 = 1;
    }
    else {
      char v12 = v13;
    }
  }
  *(unsigned char *)(v10 + 24) = v12;
  id v14 = v7;
  objc_opt_class();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_opt_isKindOfClass() & 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;
  id v17 = v16;
  if (v16)
  {
    uint64_t v18 = *(void **)(a1 + 32);
    double v19 = [v16 keyPath];
    int v20 = [v18 _originalFromValueForKey:v19 inLayer:v9];

    double v21 = *(void **)(a1 + 32);
    double v22 = [v17 keyPath];
    long long v60 = [v21 _originalToValueForKey:v22 inLayer:v9];

    int v23 = [v17 keyPath];
    int v24 = [(__CFString *)v23 hasSuffix:@".origin"];
    int v25 = [(__CFString *)v23 hasSuffix:@".size"];
    int v26 = v25;
    if ((v24 & 1) != 0 || v25)
    {
      if ([(__CFString *)v23 hasPrefix:@"bounds"])
      {

        int v23 = @"bounds";
      }
      if ([(__CFString *)v23 hasPrefix:@"contentsRect"])
      {

        int v23 = @"contentsRect";
      }
      if ([(__CFString *)v23 hasPrefix:@"contentsCenter"])
      {

        int v23 = @"contentsCenter";
      }
    }
    else
    {
      int v24 = 0;
    }
  }
  else
  {
    int v26 = 0;
    int v24 = 0;
    int v23 = 0;
    long long v60 = 0;
    int v20 = 0;
  }
  if (*(unsigned char *)(a1 + 56)) {
    char v27 = v11;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) != 0 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 57)) {
      char v34 = v11;
    }
    else {
      char v34 = 1;
    }
    if ((v34 & 1) != 0 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v30 = (void *)[v14 copy];
    }
    else
    {
      id v35 = v8;
      id v36 = (void *)MEMORY[0x1E4F39B48];
      [v17 keyPath];
      v38 = double v37 = v20;
      id v30 = [v36 animationWithKeyPath:v38];

      int v20 = v37;
      double v39 = [v14 delegate];
      [v30 setDelegate:v39];

      [v30 setFromValue:v37];
      double v40 = [*(id *)(a1 + 32) _viewAnimationState];
      [v40 _transformIntoAdditiveAnimationAndNoteOriginal:v30 inLayer:v9 animationKey:v35];

      id v8 = v35;
      [v14 preferredFrameRateRange];
      objc_msgSend(v30, "setPreferredFrameRateRange:");
      objc_msgSend(v30, "setHighFrameRateReason:", objc_msgSend(v14, "highFrameRateReason"));
    }
    goto LABEL_44;
  }
  id v59 = v20;
  float v28 = (void *)MEMORY[0x1E4F39C90];
  double v29 = [v17 keyPath];
  id v30 = [v28 animationWithKeyPath:v29];

  double v31 = [v14 delegate];
  [v30 setDelegate:v31];

  id v58 = v8;
  if ([*(id *)(a1 + 32) isReversed])
  {
    BOOL v32 = v30;
    uint64_t v33 = v59;
LABEL_36:
    [v32 setToValue:v33];
    goto LABEL_37;
  }
  if (v60)
  {
    BOOL v32 = v30;
    uint64_t v33 = v60;
    goto LABEL_36;
  }
LABEL_37:
  id v41 = [v9 presentationLayer];
  id v42 = v41;
  if (!v41) {
    id v41 = v9;
  }
  double v43 = [v41 valueForKeyPath:v23];
  [v30 setFromValue:v43];

  if (v26)
  {
    double v44 = [v30 fromValue];
    [v44 CGRectValue];
    double v46 = v45;
    double v48 = v47;

    double v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v46, v48);
    [v30 setFromValue:v49];
  }
  if (v24)
  {
    char v50 = [v30 fromValue];
    [v50 CGRectValue];
    double v52 = v51;
    double v54 = v53;

    char v55 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v52, v54);
    [v30 setFromValue:v55];
  }
  int v56 = [*(id *)(a1 + 32) _viewAnimationState];
  [v56 _transformIntoAdditiveAnimationAndNoteOriginal:v30 inLayer:v9 animationKey:v58];

  id v8 = v58;
  [v14 preferredFrameRateRange];
  objc_msgSend(v30, "setPreferredFrameRateRange:");
  objc_msgSend(v30, "setHighFrameRateReason:", objc_msgSend(v14, "highFrameRateReason"));
  [*(id *)(a1 + 32) _setContinuedWithNewSpring:1 forAnimationKey:v58 forLayer:v9];
  int v20 = v59;
LABEL_44:

  return v30;
}

uint64_t __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, id *a7)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = *a7;
  id v12 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  [*(id *)(a1 + 32) _effectiveAdditiveOffsetForKey:v10 inLayer:v12];
  double v15 = v14;

  double v16 = *(double *)(a1 + 56);
  int v17 = [*(id *)(a1 + 32) isReversed];
  double v18 = *(double *)(a1 + 64);
  double v19 = 1.0 - v15;
  double v20 = (v18 - v15) / (1.0 - v15);
  double v21 = v16 * (v15 - v18);
  if (v15 <= 0.0) {
    double v21 = 0.0;
  }
  if (v15 <= v18) {
    double v21 = 0.0;
  }
  else {
    double v20 = 0.0;
  }
  double v22 = v18 / v19;
  if (v17)
  {
    double v23 = 0.0;
  }
  else
  {
    double v22 = v20;
    double v23 = v21;
  }
  double v24 = v19 * v16;
  double v25 = v24 * (1.0 - v22);
  if (isKindOfClass)
  {
    id v26 = v11;
    double v52 = 0.0;
    double v53 = 0.0;
    char v27 = *(void **)(a1 + 40);
    if (v27)
    {
      float v28 = [v27 springTimingParameters];
    }
    else
    {
      double v40 = [*(id *)(a1 + 32) timingParameters];
      float v28 = [v40 springTimingParameters];
    }
    objc_msgSend(v28, "initialVelocity", *(void *)&v52);
    double v42 = v41;
    double v44 = v43;
    [v28 dampingRatio];
    double v46 = v45;
    double v47 = [v26 keyPath];
    if ([v47 hasPrefix:@"position"])
    {
      int v48 = [v10 hasSuffix:@".y"];

      if (v48) {
        double v42 = v44;
      }
    }
    else
    {
    }
    +[UIViewSpringAnimationState computeDerivedSpringParameters:&v53 zeta:&v52 mass:v25 velocity:v46 epsilon:1.0 stiffness:v42 damping:0.001];
    [v26 setMass:1.0];
    [v26 setStiffness:v53];
    [v26 setDamping:v52];
    [v26 setVelocity:v42];
    [v26 setDuration:v25];
    [v26 setBeginTimeMode:@"relative"];
    [v26 setFillMode:*MEMORY[0x1E4F39FA0]];
    double v49 = 1.0 / *(double *)(*(void *)(a1 + 32) + 40);
    *(float *)&double v49 = v49;
    [v26 setSpeed:v49];
    [v26 setTimingFunction:*(void *)(a1 + 48)];

    goto LABEL_24;
  }
  [v11 setTimeOffset:0.0];
  [v11 setAutoreverses:0];
  [v11 setBeginTime:v23 - (v24 - v25) * *(double *)(*(void *)(a1 + 32) + 40)];
  int v29 = [*(id *)(a1 + 32) isReversed];
  double v30 = -1.0;
  if (!v29) {
    double v30 = 1.0;
  }
  double v31 = v30 / *(double *)(*(void *)(a1 + 32) + 40);
  *(float *)&double v31 = v31;
  [v11 setSpeed:v31];
  [v11 setDuration:v24];
  [v11 setBeginTimeMode:@"relative"];
  uint64_t v32 = *MEMORY[0x1E4F39FA0];
  [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v11 setTimingFunction:*(void *)(a1 + 48)];
  id v26 = v11;
  if ([*(id *)(a1 + 32) isReversed])
  {
    [*(id *)(a1 + 32) internalDuration];
    id v26 = v11;
    if (v24 < v33)
    {
      id v34 = objc_alloc_init(MEMORY[0x1E4F39B38]);
      v54[0] = v11;
      id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
      [v34 setAnimations:v35];

      [*(id *)(a1 + 32) internalDuration];
      objc_msgSend(v34, "setDuration:");
      [v34 setBeginTimeMode:@"relative"];
      [v11 beginTime];
      objc_msgSend(v34, "setBeginTime:");
      id v36 = [v11 delegate];
      [v34 setDelegate:v36];

      [v34 setFillMode:v32];
      double v37 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v34 setTimingFunction:v37];

      double v38 = 1.0 / *(double *)(*(void *)(a1 + 32) + 40);
      *(float *)&double v38 = v38;
      [v34 setSpeed:v38];
      id v26 = v34;

      [v11 setBeginTime:0.0];
      [v11 setDelegate:0];
      LODWORD(v39) = -1.0;
      [v11 setSpeed:v39];
LABEL_24:
    }
  }
  id v50 = v26;
  *a7 = v50;

  return 0;
}

uint64_t __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runAnimations];
}

- (void)continueAnimationWithTimingParameters:(id)parameters durationFactor:(CGFloat)durationFactor
{
  id v9 = parameters;
  if (![(UIViewPropertyAnimator *)self isInterruptible])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 3151, @"An animator %@ that is not interruptible cannot be continued or reversed!", self object file lineNumber description];
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    [(UIViewPropertyAnimator *)self unitDuration];
    [(UIViewPropertyAnimator *)self _continueWithTimingParameters:v9 duration:v7 * durationFactor];
    [(UIViewPropertyAnimator *)self _setKVOCompliantRunning:1];
  }
}

- (void)continueAnimation
{
}

- (void)_scheduleCACommitFuture
{
  p_caContinuationCommitFuture = &self->_caContinuationCommitFuture;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_caContinuationCommitFuture);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_caContinuationCommitFuture);
    [v4 invalidate];
  }
  id v5 = +[_UIAppCACommitFuture scheduledPostCommitFuture:0];
  objc_storeWeak((id *)p_caContinuationCommitFuture, v5);
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAnimationForKey:");
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) != a2) {
    [*(id *)(a1 + 40) addObject:a2];
  }
  return 0;
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v12);
        [v7 animationDidStop:v8 finished:0];

        [v7 sendDelegateDidStopManually:0];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = *(void **)(a1 + 40);
  id v10 = [MEMORY[0x1E4F1CA98] null];
  [v9 animationDidStop:v10 finished:0];

  return [*(id *)(a1 + 40) sendDelegateDidStopManually:0];
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)computeCurrentTimingFunction:(double)a3
{
  int64_t v5 = [(UIViewPropertyAnimator *)self _animationState];
  if ((unint64_t)(v5 - 1) < 3)
  {
LABEL_2:
    timingProviderWhenContinued = self->_timingProviderWhenContinued;
    if (timingProviderWhenContinued)
    {
      double v7 = timingProviderWhenContinued;
    }
    else
    {
      double v7 = [(UIViewPropertyAnimator *)self timingParameters];
    }
    id v9 = (CAMediaTimingFunction *)v7;
    [(UIViewPropertyAnimator *)self duration];
    a3 = computeTimingProvider(v9, v11, a3);
    goto LABEL_11;
  }
  if (v5 == 4)
  {
    timingFunctionWhenPaused = self->_timingFunctionWhenPaused;
    if (timingFunctionWhenPaused)
    {
      id v9 = timingFunctionWhenPaused;
    }
    else
    {
      id v9 = self->_timingFunctionPriorToPause;
      if (!v9) {
        goto LABEL_2;
      }
    }
    *(float *)&double v10 = a3;
    [(CAMediaTimingFunction *)v9 _solveForInput:v10];
    a3 = v12;
LABEL_11:
  }
  return a3;
}

- (double)computeInverseOfCurrentTimingFunction:(double)a3
{
  int64_t v5 = [(UIViewPropertyAnimator *)self _animationState];
  if ((unint64_t)(v5 - 1) < 3)
  {
    timingProviderWhenContinued = self->_timingProviderWhenContinued;
    if (timingProviderWhenContinued)
    {
      double v7 = timingProviderWhenContinued;
    }
    else
    {
      double v7 = [(UIViewPropertyAnimator *)self timingParameters];
    }
    id v9 = (CAMediaTimingFunction *)v7;
    [(UIViewPropertyAnimator *)self duration];
    double v10 = computeInverseOfTimingProvider(v9, v11, a3);
    goto LABEL_9;
  }
  if (v5 == 4)
  {
    id v8 = self->_timingFunctionWhenPaused;
    if (!v8)
    {
      long long v13 = self->_timingProviderWhenContinued;
      if (v13)
      {
        long long v14 = v13;
      }
      else
      {
        long long v14 = [(UIViewPropertyAnimator *)self timingParameters];
      }
      long long v15 = v14;
      [(UIViewPropertyAnimator *)self duration];
      a3 = computeInverseOfTimingProvider(v15, v16, a3);

      id v9 = 0;
      goto LABEL_10;
    }
    id v9 = v8;
    double v10 = computeInverseOfTimingFunction(v8, a3);
LABEL_9:
    a3 = v10;
LABEL_10:
  }
  return a3;
}

- (double)pacedFractionComplete
{
  [(UIViewPropertyAnimator *)self fractionComplete];
  if (result > 0.00001 && result < 0.99999)
  {
    -[UIViewPropertyAnimator computeCurrentTimingFunction:](self, "computeCurrentTimingFunction:");
  }
  return result;
}

- (void)setPacedFractionComplete:(double)a3
{
  if (a3 > 0.00001 && a3 < 0.99999) {
    -[UIViewPropertyAnimator computeInverseOfCurrentTimingFunction:](self, "computeInverseOfCurrentTimingFunction:");
  }
  -[UIViewPropertyAnimator setFractionComplete:](self, "setFractionComplete:");
}

- (double)fractionComplete
{
  int64_t v3 = [(UIViewPropertyAnimator *)self _animationState];
  double result = 0.0;
  if (v3 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_caContinuationCommitFuture);
    if (!WeakRetained
      || (uint64_t v6 = WeakRetained,
          id v7 = objc_loadWeakRetained((id *)&self->_caContinuationCommitFuture),
          char v8 = [v7 _isFinished],
          v7,
          v6,
          (v8 & 1) != 0))
    {
      id v9 = [(UIViewPropertyAnimator *)self _viewAnimationState];
      [v9 _canonicalTrackedUnpacedFractionComplete];
      double v11 = v10;

      if (v11 > -1.0
        || ((double fractionComplete = self->_fractionComplete, fractionComplete >= 0.0)
          ? (BOOL v13 = fractionComplete > 1.0)
          : (BOOL v13 = 1),
            v13))
      {
        double fractionComplete = v11;
      }
      goto LABEL_15;
    }
  }
  else if (v3 != 4 && v3 != 2)
  {
    return result;
  }
  double fractionComplete = self->_fractionComplete;
LABEL_15:
  double result = 1.0;
  if (fractionComplete != 0.99999)
  {
    double result = 0.0;
    if (fractionComplete != 0.00001)
    {
      double result = 1.0;
      if (fractionComplete <= 1.0) {
        double result = fractionComplete;
      }
      if (fractionComplete < 0.0) {
        return 0.0;
      }
    }
  }
  return result;
}

- (void)setFractionComplete:(double)a3
{
  double v4 = 0.99999;
  if (a3 <= 0.99999) {
    double v4 = a3;
  }
  if (a3 >= 0.00001) {
    double v5 = v4;
  }
  else {
    double v5 = 0.00001;
  }
  if ([(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    if (v5 != self->_fractionComplete)
    {
      [(UIViewPropertyAnimator *)self willChangeValueForKey:@"fractionComplete"];
      self->_double fractionComplete = v5;
      [(UIViewPropertyAnimator *)self _updateAnimationsToFractionComplete:v5];
      [(UIViewPropertyAnimator *)self didChangeValueForKey:@"fractionComplete"];
    }
  }
  else if ([(UIViewPropertyAnimator *)self _animationState] == 3)
  {
    [(UIViewPropertyAnimator *)self startAnimationAsPaused:1];
    [(UIViewPropertyAnimator *)self setFractionComplete:v5];
  }
  else if ([(UIViewPropertyAnimator *)self _animationState] == 1)
  {
    [(UIViewPropertyAnimator *)self pauseAnimationTransiently];
    [(UIViewPropertyAnimator *)self setFractionComplete:v5];
    [(UIViewPropertyAnimator *)self _continueWithTimingParameters:0 duration:0.0];
  }
}

- (void)_updateAnimationsToFractionComplete:(double)a3
{
  if ([(UIViewPropertyAnimator *)self isReversed]) {
    a3 = 1.0 - a3;
  }
  double v5 = [(UIViewPropertyAnimator *)self _trackingIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__UIViewPropertyAnimator__updateAnimationsToFractionComplete___block_invoke;
  v6[3] = &unk_1E52DCA08;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  +[UIView modifyTrackedAnimations:removeOnCompletion:animationFactory:block:]((uint64_t)UIView, v5, 0, 0, v6);
}

uint64_t __62__UIViewPropertyAnimator__updateAnimationsToFractionComplete___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void **a7)
{
  id v11 = a4;
  float v12 = *a7;
  id v13 = a6;
  id v14 = a3;
  long long v15 = (void *)[v12 copy];
  [*(id *)(a1 + 32) _effectiveAdditiveOffsetForKey:v13 inLayer:v14];
  double v17 = v16;

  if (v17 <= 0.0)
  {
    double v28 = *(double *)(a1 + 40);
    int v29 = v15;
    goto LABEL_10;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v18 + 165) || !*(void *)(v18 + 96) || (double v19 = *(void **)(v18 + 104)) == 0)
  {
    double v30 = *(double *)(a1 + 40);
    double v23 = 0.0;
    if (v30 <= v17) {
      goto LABEL_12;
    }
    double v28 = (v30 - v17) / (1.0 - v17);
    int v29 = v11;
LABEL_10:
    [v29 duration];
    double v26 = v31;
    goto LABEL_11;
  }
  double v20 = *(double *)(a1 + 40);
  *(float *)&double v20 = v20;
  [v19 _solveForInput:v20];
  double v22 = computeInverseOfTimingFunction(*(void **)(*(void *)(a1 + 32) + 96), v21);
  double v23 = 0.0;
  if (v22 > v17)
  {
    double v24 = (v22 - v17) / (1.0 - v17);
    *(float *)&double v24 = v24;
    [*(id *)(*(void *)(a1 + 32) + 96) _solveForInput:v24];
    double v26 = v25;
    [v11 duration];
    double v28 = v27;
LABEL_11:
    double v23 = v26 * v28;
  }
LABEL_12:
  [v15 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v15 setTimeOffset:v23];
  id v32 = v15;
  *a7 = v32;

  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    -[UIViewPropertyAnimator _setKVOCompliantReversed:](self, "_setKVOCompliantReversed:", [v9 isReversed]);
    -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", [v9 isRunning]);
    uint64_t v11 = [v9 _animationState];
    if (v11) {
      [(UIViewPropertyAnimator *)self _setKVOCompliantState:v11];
    }
  }
}

void __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _viewAnimationState];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_5;
  v4[3] = &unk_1E52D9F70;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  +[UIView _performWithState:v2 trackingIdentifier:v3 duration:v4 delay:-1.0 animations:-1.0];
}

uint64_t __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runAnimations];
}

- (void)startAnimationAfterDelay:(double)a3
{
  if ([(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UIViewPropertyAnimator.m", 3589, @"A paused animator (%@) cannot be started with a delay!", self object file lineNumber description];
  }
  if (a3 < 0.0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The delay should be greater than or equal to zero."];
  }
  self->_double delay = a3;
  [(UIViewPropertyAnimator *)self startAnimation];
}

- (void)interactionProgressDidUpdate:(id)a3
{
  id v4 = a3;
  if ([(UIViewPropertyAnimator *)self _animationState] == 4)
  {
    [v4 percentComplete];
    -[UIViewPropertyAnimator setFractionComplete:](self, "setFractionComplete:");
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  BOOL v4 = a4;
  [a3 removeProgressObserver:self];
  [(UIViewPropertyAnimator *)self setReversed:!v4];
  [(UIViewPropertyAnimator *)self continueAnimation];
}

- (void)setInternalDuration:(double)a3
{
  self->_internalDuration = a3;
}

- (void)_setTrackingIdentifier:(id)a3
{
}

- (void)setPausesOnCompletion:(BOOL)pausesOnCompletion
{
  self->_pausesOnCompletion = pausesOnCompletion;
}

- (NSString)_name
{
  return self->_name;
}

- (void)set_name:(id)a3
{
}

- (id)timingParameters
{
  return self->_timingParameters;
}

- (void)setManualHitTestingEnabled:(BOOL)manualHitTestingEnabled
{
  self->_manualHitTestingEnabled = manualHitTestingEnabled;
}

- (BOOL)scrubsLinearly
{
  return self->_scrubsLinearly;
}

- (unint64_t)_options
{
  return self->_options;
}

- (BOOL)_isPausedOnCompletion
{
  return self->_pausedOnCompletion;
}

- (void)_setPausedOnCompletion:(BOOL)a3
{
  self->_pausedOnCompletion = a3;
}

- (void)setIntrospectable:(BOOL)a3
{
  self->_introspectable = a3;
}

@end