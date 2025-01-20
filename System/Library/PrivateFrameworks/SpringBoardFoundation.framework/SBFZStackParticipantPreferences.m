@interface SBFZStackParticipantPreferences
- (BOOL)isEqual:(id)a3;
- (BOOL)suppressSystemApertureForSystemChromeSuppression;
- (NSArray)captureButtonFullFidelityEventRequestingScenes;
- (NSArray)foregroundCaptureSceneTargets;
- (NSArray)physicalButtonSceneTargets;
- (NSIndexSet)assertIsAboveParticipantIdentifiers;
- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture;
- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (NSString)debugDescription;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (id)succinctDescription;
- (int64_t)activationPolicyForParticipantsBelow;
- (int64_t)allowsDimmingWhenForegroundInactive;
- (int64_t)homeAffordanceDrawingSuppression;
- (int64_t)homeGestureConsumption;
- (void)_appendBodyDescriptionToStream:(id)a3;
- (void)_describeDifferencesFromOriginal:(id)a3 differenceStream:(id)a4;
- (void)appendDescriptionToStream:(id)a3;
- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3;
- (void)setAllowsDimmingWhenForegroundInactive:(int64_t)a3;
- (void)setAssertIsAboveParticipantIdentifiers:(id)a3;
- (void)setAssociatedBundleIdentifiersToSuppressInSystemAperture:(id)a3;
- (void)setAssociatedSceneIdentifiersToSuppressInSystemAperture:(id)a3;
- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3;
- (void)setCaptureButtonFullFidelityEventRequestingScenes:(id)a3;
- (void)setForegroundCaptureSceneTargets:(id)a3;
- (void)setHomeAffordanceDrawingSuppression:(int64_t)a3;
- (void)setHomeGestureConsumption:(int64_t)a3;
- (void)setPhysicalButtonSceneTargets:(id)a3;
- (void)setSuppressSystemApertureForSystemChromeSuppression:(BOOL)a3;
@end

@implementation SBFZStackParticipantPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_captureButtonFullFidelityEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_assertIsAboveParticipantIdentifiers, 0);
}

- (void)_describeDifferencesFromOriginal:(id)a3 differenceStream:(id)a4
{
  v27 = a3;
  id v6 = a4;
  v7 = v6;
  if (v27)
  {
    unint64_t activationPolicyForParticipantsBelow = self->_activationPolicyForParticipantsBelow;
    if (activationPolicyForParticipantsBelow != v27[2])
    {
      if (activationPolicyForParticipantsBelow > 2) {
        v9 = 0;
      }
      else {
        v9 = off_1E548DA68[activationPolicyForParticipantsBelow];
      }
      id v10 = (id)[v6 appendObject:v9 withName:@"activationPolicyForParticipantsBelow"];
    }
    if ((BSEqualObjects() & 1) == 0) {
      id v11 = (id)[v7 appendObject:self->_assertIsAboveParticipantIdentifiers withName:@"assertIsAboveParticipantIdentifiers"];
    }
    unint64_t homeGestureConsumption = self->_homeGestureConsumption;
    v13 = v27;
    if (homeGestureConsumption != v27[4])
    {
      if (homeGestureConsumption > 2) {
        v14 = 0;
      }
      else {
        v14 = off_1E548DA80[homeGestureConsumption];
      }
      [v7 appendString:v14 withName:@"homeGestureConsumption"];
      v13 = v27;
    }
    unint64_t homeAffordanceDrawingSuppression = self->_homeAffordanceDrawingSuppression;
    if (homeAffordanceDrawingSuppression != v13[5])
    {
      if (homeAffordanceDrawingSuppression > 2) {
        v16 = 0;
      }
      else {
        v16 = off_1E548DA98[homeAffordanceDrawingSuppression];
      }
      [v7 appendString:v16 withName:@"homeAffordanceDrawingSuppression"];
      v13 = v27;
    }
    int suppressSystemApertureForSystemChromeSuppression = self->_suppressSystemApertureForSystemChromeSuppression;
    if (suppressSystemApertureForSystemChromeSuppression != *((unsigned __int8 *)v13 + 8)) {
      id v18 = (id)[v7 appendBool:suppressSystemApertureForSystemChromeSuppression != 0 withName:@"suppressSystemApertureForSystemChromeSuppression"];
    }
    if ((BSEqualObjects() & 1) == 0) {
      id v19 = (id)[v7 appendObject:self->_associatedSceneIdentifiersToSuppressInSystemAperture withName:@"associatedSceneIdentifiersToSuppressInSystemAperture"];
    }
    if ((BSEqualObjects() & 1) == 0) {
      id v20 = (id)[v7 appendObject:self->_associatedBundleIdentifiersToSuppressInSystemAperture withName:@"associatedBundleIdentifiersToSuppressInSystemAperture"];
    }
    if ((BSEqualObjects() & 1) == 0) {
      id v21 = (id)[v7 appendObject:self->_physicalButtonSceneTargets withName:@"physicalButtonSceneTargets"];
    }
    if ((BSEqualObjects() & 1) == 0) {
      id v22 = (id)[v7 appendObject:self->_captureButtonFullFidelityEventRequestingScenes withName:@"captureButtonFullFidelityEventRequestingScenes"];
    }
    if ((BSEqualObjects() & 1) == 0) {
      id v23 = (id)[v7 appendObject:self->_foregroundCaptureSceneTargets withName:@"foregroundCaptureSceneTargets"];
    }
    if ((BSEqualObjects() & 1) == 0) {
      id v24 = (id)[v7 appendObject:self->_audioCategoriesDisablingVolumeHUD withName:@"audioCategoriesDisablingVolumeHUD"];
    }
    unint64_t allowsDimmingWhenForegroundInactive = self->_allowsDimmingWhenForegroundInactive;
    if (allowsDimmingWhenForegroundInactive != v27[12])
    {
      if (allowsDimmingWhenForegroundInactive > 2) {
        v26 = 0;
      }
      else {
        v26 = off_1E548DAB0[allowsDimmingWhenForegroundInactive];
      }
      [v7 appendString:v26 withName:@"allowsDimmingWhenForegroundInactive"];
    }
  }
  else
  {
    [(SBFZStackParticipantPreferences *)self _appendBodyDescriptionToStream:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setActivationPolicyForParticipantsBelow:self->_activationPolicyForParticipantsBelow];
  [v4 setAssertIsAboveParticipantIdentifiers:self->_assertIsAboveParticipantIdentifiers];
  [v4 setHomeGestureConsumption:self->_homeGestureConsumption];
  [v4 setHomeAffordanceDrawingSuppression:self->_homeAffordanceDrawingSuppression];
  [v4 setSuppressSystemApertureForSystemChromeSuppression:self->_suppressSystemApertureForSystemChromeSuppression];
  [v4 setAssociatedSceneIdentifiersToSuppressInSystemAperture:self->_associatedSceneIdentifiersToSuppressInSystemAperture];
  [v4 setAssociatedBundleIdentifiersToSuppressInSystemAperture:self->_associatedBundleIdentifiersToSuppressInSystemAperture];
  [v4 setPhysicalButtonSceneTargets:self->_physicalButtonSceneTargets];
  [v4 setCaptureButtonFullFidelityEventRequestingScenes:self->_captureButtonFullFidelityEventRequestingScenes];
  [v4 setForegroundCaptureSceneTargets:self->_foregroundCaptureSceneTargets];
  [v4 setAudioCategoriesDisablingVolumeHUD:self->_audioCategoriesDisablingVolumeHUD];
  [v4 setAllowsDimmingWhenForegroundInactive:self->_allowsDimmingWhenForegroundInactive];
  return v4;
}

- (void)setSuppressSystemApertureForSystemChromeSuppression:(BOOL)a3
{
  self->_int suppressSystemApertureForSystemChromeSuppression = a3;
}

- (void)setPhysicalButtonSceneTargets:(id)a3
{
}

- (void)setHomeGestureConsumption:(int64_t)a3
{
  self->_unint64_t homeGestureConsumption = a3;
}

- (void)setHomeAffordanceDrawingSuppression:(int64_t)a3
{
  self->_unint64_t homeAffordanceDrawingSuppression = a3;
}

- (void)setForegroundCaptureSceneTargets:(id)a3
{
}

- (void)setCaptureButtonFullFidelityEventRequestingScenes:(id)a3
{
}

- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3
{
}

- (void)setAssociatedSceneIdentifiersToSuppressInSystemAperture:(id)a3
{
}

- (void)setAssociatedBundleIdentifiersToSuppressInSystemAperture:(id)a3
{
}

- (void)setAllowsDimmingWhenForegroundInactive:(int64_t)a3
{
  self->_unint64_t allowsDimmingWhenForegroundInactive = a3;
}

- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3
{
  self->_unint64_t activationPolicyForParticipantsBelow = a3;
}

- (void)setAssertIsAboveParticipantIdentifiers:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBFZStackParticipantPreferences *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(SBFZStackParticipantPreferences *)self activationPolicyForParticipantsBelow], v5 == [(SBFZStackParticipantPreferences *)v4 activationPolicyForParticipantsBelow]))
    {
      id v6 = [(SBFZStackParticipantPreferences *)self assertIsAboveParticipantIdentifiers];
      v7 = [(SBFZStackParticipantPreferences *)v4 assertIsAboveParticipantIdentifiers];
      if (BSEqualObjects()
        && (int64_t v8 = [(SBFZStackParticipantPreferences *)self homeGestureConsumption],
            v8 == [(SBFZStackParticipantPreferences *)v4 homeGestureConsumption])
        && (v9 = [(SBFZStackParticipantPreferences *)self homeAffordanceDrawingSuppression], v9 == [(SBFZStackParticipantPreferences *)v4 homeAffordanceDrawingSuppression])&& (BOOL v10 = [(SBFZStackParticipantPreferences *)self suppressSystemApertureForSystemChromeSuppression], v10 == [(SBFZStackParticipantPreferences *)v4 suppressSystemApertureForSystemChromeSuppression]))
      {
        v13 = [(SBFZStackParticipantPreferences *)self associatedBundleIdentifiersToSuppressInSystemAperture];
        v14 = [(SBFZStackParticipantPreferences *)v4 associatedBundleIdentifiersToSuppressInSystemAperture];
        if (BSEqualSets())
        {
          v15 = [(SBFZStackParticipantPreferences *)self associatedSceneIdentifiersToSuppressInSystemAperture];
          v16 = [(SBFZStackParticipantPreferences *)v4 associatedSceneIdentifiersToSuppressInSystemAperture];
          if (BSEqualSets())
          {
            v17 = [(SBFZStackParticipantPreferences *)self physicalButtonSceneTargets];
            id v18 = [(SBFZStackParticipantPreferences *)v4 physicalButtonSceneTargets];
            if (BSEqualArrays())
            {
              v27 = v17;
              uint64_t v19 = [(SBFZStackParticipantPreferences *)self captureButtonFullFidelityEventRequestingScenes];
              v28 = [(SBFZStackParticipantPreferences *)v4 captureButtonFullFidelityEventRequestingScenes];
              v29 = (void *)v19;
              if (BSEqualArrays())
              {
                uint64_t v20 = [(SBFZStackParticipantPreferences *)self foregroundCaptureSceneTargets];
                v25 = [(SBFZStackParticipantPreferences *)v4 foregroundCaptureSceneTargets];
                v26 = (void *)v20;
                if (BSEqualArrays())
                {
                  uint64_t v21 = [(SBFZStackParticipantPreferences *)self audioCategoriesDisablingVolumeHUD];
                  id v23 = [(SBFZStackParticipantPreferences *)v4 audioCategoriesDisablingVolumeHUD];
                  id v24 = (void *)v21;
                  if (BSEqualSets())
                  {
                    int64_t v22 = [(SBFZStackParticipantPreferences *)self allowsDimmingWhenForegroundInactive];
                    BOOL v11 = v22 == [(SBFZStackParticipantPreferences *)v4 allowsDimmingWhenForegroundInactive];
                  }
                  else
                  {
                    BOOL v11 = 0;
                  }
                  v17 = v27;
                }
                else
                {
                  BOOL v11 = 0;
                  v17 = v27;
                }
              }
              else
              {
                BOOL v11 = 0;
                v17 = v27;
              }
            }
            else
            {
              BOOL v11 = 0;
            }
          }
          else
          {
            BOOL v11 = 0;
          }
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (int64_t)allowsDimmingWhenForegroundInactive
{
  return self->_allowsDimmingWhenForegroundInactive;
}

- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture
{
  return self->_associatedSceneIdentifiersToSuppressInSystemAperture;
}

- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture
{
  return self->_associatedBundleIdentifiersToSuppressInSystemAperture;
}

- (BOOL)suppressSystemApertureForSystemChromeSuppression
{
  return self->_suppressSystemApertureForSystemChromeSuppression;
}

- (int64_t)homeAffordanceDrawingSuppression
{
  return self->_homeAffordanceDrawingSuppression;
}

- (NSIndexSet)assertIsAboveParticipantIdentifiers
{
  return self->_assertIsAboveParticipantIdentifiers;
}

- (NSArray)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (int64_t)homeGestureConsumption
{
  return self->_homeGestureConsumption;
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

- (int64_t)activationPolicyForParticipantsBelow
{
  return self->_activationPolicyForParticipantsBelow;
}

- (id)initInternal
{
  v6.receiver = self;
  v6.super_class = (Class)SBFZStackParticipantPreferences;
  v2 = [(SBFZStackParticipantPreferences *)&v6 init];
  v3 = v2;
  if (v2)
  {
    assertIsAboveParticipantIdentifiers = v2->_assertIsAboveParticipantIdentifiers;
    v2->_unint64_t activationPolicyForParticipantsBelow = 0;
    v2->_assertIsAboveParticipantIdentifiers = 0;

    v3->_unint64_t allowsDimmingWhenForegroundInactive = 0;
    v3->_unint64_t homeGestureConsumption = 0;
    v3->_unint64_t homeAffordanceDrawingSuppression = 0;
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] debugStyle];
  int64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (id)succinctDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  int64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)_appendBodyDescriptionToStream:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBFZStackParticipantPreferences *)self activationPolicyForParticipantsBelow];
  if (v5 > 2) {
    objc_super v6 = 0;
  }
  else {
    objc_super v6 = off_1E548DA68[v5];
  }
  [v4 appendString:v6 withName:@"activationPolicyForParticipantsBelow"];
  unint64_t v7 = [(SBFZStackParticipantPreferences *)self homeGestureConsumption];
  if (v7 > 2) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = off_1E548DA80[v7];
  }
  [v4 appendString:v8 withName:@"homeGestureConsumption"];
  unint64_t v9 = [(SBFZStackParticipantPreferences *)self homeAffordanceDrawingSuppression];
  if (v9 > 2) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = off_1E548DA98[v9];
  }
  [v4 appendString:v10 withName:@"homeAffordanceDrawingSuppression"];
  BOOL v11 = [(SBFZStackParticipantPreferences *)self assertIsAboveParticipantIdentifiers];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = ___SBFZStackParticipantIdentifierDescriptionsForIdentifiers_block_invoke;
  v31[3] = &unk_1E548D930;
  id v13 = v12;
  id v32 = v13;
  [v11 enumerateIndexesUsingBlock:v31];

  id v14 = (id)[v4 appendObject:v13 withName:@"assertIsAboveParticipantIdentifiers"];
  id v15 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBFZStackParticipantPreferences suppressSystemApertureForSystemChromeSuppression](self, "suppressSystemApertureForSystemChromeSuppression"), @"suppressSystemApertureForSystemChromeSuppression", 1);
  v16 = [(SBFZStackParticipantPreferences *)self associatedSceneIdentifiersToSuppressInSystemAperture];
  v17 = [v16 description];
  [v4 appendString:v17 withName:@"associatedSceneIdentifiersToSuppressInSystemAperture" skipIfEmpty:1];

  id v18 = [(SBFZStackParticipantPreferences *)self associatedBundleIdentifiersToSuppressInSystemAperture];
  uint64_t v19 = [v18 description];
  [v4 appendString:v19 withName:@"associatedBundleIdentifiersToSuppressInSystemAperture" skipIfEmpty:1];

  uint64_t v20 = [(SBFZStackParticipantPreferences *)self physicalButtonSceneTargets];
  uint64_t v21 = [v20 description];
  [v4 appendString:v21 withName:@"physicalButtonSceneTargets" skipIfEmpty:1];

  int64_t v22 = [(SBFZStackParticipantPreferences *)self captureButtonFullFidelityEventRequestingScenes];
  id v23 = objc_msgSend(v22, "bs_map:", &__block_literal_global_302);
  id v24 = [v23 description];
  [v4 appendString:v24 withName:@"captureButtonFullFidelityEventRequestingScenes" skipIfEmpty:1];

  v25 = [(SBFZStackParticipantPreferences *)self foregroundCaptureSceneTargets];
  v26 = [v25 description];
  [v4 appendString:v26 withName:@"foregroundCaptureSceneTargets" skipIfEmpty:1];

  v27 = [(SBFZStackParticipantPreferences *)self audioCategoriesDisablingVolumeHUD];
  v28 = [v27 description];
  [v4 appendString:v28 withName:@"audioCategoriesDisablingVolumeHUD" skipIfEmpty:1];

  unint64_t v29 = [(SBFZStackParticipantPreferences *)self allowsDimmingWhenForegroundInactive];
  if (v29 > 2) {
    v30 = 0;
  }
  else {
    v30 = off_1E548DAB0[v29];
  }
  [v4 appendString:v30 withName:@"allowsDimmingWhenForegroundInactive"];
}

id __66__SBFZStackParticipantPreferences__appendBodyDescriptionToStream___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identityToken];
  v3 = [v2 stringRepresentation];

  return v3;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  [v4 appendProem:self block:&__block_literal_global_304];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBFZStackParticipantPreferences_appendDescriptionToStream___block_invoke_2;
  v6[3] = &unk_1E548CBA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendBodySectionWithName:0 block:v6];
}

uint64_t __61__SBFZStackParticipantPreferences_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendBodyDescriptionToStream:*(void *)(a1 + 40)];
}

@end