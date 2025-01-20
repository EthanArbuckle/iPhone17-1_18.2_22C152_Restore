@interface _SBSADynamicPersistentAnimationAssertion
- (SAElementIdentifying)elementIdentity;
- (_SBSADynamicPersistentAnimationAssertion)initWithElementIdentity:(id)a3 animation:(int64_t)a4;
- (id)_descriptionConstituents;
- (int64_t)animationType;
- (void)setAnimationType:(int64_t)a3;
- (void)setElementIdentity:(id)a3;
@end

@implementation _SBSADynamicPersistentAnimationAssertion

- (_SBSADynamicPersistentAnimationAssertion)initWithElementIdentity:(id)a3 animation:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBSystemApertureViewController.m", 4331, @"Invalid parameter not satisfying: %@", @"elementIdentity" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_SBSADynamicPersistentAnimationAssertion;
  v8 = [(SAAssertion *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copyWithZone:0];
    elementIdentity = v8->_elementIdentity;
    v8->_elementIdentity = (SAElementIdentifying *)v9;

    v8->_animationType = a4;
  }

  return v8;
}

- (id)_descriptionConstituents
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_SBSADynamicPersistentAnimationAssertion;
  v3 = [(SAAssertion *)&v11 _descriptionConstituents];
  v14 = @"elementIdentity";
  v4 = [(SAElementIdentifying *)self->_elementIdentity description];
  v15[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v6 = [v3 arrayByAddingObject:v5];

  v12 = @"animationType";
  id v7 = SBStringFromSBSADynamicPersistentAnimation(self->_animationType);
  objc_super v13 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = [v6 arrayByAddingObject:v8];

  return v9;
}

- (SAElementIdentifying)elementIdentity
{
  return self->_elementIdentity;
}

- (void)setElementIdentity:(id)a3
{
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (void).cxx_destruct
{
}

@end