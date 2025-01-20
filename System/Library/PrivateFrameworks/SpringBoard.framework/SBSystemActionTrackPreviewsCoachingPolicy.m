@interface SBSystemActionTrackPreviewsCoachingPolicy
- (BOOL)wantsCoachingDismissedForAction:(id)a3;
- (BOOL)wantsCoachingPresentedForAction:(id)a3;
- (SBSystemActionTrackPreviewsCoachingPolicy)init;
- (uint64_t)_trackedPreviewCount;
- (void)noteDidBeginPreview:(id)a3 forAction:(id)a4;
- (void)noteDidEndPreview:(id)a3 forAction:(id)a4;
- (void)noteDidInvalidateExpansionOfPreview:(id)a3 forAction:(id)a4 withResult:(unint64_t)a5;
@end

@implementation SBSystemActionTrackPreviewsCoachingPolicy

- (SBSystemActionTrackPreviewsCoachingPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBSystemActionTrackPreviewsCoachingPolicy;
  v2 = [(SBSystemActionTrackPreviewsCoachingPolicy *)&v8 init];
  if (v2)
  {
    v3 = +[SBSystemActionDomain rootSettings];
    v4 = [v3 coachingSettings];
    uint64_t v5 = [v4 trackPreviewsPolicySettings];
    settings = v2->_settings;
    v2->_settings = (SBSystemActionTrackPreviewsCoachingPolicySettings *)v5;
  }
  return v2;
}

- (void)noteDidBeginPreview:(id)a3 forAction:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  trackedPreviewsByAction = self->_trackedPreviewsByAction;
  if (!trackedPreviewsByAction)
  {
    objc_super v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_trackedPreviewsByAction;
    self->_trackedPreviewsByAction = v8;

    trackedPreviewsByAction = self->_trackedPreviewsByAction;
  }
  v10 = [(NSMapTable *)trackedPreviewsByAction objectForKey:v6];
  if (!v10)
  {
    v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMapTable *)self->_trackedPreviewsByAction setObject:v10 forKey:v6];
  }
  [v10 addObject:v11];
}

- (void)noteDidInvalidateExpansionOfPreview:(id)a3 forAction:(id)a4 withResult:(unint64_t)a5
{
  if (!a5)
  {
    [(NSMapTable *)self->_trackedPreviewsByAction removeObjectForKey:a4];
    if (![(NSMapTable *)self->_trackedPreviewsByAction count])
    {
      trackedPreviewsByAction = self->_trackedPreviewsByAction;
      self->_trackedPreviewsByAction = 0;
    }
  }
}

- (void)noteDidEndPreview:(id)a3 forAction:(id)a4
{
  id v12 = a4;
  trackedPreviewsByAction = self->_trackedPreviewsByAction;
  id v7 = a3;
  objc_super v8 = [(NSMapTable *)trackedPreviewsByAction objectForKey:v12];
  [v8 removeObject:v7];

  v9 = [v8 allObjects];
  uint64_t v10 = [v9 count];

  if (!v10) {
    [(NSMapTable *)self->_trackedPreviewsByAction removeObjectForKey:v12];
  }
  if (![(NSMapTable *)self->_trackedPreviewsByAction count])
  {
    id v11 = self->_trackedPreviewsByAction;
    self->_trackedPreviewsByAction = 0;
  }
}

- (BOOL)wantsCoachingPresentedForAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[SBSystemActionTrackPreviewsCoachingPolicy _trackedPreviewCount]((uint64_t)self);
  if (v5) {
    BOOL v6 = SBSystemActionCoachingPolicyWantsCoachingPresented(v4, v5, [(SBSystemActionTrackPreviewsCoachingPolicySettings *)self->_settings presentationThresholdForActionsWithStatefulPreviews], [(SBSystemActionTrackPreviewsCoachingPolicySettings *)self->_settings presentationThresholdForActionsWithStatelessPreviews]);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)_trackedPreviewCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = objc_msgSend(*(id *)(a1 + 16), "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        v9 = [v8 allObjects];
        v5 += [v9 count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)wantsCoachingDismissedForAction:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_trackedPreviewsByAction objectForKey:a3];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPreviewsByAction, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end