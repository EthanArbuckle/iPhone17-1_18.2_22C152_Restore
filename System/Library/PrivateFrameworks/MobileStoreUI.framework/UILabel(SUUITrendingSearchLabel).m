@interface UILabel(SUUITrendingSearchLabel)
+ (id)SUUITrending_defaultLabelWithText:()SUUITrendingSearchLabel;
+ (id)SUUITrending_titleLabelWithElement:()SUUITrendingSearchLabel;
+ (uint64_t)SUUITrending_defaultTitleColor;
+ (uint64_t)SUUITrending_defaultTitleFont;
@end

@implementation UILabel(SUUITrendingSearchLabel)

+ (uint64_t)SUUITrending_defaultTitleColor
{
  return [MEMORY[0x263F825C8] labelColor];
}

+ (uint64_t)SUUITrending_defaultTitleFont
{
  return [MEMORY[0x263F81708] systemFontOfSize:22.0 weight:*MEMORY[0x263F81818]];
}

+ (id)SUUITrending_titleLabelWithElement:()SUUITrendingSearchLabel
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F828E0]);
    objc_msgSend(v5, "setNumberOfLines:", objc_msgSend(v4, "numberOfLines"));
    [v5 setTextAlignment:1];
    v6 = [v4 style];
    v7 = SUUIViewElementFontWithStyle(v6);
    if (!v7)
    {
      v7 = objc_msgSend(a1, "SUUITrending_defaultTitleFont");
    }
    v8 = SUUIViewElementPlainColorWithStyle(v6, 0);
    if (!v8)
    {
      v8 = objc_msgSend(a1, "SUUITrending_defaultTitleColor");
    }
    v9 = [v4 text];
    v10 = [v9 attributedStringWithDefaultFont:v7 foregroundColor:v8 style:v6];

    [v5 setAttributedText:v10];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)SUUITrending_defaultLabelWithText:()SUUITrendingSearchLabel
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F828E0]);
    v7 = objc_msgSend(a1, "SUUITrending_defaultTitleFont");
    [v6 setFont:v7];

    [v6 setText:v5];
    [v6 setTextAlignment:1];
    v8 = objc_msgSend(a1, "SUUITrending_defaultTitleColor");
    [v6 setTextColor:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end