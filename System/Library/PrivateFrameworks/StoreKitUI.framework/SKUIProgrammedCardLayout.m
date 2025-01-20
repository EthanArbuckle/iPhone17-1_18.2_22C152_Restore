@interface SKUIProgrammedCardLayout
+ (BOOL)allowsViewElement:(id)a3;
- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4;
- (double)horizontalContentInset;
- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5;
- (id)_fontForButton:(id)a3;
- (id)_fontForLabel:(id)a3;
- (id)_stringLayoutForViewElement:(id)a3 width:(double)a4;
- (id)attributedStringForButton:(id)a3;
- (id)attributedStringForLabel:(id)a3;
- (int64_t)layoutStyle;
- (void)horizontalContentInset;
- (void)layoutStyle;
@end

@implementation SKUIProgrammedCardLayout

+ (BOOL)allowsViewElement:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIProgrammedCardLayout allowsViewElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  unint64_t v12 = [v3 elementType];
  BOOL v13 = 1;
  if (v12 > 0x32 || ((1 << v12) & 0x6000000001000) == 0) {
    BOOL v13 = v12 == 138;
  }

  return v13;
}

- (id)attributedStringForButton:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProgrammedCardLayout attributedStringForButton:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  BOOL v13 = [v4 style];
  uint64_t v14 = SKUIViewElementAlignmentForStyle(v13);

  if (v14) {
    uint64_t v15 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  }
  else {
    uint64_t v15 = 1;
  }
  v16 = [v4 buttonText];
  v17 = [(SKUIProgrammedCardLayout *)self _fontForButton:v4];
  v18 = [v4 style];
  v19 = [v16 attributedStringWithDefaultFont:v17 foregroundColor:0 textAlignment:v15 style:v18];

  return v19;
}

- (id)attributedStringForLabel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 style];
  uint64_t v6 = [v5 textAlignment];
  if (v6) {
    uint64_t v7 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v6);
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = [(SKUICardLayout *)self layoutContext];
  uint64_t v9 = [v8 tintColor];
  uint64_t v10 = SKUIViewElementPlainColorWithStyle(v5, v9);

  if (!v10)
  {
    if ([v4 labelViewStyle] == 5) {
      [MEMORY[0x1E4FB1618] blackColor];
    }
    else {
    uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
    }
  }
  uint64_t v11 = [v4 text];
  uint64_t v12 = [(SKUIProgrammedCardLayout *)self _fontForLabel:v4];
  BOOL v13 = [v11 attributedStringWithDefaultFont:v12 foregroundColor:v10 textAlignment:v7 style:v5];

  return v13;
}

- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIProgrammedCardLayout bottomInsetForLastViewElement:width:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [(SKUIProgrammedCardLayout *)self _stringLayoutForViewElement:v6 width:a4];
  v16 = v15;
  if (v15)
  {
    [v15 boundingSize];
    double v18 = v17;
    [v16 baselineOffset];
    *(float *)&double v19 = v18 - v19;
    double v20 = 30.0 - roundf(*(float *)&v19);
  }
  else
  {
    double v20 = 30.0;
  }

  return v20;
}

- (double)horizontalContentInset
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIProgrammedCardLayout *)v2 horizontalContentInset];
      }
    }
  }
  return 20.0;
}

- (int64_t)layoutStyle
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIProgrammedCardLayout *)v2 layoutStyle];
      }
    }
  }
  return 1;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIProgrammedCardLayout topInsetForViewElement:previousViewElement:width:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 elementType];
  if ((unint64_t)(v18 - 49) < 2)
  {
    double v19 = 20.0;
  }
  else
  {
    if (v18 == 138)
    {
      double v20 = [(SKUIProgrammedCardLayout *)self _fontForLabel:v8];
    }
    else
    {
      double v19 = 0.0;
      if (v18 != 12) {
        goto LABEL_12;
      }
      double v20 = [(SKUIProgrammedCardLayout *)self _fontForButton:v8];
    }
    v21 = v20;
    [v20 lineHeight];
    *(float *)&double v22 = v22 + v22;
    double v19 = roundf(*(float *)&v22);
  }
LABEL_12:
  v23 = [(SKUIProgrammedCardLayout *)self _stringLayoutForViewElement:v8 width:a5];
  v24 = v23;
  if (v23)
  {
    [v23 firstBaselineOffset];
    *(float *)&double v25 = v25;
    double v19 = v19 - roundf(*(float *)&v25);
  }
  v26 = [(SKUIProgrammedCardLayout *)self _stringLayoutForViewElement:v9 width:a5];

  if (v26)
  {
    [v26 boundingSize];
    double v28 = v27;
    [v26 baselineOffset];
    *(float *)&double v29 = v28 - v29;
    double v19 = v19 - roundf(*(float *)&v29);
  }

  return v19;
}

- (id)_fontForButton:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 buttonTitleStyle];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = SKUIViewElementFontWithStyle(v4);
  }
  else
  {
    uint64_t v7 = [v3 style];
    uint64_t v6 = SKUIViewElementFontWithStyle(v7);
  }
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
  }
  id v9 = v8;

  return v9;
}

- (id)_fontForLabel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 style];
  uint64_t v5 = SKUIViewElementFontWithStyle(v4);

  if (!v5)
  {
    uint64_t v6 = [v3 labelViewStyle];
    double v7 = 14.0;
    if (v6 == 5) {
      double v7 = 20.0;
    }
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v7];
  }

  return v5;
}

- (id)_stringLayoutForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 elementType];
  if (v7 == 138 || v7 == 12)
  {
    id v9 = [(SKUICardLayout *)self layoutContext];
    BOOL v10 = [v9 labelLayoutCache];
    uint64_t v11 = [v10 layoutForWidth:(uint64_t)a4 viewElement:v6];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (void)allowsViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attributedStringForButton:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)bottomInsetForLastViewElement:(uint64_t)a3 width:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)horizontalContentInset
{
}

- (void)layoutStyle
{
}

- (void)topInsetForViewElement:(uint64_t)a3 previousViewElement:(uint64_t)a4 width:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end