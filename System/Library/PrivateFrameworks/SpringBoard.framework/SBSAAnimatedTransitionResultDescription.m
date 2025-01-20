@interface SBSAAnimatedTransitionResultDescription
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)finished;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransitionEndTargeted;
- (BOOL)retargeted;
- (NSString)description;
- (NSUUID)animatedTransitionIdentifier;
- (SBSAAnimatedTransitionResultDescription)initWithAnimatedTransitionResultDescription:(id)a3;
- (SBSAInterfaceElementPropertyIdentifying)associatedInterfaceElementPropertyIdentity;
- (double)targetedMilestone;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setAnimatedTransitionIdentifier:(id)a3;
- (void)_setAssociatedInterfaceElementPropertyIdentityIdentity:(id)a3;
- (void)_setFinished:(BOOL)a3;
- (void)_setRetargeted:(BOOL)a3;
- (void)_setTargetedMilestone:(double)a3;
- (void)_setTransitionEndTargeted:(BOOL)a3;
@end

@implementation SBSAAnimatedTransitionResultDescription

- (SBSAAnimatedTransitionResultDescription)initWithAnimatedTransitionResultDescription:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSAAnimatedTransitionResultDescription;
  v5 = [(SBSAAnimatedTransitionResultDescription *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 animatedTransitionIdentifier];
    animatedTransitionIdentifier = v5->_animatedTransitionIdentifier;
    v5->_animatedTransitionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 associatedInterfaceElementPropertyIdentity];
    associatedInterfaceElementPropertyIdentity = v5->_associatedInterfaceElementPropertyIdentity;
    v5->_associatedInterfaceElementPropertyIdentity = (SBSAInterfaceElementPropertyIdentifying *)v8;

    [v4 targetedMilestone];
    v5->_targetedMilestone = v10;
    v5->_transitionEndTargeted = [v4 isTransitionEndTargeted];
    v5->_finished = [v4 finished];
    v5->_retargeted = [v4 retargeted];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  animatedTransitionIdentifier = self->_animatedTransitionIdentifier;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke;
  v35[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v36 = v7;
  uint64_t v8 = [v5 appendObject:animatedTransitionIdentifier counterpart:v35];
  associatedInterfaceElementPropertyIdentity = self->_associatedInterfaceElementPropertyIdentity;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_2;
  v33[3] = &unk_1E6AF9E90;
  id v10 = v7;
  id v34 = v10;
  v11 = [v8 appendObject:associatedInterfaceElementPropertyIdentity counterpart:v33];
  double targetedMilestone = self->_targetedMilestone;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_3;
  v31[3] = &unk_1E6AFD028;
  id v13 = v10;
  id v32 = v13;
  v14 = [v11 appendCGFloat:v31 counterpart:targetedMilestone];
  BOOL transitionEndTargeted = self->_transitionEndTargeted;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_4;
  v29[3] = &unk_1E6AF99E8;
  id v16 = v13;
  id v30 = v16;
  v17 = [v14 appendBool:transitionEndTargeted counterpart:v29];
  BOOL finished = self->_finished;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_5;
  v27[3] = &unk_1E6AF99E8;
  id v19 = v16;
  id v28 = v19;
  v20 = [v17 appendBool:finished counterpart:v27];
  uint64_t retargeted = self->_retargeted;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_6;
  v25[3] = &unk_1E6AF99E8;
  id v26 = v19;
  id v22 = v19;
  v23 = [v20 appendBool:retargeted counterpart:v25];
  LOBYTE(retargeted) = [v23 isEqual];

  return retargeted;
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animatedTransitionIdentifier];
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) associatedInterfaceElementPropertyIdentity];
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) targetedMilestone];
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) isTransitionEndTargeted];
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finished];
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) retargeted];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_animatedTransitionIdentifier];
  v5 = [v4 appendObject:self->_associatedInterfaceElementPropertyIdentity];
  uint64_t v6 = [v5 appendCGFloat:self->_targetedMilestone];
  id v7 = [v6 appendBool:self->_transitionEndTargeted];
  uint64_t v8 = [v7 appendBool:self->_finished];
  v9 = [v8 appendBool:self->_retargeted];
  unint64_t v10 = [v9 hash];

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  animatedTransitionIdentifier = self->_animatedTransitionIdentifier;
  associatedInterfaceElementPropertyIdentity = self->_associatedInterfaceElementPropertyIdentity;
  BOOL transitionEndTargeted = self->_transitionEndTargeted;
  if (self->_transitionEndTargeted)
  {
    uint64_t v8 = @"transition end";
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithDouble:self->_targetedMilestone];
  }
  v9 = NSStringFromBOOL();
  unint64_t v10 = NSStringFromBOOL();
  v11 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; animatedTransitionIdentifier: %@; associatedInterfaceElementPropertyIdentity: %@; targetedMilestone: %@, transitionEndTargeted: %@; finished: %@; retargeted: %@>",
    v4,
    self,
    animatedTransitionIdentifier,
    associatedInterfaceElementPropertyIdentity,
    v8,
    v9,
    v10,
  objc_super v12 = v11);

  if (!transitionEndTargeted) {
  return (NSString *)v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithAnimatedTransitionResultDescription:self];
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = (void *)[(SBSAAnimatedTransitionResultDescription *)self copy];
  if (v4)
  {
    uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithAnimatedTransitionResultDescription:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (NSUUID)animatedTransitionIdentifier
{
  return self->_animatedTransitionIdentifier;
}

- (void)_setAnimatedTransitionIdentifier:(id)a3
{
}

- (SBSAInterfaceElementPropertyIdentifying)associatedInterfaceElementPropertyIdentity
{
  return self->_associatedInterfaceElementPropertyIdentity;
}

- (void)_setAssociatedInterfaceElementPropertyIdentityIdentity:(id)a3
{
}

- (double)targetedMilestone
{
  return self->_targetedMilestone;
}

- (void)_setTargetedMilestone:(double)a3
{
  self->_double targetedMilestone = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)_setFinished:(BOOL)a3
{
  self->_BOOL finished = a3;
}

- (BOOL)retargeted
{
  return self->_retargeted;
}

- (void)_setRetargeted:(BOOL)a3
{
  self->_uint64_t retargeted = a3;
}

- (BOOL)isTransitionEndTargeted
{
  return self->_transitionEndTargeted;
}

- (void)_setTransitionEndTargeted:(BOOL)a3
{
  self->_BOOL transitionEndTargeted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInterfaceElementPropertyIdentity, 0);
  objc_storeStrong((id *)&self->_animatedTransitionIdentifier, 0);
}

@end