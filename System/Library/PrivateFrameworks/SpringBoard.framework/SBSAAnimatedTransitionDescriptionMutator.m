@interface SBSAAnimatedTransitionDescriptionMutator
- (NSSet)milestones;
- (NSString)responsibleProviderDebugString;
- (NSUUID)animatedTransitionIdentifier;
- (SBFFluidBehaviorSettings)behaviorSettings;
- (SBSAAnimatedTransitionDescription)animatedTransitionDescription;
- (SBSAAnimatedTransitionDescriptionMutator)initWithAnimatedTransitionDescription:(id)a3;
- (id)auxillaryBehaviorSettingsForKeyPath:(id)a3;
- (id)description;
- (id)keyPathsWithAuxillaryBehaviorSettings;
- (void)setAnimatedTransitionIdentifier:(id)a3;
- (void)setAuxillaryBehaviorSettings:(id)a3 forKeyPath:(id)a4;
- (void)setBehaviorSettings:(id)a3;
- (void)setMilestones:(id)a3;
- (void)setResponsibleProviderDebugString:(id)a3;
@end

@implementation SBSAAnimatedTransitionDescriptionMutator

- (void).cxx_destruct
{
}

- (SBSAAnimatedTransitionDescriptionMutator)initWithAnimatedTransitionDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAAnimatedTransitionDescriptionMutator;
  v6 = [(SBSAAnimatedTransitionDescriptionMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animatedTransitionDescription, a3);
  }

  return v7;
}

- (void)setMilestones:(id)a3
{
}

- (void)setResponsibleProviderDebugString:(id)a3
{
}

- (void)setAnimatedTransitionIdentifier:(id)a3
{
}

- (void)setBehaviorSettings:(id)a3
{
}

- (NSUUID)animatedTransitionIdentifier
{
  return [(SBSAAnimatedTransitionDescription *)self->_animatedTransitionDescription animatedTransitionIdentifier];
}

- (SBFFluidBehaviorSettings)behaviorSettings
{
  return [(SBSAAnimatedTransitionDescription *)self->_animatedTransitionDescription behaviorSettings];
}

- (NSString)responsibleProviderDebugString
{
  return [(SBSAAnimatedTransitionDescription *)self->_animatedTransitionDescription responsibleProviderDebugString];
}

- (NSSet)milestones
{
  return [(SBSAAnimatedTransitionDescription *)self->_animatedTransitionDescription milestones];
}

- (id)keyPathsWithAuxillaryBehaviorSettings
{
  return [(SBSAAnimatedTransitionDescription *)self->_animatedTransitionDescription keyPathsWithAuxillaryBehaviorSettings];
}

- (void)setAuxillaryBehaviorSettings:(id)a3 forKeyPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(SBSAAnimatedTransitionDescription *)self->_animatedTransitionDescription keyPathsToAuxillaryBehaviorSettingsMap];
  id v8 = v11;
  objc_super v9 = v7;
  if (v11)
  {
    if (!v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      id v8 = v11;
      objc_super v9 = (void *)v10;
    }
    [v9 setObject:v8 forKey:v6];
  }
  else
  {
    [v7 removeObjectForKey:v6];
    if (![v9 count])
    {

      objc_super v9 = 0;
    }
  }
  [(SBSAAnimatedTransitionDescription *)self->_animatedTransitionDescription _setKeyPathsToAuxillaryBehaviorSettingsMap:v9];
}

- (id)auxillaryBehaviorSettingsForKeyPath:(id)a3
{
  animatedTransitionDescription = self->_animatedTransitionDescription;
  id v4 = a3;
  id v5 = [(SBSAAnimatedTransitionDescription *)animatedTransitionDescription keyPathsToAuxillaryBehaviorSettingsMap];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; animatedTransitionDescription: %@>",
               objc_opt_class(),
               self,
               self->_animatedTransitionDescription);
}

- (SBSAAnimatedTransitionDescription)animatedTransitionDescription
{
  return self->_animatedTransitionDescription;
}

@end