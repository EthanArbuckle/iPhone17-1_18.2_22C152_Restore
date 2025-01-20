@interface TRASettingsZOrderLevel
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToZOrderLevelSettings:(id)a3;
- (TRASettingsZOrderLevel)init;
- (TRASettingsZOrderLevel)initWithZOrderLevel:(double)a3;
- (TRASettingsZOrderLevel)initWithZOrderLevelSettings:(id)a3;
- (double)zOrderLevel;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setZOrderLevel:(double)a3;
@end

@implementation TRASettingsZOrderLevel

- (double)zOrderLevel
{
  return self->_zOrderLevel;
}

- (TRASettingsZOrderLevel)initWithZOrderLevel:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRASettingsZOrderLevel;
  result = [(TRASettingsZOrderLevel *)&v5 init];
  if (result) {
    result->_zOrderLevel = a3;
  }
  return result;
}

- (TRASettingsZOrderLevel)init
{
  return [(TRASettingsZOrderLevel *)self initWithZOrderLevel:0.0];
}

- (TRASettingsZOrderLevel)initWithZOrderLevelSettings:(id)a3
{
  [a3 zOrderLevel];
  return -[TRASettingsZOrderLevel initWithZOrderLevel:](self, "initWithZOrderLevel:");
}

- (BOOL)isEqualToZOrderLevelSettings:(id)a3
{
  objc_super v5 = (TRASettingsZOrderLevel *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"TRASettings.m", 179, @"Invalid parameter not satisfying: %@", @"zOrderLevelSettings == nil || [zOrderLevelSettings isKindOfClass:[TRASettingsZOrderLevel class]]" object file lineNumber description];
    }
    if (self == v5)
    {
      char v6 = 1;
    }
    else
    {
      [(TRASettingsZOrderLevel *)v5 zOrderLevel];
      char v6 = BSFloatEqualToFloat();
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TRAMutableSettingsZOrderLevel allocWithZone:a3];
  return [(TRASettingsZOrderLevel *)v4 initWithZOrderLevelSettings:self];
}

- (id)description
{
  double zOrderLevel = self->_zOrderLevel;
  if (zOrderLevel == 1.79769313e308)
  {
    v3 = @"z-order: max";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"z-order: %.1f", *(void *)&zOrderLevel);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRASettingsZOrderLevel *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRASettingsZOrderLevel *)self isEqualToZOrderLevelSettings:v4];
  }

  return v5;
}

- (void)setZOrderLevel:(double)a3
{
  self->_double zOrderLevel = a3;
}

@end