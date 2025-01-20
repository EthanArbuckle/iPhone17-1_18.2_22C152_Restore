@interface SUUIJSAnalyzedImageColors
- (BOOL)isBackgroundLight;
- (SUUIJSAnalyzedImageColors)initWithAppContext:(id)a3 analyzedImageColors:(id)a4;
- (SUUIJSColor)backgroundColor;
- (SUUIJSColor)textPrimaryColor;
- (SUUIJSColor)textSecondaryColor;
@end

@implementation SUUIJSAnalyzedImageColors

- (SUUIJSAnalyzedImageColors)initWithAppContext:(id)a3 analyzedImageColors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SUUIJSAnalyzedImageColors;
  v8 = [(IKJSObject *)&v22 initWithAppContext:v6];
  if (v8)
  {
    v9 = [SUUIJSColor alloc];
    v10 = [v7 backgroundColor];
    uint64_t v11 = [(SUUIJSColor *)v9 initWithAppContext:v6 color:v10];
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (SUUIJSColor *)v11;

    v13 = [SUUIJSColor alloc];
    v14 = [v7 textPrimaryColor];
    uint64_t v15 = [(SUUIJSColor *)v13 initWithAppContext:v6 color:v14];
    textPrimaryColor = v8->_textPrimaryColor;
    v8->_textPrimaryColor = (SUUIJSColor *)v15;

    v17 = [SUUIJSColor alloc];
    v18 = [v7 textSecondaryColor];
    uint64_t v19 = [(SUUIJSColor *)v17 initWithAppContext:v6 color:v18];
    textSecondaryColor = v8->_textSecondaryColor;
    v8->_textSecondaryColor = (SUUIJSColor *)v19;

    v8->_isBackgroundLight = [v7 isBackgroundLight];
  }

  return v8;
}

- (SUUIJSColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SUUIJSColor)textPrimaryColor
{
  return self->_textPrimaryColor;
}

- (SUUIJSColor)textSecondaryColor
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

@end