@interface _UIMotionEffectEngine
+ (BOOL)_motionEffectsEnabled;
+ (BOOL)_motionEffectsSupported;
+ (Class)_analyzerClass;
+ (Class)_eventProviderClass;
- (BOOL)_hasMotionEffectsForView:(id)a3;
- (BOOL)_isSuspended;
- (BOOL)_motionEffect:(id)a3 belongsToView:(id)a4;
- (BOOL)_motionEffectsAreSuspendedForView:(id)a3;
- (BOOL)_shouldGenerateUpdates;
- (NSArray)suspensionReasons;
- (NSString)debugDescription;
- (_UIMotionEffectEngine)init;
- (id)_motionEffectsForView:(id)a3;
- (int64_t)_targetInterfaceOrientation;
- (void)_applyEffectsFromAnalyzer:(id)a3;
- (void)_handleLatestDeviceMotion;
- (void)_setTargetInterfaceOrientation:(int64_t)a3;
- (void)_startGeneratingUpdates;
- (void)_startOrStopGeneratingUpdates;
- (void)_stopGeneratingUpdates;
- (void)_toggleSlowUpdates;
- (void)_unapplyAllEffects;
- (void)_unregisterAllMotionEffectsForView:(id)a3;
- (void)_unregisterMotionEffect:(id)a3 fromView:(id)a4;
- (void)_updateDisplayLinkInterval;
- (void)beginApplyingMotionEffect:(id)a3 toView:(id)a4;
- (void)beginSuspendingForReason:(id)a3;
- (void)beginSuspendingMotionEffectsForView:(id)a3;
- (void)dealloc;
- (void)endApplyingMotionEffect:(id)a3 toView:(id)a4;
- (void)endSuspendingForReason:(id)a3;
- (void)endSuspendingMotionEffectsForView:(id)a3;
- (void)resetMotionAnalysis;
- (void)updateEventProviderStatus:(int64_t)a3;
- (void)updateWithEvent:(id)a3;
@end

@implementation _UIMotionEffectEngine

- (void)_unregisterAllMotionEffectsForView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIAssociationTable *)self->_effectViewAssociationTable hasLeftValuesForRightValue:v4])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = -[_UIMotionEffectEngine _motionEffectsForView:](self, "_motionEffectsForView:", v4, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(_UIMotionEffectEngine *)self _unregisterMotionEffect:*(void *)(*((void *)&v10 + 1) + 8 * v9++) fromView:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  [(NSMapTable *)self->_suspendedViewsToEffectSets removeObjectForKey:v4];
}

- (void)endSuspendingForReason:(id)a3
{
  [(NSMutableSet *)self->_suspendReasons removeObject:a3];
  [(_UIMotionEffectEngine *)self _startOrStopGeneratingUpdates];
}

- (void)_handleLatestDeviceMotion
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (![(_UIMotionEffectEngine *)self _isSuspended])
  {
    os_unfair_lock_lock(&self->_pendingEventLock);
    BOOL hasReceivedAtLeastOneEventSinceStarting = self->_hasReceivedAtLeastOneEventSinceStarting;
    pendingEvent = self->_pendingEvent;
    v5 = pendingEvent;
    uint64_t v6 = self->_pendingEvent;
    self->_pendingEvent = 0;

    os_unfair_lock_unlock(&self->_pendingEventLock);
    if (!hasReceivedAtLeastOneEventSinceStarting)
    {
LABEL_53:

      return;
    }
    [(_UIMotionEffectEvent *)v5 timestamp];
    double v8 = v7;
    if (v5) {
      displayLink = (CADisplayLink *)v5;
    }
    else {
      displayLink = self->_displayLink;
    }
    [(CADisplayLink *)displayLink timestamp];
    double v11 = v10;
    lastEvent = self->_lastEvent;
    if (lastEvent)
    {
      [(_UIMotionEffectEvent *)lastEvent timestamp];
      double v14 = v11 - v13;
      uint64_t v15 = self->_lastEvent;
      if (v5) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v15 = 0;
      double v14 = 0.0;
      if (v5)
      {
LABEL_8:
        if (v15 && v14 != 0.0)
        {
          -[_UIMotionEffectEvent velocityRelativeToPreviousEvent:](v5, "velocityRelativeToPreviousEvent:");
          double v17 = v16;
          if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257760, @"UIMotionEffectSlowVelocityThreshhold"))
          {
            v18 = +[UIDevice currentDevice];
            uint64_t v19 = [v18 userInterfaceIdiom];

            double v20 = dbl_186B9B150[(v19 & 0xFFFFFFFFFFFFFFFBLL) == 1];
          }
          else
          {
            double v20 = *(double *)&qword_1EB257768;
          }
          if (self->_slowUpdatesEnabled)
          {
            if (v17 > v20) {
              [(_UIMotionEffectEngine *)self _toggleSlowUpdates];
            }
          }
          else if (v17 <= v20)
          {
            if (!self->_pendingSlowDown)
            {
              int v21 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257770, @"UIMotionEffectSlowVelocityRequiredTime");
              double v22 = *(double *)&qword_1EB257778;
              if (v21) {
                double v22 = 0.5;
              }
              [(_UIMotionEffectEngine *)self performSelector:sel__toggleSlowUpdates withObject:0 afterDelay:v22];
              self->_pendingSlowDown = 1;
            }
          }
          else if (self->_pendingSlowDown)
          {
            [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__toggleSlowUpdates object:0];
            self->_pendingSlowDown = 0;
          }
        }
        objc_storeStrong((id *)&self->_lastEvent, pendingEvent);
        goto LABEL_26;
      }
    }
    v5 = [(_UIMotionEffectEvent *)v15 copyWithTimestamp:v11];
LABEL_26:
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obj = self->_analyzersToEffects;
    uint64_t v23 = [(NSMapTable *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v47;
      int v26 = 1;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v29 = v5;
          [v28 updateWithEvent:v5];
          v30 = [v28 viewerRelativeDevicePose];
          [v30 viewerOffset];
          double v32 = v31;
          double v34 = v33;

          double v35 = fabs(v32);
          int v36 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257780, @"UIMotionEffectCenteredThreshold");
          double v37 = *(double *)&qword_1EB257788;
          if (v36) {
            double v37 = 0.03;
          }
          if (v35 >= v37)
          {
            BOOL v41 = 0;
          }
          else
          {
            double v38 = fabs(v34);
            int v39 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257780, @"UIMotionEffectCenteredThreshold");
            double v40 = *(double *)&qword_1EB257788;
            if (v39) {
              double v40 = 0.03;
            }
            BOOL v41 = v38 < v40;
          }
          char v45 = 0;
          char v42 = [v28 applyHysteresisWithReceivedEventTimestamp:self->_slowUpdatesEnabled timeSinceLastNewMotionEvent:&v45 slowUpdatesEnabled:0 returningShouldToggleSlowUpdates:v8 logger:v14];
          if (v45) {
            [(_UIMotionEffectEngine *)self _toggleSlowUpdates];
          }
          if (self->_isPendingReset) {
            char v43 = 1;
          }
          else {
            char v43 = v42;
          }
          if ((v43 & 1) == 0)
          {
            [MEMORY[0x1E4F39CF8] setLowLatency:0];
            [(_UIMotionEffectEngine *)self _applyEffectsFromAnalyzer:v28];
          }
          v26 &= v41;
          v5 = v29;
        }
        uint64_t v24 = [(NSMapTable *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v24);
    }
    else
    {
      int v26 = 1;
    }

    self->_hasAppliedAtLeastOneUpdateSinceStarting = 1;
    if (self->_isPendingReset)
    {
      [(_UIMotionEffectEngine *)self resetMotionAnalysis];
      self->_isPendingReset = 0;
    }
    if (self->_allAnalyzersAreCentered != v26)
    {
      self->_allAnalyzersAreCentered = v26;
      [(_UIMotionEffectEngine *)self _updateDisplayLinkInterval];
    }
    goto LABEL_53;
  }
}

- (void)updateWithEvent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    os_unfair_lock_lock(&self->_pendingEventLock);
    self->_BOOL hasReceivedAtLeastOneEventSinceStarting = 1;
    objc_storeStrong((id *)&self->_pendingEvent, a3);
    os_unfair_lock_unlock(&self->_pendingEventLock);
    if ([(_UIMotionEffectEventProvider *)self->_eventProvider wantsSynchronizedUpdates])
    {
      if ([MEMORY[0x1E4F29060] isMainThread] && _UIUpdateCycleEnabled())
      {
        [(_UIMotionEffectEngine *)self _handleLatestDeviceMotion];
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41___UIMotionEffectEngine_updateWithEvent___block_invoke;
        block[3] = &unk_1E52D9F70;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
}

- (void)beginSuspendingMotionEffectsForView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EB25B420 != -1) {
    dispatch_once(&qword_1EB25B420, &__block_literal_global_179_0);
  }
  if (_MergedGlobals_13_2)
  {
    id v5 = [(NSMapTable *)self->_suspendedViewsToEffectSets objectForKey:v4];

    if (!v5)
    {
      BOOL v6 = [(_UIMotionEffectEngine *)self _hasMotionEffectsForView:v4];
      double v7 = (void *)MEMORY[0x1E4F1CA80];
      if (v6)
      {
        double v8 = [(_UIMotionEffectEngine *)self _motionEffectsForView:v4];
        uint64_t v9 = [v7 setWithArray:v8];

        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              -[_UIMotionEffectEngine endApplyingMotionEffect:toView:](self, "endApplyingMotionEffect:toView:", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, (void)v15);
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v12);
        }
      }
      else
      {
        id v10 = [MEMORY[0x1E4F1CA80] set];
      }
      -[NSMapTable setObject:forKey:](self->_suspendedViewsToEffectSets, "setObject:forKey:", v10, v4, (void)v15);
    }
  }
}

- (BOOL)_hasMotionEffectsForView:(id)a3
{
  id v4 = a3;
  if ([(_UIAssociationTable *)self->_effectViewAssociationTable hasLeftValuesForRightValue:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = [(NSMapTable *)self->_suspendedViewsToEffectSets objectForKey:v4];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (void)endApplyingMotionEffect:(id)a3 toView:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6 && v7)
  {
    if ([(_UIMotionEffectEngine *)self _motionEffectsAreSuspendedForView:v7])
    {
      uint64_t v9 = [(NSMapTable *)self->_suspendedViewsToEffectSets objectForKey:v8];
      [v9 removeObject:v6];
    }
    else
    {
      [(_UIMotionEffectEngine *)self _unregisterMotionEffect:v6 fromView:v8];
      v11[0] = v8;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      +[_UIMotionEffectApplicator unapplyMotionEffect:v6 toViews:v10];
    }
  }
}

- (id)_motionEffectsForView:(id)a3
{
  id v4 = a3;
  if ([(_UIMotionEffectEngine *)self _motionEffectsAreSuspendedForView:v4])
  {
    BOOL v5 = [(NSMapTable *)self->_suspendedViewsToEffectSets objectForKey:v4];

    id v6 = [v5 allObjects];
    id v4 = v5;
  }
  else
  {
    id v6 = [(_UIAssociationTable *)self->_effectViewAssociationTable leftValuesForRightValue:v4];
  }

  return v6;
}

- (BOOL)_motionEffectsAreSuspendedForView:(id)a3
{
  v3 = [(NSMapTable *)self->_suspendedViewsToEffectSets objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_unregisterMotionEffect:(id)a3 fromView:(id)a4
{
  id v14 = a3;
  effectViewAssociationTable = self->_effectViewAssociationTable;
  id v7 = a4;
  [(_UIAssociationTable *)effectViewAssociationTable unregisterAssociationWithLeftValue:v14 rightValue:v7];
  double v8 = [v14 _preferredMotionAnalyzerSettings];
  uint64_t v9 = [(_UILazyMapTable *)self->_analyzerSettingsToAnalyzers objectForKey:v8];
  analyzerSettingsToAnalyzers = self->_analyzerSettingsToAnalyzers;
  uint64_t v11 = _lazyMapClientForEffectAndView(v14, v7);

  [(_UILazyMapTable *)analyzerSettingsToAnalyzers unregisterClient:v11 ofObjectForKey:v8];
  if (v9
    && ![(_UIAssociationTable *)self->_effectViewAssociationTable hasRightValuesForLeftValue:v14])
  {
    uint64_t v12 = [(NSMapTable *)self->_analyzersToEffects objectForKey:v9];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 removeObject:v14];
      if (![v13 count]) {
        [(NSMapTable *)self->_analyzersToEffects removeObjectForKey:v9];
      }
    }
  }
  [(_UIMotionEffectEngine *)self _startOrStopGeneratingUpdates];
}

- (void)_startOrStopGeneratingUpdates
{
  if ([(_UIMotionEffectEngine *)self _shouldGenerateUpdates])
  {
    if (!self->_generatingUpdates)
    {
      [(_UIMotionEffectEngine *)self _startGeneratingUpdates];
    }
  }
  else if (self->_generatingUpdates)
  {
    [(_UIMotionEffectEngine *)self _stopGeneratingUpdates];
  }
}

- (BOOL)_shouldGenerateUpdates
{
  int v3 = [(id)objc_opt_class() _motionEffectsEnabled];
  if (v3)
  {
    if ([(_UIMotionEffectEngine *)self _isSuspended]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(_UIAssociationTable *)self->_effectViewAssociationTable isEmpty];
    }
  }
  return v3;
}

- (BOOL)_isSuspended
{
  return [(NSMutableSet *)self->_suspendReasons count] != 0;
}

+ (BOOL)_motionEffectsEnabled
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB25B418 != -1) {
    dispatch_once(&qword_1EB25B418, &__block_literal_global_402);
  }
  uint64_t v2 = _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache;
  if (_UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache == -1)
  {
    if (_AXSReduceMotionEnabled())
    {
      uint64_t v2 = 0;
      _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = 0;
    }
    else if (os_variant_has_internal_diagnostics())
    {
      BOOL v4 = _UIKitUserDefaults();
      if (qword_1EB25B420 != -1) {
        dispatch_once(&qword_1EB25B420, &__block_literal_global_179_0);
      }
      if (_MergedGlobals_13_2)
      {
        uint64_t v9 = @"UIMotionEffectsEnabled";
        v10[0] = MEMORY[0x1E4F1CC38];
        BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
        [v4 registerDefaults:v5];

        _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = [v4 BOOLForKey:@"UIMotionEffectsEnabled"];
      }
      else
      {
        id v6 = [v4 objectForKey:@"UIMotionEffectsEnabled"];
        id v7 = v6;
        if (v6)
        {
          uint64_t v8 = [v6 BOOLValue];
        }
        else
        {
          if ([(id)UIApp _isSpringBoard])
          {
            [v4 setBool:0 forKey:@"UIMotionEffectsEnabled"];
            [v4 synchronize];
          }
          uint64_t v8 = 0;
        }
        _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = v8;
      }
      uint64_t v2 = _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache;
    }
    else
    {
      if (qword_1EB25B420 != -1) {
        dispatch_once(&qword_1EB25B420, &__block_literal_global_179_0);
      }
      uint64_t v2 = _MergedGlobals_13_2;
      _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = _MergedGlobals_13_2;
    }
  }
  return v2 == 1;
}

- (void)endSuspendingMotionEffectsForView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EB25B420 != -1) {
    dispatch_once(&qword_1EB25B420, &__block_literal_global_179_0);
  }
  if (_MergedGlobals_13_2)
  {
    BOOL v5 = [(NSMapTable *)self->_suspendedViewsToEffectSets objectForKey:v4];
    if (v5)
    {
      [(NSMapTable *)self->_suspendedViewsToEffectSets removeObjectForKey:v4];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            -[_UIMotionEffectEngine beginApplyingMotionEffect:toView:](self, "beginApplyingMotionEffect:toView:", *(void *)(*((void *)&v11 + 1) + 8 * i), v4, (void)v11);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)_stopGeneratingUpdates
{
  self->_generatingUpdates = 0;
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  eventProvider = self->_eventProvider;
  [(_UIMotionEffectEventProvider *)eventProvider stopGeneratingEvents];
}

- (void)beginApplyingMotionEffect:(id)a3 toView:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    if ([(_UIMotionEffectEngine *)self _motionEffectsAreSuspendedForView:v7])
    {
      uint64_t v9 = [(NSMapTable *)self->_suspendedViewsToEffectSets objectForKey:v8];
      [v9 addObject:v6];
    }
    else
    {
      [(_UIAssociationTable *)self->_effectViewAssociationTable registerAssociationWithLeftValue:v6 rightValue:v8];
      id v10 = [v6 _preferredMotionAnalyzerSettings];
      analyzerSettingsToAnalyzers = self->_analyzerSettingsToAnalyzers;
      uint64_t v12 = _lazyMapClientForEffectAndView(v6, v8);
      [(_UILazyMapTable *)analyzerSettingsToAnalyzers registerClient:v12 ofObjectForKey:v10];

      LOBYTE(v12) = [(_UILazyMapTable *)self->_analyzerSettingsToAnalyzers hasCachedObjectForKey:v10];
      long long v13 = [(_UILazyMapTable *)self->_analyzerSettingsToAnalyzers objectForKey:v10];
      if ((v12 & 1) == 0)
      {
        long long v14 = [(_UIMotionEffectEventProvider *)self->_eventProvider currentEvent];
        if (v14) {
          [v13 updateWithEvent:v14];
        }
        self->_allAnalyzersAreCentered = 0;
        [(_UIMotionEffectEngine *)self _updateDisplayLinkInterval];
      }
      v18[0] = v8;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      uint64_t v16 = [v13 viewerRelativeDevicePose];
      +[_UIMotionEffectApplicator applyMotionEffect:v6 toViews:v15 usingPose:v16 transformedForTargetInterfaceOrientation:self->_targetInterfaceOrientation];

      long long v17 = [(NSMapTable *)self->_analyzersToEffects objectForKey:v13];
      if (!v17)
      {
        long long v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        [(NSMapTable *)self->_analyzersToEffects setObject:v17 forKey:v13];
      }
      [v17 addObject:v6];
      [(_UIMotionEffectEngine *)self _startOrStopGeneratingUpdates];
    }
  }
}

- (BOOL)_motionEffect:(id)a3 belongsToView:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  id v6 = a3;
  id v7 = [(_UIMotionEffectEngine *)self _motionEffectsForView:a4];
  LOBYTE(self) = [v7 containsObject:v6];

  return (char)self;
}

- (void)_updateDisplayLinkInterval
{
  if ([(_UIMotionEffectEventProvider *)self->_eventProvider wantsSynchronizedUpdates]) {
    return;
  }
  [(CADisplayLink *)self->_displayLink maximumRefreshRate];
  uint64_t v4 = llround(1.0 / v3);
  if ((_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_916, @"UIMotionEffectUIUpdateFrequency") & 1) != 0|| (uint64_t v5 = (uint64_t)*(double *)&qword_1EB257748, (uint64_t)*(double *)&qword_1EB257748 <= 0))
  {
    id v6 = +[UIDevice currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    uint64_t v8 = 32;
    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v8 = 48;
    }
    uint64_t v9 = 30;
    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v9 = 45;
    }
    if (v4 <= 60) {
      uint64_t v5 = v9;
    }
    else {
      uint64_t v5 = v8;
    }
  }
  if (self->_allAnalyzersAreCentered)
  {
    if (self->_eventProviderStatus != 2)
    {
      uint64_t v13 = 1;
      goto LABEL_23;
    }
    if (self->_slowUpdatesEnabled)
    {
      int v10 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257750, @"UIMotionEffectUIUpdateSlowFrequency");
      uint64_t v11 = (uint64_t)*(double *)&qword_1EB257758;
      if (v10) {
        uint64_t v11 = 0;
      }
      uint64_t v12 = 5;
      if (v4 > 60) {
        uint64_t v12 = 8;
      }
      if (v11 >= 1) {
        uint64_t v5 = v11;
      }
      else {
        uint64_t v5 = v12;
      }
    }
  }
  [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:v5];
  uint64_t v13 = 0;
LABEL_23:
  displayLink = self->_displayLink;
  [(CADisplayLink *)displayLink setPaused:v13];
}

- (void)beginSuspendingForReason:(id)a3
{
  [(NSMutableSet *)self->_suspendReasons addObject:a3];
  [(_UIMotionEffectEngine *)self _startOrStopGeneratingUpdates];
}

- (void)_setTargetInterfaceOrientation:(int64_t)a3
{
  self->_targetInterfaceOrientation = a3;
}

+ (Class)_analyzerClass
{
  return (Class)objc_opt_class();
}

- (void)_startGeneratingUpdates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(_UIMotionEffectEventProvider *)self->_eventProvider startGeneratingEvents];
  if (![(_UIMotionEffectEventProvider *)self->_eventProvider wantsSynchronizedUpdates])
  {
    double v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__handleLatestDeviceMotion];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    [(_UIMotionEffectEngine *)self _updateDisplayLinkInterval];
    uint64_t v5 = self->_displayLink;
    id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_analyzersToEffects;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "resetHysteresis", (void)v15);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMapTable *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  self->_BOOL hasReceivedAtLeastOneEventSinceStarting = 0;
  self->_hasAppliedAtLeastOneUpdateSinceStarting = 0;
  *(_WORD *)&self->_slowUpdatesEnabled = 0;
  self->_generatingUpdates = 1;
  BOOL v12 = [(_UIMotionEffectEventProvider *)self->_eventProvider wantsSynchronizedUpdates];
  int64_t v13 = 2;
  if (v12) {
    int64_t v13 = 0;
  }
  self->_eventProviderStatus = v13;
  lastEvent = self->_lastEvent;
  self->_lastEvent = 0;
}

- (void)resetMotionAnalysis
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(_UILazyMapTable *)self->_analyzerSettingsToAnalyzers cachedObjectEnumerable];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 reset];
        [(_UIMotionEffectEngine *)self _applyEffectsFromAnalyzer:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  if (!self->_generatingUpdates || !self->_hasAppliedAtLeastOneUpdateSinceStarting) {
    self->_isPendingReset = 1;
  }
}

- (void)_applyEffectsFromAnalyzer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 updateHistory];
  uint64_t v5 = [v4 viewerRelativeDevicePose];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = -[NSMapTable objectForKey:](self->_analyzersToEffects, "objectForKey:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v12 = [(_UIAssociationTable *)self->_effectViewAssociationTable rightValueEnumerableForLeftValue:v11];
        +[_UIMotionEffectApplicator applyMotionEffect:v11 toViews:v12 usingPose:v5 transformedForTargetInterfaceOrientation:self->_targetInterfaceOrientation];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

+ (BOOL)_motionEffectsSupported
{
  if (qword_1EB25B420 != -1) {
    dispatch_once(&qword_1EB25B420, &__block_literal_global_179_0);
  }
  return _MergedGlobals_13_2;
}

- (void)updateEventProviderStatus:(int64_t)a3
{
  if (self->_eventProviderStatus != a3)
  {
    self->_eventProviderStatus = a3;
    [(_UIMotionEffectEngine *)self _updateDisplayLinkInterval];
  }
}

- (NSArray)suspensionReasons
{
  return (NSArray *)[(NSMutableSet *)self->_suspendReasons allObjects];
}

- (_UIMotionEffectEngine)init
{
  v33.receiver = self;
  v33.super_class = (Class)_UIMotionEffectEngine;
  uint64_t v2 = [(_UIMotionEffectEngine *)&v33 init];
  if (v2)
  {
    double v3 = (_UIMotionEffectEventProvider *)objc_alloc_init((Class)[(id)objc_opt_class() _eventProviderClass]);
    eventProvider = v2->_eventProvider;
    v2->_eventProvider = v3;

    [(_UIMotionEffectEventProvider *)v2->_eventProvider setConsumer:v2];
    uint64_t v5 = [[_UIAssociationTable alloc] initWithLeftValueOptions:512 rightValueOptions:256];
    effectViewAssociationTable = v2->_effectViewAssociationTable;
    v2->_effectViewAssociationTable = v5;

    uint64_t v7 = [_UILazyMapTable alloc];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __29___UIMotionEffectEngine_init__block_invoke;
    v31[3] = &unk_1E52FEF60;
    uint64_t v8 = v2;
    double v32 = v8;
    uint64_t v9 = [(_UILazyMapTable *)v7 initWithMappingBlock:v31];
    analyzerSettingsToAnalyzers = v8->_analyzerSettingsToAnalyzers;
    v8->_analyzerSettingsToAnalyzers = (_UILazyMapTable *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:1];
    analyzersToEffects = v8->_analyzersToEffects;
    v8->_analyzersToEffects = (NSMapTable *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:0];
    suspendedViewsToEffectSets = v8->_suspendedViewsToEffectSets;
    v8->_suspendedViewsToEffectSets = (NSMapTable *)v13;

    long long v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    suspendReasons = v8->_suspendReasons;
    v8->_suspendReasons = v15;

    v8->_targetInterfaceOrientation = 1;
    long long v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v8 selector:sel__startOrStopGeneratingUpdates name:@"_UIMotionEffectEngineEnabledDidChangeNotification" object:0];

    objc_initWeak(&location, v8);
    uint64_t v18 = (const char *)*MEMORY[0x1E4F14918];
    uint64_t v19 = MEMORY[0x1E4F14428];
    id v20 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29___UIMotionEffectEngine_init__block_invoke_2;
    handler[3] = &unk_1E52EAC08;
    objc_copyWeak(&v29, &location);
    notify_register_dispatch(v18, &v8->_thermalNotificationToken, v19, handler);

    int v21 = dispatch_get_global_queue(33, 0);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __29___UIMotionEffectEngine_init__block_invoke_4;
    v25[3] = &unk_1E52FEF90;
    double v22 = v8;
    int v26 = v22;
    objc_copyWeak(&v27, &location);
    notify_register_dispatch("com.apple.backboardd.backlight.changed", &v8->_screenDimmingNotificationToken, v21, v25);

    uint64_t v23 = v22;
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (Class)_eventProviderClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  [(_UIMotionEffectEngine *)self _stopGeneratingUpdates];
  [(_UIMotionEffectEngine *)self _unapplyAllEffects];
  [(_UIMotionEffectEventProvider *)self->_eventProvider setConsumer:0];
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityReduceMotionStatusDidChangeNotification" object:0];

  notify_cancel(self->_thermalNotificationToken);
  notify_cancel(self->_screenDimmingNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)_UIMotionEffectEngine;
  [(_UIMotionEffectEngine *)&v4 dealloc];
}

- (void)_toggleSlowUpdates
{
  if (self->_generatingUpdates)
  {
    self->_pendingSlowDown = 0;
    BOOL v3 = !self->_slowUpdatesEnabled;
    self->_slowUpdatesEnabled ^= 1u;
    [(_UIMotionEffectEventProvider *)self->_eventProvider setSlowUpdatesEnabled:v3];
    [(_UIMotionEffectEngine *)self _updateDisplayLinkInterval];
  }
}

- (void)_unapplyAllEffects
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(_UIAssociationTable *)self->_effectViewAssociationTable leftValueEnumerable];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = [(_UIAssociationTable *)self->_effectViewAssociationTable rightValueEnumerableForLeftValue:v8];
        +[_UIMotionEffectApplicator unapplyMotionEffect:v8 toViews:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL generatingUpdates = self->_generatingUpdates;
  suspendReasons = self->_suspendReasons;
  uint64_t v8 = [(_UILazyMapTable *)self->_analyzerSettingsToAnalyzers cachedObjects];
  effectViewAssociationTable = self->_effectViewAssociationTable;
  long long v10 = [(NSMapTable *)self->_suspendedViewsToEffectSets keyEnumerator];
  long long v11 = [v10 allObjects];
  long long v12 = [v3 stringWithFormat:@"<%@: %p isGeneratingUpdates=%d suspensionReasons=%@ analyzers=%@ effects=%@ suspendedViews=%@>", v5, self, generatingUpdates, suspendReasons, v8, effectViewAssociationTable, v11];

  return (NSString *)v12;
}

- (int64_t)_targetInterfaceOrientation
{
  return self->_targetInterfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_suspendReasons, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_pendingEvent, 0);
  objc_storeStrong((id *)&self->_eventProvider, 0);
  objc_storeStrong((id *)&self->_suspendedViewsToEffectSets, 0);
  objc_storeStrong((id *)&self->_analyzersToEffects, 0);
  objc_storeStrong((id *)&self->_analyzerSettingsToAnalyzers, 0);
  objc_storeStrong((id *)&self->_effectViewAssociationTable, 0);
}

@end