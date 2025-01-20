@interface SUUIDefaultCardLayout
- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5;
- (id)attributedStringForButton:(id)a3;
- (id)attributedStringForLabel:(id)a3;
@end

@implementation SUUIDefaultCardLayout

- (id)attributedStringForButton:(id)a3
{
  id v3 = a3;
  v4 = [v3 buttonTitleStyle];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 style];
  }
  v7 = v6;

  v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    v8 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
  }
  uint64_t v9 = SUUIViewElementAlignmentForStyle(v7);
  if (v9) {
    uint64_t v10 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v9);
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = [v3 buttonText];
  v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:0 textAlignment:v10 style:v7];

  return v12;
}

- (id)attributedStringForLabel:(id)a3
{
  id v4 = a3;
  v5 = [v4 style];
  id v6 = SUUIViewElementFontWithStyle(v5);
  v7 = [(SUUICardLayout *)self layoutContext];
  v8 = [v7 tintColor];
  uint64_t v9 = SUUIViewElementPlainColorWithStyle(v5, v8);

  uint64_t v10 = SUUIViewElementAlignmentForStyle(v5);
  if (v10) {
    uint64_t v11 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v10);
  }
  else {
    uint64_t v11 = 1;
  }
  unint64_t v12 = [v4 labelViewStyle];
  if (v12 <= 5)
  {
    if (((1 << v12) & 0x1B) != 0)
    {
      if (v6)
      {
        if (v9) {
          goto LABEL_17;
        }
      }
      else
      {
        id v6 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        if (v9) {
          goto LABEL_17;
        }
      }
      uint64_t v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    }
    else
    {
      if (v6)
      {
        if (v9) {
          goto LABEL_17;
        }
      }
      else
      {
        id v6 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        if (v9) {
          goto LABEL_17;
        }
      }
      uint64_t v13 = [MEMORY[0x263F825C8] blackColor];
    }
    uint64_t v9 = (void *)v13;
  }
LABEL_17:
  v14 = [v4 text];
  v15 = [v14 attributedStringWithDefaultFont:v6 foregroundColor:v9 textAlignment:v11];

  return v15;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 elementType] == 66)
  {
    uint64_t v10 = [MEMORY[0x263F82B60] mainScreen];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    if (v14 < v12) {
      double v14 = v12;
    }
    double v15 = 12.0;
    if ([v8 elementType] != 131 && objc_msgSend(v9, "elementType") != 131)
    {
      double v15 = 20.0;
      if (v14 <= 736.0)
      {
        v16 = [v8 parent];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (double v15 = 12.0, ([v16 isAdCard] & 1) == 0))
        {
          if (v14 <= 568.0) {
            double v15 = 10.0;
          }
          else {
            double v15 = 15.0;
          }
        }
      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SUUIDefaultCardLayout;
    [(SUUICardLayout *)&v19 topInsetForViewElement:v8 previousViewElement:v9 width:a5];
    double v15 = v17;
  }

  return v15;
}

@end