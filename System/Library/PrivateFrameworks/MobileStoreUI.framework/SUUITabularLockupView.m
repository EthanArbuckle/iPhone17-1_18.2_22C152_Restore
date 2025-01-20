@interface SUUITabularLockupView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)_sizeViewsForColumn:(id)a3 toFitWidth:(double)a4;
- (SUUITabularLockupView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_layoutSubviewsForColumn:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUITabularLockupView

- (SUUITabularLockupView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUITabularLockupView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v4;
  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
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
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [[SUUITabularLockupLayout alloc] initWithLockup:v8 context:v9];
  [(SUUITabularLockupLayout *)v10 sizeColumnsToFitWidth:v9 context:a4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = [(SUUITabularLockupLayout *)v10 columns];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v16 size];
        double v18 = v17;
        v19 = [v16 childViewElements];
        [a1 _requestLayoutForViewElements:v19 width:v9 context:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  viewElementViews = self->_viewElementViews;
  id v10 = a3;
  [(NSMapTable *)viewElementViews removeAllObjects];
  v11 = [[SUUITabularLockupLayout alloc] initWithLockup:v10 context:v8];

  layout = self->_layout;
  self->_layout = v11;

  [(SUUITabularLockupLayout *)self->_layout sizeColumnsToFitWidth:v8 context:a4];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__SUUITabularLockupView_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_2654024D8;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:v14];
}

void __61__SUUITabularLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(*(void *)(a1 + 32) + 424) columns];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__SUUITabularLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v6[3] = &unk_2654024B0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __61__SUUITabularLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 size];
  double v5 = v4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = objc_msgSend(v3, "childViewElements", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 elementType] == 138)
        {
          uint64_t v12 = *(void **)(a1 + 32);
          id v13 = v11;
          uint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "addLabelViewWithElement:width:context:", v13, *(void *)(a1 + 32), (double)objc_msgSend(v12, "maxWidthForElement:withDefaultWidth:", v13, (uint64_t)v5));

          if (v14)
          {
            [*(id *)(*(void *)(a1 + 48) + 432) setObject:v14 forKey:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SUUITabularLockupView;
  [(SUUITabularLockupView *)&v12 layoutSubviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(SUUITabularLockupLayout *)self->_layout columns];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SUUITabularLockupView *)self _layoutSubviewsForColumn:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[SUUITabularLockupLayout fontForLabelViewElement:v5 context:v6];
  long long v8 = [v5 style];
  long long v9 = [v6 tintColor];

  long long v10 = SUUIViewElementPlainColorWithStyle(v8, v9);

  if (!v10)
  {
    long long v10 = [MEMORY[0x263F825C8] blackColor];
  }
  long long v11 = [v5 text];
  objc_super v12 = [v5 style];
  id v13 = [v11 attributedStringWithDefaultFont:v7 foregroundColor:v10 style:v12];

  return v13;
}

+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  long long v9 = [v8 labelLayoutCache];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v15 elementType] == 138)
        {
          id v16 = v15;
          uint64_t v17 = [v8 maxWidthForElement:v16 withDefaultWidth:(uint64_t)a4];
          long long v18 = [a1 _attributedStringForLabel:v16 context:v8];
          [v9 requestLayoutForLabel:v16 attributedString:v18 width:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)_layoutSubviewsForColumn:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  [(SUUITabularLockupView *)self bounds];
  CGFloat v30 = v7;
  CGFloat v31 = v6;
  CGFloat v28 = v9;
  CGFloat v29 = v8;
  [(SUUITabularLockupView *)self bounds];
  [(SUUITabularLockupView *)self _sizeViewsForColumn:v4 toFitWidth:CGRectGetWidth(v39)];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = [v4 childViewElements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [(NSMapTable *)self->_viewElementViews objectForKey:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v15 frame];
        double v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat rect = v18;
        switch(v5)
        {
          case 2:
            v42.origin.y = v30;
            v42.origin.x = v31;
            v42.size.height = v28;
            v42.size.width = v29;
            double Width = CGRectGetWidth(v42);
            v43.origin.x = v17;
            v43.origin.y = v19;
            v43.size.width = v21;
            v43.size.height = v23;
            double v17 = Width - CGRectGetWidth(v43);
            break;
          case 1:
            v40.origin.y = v30;
            v40.origin.x = v31;
            v40.size.height = v28;
            v40.size.width = v29;
            double v24 = CGRectGetWidth(v40);
            v41.origin.x = v17;
            v41.origin.y = v19;
            v41.size.width = v21;
            v41.size.height = v23;
            double v17 = floor((v24 - CGRectGetWidth(v41)) * 0.5);
            break;
          case 0:
            double v17 = 0.0;
            break;
        }
        v44.origin.x = v31;
        v44.origin.y = v30;
        v44.size.width = v29;
        v44.size.height = v28;
        double Height = CGRectGetHeight(v44);
        v45.origin.x = v17;
        v45.origin.y = rect;
        v45.size.width = v21;
        v45.size.height = v23;
        CGFloat v27 = CGRectGetHeight(v45);
        objc_msgSend(v15, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v17, floor((Height - v27) * 0.5), v21, v23, v31, v30, v29, v28));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }
}

- (CGSize)_sizeViewsForColumn:(id)a3 toFitWidth:(double)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x3010000000;
  double v16 = "";
  long long v17 = *MEMORY[0x263F001B0];
  double v7 = [v6 childViewElements];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__SUUITabularLockupView__sizeViewsForColumn_toFitWidth___block_invoke;
  v12[3] = &unk_265402500;
  *(double *)&v12[6] = a4;
  v12[4] = self;
  v12[5] = &v13;
  [v7 enumerateObjectsUsingBlock:v12];
  double v8 = v14[4];
  double v9 = v14[5];

  _Block_object_dispose(&v13, 8);
  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __56__SUUITabularLockupView__sizeViewsForColumn_toFitWidth___block_invoke(uint64_t a1, uint64_t a2)
{
  id v15 = [*(id *)(*(void *)(a1 + 32) + 432) objectForKey:a2];
  uint64_t v3 = *MEMORY[0x263F001A8];
  uint64_t v4 = *(void *)(MEMORY[0x263F001A8] + 8);
  objc_msgSend(v15, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  uint64_t v7 = v6;
  if (v5 >= *(double *)(a1 + 48)) {
    double v8 = *(double *)(a1 + 48);
  }
  else {
    double v8 = v5;
  }
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  CGRect v17 = CGRectIntegral(*(CGRect *)(&v7 - 3));
  double width = v17.size.width;
  double height = v17.size.height;
  objc_msgSend(v15, "setFrame:", v17.origin.x, v17.origin.y);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = height
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  double v14 = *(double *)(v13 + 32);
  if (v14 < width) {
    double v14 = width;
  }
  *(double *)(v13 + 32) = v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end