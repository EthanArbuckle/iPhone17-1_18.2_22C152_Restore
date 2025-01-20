@interface SKUIJSAnalyzedImageColors
- (BOOL)isBackgroundLight;
- (SKUIJSAnalyzedImageColors)initWithAppContext:(id)a3 analyzedImageColors:(id)a4;
- (SKUIJSColor)backgroundColor;
- (SKUIJSColor)textPrimaryColor;
- (SKUIJSColor)textSecondaryColor;
@end

@implementation SKUIJSAnalyzedImageColors

- (SKUIJSAnalyzedImageColors)initWithAppContext:(id)a3 analyzedImageColors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSAnalyzedImageColors initWithAppContext:analyzedImageColors:]();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIJSAnalyzedImageColors;
  v8 = [(IKJSObject *)&v22 initWithAppContext:v6];
  if (v8)
  {
    v9 = [SKUIJSColor alloc];
    v10 = [v7 backgroundColor];
    uint64_t v11 = [(SKUIJSColor *)v9 initWithAppContext:v6 color:v10];
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (SKUIJSColor *)v11;

    v13 = [SKUIJSColor alloc];
    v14 = [v7 textPrimaryColor];
    uint64_t v15 = [(SKUIJSColor *)v13 initWithAppContext:v6 color:v14];
    textPrimaryColor = v8->_textPrimaryColor;
    v8->_textPrimaryColor = (SKUIJSColor *)v15;

    v17 = [SKUIJSColor alloc];
    v18 = [v7 textSecondaryColor];
    uint64_t v19 = [(SKUIJSColor *)v17 initWithAppContext:v6 color:v18];
    textSecondaryColor = v8->_textSecondaryColor;
    v8->_textSecondaryColor = (SKUIJSColor *)v19;

    v8->_isBackgroundLight = [v7 isBackgroundLight];
  }

  return v8;
}

- (SKUIJSColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SKUIJSColor)textPrimaryColor
{
  return self->_textPrimaryColor;
}

- (SKUIJSColor)textSecondaryColor
{
  return self->_textSecondaryColor;
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSecondaryColor, 0);
  objc_storeStrong((id *)&self->_textPrimaryColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithAppContext:analyzedImageColors:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSAnalyzedImageColors initWithAppContext:analyzedImageColors:]";
}

@end