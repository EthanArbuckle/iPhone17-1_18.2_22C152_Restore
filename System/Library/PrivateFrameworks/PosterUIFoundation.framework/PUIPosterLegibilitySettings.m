@interface PUIPosterLegibilitySettings
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)legibilitySettingsForContentColor:(id)a3 contrast:(double)a4;
+ (id)legibilitySettingsForStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6;
+ (id)legibilitySettingsWithUILegibilitySettings:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLegibilitySettings:(id)a3;
- (NSString)description;
- (PUIPosterLegibilitySettings)initWithBSXPCCoder:(id)a3;
- (PUIPosterLegibilitySettings)initWithCoder:(id)a3;
- (PUIPosterLegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6;
- (UIColor)contentColor;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIColor)shadowColor;
- (double)contrast;
- (id)convertToUILegibility;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legibilitySettingsByApplyingShadowRadiusMultiplier:(double)a3;
- (id)legibilitySettingsByOverridingShadowAlpha:(double)a3;
- (int64_t)source;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setContrast:(double)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setShadowColor:(id)a3;
@end

@implementation PUIPosterLegibilitySettings

+ (id)legibilitySettingsWithUILegibilitySettings:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Uilegibilityse.isa);
  if (!v3)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PUIPosterLegibilitySettings legibilitySettingsWithUILegibilitySettings:]();
    }
LABEL_14:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C4AD8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:_UILegibilitySettingsClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PUIPosterLegibilitySettings legibilitySettingsWithUILegibilitySettings:]();
    }
    goto LABEL_14;
  }

  uint64_t v4 = [v3 style];
  if (v4 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4 == 1;
  }
  v6 = [PUIPosterLegibilitySettings alloc];
  v7 = [v3 primaryColor];
  v8 = [v3 secondaryColor];
  v9 = [v3 shadowColor];
  v10 = [(PUIPosterLegibilitySettings *)v6 initWithStyle:v5 primaryColor:v7 secondaryColor:v8 shadowColor:v9];

  v10->_source = 2;
  uint64_t v11 = [v3 copy];
  specifiedLegibilitySettings = v10->_specifiedLegibilitySettings;
  v10->_specifiedLegibilitySettings = (_UILegibilitySettings *)v11;

  return v10;
}

+ (id)legibilitySettingsForContentColor:(id)a3 contrast:(double)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Uicolor.isa);
  if (!v6)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PUIPosterLegibilitySettings legibilitySettingsForContentColor:contrast:]();
    }
LABEL_14:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C4CE8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UIColorClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PUIPosterLegibilitySettings legibilitySettingsForContentColor:contrast:]();
    }
    goto LABEL_14;
  }

  v7 = (void *)[objc_alloc(MEMORY[0x263F1CCD0]) initWithContentColor:v6 contrast:a4];
  uint64_t v8 = [v7 style];
  if (v8 == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v8 == 1;
  }
  v10 = [v7 primaryColor];
  uint64_t v11 = [v7 secondaryColor];
  v12 = [v7 shadowColor];
  v13 = [a1 legibilitySettingsForStyle:v9 primaryColor:v10 secondaryColor:v11 shadowColor:v12];

  [v13 setContentColor:v6];
  [v13 setContrast:a4];
  v13[6] = 1;

  return v13;
}

+ (id)legibilitySettingsForStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)[objc_alloc((Class)a1) initWithStyle:a3 primaryColor:v12 secondaryColor:v11 shadowColor:v10];

  return v13;
}

- (PUIPosterLegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3) {
      goto LABEL_10;
    }
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"style == PUIPosterLegibilityStyleNone || style == PUIPosterLegibilityStyleLightContentWithDarkShadow || style == PUIPosterLegibilityStyleDarkContentWithLightShadow"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:]();
    }
LABEL_33:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C4FC0);
  }
  id v13 = v10;
  NSClassFromString(&cfstr_Uicolor.isa);
  if (!v13)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:]();
    }
    goto LABEL_33;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UIColorClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C5024);
  }

  id v14 = v11;
  NSClassFromString(&cfstr_Uicolor.isa);
  if (!v14)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C5088);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UIColorClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C50ECLL);
  }

  id v15 = v12;
  NSClassFromString(&cfstr_Uicolor.isa);
  if (!v15)
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.4();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C5150);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UIColorClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.4();
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0C51B4);
  }

LABEL_10:
  v35.receiver = self;
  v35.super_class = (Class)PUIPosterLegibilitySettings;
  v16 = [(PUIPosterLegibilitySettings *)&v35 init];
  if (v16)
  {
    uint64_t v17 = [v10 copy];
    v18 = (void *)*((void *)v16 + 7);
    *((void *)v16 + 7) = v17;

    uint64_t v19 = [v11 copy];
    v20 = (void *)*((void *)v16 + 8);
    *((void *)v16 + 8) = v19;

    uint64_t v21 = [v12 copy];
    v22 = (void *)*((void *)v16 + 9);
    *((void *)v16 + 9) = v21;

    *((void *)v16 + 5) = a3;
    *((void *)v16 + 6) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v16 + 24) = _Q0;
  }

  return (PUIPosterLegibilitySettings *)v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[PUIPosterLegibilitySettings allocWithZone:a3] initWithStyle:self->_style primaryColor:self->_primaryColor secondaryColor:self->_secondaryColor shadowColor:self->_shadowColor];
  v4->_contrast = self->_contrast;
  v4->_shadowRadiusMultiplier = self->_shadowRadiusMultiplier;
  v4->_shadowAlphaOverride = self->_shadowAlphaOverride;
  uint64_t v5 = [(UIColor *)self->_contentColor copy];
  contentColor = v4->_contentColor;
  v4->_contentColor = (UIColor *)v5;

  uint64_t v7 = [(_UILegibilitySettings *)self->_specifiedLegibilitySettings copy];
  specifiedLegibilitySettings = v4->_specifiedLegibilitySettings;
  v4->_specifiedLegibilitySettings = (_UILegibilitySettings *)v7;

  return v4;
}

- (id)convertToUILegibility
{
  specifiedLegibilitySettings = self->_specifiedLegibilitySettings;
  if (!specifiedLegibilitySettings)
  {
    specifiedLegibilitySettings = self->_cachedLegibilitySettings;
    if (!specifiedLegibilitySettings)
    {
      id v4 = objc_alloc(MEMORY[0x263F1CCD0]);
      int64_t style = self->_style;
      if (style == 2) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = style == 1;
      }
      uint64_t v7 = [(PUIPosterLegibilitySettings *)self primaryColor];
      uint64_t v8 = [(PUIPosterLegibilitySettings *)self secondaryColor];
      uint64_t v9 = [(PUIPosterLegibilitySettings *)self shadowColor];
      id v10 = (_UILegibilitySettings *)[v4 initWithStyle:v6 primaryColor:v7 secondaryColor:v8 shadowColor:v9];
      cachedLegibilitySettings = self->_cachedLegibilitySettings;
      self->_cachedLegibilitySettings = v10;

      if (self->_shadowRadiusMultiplier != 1.0)
      {
        id v12 = self->_cachedLegibilitySettings;
        [(_UILegibilitySettings *)v12 shadowRadius];
        [(_UILegibilitySettings *)v12 setShadowRadius:v13 * self->_shadowRadiusMultiplier];
        id v14 = self->_cachedLegibilitySettings;
        [(_UILegibilitySettings *)v14 imageOutset];
        [(_UILegibilitySettings *)v14 setImageOutset:v15 * self->_shadowRadiusMultiplier];
      }
      if (self->_shadowAlphaOverride != 1.0) {
        -[_UILegibilitySettings setShadowAlpha:](self->_cachedLegibilitySettings, "setShadowAlpha:");
      }
      specifiedLegibilitySettings = self->_cachedLegibilitySettings;
    }
  }
  v16 = specifiedLegibilitySettings;
  return v16;
}

- (id)legibilitySettingsByApplyingShadowRadiusMultiplier:(double)a3
{
  id v4 = [(PUIPosterLegibilitySettings *)self copyWithZone:0];
  v4[4] = a3;
  return v4;
}

- (id)legibilitySettingsByOverridingShadowAlpha:(double)a3
{
  id v4 = [(PUIPosterLegibilitySettings *)self copyWithZone:0];
  v4[3] = a3;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUIPosterLegibilitySettings *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0
      && [(PUIPosterLegibilitySettings *)self isEqualToLegibilitySettings:v4];
  }

  return v7;
}

- (BOOL)isEqualToLegibilitySettings:(id)a3
{
  id v4 = (PUIPosterLegibilitySettings *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v18 = 1;
  }
  else if (v4 {
         && (uint64_t v6 = [(PUIPosterLegibilitySettings *)v4 style],
  }
             v6 == [(PUIPosterLegibilitySettings *)self style]))
  {
    BOOL v7 = [(PUIPosterLegibilitySettings *)self convertToUILegibility];
    uint64_t v8 = [(PUIPosterLegibilitySettings *)v5 convertToUILegibility];
    uint64_t v9 = [v8 primaryColor];
    id v10 = [v7 primaryColor];
    int v11 = BSEqualObjects();

    if (!v11) {
      goto LABEL_13;
    }
    id v12 = [v8 secondaryColor];
    double v13 = [v7 secondaryColor];
    int v14 = BSEqualObjects();

    if (!v14) {
      goto LABEL_13;
    }
    double v15 = [v8 shadowColor];
    v16 = [v7 shadowColor];
    int v17 = BSEqualObjects();

    if (!v17) {
      goto LABEL_13;
    }
    [v7 shadowRadius];
    [v8 shadowRadius];
    if (BSFloatEqualToFloat()
      && ([v7 shadowAlpha], objc_msgSend(v8, "shadowAlpha"), BSFloatEqualToFloat())
      && ([v7 imageOutset], objc_msgSend(v8, "imageOutset"), BSFloatEqualToFloat()))
    {
      [v7 minFillHeight];
      [v8 minFillHeight];
      char v18 = BSFloatEqualToFloat();
    }
    else
    {
LABEL_13:
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v2 = [(PUIPosterLegibilitySettings *)self convertToUILegibility];
  id v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", objc_msgSend(v2, "style"));
  uint64_t v5 = [v2 primaryColor];
  id v6 = (id)[v3 appendObject:v5];

  BOOL v7 = [v2 secondaryColor];
  id v8 = (id)[v3 appendObject:v7];

  uint64_t v9 = [v2 shadowColor];
  id v10 = (id)[v3 appendObject:v9];

  [v2 shadowRadius];
  id v11 = (id)objc_msgSend(v3, "appendCGFloat:");
  [v2 shadowAlpha];
  id v12 = (id)objc_msgSend(v3, "appendCGFloat:");
  [v2 imageOutset];
  id v13 = (id)objc_msgSend(v3, "appendCGFloat:");
  [v2 minFillHeight];
  id v14 = (id)objc_msgSend(v3, "appendCGFloat:");
  unint64_t v15 = [v3 hash];

  return v15;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  int64_t v4 = [(PUIPosterLegibilitySettings *)self source];
  switch(v4)
  {
    case 2:
      id v14 = (id)[v3 appendObject:self->_specifiedLegibilitySettings withName:@"specifiedLegibilitySettings"];
      break;
    case 1:
      int64_t style = self->_style;
      v16 = @"None";
      if (style == 1) {
        v16 = @"LightContentWithDarkShadow";
      }
      if (style == 2) {
        int v17 = @"DarkContentWithLightShadow";
      }
      else {
        int v17 = v16;
      }
      [v3 appendString:v17 withName:@"style"];
      char v18 = [(PUIPosterLegibilitySettings *)self contentColor];
      id v19 = (id)[v3 appendObject:v18 withName:@"contentColor" skipIfNil:1];

      [(PUIPosterLegibilitySettings *)self contrast];
      id v20 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"contrast", 5);
      break;
    case 0:
      int64_t v5 = self->_style;
      id v6 = @"None";
      if (v5 == 1) {
        id v6 = @"LightContentWithDarkShadow";
      }
      if (v5 == 2) {
        BOOL v7 = @"DarkContentWithLightShadow";
      }
      else {
        BOOL v7 = v6;
      }
      [v3 appendString:v7 withName:@"style"];
      id v8 = [(PUIPosterLegibilitySettings *)self primaryColor];
      id v9 = (id)[v3 appendObject:v8 withName:@"primaryColor" skipIfNil:1];

      id v10 = [(PUIPosterLegibilitySettings *)self secondaryColor];
      id v11 = (id)[v3 appendObject:v10 withName:@"secondaryColor" skipIfNil:1];

      id v12 = [(PUIPosterLegibilitySettings *)self shadowColor];
      id v13 = (id)[v3 appendObject:v12 withName:@"shadowColor" skipIfNil:1];

      break;
  }
  if (self->_shadowAlphaOverride != 1.0) {
    id v21 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"shadowAlphaOverride", 2);
  }
  if (self->_shadowRadiusMultiplier != 1.0) {
    id v22 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"shadowRadiusMultiplier", 2);
  }
  v23 = [v3 build];

  return (NSString *)v23;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v8 = a3;
  if ([(PUIPosterLegibilitySettings *)self source])
  {
    if ([(PUIPosterLegibilitySettings *)self source] == 1)
    {
      int64_t v4 = [(PUIPosterLegibilitySettings *)self contentColor];
      [v8 encodeObject:v4 forKey:@"contentColor"];

      [(PUIPosterLegibilitySettings *)self contrast];
      objc_msgSend(v8, "encodeDouble:forKey:", @"contrast");
    }
    else if ([(PUIPosterLegibilitySettings *)self source] == 2)
    {
      [v8 encodeObject:self->_specifiedLegibilitySettings forKey:@"specifiedLegibilitySettings"];
    }
  }
  else
  {
    int64_t v5 = [(PUIPosterLegibilitySettings *)self primaryColor];
    [v8 encodeObject:v5 forKey:@"primaryColor"];

    id v6 = [(PUIPosterLegibilitySettings *)self shadowColor];
    [v8 encodeObject:v6 forKey:@"shadowColor"];

    BOOL v7 = [(PUIPosterLegibilitySettings *)self secondaryColor];
    [v8 encodeObject:v7 forKey:@"secondaryColor"];
  }
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings style](self, "style"), @"legibilityStyle");
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings source](self, "source"), @"source");
  [v8 encodeDouble:@"shadowAlphaOverride" forKey:self->_shadowAlphaOverride];
  [v8 encodeDouble:@"shadowRadiusMultiplier" forKey:self->_shadowRadiusMultiplier];
}

- (PUIPosterLegibilitySettings)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUIPosterLegibilitySettings;
  int64_t v5 = [(PUIPosterLegibilitySettings *)&v23 init];
  if (v5)
  {
    v5->_int64_t style = [v4 decodeInt64ForKey:@"legibilityStyle"];
    v5->_source = [v4 decodeInt64ForKey:@"source"];
    [v4 decodeDoubleForKey:@"shadowAlphaOverride"];
    v5->_shadowAlphaOverride = v6;
    [v4 decodeDoubleForKey:@"shadowRadiusMultiplier"];
    v5->_shadowRadiusMultiplier = v7;
    if (![(PUIPosterLegibilitySettings *)v5 source])
    {
      id v11 = self;
      uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"primaryColor"];
      primaryColor = v5->_primaryColor;
      v5->_primaryColor = (UIColor *)v12;

      id v14 = self;
      uint64_t v15 = [v4 decodeObjectOfClass:v14 forKey:@"shadowColor"];
      shadowColor = v5->_shadowColor;
      v5->_shadowColor = (UIColor *)v15;

      id v8 = self;
      uint64_t v17 = [v4 decodeObjectOfClass:v8 forKey:@"secondaryColor"];
      secondaryColor = v5->_secondaryColor;
      v5->_secondaryColor = (UIColor *)v17;
      goto LABEL_6;
    }
    if ([(PUIPosterLegibilitySettings *)v5 source] == 2)
    {
      id v8 = self;
      uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"specifiedLegibilitySettings"];
      secondaryColor = v5->_specifiedLegibilitySettings;
      v5->_specifiedLegibilitySettings = (_UILegibilitySettings *)v9;
LABEL_6:

      goto LABEL_7;
    }
    if ([(PUIPosterLegibilitySettings *)v5 source] == 1)
    {
      id v19 = self;
      uint64_t v20 = [v4 decodeObjectOfClass:v19 forKey:@"contentColor"];
      contentColor = v5->_contentColor;
      v5->_contentColor = (UIColor *)v20;

      [v4 decodeDoubleForKey:@"contrast"];
      v5->_contrast = v22;
    }
  }
LABEL_7:

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PUIPosterLegibilitySettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUIPosterLegibilitySettings;
  int64_t v5 = [(PUIPosterLegibilitySettings *)&v23 init];
  if (v5)
  {
    v5->_int64_t style = [v4 decodeInt64ForKey:@"legibilityStyle"];
    v5->_source = [v4 decodeInt64ForKey:@"source"];
    [v4 decodeDoubleForKey:@"shadowAlphaOverride"];
    v5->_shadowAlphaOverride = v6;
    [v4 decodeDoubleForKey:@"shadowRadiusMultiplier"];
    v5->_shadowRadiusMultiplier = v7;
    if (![(PUIPosterLegibilitySettings *)v5 source])
    {
      id v11 = self;
      uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"primaryColor"];
      primaryColor = v5->_primaryColor;
      v5->_primaryColor = (UIColor *)v12;

      id v14 = self;
      uint64_t v15 = [v4 decodeObjectOfClass:v14 forKey:@"shadowColor"];
      shadowColor = v5->_shadowColor;
      v5->_shadowColor = (UIColor *)v15;

      id v8 = self;
      uint64_t v17 = [v4 decodeObjectOfClass:v8 forKey:@"secondaryColor"];
      secondaryColor = v5->_secondaryColor;
      v5->_secondaryColor = (UIColor *)v17;
      goto LABEL_6;
    }
    if ([(PUIPosterLegibilitySettings *)v5 source] == 2)
    {
      id v8 = self;
      uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"specifiedLegibilitySettings"];
      secondaryColor = v5->_specifiedLegibilitySettings;
      v5->_specifiedLegibilitySettings = (_UILegibilitySettings *)v9;
LABEL_6:

      goto LABEL_7;
    }
    if ([(PUIPosterLegibilitySettings *)v5 source] == 1)
    {
      id v19 = self;
      uint64_t v20 = [v4 decodeObjectOfClass:v19 forKey:@"contentColor"];
      contentColor = v5->_contentColor;
      v5->_contentColor = (UIColor *)v20;

      [v4 decodeDoubleForKey:@"contrast"];
      v5->_contrast = v22;
    }
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if ([(PUIPosterLegibilitySettings *)self source])
  {
    if ([(PUIPosterLegibilitySettings *)self source] == 1)
    {
      id v4 = [(PUIPosterLegibilitySettings *)self contentColor];
      [v8 encodeObject:v4 forKey:@"contentColor"];

      [(PUIPosterLegibilitySettings *)self contrast];
      objc_msgSend(v8, "encodeDouble:forKey:", @"contrast");
    }
    else if ([(PUIPosterLegibilitySettings *)self source] == 2)
    {
      [v8 encodeObject:self->_specifiedLegibilitySettings forKey:@"specifiedLegibilitySettings"];
    }
  }
  else
  {
    int64_t v5 = [(PUIPosterLegibilitySettings *)self primaryColor];
    [v8 encodeObject:v5 forKey:@"primaryColor"];

    double v6 = [(PUIPosterLegibilitySettings *)self shadowColor];
    [v8 encodeObject:v6 forKey:@"shadowColor"];

    double v7 = [(PUIPosterLegibilitySettings *)self secondaryColor];
    [v8 encodeObject:v7 forKey:@"secondaryColor"];
  }
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings style](self, "style"), @"legibilityStyle");
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings source](self, "source"), @"source");
  [v8 encodeDouble:@"shadowAlphaOverride" forKey:self->_shadowAlphaOverride];
  [v8 encodeDouble:@"shadowRadiusMultiplier" forKey:self->_shadowRadiusMultiplier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)source
{
  return self->_source;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
}

- (double)contrast
{
  return self->_contrast;
}

- (void)setContrast:(double)a3
{
  self->_contrast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_specifiedLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_cachedLegibilitySettings, 0);
}

+ (void)legibilitySettingsWithUILegibilitySettings:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)legibilitySettingsForContentColor:contrast:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end