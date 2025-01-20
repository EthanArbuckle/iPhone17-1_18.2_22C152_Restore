@interface SUUINavigationPaletteView
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
- (SUUINavigationPaletteView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)verticalAlignment;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation SUUINavigationPaletteView

- (SUUINavigationPaletteView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SUUINavigationPaletteView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    segmentedControls = v3->_segmentedControls;
    v3->_segmentedControls = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    stretchViews = v3->_stretchViews;
    v3->_stretchViews = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    viewSpacings = v3->_viewSpacings;
    v3->_viewSpacings = (NSMapTable *)v10;
  }
  return v3;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    [(SUUINavigationPaletteView *)self setNeedsLayout];
  }
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
  v11[2] = __76__SUUINavigationPaletteView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_265400BE8;
  int64_t v14 = a4;
  id v9 = v8;
  id v12 = v9;
  objc_super v13 = &v15;
  [v7 enumerateChildrenUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

void __76__SUUINavigationPaletteView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 62) {
    char v4 = +[SUUIHorizontalListScrollView prefetchResourcesForViewElement:v3 reason:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
  }
  else {
    char v4 = [*(id *)(a1 + 32) prefetchResourcesForViewElement:v3 reason:*(void *)(a1 + 48)];
  }
  char v5 = v4;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v7 = 1;
  }
  else {
    char v7 = v5;
  }
  *(unsigned char *)(v6 + 24) = v7;
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
  uint64_t v10 = [v8 labelLayoutCache];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__SUUINavigationPaletteView_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_265400C10;
  id v15 = v10;
  id v16 = a1;
  id v14 = v8;
  double v17 = a4;
  id v11 = v10;
  id v12 = v8;
  [v9 enumerateChildrenUsingBlock:v13];
}

uint64_t __71__SUUINavigationPaletteView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 elementType];
  if (v3 <= 61)
  {
    id v4 = v8;
    if (v3 == 12) {
      goto LABEL_9;
    }
    if (v3 != 40) {
      goto LABEL_15;
    }
    double v5 = SUUIFilterBarView;
LABEL_11:
    uint64_t v3 = [(__objc2_class *)v5 requestLayoutForViewElement:v8 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
LABEL_14:
    id v4 = v8;
    goto LABEL_15;
  }
  if (v3 == 62)
  {
    double v5 = SUUIHorizontalListScrollView;
    goto LABEL_11;
  }
  if (v3 == 138)
  {
    uint64_t v6 = [*(id *)(a1 + 48) _attributedStringForLabel:v8 context:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) requestLayoutForLabel:v8 attributedString:v6 width:(uint64_t)*(double *)(a1 + 56)];
    goto LABEL_13;
  }
  id v4 = v8;
  if (v3 == 141)
  {
LABEL_9:
    uint64_t v6 = [*(id *)(a1 + 48) _attributedStringForButton:v8 context:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) requestLayoutForButton:v8 attributedString:v6 width:(uint64_t)*(double *)(a1 + 56)];
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  return MEMORY[0x270F9A758](v3, v4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = (double *)&v20;
  uint64_t v22 = 0x3010000000;
  v23 = "";
  double v24 = a3;
  uint64_t v25 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__SUUINavigationPaletteView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v15[3] = &unk_265400C38;
  id v18 = a1;
  double v19 = a3;
  id v10 = v9;
  id v16 = v10;
  double v17 = &v20;
  [v8 enumerateChildrenUsingBlock:v15];
  double v11 = v21[4];
  double v12 = v21[5];

  _Block_object_dispose(&v20, 8);
  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

uint64_t __67__SUUINavigationPaletteView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 48) _sizeForViewElement:a2 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  double v6 = *(double *)(v5 + 40);
  if (v6 < v4) {
    double v6 = v4;
  }
  *(double *)(v5 + 40) = v6;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSHashTable *)self->_artworkRelatedChildViewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  [(NSMutableArray *)self->_segmentedControls removeAllObjects];
  [(NSMutableArray *)self->_stretchViews removeAllObjects];
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  [(NSMapTable *)self->_viewSpacings removeAllObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__SUUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_265400C88;
  double v16 = a4;
  id v13 = v8;
  id v14 = v9;
  id v15 = self;
  id v10 = v9;
  id v11 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:v12];
}

void __65__SUUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  double v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__SUUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_265400C60;
  id v5 = v3;
  id v9 = v5;
  uint64_t v13 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v6;
  uint64_t v11 = v7;
  double v12 = v14;
  [v4 enumerateChildrenUsingBlock:v8];

  _Block_object_dispose(v14, 8);
}

void __65__SUUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v28 = a2;
  uint64_t v3 = [v28 elementType];
  if (v3 > 61)
  {
    if (v3 > 137)
    {
      if (v3 == 138)
      {
        id v4 = [*(id *)(a1 + 32) addLabelViewWithElement:v28 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
        [*(id *)(*(void *)(a1 + 48) + 480) addObject:v4];
        goto LABEL_22;
      }
      if (v3 != 141)
      {
LABEL_12:
        id v9 = 0;
        id v8 = 0;
        id v4 = 0;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        goto LABEL_37;
      }
LABEL_15:
      uint64_t v11 = [*(id *)(a1 + 32) addButtonWithElement:v28 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
      [v11 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
      LODWORD(v12) = -1097229926;
      [v11 setCharge:v12];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      double v10 = *(double *)(v13 + 24);
      *(void *)(v13 + 24) = 0x4022000000000000;
      id v4 = v11;
      if ([v28 elementType] == 50) {
        id v8 = v4;
      }
      else {
        id v8 = 0;
      }

      id v9 = 0;
      goto LABEL_23;
    }
    if (v3 == 62)
    {
      id v14 = [*(id *)(a1 + 32) addReusableViewWithReuseIdentifier:0x270504C30];
      [v14 reloadWithViewElement:v28 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
      double v10 = 0.0;
      objc_msgSend(v14, "setContentInset:", 0.0, *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 0.0, *(double *)(*(void *)(a1 + 48) + 456));
      [*(id *)(*(void *)(a1 + 48) + 480) addObject:v14];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      id v4 = v14;
      id v8 = v4;
      id v9 = v4;
    }
    else
    {
      if (v3 != 109) {
        goto LABEL_12;
      }
      id v5 = [[SUUISegmentedControlViewElementController alloc] initWithViewElement:v28];
      id v6 = [*(id *)(a1 + 40) clientContext];
      [(SUUISegmentedControlViewElementController *)v5 setClientContext:v6];

      uint64_t v7 = [*(id *)(a1 + 40) parentViewController];
      [(SUUISegmentedControlViewElementController *)v5 setParentViewController:v7];

      id v4 = [(SUUISegmentedControlViewElementController *)v5 segmentedControlView];
      [*(id *)(a1 + 32) addView:v4];
      [*(id *)(*(void *)(a1 + 48) + 472) addObject:v5];
      [*(id *)(*(void *)(a1 + 48) + 480) addObject:v4];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;

      id v8 = 0;
      id v9 = 0;
      double v10 = 0.0;
    }
  }
  else
  {
    if (v3 <= 39)
    {
      if (v3 != 12)
      {
        if (v3 == 32)
        {
          id v4 = [*(id *)(a1 + 32) addDividerWithElement:v28 context:*(void *)(a1 + 40)];
          [v4 setDividerOrientation:1];
          [v4 setDividerSize:16.0];
LABEL_22:
          id v8 = 0;
          id v9 = 0;
          uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
          double v10 = *(double *)(v16 + 24);
          *(void *)(v16 + 24) = 0x4022000000000000;
          goto LABEL_23;
        }
        goto LABEL_12;
      }
      goto LABEL_15;
    }
    if (v3 != 40)
    {
      if (v3 != 50) {
        goto LABEL_12;
      }
      goto LABEL_15;
    }
    id v15 = [*(id *)(a1 + 32) addReusableViewWithReuseIdentifier:0x270503B10];
    [v15 reloadWithViewElement:v28 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
    double v10 = 0.0;
    objc_msgSend(v15, "setContentInset:", 0.0, *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 0.0, *(double *)(*(void *)(a1 + 48) + 456));
    [*(id *)(*(void *)(a1 + 48) + 480) addObject:v15];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v4 = v15;
    id v9 = 0;
    id v8 = v4;
  }
LABEL_23:
  if (v4)
  {
    if (v10 > 0.00000011920929)
    {
      double v17 = *(void **)(*(void *)(a1 + 48) + 504);
      id v18 = [NSNumber numberWithDouble:v10];
      [v17 setObject:v18 forKey:v4];
    }
    [*(id *)(*(void *)(a1 + 48) + 496) setObject:v28 forKey:v4];
  }
  if (v8)
  {
    double v19 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v28];
    if (v19)
    {
      uint64_t v20 = *(void **)(*(void *)(a1 + 48) + 464);
      if (!v20)
      {
        uint64_t v21 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
        uint64_t v22 = *(void *)(a1 + 48);
        v23 = *(void **)(v22 + 464);
        *(void *)(v22 + 464) = v21;

        uint64_t v20 = *(void **)(*(void *)(a1 + 48) + 464);
      }
      [v20 setObject:v19 forKey:v8];
    }
  }
  if (v9)
  {
    double v24 = *(void **)(*(void *)(a1 + 48) + 424);
    if (!v24)
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
      uint64_t v26 = *(void *)(a1 + 48);
      v27 = *(void **)(v26 + 424);
      *(void *)(v26 + 424) = v25;

      double v24 = *(void **)(*(void *)(a1 + 48) + 424);
    }
    [v24 addObject:v9];
  }
LABEL_37:
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  id v26 = v8;
  uint64_t v10 = [v8 requestIdentifier];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = [(NSMapTable *)self->_imageViewToImageResourceCacheKey objectForKey:v15];
        double v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        id v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t v22 = v8;
            uint64_t v21 = v27;
            [v15 setImage:v27 forArtworkRequest:v8 context:v9];
          }
          else
          {
            objc_opt_class();
            uint64_t v22 = v8;
            uint64_t v21 = v27;
            if (objc_opt_isKindOfClass())
            {
              uint64_t v25 = [v15 imageView];
              [v25 setImage:v27];
            }
            else
            {
              [v15 setImage:v27];
            }
          }

          goto LABEL_23;
        }
      }
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_artworkRelatedChildViewElementViews;
  uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v30;
    uint64_t v22 = v26;
    uint64_t v21 = v27;
LABEL_12:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v30 != v20) {
        objc_enumerationMutation(obj);
      }
      if ([*(id *)(*((void *)&v29 + 1) + 8 * v23) setImage:v27 forArtworkRequest:v26 context:v9]) {
        break;
      }
      if (v19 == ++v23)
      {
        uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v19) {
          goto LABEL_12;
        }
        goto LABEL_24;
      }
    }
LABEL_23:
    LOBYTE(v19) = 1;
  }
  else
  {
    uint64_t v22 = v8;
    uint64_t v21 = v27;
  }
LABEL_24:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_viewElementViews;
  uint64_t v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [(NSMapTable *)self->_viewElementViews objectForKey:v9];
        uint64_t v11 = [v10 itmlID];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v9;
LABEL_13:
          id v14 = v13;

          goto LABEL_14;
        }
        if ([v9 conformsToProtocol:&unk_2705ED578])
        {
          id v13 = [v9 viewForElementIdentifier:v4];
          if (v13) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v6 = [(NSMapTable *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

- (void)layoutSubviews
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  [(SUUINavigationPaletteView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  v47 = (double *)&v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v11 = [(SUUIViewReuseView *)self allExistingViews];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __43__SUUINavigationPaletteView_layoutSubviews__block_invoke;
  v45[3] = &unk_265400CB0;
  v45[7] = v4;
  v45[8] = v6;
  *(double *)&v45[9] = v8;
  *(double *)&v45[10] = v10;
  v45[4] = self;
  v45[5] = &v50;
  v45[6] = &v46;
  [v11 enumerateObjectsUsingBlock:v45];
  uint64_t v35 = v6;
  uint64_t v36 = v4;
  uint64_t v12 = [(NSMutableArray *)self->_stretchViews count];
  double left = self->_contentInset.left;
  double v14 = v47[3];
  uint64_t v37 = [v11 count];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = self->_stretchViews;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v16)
  {
    double v17 = left + v14;
    uint64_t v18 = *(void *)v42;
    double v19 = (double)v12;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v21 frame];
        double v23 = v22;
        double v25 = v24;
        if ([v11 indexOfObjectIdenticalTo:v21] == v37 - 1
          && (segmentedControls = self->_segmentedControls,
              v40[0] = MEMORY[0x263EF8330],
              v40[1] = 3221225472,
              v40[2] = __43__SUUINavigationPaletteView_layoutSubviews__block_invoke_2,
              v40[3] = &unk_265400CD8,
              v40[4] = v21,
              [(NSMutableArray *)segmentedControls indexOfObjectPassingTest:v40] == 0x7FFFFFFFFFFFFFFFLL))
        {
          float v27 = v8 - v17;
          objc_msgSend(v21, "sizeThatFits:", floorf(v27), v10);
        }
        else
        {
          float v30 = (v8 - self->_contentInset.left - self->_contentInset.right - v47[3]) / v19;
          objc_msgSend(v21, "sizeThatFits:", floorf(v30), v10);
        }
        double v31 = v28;
        double v32 = v29;
        objc_msgSend(v21, "setFrame:", v23, v25, v28, v29);
        double v33 = v51[3];
        if (v33 < v32) {
          double v33 = v32;
        }
        v51[3] = v33;
        double v17 = v17 + v31;
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v16);
  }

  v39[0] = 0;
  v39[1] = v39;
  CGFloat v34 = self->_contentInset.left;
  v39[2] = 0x2020000000;
  *(CGFloat *)&v39[3] = v34;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __43__SUUINavigationPaletteView_layoutSubviews__block_invoke_3;
  v38[3] = &unk_265400D00;
  v38[4] = self;
  v38[5] = v39;
  v38[8] = v36;
  v38[9] = v35;
  *(double *)&v38[10] = v8;
  *(double *)&v38[11] = v10;
  v38[6] = &v50;
  v38[7] = v37;
  [v11 enumerateObjectsUsingBlock:v38];
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
}

void __43__SUUINavigationPaletteView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 480), "containsObject:") & 1) == 0)
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    objc_msgSend(v16, "sizeThatFits:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    double v8 = v7;
    double v10 = v9;
    objc_msgSend(v16, "setFrame:", v5, v6, v7, v9);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    double v12 = *(double *)(v11 + 24);
    if (v12 < v10) {
      double v12 = v10;
    }
    *(double *)(v11 + 24) = v12;
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
    if (a3)
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 504) objectForKey:v16];
      double v14 = v13;
      if (v13)
      {
        [v13 floatValue];
        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v15;
      }
    }
  }
}

BOOL __43__SUUINavigationPaletteView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 segmentedControlView];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __43__SUUINavigationPaletteView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v27 = a2;
  [v27 frame];
  double v6 = v5;
  double v8 = v7;
  if (a3)
  {
    double v9 = [*(id *)(*(void *)(a1 + 32) + 504) objectForKey:v27];
    double v10 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [v9 floatValue];
    double v12 = v10 + v11;
  }
  else
  {
    double v12 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  if (*(void *)(a1 + 56) - 1 == a3
    && [*(id *)(*(void *)(a1 + 32) + 480) containsObject:v27])
  {
    float v13 = (*(double *)(a1 + 80) - v6) * 0.5;
    double v14 = floorf(v13);
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v15 + 24) >= v14) {
      double v12 = *(double *)(v15 + 24);
    }
    else {
      double v12 = v14;
    }
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (*(void *)(v16 + 488))
  {
    float v17 = (*(double *)(a1 + 88) - v8) * 0.5;
    double v18 = ceilf(v17);
  }
  else
  {
    float v19 = (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v8) * 0.5;
    double v18 = *(double *)(v16 + 432) + ceilf(v19);
  }
  double v20 = v12;
  double v21 = v6;
  double v22 = v8;
  CGRect v29 = CGRectIntegral(*(CGRect *)(&v18 - 1));
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  objc_msgSend(v27, "setFrame:");
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxX(v30);
}

- (void)_buttonAction:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F08A00];
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
  double v8 = [v6 buttonText];
  double v9 = [v6 buttonTitleStyle];
  if (v9)
  {
    double v10 = [a1 _attributedStringForText:v8 style:v9 context:v7];
  }
  else
  {
    float v11 = [v6 style];
    double v10 = [a1 _attributedStringForText:v8 style:v11 context:v7];
  }
  return v10;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 text];
  double v9 = [v7 style];

  double v10 = [a1 _attributedStringForText:v8 style:v9 context:v6];

  return v10;
}

+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = SUUIViewElementFontWithStyle(v8);
  if (!v10)
  {
    double v10 = SUUIFontPreferredFontForTextStyle(5);
  }
  float v11 = [v9 tintColor];
  double v12 = SUUIViewElementPlainColorWithStyle(v8, v11);

  if (!v12)
  {
    double v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
  }
  float v13 = [v7 attributedStringWithDefaultFont:v10 foregroundColor:v12 style:v8];

  return v13;
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 elementType];
  if (v9 == 109)
  {
    double v13 = *MEMORY[0x263F001B0];
    id v10 = objc_alloc_init(MEMORY[0x263F82BB0]);
    objc_msgSend(v10, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v11 = v14;
    goto LABEL_6;
  }
  if (v9 == 62)
  {
    +[SUUIHorizontalListScrollView sizeThatFitsWidth:v7 viewElement:v8 context:a4];
LABEL_9:
    double v13 = v15;
    double v11 = v16;
    goto LABEL_10;
  }
  if (v9 != 32)
  {
    [v8 sizeForViewElement:v7 width:a4];
    goto LABEL_9;
  }
  id v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  double v11 = 16.0;
  double v13 = 1.0 / v12;
LABEL_6:

LABEL_10:
  double v17 = v13;
  double v18 = v11;
  result.CGFloat height = v18;
  result.CGFloat width = v17;
  return result;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewSpacings, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_stretchViews, 0);
  objc_storeStrong((id *)&self->_segmentedControls, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

@end