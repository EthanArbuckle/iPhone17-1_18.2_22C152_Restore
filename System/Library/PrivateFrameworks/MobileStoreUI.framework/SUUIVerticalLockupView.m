@interface SUUIVerticalLockupView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)_bottomInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (double)_topInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIVerticalLockupView)initWithFrame:(CGRect)a3;
- (double)opacityOfViewsOtherThanProductImageView;
- (double)zoomingImageAlpha;
- (double)zoomingImageWidth;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)sizingStyle;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)dealloc;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setOpacityOfViewsOtherThanProductImageView:(double)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setSizingStyle:(int64_t)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)setZoomingImageAlpha:(double)a3;
- (void)setZoomingImageWidth:(double)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SUUIVerticalLockupView

- (SUUIVerticalLockupView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIVerticalLockupView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    lineSpacings = v3->_lineSpacings;
    v3->_lineSpacings = (NSMapTable *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    topInsets = v3->_topInsets;
    v3->_topInsets = (NSMapTable *)v6;

    v3->_opacityOfViewsOtherThanProductImageView = 1.0;
    v3->_zoomingImageAlpha = 1.0;
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v8;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89738] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIVerticalLockupView;
  [(SUUIViewReuseView *)&v4 dealloc];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  +[SUUIStackedImageView maximumPerspectiveHeightForSize:](SUUIStackedImageView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  objc_initWeak(&location, a3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SUUIVerticalLockupView_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_265405AE0;
  objc_copyWeak(&v5, &location);
  [(SUUIViewReuseView *)self enumerateExistingViewsForReuseIdentifier:0x270504D70 usingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SUUIVerticalLockupView_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setPerspectiveTargetView:WeakRetained];
}

- (void)setVanishingPoint:(CGPoint)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SUUIVerticalLockupView_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  CGPoint v4 = a3;
  [(SUUIViewReuseView *)self enumerateExistingViewsForReuseIdentifier:0x270504D70 usingBlock:v3];
}

uint64_t __44__SUUIVerticalLockupView_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

uint64_t __68__SUUIVerticalLockupView_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateForChangedDistanceFromVanishingPoint];
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
  v11[2] = __73__SUUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __73__SUUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = (double *)&v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v8 = [v6 style];
  id v9 = [v8 valueForStyle:@"itml-lockup-min-width"];

  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 80.0;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__SUUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke;
  v18[3] = &unk_265400BE8;
  id v12 = v7;
  id v19 = v12;
  v20 = &v22;
  double v21 = v11;
  [v6 enumerateChildrenUsingBlock:v18];
  [a1 sizeThatFitsWidth:v6 viewElement:v12 context:v23[3]];
  double v15 = v14;
  if (v13 >= v11) {
    double v11 = v13;
  }

  _Block_object_dispose(&v22, 8);
  double v16 = v11;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

void __62__SUUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 elementType];
  if (v3 <= 137)
  {
    if (v3 != 12)
    {
      if (v3 == 49)
      {
        [*(id *)(a1 + 32) sizeForImageElement:v9];
LABEL_19:
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(double *)(v4 + 24) >= v5) {
          double v5 = *(double *)(v4 + 24);
        }
        goto LABEL_21;
      }
      if (v3 != 62) {
        goto LABEL_22;
      }
    }
LABEL_9:
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    double v5 = *(double *)(v4 + 24);
    if (v5 < *(double *)(a1 + 48)) {
      double v5 = *(double *)(a1 + 48);
    }
LABEL_21:
    *(double *)(v4 + 24) = v5;
    goto LABEL_22;
  }
  if (v3 <= 151)
  {
    if (v3 != 138 && v3 != 141) {
      goto LABEL_22;
    }
    goto LABEL_9;
  }
  if (v3 != 152)
  {
    if (v3 != 154) {
      goto LABEL_22;
    }
    +[SUUIImageGridView preferredSizeForViewElement:v9 context:*(void *)(a1 + 32)];
    goto LABEL_19;
  }
  id v6 = [v9 thumbnailImage];
  [*(id *)(a1 + 32) sizeForImageElement:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v8 + 24) >= v7) {
    double v7 = *(double *)(v8 + 24);
  }
  *(double *)(v8 + 24) = v7;

LABEL_22:
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v26 = 0;
  v27 = (double *)&v26;
  uint64_t v28 = 0x3010000000;
  v29 = "";
  long long v30 = *MEMORY[0x263F001B0];
  double v10 = [v9 labelLayoutCache];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  char v18 = __68__SUUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke;
  id v19 = &unk_265407388;
  id v11 = v10;
  id v20 = v11;
  double v24 = a4;
  id v25 = a1;
  id v12 = v9;
  id v21 = v12;
  uint64_t v22 = &v31;
  v23 = &v26;
  [v8 enumerateChildrenUsingBlock:&v16];
  if (*((unsigned char *)v32 + 24))
  {
    objc_msgSend(v12, "aggregateValueForKey:", @"SUUIVLABS", v16, v17, v18, v19, v20);
    double v13 = (SUUISizeValue *)objc_claimAutoreleasedReturnValue();
    double v14 = v13;
    if (v13)
    {
      -[SUUISizeValue unionWithSize:](v13, "unionWithSize:", v27[4], v27[5]);
    }
    else
    {
      double v15 = [SUUISizeValue alloc];
      double v14 = -[SUUISizeValue initWithSize:](v15, "initWithSize:", v27[4], v27[5]);
      [v12 setAggregateValue:v14 forKey:@"SUUIVLABS"];
    }
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);
}

void __68__SUUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 elementType];
  if (v4 > 134)
  {
    switch(v4)
    {
      case 135:
        double v5 = SUUIStarRatingViewElementView;
        goto LABEL_32;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_36;
      case 138:
        char v21 = 0;
        id v9 = [v3 style];
        SUUIViewElementMarginForStyle(v9, &v21);
        double v11 = v10;
        double v13 = v12;

        if (v21) {
          double v14 = *(double *)(a1 + 64) - v11 - v13;
        }
        else {
          double v14 = *(double *)(a1 + 64);
        }
        id v8 = [*(id *)(a1 + 72) _attributedStringForLabel:v3 context:*(void *)(a1 + 40)];
        [*(id *)(a1 + 32) requestLayoutForLabel:v3 attributedString:v8 width:(uint64_t)v14];
        goto LABEL_25;
      case 141:
        goto LABEL_20;
      case 144:
        double v5 = SUUITomatoRatingView;
        goto LABEL_32;
      default:
        if (v4 != 152)
        {
          if (v4 != 154) {
            goto LABEL_36;
          }
          goto LABEL_15;
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          goto LABEL_36;
        }
        uint64_t v16 = *(void **)(a1 + 40);
        uint64_t v17 = [v3 thumbnailImage];
        [v16 sizeForImageElement:v17];
        uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
        *(void *)(v18 + 32) = v19;
        *(void *)(v18 + 40) = v20;

        break;
    }
    goto LABEL_35;
  }
  if (v4 <= 48)
  {
    if (v4 == 8)
    {
      [*(id *)(a1 + 32) requestLayoutForBadge:v3 width:(uint64_t)*(double *)(a1 + 64)];
      goto LABEL_36;
    }
    if (v4 == 12)
    {
LABEL_20:
      id v8 = [*(id *)(a1 + 72) _attributedStringForButton:v3 context:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) requestLayoutForButton:v3 attributedString:v8 width:(uint64_t)*(double *)(a1 + 64)];
LABEL_25:

      goto LABEL_36;
    }
    if (v4 != 48) {
      goto LABEL_36;
    }
    double v5 = SUUISectionHeaderView;
LABEL_32:
    [(__objc2_class *)v5 requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
    goto LABEL_36;
  }
  if (v4 > 61)
  {
    if (v4 == 62)
    {
      double v5 = SUUIHorizontalListView;
    }
    else
    {
      if (v4 != 77) {
        goto LABEL_36;
      }
      double v5 = SUUIOfferView;
    }
    goto LABEL_32;
  }
  if (v4 == 49)
  {
    +[SUUIAdornedImageView requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 40) sizeForImageElement:v3];
      goto LABEL_29;
    }
  }
  else if (v4 == 51)
  {
    +[SUUIImageDeckView requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
LABEL_15:
    +[SUUIImageGridView requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      +[SUUIImageGridView sizeThatFitsWidth:v3 viewElement:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
LABEL_29:
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      *(void *)(v15 + 32) = v6;
      *(void *)(v15 + 40) = v7;
LABEL_35:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
LABEL_36:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v35 = 0;
  v36 = (double *)&v35;
  uint64_t v37 = 0x3010000000;
  v38 = "";
  uint64_t v10 = MEMORY[0x263F001B0];
  long long v39 = *MEMORY[0x263F001B0];
  uint64_t v31 = 0;
  v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__75;
  v29[4] = __Block_byref_object_dispose__75;
  id v30 = 0;
  double v11 = [v9 aggregateValueForKey:@"SUUIVLAUBS"];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    double v13 = [v9 aggregateValueForKey:@"SUUIVLABS"];
  }
  else
  {
    double v13 = 0;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__SUUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v21[3] = &unk_2654073B0;
  id v14 = v9;
  double v27 = a3;
  id v22 = v14;
  double v24 = v29;
  id v15 = v13;
  id v23 = v15;
  id v25 = &v31;
  id v28 = a1;
  uint64_t v26 = &v35;
  [v8 enumerateChildrenUsingBlock:v21];
  double v17 = v36[4];
  double v16 = v36[5];
  if (v16 - v32[3] >= *(double *)(v10 + 8)) {
    double v18 = v16 - v32[3];
  }
  else {
    double v18 = *(double *)(v10 + 8);
  }
  v36[5] = v18;

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  double v19 = v17;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

void __64__SUUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", *(double *)(a1 + 72));
  double v4 = v3;
  double v6 = v5;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && *(void *)(a1 + 40))
  {
    uint64_t v7 = [v18 elementType];
    if (v7 != 154)
    {
      if (v7 == 152)
      {
        uint64_t v11 = [v18 thumbnailImage];
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
        goto LABEL_8;
      }
      if (v7 != 49) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v18;
    uint64_t v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
LABEL_8:

    [*(id *)(a1 + 40) size];
    double v6 = v13;
  }
LABEL_9:
  [*(id *)(a1 + 80) _bottomInsetForViewElement:v18 width:*(void *)(a1 + 32) context:*(double *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v6
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 40);
  [*(id *)(a1 + 80) _topInsetForViewElement:v18 width:*(void *)(a1 + 32) context:*(double *)(a1 + 72)];
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v15
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 40);
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  double v17 = *(double *)(v16 + 32);
  if (v17 < v4) {
    double v17 = v4;
  }
  *(double *)(v16 + 32) = v17;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_storeStrong((id *)&self->_lockupElement, a3);
  [(NSMapTable *)self->_lineSpacings removeAllObjects];
  [(NSMapTable *)self->_topInsets removeAllObjects];
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  productImageBoundingSize = self->_productImageBoundingSize;
  self->_productImageBoundingSize = 0;

  productImageView = self->_productImageView;
  self->_productImageView = 0;

  [(NSHashTable *)self->_artworkRelatedChildViewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  double v13 = [v10 aggregateValueForKey:@"SUUIVLAUBS"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    double v15 = [v10 aggregateValueForKey:@"SUUIVLABS"];
    uint64_t v16 = self->_productImageBoundingSize;
    self->_productImageBoundingSize = v15;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke;
  v23[3] = &unk_265400C88;
  id v17 = v9;
  id v24 = v17;
  double v27 = a4;
  id v18 = v10;
  id v25 = v18;
  uint64_t v26 = self;
  [(SUUIViewReuseView *)self modifyUsingBlock:v23];
  double v19 = self->_productImageView;
  if (v19)
  {
    [(UIView *)v19 transform];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
  }
  *(_OWORD *)&self->_productImageViewOriginalTransform.a = v20;
  *(_OWORD *)&self->_productImageViewOriginalTransform.c = v21;
  *(_OWORD *)&self->_productImageViewOriginalTransform.tx = v22;
}

void __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2;
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

void __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 elementType];
  id v5 = 0;
  if (v4 > 61)
  {
    if (v4 <= 134)
    {
      if (v4 == 62)
      {
        id v8 = [*(id *)(a1 + 32) addHorizontalListWithElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
        id v5 = 0;
        id v7 = v8;
      }
      else
      {
        id v7 = 0;
        id v8 = 0;
        if (v4 != 77) {
          goto LABEL_60;
        }
        uint64_t v6 = [*(id *)(a1 + 32) addOfferViewWithViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
LABEL_27:
        id v8 = (id)v6;
LABEL_28:
        id v7 = 0;
        id v5 = 0;
      }
    }
    else
    {
      id v7 = 0;
      id v8 = 0;
      switch(v4)
      {
        case 135:
          uint64_t v6 = [*(id *)(a1 + 32) addStarRatingViewWithViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
          goto LABEL_27;
        case 136:
        case 137:
        case 139:
        case 140:
        case 142:
        case 143:
          goto LABEL_60;
        case 138:
          char v42 = 0;
          double v15 = [v3 style];
          SUUIViewElementMarginForStyle(v15, &v42);
          double v17 = v16;
          double v19 = v18;

          double v20 = *(double *)(a1 + 56);
          if (v42) {
            double v20 = v20 - v17 - v19;
          }
          uint64_t v6 = [*(id *)(a1 + 32) addLabelViewWithElement:v3 width:*(void *)(a1 + 40) context:v20];
          goto LABEL_27;
        case 141:
LABEL_18:
          id v8 = [*(id *)(a1 + 32) addButtonWithElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
          [v8 addTarget:*(void *)(a1 + 48) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
          [v8 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:0x20000];
          [v8 addTarget:*(void *)(a1 + 48) action:sel__showConfirmationAction_ forControlEvents:0x40000];
          LODWORD(v13) = -0.5;
          [v8 setCharge:v13];
          [v8 setItemOfferDelegate:*(void *)(a1 + 48)];
          goto LABEL_28;
        case 144:
          uint64_t v6 = [*(id *)(a1 + 32) addTomatoRatingViewWithViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
          goto LABEL_27;
        default:
          if (v4 == 152)
          {
            long long v21 = [*(id *)(a1 + 32) addImageViewWithVideoElement:v3 context:*(void *)(a1 + 40)];
            id v8 = v21;
LABEL_39:
            id v24 = (id *)(*(void *)(a1 + 48) + 504);
            if (!*v24) {
              objc_storeStrong(v24, v21);
            }
LABEL_43:
            id v7 = 0;
            id v5 = v8;
          }
          else
          {
            id v7 = 0;
            id v8 = 0;
            if (v4 != 154) {
              goto LABEL_60;
            }
            uint64_t v12 = [*(id *)(a1 + 32) addImageGridViewWithElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
LABEL_35:
            long long v22 = v12;
            id v8 = v12;
            id v23 = (id *)(*(void *)(a1 + 48) + 504);
            if (!*v23) {
              objc_storeStrong(v23, v22);
            }
            id v5 = 0;
            id v7 = v8;
          }
          break;
      }
    }
LABEL_44:
    if (v8)
    {
      [(id)objc_opt_class() _bottomInsetForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
      if (v25 > 0.00000011920929)
      {
        uint64_t v26 = *(void **)(*(void *)(a1 + 48) + 472);
        double v27 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v26 setObject:v27 forKey:v8];
      }
      [(id)objc_opt_class() _topInsetForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
      if (v28 > 0.00000011920929)
      {
        v29 = *(void **)(*(void *)(a1 + 48) + 568);
        id v30 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v29 setObject:v30 forKey:v8];
      }
      [*(id *)(*(void *)(a1 + 48) + 576) setObject:v3 forKey:v8];
      [*(id *)(*(void *)(a1 + 48) + 576) setObject:v8 forKey:v3];
    }
    if (v5)
    {
      uint64_t v31 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v3];
      if (v31)
      {
        v32 = *(void **)(*(void *)(a1 + 48) + 464);
        if (!v32)
        {
          uint64_t v33 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
          uint64_t v34 = *(void *)(a1 + 48);
          uint64_t v35 = *(void **)(v34 + 464);
          *(void *)(v34 + 464) = v33;

          v32 = *(void **)(*(void *)(a1 + 48) + 464);
        }
        [v32 setObject:v31 forKey:v5];
      }
    }
    if (v7)
    {
      v36 = *(void **)(*(void *)(a1 + 48) + 424);
      if (!v36)
      {
        uint64_t v37 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
        uint64_t v38 = *(void *)(a1 + 48);
        long long v39 = *(void **)(v38 + 424);
        *(void *)(v38 + 424) = v37;

        v36 = *(void **)(*(void *)(a1 + 48) + 424);
      }
      [v36 addObject:v7];
    }
  }
  else
  {
    if ((unint64_t)v4 <= 0x3D)
    {
      id v7 = 0;
      id v8 = 0;
      switch(v4)
      {
        case 7:
          id v9 = [v3 firstChildForElementType:49];
          if (v9)
          {
            id v8 = [*(id *)(a1 + 32) addImageViewWithElement:v9 context:*(void *)(a1 + 40)];
            id v10 = *(void **)(a1 + 48);
            uint64_t v11 = [MEMORY[0x263F825C8] clearColor];
            [v10 setBackgroundColor:v11];
          }
          else
          {
            id v8 = 0;
          }

          goto LABEL_43;
        case 8:
          id v8 = [*(id *)(a1 + 32) addBadgeViewWithElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
          id v7 = 0;
          id v5 = v8;
          goto LABEL_44;
        case 9:
        case 10:
        case 11:
          goto LABEL_60;
        case 12:
          goto LABEL_19;
        case 13:
          goto LABEL_18;
        default:
          JUMPOUT(0);
      }
    }
    switch(v4)
    {
      case '0':
        uint64_t v6 = [*(id *)(a1 + 32) addHeaderViewWithElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
        goto LABEL_27;
      case '1':
        long long v21 = [*(id *)(a1 + 32) addImageViewWithElement:v3 context:*(void *)(a1 + 40)];
        id v8 = v21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v8 setUserInteractionEnabled:0];
        }
        goto LABEL_39;
      case '2':
LABEL_19:
        int v14 = [*(id *)(a1 + 32) addButtonWithElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
        [v14 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
        id v8 = v14;
        if ([v3 elementType] == 50) {
          id v5 = v8;
        }
        else {
          id v5 = 0;
        }

        id v7 = 0;
        goto LABEL_44;
      case '3':
        uint64_t v12 = [*(id *)(a1 + 32) addImageDeckViewWithElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
        goto LABEL_35;
      default:
        id v7 = 0;
        id v8 = 0;
        break;
    }
  }
LABEL_60:
  uint64_t v40 = *(void *)(a1 + 48);
  if (v8 == *(id *)(v40 + 504)) {
    v41 = &OBJC_IVAR___SUUIVerticalLockupView__zoomingImageAlpha;
  }
  else {
    v41 = &OBJC_IVAR___SUUIVerticalLockupView__opacityOfViewsOtherThanProductImageView;
  }
  [v8 setAlpha:*(double *)(v40 + *v41)];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIVerticalLockupView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  id v27 = v8;
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
        double v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v16 = [(NSMapTable *)self->_imageViewToImageResourceCacheKey objectForKey:v15];
        double v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        double v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = [v15 imageView];
            long long v21 = v26;
            [v24 setImage:v26];

            long long v22 = v8;
          }
          else
          {
            objc_opt_class();
            long long v22 = v8;
            long long v21 = v26;
            if (objc_opt_isKindOfClass()) {
              [v15 setImage:v26 cacheKey:v16 context:v9];
            }
            else {
              [v15 setImage:v26];
            }
          }

          goto LABEL_26;
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
    long long v21 = v26;
    long long v22 = v27;
LABEL_12:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v30 != v20) {
        objc_enumerationMutation(obj);
      }
      if ([*(id *)(*((void *)&v29 + 1) + 8 * v23) setImage:v26 forArtworkRequest:v27 context:v9]) {
        break;
      }
      if (v19 == ++v23)
      {
        uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v19) {
          goto LABEL_12;
        }
        goto LABEL_27;
      }
    }
LABEL_26:
    LOBYTE(v19) = 1;
  }
  else
  {
    long long v21 = v26;
    long long v22 = v8;
  }
LABEL_27:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = __Block_byref_object_copy__75;
  uint64_t v19 = __Block_byref_object_dispose__75;
  id v20 = 0;
  id v5 = [(SUUIViewReuseView *)self allExistingViews];
  uint64_t v6 = [(SUUIViewElement *)self->_lockupElement flattenedChildren];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__SUUIVerticalLockupView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_265401BB8;
  id v7 = v4;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  int v14 = &v15;
  [v6 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __51__SUUIVerticalLockupView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
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

- (void)layoutSubviews
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v66.receiver = self;
  v66.super_class = (Class)SUUIVerticalLockupView;
  [(SUUIVerticalLockupView *)&v66 layoutSubviews];
  [(SUUIVerticalLockupView *)self bounds];
  double v56 = v4;
  double v57 = v3;
  double v6 = v5;
  double v8 = v7;
  double left = self->_contentInset.left;
  double right = self->_contentInset.right;
  id obj = [(SUUIViewReuseView *)self allExistingViews];
  double top = self->_contentInset.top;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v12 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v53 = 0;
    double v14 = v6 - left - right;
    uint64_t v15 = *(void *)v63;
    double v52 = *MEMORY[0x263F001A8];
    double v16 = &OBJC_IVAR___SUUIMediaPlayerInterface__observers;
    CGFloat v50 = *(double *)(MEMORY[0x263F00148] + 8);
    CGFloat v51 = *MEMORY[0x263F00148];
    do
    {
      uint64_t v17 = 0;
      uint64_t v54 = v13;
      do
      {
        if (*(void *)v63 != v15) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(UIView **)(*((void *)&v62 + 1) + 8 * v17);
        uint64_t v19 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16[112]), "objectForKey:", v18, *(void *)&v50, *(void *)&v51);
        if ([v19 elementType] == 32)
        {
          -[UIView sizeThatFits:](v18, "sizeThatFits:", v6 - self->_contentInset.left, 1.79769313e308);
          double height = v21;
          if (v6 - self->_contentInset.left >= v20) {
            double width = v20;
          }
          else {
            double width = v6 - self->_contentInset.left;
          }
          char v24 = 1;
        }
        else
        {
          -[UIView sizeThatFits:](v18, "sizeThatFits:", v14, 1.79769313e308);
          double height = v26;
          if (v14 >= v25) {
            double width = v25;
          }
          else {
            double width = v14;
          }
          char v24 = v53;
        }
        if ([v19 elementType] == 7)
        {
          -[UIView setFrame:](v18, "setFrame:", v57, v56, v6, v8);
          [(SUUIVerticalLockupView *)self sendSubviewToBack:v18];
        }
        else
        {
          id v27 = [v19 style];
          productImageBoundingSize = self->_productImageBoundingSize;
          double y = top;
          if (productImageBoundingSize)
          {
            double y = top;
            if (v18 == self->_productImageView)
            {
              [(SUUISizeValue *)productImageBoundingSize size];
              double v31 = v30;
              unint64_t v32 = [v27 elementPosition];
              double y = top;
              if (v32 <= 9)
              {
                if (((1 << v32) & 0x309) != 0)
                {
                  double y = top + v31 - height;
                }
                else
                {
                  double y = top;
                  if (((1 << v32) & 0x32) != 0)
                  {
                    float v33 = top + (v31 - height) * 0.5;
                    double y = floorf(v33);
                  }
                }
              }
            }
          }
          long long v34 = [(NSMapTable *)self->_topInsets objectForKey:v18];
          long long v35 = v34;
          if (v34)
          {
            [v34 floatValue];
            double y = y + v36;
          }
          if ([v19 elementType] == 138) {
            uint64_t v37 = [v27 textAlignment];
          }
          else {
            uint64_t v37 = [v27 elementAlignment];
          }
          double x = v52;
          switch(v37)
          {
            case 0:
              switch([v27 elementPosition])
              {
                case 1:
                  goto LABEL_33;
                case 5:
                case 7:
                case 9:
                  goto LABEL_32;
                default:
                  goto LABEL_30;
              }
            case 1:
            case 4:
            case 5:
LABEL_30:
              double x = self->_contentInset.left;
              break;
            case 2:
LABEL_33:
              float v39 = (v14 - width) * 0.5;
              double x = self->_contentInset.left + floorf(v39);
              break;
            case 3:
LABEL_32:
              double x = v6 - self->_contentInset.right - width;
              break;
            default:
              break;
          }
          memset(&v61, 0, sizeof(v61));
          if (v18) {
            [(UIView *)v18 transform];
          }
          uint64_t v40 = self->_productImageBoundingSize;
          if (!v40) {
            goto LABEL_41;
          }
          if (v18 != self->_productImageView) {
            goto LABEL_41;
          }
          [(SUUISizeValue *)v40 size];
          double y = top + v41 - height;
          double productImageAdjustedWidth = self->_productImageAdjustedWidth;
          if (productImageAdjustedWidth <= 0.00000011920929) {
            goto LABEL_41;
          }
          double v43 = productImageAdjustedWidth / width;
          long long v44 = *(_OWORD *)&self->_productImageViewOriginalTransform.c;
          *(_OWORD *)&v59.a = *(_OWORD *)&self->_productImageViewOriginalTransform.a;
          *(_OWORD *)&v59.c = v44;
          *(_OWORD *)&v59.tdouble x = *(_OWORD *)&self->_productImageViewOriginalTransform.tx;
          CGAffineTransformScale(&v60, &v59, v43, v43);
          CGAffineTransform v61 = v60;
          [(UIView *)v18 setTransform:&v60];
          double v45 = self->_productImageAdjustedWidth;
          if (vabdd_f64(v45, width) > 0.00000011920929)
          {
            double x = x + (v45 - width) * -0.5;
            double width = width * v43;
            double height = height * v43;
            CGAffineTransform v60 = v61;
            CGAffineTransformInvert(&v58, &v60);
            v69.origin.double y = v50;
            v69.origin.double x = v51;
            v69.size.double width = width;
            v69.size.double height = height;
            CGRect v70 = CGRectApplyAffineTransform(v69, &v58);
            -[UIView setBounds:](v18, "setBounds:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
            v71.origin.double x = SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8);
            double MidX = CGRectGetMidX(v71);
            v72.origin.double x = x;
            v72.origin.double y = y;
            v72.size.double width = width;
            v72.size.double height = height;
            -[UIView setCenter:](v18, "setCenter:", MidX, CGRectGetMidY(v72));
            char v53 = 1;
          }
          else
          {
LABEL_41:
            if ((v24 & 1) == 0)
            {
              v73.origin.double x = x;
              v73.origin.double y = y;
              v73.size.double width = width;
              v73.size.double height = height;
              CGRect v74 = CGRectIntegral(v73);
              double x = v74.origin.x;
              double y = v74.origin.y;
              double width = v74.size.width;
              double height = v74.size.height;
            }
            [(UIView *)v18 setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8)];
          }
          v75.origin.double x = x;
          v75.origin.double y = y;
          v75.size.double width = width;
          v75.size.double height = height;
          double top = CGRectGetMaxY(v75);
          v47 = [(NSMapTable *)self->_lineSpacings objectForKey:v18];
          v48 = v47;
          if (v47)
          {
            [v47 floatValue];
            double top = top + v49;
          }

          uint64_t v13 = v54;
          double v16 = &OBJC_IVAR___SUUIMediaPlayerInterface__observers;
        }

        ++v17;
      }
      while (v13 != v17);
      uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v13);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v17 = 0;
  double v18 = (double *)&v17;
  uint64_t v19 = 0x3010000000;
  double v20 = "";
  long long v21 = *MEMORY[0x263F001B0];
  p_contentInset = &self->_contentInset;
  double v5 = a3.width - self->_contentInset.left - self->_contentInset.right;
  if (self->_sizingStyle == 1)
  {
    productImageView = self->_productImageView;
    if (productImageView)
    {
      -[UIView sizeThatFits:](productImageView, "sizeThatFits:");
      double v5 = v7;
    }
  }
  double v8 = [(SUUIViewReuseView *)self allExistingViews];
  uint64_t v9 = [v8 count];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__SUUIVerticalLockupView_sizeThatFits___block_invoke;
  v16[3] = &unk_2654073D8;
  *(double *)&v16[6] = v5;
  v16[4] = self;
  v16[5] = &v17;
  v16[7] = v9;
  [v8 enumerateObjectsUsingBlock:v16];
  uint64_t v10 = v18;
  double v11 = v18[4];
  double v12 = p_contentInset->bottom + p_contentInset->top + v18[5];
  v18[5] = v12;
  double v13 = v11 + p_contentInset->left + p_contentInset->right;
  v10[4] = v13;

  _Block_object_dispose(&v17, 8);
  double v14 = v13;
  double v15 = v12;
  result.double height = v15;
  result.double width = v14;
  return result;
}

void __39__SUUIVerticalLockupView_sizeThatFits___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = *(void **)(v6 + 496);
  id v17 = v5;
  if (v7 && *(id *)(v6 + 504) == v5)
  {
    [v7 size];
  }
  else
  {
    objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
    if (v8 >= *(double *)(a1 + 48)) {
      double v8 = *(double *)(a1 + 48);
    }
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v9
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v10 + 32) >= v8) {
    double v8 = *(double *)(v10 + 32);
  }
  *(double *)(v10 + 32) = v8;
  double v11 = [*(id *)(*(void *)(a1 + 32) + 568) objectForKey:v17];
  double v12 = v11;
  if (v11)
  {
    [v11 floatValue];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + v13;
  }
  if (*(void *)(a1 + 56) - 1 > a3)
  {
    double v14 = [*(id *)(*(void *)(a1 + 32) + 472) objectForKey:v17];
    double v15 = v14;
    if (v14)
    {
      [v14 floatValue];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 40)
                                                                  + v16;
    }
  }
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v17 = a3;
  [v17 frame];
  double x = v19.origin.x;
  double y = v19.origin.y;
  double MaxX = CGRectGetMaxX(v19);
  objc_msgSend(v17, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v8 = v7;
  double v10 = v9;
  double v11 = [(NSMapTable *)self->_viewElementViews objectForKey:v17];
  double v12 = [v11 style];
  uint64_t v13 = SUUIViewElementAlignmentForStyle(v12);

  if (v13 == 3)
  {
    double x = MaxX - v8;
  }
  else if (v13 == 2)
  {
    [(SUUIVerticalLockupView *)self bounds];
    double left = self->_contentInset.left;
    float v16 = (v15 - left - self->_contentInset.right - v8) * 0.5;
    double x = left + floorf(v16);
  }
  objc_msgSend(v17, "setFrame:", x, y, v8, v10);
}

- (void)setOpacityOfViewsOtherThanProductImageView:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (vabdd_f64(self->_opacityOfViewsOtherThanProductImageView, a3) > 0.00000011920929)
  {
    self->_opacityOfViewsOtherThanProductImageView = a3;
    id v5 = [(SUUIViewReuseView *)self allExistingViews];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(UIView **)(*((void *)&v11 + 1) + 8 * i);
          if (v10 != self->_productImageView) {
            [(UIView *)v10 setAlpha:a3];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setZoomingImageAlpha:(double)a3
{
  if (vabdd_f64(self->_zoomingImageAlpha, a3) > 0.00000011920929)
  {
    self->_zoomingImageAlpha = a3;
    -[UIView setAlpha:](self->_productImageView, "setAlpha:");
  }
}

- (void)setZoomingImageWidth:(double)a3
{
  if (vabdd_f64(self->_productImageAdjustedWidth, a3) > 0.00000011920929)
  {
    self->_double productImageAdjustedWidth = a3;
    [(SUUIVerticalLockupView *)self setNeedsLayout];
  }
}

- (void)_buttonAction:(id)a3
{
  id v8 = [(NSMapTable *)self->_viewElementViews objectForKey:a3];
  double v4 = SUUICollectionViewCellForView(self);
  id v5 = SUUICollectionViewForView(v4);
  uint64_t v6 = [v5 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v5 indexPathForCell:v4];
    [v6 collectionView:v5 didConfirmButtonElement:v8 withClickInfo:0 forItemAtIndexPath:v7];
  }
  else
  {
    [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (void)_cancelConfirmationAction:(id)a3
{
}

- (void)_showConfirmationAction:(id)a3
{
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 buttonTitleStyle];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 style];
  }
  double v10 = v9;

  long long v11 = SUUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    long long v11 = SUUIFontForTextStyle(6);
  }
  long long v12 = [v6 tintColor];
  long long v13 = SUUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    long long v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  }
  long long v14 = [v5 buttonText];
  double v15 = [v14 attributedStringWithDefaultFont:v11 foregroundColor:v13 style:v10];

  return v15;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 style];
  id v8 = SUUIViewElementFontWithStyle(v7);
  id v9 = [v6 tintColor];

  double v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  uint64_t v11 = SUUIViewElementAlignmentForStyle(v7);
  if (v11) {
    uint64_t v12 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = [v5 labelViewStyle];
  if (v13 <= 5)
  {
    if (((1 << v13) & 0x1B) != 0)
    {
      if (v8)
      {
        if (v10) {
          goto LABEL_17;
        }
      }
      else
      {
        id v8 = SUUIFontForTextStyle(5);
        if (v10) {
          goto LABEL_17;
        }
      }
      uint64_t v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    }
    else
    {
      if (v8)
      {
        if (v10) {
          goto LABEL_17;
        }
      }
      else
      {
        id v8 = SUUIFontForTextStyle(6);
        if (v10) {
          goto LABEL_17;
        }
      }
      uint64_t v14 = [MEMORY[0x263F825C8] blackColor];
    }
    double v10 = (void *)v14;
  }
LABEL_17:
  double v15 = [v5 text];
  uint64_t v16 = [v15 attributedStringWithDefaultFont:v8 foregroundColor:v10 textAlignment:v12 style:v7];

  return v16;
}

+ (double)_bottomInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  char v20 = 0;
  id v8 = [v6 style];
  SUUIViewElementPaddingForStyle(v8, &v20);
  double v10 = v9;

  char v19 = 0;
  uint64_t v11 = [v6 style];
  SUUIViewElementMarginForStyle(v11, &v19);
  double v13 = v12;

  uint64_t v14 = [v6 elementType];
  if (v14 == 154 || !v20)
  {
    if (v14 == 154 && v19)
    {
      double v10 = v13;
      goto LABEL_25;
    }
    uint64_t v15 = [v6 elementType];
    double v10 = 0.0;
    if (v15 <= 48)
    {
      switch(v15)
      {
        case 8:
          if ([v6 badgeType] == 1) {
            double v10 = 2.0;
          }
          else {
            double v10 = 0.0;
          }
          break;
        case 13:
LABEL_21:
          double v10 = 5.0;
          break;
        case 32:
          double v10 = 12.0;
          break;
      }
    }
    else
    {
      if (v15 > 151)
      {
        if (v15 != 152 && v15 != 154) {
          goto LABEL_25;
        }
      }
      else if (v15 != 49)
      {
        if (v15 != 77) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      uint64_t v16 = [v7 aggregateValueForKey:@"SUUIVLABS"];
      [v16 size];
      if (v17 >= 100.0) {
        double v10 = 12.0;
      }
      else {
        double v10 = 7.0;
      }
    }
  }
LABEL_25:

  return v10;
}

+ (double)_topInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v5 = a3;
  char v10 = 0;
  id v6 = [v5 style];
  double v7 = SUUIViewElementPaddingForStyle(v6, &v10);

  if (v10) {
    goto LABEL_2;
  }
  uint64_t v9 = [v5 elementType];
  double v7 = 0.0;
  if (v9 <= 31)
  {
    if (v9 == 8)
    {
      if ([v5 badgeType] == 1) {
        double v7 = 3.0;
      }
      else {
        double v7 = 0.0;
      }
      goto LABEL_2;
    }
    if (v9 != 13) {
      goto LABEL_2;
    }
LABEL_9:
    double v7 = 5.0;
    goto LABEL_2;
  }
  if (v9 == 32)
  {
    double v7 = 12.0;
    goto LABEL_2;
  }
  if (v9 == 77) {
    goto LABEL_9;
  }
LABEL_2:

  return v7;
}

- (int64_t)sizingStyle
{
  return self->_sizingStyle;
}

- (void)setSizingStyle:(int64_t)a3
{
  self->_sizingStyle = a3;
}

- (double)opacityOfViewsOtherThanProductImageView
{
  return self->_opacityOfViewsOtherThanProductImageView;
}

- (double)zoomingImageAlpha
{
  return self->_zoomingImageAlpha;
}

- (double)zoomingImageWidth
{
  return self->_zoomingImageWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_topInsets, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_productImageBoundingSize, 0);
  objc_storeStrong((id *)&self->_lockupElement, 0);
  objc_storeStrong((id *)&self->_lineSpacings, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

@end