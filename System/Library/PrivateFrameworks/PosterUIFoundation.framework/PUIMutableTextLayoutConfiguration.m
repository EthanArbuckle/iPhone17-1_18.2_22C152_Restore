@interface PUIMutableTextLayoutConfiguration
- (BOOL)isAlternateDateEnabled;
- (BOOL)isUserConfigured;
- (NSString)groupName;
- (NSString)numberingSystemType;
- (PUIFontConfiguration)fontConfiguration;
- (PUIMutableTextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 styleColor:(id)a7 numberingSystemType:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12;
- (PUIStyle)style;
- (double)contentsLuminance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)styleColor;
- (unint64_t)preferredAlignment;
- (unint64_t)preferredLayout;
- (void)setAlternateDateEnabled:(BOOL)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setFontConfiguration:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setNumberingSystemType:(id)a3;
- (void)setPreferredAlignment:(unint64_t)a3;
- (void)setPreferredLayout:(unint64_t)a3;
- (void)setStyle:(id)a3;
- (void)setStyleColor:(id)a3;
- (void)setUserConfigured:(BOOL)a3;
@end

@implementation PUIMutableTextLayoutConfiguration

- (PUIMutableTextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 styleColor:(id)a7 numberingSystemType:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12
{
  id v19 = a3;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  v37.receiver = self;
  v37.super_class = (Class)PUIMutableTextLayoutConfiguration;
  HIBYTE(v36) = a11;
  LOBYTE(v36) = a9;
  v24 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](&v37, sel_initWithFontConfiguration_preferredAlignment_preferredLayout_style_styleColor_numberingSystemType_userConfigured_contentsLuminance_alternateDateEnabled_groupName_, v19, a4, a5, v20, v21, v22, a10, v36, v23);
  if (v24)
  {
    uint64_t v25 = [v19 copy];
    fontConfiguration = v24->_fontConfiguration;
    v24->_fontConfiguration = (PUIFontConfiguration *)v25;

    v24->_preferredAlignment = a4;
    v24->_preferredLayout = a5;
    uint64_t v27 = [v20 copy];
    style = v24->_style;
    v24->_style = (PUIStyle *)v27;

    uint64_t v29 = [v21 copy];
    styleColor = v24->_styleColor;
    v24->_styleColor = (PUIStyleColor *)v29;

    uint64_t v31 = [v22 copy];
    numberingSystemType = v24->_numberingSystemType;
    v24->_numberingSystemType = (NSString *)v31;

    v24->_userConfigured = a9;
    v24->_contentsLuminance = a10;
    uint64_t v33 = [v23 copy];
    groupName = v24->_groupName;
    v24->_groupName = (NSString *)v33;

    v24->_alternateDateEnabled = a11;
  }

  return v24;
}

- (void)setStyleColor:(id)a3
{
  id v6 = a3;
  if (!-[PUIStyleColor isEqual:](self->_styleColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_styleColor, a3);
    v5 = [v6 contentStyle];
    [(PUIMutableTextLayoutConfiguration *)self setStyle:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PUIImmutableTextLayoutConfiguration alloc];
  return [(PUITextLayoutConfiguration *)v4 initWithTextLayoutConfiguration:self];
}

- (PUIFontConfiguration)fontConfiguration
{
  return self->_fontConfiguration;
}

- (void)setFontConfiguration:(id)a3
{
}

- (unint64_t)preferredAlignment
{
  return self->_preferredAlignment;
}

- (void)setPreferredAlignment:(unint64_t)a3
{
  self->_preferredAlignment = a3;
}

- (unint64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (void)setPreferredLayout:(unint64_t)a3
{
  self->_preferredLayout = a3;
}

- (PUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (id)styleColor
{
  return self->_styleColor;
}

- (NSString)numberingSystemType
{
  return self->_numberingSystemType;
}

- (void)setNumberingSystemType:(id)a3
{
}

- (BOOL)isUserConfigured
{
  return self->_userConfigured;
}

- (void)setUserConfigured:(BOOL)a3
{
  self->_userConfigured = a3;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
  self->_alternateDateEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_numberingSystemType, 0);
  objc_storeStrong((id *)&self->_styleColor, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_fontConfiguration, 0);
}

@end