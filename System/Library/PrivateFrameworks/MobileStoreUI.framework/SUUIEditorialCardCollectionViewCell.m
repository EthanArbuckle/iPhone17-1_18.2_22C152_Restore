@interface SUUIEditorialCardCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIEditorialCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SUUIEditorialCardCollectionViewCell

- (SUUIEditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIEditorialCardCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    allLockupViews = v3->_allLockupViews;
    v3->_allLockupViews = v4;

    [(SUUIViewReuseCollectionViewCell *)v3 registerClass:objc_opt_class() forViewWithReuseIdentifier:@"editorialCardLockup"];
  }
  return v3;
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  +[SUUIVerticalLockupView maximumPerspectiveHeightForSize:](SUUIVerticalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  primaryLockupView = self->_primaryLockupView;
  id v4 = a3;
  [(SUUIVerticalLockupView *)primaryLockupView setPerspectiveTargetView:v4];
}

- (void)setVanishingPoint:(CGPoint)a3
{
}

- (void)updateForChangedDistanceFromVanishingPoint
{
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
  v11[2] = __86__SUUIEditorialCardCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_265400BE8;
  int64_t v14 = a4;
  id v9 = v8;
  id v12 = v9;
  v13 = &v15;
  [v7 enumerateChildrenUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

void __86__SUUIEditorialCardCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  if ([v6 elementType] == 66)
  {
    BOOL v3 = +[SUUIVerticalLockupView prefetchResourcesForViewElement:v6 reason:a1[6] context:a1[4]];
    uint64_t v4 = *(void *)(a1[5] + 8);
    if (*(unsigned char *)(v4 + 24)) {
      char v5 = 1;
    }
    else {
      char v5 = v3;
    }
    *(unsigned char *)(v4 + 24) = v5;
  }
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [[SUUIEditorialCardLayout alloc] initWithCard:v8 width:v7 context:a4];

  double v10 = [(SUUIEditorialCardLayout *)v9 primaryLockup];
  if (v10)
  {
    [(SUUIEditorialCardLayout *)v9 primaryLockupSize];
    +[SUUIVerticalLockupView requestLayoutForViewElement:width:context:](SUUIVerticalLockupView, "requestLayoutForViewElement:width:context:", v10, v7);
  }
  [(SUUIEditorialCardLayout *)v9 secondaryLockupWidth];
  uint64_t v12 = v11;
  double v13 = [(SUUIEditorialCardLayout *)v9 allLockups];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__SUUIEditorialCardCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v16[3] = &unk_265407C00;
  uint64_t v19 = v12;
  id v17 = v10;
  id v18 = v7;
  id v14 = v7;
  id v15 = v10;
  [v13 enumerateObjectsUsingBlock:v16];
}

uint64_t __81__SUUIEditorialCardCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    return +[SUUIVerticalLockupView requestLayoutForViewElement:a2 width:*(void *)(result + 40) context:*(double *)(result + 48)];
  }
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v26 = 0;
  v27 = (double *)&v26;
  uint64_t v28 = 0x3010000000;
  v29 = "";
  double v30 = a3;
  uint64_t v31 = 0;
  double v9 = [[SUUIEditorialCardLayout alloc] initWithCard:v7 width:v8 context:a3];
  double v10 = [(SUUIEditorialCardLayout *)v9 primaryLockup];
  if (v10)
  {
    [(SUUIEditorialCardLayout *)v9 primaryLockupSize];
    *((void *)v27 + 5) = v11;
  }
  [(SUUIEditorialCardLayout *)v9 secondaryLockupWidth];
  uint64_t v13 = v12;
  id v14 = [(SUUIEditorialCardLayout *)v9 allLockups];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__SUUIEditorialCardCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v21[3] = &unk_265407C28;
  id v15 = v10;
  id v22 = v15;
  uint64_t v25 = v13;
  id v16 = v8;
  id v23 = v16;
  v24 = &v26;
  [v14 enumerateObjectsUsingBlock:v21];

  double v17 = v27[4];
  double v18 = v27[5];

  _Block_object_dispose(&v26, 8);
  double v19 = v17;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

uint64_t __77__SUUIEditorialCardCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2)
  {
    uint64_t v2 = result;
    CGSize result = +[SUUIVerticalLockupView sizeThatFitsWidth:a2 viewElement:*(void *)(v2 + 40) context:*(double *)(v2 + 56)];
    uint64_t v4 = *(void *)(*(void *)(v2 + 48) + 8);
    double v5 = *(double *)(v4 + 40);
    if (v5 < v3) {
      double v5 = v3;
    }
    *(double *)(v4 + 40) = v5;
  }
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [[SUUIEditorialCardLayout alloc] initWithCard:v8 width:v9 context:a4];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__83;
  double v30 = __Block_byref_object_dispose__83;
  id v31 = 0;
  [(NSMutableArray *)self->_allLockupViews removeAllObjects];
  primaryLockupView = self->_primaryLockupView;
  self->_primaryLockupView = 0;

  [(SUUIEditorialCardLayout *)v10 primaryLockupSize];
  self->_primaryLockupSize.width = v12;
  self->_primaryLockupSize.height = v13;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  double v20 = __75__SUUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v21 = &unk_265407C78;
  id v14 = v10;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  v24 = self;
  uint64_t v25 = &v26;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:&v18];
  id v16 = (void *)v27[5];
  if (v16)
  {
    double v17 = objc_msgSend(v16, "superview", v18, v19, v20, v21, v22);
    [v17 bringSubviewToFront:v27[5]];
  }
  _Block_object_dispose(&v26, 8);
}

void __75__SUUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) primaryLockup];
  [*(id *)(a1 + 32) secondaryLockupWidth];
  uint64_t v6 = v5;
  id v7 = [*(id *)(a1 + 32) allLockups];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__SUUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v10[3] = &unk_265407C50;
  id v11 = v3;
  id v12 = v4;
  uint64_t v15 = v6;
  id v13 = *(id *)(a1 + 40);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v8 = v4;
  id v9 = v3;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __75__SUUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) addReusableViewWithReuseIdentifier:@"editorialCardLockup"];
  [v3 setSizingStyle:0];
  if (*(id *)(a1 + 40) == v5)
  {
    objc_msgSend(v3, "reloadWithViewElement:width:context:", *(double *)(*(void *)(a1 + 56) + 832));
    objc_storeStrong((id *)(*(void *)(a1 + 56) + 824), v3);
  }
  else
  {
    objc_msgSend(v3, "reloadWithViewElement:width:context:", *(double *)(a1 + 72));
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v4 = [v5 firstChildForElementType:13];

    if (v4) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
    }
  }
  [*(id *)(*(void *)(a1 + 56) + 816) addObject:v3];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = self->_allLockupViews;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v11);
        }
        v14 |= objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "setImage:forArtworkRequest:context:", v8, v9, v10, (void)v18);
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = self->_allLockupViews;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        v13 |= objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "updateWithItemState:context:animated:", v8, v9, v5, (void)v17);
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13 & 1;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = self->_allLockupViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "viewForElementIdentifier:", v4, (void)v13);
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (void)layoutSubviews
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)SUUIEditorialCardCollectionViewCell;
  [(SUUICollectionViewCell *)&v49 layoutSubviews];
  uint64_t v3 = [(NSMutableArray *)self->_allLockupViews count];
  uint64_t v4 = v3 - 1;
  if (v3 >= 1)
  {
    uint64_t v5 = v3;
    uint64_t v6 = [(SUUIEditorialCardCollectionViewCell *)self contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(SUUIViewReuseCollectionViewCell *)self contentInset];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v12 - (v17 + v21);

    double v23 = (double)v4;
    float v24 = v22 - (double)v4 * 15.0;
    double v25 = floorf(v24);
    if (self->_primaryLockupView) {
      double v25 = v25 - self->_primaryLockupSize.width;
    }
    else {
      double v23 = (double)v5;
    }
    double v26 = v25 / v23;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v27 = self->_allLockupViews;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      double v30 = v8 + v18;
      double v31 = v10 + v16;
      double v32 = v14 - (v16 + v20);
      float v33 = v26;
      double v34 = floorf(v33);
      uint64_t v35 = *(void *)v46;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v27);
          }
          v37 = *(SUUIVerticalLockupView **)(*((void *)&v45 + 1) + 8 * v36);
          CGFloat width = v34;
          CGFloat height = v32;
          if (v37 == self->_primaryLockupView)
          {
            CGFloat width = self->_primaryLockupSize.width;
            CGFloat height = self->_primaryLockupSize.height;
          }
          v40 = [(SUUIEditorialCardCollectionViewCell *)self contentView];
          [v40 bounds];
          [(SUUIVerticalLockupView *)v37 setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v30, v31, width, height, v41, v42, v43, v44)];

          v52.origin.x = v30;
          v52.origin.y = v31;
          v52.size.CGFloat width = width;
          v52.size.CGFloat height = height;
          double v30 = CGRectGetMaxX(v52) + 15.0;
          ++v36;
        }
        while (v29 != v36);
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v29);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLockupView, 0);
  objc_storeStrong((id *)&self->_allLockupViews, 0);
}

@end