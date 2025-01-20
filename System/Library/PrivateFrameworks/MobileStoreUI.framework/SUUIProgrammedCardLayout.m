@interface SUUIProgrammedCardLayout
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
@end

@implementation SUUIProgrammedCardLayout

+ (BOOL)allowsViewElement:(id)a3
{
  unint64_t v3 = [a3 elementType];
  BOOL result = 1;
  if (v3 > 0x32 || ((1 << v3) & 0x6000000001000) == 0) {
    return v3 == 138;
  }
  return result;
}

- (id)attributedStringForButton:(id)a3
{
  id v4 = a3;
  v5 = [v4 style];
  uint64_t v6 = SUUIViewElementAlignmentForStyle(v5);

  if (v6) {
    uint64_t v7 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v6);
  }
  else {
    uint64_t v7 = 1;
  }
  v8 = [v4 buttonText];
  v9 = [(SUUIProgrammedCardLayout *)self _fontForButton:v4];
  v10 = [v4 style];

  v11 = [v8 attributedStringWithDefaultFont:v9 foregroundColor:0 textAlignment:v7 style:v10];

  return v11;
}

- (id)attributedStringForLabel:(id)a3
{
  id v4 = a3;
  v5 = [v4 style];
  uint64_t v6 = [v5 textAlignment];
  if (v6) {
    uint64_t v7 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v6);
  }
  else {
    uint64_t v7 = 1;
  }
  v8 = [(SUUICardLayout *)self layoutContext];
  v9 = [v8 tintColor];
  v10 = SUUIViewElementPlainColorWithStyle(v5, v9);

  if (!v10)
  {
    if ([v4 labelViewStyle] == 5) {
      [MEMORY[0x263F825C8] blackColor];
    }
    else {
    v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
    }
  }
  v11 = [v4 text];
  v12 = [(SUUIProgrammedCardLayout *)self _fontForLabel:v4];
  v13 = [v11 attributedStringWithDefaultFont:v12 foregroundColor:v10 textAlignment:v7 style:v5];

  return v13;
}

- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4
{
  id v4 = [(SUUIProgrammedCardLayout *)self _stringLayoutForViewElement:a3 width:a4];
  v5 = v4;
  if (v4)
  {
    [v4 boundingSize];
    double v7 = v6;
    [v5 baselineOffset];
    *(float *)&double v8 = v7 - v8;
    double v9 = 30.0 - roundf(*(float *)&v8);
  }
  else
  {
    double v9 = 30.0;
  }

  return v9;
}

- (double)horizontalContentInset
{
  return 20.0;
}

- (int64_t)layoutStyle
{
  return 1;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 elementType];
  if ((unint64_t)(v10 - 49) < 2)
  {
    double v11 = 20.0;
  }
  else
  {
    if (v10 == 138)
    {
      v12 = [(SUUIProgrammedCardLayout *)self _fontForLabel:v8];
    }
    else
    {
      double v11 = 0.0;
      if (v10 != 12) {
        goto LABEL_8;
      }
      v12 = [(SUUIProgrammedCardLayout *)self _fontForButton:v8];
    }
    v13 = v12;
    [v12 lineHeight];
    *(float *)&double v14 = v14 + v14;
    double v11 = roundf(*(float *)&v14);
  }
LABEL_8:
  v15 = [(SUUIProgrammedCardLayout *)self _stringLayoutForViewElement:v8 width:a5];
  v16 = v15;
  if (v15)
  {
    [v15 firstBaselineOffset];
    *(float *)&double v17 = v17;
    double v11 = v11 - roundf(*(float *)&v17);
  }
  v18 = [(SUUIProgrammedCardLayout *)self _stringLayoutForViewElement:v9 width:a5];

  if (v18)
  {
    [v18 boundingSize];
    double v20 = v19;
    [v18 baselineOffset];
    *(float *)&double v21 = v20 - v21;
    double v11 = v11 - roundf(*(float *)&v21);
  }

  return v11;
}

- (id)_fontForButton:(id)a3
{
  id v3 = a3;
  id v4 = [v3 buttonTitleStyle];
  v5 = v4;
  if (v4)
  {
    double v6 = SUUIViewElementFontWithStyle(v4);
  }
  else
  {
    double v7 = [v3 style];
    double v6 = SUUIViewElementFontWithStyle(v7);
  }
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
  }
  id v9 = v8;

  return v9;
}

- (id)_fontForLabel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 style];
  v5 = SUUIViewElementFontWithStyle(v4);

  if (!v5)
  {
    uint64_t v6 = [v3 labelViewStyle];
    double v7 = 14.0;
    if (v6 == 5) {
      double v7 = 20.0;
    }
    v5 = [MEMORY[0x263F81708] systemFontOfSize:v7];
  }

  return v5;
}

- (id)_stringLayoutForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 elementType];
  if (v7 == 138 || v7 == 12)
  {
    id v9 = [(SUUICardLayout *)self layoutContext];
    uint64_t v10 = [v9 labelLayoutCache];
    double v11 = [v10 layoutForWidth:(uint64_t)a4 viewElement:v6];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

@end