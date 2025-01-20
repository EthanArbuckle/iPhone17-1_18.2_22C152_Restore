@interface SBSAPreferences
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)_doesUnanimatedTransitionDescriptionExistForProperty:(id)a3;
- (BOOL)isBlobEnabled;
- (BOOL)isCollisionImminent;
- (BOOL)isEqual:(id)a3;
- (BSOrderedDictionary)dictionaryDescription;
- (NSArray)actions;
- (NSArray)containerViewDescriptions;
- (NSArray)elementDescriptions;
- (NSArray)gestureDescriptions;
- (NSArray)propertiesWithAnimatedTransitionDescriptions;
- (NSArray)timerDescriptions;
- (NSMutableDictionary)_interfaceElementPropertiesToBehaviorSettings;
- (NSMutableDictionary)_interfaceElementPropertiesToMilestones;
- (NSString)description;
- (SBSABackgroundBlurDescription)backgroundBlurDescription;
- (SBSAElementLayoutTransition)elementLayoutTransition;
- (SBSAElementLayoutTransition)lastChangingElementLayoutTransition;
- (SBSAViewDescription)containerParentViewDescription;
- (SBSystemApertureContainerRenderingConfiguration)curtainRenderingConfiguration;
- (SBSystemApertureContainerRenderingConfiguration)highLevelCurtainRenderingConfiguration;
- (id)_effectiveTransitionDescriptionForPropertyForProperty:(id)a3 addingMilestonesAndCreatingUniqueDescriptionIfIndirect:(BOOL)a4;
- (id)animatedTransitionDescriptionForProperty:(id)a3;
- (id)copyByAddingActions:(id)a3;
- (id)copyByUpdatingBackgroundBlurDescription:(id)a3;
- (id)copyByUpdatingContainerViewDescriptions:(id)a3;
- (id)copyByUpdatingElementDescriptions:(id)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithCancellationOfGestureOfClass:(Class)a3 context:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectiveAnimatedTransitionDescriptionForProperty:(id)a3;
- (id)effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:(id)a3;
- (unint64_t)hash;
- (void)_setActions:(id)a3;
- (void)_setBackgroundBlurDescription:(id)a3;
- (void)_setBlobEnabled:(BOOL)a3;
- (void)_setCollisionImminent:(BOOL)a3;
- (void)_setContainerParentViewDescription:(id)a3;
- (void)_setContainerViewDescriptions:(id)a3;
- (void)_setCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
- (void)_setElementDescriptions:(id)a3;
- (void)_setElementLayoutTransition:(id)a3;
- (void)_setGestureDescriptions:(id)a3;
- (void)_setHighLevelCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
- (void)_setInterfaceElementPropertiesToBehaviorSettings:(id)a3;
- (void)_setInterfaceElementPropertiesToMilestones:(id)a3;
- (void)_setLastChangingElementLayoutTransition:(id)a3;
- (void)_setTimerDescriptions:(id)a3;
- (void)finalizePreferencesForApplication:(id)a3;
@end

@implementation SBSAPreferences

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSArray *)self->_gestureDescriptions copy];
  v6 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v5;

  uint64_t v7 = [(NSArray *)self->_timerDescriptions copy];
  v8 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v7;

  uint64_t v9 = [(NSArray *)self->_actions copy];
  v10 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v9;

  uint64_t v11 = [(SBSAViewDescription *)self->_containerParentViewDescription copy];
  v12 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v11;

  uint64_t v13 = [(NSArray *)self->_containerViewDescriptions copy];
  v14 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v13;

  uint64_t v15 = [(NSArray *)self->_elementDescriptions copy];
  v16 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v15;

  uint64_t v17 = [(SBSAElementLayoutTransition *)self->_elementLayoutTransition copy];
  v18 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v17;

  uint64_t v19 = [(SBSAElementLayoutTransition *)self->_lastChangingElementLayoutTransition copy];
  v20 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v19;

  uint64_t v21 = [(SBSABackgroundBlurDescription *)self->_backgroundBlurDescription copy];
  v22 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v21;

  long long v23 = *(_OWORD *)&self->_curtainRenderingConfiguration.renderingStyle;
  *((void *)v4 + 15) = *(void *)&self->_curtainRenderingConfiguration.alwaysRenderInSnapshots;
  *(_OWORD *)(v4 + 104) = v23;
  long long v24 = *(_OWORD *)&self->_highLevelCurtainRenderingConfiguration.renderingStyle;
  *((void *)v4 + 18) = *(void *)&self->_highLevelCurtainRenderingConfiguration.alwaysRenderInSnapshots;
  *((_OWORD *)v4 + 8) = v24;
  v4[9] = self->_blobEnabled;
  v4[10] = self->_collisionImminent;
  uint64_t v25 = [(NSMutableDictionary *)self->_interfaceElementPropertiesToBehaviorSettings mutableCopy];
  v26 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v25;

  uint64_t v27 = [(NSMutableDictionary *)self->_interfaceElementPropertiesToMilestones mutableCopy];
  v28 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v27;

  return v4;
}

- (id)effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:(id)a3
{
  id v5 = a3;
  if (!self->_finalizedForApplication)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBSAPreferences.m" lineNumber:224 description:@"Preferences must be finalized before being applied; this method should only be used when applying preferences by the host"];
  }
  v6 = [(SBSAPreferences *)self _effectiveTransitionDescriptionForPropertyForProperty:v5 addingMilestonesAndCreatingUniqueDescriptionIfIndirect:1];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceElementPropertiesToMilestones, 0);
  objc_storeStrong((id *)&self->_interfaceElementPropertiesToBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_timerDescriptions, 0);
  objc_storeStrong((id *)&self->_gestureDescriptions, 0);
  objc_storeStrong((id *)&self->_backgroundBlurDescription, 0);
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
  objc_storeStrong((id *)&self->_elementLayoutTransition, 0);
  objc_storeStrong((id *)&self->_elementDescriptions, 0);
  objc_storeStrong((id *)&self->_containerParentViewDescription, 0);
  objc_storeStrong((id *)&self->_containerViewDescriptions, 0);
}

- (NSArray)elementDescriptions
{
  return self->_elementDescriptions;
}

- (NSArray)propertiesWithAnimatedTransitionDescriptions
{
  return (NSArray *)[(NSMutableDictionary *)self->_interfaceElementPropertiesToBehaviorSettings allKeys];
}

- (void)finalizePreferencesForApplication:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_finalizedForApplication = 1;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [(NSMutableDictionary *)self->_interfaceElementPropertiesToBehaviorSettings allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [(SBSAPreferences *)self _effectiveTransitionDescriptionForPropertyForProperty:v10 addingMilestonesAndCreatingUniqueDescriptionIfIndirect:1];
        v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13) {
          [(NSMutableDictionary *)self->_interfaceElementPropertiesToBehaviorSettings setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  v14 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v15 = [(SBSAPreferences *)self containerViewDescriptions];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        [v4 displayScale];
        uint64_t v21 = objc_msgSend(v20, "copyByPixelAligningGeometryWithScale:");
        [v14 addObject:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }

  v22 = (void *)[v14 copy];
  [(SBSAPreferences *)self _setContainerViewDescriptions:v22];

  long long v23 = [(SBSAPreferences *)self containerParentViewDescription];
  [v4 displayScale];
  long long v24 = objc_msgSend(v23, "copyByPixelAligningGeometryWithScale:");

  [(SBSAPreferences *)self _setContainerParentViewDescription:v24];
}

- (BOOL)_doesUnanimatedTransitionDescriptionExistForProperty:(id)a3
{
  v3 = [(SBSAPreferences *)self _effectiveTransitionDescriptionForPropertyForProperty:a3 addingMilestonesAndCreatingUniqueDescriptionIfIndirect:0];
  id v4 = [v3 behaviorSettings];
  char v5 = [v4 isUnanimated];

  return v5;
}

- (id)_effectiveTransitionDescriptionForPropertyForProperty:(id)a3 addingMilestonesAndCreatingUniqueDescriptionIfIndirect:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_interfaceElementPropertiesToBehaviorSettings objectForKey:v7];
    if (objc_opt_respondsToSelector())
    {
      char v9 = objc_opt_respondsToSelector();
      id v10 = 0;
      if (v9)
      {
        do
        {
          uint64_t v11 = v10;
          id v10 = v8;

          uint64_t v8 = [(NSMutableDictionary *)self->_interfaceElementPropertiesToBehaviorSettings objectForKey:v10];
        }
        while ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0);
      }
      char v12 = v9 ^ 1;
    }
    else
    {
      id v10 = 0;
      char v12 = 1;
    }
    uint64_t v14 = objc_opt_class();
    id v15 = v8;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v13 = v16;

    if (v4)
    {
      if (!(v12 & 1 | (v13 == 0)))
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke;
        v23[3] = &unk_1E6AF9DA0;
        SEL v25 = a2;
        v23[4] = self;
        id v24 = v10;
        uint64_t v17 = [v13 copyWithBlock:v23];

        id v13 = (id)v17;
      }
      if (v13)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke_2;
        v20[3] = &unk_1E6AF9DA0;
        SEL v22 = a2;
        v20[4] = self;
        id v21 = v7;
        uint64_t v18 = [v13 copyWithBlock:v20];

        id v13 = (id)v18;
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke_2(void *a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    v3 = self;
    id v4 = v14;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        char v5 = v4;
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsaanimatedtr.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    char v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAPreferences.m", 259, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  id v13 = [*(id *)(a1[4] + 96) objectForKey:a1[5]];
  [v6 setMilestones:v13];
}

void __128__SBSAPreferences__effectiveTransitionDescriptionForPropertyForProperty_addingMilestonesAndCreatingUniqueDescriptionIfIndirect___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  if (v18)
  {
    v3 = self;
    id v4 = v18;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        char v5 = v4;
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsaanimatedtr.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    char v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAPreferences.m", 252, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  id v13 = [MEMORY[0x1E4F29128] UUID];
  [v6 setAnimatedTransitionIdentifier:v13];

  id v14 = NSString;
  id v15 = [*(id *)(a1 + 40) associatedInterfaceElementIdentifier];
  uint64_t v16 = [*(id *)(a1 + 40) interfaceElementProperty];
  uint64_t v17 = [v14 stringWithFormat:@"Associated with: %@-(%@)", v15, v16];
  [v6 setResponsibleProviderDebugString:v17];
}

- (NSMutableDictionary)_interfaceElementPropertiesToBehaviorSettings
{
  return self->_interfaceElementPropertiesToBehaviorSettings;
}

- (SBSystemApertureContainerRenderingConfiguration)highLevelCurtainRenderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 128);
  return self;
}

- (SBSystemApertureContainerRenderingConfiguration)curtainRenderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 104);
  return self;
}

- (void)_setInterfaceElementPropertiesToBehaviorSettings:(id)a3
{
}

- (void)_setContainerParentViewDescription:(id)a3
{
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  char v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  char v5 = (void (**)(id, void *))a3;
  if (self->_finalizedForApplication)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSAPreferences.m" lineNumber:325 description:@"Attempting to copy/mutate finalized preferences."];
  }
  id v6 = (void *)[(SBSAPreferences *)self copy];
  if (v5)
  {
    id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithPreferences:", v6);
    v5[2](v5, v7);
  }
  return v6;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

void __68__SBSAPreferences_Private__copyByUpdatingContainerViewDescriptions___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        char v5 = v4;
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    char v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAPreferences.m", 295, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setContainerViewDescriptions:a1[5]];
}

- (void)_setContainerViewDescriptions:(id)a3
{
}

void __68__SBSAPreferences_Private__copyByUpdatingBackgroundBlurDescription___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        char v5 = v4;
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    char v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAPreferences.m", 309, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setBackgroundBlurDescription:a1[5]];
}

- (void)_setBackgroundBlurDescription:(id)a3
{
}

- (void)_setElementDescriptions:(id)a3
{
}

- (id)effectiveAnimatedTransitionDescriptionForProperty:(id)a3
{
  return [(SBSAPreferences *)self _effectiveTransitionDescriptionForPropertyForProperty:a3 addingMilestonesAndCreatingUniqueDescriptionIfIndirect:0];
}

- (id)copyByUpdatingBackgroundBlurDescription:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBSAPreferences_Private__copyByUpdatingBackgroundBlurDescription___block_invoke;
  v9[3] = &unk_1E6AF9DA0;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v6 = v5;
  id v7 = [(SBSAPreferences *)self copyWithBlock:v9];

  return v7;
}

- (void)_setLastChangingElementLayoutTransition:(id)a3
{
}

- (void)_setHighLevelCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  long long v3 = *(_OWORD *)&a3->renderingStyle;
  *(void *)&self->_highLevelCurtainRenderingConfiguration.alwaysRenderInSnapshots = *(void *)&a3->alwaysRenderInSnapshots;
  *(_OWORD *)&self->_highLevelCurtainRenderingConfiguration.renderingStyle = v3;
}

- (void)_setElementLayoutTransition:(id)a3
{
}

- (void)_setCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  long long v3 = *(_OWORD *)&a3->renderingStyle;
  *(void *)&self->_curtainRenderingConfiguration.alwaysRenderInSnapshots = *(void *)&a3->alwaysRenderInSnapshots;
  *(_OWORD *)&self->_curtainRenderingConfiguration.renderingStyle = v3;
}

- (NSArray)containerViewDescriptions
{
  return self->_containerViewDescriptions;
}

- (BOOL)isBlobEnabled
{
  return self->_blobEnabled;
}

- (id)copyByUpdatingContainerViewDescriptions:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBSAPreferences_Private__copyByUpdatingContainerViewDescriptions___block_invoke;
  v9[3] = &unk_1E6AF9DA0;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v6 = v5;
  id v7 = [(SBSAPreferences *)self copyWithBlock:v9];

  return v7;
}

- (SBSAElementLayoutTransition)lastChangingElementLayoutTransition
{
  return self->_lastChangingElementLayoutTransition;
}

- (SBSAElementLayoutTransition)elementLayoutTransition
{
  return self->_elementLayoutTransition;
}

- (SBSAViewDescription)containerParentViewDescription
{
  return self->_containerParentViewDescription;
}

- (NSArray)timerDescriptions
{
  return self->_timerDescriptions;
}

- (NSArray)gestureDescriptions
{
  return self->_gestureDescriptions;
}

- (SBSABackgroundBlurDescription)backgroundBlurDescription
{
  return self->_backgroundBlurDescription;
}

- (BOOL)isCollisionImminent
{
  return self->_collisionImminent;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v43 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __27__SBSAPreferences_isEqual___block_invoke;
  v78[3] = &unk_1E6AF5420;
  id v79 = v4;
  v80 = self;
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __27__SBSAPreferences_isEqual___block_invoke_2;
  v75[3] = &unk_1E6AF5420;
  id v5 = v79;
  id v76 = v5;
  v77 = self;
  v42 = (void *)MEMORY[0x1D948C7A0](v75);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __27__SBSAPreferences_isEqual___block_invoke_3;
  v72[3] = &unk_1E6AF5420;
  id v6 = v5;
  id v73 = v6;
  v74 = self;
  v41 = (void *)MEMORY[0x1D948C7A0](v72);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __27__SBSAPreferences_isEqual___block_invoke_4;
  v69[3] = &unk_1E6AF5420;
  id v7 = v6;
  id v70 = v7;
  v71 = self;
  v40 = (void *)MEMORY[0x1D948C7A0](v69);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __27__SBSAPreferences_isEqual___block_invoke_5;
  v66[3] = &unk_1E6AF5420;
  id v8 = v7;
  id v67 = v8;
  v68 = self;
  v39 = (void *)MEMORY[0x1D948C7A0](v66);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __27__SBSAPreferences_isEqual___block_invoke_6;
  v63[3] = &unk_1E6AF5420;
  id v9 = v8;
  id v64 = v9;
  v65 = self;
  v38 = (void *)MEMORY[0x1D948C7A0](v63);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __27__SBSAPreferences_isEqual___block_invoke_7;
  v60[3] = &unk_1E6AF5420;
  id v10 = v9;
  id v61 = v10;
  v62 = self;
  v37 = (void *)MEMORY[0x1D948C7A0](v60);
  v36 = objc_msgSend(v43, "appendEqualsBlocks:", v78, v42, v41, v40, v39, v38, v37, 0);
  containerParentViewDescription = self->_containerParentViewDescription;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __27__SBSAPreferences_isEqual___block_invoke_8;
  v58[3] = &unk_1E6AF9E90;
  id v12 = v10;
  id v59 = v12;
  uint64_t v35 = [v36 appendObject:containerParentViewDescription counterpart:v58];
  elementLayoutTransition = self->_elementLayoutTransition;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __27__SBSAPreferences_isEqual___block_invoke_9;
  v56[3] = &unk_1E6AF9E90;
  id v14 = v12;
  id v57 = v14;
  id v15 = [v35 appendObject:elementLayoutTransition counterpart:v56];
  lastChangingElementLayoutTransition = self->_lastChangingElementLayoutTransition;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __27__SBSAPreferences_isEqual___block_invoke_10;
  v54[3] = &unk_1E6AF9E90;
  id v17 = v14;
  id v55 = v17;
  id v18 = [v15 appendObject:lastChangingElementLayoutTransition counterpart:v54];
  backgroundBlurDescription = self->_backgroundBlurDescription;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __27__SBSAPreferences_isEqual___block_invoke_11;
  v52[3] = &unk_1E6AF9E90;
  id v20 = v17;
  id v53 = v20;
  id v21 = [v18 appendObject:backgroundBlurDescription counterpart:v52];
  BOOL blobEnabled = self->_blobEnabled;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __27__SBSAPreferences_isEqual___block_invoke_12;
  v50[3] = &unk_1E6AF99E8;
  id v23 = v20;
  id v51 = v23;
  id v24 = [v21 appendBool:blobEnabled counterpart:v50];
  BOOL collisionImminent = self->_collisionImminent;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __27__SBSAPreferences_isEqual___block_invoke_13;
  v48[3] = &unk_1E6AF99E8;
  id v26 = v23;
  id v49 = v26;
  long long v27 = [v24 appendBool:collisionImminent counterpart:v48];
  interfaceElementPropertiesToBehaviorSettings = self->_interfaceElementPropertiesToBehaviorSettings;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __27__SBSAPreferences_isEqual___block_invoke_14;
  v46[3] = &unk_1E6AF9E90;
  id v29 = v26;
  id v47 = v29;
  long long v30 = [v27 appendObject:interfaceElementPropertiesToBehaviorSettings counterpart:v46];
  interfaceElementPropertiesToMilestones = self->_interfaceElementPropertiesToMilestones;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __27__SBSAPreferences_isEqual___block_invoke_15;
  v44[3] = &unk_1E6AF9E90;
  id v45 = v29;
  id v32 = v29;
  v33 = [v30 appendObject:interfaceElementPropertiesToMilestones counterpart:v44];
  LOBYTE(v29) = [v33 isEqual];

  return (char)v29;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) gestureDescriptions];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) timerDescriptions];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) actions];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) containerViewDescriptions];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) elementDescriptions];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

BOOL __27__SBSAPreferences_isEqual___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 curtainRenderingConfiguration];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  uint64_t v3 = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(v3 + 104);
  uint64_t v6 = *(void *)(v3 + 120);
  return SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)v7, (uint64_t)&v5);
}

BOOL __27__SBSAPreferences_isEqual___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 highLevelCurtainRenderingConfiguration];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  uint64_t v3 = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(v3 + 128);
  uint64_t v6 = *(void *)(v3 + 144);
  return SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)v7, (uint64_t)&v5);
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) containerParentViewDescription];
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) elementLayoutTransition];
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) lastChangingElementLayoutTransition];
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundBlurDescription];
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) isBlobEnabled];
}

uint64_t __27__SBSAPreferences_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCollisionImminent];
}

id __27__SBSAPreferences_isEqual___block_invoke_14(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 88);
}

id __27__SBSAPreferences_isEqual___block_invoke_15(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 96);
}

- (unint64_t)hash
{
  SEL v22 = [MEMORY[0x1E4F4F758] builder];
  id v21 = [v22 appendObject:self->_gestureDescriptions];
  id v20 = [v21 appendObject:self->_timerDescriptions];
  uint64_t v19 = [v20 appendObject:self->_actions];
  id v18 = [v19 appendObject:self->_containerParentViewDescription];
  id v17 = [v18 appendObject:self->_containerViewDescriptions];
  uint64_t v16 = [v17 appendObject:self->_elementDescriptions];
  id v15 = [v16 appendObject:self->_elementLayoutTransition];
  uint64_t v3 = [v15 appendObject:self->_lastChangingElementLayoutTransition];
  id v4 = [v3 appendObject:self->_backgroundBlurDescription];
  long long v5 = [v4 appendInteger:self->_curtainRenderingConfiguration.renderingStyle];
  uint64_t v6 = [v5 appendInteger:self->_curtainRenderingConfiguration.cloningStyle];
  id v7 = [v6 appendInteger:self->_highLevelCurtainRenderingConfiguration.renderingStyle];
  id v8 = [v7 appendInteger:self->_highLevelCurtainRenderingConfiguration.cloningStyle];
  id v9 = [v8 appendBool:self->_blobEnabled];
  id v10 = [v9 appendBool:self->_collisionImminent];
  SEL v11 = [v10 appendObject:self->_interfaceElementPropertiesToBehaviorSettings];
  id v12 = [v11 appendObject:self->_interfaceElementPropertiesToMilestones];
  unint64_t v14 = [v12 hash];

  return v14;
}

- (NSString)description
{
  uint64_t v2 = [(SBSAPreferences *)self dictionaryDescription];
  uint64_t v3 = SBSAStringFromDictionaryDescription(v2);

  return (NSString *)v3;
}

- (BSOrderedDictionary)dictionaryDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F4F798]);
  id v4 = [MEMORY[0x1E4F4F7C0] sortByInsertionOrder];
  long long v5 = (void *)[v3 initWithKeyOrderingStrategy:v4];

  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v5 setObject:v6 forKey:v8];

  if ([(NSArray *)self->_gestureDescriptions count])
  {
    id v9 = [(NSArray *)self->_gestureDescriptions description];
    [v5 setObject:v9 forKey:@"gestureDescriptions"];
  }
  if ([(NSArray *)self->_timerDescriptions count])
  {
    id v10 = [(NSArray *)self->_timerDescriptions description];
    [v5 setObject:v10 forKey:@"timerDescriptions"];
  }
  if ([(NSArray *)self->_actions count])
  {
    SEL v11 = [(NSArray *)self->_actions description];
    [v5 setObject:v11 forKey:@"actions"];
  }
  containerParentViewDescription = self->_containerParentViewDescription;
  if (containerParentViewDescription)
  {
    id v13 = [(SBSAViewDescription *)containerParentViewDescription description];
    [v5 setObject:v13 forKey:@"containerParentViewDescription"];
  }
  if ([(NSArray *)self->_containerViewDescriptions count]) {
    [v5 setObject:self->_containerViewDescriptions forKey:@"containerViewDescriptions"];
  }
  if ([(NSArray *)self->_elementDescriptions count]) {
    [v5 setObject:self->_elementDescriptions forKey:@"elementDescriptions"];
  }
  elementLayoutTransition = self->_elementLayoutTransition;
  if (elementLayoutTransition)
  {
    id v15 = [(SBSAElementLayoutTransition *)elementLayoutTransition description];
    [v5 setObject:v15 forKey:@"elementLayoutTransition"];
  }
  lastChangingElementLayoutTransition = self->_lastChangingElementLayoutTransition;
  if (lastChangingElementLayoutTransition)
  {
    id v17 = [(SBSAElementLayoutTransition *)lastChangingElementLayoutTransition description];
    [v5 setObject:v17 forKey:@"lastChangingElementLayoutTransition"];
  }
  backgroundBlurDescription = self->_backgroundBlurDescription;
  if (backgroundBlurDescription)
  {
    uint64_t v19 = [(SBSABackgroundBlurDescription *)backgroundBlurDescription description];
    [v5 setObject:v19 forKey:@"backgroundBlurDescription"];
  }
  long long v25 = *(_OWORD *)&self->_curtainRenderingConfiguration.renderingStyle;
  uint64_t v26 = *(void *)&self->_curtainRenderingConfiguration.alwaysRenderInSnapshots;
  id v20 = SBStringFromSystemApertureContainerRenderingConfiguration(&v25);
  [v5 setObject:v20 forKey:@"curtainRenderingConfiguration"];

  long long v25 = *(_OWORD *)&self->_highLevelCurtainRenderingConfiguration.renderingStyle;
  uint64_t v26 = *(void *)&self->_highLevelCurtainRenderingConfiguration.alwaysRenderInSnapshots;
  id v21 = SBStringFromSystemApertureContainerRenderingConfiguration(&v25);
  [v5 setObject:v21 forKey:@"highLevelCurtainRenderingConfiguration"];

  SEL v22 = NSStringFromBOOL();
  [v5 setObject:v22 forKey:@"blobEnabled"];

  id v23 = NSStringFromBOOL();
  [v5 setObject:v23 forKey:@"collisionImminent"];

  if ([(NSMutableDictionary *)self->_interfaceElementPropertiesToBehaviorSettings count]) {
    [v5 setObject:self->_interfaceElementPropertiesToBehaviorSettings forKey:@"interfaceElementPropertiesToBehaviorSettings"];
  }
  if ([(NSMutableDictionary *)self->_interfaceElementPropertiesToMilestones count]) {
    [v5 setObject:self->_interfaceElementPropertiesToMilestones forKey:@"interfaceElementPropertiesToMilestones"];
  }
  return (BSOrderedDictionary *)v5;
}

- (void)_setBlobEnabled:(BOOL)a3
{
  self->_BOOL blobEnabled = a3;
}

- (void)_setCollisionImminent:(BOOL)a3
{
  self->_BOOL collisionImminent = a3;
}

- (void)_setGestureDescriptions:(id)a3
{
}

- (void)_setTimerDescriptions:(id)a3
{
}

- (void)_setActions:(id)a3
{
}

- (NSMutableDictionary)_interfaceElementPropertiesToMilestones
{
  return self->_interfaceElementPropertiesToMilestones;
}

- (void)_setInterfaceElementPropertiesToMilestones:(id)a3
{
}

- (id)copyByAddingActions:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__SBSAPreferences_Private__copyByAddingActions___block_invoke;
    v8[3] = &unk_1E6AF9DA0;
    SEL v10 = a2;
    v8[4] = self;
    id v9 = v5;
    uint64_t v6 = [(SBSAPreferences *)self copyWithBlock:v8];
  }
  else
  {
    uint64_t v6 = self;
  }

  return v6;
}

void __48__SBSAPreferences_Private__copyByAddingActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v17;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v3 = v17;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAPreferences.m", 276, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v17;
LABEL_9:
    id v7 = 0;
  }

  unint64_t v14 = [v7 actions];
  if (v14)
  {
    id v15 = objc_msgSend(*(id *)(a1 + 40), "bs_differenceWithArray:", v14);
    uint64_t v16 = [v14 arrayByAddingObjectsFromArray:v15];
    [v7 setActions:v16];
  }
  else
  {
    [v7 setActions:*(void *)(a1 + 40)];
  }
}

- (id)copyWithCancellationOfGestureOfClass:(Class)a3 context:(id)a4
{
  id v7 = a4;
  id v8 = [(NSArray *)self->_gestureDescriptions bs_firstObjectOfClass:a3];
  if (v8) {
    goto LABEL_6;
  }
  uint64_t v9 = [v7 gestureDescriptions];
  uint64_t v10 = objc_msgSend(v9, "bs_firstObjectOfClass:", a3);
  Class v11 = v10;
  id v12 = v10 ? v10 : objc_alloc_init(a3);
  id v8 = v12;

  if (v8)
  {
LABEL_6:
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke;
    v16[3] = &unk_1E6AF9DA0;
    id v17 = v8;
    SEL v18 = a2;
    v16[4] = self;
    id v13 = v8;
    unint64_t v14 = [(SBSAPreferences *)self copyWithBlock:v16];
  }
  else
  {
    unint64_t v14 = self;
  }

  return v14;
}

void __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAPreferences.m", 285, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  unint64_t v14 = [v7 gestureDescriptions];
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  id v17 = v16;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke_2;
  v22[3] = &unk_1E6AF53A0;
  SEL v18 = (void *)a1[5];
  uint64_t v19 = a1[6];
  v22[4] = a1[4];
  v22[5] = v19;
  id v20 = (void *)[v18 copyWithBlock:v22];
  id v21 = objc_msgSend(v17, "sbsa_arrayByAddingOrReplacingObjectMatchingClass:", v20);
  [v7 setGestureDescriptions:v21];
}

void __73__SBSAPreferences_Private__copyWithCancellationOfGestureOfClass_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    id v3 = self;
    id v4 = v14;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v10 + 8);
    Class v11 = NSClassFromString(&cfstr_Sbsagesturedes.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v7 handleFailureInMethod:v9, v8, @"SBSAPreferences.m", 288, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setGestureRecognizerState:4];
}

- (id)copyByUpdatingElementDescriptions:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SBSAPreferences_Private__copyByUpdatingElementDescriptions___block_invoke;
  v9[3] = &unk_1E6AF9DA0;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v6 = v5;
  id v7 = [(SBSAPreferences *)self copyWithBlock:v9];

  return v7;
}

void __62__SBSAPreferences_Private__copyByUpdatingElementDescriptions___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    SEL v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAPreferences.m", 302, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setElementDescriptions:a1[5]];
}

- (id)animatedTransitionDescriptionForProperty:(id)a3
{
  if (a3)
  {
    id v3 = -[NSMutableDictionary objectForKey:](self->_interfaceElementPropertiesToBehaviorSettings, "objectForKey:");
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

@end