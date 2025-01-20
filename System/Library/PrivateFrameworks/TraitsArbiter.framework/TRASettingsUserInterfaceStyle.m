@interface TRASettingsUserInterfaceStyle
- (BOOL)isEqualToUserInterfaceStyleSettings:(id)a3;
- (TRAArbitrationUserInterfaceStyleInputs)userInterfaceStyleInputs;
- (TRASettingsUserInterfaceStyle)init;
- (TRASettingsUserInterfaceStyle)initWithUserInterfaceStyleInputs:(id)a3;
- (TRASettingsUserInterfaceStyle)initWithUserInterfaceStyleSettings:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation TRASettingsUserInterfaceStyle

- (void).cxx_destruct
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TRAMutableSettingsUserInterfaceStyle allocWithZone:a3];
  return [(TRASettingsUserInterfaceStyle *)v4 initWithUserInterfaceStyleSettings:self];
}

- (BOOL)isEqualToUserInterfaceStyleSettings:(id)a3
{
  v5 = (TRASettingsUserInterfaceStyle *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"TRASettings.m", 592, @"Invalid parameter not satisfying: %@", @"userInterfaceStyleSettings == nil || [userInterfaceStyleSettings isKindOfClass:[TRASettingsUserInterfaceStyle class]]" object file lineNumber description];
    }
    if (self == v5)
    {
      char v8 = 1;
    }
    else
    {
      userInterfaceStyleInputs = self->_userInterfaceStyleInputs;
      v7 = [(TRASettingsUserInterfaceStyle *)v5 userInterfaceStyleInputs];
      char v8 = [(TRAArbitrationUserInterfaceStyleInputs *)userInterfaceStyleInputs isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (TRASettingsUserInterfaceStyle)initWithUserInterfaceStyleSettings:(id)a3
{
  v4 = [a3 userInterfaceStyleInputs];
  v5 = [(TRASettingsUserInterfaceStyle *)self initWithUserInterfaceStyleInputs:v4];

  return v5;
}

- (TRAArbitrationUserInterfaceStyleInputs)userInterfaceStyleInputs
{
  return self->_userInterfaceStyleInputs;
}

- (TRASettingsUserInterfaceStyle)initWithUserInterfaceStyleInputs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRASettingsUserInterfaceStyle;
  v6 = [(TRASettingsUserInterfaceStyle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userInterfaceStyleInputs, a3);
  }

  return v7;
}

- (TRASettingsUserInterfaceStyle)init
{
  return [(TRASettingsUserInterfaceStyle *)self initWithUserInterfaceStyleInputs:0];
}

- (id)description
{
  v2 = NSString;
  v3 = [(TRASettingsUserInterfaceStyle *)self userInterfaceStyleInputs];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"userInterfaceStyle: %li", objc_msgSend(v3, "userInterfaceStyle"));

  return v4;
}

@end