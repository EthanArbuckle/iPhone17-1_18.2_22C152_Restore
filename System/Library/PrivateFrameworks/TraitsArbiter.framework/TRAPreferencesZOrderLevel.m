@interface TRAPreferencesZOrderLevel
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToZOrderLevelPreferences:(id)a3;
- (TRAPreferencesZOrderLevel)init;
- (TRAPreferencesZOrderLevel)initWithPreferredZOrderLevel:(double)a3;
- (TRAPreferencesZOrderLevel)initWithZOrderLevelPreferences:(id)a3;
- (double)preferredZOrderLevel;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setPreferredZOrderLevel:(double)a3;
@end

@implementation TRAPreferencesZOrderLevel

- (BOOL)isEqualToZOrderLevelPreferences:(id)a3
{
  v5 = (TRAPreferencesZOrderLevel *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"TRAPreferences.m", 58, @"Invalid parameter not satisfying: %@", @"preferences == nil || [preferences isKindOfClass:[TRAPreferencesZOrderLevel class]]" object file lineNumber description];
    }
    if (self == v5)
    {
      char v6 = 1;
    }
    else
    {
      [(TRAPreferencesZOrderLevel *)v5 preferredZOrderLevel];
      char v6 = BSFloatEqualToFloat();
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (TRAPreferencesZOrderLevel)initWithZOrderLevelPreferences:(id)a3
{
  [a3 preferredZOrderLevel];
  return -[TRAPreferencesZOrderLevel initWithPreferredZOrderLevel:](self, "initWithPreferredZOrderLevel:");
}

- (double)preferredZOrderLevel
{
  return self->_preferredZOrderLevel;
}

- (TRAPreferencesZOrderLevel)initWithPreferredZOrderLevel:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRAPreferencesZOrderLevel;
  result = [(TRAPreferencesZOrderLevel *)&v5 init];
  if (result) {
    result->_preferredZOrderLevel = a3;
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TRAMutablePreferencesZOrderLevel allocWithZone:a3];
  return [(TRAPreferencesZOrderLevel *)v4 initWithZOrderLevelPreferences:self];
}

- (TRAPreferencesZOrderLevel)init
{
  return [(TRAPreferencesZOrderLevel *)self initWithZOrderLevelPreferences:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRAPreferencesZOrderLevel *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRAPreferencesZOrderLevel *)self isEqualToZOrderLevelPreferences:v4];
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRAPreferencesZOrderLevel *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = v3;
  if (self->_preferredZOrderLevel == 1.79769313e308) {
    [v3 appendString:@"max" withName:@"preferred"];
  }
  else {
    id v5 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", @"preferred", 1);
  }
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAPreferencesZOrderLevel *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (void)setPreferredZOrderLevel:(double)a3
{
  self->_preferredZOrderLevel = a3;
}

@end