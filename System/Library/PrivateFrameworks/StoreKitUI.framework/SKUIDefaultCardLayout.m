@interface SKUIDefaultCardLayout
- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5;
- (id)attributedStringForButton:(id)a3;
- (id)attributedStringForLabel:(id)a3;
@end

@implementation SKUIDefaultCardLayout

- (id)attributedStringForButton:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIDefaultCardLayout attributedStringForButton:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = [v3 buttonTitleStyle];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v3 style];
  }
  v15 = v14;

  v16 = SKUIViewElementFontWithStyle(v15);
  if (!v16)
  {
    v16 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
  }
  uint64_t v17 = SKUIViewElementAlignmentForStyle(v15);
  if (v17) {
    uint64_t v18 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v17);
  }
  else {
    uint64_t v18 = 1;
  }
  v19 = [v3 buttonText];
  v20 = [v19 attributedStringWithDefaultFont:v16 foregroundColor:0 textAlignment:v18 style:v15];

  return v20;
}

- (id)attributedStringForLabel:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDefaultCardLayout attributedStringForLabel:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 style];
  id v14 = SKUIViewElementFontWithStyle(v13);
  v15 = [(SKUICardLayout *)self layoutContext];
  v16 = [v15 tintColor];
  uint64_t v17 = SKUIViewElementPlainColorWithStyle(v13, v16);

  uint64_t v18 = SKUIViewElementAlignmentForStyle(v13);
  if (v18) {
    uint64_t v19 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v18);
  }
  else {
    uint64_t v19 = 1;
  }
  unint64_t v20 = [v4 labelViewStyle];
  if (v20 <= 5)
  {
    if (((1 << v20) & 0x1B) != 0)
    {
      if (v14)
      {
        if (v17) {
          goto LABEL_21;
        }
      }
      else
      {
        id v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        if (v17) {
          goto LABEL_21;
        }
      }
      uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    }
    else
    {
      if (v14)
      {
        if (v17) {
          goto LABEL_21;
        }
      }
      else
      {
        id v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
        if (v17) {
          goto LABEL_21;
        }
      }
      uint64_t v21 = [MEMORY[0x1E4FB1618] blackColor];
    }
    uint64_t v17 = (void *)v21;
  }
LABEL_21:
  v22 = [v4 text];
  v23 = [v22 attributedStringWithDefaultFont:v14 foregroundColor:v17 textAlignment:v19];

  return v23;
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
        -[SKUIDefaultCardLayout topInsetForViewElement:previousViewElement:width:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  if ([v9 elementType] == 66)
  {
    uint64_t v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v18 bounds];
    double v20 = v19;
    double v22 = v21;

    if (v22 < v20) {
      double v22 = v20;
    }
    double v23 = 12.0;
    if ([v8 elementType] != 131 && objc_msgSend(v9, "elementType") != 131)
    {
      double v23 = 20.0;
      if (v22 <= 736.0)
      {
        v24 = [v8 parent];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (double v23 = 12.0, ([v24 isAdCard] & 1) == 0))
        {
          if (v22 <= 568.0) {
            double v23 = 10.0;
          }
          else {
            double v23 = 15.0;
          }
        }
      }
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SKUIDefaultCardLayout;
    [(SKUICardLayout *)&v27 topInsetForViewElement:v8 previousViewElement:v9 width:a5];
    double v23 = v25;
  }

  return v23;
}

- (void)attributedStringForButton:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attributedStringForLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)topInsetForViewElement:(uint64_t)a3 previousViewElement:(uint64_t)a4 width:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end