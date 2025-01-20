@interface SKUICardLayout
+ (BOOL)allowsViewElement:(id)a3;
+ (SKUICardLayout)layoutWithCardViewElement:(id)a3 context:(id)a4;
- (CGSize)sizeForViewElement:(id)a3 width:(double)a4;
- (SKUICardViewElement)cardViewElement;
- (SKUIViewElementLayoutContext)layoutContext;
- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4;
- (double)horizontalContentInset;
- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5;
- (id)attributedStringForButton:(id)a3;
- (id)attributedStringForLabel:(id)a3;
- (int64_t)layoutStyle;
- (void)layoutStyle;
@end

@implementation SKUICardLayout

+ (BOOL)allowsViewElement:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUICardLayout allowsViewElement:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 1;
}

+ (SKUICardLayout)layoutWithCardViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUICardLayout layoutWithCardViewElement:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  uint64_t v29 = 0;
  v15 = [v5 style];
  v16 = [v15 cardType];
  char v17 = [v16 isEqualToString:@"programmed"];

  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    v27[3] = v18;
    if (!v18) {
      goto LABEL_10;
    }
LABEL_9:
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__SKUICardLayout_layoutWithCardViewElement_context___block_invoke;
    v25[3] = &unk_1E6422498;
    v25[4] = &v26;
    [v5 enumerateChildrenUsingBlock:v25];
    if (v27[3]) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v27[3]) {
    goto LABEL_9;
  }
LABEL_10:
  v27[3] = objc_opt_class();
LABEL_11:
  v19 = [v5 firstChildForElementType:7];

  v20 = objc_alloc_init((Class)v27[3]);
  v21 = (void *)v20[1];
  v20[1] = v5;
  id v22 = v5;

  v23 = (void *)v20[2];
  v20[2] = v6;

  *((unsigned char *)v20 + 24) = v19 != 0;
  _Block_object_dispose(&v26, 8);

  return (SKUICardLayout *)v20;
}

uint64_t __52__SKUICardLayout_layoutWithCardViewElement_context___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) allowsViewElement:a2];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (id)attributedStringForButton:(id)a3
{
  return 0;
}

- (id)attributedStringForLabel:(id)a3
{
  return 0;
}

- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICardLayout bottomInsetForLastViewElement:width:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double result = 15.0;
  if (!self->_hasBackground) {
    return 0.0;
  }
  return result;
}

- (double)horizontalContentInset
{
  return 0.0;
}

- (int64_t)layoutStyle
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUICardLayout *)v2 layoutStyle];
      }
    }
  }
  return 0;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUICardLayout sizeForViewElement:width:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [v6 elementType];
  if (v15 <= 65)
  {
    if (v15 == 7)
    {
      v23 = [v6 firstChildForElementType:49];
      [(SKUIViewElementLayoutContext *)self->_layoutContext sizeForViewElement:v23 width:a4];
      double v21 = v24;
      double v22 = v25;

      goto LABEL_21;
    }
    if (v15 == 50 && [(SKUICardViewElement *)self->_cardViewElement isAdCard])
    {
      v16 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_20:
        double v21 = 0.0;
        double v22 = 5.0;
        goto LABEL_21;
      }
      char v17 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v18 = [v17 userInterfaceIdiom];

      if (!v18) {
        goto LABEL_20;
      }
    }
    goto LABEL_15;
  }
  if (v15 == 108)
  {
    double v21 = *MEMORY[0x1E4F1DB30];
    double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_21;
  }
  if (v15 != 66)
  {
LABEL_15:
    [(SKUIViewElementLayoutContext *)self->_layoutContext sizeForViewElement:v6 width:a4];
    goto LABEL_16;
  }
  +[SKUIHorizontalLockupView sizeThatFitsWidth:v6 viewElement:self->_layoutContext context:a4];
LABEL_16:
  double v21 = v19;
  double v22 = v20;
LABEL_21:

  double v26 = v21;
  double v27 = v22;
  result.height = v27;
  result.width = v26;
  return result;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9)
      {
        -[SKUICardLayout topInsetForViewElement:previousViewElement:width:](v9, v10, v11, v12, v13, v14, v15, v16);
        if (v8) {
          goto LABEL_5;
        }
LABEL_8:
        BOOL v18 = !self->_hasBackground;
        double v19 = 15.0;
        double v20 = 0.0;
        goto LABEL_9;
      }
    }
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_5:
  double v17 = 12.0;
  if ([v7 elementType] == 131) {
    goto LABEL_12;
  }
  BOOL v18 = [v8 elementType] == 131;
  double v19 = 10.0;
  double v20 = 12.0;
LABEL_9:
  if (v18) {
    double v17 = v20;
  }
  else {
    double v17 = v19;
  }
LABEL_12:

  return v17;
}

- (SKUIViewElementLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (SKUICardViewElement)cardViewElement
{
  return self->_cardViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);

  objc_storeStrong((id *)&self->_cardViewElement, 0);
}

+ (void)allowsViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)layoutWithCardViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)bottomInsetForLastViewElement:(uint64_t)a3 width:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)layoutStyle
{
}

- (void)sizeForViewElement:(uint64_t)a3 width:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)topInsetForViewElement:(uint64_t)a3 previousViewElement:(uint64_t)a4 width:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end