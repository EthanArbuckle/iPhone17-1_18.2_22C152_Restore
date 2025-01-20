@interface SUUICardLayout
+ (BOOL)allowsViewElement:(id)a3;
+ (id)layoutWithCardViewElement:(id)a3 context:(id)a4;
- (CGSize)sizeForViewElement:(id)a3 width:(double)a4;
- (SUUICardViewElement)cardViewElement;
- (SUUIViewElementLayoutContext)layoutContext;
- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4;
- (double)horizontalContentInset;
- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5;
- (id)attributedStringForButton:(id)a3;
- (id)attributedStringForLabel:(id)a3;
- (int64_t)layoutStyle;
@end

@implementation SUUICardLayout

+ (BOOL)allowsViewElement:(id)a3
{
  return 1;
}

+ (id)layoutWithCardViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  uint64_t v21 = 0;
  v7 = [v5 style];
  v8 = [v7 cardType];
  char v9 = [v8 isEqualToString:@"programmed"];

  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    v19[3] = v10;
    if (!v10) {
      goto LABEL_6;
    }
LABEL_5:
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__SUUICardLayout_layoutWithCardViewElement_context___block_invoke;
    v17[3] = &unk_265400D50;
    v17[4] = &v18;
    [v5 enumerateChildrenUsingBlock:v17];
    if (v19[3]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19[3]) {
    goto LABEL_5;
  }
LABEL_6:
  v19[3] = objc_opt_class();
LABEL_7:
  v11 = [v5 firstChildForElementType:7];

  v12 = objc_alloc_init((Class)v19[3]);
  v13 = (void *)v12[1];
  v12[1] = v5;
  id v14 = v5;

  v15 = (void *)v12[2];
  v12[2] = v6;

  *((unsigned char *)v12 + 24) = v11 != 0;
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __52__SUUICardLayout_layoutWithCardViewElement_context___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
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
  return 0;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 elementType];
  if (v7 <= 65)
  {
    if (v7 == 7)
    {
      v15 = [v6 firstChildForElementType:49];
      [(SUUIViewElementLayoutContext *)self->_layoutContext sizeForViewElement:v15 width:a4];
      double v13 = v16;
      double v14 = v17;

      goto LABEL_17;
    }
    if (v7 == 50 && [(SUUICardViewElement *)self->_cardViewElement isAdCard])
    {
      v8 = [MEMORY[0x263F82670] currentDevice];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_16:
        double v13 = 0.0;
        double v14 = 5.0;
        goto LABEL_17;
      }
      char v9 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v10 = [v9 userInterfaceIdiom];

      if (!v10) {
        goto LABEL_16;
      }
    }
    goto LABEL_11;
  }
  if (v7 == 108)
  {
    double v13 = *MEMORY[0x263F001B0];
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
    goto LABEL_17;
  }
  if (v7 != 66)
  {
LABEL_11:
    [(SUUIViewElementLayoutContext *)self->_layoutContext sizeForViewElement:v6 width:a4];
    goto LABEL_12;
  }
  +[SUUIHorizontalLockupView sizeThatFitsWidth:v6 viewElement:self->_layoutContext context:a4];
LABEL_12:
  double v13 = v11;
  double v14 = v12;
LABEL_17:

  double v18 = v13;
  double v19 = v14;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    double v9 = 12.0;
    if ([v7 elementType] == 131) {
      goto LABEL_8;
    }
    BOOL v10 = [v8 elementType] == 131;
    double v11 = 10.0;
    double v12 = 12.0;
  }
  else
  {
    BOOL v10 = !self->_hasBackground;
    double v11 = 15.0;
    double v12 = 0.0;
  }
  if (v10) {
    double v9 = v12;
  }
  else {
    double v9 = v11;
  }
LABEL_8:

  return v9;
}

- (SUUIViewElementLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (SUUICardViewElement)cardViewElement
{
  return self->_cardViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_cardViewElement, 0);
}

@end