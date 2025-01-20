@interface VUINowPlayingFeatureMonitor
- (BOOL)_hasActiveFeaturesInArray:(id)a3;
- (BOOL)_hasAnyActiveFeature;
- (BOOL)_isElapsedTimeWithinFeatureTimeWindow:(id)a3;
- (BOOL)_isHybridFeature:(id)a3;
- (BOOL)_isTVAdvisoryFeature:(id)a3;
- (BOOL)_isTimeBoundFeature:(id)a3;
- (BOOL)_isTimerFeatureExpired:(id)a3;
- (BOOL)_isTimerTriggeredFeature:(id)a3;
- (BOOL)_isUserTriggeredFeature:(id)a3;
- (BOOL)_shouldActivateTimeBoundFeatureInitially:(id)a3;
- (BOOL)_shouldAnimateFeature:(id)a3;
- (BOOL)mediaPlaybackManager:(id)a3 shouldEnableUIModeImplicitly:(int64_t)a4;
- (BOOL)observingElapsedTime;
- (NSArray)allFeatures;
- (NSMapTable)featureBoundaryInfos;
- (NSMapTable)featureDependencies;
- (NSMapTable)featureTimers;
- (NSMapTable)featureTokens;
- (NSMutableArray)elapsedTimes;
- (NSMutableArray)enabledUIModes;
- (NSMutableDictionary)boundaryTimeObserverInfos;
- (NSMutableSet)features;
- (TVPAVFPlayback)player;
- (VUINowPlayingFeature)featureLastRequestedUI;
- (VUINowPlayingFeatureMonitor)init;
- (VUINowPlayingFeatureMonitorDelegate)delegate;
- (VUITransitionalPlaybackUIManager)playbackManager;
- (double)lastProcessedElapsedTime;
- (id)_activeFeature;
- (id)_activeFeatures;
- (id)_observerInfoForFeature:(id)a3 matchingTime:(double)a4;
- (id)_timeBoundFeatures;
- (id)activeFeatureForType:(unint64_t)a3;
- (id)elapsedTimeObserverToken;
- (id)featuresForType:(unint64_t)a3;
- (void)_activateFeature:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_activateFeature:(id)a3 ignoringCurrentActivation:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_addObservedToken:(id)a3 forFeature:(id)a4;
- (void)_addTimeObservingForFeature:(id)a3 withStartTime:(double)a4 andHandler:(id)a5;
- (void)_addTimeObservingForFeature:(id)a3 withStartTime:(double)a4 andRestartTime:(double)a5 andHandler:(id)a6;
- (void)_cancelTimerForFeature:(id)a3;
- (void)_cleanUpEverything;
- (void)_cleanupFeature:(id)a3;
- (void)_createBoundaryObserverForFeature:(id)a3 time:(double)a4 andHandler:(id)a5;
- (void)_deactivateFeature:(id)a3 animated:(BOOL)a4;
- (void)_expireTimerFeaturesIfNeeded;
- (void)_playbackStateChangedNottificaiton:(id)a3;
- (void)_processAnyTimeBoundFeatures;
- (void)_processElapsedTime:(double)a3;
- (void)_processFeature:(id)a3;
- (void)_processLastElapsedTime;
- (void)_processTimeBoundFeature:(id)a3;
- (void)_processTimerTriggeredFeature:(id)a3;
- (void)_processUserTriggeredFeature:(id)a3 activate:(BOOL)a4 animated:(BOOL)a5;
- (void)_registerPlaybackStateChangeNotification;
- (void)_removeAllObservedTokensForFeature:(id)a3;
- (void)_removeTimeObservingForFeature:(id)a3 withStartTime:(double)a4;
- (void)_scheduleDeactivationOfTimeBoundFeature:(id)a3;
- (void)_setupTimerFeatureExpiration;
- (void)_startObservingElapsedTime;
- (void)_unregisterPlaybackStateNotification;
- (void)_updateBoundaryObserverForFeature:(id)a3 change:(id)a4;
- (void)addFeature:(id)a3;
- (void)addFeature:(id)a3 withDependencyToPreferredFeatures:(id)a4;
- (void)deactivateFeature:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)enableUIMode:(int64_t)a3 enabled:(BOOL)a4;
- (void)mediaPlaybackManager:(id)a3 shouldHideUI:(BOOL)a4 animated:(BOOL)a5 animations:(id)a6 completion:(id)a7;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeFeature:(id)a3;
- (void)removeFeaturesMatching:(id)a3;
- (void)setBoundaryTimeObserverInfos:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElapsedTimeObserverToken:(id)a3;
- (void)setElapsedTimes:(id)a3;
- (void)setEnabledUIModes:(id)a3;
- (void)setFeatureBoundaryInfos:(id)a3;
- (void)setFeatureDependencies:(id)a3;
- (void)setFeatureLastRequestedUI:(id)a3;
- (void)setFeatureTimers:(id)a3;
- (void)setFeatureTokens:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setLastProcessedElapsedTime:(double)a3;
- (void)setObservingElapsedTime:(BOOL)a3;
- (void)setPlaybackManager:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation VUINowPlayingFeatureMonitor

- (VUINowPlayingFeatureMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)VUINowPlayingFeatureMonitor;
  v2 = [(VUINowPlayingFeatureMonitor *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_observingElapsedTime = 0;
    uint64_t v4 = objc_opt_new();
    features = v3->_features;
    v3->_features = (NSMutableSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    featureDependencies = v3->_featureDependencies;
    v3->_featureDependencies = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    featureBoundaryInfos = v3->_featureBoundaryInfos;
    v3->_featureBoundaryInfos = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    featureTokens = v3->_featureTokens;
    v3->_featureTokens = (NSMapTable *)v10;

    uint64_t v12 = objc_opt_new();
    elapsedTimes = v3->_elapsedTimes;
    v3->_elapsedTimes = (NSMutableArray *)v12;

    uint64_t v14 = [&unk_1F3F3E1E0 mutableCopy];
    enabledUIModes = v3->_enabledUIModes;
    v3->_enabledUIModes = (NSMutableArray *)v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v3 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v3 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
  }
  return v3;
}

- (void)dealloc
{
  [(VUINowPlayingFeatureMonitor *)self _cleanUpEverything];
  v3.receiver = self;
  v3.super_class = (Class)VUINowPlayingFeatureMonitor;
  [(VUINowPlayingFeatureMonitor *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToFeatureDidChangeState = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToActiveFeatureChangedFrom = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setPlayer:(id)a3
{
  v5 = (TVPAVFPlayback *)a3;
  player = self->_player;
  if (player != v5)
  {
    v7 = v5;
    if (player) {
      [(VUINowPlayingFeatureMonitor *)self _unregisterPlaybackStateNotification];
    }
    objc_storeStrong((id *)&self->_player, a3);
    [(VUINowPlayingFeatureMonitor *)self _processAnyTimeBoundFeatures];
    v5 = v7;
    if (v7)
    {
      [(VUINowPlayingFeatureMonitor *)self _registerPlaybackStateChangeNotification];
      v5 = v7;
    }
  }
}

- (void)setPlaybackManager:(id)a3
{
  v5 = (VUITransitionalPlaybackUIManager *)a3;
  if (self->_playbackManager != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_playbackManager, a3);
    [(VUITransitionalPlaybackUIManager *)self->_playbackManager setDelegate:self];
    v5 = v6;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if ((void *)__FeatureStartTimeContext == a6)
  {
    [(VUINowPlayingFeatureMonitor *)self _updateBoundaryObserverForFeature:v11 change:v12];
  }
  else if ((void *)__FeatureRestartTimeContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
    [v14 doubleValue];
    if (v15 == -9999.0)
    {
      [v14 doubleValue];
      -[VUINowPlayingFeatureMonitor _removeTimeObservingForFeature:withStartTime:](self, "_removeTimeObservingForFeature:withStartTime:", v11);
    }
    else
    {
      [(VUINowPlayingFeatureMonitor *)self _updateBoundaryObserverForFeature:v11 change:v13];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VUINowPlayingFeatureMonitor;
    [(VUINowPlayingFeatureMonitor *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (NSArray)allFeatures
{
  v2 = [(VUINowPlayingFeatureMonitor *)self features];
  objc_super v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)addFeature:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(VUINowPlayingFeatureMonitor *)self features];
    char v6 = [v5 containsObject:v4];

    if ((v6 & 1) == 0)
    {
      v7 = [(VUINowPlayingFeatureMonitor *)self features];
      [v7 addObject:v4];

      [(VUINowPlayingFeatureMonitor *)self _processFeature:v4];
      uint64_t v8 = VUIDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Feature [%@] added.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)addFeature:(id)a3 withDependencyToPreferredFeatures:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(VUINowPlayingFeatureMonitor *)self features];
    char v9 = [v8 containsObject:v6];

    if ((v9 & 1) == 0)
    {
      id v10 = [(VUINowPlayingFeatureMonitor *)self features];
      [v10 addObject:v6];

      if ([v7 count])
      {
        uint64_t v11 = [(VUINowPlayingFeatureMonitor *)self featureDependencies];
        [v11 setObject:v7 forKey:v6];
      }
      [(VUINowPlayingFeatureMonitor *)self _processFeature:v6];
      id v12 = VUIDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Feature [%@] added.", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (id)featuresForType:(unint64_t)a3
{
  id v4 = [(VUINowPlayingFeatureMonitor *)self features];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__VUINowPlayingFeatureMonitor_featuresForType___block_invoke;
  v8[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v8[4] = a3;
  v5 = [v4 objectsPassingTest:v8];
  id v6 = [v5 allObjects];

  return v6;
}

BOOL __47__VUINowPlayingFeatureMonitor_featuresForType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F3F796D0]) {
    BOOL v4 = [v3 type] == *(void *)(a1 + 32);
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)activeFeatureForType:(unint64_t)a3
{
  BOOL v4 = [(VUINowPlayingFeatureMonitor *)self features];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__VUINowPlayingFeatureMonitor_activeFeatureForType___block_invoke;
  v8[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v8[4] = a3;
  v5 = [v4 objectsPassingTest:v8];
  id v6 = [v5 anyObject];

  return v6;
}

uint64_t __52__VUINowPlayingFeatureMonitor_activeFeatureForType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 conformsToProtocol:&unk_1F3F796D0]
    && [v5 type] == *(void *)(a1 + 32)
    && [v5 isActive])
  {
    uint64_t v6 = 1;
    *a3 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)removeFeature:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 isActive])
    {
      [v5 setAutoRemove:1];
      uint64_t v6 = [(VUINowPlayingFeatureMonitor *)self featureLastRequestedUI];
      id v7 = (void *)v6;
      if (v6 && (void *)v6 == v5)
      {
        if ([v5 type] != 2)
        {
          uint64_t v8 = [(VUINowPlayingFeatureMonitor *)self playbackManager];
          [v8 onSupplementaryUIShouldDismiss];
        }
      }
      else
      {
        [(VUINowPlayingFeatureMonitor *)self _deactivateFeature:v5 animated:[(VUINowPlayingFeatureMonitor *)self _shouldAnimateFeature:v5]];
      }
    }
    else
    {
      [(VUINowPlayingFeatureMonitor *)self _cleanupFeature:v5];
      char v9 = [(VUINowPlayingFeatureMonitor *)self features];
      [v9 removeObject:v5];

      id v10 = VUIDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Feature [%@] removed.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_cleanupFeature:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(VUINowPlayingFeatureMonitor *)self _cancelTimerForFeature:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(VUINowPlayingFeatureMonitor *)self _isTimerFeatureExpired:v4];
      uint64_t v6 = VUIDefaultLogObject();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          int v10 = 138412290;
          id v11 = v4;
          _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: since timer feature: %@ has already expired, so not removing it.", (uint8_t *)&v10, 0xCu);
        }
      }
      else
      {
        if (v7)
        {
          int v10 = 138412290;
          id v11 = v4;
          _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: timer feature: %@ has not expired, removing it.", (uint8_t *)&v10, 0xCu);
        }

        uint64_t v6 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
        [v6 removeObjectForKey:v4];
      }
    }
    [(VUINowPlayingFeatureMonitor *)self _removeAllObservedTokensForFeature:v4];
    id v8 = [(VUINowPlayingFeatureMonitor *)self features];
    if (![v8 containsObject:v4]
      || ![(VUINowPlayingFeatureMonitor *)self _isTimeBoundFeature:v4])
    {
      goto LABEL_15;
    }
    int v9 = [v4 conformsToProtocol:&unk_1F3F3F5E8];

    if (v9)
    {
      id v8 = v4;
      [v8 removeObserver:self forKeyPath:@"startTime"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 removeObserver:self forKeyPath:@"restartTime"];
      }
LABEL_15:
    }
  }
}

- (void)removeFeaturesMatching:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v16 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = -[VUINowPlayingFeatureMonitor featuresForType:](self, "featuresForType:", [*(id *)(*((void *)&v21 + 1) + 8 * v9) unsignedIntegerValue]);
          if ([v10 count])
          {
            long long v19 = 0u;
            long long v20 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
            id v11 = v10;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v18;
              do
              {
                uint64_t v15 = 0;
                do
                {
                  if (*(void *)v18 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  [(VUINowPlayingFeatureMonitor *)self removeFeature:*(void *)(*((void *)&v17 + 1) + 8 * v15++)];
                }
                while (v13 != v15);
                uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
              }
              while (v13);
            }
          }
          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    id v4 = v16;
  }
}

- (void)enableUIMode:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(VUINowPlayingFeatureMonitor *)self enabledUIModes];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  int v9 = [v7 containsObject:v8];

  if (v4)
  {
    if (v9) {
      return;
    }
    id v11 = [(VUINowPlayingFeatureMonitor *)self enabledUIModes];
    int v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    [v11 addObject:v10];
  }
  else
  {
    if (!v9) {
      return;
    }
    id v11 = [(VUINowPlayingFeatureMonitor *)self enabledUIModes];
    int v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    [v11 removeObject:v10];
  }
}

- (void)deactivateFeature:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v12 = v6;
    int v8 = [v6 isActive];
    uint64_t v7 = v12;
    if (v8)
    {
      uint64_t v9 = [(VUINowPlayingFeatureMonitor *)self featureLastRequestedUI];
      int v10 = (void *)v9;
      if (v9 && (id)v9 == v12)
      {
        id v11 = [(VUINowPlayingFeatureMonitor *)self playbackManager];
        [v11 onSupplementaryUIShouldDismiss];
      }
      else
      {
        [(VUINowPlayingFeatureMonitor *)self _deactivateFeature:v12 animated:v4];
      }

      uint64_t v7 = v12;
    }
  }
}

- (void)mediaPlaybackManager:(id)a3 shouldHideUI:(BOOL)a4 animated:(BOOL)a5 animations:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v20 = a3;
  id v12 = (void (**)(void))a6;
  uint64_t v13 = (void (**)(id, uint64_t))a7;
  uint64_t v14 = [(VUINowPlayingFeatureMonitor *)self featureLastRequestedUI];
  uint64_t v15 = v14;
  if (!v14)
  {
    if ([v20 currentUIMode])
    {
      long long v17 = [(VUINowPlayingFeatureMonitor *)self featuresForType:2];
      long long v18 = [v17 firstObject];

      if (![v18 conformsToProtocol:&unk_1F3F79730])
      {
        id v16 = 0;
LABEL_9:

        if (!v16) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      id v19 = v18;
      long long v18 = v19;
    }
    else
    {
      long long v18 = [(VUINowPlayingFeatureMonitor *)self featuresForType:1];
      id v19 = [v18 firstObject];
    }
    id v16 = v19;
    goto LABEL_9;
  }
  id v16 = v14;
LABEL_10:
  if ([(VUINowPlayingFeatureMonitor *)self _isHybridFeature:v16]
    && ![v16 activationType])
  {
    [v16 setActivationType:1];
  }
  [(VUINowPlayingFeatureMonitor *)self _processUserTriggeredFeature:v16 activate:!v10 animated:v9];
LABEL_14:
  if (v12) {
    v12[2](v12);
  }
  if (v13) {
    v13[2](v13, 1);
  }
}

- (BOOL)mediaPlaybackManager:(id)a3 shouldEnableUIModeImplicitly:(int64_t)a4
{
  id v5 = [(VUINowPlayingFeatureMonitor *)self enabledUIModes];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (void)_playbackStateChangedNottificaiton:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v7 = [v4 objectForKey:*MEMORY[0x1E4FAA3C8]];

  id v5 = [MEMORY[0x1E4FA9D88] playing];
  if (v7 == v5)
  {
    BOOL v6 = [(VUINowPlayingFeatureMonitor *)self observingElapsedTime];

    if (!v6)
    {
      [(VUINowPlayingFeatureMonitor *)self setObservingElapsedTime:1];
      [(VUINowPlayingFeatureMonitor *)self _startObservingElapsedTime];
    }
  }
  else
  {
  }
}

- (id)_activeFeatures
{
  v2 = [(VUINowPlayingFeatureMonitor *)self features];
  id v3 = [v2 objectsPassingTest:&__block_literal_global_31];

  return v3;
}

uint64_t __46__VUINowPlayingFeatureMonitor__activeFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F3F796D0]) {
    uint64_t v3 = [v2 isActive];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_timeBoundFeatures
{
  id v2 = [(VUINowPlayingFeatureMonitor *)self features];
  uint64_t v3 = [v2 objectsPassingTest:&__block_literal_global_147];

  return v3;
}

uint64_t __49__VUINowPlayingFeatureMonitor__timeBoundFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F3F797F8];
}

- (id)_activeFeature
{
  id v2 = [(VUINowPlayingFeatureMonitor *)self features];
  uint64_t v3 = [v2 objectsPassingTest:&__block_literal_global_161];
  BOOL v4 = [v3 anyObject];

  return v4;
}

uint64_t __45__VUINowPlayingFeatureMonitor__activeFeature__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  if ([v4 conformsToProtocol:&unk_1F3F796D0]
    && [v4 isActive])
  {
    uint64_t v5 = 1;
    *a3 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_hasAnyActiveFeature
{
  id v2 = [(VUINowPlayingFeatureMonitor *)self _activeFeatures];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_hasActiveFeaturesInArray:(id)a3
{
  return [a3 indexOfObjectPassingTest:&__block_literal_global_164] != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __57__VUINowPlayingFeatureMonitor__hasActiveFeaturesInArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  if ([v5 conformsToProtocol:&unk_1F3F796D0]
    && [v5 isActive])
  {
    uint64_t v6 = 1;
    *a4 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_processFeature:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    if ([(VUINowPlayingFeatureMonitor *)self _isTimeBoundFeature:v4])
    {
      if ([v7 conformsToProtocol:&unk_1F3F3F5E8])
      {
        id v5 = v7;
        [v5 addObserver:self forKeyPath:@"startTime" options:3 context:__FeatureStartTimeContext];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 addObserver:self forKeyPath:@"restartTime" options:3 context:__FeatureRestartTimeContext];
        }
      }
      [(VUINowPlayingFeatureMonitor *)self _processTimeBoundFeature:v7];
    }
    else
    {
      BOOL v6 = [(VUINowPlayingFeatureMonitor *)self _isTimerTriggeredFeature:v7];
      id v4 = v7;
      if (!v6) {
        goto LABEL_11;
      }
      [(VUINowPlayingFeatureMonitor *)self _processTimerTriggeredFeature:v7];
    }
    id v4 = v7;
  }
LABEL_11:
}

- (BOOL)_isTimeBoundFeature:(id)a3
{
  return [a3 conformsToProtocol:&unk_1F3F797F8];
}

- (BOOL)_isUserTriggeredFeature:(id)a3
{
  return [a3 conformsToProtocol:&unk_1F3F79730];
}

- (BOOL)_isHybridFeature:(id)a3
{
  return [a3 conformsToProtocol:&unk_1F3F79928];
}

- (BOOL)_isTVAdvisoryFeature:(id)a3
{
  return [a3 conformsToProtocol:&unk_1F3F799D8];
}

- (BOOL)_isTimerTriggeredFeature:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F3F796D0])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldAnimateFeature:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VUINowPlayingFeatureMonitor *)self _isUserTriggeredFeature:v4]
    || [v4 type] == 2
    || [v4 type] == 1
    || [v4 type] == 9
    || [v4 type] == 7;

  return v5;
}

- (void)_activateFeature:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)_activateFeature:(id)a3 ignoringCurrentActivation:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = (void (**)(void, void))v11;
  if (!v10)
  {
    uint64_t v13 = 0;
    if (!v11) {
      goto LABEL_8;
    }
LABEL_7:
    v12[2](v12, v13);
    goto LABEL_8;
  }
  if ([v10 isActive] && !a4)
  {
    uint64_t v13 = [(VUINowPlayingFeatureMonitor *)self _isTVAdvisoryFeature:v10] ^ 1;
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v14 = VUIDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v10;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Feature [%@] activated.", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v15 = [(VUINowPlayingFeatureMonitor *)self delegate];
  id v16 = [(VUINowPlayingFeatureMonitor *)self _activeFeature];
  if ([v16 conformsToProtocol:&unk_1F3F79730]
    && [v10 conformsToProtocol:&unk_1F3F79730])
  {
    if (v16 != v10)
    {
      [v16 setActive:0];
      [v10 setActive:1];
      if (self->_delegateFlags.respondsToActiveFeatureChangedFrom) {
        [v15 featureMonitor:self activeFeatureDidChangeFrom:v16 toFeature:v10 animated:v7];
      }
    }
  }
  else
  {
    [v10 setActive:1];
    if (self->_delegateFlags.respondsToFeatureDidChangeState) {
      [v15 featureMonitor:self featureDidChangeState:v10 animated:v7];
    }
  }

  uint64_t v13 = 1;
  if (v12) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_deactivateFeature:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = v6;
  if (v6 && [v6 isActive])
  {
    int v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Feature [%@] deactivated.", (uint8_t *)&v18, 0xCu);
    }

    [v7 setActive:0];
    uint64_t v9 = [(VUINowPlayingFeatureMonitor *)self featureLastRequestedUI];
    id v10 = (void *)v9;
    if (v9 && (void *)v9 == v7) {
      [(VUINowPlayingFeatureMonitor *)self setFeatureLastRequestedUI:0];
    }
    if (self->_delegateFlags.respondsToFeatureDidChangeState)
    {
      id v11 = [(VUINowPlayingFeatureMonitor *)self delegate];
      [v11 featureMonitor:self featureDidChangeState:v7 animated:v4];
    }
    if ([(VUINowPlayingFeatureMonitor *)self _isTimeBoundFeature:v7])
    {
      id v12 = v7;
      [v12 startTime];
      double v14 = v13;
      [v12 duration];
      [(VUINowPlayingFeatureMonitor *)self _removeTimeObservingForFeature:v12 withStartTime:v14 + v15];
    }
    if ([v7 shouldAutoRemove])
    {
      [(VUINowPlayingFeatureMonitor *)self _cleanupFeature:v7];
      id v16 = [(VUINowPlayingFeatureMonitor *)self features];
      [v16 removeObject:v7];

      int v17 = VUIDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        uint64_t v19 = v7;
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Feature [%@] removed.", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (void)_registerPlaybackStateChangeNotification
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4FAA3C0];
  BOOL v4 = [(VUINowPlayingFeatureMonitor *)self player];
  [v5 addObserver:self selector:sel__playbackStateChangedNottificaiton_ name:v3 object:v4];
}

- (void)_unregisterPlaybackStateNotification
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4FAA3C0];
  BOOL v4 = [(VUINowPlayingFeatureMonitor *)self player];
  [v5 removeObserver:self name:v3 object:v4];
}

- (BOOL)_isElapsedTimeWithinFeatureTimeWindow:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([(VUINowPlayingFeatureMonitor *)self player],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = [(VUINowPlayingFeatureMonitor *)self player];
    [v6 elapsedTime];
    double v8 = v7;

    if ([(VUINowPlayingFeatureMonitor *)self _isTVAdvisoryFeature:v4])
    {
      uint64_t v9 = [v4 advisoryDisabledTimeRanges];
      if ([v9 count])
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "containsTime:", v8, (void)v21))
              {
                int v15 = 0;
                goto LABEL_17;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        int v15 = 1;
LABEL_17:
      }
      else
      {
        int v15 = 1;
      }
    }
    else
    {
      [v4 startTime];
      double v18 = v17;
      [v4 duration];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FA9DB0]) initWithStartTime:v18 endTime:v18 + v19];
      int v15 = [v9 containsTime:v8];
    }

    BOOL v16 = v15 != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_startObservingElapsedTime
{
  uint64_t v3 = [(VUINowPlayingFeatureMonitor *)self player];

  if (v3)
  {
    objc_initWeak(&location, self);
    id v4 = [(VUINowPlayingFeatureMonitor *)self player];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __57__VUINowPlayingFeatureMonitor__startObservingElapsedTime__block_invoke;
    uint64_t v12 = &unk_1E6DF5BF8;
    objc_copyWeak(&v13, &location);
    id v5 = [v4 addElapsedTimeObserver:&v9];

    id v6 = [(VUINowPlayingFeatureMonitor *)self elapsedTimeObserverToken];

    if (v6)
    {
      double v7 = [(VUINowPlayingFeatureMonitor *)self player];
      double v8 = [(VUINowPlayingFeatureMonitor *)self elapsedTimeObserverToken];
      [v7 removeElapsedTimeObserverWithToken:v8];

      [(VUINowPlayingFeatureMonitor *)self setElapsedTimeObserverToken:0];
    }
    if (v5) {
      [(VUINowPlayingFeatureMonitor *)self setElapsedTimeObserverToken:v5];
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __57__VUINowPlayingFeatureMonitor__startObservingElapsedTime__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processElapsedTime:a2];
}

- (void)_processElapsedTime:(double)a3
{
  [(VUINowPlayingFeatureMonitor *)self lastProcessedElapsedTime];
  if (v5 != a3)
  {
    [(VUINowPlayingFeatureMonitor *)self setLastProcessedElapsedTime:a3];
    id v6 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
    double v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [v6 addObject:v7];

    double v8 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      [(VUINowPlayingFeatureMonitor *)self _processLastElapsedTime];
    }
  }
}

- (void)_processLastElapsedTime
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
    id v6 = [v5 lastObject];

    if (v6)
    {
      double v7 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
      uint64_t v8 = [v7 count] - 1;

      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v8);
      if ([v9 count])
      {
        uint64_t v10 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
        [v10 removeObjectsAtIndexes:v9];
      }
      [v6 doubleValue];
      double v12 = v11;
      id v13 = [(VUINowPlayingFeatureMonitor *)self _timeBoundFeatures];
      if ([v13 count])
      {
        v51 = v9;
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v50 = v13;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v62 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v58 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              if ([v20 type] == 7 && objc_msgSend(v20, "isActive")) {
                [v14 insertObject:v20 atIndex:0];
              }
              else {
                [v14 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v62 count:16];
          }
          while (v17);
        }
        v52 = v6;

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v21 = v14;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v54 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v53 + 1) + 8 * j);
              [v26 startTime];
              double v28 = v27;
              [v26 duration];
              if (v29 == -9999.0)
              {
                double v31 = 0.0;
              }
              else
              {
                [v26 duration];
                double v31 = v30;
              }
              objc_opt_class();
              double v32 = -9999.0;
              if (objc_opt_isKindOfClass())
              {
                [v26 restartTime];
                double v32 = v33;
              }
              double v34 = v28 + v31;
              BOOL v35 = [(VUINowPlayingFeatureMonitor *)self _isTVAdvisoryFeature:v26];
              if (v35)
              {
                if (v12 < v28) {
                  goto LABEL_42;
                }
                BOOL v36 = 0;
                double v37 = v28;
              }
              else if (v12 >= v28 && v12 < v34)
              {
                if (v12 < v28) {
                  goto LABEL_42;
                }
                BOOL v39 = v32 != -9999.0;
                BOOL v40 = v12 >= v32;
                BOOL v36 = v40 && v39;
                if (v40 && v39) {
                  double v37 = v32;
                }
                else {
                  double v37 = v28;
                }
              }
              else
              {
                BOOL v36 = 0;
                double v37 = v34;
              }
              v41 = [(VUINowPlayingFeatureMonitor *)self _observerInfoForFeature:v26 matchingTime:v37];
              if (v41)
              {
                v42 = v41;
                if (([v41 notifiedOfEntry] & 1) == 0)
                {
                  [v42 setNotifiedOfEntry:!v35];
                  v43 = [v42 handler];
                  ((void (**)(void, BOOL))v43)[2](v43, v36);
                }
                goto LABEL_55;
              }
LABEL_42:
              if (v12 >= v28 && v12 < v34)
              {
                v42 = 0;
              }
              else
              {
                v45 = [(VUINowPlayingFeatureMonitor *)self _observerInfoForFeature:v26 matchingTime:v28];
                v46 = v45;
                if (v45 && [v45 notifiedOfEntry]) {
                  [v46 setNotifiedOfEntry:0];
                }
                if (v32 == -9999.0)
                {
                  v42 = v46;
                }
                else
                {
                  v42 = [(VUINowPlayingFeatureMonitor *)self _observerInfoForFeature:v26 matchingTime:v32];

                  if (v42 && [v42 notifiedOfEntry]) {
                    [v42 setNotifiedOfEntry:0];
                  }
                }
              }
LABEL_55:
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v61 count:16];
          }
          while (v23);
        }

        uint64_t v9 = v51;
        id v6 = v52;
        id v13 = v50;
      }
      v47 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
      [v47 removeObjectAtIndex:0];

      v48 = [(VUINowPlayingFeatureMonitor *)self elapsedTimes];
      uint64_t v49 = [v48 count];

      if (v49) {
        [(VUINowPlayingFeatureMonitor *)self _processLastElapsedTime];
      }
    }
  }
}

- (void)_processTimeBoundFeature:(id)a3
{
  id v4 = a3;
  double v5 = [(VUINowPlayingFeatureMonitor *)self player];

  if (v4 && v5)
  {
    objc_initWeak(&location, self);
    [v4 startTime];
    double v7 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 restartTime];
      double v9 = v8;
    }
    else
    {
      double v9 = -9999.0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke;
    v10[3] = &unk_1E6DF5C48;
    id v11 = v4;
    objc_copyWeak(&v12, &location);
    [(VUINowPlayingFeatureMonitor *)self _addTimeObservingForFeature:v11 withStartTime:v10 andRestartTime:v7 andHandler:v9];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke(uint64_t a1, char a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Boundary time observer triggered for feature activation - %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v7 = [WeakRetained _shouldAnimateFeature:*(void *)(a1 + 32)];
  int v8 = [WeakRetained _isElapsedTimeWithinFeatureTimeWindow:*(void *)(a1 + 32)];
  double v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = VUIBoolLogString();
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Is elapsed time within feature time window - %@", buf, 0xCu);
  }
  if (v8)
  {
    id v11 = [WeakRetained featureDependencies];
    id v12 = [v11 objectForKey:*(void *)(a1 + 32)];

    id v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v12;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Dependent preferred features: [%@]", buf, 0xCu);
    }

    if ([v12 count] && (objc_msgSend(WeakRetained, "_hasActiveFeaturesInArray:", v12) & 1) != 0)
    {
      id v14 = VUIDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Not activating this feature since there's a preferred feature already active.", buf, 2u);
      }
    }
    else
    {
      if ([WeakRetained _isHybridFeature:*(void *)(a1 + 32)]) {
        [*(id *)(a1 + 32) setActivationType:2];
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_183;
      aBlock[3] = &unk_1E6DF5C20;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      id v17 = *(id *)(a1 + 32);
      char v19 = a2;
      char v20 = v7;
      id v15 = (void (**)(void))_Block_copy(aBlock);
      [WeakRetained _needsUIForFeature:*(void *)(a1 + 32)];
      v15[2](v15);

      objc_destroyWeak(&v18);
    }
  }
}

void __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_183(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_2;
  v6[3] = &unk_1E6DF4F18;
  v6[4] = WeakRetained;
  id v7 = v3;
  [WeakRetained _activateFeature:v7 ignoringCurrentActivation:v4 animated:v5 completion:v6];
}

uint64_t __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _scheduleDeactivationOfTimeBoundFeature:*(void *)(result + 40)];
  }
  return result;
}

- (BOOL)_shouldActivateTimeBoundFeatureInitially:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 type] == 4
    || [v3 type] == 5
    || [v3 type] == 6
    || [v3 type] == 9;

  return v4;
}

- (void)_scheduleDeactivationOfTimeBoundFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 startTime];
    double v7 = v6;
    [v5 duration];
    double v9 = v8;
    objc_initWeak(&location, self);
    BOOL v10 = [(VUINowPlayingFeatureMonitor *)self _shouldAnimateFeature:v5];
    if ([(VUINowPlayingFeatureMonitor *)self _isTVAdvisoryFeature:v5])
    {
      id v11 = (void *)MEMORY[0x1E4F1CB00];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke;
      v22[3] = &unk_1E6DF5C70;
      id v12 = &v24;
      objc_copyWeak(&v24, &location);
      id v13 = v5;
      id v23 = v13;
      BOOL v25 = v10;
      id v14 = [v11 scheduledTimerWithTimeInterval:0 repeats:v22 block:v9];
      id v15 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
      uint64_t v16 = [v15 objectForKey:v13];

      [v16 setOneTimeTimer:v14];
      id v17 = &v23;
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke_188;
      v18[3] = &unk_1E6DF5C98;
      id v12 = &v20;
      objc_copyWeak(&v20, &location);
      id v19 = v5;
      BOOL v21 = v10;
      [(VUINowPlayingFeatureMonitor *)self _addTimeObservingForFeature:v19 withStartTime:v18 andRestartTime:v7 + v9 andHandler:-9999.0];
      id v17 = &v19;
    }

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: TV advisory deactivation timer fired.", v4, 2u);
  }

  [WeakRetained deactivateFeature:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

void __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke_188(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Boundary time observer triggered for feature deactivation - %@", (uint8_t *)&v5, 0xCu);
  }

  [WeakRetained deactivateFeature:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_processAnyTimeBoundFeatures
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(VUINowPlayingFeatureMonitor *)self features];
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
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if ([(VUINowPlayingFeatureMonitor *)self _isTimeBoundFeature:v8]) {
          [(VUINowPlayingFeatureMonitor *)self _processTimeBoundFeature:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_observerInfoForFeature:(id)a3 matchingTime:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(VUINowPlayingFeatureMonitor *)self featureTokens];
    uint64_t v8 = [v7 objectForKey:v6];

    if ([v8 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
          id v15 = [(VUINowPlayingFeatureMonitor *)self featureBoundaryInfos];
          uint64_t v16 = [v15 objectForKey:v14];

          [v16 time];
          if (v17 == a4) {
            break;
          }

          if (v11 == ++v13)
          {
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)_addTimeObservingForFeature:(id)a3 withStartTime:(double)a4 andHandler:(id)a5
{
}

- (void)_addTimeObservingForFeature:(id)a3 withStartTime:(double)a4 andRestartTime:(double)a5 andHandler:(id)a6
{
  id v11 = a3;
  id v10 = a6;
  if (v11)
  {
    if (v10)
    {
      if (a4 != -9999.0)
      {
        [(VUINowPlayingFeatureMonitor *)self _createBoundaryObserverForFeature:v11 time:v10 andHandler:a4];
        if (a5 != -9999.0) {
          [(VUINowPlayingFeatureMonitor *)self _createBoundaryObserverForFeature:v11 time:v10 andHandler:a5];
        }
      }
    }
  }
}

- (void)_createBoundaryObserverForFeature:(id)a3 time:(double)a4 andHandler:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [(VUINowPlayingFeatureMonitor *)self _observerInfoForFeature:v12 matchingTime:a4];
  if (!v9)
  {
    id v9 = objc_opt_new();
    [v9 setTime:a4];
    [v9 setHandler:v8];
    id v10 = [MEMORY[0x1E4F29128] UUID];
    [v9 setToken:v10];
    id v11 = [(VUINowPlayingFeatureMonitor *)self featureBoundaryInfos];
    [v11 setObject:v9 forKey:v10];

    [(VUINowPlayingFeatureMonitor *)self _addObservedToken:v10 forFeature:v12];
  }
}

- (void)_updateBoundaryObserverForFeature:(id)a3 change:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v13 = v6;
    uint64_t v7 = *MEMORY[0x1E4F284E0];
    id v8 = a4;
    id v9 = [v8 objectForKey:v7];
    id v10 = [v8 objectForKey:*MEMORY[0x1E4F284C8]];

    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11 && ([v9 isEqual:v10] & 1) == 0)
    {
      [v9 doubleValue];
      id v12 = -[VUINowPlayingFeatureMonitor _observerInfoForFeature:matchingTime:](self, "_observerInfoForFeature:matchingTime:", v13);
      if (v12)
      {
        [v10 doubleValue];
        objc_msgSend(v12, "setTime:");
      }
    }
    id v6 = v13;
  }
}

- (void)_removeTimeObservingForFeature:(id)a3 withStartTime:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6 && a4 != -9999.0)
  {
    uint64_t v7 = [(VUINowPlayingFeatureMonitor *)self featureTokens];
    id v8 = [v7 objectForKey:v6];

    if ([v8 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            id v15 = [(VUINowPlayingFeatureMonitor *)self featureBoundaryInfos];
            uint64_t v16 = [v15 objectForKey:v14];

            [v16 time];
            if (v17 == a4)
            {
              id v18 = [(VUINowPlayingFeatureMonitor *)self featureBoundaryInfos];
              [v18 removeObjectForKey:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)_addObservedToken:(id)a3 forFeature:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(VUINowPlayingFeatureMonitor *)self featureTokens];
    uint64_t v10 = [v9 objectForKey:v8];

    uint64_t v11 = [v10 count];
    uint64_t v12 = [(VUINowPlayingFeatureMonitor *)self featureTokens];
    if (v11)
    {
      id v13 = (void *)[v10 mutableCopy];
      uint64_t v14 = [v13 arrayByAddingObject:v6];
      [v12 setObject:v14 forKey:v8];
    }
    else
    {
      v15[0] = v6;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v12 setObject:v13 forKey:v8];
    }
  }
}

- (void)_removeAllObservedTokensForFeature:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(VUINowPlayingFeatureMonitor *)self featureTokens];
    id v6 = [v5 objectForKey:v4];

    if ([v6 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
            uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
            id v13 = [(VUINowPlayingFeatureMonitor *)self featureBoundaryInfos];
            [v13 removeObjectForKey:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }

      uint64_t v14 = [(VUINowPlayingFeatureMonitor *)self featureTokens];
      [v14 removeObjectForKey:v4];
    }
  }
}

- (void)_processUserTriggeredFeature:(id)a3 activate:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6)
    {
      if (([v8 isActive] & 1) == 0)
      {
        objc_initWeak(&location, self);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __78__VUINowPlayingFeatureMonitor__processUserTriggeredFeature_activate_animated___block_invoke;
        v10[3] = &unk_1E6DF5778;
        objc_copyWeak(&v12, &location);
        id v11 = v9;
        [(VUINowPlayingFeatureMonitor *)self _activateFeature:v11 animated:v5 completion:v10];

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      [(VUINowPlayingFeatureMonitor *)self _deactivateFeature:v8 animated:v5];
    }
  }
}

void __78__VUINowPlayingFeatureMonitor__processUserTriggeredFeature_activate_animated___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained _isTimeBoundFeature:*(void *)(a1 + 32)];
  if (a2 && v4) {
    [WeakRetained _scheduleDeactivationOfTimeBoundFeature:*(void *)(a1 + 32)];
  }
}

- (void)_processTimerTriggeredFeature:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 duration];
    double v6 = v5;
    uint64_t v7 = [v4 repeats];
    if (v6 > 0.0)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [(VUINowPlayingFeatureMonitor *)self featureTimers];

      if (!v9)
      {
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:1];
        [(VUINowPlayingFeatureMonitor *)self setFeatureTimers:v10];
      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      id v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        double v26 = v6;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Scheduling a timer with interval:<%f> for feature: %@", buf, 0x16u);
      }

      id v12 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      long long v19 = __61__VUINowPlayingFeatureMonitor__processTimerTriggeredFeature___block_invoke;
      uint64_t v20 = &unk_1E6DF5CC0;
      objc_copyWeak(&v21, &from);
      objc_copyWeak(&v22, &location);
      id v13 = [v12 scheduledTimerWithTimeInterval:v8 repeats:&v17 block:v6];
      uint64_t v14 = objc_opt_new();
      objc_msgSend(v14, "setRepeatingTimer:", v13, v17, v18, v19, v20);
      long long v15 = [MEMORY[0x1E4F1C9C8] date];
      [v14 setStartDate:v15];

      long long v16 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
      [v16 setObject:v14 forKey:v4];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __61__VUINowPlayingFeatureMonitor__processTimerTriggeredFeature___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v3 featureTimers];
  double v5 = [v4 objectForKey:WeakRetained];

  double v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setStartDate:v6];

  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = WeakRetained;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Will activate timer triggered feature: %@", (uint8_t *)&v8, 0xCu);
  }

  [v3 _activateFeature:WeakRetained animated:1 completion:0];
}

- (void)_cancelTimerForFeature:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
    id v8 = [v5 objectForKey:v4];

    if (v8)
    {
      double v6 = [v8 repeatingTimer];
      [v6 invalidate];

      uint64_t v7 = [v8 oneTimeTimer];
      [v7 invalidate];
    }
  }
}

- (BOOL)_isTimerFeatureExpired:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  double v5 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
  double v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 backgroundedDate];
  id v8 = [v6 startDate];
  id v9 = v8;
  if (v7)
  {
    [v7 timeIntervalSinceDate:v8];
    double v11 = v10;

    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:v7];
    double v14 = v13;

    double v15 = v11 + v14;
LABEL_7:
    [v4 duration];
    LOBYTE(v9) = v15 >= v19;
    goto LABEL_8;
  }

  if (v9)
  {
    long long v16 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v17 = [v6 startDate];
    [v16 timeIntervalSinceDate:v17];
    double v15 = v18;

    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  uint64_t v20 = VUIDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = VUIBoolLogString();
    int v23 = 138412546;
    id v24 = v4;
    __int16 v25 = 2112;
    double v26 = v21;
    _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: timerFeature: %@ hasExpired:<%@>", (uint8_t *)&v23, 0x16u);
  }
  return (char)v9;
}

- (void)_setupTimerFeatureExpiration
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
    double v6 = [v5 keyEnumerator];

    uint64_t v7 = [v6 nextObject];
    if (v7)
    {
      id v9 = (void *)v7;
      *(void *)&long long v8 = 138412546;
      long long v22 = v8;
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          double v11 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
          id v12 = [v11 objectForKey:v10];

          double v13 = [MEMORY[0x1E4F1C9C8] date];
          [v12 setBackgroundedDate:v13];

          if (([v10 isBackgroundTimer] & 1) == 0)
          {
            [v10 duration];
            double v15 = v14;
            long long v16 = [MEMORY[0x1E4F1C9C8] date];
            uint64_t v17 = [v12 startDate];
            [v16 timeIntervalSinceDate:v17];
            double v19 = v18;

            uint64_t v20 = VUIDefaultLogObject();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              id v24 = v10;
              __int16 v25 = 2048;
              double v26 = v15 - v19;
              _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: cancelling timer for feature: %@, timeRemaining:<%f>", buf, 0x16u);
            }

            [(VUINowPlayingFeatureMonitor *)self _cancelTimerForFeature:v10];
          }
        }
        uint64_t v21 = objc_msgSend(v6, "nextObject", v22);

        id v9 = (void *)v21;
      }
      while (v21);
    }
  }
}

- (void)_expireTimerFeaturesIfNeeded
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
    *(_DWORD *)buf = 134217984;
    uint64_t v43 = [v4 count];
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: Will expire feature timers, count:<%lu>", buf, 0xCu);
  }
  double v5 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
    long long v8 = [v7 keyEnumerator];

    id v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    id v10 = [v8 nextObject];
    if (v10)
    {
      do
      {
        double v11 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
        id v12 = [v11 objectForKey:v10];

        [v9 setObject:v12 forKey:v10];
        uint64_t v13 = [v8 nextObject];

        id v10 = (void *)v13;
      }
      while (v13);
    }
    double v14 = [v9 keyEnumerator];

    double v15 = [v14 nextObject];
    if (v15)
    {
      *(void *)&long long v16 = 138412546;
      long long v35 = v16;
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v15;
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke;
          aBlock[3] = &unk_1E6DF5CE8;
          objc_copyWeak(&v40, &location);
          id v18 = v17;
          id v39 = v18;
          double v19 = (void (**)(void *, void))_Block_copy(aBlock);
          uint64_t v20 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
          uint64_t v21 = [v20 objectForKey:v18];

          if ([(VUINowPlayingFeatureMonitor *)self _isTimerFeatureExpired:v18])
          {
            long long v22 = VUIDefaultLogObject();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = (uint64_t)v18;
              _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: activating feature after application entered foreground: %@", buf, 0xCu);
            }

            v19[2](v19, 0);
          }
          else if ([v18 isBackgroundTimer])
          {
            int v23 = VUIDefaultLogObject();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = (uint64_t)v18;
              _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: background timer feature %@ did not expire while in background. Cancelling feature now that it is in the foreground", buf, 0xCu);
            }

            [(VUINowPlayingFeatureMonitor *)self _cancelTimerForFeature:v18];
          }
          else
          {
            id v24 = [v21 backgroundedDate];
            __int16 v25 = [v21 startDate];
            [v24 timeIntervalSinceDate:v25];
            double v27 = v26;

            [v18 duration];
            double v29 = v28;
            double v30 = VUIDefaultLogObject();
            double v31 = v29 - v27;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v35;
              uint64_t v43 = (uint64_t)v18;
              __int16 v44 = 2048;
              double v45 = v31;
              _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "VUINowPlayingFeatureMonitor:: timer feature %@ has not expired yet after entering to foreground. creating a one time timer with interval: %f", buf, 0x16u);
            }

            double v32 = (void *)MEMORY[0x1E4F1CB00];
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke_194;
            v36[3] = &unk_1E6DF5D10;
            double v37 = v19;
            double v33 = [v32 scheduledTimerWithTimeInterval:0 repeats:v36 block:v31];
            [v21 setOneTimeTimer:v33];
          }
          objc_msgSend(v21, "setBackgroundedDate:", 0, v35);

          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);
        }
        uint64_t v34 = objc_msgSend(v14, "nextObject", v35);

        double v15 = (void *)v34;
      }
      while (v34);
    }
  }
}

void __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _activateFeature:*(void *)(a1 + 32) animated:1 completion:0];
  id v2 = [WeakRetained featureTimers];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 32) repeats]) {
    [WeakRetained _processTimerTriggeredFeature:*(void *)(a1 + 32)];
  }
}

uint64_t __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke_194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cleanUpEverything
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(VUINowPlayingFeatureMonitor *)self _unregisterPlaybackStateNotification];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(VUINowPlayingFeatureMonitor *)self features];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(VUINowPlayingFeatureMonitor *)self _cleanupFeature:*(void *)(*((void *)&v11 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = [(VUINowPlayingFeatureMonitor *)self featureTimers];
  [v9 removeAllObjects];

  [(VUINowPlayingFeatureMonitor *)self setFeatureTimers:0];
  id v10 = [(VUINowPlayingFeatureMonitor *)self features];
  [v10 removeAllObjects];
}

- (VUINowPlayingFeatureMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUINowPlayingFeatureMonitorDelegate *)WeakRetained;
}

- (TVPAVFPlayback)player
{
  return self->_player;
}

- (VUITransitionalPlaybackUIManager)playbackManager
{
  return self->_playbackManager;
}

- (NSMutableSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (NSMapTable)featureDependencies
{
  return self->_featureDependencies;
}

- (void)setFeatureDependencies:(id)a3
{
}

- (NSMapTable)featureTokens
{
  return self->_featureTokens;
}

- (void)setFeatureTokens:(id)a3
{
}

- (NSMapTable)featureBoundaryInfos
{
  return self->_featureBoundaryInfos;
}

- (void)setFeatureBoundaryInfos:(id)a3
{
}

- (NSMapTable)featureTimers
{
  return self->_featureTimers;
}

- (void)setFeatureTimers:(id)a3
{
}

- (VUINowPlayingFeature)featureLastRequestedUI
{
  return self->_featureLastRequestedUI;
}

- (void)setFeatureLastRequestedUI:(id)a3
{
}

- (NSMutableArray)enabledUIModes
{
  return self->_enabledUIModes;
}

- (void)setEnabledUIModes:(id)a3
{
}

- (BOOL)observingElapsedTime
{
  return self->_observingElapsedTime;
}

- (void)setObservingElapsedTime:(BOOL)a3
{
  self->_observingElapsedTime = a3;
}

- (double)lastProcessedElapsedTime
{
  return self->_lastProcessedElapsedTime;
}

- (void)setLastProcessedElapsedTime:(double)a3
{
  self->_lastProcessedElapsedTime = a3;
}

- (NSMutableDictionary)boundaryTimeObserverInfos
{
  return self->_boundaryTimeObserverInfos;
}

- (void)setBoundaryTimeObserverInfos:(id)a3
{
}

- (id)elapsedTimeObserverToken
{
  return self->_elapsedTimeObserverToken;
}

- (void)setElapsedTimeObserverToken:(id)a3
{
}

- (NSMutableArray)elapsedTimes
{
  return self->_elapsedTimes;
}

- (void)setElapsedTimes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elapsedTimes, 0);
  objc_storeStrong(&self->_elapsedTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_boundaryTimeObserverInfos, 0);
  objc_storeStrong((id *)&self->_enabledUIModes, 0);
  objc_storeStrong((id *)&self->_featureLastRequestedUI, 0);
  objc_storeStrong((id *)&self->_featureTimers, 0);
  objc_storeStrong((id *)&self->_featureBoundaryInfos, 0);
  objc_storeStrong((id *)&self->_featureTokens, 0);
  objc_storeStrong((id *)&self->_featureDependencies, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end