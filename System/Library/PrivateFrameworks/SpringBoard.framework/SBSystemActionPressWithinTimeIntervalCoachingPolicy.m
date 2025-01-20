@interface SBSystemActionPressWithinTimeIntervalCoachingPolicy
- (BOOL)wantsCoachingDismissedForAction:(id)a3;
- (BOOL)wantsCoachingPresentedForAction:(id)a3;
- (SBSystemActionPressWithinTimeIntervalCoachingPolicy)init;
- (void)_reset;
- (void)noteDidBeginPreview:(id)a3 forAction:(id)a4;
- (void)noteDidEndPreview:(id)a3 forAction:(id)a4;
- (void)noteDidInvalidateExpansionOfPreview:(id)a3 forAction:(id)a4 withResult:(unint64_t)a5;
@end

@implementation SBSystemActionPressWithinTimeIntervalCoachingPolicy

- (SBSystemActionPressWithinTimeIntervalCoachingPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBSystemActionPressWithinTimeIntervalCoachingPolicy;
  v2 = [(SBSystemActionPressWithinTimeIntervalCoachingPolicy *)&v8 init];
  if (v2)
  {
    v3 = +[SBSystemActionDomain rootSettings];
    v4 = [v3 coachingSettings];
    uint64_t v5 = [v4 pressWithinTimeIntervalPolicySettings];
    settings = v2->_settings;
    v2->_settings = (SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)v5;
  }
  return v2;
}

- (void)noteDidBeginPreview:(id)a3 forAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  countedActions = self->_countedActions;
  if (!countedActions)
  {
    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v10 = self->_countedActions;
    self->_countedActions = v9;

    countedActions = self->_countedActions;
  }
  [(NSCountedSet *)countedActions addObject:v7];
  latestPreviewsByAction = self->_latestPreviewsByAction;
  if (!latestPreviewsByAction)
  {
    v12 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    v13 = self->_latestPreviewsByAction;
    self->_latestPreviewsByAction = v12;

    latestPreviewsByAction = self->_latestPreviewsByAction;
  }
  [(NSMapTable *)latestPreviewsByAction setObject:v6 forKey:v7];
  [(NSTimer *)self->_resetTimer invalidate];
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E4F1CB00];
  [(SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)self->_settings timeInterval];
  double v16 = v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__SBSystemActionPressWithinTimeIntervalCoachingPolicy_noteDidBeginPreview_forAction___block_invoke;
  v19[3] = &unk_1E6AF61A0;
  objc_copyWeak(&v20, &location);
  v17 = [v14 scheduledTimerWithTimeInterval:0 repeats:v19 block:v16];
  resetTimer = self->_resetTimer;
  self->_resetTimer = v17;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __85__SBSystemActionPressWithinTimeIntervalCoachingPolicy_noteDidBeginPreview_forAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[SBSystemActionPressWithinTimeIntervalCoachingPolicy _reset]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)_reset
{
  if (a1)
  {
    [*(id *)(a1 + 32) invalidate];
    id v2 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    v3 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (void)noteDidInvalidateExpansionOfPreview:(id)a3 forAction:(id)a4 withResult:(unint64_t)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v10 = v7;
    NSUInteger v8 = [(NSCountedSet *)self->_countedActions countForObject:v7];
    id v7 = v10;
    if (v8)
    {
      NSUInteger v9 = v8;
      do
      {
        [(NSCountedSet *)self->_countedActions removeObject:v10];
        id v7 = v10;
        --v9;
      }
      while (v9);
    }
  }
}

- (void)noteDidEndPreview:(id)a3 forAction:(id)a4
{
  id v9 = a4;
  latestPreviewsByAction = self->_latestPreviewsByAction;
  id v7 = a3;
  id v8 = [(NSMapTable *)latestPreviewsByAction objectForKey:v9];

  if (v8 == v7) {
    [(NSMapTable *)self->_latestPreviewsByAction removeObjectForKey:v9];
  }
}

- (BOOL)wantsCoachingPresentedForAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSCountedSet *)self->_countedActions countForObject:v4];
  if (v5) {
    BOOL v6 = SBSystemActionCoachingPolicyWantsCoachingPresented(v4, v5, [(SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)self->_settings presentationThresholdForActionsWithStatefulPreviews], [(SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)self->_settings presentationThresholdForActionsWithStatelessPreviews]);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)wantsCoachingDismissedForAction:(id)a3
{
  v3 = [(NSMapTable *)self->_latestPreviewsByAction objectForKey:a3];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_latestPreviewsByAction, 0);
  objc_storeStrong((id *)&self->_countedActions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end