@interface UIButton(SUUITrendingSearchButtons)
+ (id)SUUITrending_searchButtonWithElement:()SUUITrendingSearchButtons;
+ (id)SUUITrending_searchButtonWithTitle:()SUUITrendingSearchButtons;
+ (uint64_t)SUUITrending_defaultButtonFont;
- (void)SUUITrending_applyConfigurationFromElement:()SUUITrendingSearchButtons;
@end

@implementation UIButton(SUUITrendingSearchButtons)

+ (uint64_t)SUUITrending_defaultButtonFont
{
  return [MEMORY[0x263F81708] systemFontOfSize:17.0];
}

+ (id)SUUITrending_searchButtonWithElement:()SUUITrendingSearchButtons
{
  v3 = (void *)MEMORY[0x263F824E8];
  id v4 = a3;
  v5 = [v3 buttonWithType:1];
  objc_msgSend(v5, "SUUITrending_applyConfigurationFromElement:", v4);

  return v5;
}

+ (id)SUUITrending_searchButtonWithTitle:()SUUITrendingSearchButtons
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "SUUITrending_searchButtonWithElement:", 0);
  [v5 setTitle:v4 forState:0];

  return v5;
}

- (void)SUUITrending_applyConfigurationFromElement:()SUUITrendingSearchButtons
{
  id v20 = a3;
  id v4 = [v20 buttonImage];

  if (v4)
  {
    v5 = [v20 buttonImage];
    v6 = [v5 resourceName];
    v7 = SUUIImageWithResourceName(v6);

    [a1 setImage:v7 forState:0];
  }
  v8 = [v20 buttonText];
  v9 = [v8 string];

  [a1 setTitle:v9 forState:0];
  v10 = [v20 buttonTitleStyle];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v20 style];
  }
  v13 = v12;

  v14 = SUUIViewElementPlainColorWithStyle(v13, 0);
  [a1 setTintColor:v14];

  v15 = [a1 titleLabel];
  v16 = SUUIViewElementFontWithStyle(v13);
  uint64_t v17 = [v13 maxTextLines];
  if (v16)
  {
    [v15 setFont:v16];
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_class(), "SUUITrending_defaultButtonFont");
    [v15 setFont:v18];
  }
  if (v17 == -1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v17;
  }
  [v15 setNumberOfLines:v19];
  [v15 setTextAlignment:1];
  [v15 setLineBreakMode:4];
}

@end