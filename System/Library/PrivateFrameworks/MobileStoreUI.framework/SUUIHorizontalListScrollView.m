@interface SUUIHorizontalListScrollView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIHorizontalListScrollView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIHorizontalListScrollView

- (SUUIHorizontalListScrollView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIHorizontalListScrollView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v4;

    id v6 = objc_alloc(MEMORY[0x263F82B88]);
    [(SUUIHorizontalListScrollView *)v3 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    scrollView = v3->_scrollView;
    v3->_scrollView = (UIScrollView *)v7;

    [(UIScrollView *)v3->_scrollView setAlwaysBounceHorizontal:0];
    [(UIScrollView *)v3->_scrollView setAlwaysBounceVertical:0];
    [(UIScrollView *)v3->_scrollView setScrollsToTop:0];
    [(UIScrollView *)v3->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v3->_scrollView setShowsVerticalScrollIndicator:0];
    [(SUUIHorizontalListScrollView *)v3 addSubview:v3->_scrollView];
  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__SUUIHorizontalListScrollView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_265400BE8;
  id v9 = v8;
  v13 = &v15;
  int64_t v14 = a4;
  id v12 = v9;
  [v7 enumerateChildrenUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __79__SUUIHorizontalListScrollView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) prefetchResourcesForViewElement:a2 reason:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = 1;
  }
  else {
    char v5 = result;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  objc_super v10 = [v8 labelLayoutCache];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__SUUIHorizontalListScrollView_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_265400C10;
  double v16 = a4;
  id v17 = a1;
  id v14 = v10;
  id v15 = v8;
  id v11 = v8;
  id v12 = v10;
  [v9 enumerateChildrenUsingBlock:v13];
}

uint64_t __74__SUUIHorizontalListScrollView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 elementType];
  if (v3 <= 137)
  {
    if (v3 == 8)
    {
      uint64_t v3 = [*(id *)(a1 + 32) requestLayoutForBadge:v7 width:(uint64_t)*(double *)(a1 + 48)];
      goto LABEL_12;
    }
    id v4 = v7;
    if (v3 != 12) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v3 == 138)
    {
      double v5 = [*(id *)(a1 + 56) _attributedStringForLabel:v7 context:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) requestLayoutForLabel:v7 attributedString:v5 width:(uint64_t)*(double *)(a1 + 48)];
      goto LABEL_10;
    }
    id v4 = v7;
    if (v3 != 141)
    {
      if (v3 != 144) {
        goto LABEL_13;
      }
      uint64_t v3 = +[SUUITomatoRatingView requestLayoutForViewElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
      goto LABEL_12;
    }
  }
  double v5 = [*(id *)(a1 + 56) _attributedStringForButton:v7 context:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) requestLayoutForButton:v7 attributedString:v5 width:(uint64_t)*(double *)(a1 + 48)];
LABEL_10:

LABEL_12:
  id v4 = v7;
LABEL_13:
  return MEMORY[0x270F9A758](v3, v4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x3010000000;
  v32 = "";
  long long v33 = *MEMORY[0x263F001B0];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__SUUIHorizontalListScrollView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v19[3] = &unk_265408948;
  id v23 = a1;
  double v24 = a3;
  id v10 = v9;
  id v20 = v10;
  v21 = &v29;
  v22 = &v25;
  [v8 enumerateChildrenUsingBlock:v19];
  uint64_t v11 = v26[3];
  id v12 = v30;
  BOOL v13 = v11 <= 1;
  uint64_t v14 = v11 - 1;
  if (v13)
  {
    double v15 = v30[4];
  }
  else
  {
    double v15 = v30[4] + (float)((float)v14 * 18.0);
    v30[4] = v15;
  }
  double v16 = v12[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  double v17 = v15;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

double __70__SUUIHorizontalListScrollView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 56) _sizeForViewElement:a2 width:*(void *)(a1 + 32) context:*(double *)(a1 + 64)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v5 + 40) >= v4) {
    double v4 = *(double *)(v5 + 40);
  }
  *(double *)(v5 + 40) = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v3 + *(double *)(v6 + 32);
  *(double *)(v6 + 32) = result;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__SUUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_265400C88;
  double v16 = a4;
  id v13 = v8;
  id v14 = v9;
  double v15 = self;
  id v10 = v9;
  id v11 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:v12];
}

void __68__SUUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__SUUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_2654023C0;
  id v9 = v3;
  uint64_t v12 = *(void *)(a1 + 56);
  double v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  [v4 enumerateChildrenUsingBlock:v8];
}

void __68__SUUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 elementType];
  id v4 = 0;
  if (v3 > 49)
  {
    if (v3 > 140)
    {
      if (v3 != 141)
      {
        if (v3 != 144) {
          goto LABEL_27;
        }
        uint64_t v5 = [*(id *)(a1 + 32) addTomatoRatingViewWithViewElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
        goto LABEL_13;
      }
    }
    else if (v3 != 50)
    {
      if (v3 != 138) {
        goto LABEL_27;
      }
      uint64_t v5 = [*(id *)(a1 + 32) addLabelViewWithElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
LABEL_13:
      id v4 = (id)v5;
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if (v3 != 8)
  {
    if (v3 != 12)
    {
      if (v3 != 32) {
        goto LABEL_27;
      }
      id v4 = [*(id *)(a1 + 32) addDividerWithElement:v14 context:*(void *)(a1 + 40)];
      [v4 setDividerOrientation:1];
      [v4 setDividerSize:16.0];
LABEL_14:
      id v6 = 0;
      if (!v4) {
        goto LABEL_21;
      }
LABEL_20:
      [*(id *)(*(void *)(a1 + 48) + 432) setObject:v14 forKey:v4];
      goto LABEL_21;
    }
LABEL_16:
    id v7 = [*(id *)(a1 + 32) addButtonWithElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
    [v7 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
    LODWORD(v8) = -1097229926;
    [v7 setCharge:v8];
    id v4 = v7;
    if ([v14 elementType] == 50) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }

    if (v4) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v6 = [*(id *)(a1 + 32) addBadgeViewWithElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
  id v4 = v6;
  if (v6) {
    goto LABEL_20;
  }
LABEL_21:
  if (v6)
  {
    id v9 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v14];
    if (v9)
    {
      id v10 = *(void **)(*(void *)(a1 + 48) + 440);
      if (!v10)
      {
        uint64_t v11 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
        uint64_t v12 = *(void *)(a1 + 48);
        id v13 = *(void **)(v12 + 440);
        *(void *)(v12 + 440) = v11;

        id v10 = *(void **)(*(void *)(a1 + 48) + 440);
      }
      [v10 setObject:v9 forKey:v6];
    }
  }
LABEL_27:
}

- (void)setContentInset:(UIEdgeInsets)a3
{
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 requestIdentifier];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v22 = v8;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v16 = -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        double v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        double v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = [v15 imageView];
            id v8 = v22;
            [v20 setImage:v22];
          }
          else
          {
            id v8 = v22;
            [v15 setImage:v22];
          }

          BOOL v19 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v19 = 0;
    id v8 = v22;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_viewElementViews;
  uint64_t v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [(NSMapTable *)self->_viewElementViews objectForKey:v9];
        uint64_t v11 = [v10 itmlID];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v9;

          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMapTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (void)layoutSubviews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(SUUIHorizontalListScrollView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  uint64_t v7 = [(SUUIViewReuseView *)self allExistingViews];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "sizeThatFits:", 1.79769313e308, v6);
        double v15 = v14;
        CGFloat v17 = v16;
        *(float *)&double v14 = (v6 - v16) * 0.5;
        CGFloat v18 = floorf(*(float *)&v14);
        objc_msgSend(v13, "setFrame:", v11, v18, v15, v16);
        v26.origin.x = v11;
        v26.origin.y = v18;
        v26.size.width = v15;
        v26.size.height = v17;
        double MaxX = CGRectGetMaxX(v26);
        v27.origin.x = v11;
        v27.origin.y = v18;
        v27.size.width = v15;
        v27.size.height = v17;
        double v11 = CGRectGetMaxX(v27) + 18.0;
        [(UIScrollView *)self->_scrollView addSubview:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    double MaxX = 0.0;
  }
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", MaxX, v6);
  [(UIScrollView *)self->_scrollView setScrollEnabled:MaxX > v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v7 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t v8 = [(SUUIViewReuseView *)self allExistingViews];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "sizeThatFits:", width, height);
        if (v6 < v14) {
          double v6 = v14;
        }
        double v7 = v7 + v13;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  if ((unint64_t)[v8 count] >= 2) {
    double v7 = v7 + (float)((float)(unint64_t)([v8 count] - 1) * 18.0);
  }
  [(UIScrollView *)self->_scrollView contentInset];
  if (v7 + v15 < width) {
    double width = v7 + v15;
  }

  double v16 = width;
  double v17 = v6;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)_buttonAction:(id)a3
{
  double v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  [v7 postNotificationName:0x2704FD0D0 object:self];
  double v6 = [(NSMapTable *)self->_viewElementViews objectForKey:v5];

  [v6 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 buttonText];
  uint64_t v9 = [v6 buttonTitleStyle];
  if (v9)
  {
    uint64_t v10 = [a1 _attributedStringForText:v8 style:v9 context:v7];
  }
  else
  {
    uint64_t v11 = [v6 style];
    uint64_t v10 = [a1 _attributedStringForText:v8 style:v11 context:v7];
  }
  return v10;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 text];
  uint64_t v9 = [v7 style];

  uint64_t v10 = [a1 _attributedStringForText:v8 style:v9 context:v6];

  return v10;
}

+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SUUIViewElementFontWithStyle(v8);
  if (!v10)
  {
    uint64_t v10 = SUUIFontForTextStyle(5);
  }
  uint64_t v11 = [v9 tintColor];
  uint64_t v12 = SUUIViewElementPlainColorWithStyle(v8, v11);

  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
  }
  double v13 = [v7 attributedStringWithDefaultFont:v10 foregroundColor:v12 style:v8];

  return v13;
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 elementType] == 32)
  {
    id v9 = [MEMORY[0x263F82B60] mainScreen];
    [v9 scale];
    double v10 = 16.0;
    double v12 = 1.0 / v11;
  }
  else
  {
    [v8 sizeForViewElement:v7 width:a4];
    double v12 = v13;
    double v10 = v14;
  }

  double v15 = v12;
  double v16 = v10;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end