@interface SBSUserNotificationColorDefinition
+ (SBSUserNotificationColorDefinition)definitionWithColor:(id)a3;
+ (SBSUserNotificationColorDefinition)definitionWithColorName:(id)a3;
- (BSColor)color;
- (NSString)colorName;
- (id)_colorForString:(id)a3;
- (id)_initWithColorName:(id)a3 color:(id)a4;
- (id)_initWithDictionary:(id)a3;
- (id)_stringForColor:(id)a3;
- (id)build;
@end

@implementation SBSUserNotificationColorDefinition

+ (SBSUserNotificationColorDefinition)definitionWithColorName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithColorName:v4 color:0];

  return (SBSUserNotificationColorDefinition *)v5;
}

+ (SBSUserNotificationColorDefinition)definitionWithColor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithColorName:0 color:v4];

  return (SBSUserNotificationColorDefinition *)v5;
}

- (id)_initWithColorName:(id)a3 color:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSCFUserNotificationColorDefinition.m", 30, @"Invalid parameter not satisfying: %@", @"colorName || color" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBSUserNotificationColorDefinition;
  v10 = [(SBSUserNotificationColorDefinition *)&v14 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_colorName, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSUserNotificationColorDefinition;
  v5 = [(SBSUserNotificationColorDefinition *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 bs_safeStringForKey:@"SBSCFUNColorName"];
    colorName = v5->_colorName;
    v5->_colorName = (NSString *)v6;

    unint64_t v8 = [v4 bs_safeStringForKey:@"SBSCFUNColor"];
    uint64_t v9 = [(SBSUserNotificationColorDefinition *)v5 _colorForString:v8];
    color = v5->_color;
    v5->_color = (BSColor *)v9;
  }
  return v5;
}

- (id)build
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  colorName = self->_colorName;
  if (colorName) {
    [v3 setObject:colorName forKey:@"SBSCFUNColorName"];
  }
  if (self->_color)
  {
    uint64_t v6 = -[SBSUserNotificationColorDefinition _stringForColor:](self, "_stringForColor:");
    [v4 setObject:v6 forKey:@"SBSCFUNColor"];
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)_stringForColor:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  [v4 red];
  uint64_t v6 = v5;
  [v4 green];
  uint64_t v8 = v7;
  [v4 blue];
  uint64_t v10 = v9;
  [v4 alpha];
  uint64_t v12 = v11;

  return [v3 stringWithFormat:@"%f:%f:%f:%f", v6, v8, v10, v12];
}

- (id)_colorForString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 componentsSeparatedByString:@":"];
    if ([v5 count] == 4)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F4F6E0];
      uint64_t v7 = [v5 objectAtIndexedSubscript:0];
      [v7 floatValue];
      double v9 = v8;
      uint64_t v10 = [v5 objectAtIndexedSubscript:1];
      [v10 floatValue];
      double v12 = v11;
      v13 = [v5 objectAtIndexedSubscript:2];
      [v13 floatValue];
      double v15 = v14;
      v16 = [v5 objectAtIndexedSubscript:3];
      [v16 floatValue];
      v18 = [v6 colorWithRed:v9 green:v12 blue:v15 alpha:v17];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BSColor)color
{
  return self->_color;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end