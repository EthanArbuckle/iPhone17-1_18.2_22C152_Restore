@interface XBStatusBarSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isBackgroundActivityEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (NSString)description;
- (XBStatusBarSettings)init;
- (XBStatusBarSettings)initWithCoder:(id)a3;
- (id)_initWithBSSettings:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)style;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XBStatusBarSettings

- (void)encodeWithCoder:(id)a3
{
  settings = self->_settings;
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[BSMutableSettings flagForSetting:](settings, "flagForSetting:", 1), @"hidden");
  v5 = [(BSMutableSettings *)self->_settings objectForSetting:2];
  [v6 encodeObject:v5 forKey:@"style"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[BSMutableSettings flagForSetting:](self->_settings, "flagForSetting:", 3), @"isBackgroundActivityEnabled");
}

- (BOOL)isHidden
{
  return [(BSMutableSettings *)self->_settings BOOLForSetting:1];
}

- (int64_t)style
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:2];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (XBStatusBarSettings)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F3F6B0]);
  int64_t v4 = [(XBStatusBarSettings *)self _initWithBSSettings:v3];

  return v4;
}

- (id)_initWithBSSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XBStatusBarSettings;
  v5 = [(XBStatusBarSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    settings = v5->_settings;
    v5->_settings = (BSMutableSettings *)v6;

    [(BSMutableSettings *)v5->_settings setDescriptionProvider:v5];
  }

  return v5;
}

- (void)dealloc
{
  [(BSMutableSettings *)self->_settings setDescriptionProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)XBStatusBarSettings;
  [(XBStatusBarSettings *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[XBStatusBarSettings isHidden](self, "isHidden"), @"hidden");
  v5 = objc_msgSend(MEMORY[0x263F1C408], "stringForStatusBarStyle:", -[XBStatusBarSettings style](self, "style"));
  id v6 = (id)[v3 appendObject:v5 withName:@"style"];

  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[XBStatusBarSettings isBackgroundActivityEnabled](self, "isBackgroundActivityEnabled"), @"backgroundActivityEnabled");
  v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)isBackgroundActivityEnabled
{
  return [(BSMutableSettings *)self->_settings BOOLForSetting:3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (XBStatusBarSettings *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (BOOL v5 = [(XBStatusBarSettings *)self isHidden], v5 == [(XBStatusBarSettings *)v4 isHidden])
      && (BOOL v6 = [(XBStatusBarSettings *)self isBackgroundActivityEnabled],
          v6 == [(XBStatusBarSettings *)v4 isBackgroundActivityEnabled])
      && (int64_t v7 = [(XBStatusBarSettings *)self style], v7 == [(XBStatusBarSettings *)v4 style]))
    {
      char v8 = [(BSMutableSettings *)self->_settings isEqual:v4->_settings];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x263F3F670] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[XBStatusBarSettings isHidden](self, "isHidden"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[XBStatusBarSettings isBackgroundActivityEnabled](self, "isBackgroundActivityEnabled"));
  id v6 = (id)objc_msgSend(v3, "appendInteger:", -[XBStatusBarSettings style](self, "style"));
  id v7 = (id)[v3 appendObject:self->_settings];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [XBMutableStatusBarSettings alloc];
  settings = self->_settings;
  return [(XBStatusBarSettings *)v4 _initWithBSSettings:settings];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return off_2646A6550[a3 - 1];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  id v7 = v6;
  switch(a5)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      uint64_t v8 = objc_msgSend(MEMORY[0x263F1C408], "stringForStatusBarStyle:", objc_msgSend(v6, "integerValue"));
      goto LABEL_6;
    case 1uLL:
LABEL_4:
      uint64_t v8 = BSSettingFlagDescription();
LABEL_6:
      objc_super v9 = (void *)v8;
      goto LABEL_8;
  }
  objc_super v9 = 0;
LABEL_8:

  return v9;
}

- (XBStatusBarSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(XBStatusBarSettings *)self init];
  id v6 = v5;
  if (v5)
  {
    -[BSMutableSettings setFlag:forSetting:](v5->_settings, "setFlag:forSetting:", [v4 decodeIntegerForKey:@"hidden"], 1);
    settings = v6->_settings;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"style"];
    [(BSMutableSettings *)settings setObject:v8 forSetting:2];

    -[BSMutableSettings setFlag:forSetting:](v6->_settings, "setFlag:forSetting:", [v4 decodeIntegerForKey:@"isBackgroundActivityEnabled"], 3);
  }

  return v6;
}

@end