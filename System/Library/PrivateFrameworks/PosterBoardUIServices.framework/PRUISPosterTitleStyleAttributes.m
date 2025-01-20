@interface PRUISPosterTitleStyleAttributes
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (PRUISPosterTitleStyleAttributes)initWithPRPosterTitleStyleConfiguration:(id)a3 extensionBundleURL:(id)a4 role:(id)a5;
- (PRUISPosterTitleStyleAttributes)initWithTitleColor:(id)a3 titleFont:(id)a4 preferredTitleAlignment:(unint64_t)a5 preferredTitleLayout:(unint64_t)a6 vibrancyConfiguration:(id)a7;
- (UIColor)titleColor;
- (UIFont)titleFont;
- (unint64_t)preferredTitleAlignment;
- (unint64_t)preferredTitleLayout;
- (void)setPreferredTitleAlignment:(unint64_t)a3;
- (void)setPreferredTitleLayout:(unint64_t)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setVibrancyConfiguration:(id)a3;
@end

@implementation PRUISPosterTitleStyleAttributes

- (PRUISPosterTitleStyleAttributes)initWithPRPosterTitleStyleConfiguration:(id)a3 extensionBundleURL:(id)a4 role:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 effectiveTitleColor];
  v12 = [v11 color];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = [MEMORY[0x263F5F520] defaultTitleColor];
    id v14 = [v15 color];
  }
  v16 = [v8 effectiveTimeFontWithExtensionBundleURL:v9 forRole:v10];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [MEMORY[0x263F5F520] defaultTitleFontForRole:v10];
  }
  v19 = v18;

  v20 = [v8 vibrancyConfigurationWithExtensionBundleURL:v9];
  v21 = -[PRUISPosterTitleStyleAttributes initWithTitleColor:titleFont:preferredTitleAlignment:preferredTitleLayout:vibrancyConfiguration:](self, "initWithTitleColor:titleFont:preferredTitleAlignment:preferredTitleLayout:vibrancyConfiguration:", v14, v19, [v8 preferredTitleAlignment], objc_msgSend(v8, "preferredTitleLayout"), v20);

  return v21;
}

- (PRUISPosterTitleStyleAttributes)initWithTitleColor:(id)a3 titleFont:(id)a4 preferredTitleAlignment:(unint64_t)a5 preferredTitleLayout:(unint64_t)a6 vibrancyConfiguration:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PRUISPosterTitleStyleAttributes;
  v16 = [(PRUISPosterTitleStyleAttributes *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_titleColor, a3);
    objc_storeStrong((id *)&v17->_titleFont, a4);
    v17->_preferredTitleAlignment = a5;
    v17->_preferredTitleLayout = a6;
    objc_storeStrong((id *)&v17->_vibrancyConfiguration, a7);
  }

  return v17;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (unint64_t)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (void)setPreferredTitleAlignment:(unint64_t)a3
{
  self->_preferredTitleAlignment = a3;
}

- (unint64_t)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void)setPreferredTitleLayout:(unint64_t)a3
{
  self->_preferredTitleLayout = a3;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (void)setVibrancyConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);

  objc_storeStrong((id *)&self->_titleColor, 0);
}

@end