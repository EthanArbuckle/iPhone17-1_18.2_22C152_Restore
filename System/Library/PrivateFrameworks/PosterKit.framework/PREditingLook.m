@interface PREditingLook
+ (PREditingLook)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)groupName;
- (PREditingLook)initWithDisplayName:(id)a3;
- (PREditingLook)initWithDisplayName:(id)a3 initialTimeFont:(id)a4 initialTitleColor:(id)a5;
- (PREditingLook)initWithDisplayName:(id)a3 initialTimeFontConfiguration:(id)a4 initialTitleColor:(id)a5;
- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4;
- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFont:(id)a5 initialTitleColor:(id)a6;
- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6;
- (PREditingLook)initWithLook:(id)a3;
- (PRPosterColor)initialTitleColor;
- (PRTimeFontConfiguration)initialTimeFontConfiguration;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)titleStyleConfigurationWithExtensionBundle:(id)a3 luminance:(double)a4 timeNumberingSystem:(id)a5;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation PREditingLook

- (NSString)groupName
{
  return (NSString *)@"PREditingLook";
}

- (id)titleStyleConfigurationWithExtensionBundle:(id)a3 luminance:(double)a4 timeNumberingSystem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(PREditingLook *)self initialTimeFontConfiguration];
  v11 = [(PREditingLook *)self initialTitleColor];
  v12 = [v10 timeFontIdentifier];
  [v10 weight];
  double v14 = v13;
  v15 = [v10 customFont];
  if (v15)
  {
    v16 = [[PRPosterCustomTimeFontConfiguration alloc] initWithFont:v15 extensionBundle:v8];
LABEL_5:
    v17 = v16;
    goto LABEL_6;
  }
  if (v12)
  {
    v16 = [[PRPosterSystemTimeFontConfiguration alloc] initWithTimeFontIdentifier:v12 weight:1 systemItem:v14];
    goto LABEL_5;
  }
  v17 = 0;
LABEL_6:
  v18 = +[PRPreferences sharedPreferences];
  char v19 = [v18 isAlternateCalendarEnabled];

  v20 = [PRPosterTitleStyleConfiguration alloc];
  v21 = [(PREditingLook *)self groupName];
  LOBYTE(v24) = v19;
  v22 = [(PRPosterTitleStyleConfiguration *)v20 initWithTimeFontConfiguration:v17 preferredTitleAlignment:0 preferredTitleLayout:0 titleColor:v11 timeNumberingSystem:v9 userConfigured:0 contentsLuminance:a4 alternateDateEnabled:v24 groupName:v21];

  return v22;
}

+ (PREditingLook)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (PREditingLook *)+[PREditingLook allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___PREditingLook;
    return (PREditingLook *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = self;
  int v15 = [(PREditingLook *)self isMemberOfClass:v14];

  if (v15)
  {
    v16 = [[PRImmutableEditingLook alloc] initWithIdentifier:v10 displayName:v11 initialTimeFontConfiguration:v12 initialTitleColor:v13];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PREditingLook;
    v16 = [(PREditingLook *)&v19 init];
    self = &v16->super;
  }
  p_super = &v16->super;

  return p_super;
}

- (PREditingLook)initWithDisplayName:(id)a3 initialTimeFontConfiguration:(id)a4 initialTitleColor:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 UUID];
  id v13 = [v12 UUIDString];
  double v14 = [(PREditingLook *)self initWithIdentifier:v13 displayName:v11 initialTimeFontConfiguration:v10 initialTitleColor:v9];

  return v14;
}

- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFont:(id)a5 initialTitleColor:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  if (v10)
  {
    double v14 = [[PRTimeFontConfiguration alloc] initWithCustomFont:v10];
    int v15 = [(PREditingLook *)self initWithIdentifier:v13 displayName:v12 initialTimeFontConfiguration:v14 initialTitleColor:v11];

    v16 = v15;
  }
  else
  {
    v17 = [(PREditingLook *)self initWithIdentifier:v13 displayName:v12 initialTimeFontConfiguration:0 initialTitleColor:v11];

    v16 = v17;
  }

  return v16;
}

- (PREditingLook)initWithDisplayName:(id)a3 initialTimeFont:(id)a4 initialTitleColor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if (v8)
  {
    id v11 = [[PRTimeFontConfiguration alloc] initWithCustomFont:v8];
    id v12 = [(PREditingLook *)self initWithDisplayName:v10 initialTimeFontConfiguration:v11 initialTitleColor:v9];

    id v13 = v12;
  }
  else
  {
    double v14 = [(PREditingLook *)self initWithDisplayName:v10 initialTimeFontConfiguration:0 initialTitleColor:v9];

    id v13 = v14;
  }

  return v13;
}

- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4
{
  return [(PREditingLook *)self initWithIdentifier:a3 displayName:a4 initialTimeFontConfiguration:0 initialTitleColor:0];
}

- (PREditingLook)initWithDisplayName:(id)a3
{
  return [(PREditingLook *)self initWithDisplayName:a3 initialTimeFontConfiguration:0 initialTitleColor:0];
}

- (PREditingLook)initWithLook:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  v6 = [v4 displayName];
  objc_super v7 = [v4 initialTimeFontConfiguration];
  id v8 = [v4 initialTitleColor];

  id v9 = [(PREditingLook *)self initWithIdentifier:v5 displayName:v6 initialTimeFontConfiguration:v7 initialTitleColor:v8];
  return v9;
}

- (PRTimeFontConfiguration)initialTimeFontConfiguration
{
  v2 = [(PREditingLook *)self initialProperties];
  v3 = [v2 timeFontConfiguration];

  return (PRTimeFontConfiguration *)v3;
}

- (PRPosterColor)initialTitleColor
{
  v2 = [(PREditingLook *)self initialProperties];
  v3 = [v2 titlePosterColor];

  return (PRPosterColor *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PREditingLook *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v7 = v4;
      id v8 = [(PREditingLook *)self identifier];
      id v9 = [(PREditingLook *)v7 identifier];
      int v10 = BSEqualObjects();

      if (v10
        && ([(PREditingLook *)self displayName],
            id v11 = objc_claimAutoreleasedReturnValue(),
            [(PREditingLook *)v7 displayName],
            id v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = BSEqualObjects(),
            v12,
            v11,
            v13))
      {
        double v14 = [(PREditingLook *)self initialProperties];
        int v15 = [(PREditingLook *)v7 initialProperties];
        char v16 = BSEqualObjects();
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = [(PREditingLook *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(PREditingLook *)self displayName];
  uint64_t v6 = [v5 hash] ^ v4;
  objc_super v7 = [(PREditingLook *)self initialProperties];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __28__PREditingLook_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __28__PREditingLook_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PREditingLook allocWithZone:a3];
  return [(PREditingLook *)v4 initWithLook:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(PREditingLook *)self identifier];
  [v8 appendString:v4 withName:@"identifier"];

  id v5 = [(PREditingLook *)self displayName];
  [v8 appendString:v5 withName:@"displayName"];

  uint64_t v6 = [(PREditingLook *)self initialProperties];
  id v7 = (id)[v8 appendObject:v6 withName:@"initialProperties"];
}

@end