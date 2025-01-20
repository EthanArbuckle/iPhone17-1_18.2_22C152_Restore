@interface SBMainStatusBarStateProvider
+ (id)sharedInstance;
- (BOOL)_shouldPostForVisitedItem:(int)a3 withUpdates:(BOOL)a4 toAggregatorData:(id *)a5 lastPost:(id *)a6;
- (BOOL)contentAssertionsWantTimeEnabledAnimated:(BOOL *)a3 duration:(double *)a4;
- (BOOL)isTimeEnabled;
- (NSHashTable)contentAssertions;
- (SBMainStatusBarStateProvider)init;
- (id)_identifierForStateAggregator:(id)a3;
- (void)_composePostDataFromAggregatorData:(id *)a3;
- (void)_enableTime:(BOOL)a3 crossfade:(BOOL)a4 crossfadeDuration:(double)a5 immediately:(BOOL)a6;
- (void)_updateDisabledItems;
- (void)acquireContentAssertion:(id)a3;
- (void)dealloc;
- (void)disableDataUpdateAnimationsForRequestor:(id)a3;
- (void)disableStatusBarItem:(int)a3 requestor:(id)a4;
- (void)enableStatusBarItem:(int)a3 requestor:(id)a4;
- (void)enableTime:(BOOL)a3;
- (void)enableTime:(BOOL)a3 crossfade:(BOOL)a4 crossfadeDuration:(double)a5;
- (void)forceUpdateLocalStatusBarData;
- (void)relinquishContentAssertion:(id)a3;
- (void)setAllItemsExceptBatteryCloaked:(BOOL)a3;
- (void)setContentAssertions:(id)a3;
- (void)setTelephonyAndBluetoothItemsCloaked:(BOOL)a3;
- (void)setTimeCloaked:(BOOL)a3;
- (void)statusBarStateAggregatorDidRequestImmediateUpdates:(id)a3;
- (void)statusBarStateAggregatorDidStopRequestingImmediateUpdates:(id)a3;
- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5;
- (void)stopDisablingDataUpdateAnimationsForRequestor:(id)a3;
- (void)updateTimeEnabled;
- (void)updateTimeEnabledImmediately:(BOOL)a3;
@end

@implementation SBMainStatusBarStateProvider

- (BOOL)_shouldPostForVisitedItem:(int)a3 withUpdates:(BOOL)a4 toAggregatorData:(id *)a5 lastPost:(id *)a6
{
  if (a3)
  {
    if (a3 == 32)
    {
      int killActivity = self->_killActivity;
      if ((*((unsigned char *)a5 + 2272) & 4) != 0)
      {
        int v12 = 0;
        self->_int killActivity = 0;
      }
      else
      {
        v10 = +[SBLockScreenManager sharedInstance];
        if ([v10 isUILocked])
        {
          v11 = [(id)SBApp userSessionController];
          self->_int killActivity = [v11 isLoginSession] ^ 1;
        }
        else
        {
          self->_int killActivity = 0;
        }

        int v12 = self->_killActivity;
      }
      if (killActivity != v12) {
        a4 = 1;
      }
    }
  }
  else if (self->_statusBarTimeRequiresUpdate)
  {
    self->_statusBarTimeRequiresUpdate = 0;
    a4 = 1;
  }
  BOOL v13 = self->_itemIsDisabled[a3];
  if (v13 != self->_itemWasDisabled[a3])
  {
    self->_itemWasDisabled[a3] = v13;
    return 1;
  }
  return a4;
}

- (void)_composePostDataFromAggregatorData:(id *)a3
{
  if (self->_killActivity) {
    a3->var0[32] = 0;
  }
  uint64_t v3 = 0;
  a3->var0[0] = self->_timeEnabled;
  do
  {
    if (self->_itemIsDisabled[v3]) {
      a3->var0[v3] = 0;
    }
    ++v3;
  }
  while (v3 != 46);
}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([(NSCountedSet *)self->_dataUpdateAnimationsDisabledRequests count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__SBMainStatusBarStateProvider_statusBarStateProvider_didPostStatusBarData_withActions___block_invoke;
    v8[3] = &__block_descriptor_44_e5_v8__0l;
    v8[4] = a4;
    int v9 = v5;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F42E40];
    [v7 postStatusBarData:a4 withActions:v5];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_54 != -1) {
    dispatch_once(&sharedInstance_onceToken_54, &__block_literal_global_385);
  }
  v2 = (void *)sharedInstance___sharedInstance_27;
  return v2;
}

uint64_t __46__SBMainStatusBarStateProvider_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBMainStatusBarStateProvider);
  v1 = (void *)sharedInstance___sharedInstance_27;
  sharedInstance___sharedInstance_27 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBMainStatusBarStateProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainStatusBarStateProvider;
  v2 = [(SBStatusBarStateProvider *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_timeEnabled = 1;
    [(SBStatusBarStateProvider *)v2 addStatusBarStateObserver:v2];
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    contentAssertions = v3->_contentAssertions;
    v3->_contentAssertions = (NSHashTable *)v4;
  }
  return v3;
}

- (void)acquireContentAssertion:(id)a3
{
  [(NSHashTable *)self->_contentAssertions addObject:a3];
  [(SBMainStatusBarStateProvider *)self updateTimeEnabled];
}

- (void)relinquishContentAssertion:(id)a3
{
  [(NSHashTable *)self->_contentAssertions removeObject:a3];
  [(SBMainStatusBarStateProvider *)self updateTimeEnabled];
}

- (BOOL)contentAssertionsWantTimeEnabledAnimated:(BOOL *)a3 duration:(double *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self->_contentAssertions;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "dateAndTimeVisible", (void)v15) & 1) == 0)
        {
          *a3 = [v11 animated];
          [v11 duration];
          BOOL v12 = 0;
          *(void *)a4 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  [(SBStatusBarStateProvider *)self removeStatusBarStateObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBMainStatusBarStateProvider;
  [(SBStatusBarStateProvider *)&v3 dealloc];
}

- (void)disableStatusBarItem:(int)a3 requestor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  id v8 = v7;
  id v15 = v7;
  if (v4 >= 0x2E)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBMainStatusBarStateProvider.m", 141, @"Invalid status bar item %d", v4);

    id v8 = v15;
    if (v15) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"SBMainStatusBarStateProvider.m", 143, @"Invalid parameter not satisfying: %@", @"requestor" object file lineNumber description];

  id v8 = v15;
LABEL_3:
  itemDisabledRequests = self->_itemDisabledRequests;
  v10 = self->_itemDisabledRequests[v4];
  if (!v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28BD0]) initWithCapacity:1];
    BOOL v12 = itemDisabledRequests[v4];
    itemDisabledRequests[v4] = (NSCountedSet *)v11;

    id v8 = v15;
    v10 = itemDisabledRequests[v4];
  }
  [(NSCountedSet *)v10 addObject:v8];
  [(SBMainStatusBarStateProvider *)self _updateDisabledItems];
}

- (void)enableStatusBarItem:(int)a3 requestor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  id v8 = v7;
  if (v4 >= 0x2E)
  {
    id v13 = v7;
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBMainStatusBarStateProvider.m", 153, @"Invalid status bar item %d", v4);

    id v8 = v13;
    if (v13) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  v14 = v8;
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"SBMainStatusBarStateProvider.m", 155, @"Invalid parameter not satisfying: %@", @"requestor" object file lineNumber description];

  id v8 = v14;
LABEL_3:
  uint64_t v9 = self->_itemDisabledRequests[v4];
  if (v9)
  {
    BOOL v12 = v8;
    [(NSCountedSet *)v9 removeObject:v8];
    [(SBMainStatusBarStateProvider *)self _updateDisabledItems];
    id v8 = v12;
  }
}

- (void)_updateDisabledItems
{
  [(SBStatusBarStateProvider *)self beginCoalescentBlock];
  for (uint64_t i = 0; i != 46; ++i)
  {
    BOOL v4 = !i && self->_timeCloaked
      || (i & 0x3D) != 0xC && self->_allButBatteryCloaked
      || self->_telephonyAndBluetoothCloaked
      && ((i & 0x3D) == 4 || (i - 9) < 0x18 && ((0x9000C1u >> (i - 9)) & 1) != 0)
      || [(NSCountedSet *)self->_itemDisabledRequests[i] count] != 0;
    if (self->_itemIsDisabled[i] != v4)
    {
      self->_itemIsDisabled[i] = v4;
      [(SBStatusBarStateProvider *)self updateStatusBarItem:i];
    }
  }
  [(SBStatusBarStateProvider *)self endCoalescentBlock];
}

- (BOOL)isTimeEnabled
{
  return self->_timeEnabled;
}

- (void)updateTimeEnabled
{
}

- (void)updateTimeEnabledImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v7 = 0;
  double v6 = 0.0;
  BOOL v5 = [(SBMainStatusBarStateProvider *)self contentAssertionsWantTimeEnabledAnimated:&v7 duration:&v6];
  [(SBMainStatusBarStateProvider *)self _enableTime:v5 crossfade:v7 crossfadeDuration:v3 immediately:v6];
}

- (void)enableTime:(BOOL)a3
{
}

- (void)enableTime:(BOOL)a3 crossfade:(BOOL)a4 crossfadeDuration:(double)a5
{
}

- (void)_enableTime:(BOOL)a3 crossfade:(BOOL)a4 crossfadeDuration:(double)a5 immediately:(BOOL)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_timeEnabled != a3)
  {
    BOOL v6 = a6;
    BOOL v8 = a4;
    self->_timeEnabled = a3;
    self->_statusBarTimeRequiresUpdate = 1;
    [(SBStatusBarStateProvider *)self updateStatusBarItem:0];
    v10 = [(id)SBApp statusBarForEmbeddedDisplay];
    id v13 = &unk_1F334B5B8;
    uint64_t v11 = [NSNumber numberWithBool:self->_timeEnabled];
    v14[0] = v11;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v10 setEnabledCenterItems:v12 duration:a5];

    if (v6) {
      [v10 forceUpdateData:v8];
    }
  }
}

- (void)setTimeCloaked:(BOOL)a3
{
  self->_timeCloaked = a3;
  [(SBMainStatusBarStateProvider *)self _updateDisabledItems];
}

- (void)setAllItemsExceptBatteryCloaked:(BOOL)a3
{
  self->_allButBatteryCloaked = a3;
  [(SBMainStatusBarStateProvider *)self _updateDisabledItems];
}

- (void)setTelephonyAndBluetoothItemsCloaked:(BOOL)a3
{
  self->_telephonyAndBluetoothCloaked = a3;
  [(SBMainStatusBarStateProvider *)self _updateDisabledItems];
}

- (void)disableDataUpdateAnimationsForRequestor:(id)a3
{
  id v4 = a3;
  dataUpdateAnimationsDisabledRequests = self->_dataUpdateAnimationsDisabledRequests;
  id v8 = v4;
  if (!dataUpdateAnimationsDisabledRequests)
  {
    BOOL v6 = (NSCountedSet *)[objc_alloc(MEMORY[0x1E4F28BD0]) initWithCapacity:1];
    unsigned __int8 v7 = self->_dataUpdateAnimationsDisabledRequests;
    self->_dataUpdateAnimationsDisabledRequests = v6;

    id v4 = v8;
    dataUpdateAnimationsDisabledRequests = self->_dataUpdateAnimationsDisabledRequests;
  }
  [(NSCountedSet *)dataUpdateAnimationsDisabledRequests addObject:v4];
}

- (void)stopDisablingDataUpdateAnimationsForRequestor:(id)a3
{
  [(NSCountedSet *)self->_dataUpdateAnimationsDisabledRequests removeObject:a3];
  if (![(NSCountedSet *)self->_dataUpdateAnimationsDisabledRequests count])
  {
    dataUpdateAnimationsDisabledRequests = self->_dataUpdateAnimationsDisabledRequests;
    self->_dataUpdateAnimationsDisabledRequests = 0;
  }
}

- (void)forceUpdateLocalStatusBarData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, 512);
  [(SBStatusBarStateProvider *)self getStatusBarData:v3];
  v2 = [(id)SBApp statusBarForEmbeddedDisplay];
  [v2 forceUpdateToData:v3 animated:0];
}

- (void)statusBarStateAggregatorDidRequestImmediateUpdates:(id)a3
{
  id v4 = [(SBMainStatusBarStateProvider *)self _identifierForStateAggregator:a3];
  [(SBMainStatusBarStateProvider *)self disableDataUpdateAnimationsForRequestor:v4];
}

- (void)statusBarStateAggregatorDidStopRequestingImmediateUpdates:(id)a3
{
  id v4 = [(SBMainStatusBarStateProvider *)self _identifierForStateAggregator:a3];
  [(SBMainStatusBarStateProvider *)self stopDisablingDataUpdateAnimationsForRequestor:v4];
}

- (id)_identifierForStateAggregator:(id)a3
{
  BOOL v3 = (objc_class *)NSString;
  id v4 = a3;
  BOOL v5 = (void *)[[v3 alloc] initWithFormat:@"<%@:%p>", objc_opt_class(), v4];

  return v5;
}

uint64_t __88__SBMainStatusBarStateProvider_statusBarStateProvider_didPostStatusBarData_withActions___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42E40] postStatusBarData:*(void *)(a1 + 32) withActions:*(unsigned int *)(a1 + 40)];
}

- (NSHashTable)contentAssertions
{
  return self->_contentAssertions;
}

- (void)setContentAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAssertions, 0);
  objc_storeStrong((id *)&self->_dataUpdateAnimationsDisabledRequests, 0);
  itemDisabledRequests = self->_itemDisabledRequests;
  for (uint64_t i = 45; i != -1; --i)
    objc_storeStrong((id *)&itemDisabledRequests[i], 0);
}

@end