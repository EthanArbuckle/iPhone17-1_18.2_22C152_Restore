@interface SBFZStackParticipant
- (BOOL)homeAffordanceDrawingSuppressed;
- (BOOL)ownsHomeGesture;
- (BOOL)participantBelowAllowsDimming;
- (BOOL)systemApertureSuppressedForSystemChromeSuppression;
- (NSArray)captureButtonFullFidelityEventRequestingScenes;
- (NSArray)foregroundCaptureSceneTargets;
- (NSArray)physicalButtonSceneTargets;
- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture;
- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (NSString)debugDescription;
- (NSString)description;
- (SBFZStackParticipant)initWithIdentifier:(int64_t)a3 delegate:(id)a4;
- (SBFZStackParticipantDelegate)delegate;
- (SBFZStackParticipantPreferences)preferences;
- (SBFZStackResolver)resolver;
- (id)copyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (int64_t)activationState;
- (int64_t)identifier;
- (void)_updatePreferences;
- (void)appendDescriptionToStream:(id)a3;
- (void)invalidate;
- (void)setActivationState:(int64_t)a3;
- (void)setAssociatedBundleIdentifiersToSuppressInSystemAperture:(id)a3;
- (void)setAssociatedSceneIdentifiersToSuppressInSystemAperture:(id)a3;
- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3;
- (void)setCaptureButtonFullFidelityEventRequestingScenes:(id)a3;
- (void)setForegroundCaptureSceneTargets:(id)a3;
- (void)setHomeAffordanceDrawingSuppressed:(BOOL)a3;
- (void)setNeedsUpdatePreferencesWithReason:(id)a3;
- (void)setOwnsHomeGesture:(BOOL)a3;
- (void)setParticipantBelowAllowsDimming:(BOOL)a3;
- (void)setPhysicalButtonSceneTargets:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setResolver:(id)a3;
- (void)setSystemApertureSuppressedForSystemChromeSuppression:(BOOL)a3;
@end

@implementation SBFZStackParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_destroyWeak((id *)&self->_resolver);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_captureButtonFullFidelityEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBFZStackParticipant alloc];
  int64_t identifier = self->_identifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [(SBFZStackParticipant *)v4 initWithIdentifier:identifier delegate:WeakRetained];

  id v8 = objc_loadWeakRetained((id *)&self->_resolver);
  objc_storeWeak((id *)(v7 + 88), v8);

  objc_storeStrong((id *)(v7 + 96), self->_preferences);
  *(unsigned char *)(v7 + 9) = self->_homeAffordanceDrawingSuppressed;
  *(unsigned char *)(v7 + 8) = self->_ownsHomeGesture;
  *(void *)(v7 + 32) = self->_activationState;
  *(unsigned char *)(v7 + 10) = self->_systemApertureSuppressedForSystemChromeSuppression;
  objc_storeStrong((id *)(v7 + 48), self->_associatedSceneIdentifiersToSuppressInSystemAperture);
  objc_storeStrong((id *)(v7 + 40), self->_associatedBundleIdentifiersToSuppressInSystemAperture);
  objc_storeStrong((id *)(v7 + 56), self->_physicalButtonSceneTargets);
  uint64_t v9 = [(NSArray *)self->_captureButtonFullFidelityEventRequestingScenes copy];
  v10 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = v9;

  uint64_t v11 = [(NSArray *)self->_foregroundCaptureSceneTargets copy];
  v12 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = v11;

  objc_storeStrong((id *)(v7 + 80), self->_audioCategoriesDisablingVolumeHUD);
  return (id)v7;
}

- (SBFZStackParticipant)initWithIdentifier:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBFZStackParticipant;
  uint64_t v7 = [(SBFZStackParticipant *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    v7->_int64_t identifier = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogZStack();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = _SBFZStackParticipantIdentifierDescription([(SBFZStackParticipant *)self identifier]);
    int v7 = 138543618;
    id v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, "Requested update preferences for <%{public}@> with reason: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(SBFZStackParticipant *)self _updatePreferences];
}

- (void)_updatePreferences
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(SBFZStackParticipant *)self preferences];
  id v4 = (void *)[v3 copy];

  id v5 = [[SBFZStackParticipantPreferences alloc] initInternal];
  id v6 = [(SBFZStackParticipant *)self delegate];
  [v6 zStackParticipant:self updatePreferences:v5];

  [(SBFZStackParticipant *)self setPreferences:v5];
  if (BSEqualObjects())
  {
    int v7 = SBLogZStack();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = _SBFZStackParticipantIdentifierDescription([(SBFZStackParticipant *)self identifier]);
      *(_DWORD *)buf = 138543362;
      v20 = v8;
      _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "_updatePreferences <%{public}@>: no changes", buf, 0xCu);
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F4F720]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__SBFZStackParticipant__updatePreferences__block_invoke;
    v15[3] = &unk_1E548CBF0;
    id v16 = v5;
    id v17 = v4;
    int v7 = v9;
    v18 = v7;
    [v7 appendBodySectionWithName:0 block:v15];
    id v10 = SBLogZStack();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = _SBFZStackParticipantIdentifierDescription([(SBFZStackParticipant *)self identifier]);
      v12 = [v7 description];
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_18B52E000, v10, OS_LOG_TYPE_DEFAULT, "_updatePreferences <%{public}@>: %{public}@", buf, 0x16u);
    }
  }

  uint64_t v13 = [(SBFZStackParticipant *)self resolver];
  v14 = (void *)v13;
  if (v13) {
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](v13, 0, 0);
  }
}

- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture
{
  return self->_associatedSceneIdentifiersToSuppressInSystemAperture;
}

- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture
{
  return self->_associatedBundleIdentifiersToSuppressInSystemAperture;
}

- (BOOL)systemApertureSuppressedForSystemChromeSuppression
{
  return self->_systemApertureSuppressedForSystemChromeSuppression;
}

- (void)setSystemApertureSuppressedForSystemChromeSuppression:(BOOL)a3
{
  self->_systemApertureSuppressedForSystemChromeSuppression = a3;
}

- (void)setAssociatedSceneIdentifiersToSuppressInSystemAperture:(id)a3
{
}

- (void)setAssociatedBundleIdentifiersToSuppressInSystemAperture:(id)a3
{
}

- (SBFZStackParticipantPreferences)preferences
{
  return self->_preferences;
}

- (int64_t)activationState
{
  return self->_activationState;
}

- (BOOL)ownsHomeGesture
{
  return self->_ownsHomeGesture;
}

- (BOOL)participantBelowAllowsDimming
{
  return self->_participantBelowAllowsDimming;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (SBFZStackParticipantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFZStackParticipantDelegate *)WeakRetained;
}

- (NSArray)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (BOOL)homeAffordanceDrawingSuppressed
{
  return self->_homeAffordanceDrawingSuppressed;
}

- (void)setHomeAffordanceDrawingSuppressed:(BOOL)a3
{
  self->_homeAffordanceDrawingSuppressed = a3;
}

- (NSArray)foregroundCaptureSceneTargets
{
  return self->_foregroundCaptureSceneTargets;
}

- (NSArray)captureButtonFullFidelityEventRequestingScenes
{
  return self->_captureButtonFullFidelityEventRequestingScenes;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (void)setPreferences:(id)a3
{
}

- (SBFZStackResolver)resolver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resolver);
  return (SBFZStackResolver *)WeakRetained;
}

- (void)setActivationState:(int64_t)a3
{
  self->_activationState = a3;
}

- (void)setPhysicalButtonSceneTargets:(id)a3
{
}

- (void)setForegroundCaptureSceneTargets:(id)a3
{
}

- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3
{
}

uint64_t __42__SBFZStackParticipant__updatePreferences__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _describeDifferencesFromOriginal:*(void *)(a1 + 40) differenceStream:*(void *)(a1 + 48)];
}

- (void)invalidate
{
  id v3 = [(SBFZStackParticipant *)self resolver];
  -[SBFZStackResolver _unregisterParticipant:]((uint64_t)v3, self);
}

- (void)setResolver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resolver);
  if (obj && WeakRetained)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBFZStackResolver.m", 655, @"Cannot register %@ with %@ because it's already registered with %@", self, obj, WeakRetained object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_resolver, obj);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSString)debugDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] debugStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (id)succinctDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__SBFZStackParticipant_appendDescriptionToStream___block_invoke;
  v10[3] = &unk_1E548CBA0;
  id v5 = v4;
  id v11 = v5;
  v12 = self;
  [v5 appendProem:self block:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SBFZStackParticipant_appendDescriptionToStream___block_invoke_2;
  v7[3] = &unk_1E548CBA0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 appendBodySectionWithName:0 block:v7];
}

uint64_t __50__SBFZStackParticipant_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = _SBFZStackParticipantIdentifierDescription([*(id *)(a1 + 40) identifier]);
  [v2 appendString:v3 withName:@"identifier"];

  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = [*(id *)(a1 + 40) activationState];
  if (v5 > 2) {
    id v6 = 0;
  }
  else {
    id v6 = off_1E548DA50[v5];
  }
  return [v4 appendString:v6 withName:@"activationState"];
}

void __50__SBFZStackParticipant_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "ownsHomeGesture"), @"ownsHomeGesture");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "homeAffordanceDrawingSuppressed"), @"homeAffordanceDrawingSuppressed", 1);
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "systemApertureSuppressedForSystemChromeSuppression"), @"systemApertureSuppressedForSystemChromeSuppression", 1);
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) associatedSceneIdentifiersToSuppressInSystemAperture];
  int v7 = [v6 allObjects];
  id v8 = [v7 componentsJoinedByString:@", "];
  [v5 appendString:v8 withName:@"associatedSceneIdentifiersToSuppressInSystemAperture" skipIfEmpty:1];

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) associatedBundleIdentifiersToSuppressInSystemAperture];
  id v11 = [v10 allObjects];
  v12 = [v11 componentsJoinedByString:@", "];
  [v9 appendString:v12 withName:@"associatedBundleIdentifiersToSuppressInSystemAperture" skipIfEmpty:1];

  uint64_t v13 = *(void **)(a1 + 32);
  v14 = [*(id *)(a1 + 40) physicalButtonSceneTargets];
  id v15 = (id)[v13 appendObject:v14 withName:@"physicalButtonSceneTargets"];

  id v16 = *(void **)(a1 + 32);
  id v17 = [*(id *)(a1 + 40) audioCategoriesDisablingVolumeHUD];
  v18 = [v17 allObjects];
  v19 = [v18 componentsJoinedByString:@", "];
  [v16 appendString:v19 withName:@"audioCategoriesDisablingVolumeHUD" skipIfEmpty:1];

  int v20 = [*(id *)(a1 + 32) hasSuccinctStyle];
  v22 = *(void **)(a1 + 32);
  __int16 v21 = *(void **)(a1 + 40);
  if (v20)
  {
    id v32 = [v21 preferences];
    unint64_t v23 = [v32 homeAffordanceDrawingSuppression];
    if (v23 > 2) {
      v24 = 0;
    }
    else {
      v24 = off_1E548DA98[v23];
    }
    [v22 appendString:v24 withName:@"suppression"];
  }
  else
  {
    v25 = [v21 delegate];
    id v26 = (id)[v22 appendPointer:v25 withName:@"delegate"];

    v27 = *(void **)(a1 + 32);
    v28 = [*(id *)(a1 + 40) resolver];
    id v29 = (id)[v27 appendPointer:v28 withName:@"resolver"];

    v30 = *(void **)(a1 + 32);
    id v32 = [*(id *)(a1 + 40) preferences];
    id v31 = (id)[v30 appendObject:v32 withName:@"preferences"];
  }
}

- (void)setOwnsHomeGesture:(BOOL)a3
{
  self->_ownsHomeGesture = a3;
}

- (void)setCaptureButtonFullFidelityEventRequestingScenes:(id)a3
{
}

- (void)setParticipantBelowAllowsDimming:(BOOL)a3
{
  self->_participantBelowAllowsDimming = a3;
}

@end