@interface SKUIVerticalLockupView
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
- (SKUIVerticalLockupView)initWithFrame:(CGRect)a3;
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

@implementation SKUIVerticalLockupView

- (SKUIVerticalLockupView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIVerticalLockupView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIVerticalLockupView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    lineSpacings = v16->_lineSpacings;
    v16->_lineSpacings = (NSMapTable *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    topInsets = v16->_topInsets;
    v16->_topInsets = (NSMapTable *)v19;

    v16->_opacityOfViewsOtherThanProductImageView = 1.0;
    v16->_zoomingImageAlpha = 1.0;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    viewElementViews = v16->_viewElementViews;
    v16->_viewElementViews = (NSMapTable *)v21;
  }
  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB8920] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIVerticalLockupView;
  [(SKUIViewReuseView *)&v4 dealloc];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIVerticalLockupView maximumPerspectiveHeightForSize:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  +[SKUIStackedImageView maximumPerspectiveHeightForSize:](SKUIStackedImageView, "maximumPerspectiveHeightForSize:", width, height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  objc_initWeak(&location, a3);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SKUIVerticalLockupView_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_1E6426160;
  objc_copyWeak(&v5, &location);
  [(SKUIViewReuseView *)self enumerateExistingViewsForReuseIdentifier:0x1F1C94808 usingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SKUIVerticalLockupView_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setPerspectiveTargetView:WeakRetained];
}

- (void)setVanishingPoint:(CGPoint)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SKUIVerticalLockupView_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  CGPoint v4 = a3;
  [(SKUIViewReuseView *)self enumerateExistingViewsForReuseIdentifier:0x1F1C94808 usingBlock:v3];
}

uint64_t __44__SKUIVerticalLockupView_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

uint64_t __68__SKUIVerticalLockupView_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateForChangedDistanceFromVanishingPoint];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIVerticalLockupView prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__SKUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v20[3] = &unk_1E64234D0;
  id v17 = v8;
  v22 = &v24;
  int64_t v23 = a4;
  id v21 = v17;
  [v7 enumerateChildrenUsingBlock:v20];
  char v18 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v18;
}

uint64_t __73__SKUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        +[SKUIVerticalLockupView preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  uint64_t v30 = 0;
  v31 = (double *)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v16 = [v6 style];
  id v17 = [v16 valueForStyle:@"itml-lockup-min-width"];

  if (v17)
  {
    [v17 doubleValue];
    double v19 = v18;
  }
  else
  {
    double v19 = 80.0;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__SKUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke;
  v26[3] = &unk_1E64234D0;
  id v20 = v7;
  id v27 = v20;
  v28 = &v30;
  double v29 = v19;
  [v6 enumerateChildrenUsingBlock:v26];
  [a1 sizeThatFitsWidth:v6 viewElement:v20 context:v31[3]];
  double v23 = v22;
  if (v21 >= v19) {
    double v19 = v21;
  }

  _Block_object_dispose(&v30, 8);
  double v24 = v19;
  double v25 = v23;
  result.double height = v25;
  result.double width = v24;
  return result;
}

void __62__SKUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
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
    +[SKUIImageGridView preferredSizeForViewElement:v9 context:*(void *)(a1 + 32)];
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIVerticalLockupView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v34 = 0;
  v35 = (double *)&v34;
  uint64_t v36 = 0x3010000000;
  v37 = &unk_1C1D0F257;
  long long v38 = *MEMORY[0x1E4F1DB30];
  double v18 = [v9 labelLayoutCache];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __68__SKUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke;
  id v27 = &unk_1E6427698;
  id v19 = v18;
  id v28 = v19;
  double v32 = a4;
  id v33 = a1;
  id v20 = v9;
  id v29 = v20;
  uint64_t v30 = &v39;
  v31 = &v34;
  [v8 enumerateChildrenUsingBlock:&v24];
  if (*((unsigned char *)v40 + 24))
  {
    objc_msgSend(v20, "aggregateValueForKey:", @"SKUIVLABS", v24, v25, v26, v27, v28);
    double v21 = (SKUISizeValue *)objc_claimAutoreleasedReturnValue();
    double v22 = v21;
    if (v21)
    {
      -[SKUISizeValue unionWithSize:](v21, "unionWithSize:", v35[4], v35[5]);
    }
    else
    {
      double v23 = [SKUISizeValue alloc];
      double v22 = -[SKUISizeValue initWithSize:](v23, "initWithSize:", v35[4], v35[5]);
      [v20 setAggregateValue:v22 forKey:@"SKUIVLABS"];
    }
  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v39, 8);
}

void __68__SKUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 elementType];
  if (v4 > 134)
  {
    switch(v4)
    {
      case 135:
        double v5 = SKUIStarRatingViewElementView;
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
        SKUIViewElementMarginForStyle(v9, &v21);
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
        double v5 = SKUITomatoRatingView;
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
    double v5 = SKUISectionHeaderView;
LABEL_32:
    [(__objc2_class *)v5 requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
    goto LABEL_36;
  }
  if (v4 > 61)
  {
    if (v4 == 62)
    {
      double v5 = SKUIHorizontalListView;
    }
    else
    {
      if (v4 != 77) {
        goto LABEL_36;
      }
      double v5 = SKUIOfferView;
    }
    goto LABEL_32;
  }
  if (v4 == 49)
  {
    +[SKUIAdornedImageView requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 40) sizeForImageElement:v3];
      goto LABEL_29;
    }
  }
  else if (v4 == 51)
  {
    +[SKUIImageDeckView requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
LABEL_15:
    +[SKUIImageGridView requestLayoutForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      +[SKUIImageGridView sizeThatFitsWidth:v3 viewElement:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIVerticalLockupView sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x3010000000;
  v46 = &unk_1C1D0F257;
  uint64_t v18 = MEMORY[0x1E4F1DB30];
  long long v47 = *MEMORY[0x1E4F1DB30];
  uint64_t v39 = 0;
  v40 = (double *)&v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__48;
  v37[4] = __Block_byref_object_dispose__48;
  id v38 = 0;
  uint64_t v19 = [v9 aggregateValueForKey:@"SKUIVLAUBS"];
  int v20 = [v19 BOOLValue];

  if (v20)
  {
    char v21 = [v9 aggregateValueForKey:@"SKUIVLABS"];
  }
  else
  {
    char v21 = 0;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __64__SKUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v29[3] = &unk_1E64276C0;
  id v22 = v9;
  double v35 = a3;
  id v30 = v22;
  double v32 = v37;
  id v23 = v21;
  id v31 = v23;
  id v33 = &v39;
  id v36 = a1;
  uint64_t v34 = &v43;
  [v8 enumerateChildrenUsingBlock:v29];
  double v25 = v44[4];
  double v24 = v44[5];
  if (v24 - v40[3] >= *(double *)(v18 + 8)) {
    double v26 = v24 - v40[3];
  }
  else {
    double v26 = *(double *)(v18 + 8);
  }
  v44[5] = v26;

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  double v27 = v25;
  double v28 = v26;
  result.double height = v28;
  result.double width = v27;
  return result;
}

void __64__SKUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
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
        BOOL v10 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
        goto LABEL_8;
      }
      if (v7 != 49) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v18;
    BOOL v10 = *(void **)(v8 + 40);
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
  double v13 = [v10 aggregateValueForKey:@"SKUIVLAUBS"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    double v15 = [v10 aggregateValueForKey:@"SKUIVLABS"];
    uint64_t v16 = self->_productImageBoundingSize;
    self->_productImageBoundingSize = v15;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke;
  v23[3] = &unk_1E64234F8;
  id v17 = v9;
  id v24 = v17;
  double v27 = a4;
  id v18 = v10;
  id v25 = v18;
  double v26 = self;
  [(SKUIViewReuseView *)self modifyUsingBlock:v23];
  uint64_t v19 = self->_productImageView;
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
  *(_OWORD *)&self->_productImageViewOriginalTransform.tdouble x = v22;
}

void __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_1E64267A0;
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

void __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
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
          SKUIViewElementMarginForStyle(v15, &v42);
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
        double v26 = *(void **)(*(void *)(a1 + 48) + 472);
        double v27 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v26 setObject:v27 forKey:v8];
      }
      [(id)objc_opt_class() _topInsetForViewElement:v3 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
      if (v28 > 0.00000011920929)
      {
        id v29 = *(void **)(*(void *)(a1 + 48) + 568);
        id v30 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v29 setObject:v30 forKey:v8];
      }
      [*(id *)(*(void *)(a1 + 48) + 576) setObject:v3 forKey:v8];
      [*(id *)(*(void *)(a1 + 48) + 576) setObject:v8 forKey:v3];
    }
    if (v5)
    {
      id v31 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v3];
      if (v31)
      {
        double v32 = *(void **)(*(void *)(a1 + 48) + 464);
        if (!v32)
        {
          uint64_t v33 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:1];
          uint64_t v34 = *(void *)(a1 + 48);
          double v35 = *(void **)(v34 + 464);
          *(void *)(v34 + 464) = v33;

          double v32 = *(void **)(*(void *)(a1 + 48) + 464);
        }
        [v32 setObject:v31 forKey:v5];
      }
    }
    if (v7)
    {
      id v36 = *(void **)(*(void *)(a1 + 48) + 424);
      if (!v36)
      {
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
        uint64_t v38 = *(void *)(a1 + 48);
        uint64_t v39 = *(void **)(v38 + 424);
        *(void *)(v38 + 424) = v37;

        id v36 = *(void **)(*(void *)(a1 + 48) + 424);
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
            uint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
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
    uint64_t v41 = &OBJC_IVAR___SKUIVerticalLockupView__zoomingImageAlpha;
  }
  else {
    uint64_t v41 = &OBJC_IVAR___SKUIVerticalLockupView__opacityOfViewsOtherThanProductImageView;
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
    [(SKUIVerticalLockupView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
  double v18 = __Block_byref_object_copy__48;
  uint64_t v19 = __Block_byref_object_dispose__48;
  id v20 = 0;
  id v5 = [(SKUIViewReuseView *)self allExistingViews];
  uint64_t v6 = [(SKUIViewElement *)self->_lockupElement flattenedChildren];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__SKUIVerticalLockupView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_1E64251F0;
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

void __51__SKUIVerticalLockupView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
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
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v66.receiver = self;
  v66.super_class = (Class)SKUIVerticalLockupView;
  [(SKUIVerticalLockupView *)&v66 layoutSubviews];
  [(SKUIVerticalLockupView *)self bounds];
  double v56 = v4;
  double v57 = v3;
  double v6 = v5;
  double v8 = v7;
  double left = self->_contentInset.left;
  double right = self->_contentInset.right;
  id obj = [(SKUIViewReuseView *)self allExistingViews];
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
    double v52 = *MEMORY[0x1E4F1DB28];
    double v16 = &OBJC_IVAR___SKUINavigationBarMenusView__contentInset;
    CGFloat v50 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat v51 = *MEMORY[0x1E4F1DAD8];
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
        uint64_t v19 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16[630]), "objectForKey:", v18, *(void *)&v50, *(void *)&v51);
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
          [(SKUIVerticalLockupView *)self sendSubviewToBack:v18];
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
              [(SKUISizeValue *)productImageBoundingSize size];
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
          [(SKUISizeValue *)v40 size];
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
            SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8);
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
            SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8);
            -[UIView setFrame:](v18, "setFrame:");
          }
          v75.origin.double x = x;
          v75.origin.double y = y;
          v75.size.double width = width;
          v75.size.double height = height;
          double top = CGRectGetMaxY(v75);
          long long v47 = [(NSMapTable *)self->_lineSpacings objectForKey:v18];
          v48 = v47;
          if (v47)
          {
            [v47 floatValue];
            double top = top + v49;
          }

          uint64_t v13 = v54;
          double v16 = &OBJC_IVAR___SKUINavigationBarMenusView__contentInset;
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
  double v20 = &unk_1C1D0F257;
  long long v21 = *MEMORY[0x1E4F1DB30];
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
  double v8 = [(SKUIViewReuseView *)self allExistingViews];
  uint64_t v9 = [v8 count];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__SKUIVerticalLockupView_sizeThatFits___block_invoke;
  v16[3] = &unk_1E64276E8;
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

void __39__SKUIVerticalLockupView_sizeThatFits___block_invoke(uint64_t a1, void *a2, unint64_t a3)
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
  objc_msgSend(v17, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  double v8 = v7;
  double v10 = v9;
  double v11 = [(NSMapTable *)self->_viewElementViews objectForKey:v17];
  double v12 = [v11 style];
  uint64_t v13 = SKUIViewElementAlignmentForStyle(v12);

  if (v13 == 3)
  {
    double x = MaxX - v8;
  }
  else if (v13 == 2)
  {
    [(SKUIVerticalLockupView *)self bounds];
    double left = self->_contentInset.left;
    float v16 = (v15 - left - self->_contentInset.right - v8) * 0.5;
    double x = left + floorf(v16);
  }
  objc_msgSend(v17, "setFrame:", x, y, v8, v10);
}

- (void)setOpacityOfViewsOtherThanProductImageView:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (vabdd_f64(self->_opacityOfViewsOtherThanProductImageView, a3) > 0.00000011920929)
  {
    self->_opacityOfViewsOtherThanProductImageView = a3;
    id v5 = [(SKUIViewReuseView *)self allExistingViews];
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
    [(SKUIVerticalLockupView *)self setNeedsLayout];
  }
}

- (void)_buttonAction:(id)a3
{
  id v8 = [(NSMapTable *)self->_viewElementViews objectForKey:a3];
  double v4 = SKUICollectionViewCellForView(self);
  id v5 = SKUICollectionViewForView(v4);
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUIVerticalLockupView _attributedStringForButton:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  double v15 = [v5 buttonTitleStyle];
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v5 style];
  }
  double v18 = v17;

  CGRect v19 = SKUIViewElementFontWithStyle(v18);
  if (!v19)
  {
    CGRect v19 = SKUIFontForTextStyle(6);
  }
  double v20 = [v6 tintColor];
  long long v21 = SKUIViewElementPlainColorWithStyle(v18, v20);

  if (!v21)
  {
    long long v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  }
  long long v22 = [v5 buttonText];
  uint64_t v23 = [v22 attributedStringWithDefaultFont:v19 foregroundColor:v21 style:v18];

  return v23;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        +[SKUIVerticalLockupView _attributedStringForLabel:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  double v15 = [v5 style];
  uint64_t v16 = SKUIViewElementFontWithStyle(v15);
  id v17 = [v6 tintColor];

  double v18 = SKUIViewElementPlainColorWithStyle(v15, v17);

  uint64_t v19 = SKUIViewElementAlignmentForStyle(v15);
  if (v19) {
    uint64_t v20 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v19);
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v21 = [v5 labelViewStyle];
  if (v21 <= 5)
  {
    if (((1 << v21) & 0x1B) != 0)
    {
      if (v16)
      {
        if (v18) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v16 = SKUIFontForTextStyle(5);
        if (v18) {
          goto LABEL_21;
        }
      }
      uint64_t v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    }
    else
    {
      if (v16)
      {
        if (v18) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v16 = SKUIFontForTextStyle(6);
        if (v18) {
          goto LABEL_21;
        }
      }
      uint64_t v22 = [MEMORY[0x1E4FB1618] blackColor];
    }
    double v18 = (void *)v22;
  }
LABEL_21:
  uint64_t v23 = [v5 text];
  char v24 = [v23 attributedStringWithDefaultFont:v16 foregroundColor:v18 textAlignment:v20 style:v15];

  return v24;
}

+ (double)_bottomInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        +[SKUIVerticalLockupView _bottomInsetForViewElement:width:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  char v28 = 0;
  uint64_t v16 = [v6 style];
  SKUIViewElementPaddingForStyle(v16, &v28);
  double v18 = v17;

  char v27 = 0;
  uint64_t v19 = [v6 style];
  SKUIViewElementMarginForStyle(v19, &v27);
  double v21 = v20;

  uint64_t v22 = [v6 elementType];
  if (v22 == 154 || !v28)
  {
    if (v22 == 154 && v27)
    {
      double v18 = v21;
      goto LABEL_29;
    }
    uint64_t v23 = [v6 elementType];
    double v18 = 0.0;
    if (v23 <= 48)
    {
      switch(v23)
      {
        case 8:
          if ([v6 badgeType] == 1) {
            double v18 = 2.0;
          }
          else {
            double v18 = 0.0;
          }
          break;
        case 13:
LABEL_25:
          double v18 = 5.0;
          break;
        case 32:
          double v18 = 12.0;
          break;
      }
    }
    else
    {
      if (v23 > 151)
      {
        if (v23 != 152 && v23 != 154) {
          goto LABEL_29;
        }
      }
      else if (v23 != 49)
      {
        if (v23 != 77) {
          goto LABEL_29;
        }
        goto LABEL_25;
      }
      char v24 = [v7 aggregateValueForKey:@"SKUIVLABS"];
      [v24 size];
      if (v25 >= 100.0) {
        double v18 = 12.0;
      }
      else {
        double v18 = 7.0;
      }
    }
  }
LABEL_29:

  return v18;
}

+ (double)_topInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        +[SKUIVerticalLockupView _topInsetForViewElement:width:context:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  char v18 = 0;
  uint64_t v14 = [v5 style];
  double v15 = SKUIViewElementPaddingForStyle(v14, &v18);

  if (v18) {
    goto LABEL_6;
  }
  uint64_t v17 = [v5 elementType];
  double v15 = 0.0;
  if (v17 <= 31)
  {
    if (v17 == 8)
    {
      if ([v5 badgeType] == 1) {
        double v15 = 3.0;
      }
      else {
        double v15 = 0.0;
      }
      goto LABEL_6;
    }
    if (v17 != 13) {
      goto LABEL_6;
    }
LABEL_13:
    double v15 = 5.0;
    goto LABEL_6;
  }
  if (v17 == 32)
  {
    double v15 = 12.0;
    goto LABEL_6;
  }
  if (v17 == 77) {
    goto LABEL_13;
  }
LABEL_6:

  return v15;
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

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)maximumPerspectiveHeightForSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_attributedStringForButton:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_attributedStringForLabel:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_bottomInsetForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_topInsetForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end