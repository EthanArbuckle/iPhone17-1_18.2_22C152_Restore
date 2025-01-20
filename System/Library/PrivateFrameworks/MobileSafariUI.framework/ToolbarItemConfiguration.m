@interface ToolbarItemConfiguration
+ (id)attributedTitleForTabGroup:(id)a3 inProfile:(id)a4 primaryColor:(id)a5 secondaryColor:(id)a6;
+ (id)configurationForProfile:(id)a3;
+ (id)configurationForTabGroup:(id)a3;
+ (id)configurationForTabGroup:(id)a3 inProfile:(id)a4;
+ (id)configurationForTabGroupPicker;
- (BOOL)isEmphasized;
- (BOOL)showsIndicator;
- (NSAttributedString)attributedTitle;
- (NSString)accessibilityIdentifier;
- (NSString)title;
- (ToolbarItemConfiguration)init;
- (UIImage)image;
- (id)buttonConfigurationWithStyle:(int64_t)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setEmphasized:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setShowsIndicator:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation ToolbarItemConfiguration

+ (id)configurationForTabGroup:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ToolbarItemConfiguration);
  v5 = [v3 displayTitle];

  [(ToolbarItemConfiguration *)v4 setTitle:v5];
  return v4;
}

- (void)setTitle:(id)a3
{
  v4 = (void *)[a3 copy];
  id title = self->_title;
  self->_id title = v4;
}

- (ToolbarItemConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)ToolbarItemConfiguration;
  result = [(ToolbarItemConfiguration *)&v3 init];
  *(_WORD *)&result->_showsIndicator = 257;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_title, 0);
}

+ (id)configurationForTabGroupPicker
{
  v2 = objc_alloc_init(ToolbarItemConfiguration);
  objc_super v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"list.bullet"];
  [(ToolbarItemConfiguration *)v2 setImage:v3];

  [(ToolbarItemConfiguration *)v2 setShowsIndicator:0];
  return v2;
}

+ (id)configurationForProfile:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ToolbarItemConfiguration);
  v5 = [v3 symbolImage];
  [(ToolbarItemConfiguration *)v4 setImage:v5];

  v6 = [v3 title];
  [(ToolbarItemConfiguration *)v4 setTitle:v6];

  v7 = [v3 title];

  [(ToolbarItemConfiguration *)v4 setAccessibilityIdentifier:v7];
  return v4;
}

+ (id)configurationForTabGroup:(id)a3 inProfile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(ToolbarItemConfiguration);
  v9 = [v6 symbolImage];
  [(ToolbarItemConfiguration *)v8 setImage:v9];

  v10 = [v6 title];
  [(ToolbarItemConfiguration *)v8 setAccessibilityIdentifier:v10];

  v11 = [MEMORY[0x1E4FB1618] labelColor];
  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v13 = [a1 attributedTitleForTabGroup:v7 inProfile:v6 primaryColor:v11 secondaryColor:v12];

  [(ToolbarItemConfiguration *)v8 setAttributedTitle:v13];
  return v8;
}

+ (id)attributedTitleForTabGroup:(id)a3 inProfile:(id)a4 primaryColor:(id)a5 secondaryColor:(id)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (uint64_t *)MEMORY[0x1E4FB0700];
  if (v11)
  {
    uint64_t v28 = *MEMORY[0x1E4FB0700];
    v29[0] = v11;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  }
  else
  {
    v14 = 0;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
  v16 = [v10 title];
  v17 = (void *)[v15 initWithString:v16 attributes:v14];

  if (v12)
  {
    uint64_t v26 = *v13;
    id v27 = v12;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  }
  else
  {
    v18 = 0;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  v20 = NSString;
  v21 = [v9 displayTitle];
  v22 = [v20 stringWithFormat:@" — %@", v21];
  v23 = (void *)[v19 initWithString:v22 attributes:v18];
  [v17 appendAttributedString:v23];

  v24 = (void *)[v17 mutableCopy];
  return v24;
}

- (NSString)title
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id title = self->_title;
  }
  else {
    id title = 0;
  }
  return (NSString *)title;
}

- (NSAttributedString)attributedTitle
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id title = self->_title;
  }
  else {
    id title = 0;
  }
  return (NSAttributedString *)title;
}

- (void)setAttributedTitle:(id)a3
{
  v4 = (void *)[a3 copy];
  id title = self->_title;
  self->_id title = v4;
}

- (id)buttonConfigurationWithStyle:(int64_t)a3
{
  v5 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
  id v6 = (id *)MEMORY[0x1E4FB2908];
  if (!self->_emphasized) {
    id v6 = (id *)MEMORY[0x1E4FB28C8];
  }
  id v7 = *v6;
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    double v8 = 2.0;
    if (!self->_emphasized) {
      double v8 = 4.0;
    }
    [v5 setImagePadding:v8];
    if (a3 == 1)
    {
      uint64_t v9 = 3;
    }
    else if (self->_title)
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 3;
    }
    id v10 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v7 scale:v9];
    [v5 setPreferredSymbolConfigurationForImage:v10];
  }
  if (a3 != 1 && self->_title)
  {
    id v11 = [(ToolbarItemConfiguration *)self title];
    if (v11) {
      [v5 setTitle:v11];
    }
    id v12 = [(ToolbarItemConfiguration *)self attributedTitle];
    if (v12) {
      [v5 setAttributedTitle:v12];
    }
    [v5 setTitleLineBreakMode:4];
  }
  if (self->_emphasized)
  {
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [v5 setBaseForegroundColor:v13];

    [v5 setTitleTextAttributesTransformer:&__block_literal_global_3];
  }
  else
  {
    v14 = [MEMORY[0x1E4FB1618] tintColor];
    [v5 setBaseForegroundColor:v14];
  }
  if (self->_showsIndicator)
  {
    [v5 setIndicator:3];
    [v5 setIndicatorColorTransformer:&__block_literal_global_16];
  }

  return v5;
}

id __57__ToolbarItemConfiguration_buttonConfigurationWithStyle___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v2 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v3 = *MEMORY[0x1E4FB2908];
  id v4 = a2;
  v5 = [v2 preferredFontForTextStyle:v3];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = objc_msgSend(v4, "safari_setValuesFromDictionary:", v6);

  return v7;
}

uint64_t __57__ToolbarItemConfiguration_buttonConfigurationWithStyle___block_invoke_2()
{
  return [MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (BOOL)showsIndicator
{
  return self->_showsIndicator;
}

- (void)setShowsIndicator:(BOOL)a3
{
  self->_showsIndicator = a3;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

- (void)setEmphasized:(BOOL)a3
{
  self->_emphasized = a3;
}

@end