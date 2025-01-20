@interface UILabel(SKUITrendingSearchLabel)
+ (id)SKUITrending_defaultLabelWithText:()SKUITrendingSearchLabel;
+ (id)SKUITrending_defaultTitleColor;
+ (id)SKUITrending_defaultTitleFont;
+ (id)SKUITrending_titleLabelWithElement:()SKUITrendingSearchLabel;
+ (void)SKUITrending_defaultTitleColor;
+ (void)SKUITrending_defaultTitleFont;
@end

@implementation UILabel(SKUITrendingSearchLabel)

+ (id)SKUITrending_defaultTitleColor
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v0) {
        +[UILabel(SKUITrendingSearchLabel) SKUITrending_defaultTitleColor];
      }
    }
  }
  v8 = [MEMORY[0x1E4FB1618] _labelColor];

  return v8;
}

+ (id)SKUITrending_defaultTitleFont
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v0) {
        +[UILabel(SKUITrendingSearchLabel) SKUITrending_defaultTitleFont];
      }
    }
  }
  v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:22.0 weight:*MEMORY[0x1E4FB09C8]];

  return v8;
}

+ (id)SKUITrending_titleLabelWithElement:()SKUITrendingSearchLabel
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        +[UILabel(SKUITrendingSearchLabel) SKUITrending_titleLabelWithElement:](v5, v6, v7, v8, v9, v10, v11, v12);
        if (v4) {
          goto LABEL_5;
        }
LABEL_11:
        id v13 = 0;
        goto LABEL_12;
      }
    }
  }
  if (!v4) {
    goto LABEL_11;
  }
LABEL_5:
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  objc_msgSend(v13, "setNumberOfLines:", objc_msgSend(v4, "numberOfLines"));
  [v13 setTextAlignment:1];
  v14 = [v4 style];
  v15 = SKUIViewElementFontWithStyle(v14);
  if (!v15)
  {
    v15 = objc_msgSend(a1, "SKUITrending_defaultTitleFont");
  }
  v16 = SKUIViewElementPlainColorWithStyle(v14, 0);
  if (!v16)
  {
    v16 = objc_msgSend(a1, "SKUITrending_defaultTitleColor");
  }
  v17 = [v4 text];
  v18 = [v17 attributedStringWithDefaultFont:v15 foregroundColor:v16 style:v14];

  [v13 setAttributedText:v18];
LABEL_12:

  return v13;
}

+ (id)SKUITrending_defaultLabelWithText:()SKUITrendingSearchLabel
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && (BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)))
  {
    +[UILabel(SKUITrendingSearchLabel) SKUITrending_defaultLabelWithText:](v5, v6, v7, v8, v9, v10, v11, v12);
    if (!v4) {
      goto LABEL_8;
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  if ([v4 length])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v14 = objc_msgSend(a1, "SKUITrending_defaultTitleFont");
    [v13 setFont:v14];

    [v13 setText:v4];
    [v13 setTextAlignment:1];
    v15 = objc_msgSend(a1, "SKUITrending_defaultTitleColor");
    [v13 setTextColor:v15];

    goto LABEL_9;
  }
LABEL_8:
  id v13 = 0;
LABEL_9:

  return v13;
}

+ (void)SKUITrending_defaultTitleColor
{
}

+ (void)SKUITrending_defaultTitleFont
{
}

+ (void)SKUITrending_titleLabelWithElement:()SKUITrendingSearchLabel .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)SKUITrending_defaultLabelWithText:()SKUITrendingSearchLabel .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end