@interface PRImmutablePosterTitleStyleConfiguration
- (BOOL)isAlternateDateEnabled;
- (BOOL)isUserConfigured;
- (PRImmutablePosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 titleColor:(id)a7 timeNumberingSystem:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12;
- (double)contentsLuminance;
- (id)groupName;
- (id)timeFontConfiguration;
- (id)timeNumberingSystem;
- (id)titleColor;
- (id)titleContentStyle;
- (unint64_t)preferredTitleAlignment;
- (unint64_t)preferredTitleLayout;
@end

@implementation PRImmutablePosterTitleStyleConfiguration

- (PRImmutablePosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 titleColor:(id)a7 timeNumberingSystem:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12
{
  id v19 = a3;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  v37.receiver = self;
  v37.super_class = (Class)PRImmutablePosterTitleStyleConfiguration;
  HIBYTE(v36) = a11;
  LOBYTE(v36) = a9;
  v24 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](&v37, sel_initWithTimeFontConfiguration_preferredTitleAlignment_preferredTitleLayout_titleContentStyle_titleColor_timeNumberingSystem_userConfigured_contentsLuminance_alternateDateEnabled_groupName_, v19, a4, a5, v20, v21, v22, a10, v36, v23);
  if (v24)
  {
    uint64_t v25 = [v19 copy];
    timeFontConfiguration = v24->_timeFontConfiguration;
    v24->_timeFontConfiguration = (PRPosterTimeFontConfiguration *)v25;

    v24->_preferredTitleAlignment = a4;
    v24->_preferredTitleLayout = a5;
    uint64_t v27 = [v20 copy];
    titleContentStyle = v24->_titleContentStyle;
    v24->_titleContentStyle = (PRPosterContentStyle *)v27;

    uint64_t v29 = [v21 copy];
    titleColor = v24->_titleColor;
    v24->_titleColor = (PRPosterColor *)v29;

    uint64_t v31 = [v22 copy];
    timeNumberingSystem = v24->_timeNumberingSystem;
    v24->_timeNumberingSystem = (NSString *)v31;

    v24->_userConfigured = a9;
    v24->_contentsLuminance = a10;
    uint64_t v33 = [v23 copy];
    groupName = v24->_groupName;
    v24->_groupName = (NSString *)v33;

    v24->_alternateDateEnabled = a11;
  }

  return v24;
}

- (id)timeFontConfiguration
{
  return self->_timeFontConfiguration;
}

- (unint64_t)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (unint64_t)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (id)titleColor
{
  return self->_titleColor;
}

- (id)titleContentStyle
{
  return self->_titleContentStyle;
}

- (id)timeNumberingSystem
{
  return self->_timeNumberingSystem;
}

- (BOOL)isUserConfigured
{
  return self->_userConfigured;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (id)groupName
{
  return self->_groupName;
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_timeNumberingSystem, 0);
  objc_storeStrong((id *)&self->_titleContentStyle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_timeFontConfiguration, 0);
}

@end