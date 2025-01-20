@interface SBSAAnimatedTransitionResultDescriptionMutator
- (BOOL)finished;
- (BOOL)isTransitionEndTargeted;
- (BOOL)retargeted;
- (NSUUID)animatedTransitionIdentifier;
- (SBSAAnimatedTransitionResultDescription)animatedTransitionResultDescription;
- (SBSAAnimatedTransitionResultDescriptionMutator)initWithAnimatedTransitionResultDescription:(id)a3;
- (SBSAInterfaceElementPropertyIdentifying)associatedInterfaceElementPropertyIdentity;
- (double)targetedMilestone;
- (id)description;
- (void)setAnimatedTransitionIdentifier:(id)a3;
- (void)setAssociatedInterfaceElementPropertyIdentity:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setRetargeted:(BOOL)a3;
- (void)setTargetedMilestone:(double)a3;
- (void)setTransitionEndTargeted:(BOOL)a3;
@end

@implementation SBSAAnimatedTransitionResultDescriptionMutator

- (SBSAAnimatedTransitionResultDescriptionMutator)initWithAnimatedTransitionResultDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAAnimatedTransitionResultDescriptionMutator;
  v6 = [(SBSAAnimatedTransitionResultDescriptionMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animatedTransitionResultDescription, a3);
  }

  return v7;
}

- (NSUUID)animatedTransitionIdentifier
{
  return [(SBSAAnimatedTransitionResultDescription *)self->_animatedTransitionResultDescription animatedTransitionIdentifier];
}

- (void)setAnimatedTransitionIdentifier:(id)a3
{
}

- (SBSAInterfaceElementPropertyIdentifying)associatedInterfaceElementPropertyIdentity
{
  return [(SBSAAnimatedTransitionResultDescription *)self->_animatedTransitionResultDescription associatedInterfaceElementPropertyIdentity];
}

- (void)setAssociatedInterfaceElementPropertyIdentity:(id)a3
{
}

- (double)targetedMilestone
{
  [(SBSAAnimatedTransitionResultDescription *)self->_animatedTransitionResultDescription targetedMilestone];
  return result;
}

- (void)setTargetedMilestone:(double)a3
{
  if (a3 != 1.79769313e308 && (a3 < 0.0 || a3 > 1.0))
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSAAnimatedTransitionDescription.m", 396, @"Invalid parameter not satisfying: %@", @"(targetedMilestone == CGFLOAT_MAX) || ((0 <= targetedMilestone) && (targetedMilestone <= 1.0))" object file lineNumber description];
  }
  animatedTransitionResultDescription = self->_animatedTransitionResultDescription;
  [(SBSAAnimatedTransitionResultDescription *)animatedTransitionResultDescription _setTargetedMilestone:a3];
}

- (BOOL)isTransitionEndTargeted
{
  return [(SBSAAnimatedTransitionResultDescription *)self->_animatedTransitionResultDescription isTransitionEndTargeted];
}

- (void)setTransitionEndTargeted:(BOOL)a3
{
}

- (BOOL)finished
{
  return [(SBSAAnimatedTransitionResultDescription *)self->_animatedTransitionResultDescription finished];
}

- (void)setFinished:(BOOL)a3
{
}

- (BOOL)retargeted
{
  return [(SBSAAnimatedTransitionResultDescription *)self->_animatedTransitionResultDescription retargeted];
}

- (void)setRetargeted:(BOOL)a3
{
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; animatedTransitionDescription: %@>",
               objc_opt_class(),
               self,
               self->_animatedTransitionResultDescription);
}

- (SBSAAnimatedTransitionResultDescription)animatedTransitionResultDescription
{
  return self->_animatedTransitionResultDescription;
}

- (void).cxx_destruct
{
}

@end