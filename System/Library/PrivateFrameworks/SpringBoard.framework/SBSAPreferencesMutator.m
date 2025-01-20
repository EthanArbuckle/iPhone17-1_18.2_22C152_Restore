@interface SBSAPreferencesMutator
- (BOOL)isBlobEnabled;
- (BOOL)isCollisionImminent;
- (NSArray)actions;
- (NSArray)containerViewDescriptions;
- (NSArray)elementDescriptions;
- (NSArray)gestureDescriptions;
- (NSArray)timerDescriptions;
- (NSString)description;
- (SBSABackgroundBlurDescription)backgroundBlurDescription;
- (SBSAElementLayoutTransition)elementLayoutTransition;
- (SBSAElementLayoutTransition)lastChangingElementLayoutTransition;
- (SBSAPreferences)preferences;
- (SBSAPreferencesMutator)initWithPreferences:(id)a3;
- (SBSAViewDescription)containerParentViewDescription;
- (SBSystemApertureContainerRenderingConfiguration)curtainRenderingConfiguration;
- (SBSystemApertureContainerRenderingConfiguration)highLevelCurtainRenderingConfiguration;
- (id)animatedTransitionDescriptionForProperty:(id)a3;
- (id)effectiveAnimatedTransitionDescriptionForProperty:(id)a3;
- (id)effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:(id)a3;
- (id)propertiesWithAnimatedTransitionDescriptions;
- (void)addMilestones:(id)a3 forPropertyIdentity:(id)a4;
- (void)associateAnimatedTransitionDescriptionOfProperty:(id)a3 overridingExistingUnanimatedSettings:(BOOL)a4 withProperty:(id)a5 withMilestones:(id)a6;
- (void)associateAnimatedTransitionDescriptionOfProperty:(id)a3 withProperty:(id)a4 withMilestones:(id)a5;
- (void)setActions:(id)a3;
- (void)setAnimatedTransitionDescription:(id)a3 forProperty:(id)a4 withMilestones:(id)a5;
- (void)setAnimatedTransitionDescription:(id)a3 overridingExistingUnanimatedSettings:(BOOL)a4 forProperty:(id)a5 withMilestones:(id)a6;
- (void)setBackgroundBlurDescription:(id)a3;
- (void)setBlobEnabled:(BOOL)a3;
- (void)setCollisionImminent:(BOOL)a3;
- (void)setContainerParentViewDescription:(id)a3;
- (void)setContainerViewDescriptions:(id)a3;
- (void)setCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
- (void)setElementDescriptions:(id)a3;
- (void)setElementLayoutTransition:(id)a3;
- (void)setGestureDescriptions:(id)a3;
- (void)setHighLevelCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
- (void)setLastChangingElementLayoutTransition:(id)a3;
- (void)setTimerDescriptions:(id)a3;
@end

@implementation SBSAPreferencesMutator

- (void).cxx_destruct
{
}

- (void)setAnimatedTransitionDescription:(id)a3 overridingExistingUnanimatedSettings:(BOOL)a4 forProperty:(id)a5 withMilestones:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v13 && v10)
  {
    id v12 = [(SBSAPreferences *)self->_preferences _interfaceElementPropertiesToBehaviorSettings];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(SBSAPreferences *)self->_preferences _setInterfaceElementPropertiesToBehaviorSettings:v12];
    }
    if (![(SBSAPreferences *)self->_preferences _doesUnanimatedTransitionDescriptionExistForProperty:v10]|| v8)
    {
      [v12 setObject:v13 forKey:v10];
    }
    if ([v11 count]) {
      [(SBSAPreferencesMutator *)self addMilestones:v11 forPropertyIdentity:v10];
    }
  }
}

- (void)setAnimatedTransitionDescription:(id)a3 forProperty:(id)a4 withMilestones:(id)a5
{
}

- (SBSAPreferencesMutator)initWithPreferences:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAPreferencesMutator;
  v6 = [(SBSAPreferencesMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preferences, a3);
  }

  return v7;
}

- (void)setContainerViewDescriptions:(id)a3
{
}

- (void)setBackgroundBlurDescription:(id)a3
{
}

- (void)associateAnimatedTransitionDescriptionOfProperty:(id)a3 withProperty:(id)a4 withMilestones:(id)a5
{
}

- (void)associateAnimatedTransitionDescriptionOfProperty:(id)a3 overridingExistingUnanimatedSettings:(BOOL)a4 withProperty:(id)a5 withMilestones:(id)a6
{
  BOOL v8 = a4;
  id v19 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v19 && v11)
  {
    id v13 = [(SBSAPreferences *)self->_preferences _interfaceElementPropertiesToBehaviorSettings];
    id v14 = [v13 objectForKey:v19];
    if (objc_opt_respondsToSelector())
    {
      while ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (BSEqualObjects())
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"SBSAPreferences.m" lineNumber:531 description:@"Attempting to associate animated transition description with another causing cycle."];

          goto LABEL_22;
        }
        v15 = [v13 objectForKey:v14];

        id v14 = v15;
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    v15 = v14;
LABEL_9:
    if ([(SBSAPreferences *)self->_preferences _doesUnanimatedTransitionDescriptionExistForProperty:v11])
    {
      BOOL v16 = !v8;
    }
    else
    {
      BOOL v16 = 0;
    }
    if (!v16) {
      [v13 setObject:v19 forKey:v11];
    }
    uint64_t v17 = objc_opt_class();
    id v14 = v15;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v17 = (uint64_t)v14;
      }
      else {
        uint64_t v17 = 0;
      }
    }

    if ([v12 count] && v17) {
      [(SBSAPreferencesMutator *)self addMilestones:v12 forPropertyIdentity:v11];
    }
LABEL_22:
  }
}

- (void)setElementDescriptions:(id)a3
{
}

- (void)setLastChangingElementLayoutTransition:(id)a3
{
}

- (void)setHighLevelCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  preferences = self->_preferences;
  SBSystemApertureContainerRenderingConfiguration v4 = *a3;
  [(SBSAPreferences *)preferences _setHighLevelCurtainRenderingConfiguration:&v4];
}

- (void)setElementLayoutTransition:(id)a3
{
}

- (void)setCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  preferences = self->_preferences;
  SBSystemApertureContainerRenderingConfiguration v4 = *a3;
  [(SBSAPreferences *)preferences _setCurtainRenderingConfiguration:&v4];
}

- (NSArray)gestureDescriptions
{
  return [(SBSAPreferences *)self->_preferences gestureDescriptions];
}

- (void)setGestureDescriptions:(id)a3
{
}

- (NSArray)timerDescriptions
{
  return [(SBSAPreferences *)self->_preferences timerDescriptions];
}

- (void)setTimerDescriptions:(id)a3
{
}

- (NSArray)actions
{
  return [(SBSAPreferences *)self->_preferences actions];
}

- (void)setActions:(id)a3
{
}

- (SBSAViewDescription)containerParentViewDescription
{
  return [(SBSAPreferences *)self->_preferences containerParentViewDescription];
}

- (void)setContainerParentViewDescription:(id)a3
{
}

- (NSArray)containerViewDescriptions
{
  return [(SBSAPreferences *)self->_preferences containerViewDescriptions];
}

- (NSArray)elementDescriptions
{
  return [(SBSAPreferences *)self->_preferences elementDescriptions];
}

- (SBSAElementLayoutTransition)elementLayoutTransition
{
  return [(SBSAPreferences *)self->_preferences elementLayoutTransition];
}

- (SBSAElementLayoutTransition)lastChangingElementLayoutTransition
{
  return [(SBSAPreferences *)self->_preferences lastChangingElementLayoutTransition];
}

- (SBSABackgroundBlurDescription)backgroundBlurDescription
{
  return [(SBSAPreferences *)self->_preferences backgroundBlurDescription];
}

- (SBSystemApertureContainerRenderingConfiguration)curtainRenderingConfiguration
{
  result = (SBSystemApertureContainerRenderingConfiguration *)self->_preferences;
  if (result) {
    return (SBSystemApertureContainerRenderingConfiguration *)[(SBSystemApertureContainerRenderingConfiguration *)result curtainRenderingConfiguration];
  }
  retstr->renderingStyle = 0;
  retstr->cloningStyle = 0;
  *(void *)&retstr->alwaysRenderInSnapshots = 0;
  return result;
}

- (SBSystemApertureContainerRenderingConfiguration)highLevelCurtainRenderingConfiguration
{
  result = (SBSystemApertureContainerRenderingConfiguration *)self->_preferences;
  if (result) {
    return (SBSystemApertureContainerRenderingConfiguration *)[(SBSystemApertureContainerRenderingConfiguration *)result highLevelCurtainRenderingConfiguration];
  }
  retstr->renderingStyle = 0;
  retstr->cloningStyle = 0;
  *(void *)&retstr->alwaysRenderInSnapshots = 0;
  return result;
}

- (BOOL)isBlobEnabled
{
  return [(SBSAPreferences *)self->_preferences isBlobEnabled];
}

- (void)setBlobEnabled:(BOOL)a3
{
}

- (BOOL)isCollisionImminent
{
  return [(SBSAPreferences *)self->_preferences isCollisionImminent];
}

- (void)setCollisionImminent:(BOOL)a3
{
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; preferences: %@>",
                       objc_opt_class(),
                       self,
                       self->_preferences);
}

- (id)propertiesWithAnimatedTransitionDescriptions
{
  return [(SBSAPreferences *)self->_preferences propertiesWithAnimatedTransitionDescriptions];
}

- (id)effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:(id)a3
{
  return [(SBSAPreferences *)self->_preferences effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:a3];
}

- (id)animatedTransitionDescriptionForProperty:(id)a3
{
  return [(SBSAPreferences *)self->_preferences animatedTransitionDescriptionForProperty:a3];
}

- (id)effectiveAnimatedTransitionDescriptionForProperty:(id)a3
{
  return [(SBSAPreferences *)self->_preferences effectiveAnimatedTransitionDescriptionForProperty:a3];
}

- (void)addMilestones:(id)a3 forPropertyIdentity:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 count];
  if (v6 && v7)
  {
    id v8 = [(SBSAPreferences *)self->_preferences _interfaceElementPropertiesToMilestones];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(SBSAPreferences *)self->_preferences _setInterfaceElementPropertiesToMilestones:v8];
    }
    id v9 = [v8 objectForKey:v6];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [v8 setObject:v9 forKey:v6];
    }
    [v9 unionSet:v10];
  }
}

- (SBSAPreferences)preferences
{
  return self->_preferences;
}

@end