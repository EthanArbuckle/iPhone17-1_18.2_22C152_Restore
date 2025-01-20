@interface SBSystemApertureDynamicsTestRecipe
- (id)_dynamicsDescriptions;
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBSystemApertureDynamicsTestRecipe

- (id)title
{
  return @"Jindo Dynamics";
}

- (void)handleVolumeIncrease
{
  id v14 = [(id)SBApp systemApertureControllerForMainDisplay];
  v3 = [(SBSystemApertureDynamicsTestRecipe *)self _dynamicsDescriptions];
  v4 = [v3 objectAtIndex:self->_activeDynamics];

  v5 = [v4 objectForKey:@"type"];
  int v6 = BSEqualObjects();

  v7 = [v4 objectForKey:@"animation"];
  uint64_t v8 = [v7 integerValue];

  if (v6)
  {
    animationAssertion = self->_animationAssertion;
    if (animationAssertion)
    {
      [(SAInvalidatable *)animationAssertion invalidateWithReason:@"test recipe button press"];
      v10 = self->_animationAssertion;
      self->_animationAssertion = 0;
    }
    else
    {
      v10 = [v14 _currentFirstElement];
      v12 = [v14 applyPersistentAnimationStyle:v8 toElement:v10];
      v13 = self->_animationAssertion;
      self->_animationAssertion = v12;
    }
  }
  else
  {
    v10 = [v14 _currentFirstElement];
    if (v10) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v8 == 1;
    }
    if (!v11) {
      [v14 animateDiscreteAnimationStyle:v8 toElement:v10];
    }
  }
}

- (void)handleVolumeDecrease
{
  [(SAInvalidatable *)self->_animationAssertion invalidateWithReason:@"test recipe switching to new animation"];
  animationAssertion = self->_animationAssertion;
  self->_animationAssertion = 0;

  unint64_t v4 = self->_activeDynamics + 1;
  id v5 = [(SBSystemApertureDynamicsTestRecipe *)self _dynamicsDescriptions];
  self->_activeDynamics = v4 % [v5 count];
}

- (id)_dynamicsDescriptions
{
  v17[2] = *MEMORY[0x1E4F143B8];
  dynamicsDescriptions = self->_dynamicsDescriptions;
  if (!dynamicsDescriptions)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 1; i != 5; ++i)
    {
      v16[1] = @"animation";
      v17[0] = @"discrete";
      v16[0] = @"type";
      int v6 = [NSNumber numberWithUnsignedInteger:i];
      v17[1] = v6;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      [v4 addObject:v7];
    }
    for (uint64_t j = 1; j != 3; ++j)
    {
      v14[1] = @"animation";
      v15[0] = @"persistent";
      v14[0] = @"type";
      v9 = [NSNumber numberWithUnsignedInteger:j];
      v15[1] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      [v4 addObject:v10];
    }
    BOOL v11 = (NSArray *)[v4 copy];
    v12 = self->_dynamicsDescriptions;
    self->_dynamicsDescriptions = v11;

    dynamicsDescriptions = self->_dynamicsDescriptions;
  }
  return dynamicsDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationAssertion, 0);
  objc_storeStrong((id *)&self->_dynamicsDescriptions, 0);
}

@end