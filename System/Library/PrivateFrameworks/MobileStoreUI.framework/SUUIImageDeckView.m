@interface SUUIImageDeckView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)imageViews;
- (SUUIImageDeckView)init;
- (UIEdgeInsets)contentInset;
- (id)viewForElementIdentifier:(id)a3;
- (void)_layoutImages;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setImageViews:(id)a3;
@end

@implementation SUUIImageDeckView

- (SUUIImageDeckView)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIImageDeckView;
  v2 = [(SUUIImageDeckView *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElementViews = v2->_viewElementViews;
    v2->_viewElementViews = (NSMapTable *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F82708]) initWithReferenceView:v2];
    animator = v2->_animator;
    v2->_animator = (UIDynamicAnimator *)v5;
  }
  return v2;
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
  v11[2] = __68__SUUIImageDeckView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

void __68__SUUIImageDeckView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 elementType] == 49)
  {
    uint64_t v3 = (void *)MEMORY[0x263F825C8];
    id v4 = v9;
    uint64_t v5 = [v3 colorWithWhite:0.0 alpha:0.15];
    [v4 setShadowColor:v5];

    objc_msgSend(v4, "setShadowOffset:", 5.0, 0.0);
    [v4 setShadowRadius:7.0];
  }
  char v6 = [*(id *)(a1 + 32) prefetchResourcesForViewElement:v9 reason:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = 1;
  }
  else {
    char v8 = v6;
  }
  *(unsigned char *)(v7 + 24) = v8;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = (double *)&v15;
  uint64_t v17 = 0x3010000000;
  char v18 = "";
  long long v19 = *MEMORY[0x263F001B0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__SUUIImageDeckView_preferredSizeForViewElement_context___block_invoke;
  v12[3] = &unk_265403F90;
  id v7 = v6;
  id v13 = v7;
  int64_t v14 = &v15;
  [v5 enumerateChildrenUsingBlock:v12];
  double v8 = v16[4];
  double v9 = v16[5];

  _Block_object_dispose(&v15, 8);
  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

uint64_t __57__SUUIImageDeckView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 elementType];
  if (v3 == 49)
  {
    uint64_t v3 = [*(id *)(a1 + 32) sizeForImageElement:v11];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v6 + 40) >= v5) {
      double v5 = *(double *)(v6 + 40);
    }
    *(double *)(v6 + 40) = v5;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    double v8 = *(double *)(v7 + 32);
    if (v8 >= 0.00000011920929)
    {
      float v9 = v4 / 3.0;
      double v4 = v8 + floorf(v9);
    }
    *(double *)(v7 + 32) = v4;
  }
  return MEMORY[0x270F9A790](v3);
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SUUIImageDeckView_requestLayoutForViewElement_width_context___block_invoke;
  v9[3] = &unk_265405690;
  double v11 = a4;
  id v10 = v7;
  id v8 = v7;
  [a3 enumerateChildrenUsingBlock:v9];
}

void __63__SUUIImageDeckView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 49) {
    +[SUUIAdornedImageView requestLayoutForViewElement:v3 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v17 = 0;
  char v18 = (double *)&v17;
  uint64_t v19 = 0x3010000000;
  v20 = "";
  uint64_t v22 = *(void *)(MEMORY[0x263F001B0] + 8);
  double v21 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__SUUIImageDeckView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v14[3] = &unk_265403F90;
  id v9 = v8;
  id v15 = v9;
  v16 = &v17;
  [v7 enumerateChildrenUsingBlock:v14];
  double v10 = v18[4];
  double v11 = v18[5];

  _Block_object_dispose(&v17, 8);
  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __59__SUUIImageDeckView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 elementType] == 49)
  {
    [*(id *)(a1 + 32) sizeForImageElement:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    double v5 = *(double *)(v4 + 40);
    if (v5 < v3) {
      double v5 = v3;
    }
    *(double *)(v4 + 40) = v5;
  }
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_storeStrong((id *)&self->_imageDeckViewElement, a3);
  self->_fitWidth = a4;
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke;
  char v18 = &unk_265405FA8;
  id v19 = v9;
  id v20 = v10;
  double v21 = self;
  id v22 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(SUUIViewReuseView *)self modifyUsingBlock:&v15];
  -[SUUIImageDeckView setImageViews:](self, "setImageViews:", v12, v15, v16, v17, v18);
}

void __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2654058F8;
  id v10 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v8 = v3;
  [v4 enumerateChildrenUsingBlock:v9];
}

uint64_t __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t isKindOfClass = [v11 elementType];
  if (isKindOfClass == 49)
  {
    id v4 = [*(id *)(a1 + 32) addImageViewWithElement:v11 context:*(void *)(a1 + 40)];
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0) {
      uint64_t isKindOfClass = [v4 setUserInteractionEnabled:0];
    }
    if (v4)
    {
      [*(id *)(*(void *)(a1 + 48) + 448) setObject:v11 forKey:v4];
      [*(id *)(*(void *)(a1 + 48) + 448) setObject:v4 forKey:v11];
      [*(id *)(a1 + 56) addObject:v4];
      id v5 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v11];
      if (v5)
      {
        uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 464);
        if (!v6)
        {
          uint64_t v7 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
          uint64_t v8 = *(void *)(a1 + 48);
          id v9 = *(void **)(v8 + 464);
          *(void *)(v8 + 464) = v7;

          uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 464);
        }
        [v6 setObject:v5 forKey:v4];
      }
    }
  }
  return MEMORY[0x270F9A790](isKindOfClass);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIImageDeckView *)self _layoutImages];
    [(SUUIImageDeckView *)self setNeedsLayout];
  }
}

- (void)setImageViews:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_imageViews, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_imageViews, a3);
    [(SUUIImageDeckView *)self _layoutImages];
    [(SUUIImageDeckView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 requestIdentifier];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v20 = 0;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = [(NSMapTable *)self->_imageViewToImageResourceCacheKey objectForKey:v14];
        uint64_t v16 = [v8 requestIdentifierForResourceCacheKey:v15];
        uint64_t v17 = v16;
        if (v16 && [v16 unsignedIntegerValue] == v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v18 = [v14 imageView];
            [v18 setImage:v21];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v14 setImage:v21 cacheKey:v15 context:v8];
            }
            else {
              [v14 setImage:v21];
            }
          }
          char v20 = 1;
        }
      }
      uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
  else
  {
    char v20 = 0;
  }

  return v20 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__101;
  id v19 = __Block_byref_object_dispose__101;
  id v20 = 0;
  id v5 = [(SUUIViewReuseView *)self allExistingViews];
  uint64_t v6 = [(SUUIViewElement *)self->_imageDeckViewElement flattenedChildren];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__SUUIImageDeckView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_265401BB8;
  id v7 = v4;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v6 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __46__SUUIImageDeckView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = [a2 itmlID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    if ([*(id *)(a1 + 40) count] > a3)
    {
      uint64_t v9 = [*(id *)(a1 + 40) objectAtIndex:a3];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    *a4 = 1;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (double *)MEMORY[0x263F001B0];
  double fitWidth = self->_fitWidth;
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(SUUIImageDeckView *)self imageViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    double v10 = *v3;
    double v11 = v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "sizeThatFits:", v10, v5);
        if (v11 < v13) {
          double v11 = v13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    double v11 = v5;
  }

  double v14 = fitWidth;
  double v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SUUIImageDeckView;
  [(SUUIImageDeckView *)&v12 layoutSubviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(SUUIImageDeckView *)self imageViews];
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
        [(SUUIImageDeckView *)self sendSubviewToBack:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_layoutImages
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v3 = [(SUUIImageDeckView *)self imageViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v61 objects:v67 count:16];
  double v52 = 0.0;
  uint64_t v5 = (double *)MEMORY[0x263F001B0];
  double v6 = 0.0;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v62;
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v62 != v8) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * i), "sizeThatFits:", v9, v10);
        double v6 = v6 + v12;
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v7);
  }

  double fitWidth = self->_fitWidth;
  [(SUUIImageDeckView *)self contentInset];
  double v15 = v14;
  [(SUUIImageDeckView *)self contentInset];
  double v17 = v16;
  long long v18 = [(SUUIImageDeckView *)self imageViews];
  unint64_t v19 = [v18 count];

  if (v19 >= 2)
  {
    id v20 = [(SUUIImageDeckView *)self imageViews];
    double v52 = (v6 - (fitWidth - (v15 + v17))) / (double)(unint64_t)([v20 count] - 1);
  }
  [(SUUIImageDeckView *)self contentInset];
  double v22 = v21;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v23 = [(SUUIImageDeckView *)self imageViews];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v58;
    double v28 = *v5;
    double v27 = v5[1];
    double v29 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * j), "sizeThatFits:", v28, v27);
        if (v29 < v31) {
          double v29 = v31;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v25);
  }
  else
  {
    double v29 = 0.0;
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v32 = [(SUUIImageDeckView *)self imageViews];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v54;
    double v36 = v5[1];
    double v51 = *v5;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(v32);
        }
        v38 = *(void **)(*((void *)&v53 + 1) + 8 * k);
        objc_msgSend(v38, "frame", *(void *)&v51);
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        objc_msgSend(v38, "sizeThatFits:", v51, v36);
        double v44 = v43;
        double v46 = v45;
        [(SUUIImageDeckView *)self contentInset];
        double v48 = v47;
        v69.origin.x = v40;
        v69.origin.y = v42;
        v69.size.width = v44;
        v69.size.height = v46;
        CGFloat v49 = v48 + v29 - CGRectGetHeight(v69);
        objc_msgSend(v38, "setFrame:", v22, v49, v44, v46);
        [(SUUIImageDeckView *)self sendSubviewToBack:v38];
        v70.origin.x = v22;
        v70.origin.y = v49;
        v70.size.width = v44;
        v70.size.height = v46;
        float v50 = v22 + CGRectGetWidth(v70) - v52;
        double v22 = floorf(v50);
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v34);
  }
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImageView, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_imageDeckViewElement, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

@end