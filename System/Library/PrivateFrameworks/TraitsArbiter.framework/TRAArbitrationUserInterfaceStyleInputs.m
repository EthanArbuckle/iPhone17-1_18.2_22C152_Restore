@interface TRAArbitrationUserInterfaceStyleInputs
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserInterfaceStyleInputs:(id)a3;
- (TRAArbitrationUserInterfaceStyleInputs)initWithUserInterfaceStyle:(int64_t)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)userInterfaceStyle;
@end

@implementation TRAArbitrationUserInterfaceStyleInputs

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRAArbitrationUserInterfaceStyleInputs *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRAArbitrationUserInterfaceStyleInputs *)self isEqualToUserInterfaceStyleInputs:v4];
  }

  return v5;
}

- (TRAArbitrationUserInterfaceStyleInputs)initWithUserInterfaceStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRAArbitrationUserInterfaceStyleInputs;
  result = [(TRAArbitrationUserInterfaceStyleInputs *)&v5 init];
  if (result) {
    result->_userInterfaceStyle = a3;
  }
  return result;
}

- (BOOL)isEqualToUserInterfaceStyleInputs:(id)a3
{
  objc_super v5 = (TRAArbitrationUserInterfaceStyleInputs *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"TRAArbitration.m", 738, @"Invalid parameter not satisfying: %@", @"inputs == nil || [inputs isKindOfClass:[TRAArbitrationUserInterfaceStyleInputs class]]" object file lineNumber description];
    }
    if (self == v5)
    {
      BOOL v7 = 1;
    }
    else
    {
      int64_t userInterfaceStyle = self->_userInterfaceStyle;
      BOOL v7 = userInterfaceStyle == [(TRAArbitrationUserInterfaceStyleInputs *)v5 userInterfaceStyle];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationUserInterfaceStyleInputs *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInteger:self->_userInterfaceStyle withName:@"userInterfaceStyle"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAArbitrationUserInterfaceStyleInputs *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end