@interface SKUIProductLockupCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)offerViewAnimateTransition:(id)a3;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGRect)_frameForSection:(int64_t)a3;
- (CGRect)_stackBottomRightElements:(id)a3 inRect:(CGRect)a4;
- (CGRect)_stackElements:(id)a3 alignment:(int64_t)a4 inRect:(CGRect)a5;
- (SKUIProductLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_viewElementForView:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_imageTapAction:(id)a3;
- (void)_layoutConfirmationGradientRelativeToSection:(int64_t)a3 alpha:(double)a4;
- (void)_prepareOfferConfirmationGradientForView:(id)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)_updateLayoutToAnimateOfferTransitionForView:(id)a3;
- (void)itemOfferButtonDidAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)offerViewDidAnimateTransition:(id)a3;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SKUIProductLockupCollectionViewCell

- (SKUIProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIProductLockupCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIProductLockupCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    elementViews = v16->_elementViews;
    v16->_elementViews = (NSMapTable *)v17;
  }
  return v16;
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
        +[SKUIProductLockupCollectionViewCell maximumPerspectiveHeightForSize:](v5, v6, v7, v8, v9, v10, v11, v12);
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
  v4[2] = __64__SKUIProductLockupCollectionViewCell_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_1E6426160;
  objc_copyWeak(&v5, &location);
  [(SKUIViewReuseCollectionViewCell *)self enumerateExistingViewsForReuseIdentifier:0x1F1C94808 usingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__SKUIProductLockupCollectionViewCell_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
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
  v3[2] = __57__SKUIProductLockupCollectionViewCell_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  CGPoint v4 = a3;
  [(SKUIViewReuseCollectionViewCell *)self enumerateExistingViewsForReuseIdentifier:0x1F1C94808 usingBlock:v3];
}

uint64_t __57__SKUIProductLockupCollectionViewCell_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

uint64_t __81__SKUIProductLockupCollectionViewCell_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
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
        +[SKUIProductLockupCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__SKUIProductLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __86__SKUIProductLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUIProductLockupCollectionViewCell preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIProductLockupCollectionViewCell requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  double v18 = [[SKUIProductLockupLayout alloc] initWithLockup:v9 width:v8 context:a4];

  [(SKUIProductLockupLayout *)v18 metadataWidthForWidth:a4];
  double v20 = v19;
  double v21 = [(SKUIProductLockupLayout *)v18 viewElementsForSection:5];
  [a1 _requestLayoutForViewElements:v21 width:v8 context:v20];

  v22 = [(SKUIProductLockupLayout *)v18 viewElementsForSection:1];
  [a1 _requestLayoutForViewElements:v22 width:v8 context:v20];

  if (v18) {
    [(SKUIProductLockupLayout *)v18 layoutWidthsForWidth:a4];
  }
  int64_t v23 = -[SKUIProductLockupLayout viewElementsForSection:](v18, "viewElementsForSection:", 4, (unsigned __int128)0, (unsigned __int128)0);
  [a1 _requestLayoutForViewElements:v23 width:v8 context:0.0];

  uint64_t v24 = [(SKUIProductLockupLayout *)v18 viewElementsForSection:2];
  [a1 _requestLayoutForViewElements:v24 width:v8 context:0.0];

  v25 = [(SKUIProductLockupLayout *)v18 viewElementsForSection:0];
  [a1 _requestLayoutForViewElements:v25 width:v8 context:v26];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIProductLockupCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [[SKUIProductLockupLayout alloc] initWithLockup:v8 width:v7 context:a3];

  double v18 = [(SKUIProductLockupLayout *)v17 viewElementsForSection:3];
  double v19 = [v18 firstObject];

  double v20 = 0.0;
  if (v19)
  {
    [v7 sizeForViewElement:v19 width:a3];
    double v20 = v21;
  }
  if (v17) {
    -[SKUIProductLockupLayout sizingToFitWidth:](v17, "sizingToFitWidth:", a3, 0.0, 0.0, 0.0, 0);
  }
  unint64_t v22 = 0.0 > 0.00000011920929;
  if (0.0 > 0.00000011920929) {
    v22 += 2;
  }
  double v23 = 0.0 + 0.0 + 0.0;
  if (v22 > 1) {
    double v23 = v23 + (double)(uint64_t)(v22 - 1) * 5.0;
  }
  double v24 = -0.0;
  if (0.0 > 0.00000011920929) {
    double v24 = 5.0;
  }
  double v25 = 0.0 + 0.0 + v24;
  if (v23 >= v25) {
    double v25 = v23;
  }
  if (v20 < v25) {
    double v20 = v25;
  }

  double v26 = a3;
  double v27 = v20;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  buyButtonDescriptorToButton = self->_buyButtonDescriptorToButton;
  id v10 = a3;
  [(NSMapTable *)buyButtonDescriptorToButton removeAllObjects];
  [(NSHashTable *)self->_offerViews removeAllObjects];
  uint64_t v11 = [[SKUIProductLockupLayout alloc] initWithLockup:v10 width:v8 context:a4];

  layout = self->_layout;
  self->_layout = v11;

  self->_offerMetadataPosition = 1;
  segmentedControlControllers = self->_segmentedControlControllers;
  self->_segmentedControlControllers = 0;

  [(SKUIGradientView *)self->_offerConfirmationGradientView removeFromSuperview];
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  self->_offerConfirmationGradientView = 0;

  [(NSMapTable *)self->_elementViews removeAllObjects];
  [(NSHashTable *)self->_artworkRelatedChildViewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v16[3] = &unk_1E6426080;
  double v18 = a4;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v16];
}

void __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(v4 + 848);
  double v6 = *(double *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_1E64261C8;
  double v11 = v6;
  v8[4] = v4;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 enumerateViewElementsForWidth:v8 usingBlock:v6];
}

void __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v53 = a2;
  unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFFBLL;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 848) metadataWidthForWidth:*(double *)(a1 + 56)];
    a4 = v8;
  }
  uint64_t v9 = [v53 elementType];
  uint64_t v10 = v9;
  double v11 = 0;
  if (v9 > 108)
  {
    if (v9 > 134)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      switch(v9)
      {
        case 135:
          uint64_t v15 = [*(id *)(a1 + 40) addStarRatingViewWithViewElement:v53 width:*(void *)(a1 + 48) context:a4];
          goto LABEL_42;
        case 136:
        case 137:
        case 139:
        case 140:
        case 142:
        case 143:
          goto LABEL_69;
        case 138:
          uint64_t v15 = [*(id *)(a1 + 40) addLabelViewWithElement:v53 width:*(void *)(a1 + 48) context:a4];
          goto LABEL_42;
        case 141:
          goto LABEL_35;
        case 144:
          uint64_t v15 = [*(id *)(a1 + 40) addTomatoRatingViewWithViewElement:v53 width:*(void *)(a1 + 48) context:a4];
          goto LABEL_42;
        default:
          if (v9 != 152) {
            goto LABEL_69;
          }
          double v25 = [*(id *)(a1 + 40) addImageViewWithVideoElement:v53 context:*(void *)(a1 + 48)];
          break;
      }
LABEL_39:
      double v24 = v25;
LABEL_44:
      uint64_t v13 = v24;
      double v11 = 0;
      uint64_t v12 = 0;
      goto LABEL_51;
    }
    if (v9 == 109)
    {
      uint64_t v14 = [*(id *)(a1 + 40) addReusableViewWithReuseIdentifier:0x1F1C8E908];
      double v20 = [[SKUISegmentedControlViewElementController alloc] initWithViewElement:v53 segmentedControl:v14];
      v28 = [*(id *)(a1 + 48) clientContext];
      [(SKUISegmentedControlViewElementController *)v20 setClientContext:v28];

      [(SKUISegmentedControlViewElementController *)v20 setDesiredSegmentWidth:40.0];
      v29 = *(void **)(*(void *)(a1 + 32) + 888);
      if (!v29)
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v31 = *(void *)(a1 + 32);
        v32 = *(void **)(v31 + 888);
        *(void *)(v31 + 888) = v30;

        v29 = *(void **)(*(void *)(a1 + 32) + 888);
      }
      v33 = v20;
      goto LABEL_78;
    }
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if (v9 != 131) {
      goto LABEL_69;
    }
    double v19 = [*(id *)(a1 + 40) addStackListViewWithElement:v53 width:*(void *)(a1 + 48) context:a4];
LABEL_49:
    double v24 = v19;
    uint64_t v12 = v24;
    double v11 = 0;
    goto LABEL_50;
  }
  if (v9 > 48)
  {
    if (v9 <= 61)
    {
      if (v9 != 49)
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        if (v9 != 50) {
          goto LABEL_69;
        }
        goto LABEL_15;
      }
      double v26 = [*(id *)(a1 + 40) addImageViewWithElement:v53 context:*(void *)(a1 + 48)];
      double v27 = [v26 tapRecognizer];
      [v27 addTarget:*(void *)(a1 + 32) action:sel__imageTapAction_];

      double v24 = v26;
      goto LABEL_44;
    }
    if (v9 != 62)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      if (v9 != 77) {
        goto LABEL_69;
      }
      double v20 = (SKUISegmentedControlViewElementController *)v53;
      uint64_t v14 = [*(id *)(a1 + 40) addOfferViewWithViewElement:v20 width:*(void *)(a1 + 48) context:a4];
      if ([(SKUISegmentedControlViewElementController *)v20 isSimpleOffer])
      {
        if (v7 == 1) {
          [(SKUISegmentedControlViewElementController *)v14 setMetadataPosition:0];
        }
        uint64_t v21 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v49 = [(SKUISegmentedControlViewElementController *)v14 metadataPosition];
        uint64_t v21 = 0;
        if (v49 != 1) {
          *(void *)(*(void *)(a1 + 32) + 872) = v49;
        }
      }
      [(SKUISegmentedControlViewElementController *)v14 setDelegate:v21];
      if (!v14) {
        goto LABEL_79;
      }
      v29 = *(void **)(*(void *)(a1 + 32) + 880);
      if (!v29)
      {
        uint64_t v50 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
        uint64_t v51 = *(void *)(a1 + 32);
        v52 = *(void **)(v51 + 880);
        *(void *)(v51 + 880) = v50;

        v29 = *(void **)(*(void *)(a1 + 32) + 880);
      }
      v33 = v14;
LABEL_78:
      [v29 addObject:v33];
LABEL_79:

      goto LABEL_80;
    }
    double v19 = [*(id *)(a1 + 40) addHorizontalListWithElement:v53 width:*(void *)(a1 + 48) context:a4];
    goto LABEL_49;
  }
  if (v9 <= 12)
  {
    if (v9 != 8)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      if (v9 != 12) {
        goto LABEL_69;
      }
LABEL_15:
      uint64_t v16 = [*(id *)(a1 + 40) addButtonWithElement:v53 width:*(void *)(a1 + 48) context:a4];
      [v16 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:64];
      LODWORD(v17) = -1097229926;
      [v16 setCharge:v17];
      double v18 = v16;
      uint64_t v14 = v18;
      uint64_t v12 = 0;
      if (v10 == 50) {
        double v11 = 0;
      }
      else {
        double v11 = v18;
      }
      if (v10 == 50) {
        uint64_t v13 = v18;
      }
      else {
        uint64_t v13 = 0;
      }
      if (!v18) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    double v25 = [*(id *)(a1 + 40) addBadgeViewWithElement:v53 width:*(void *)(a1 + 48) context:a4];
    goto LABEL_39;
  }
  if (v9 != 13)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if (v9 != 48) {
      goto LABEL_69;
    }
    uint64_t v15 = [*(id *)(a1 + 40) addHeaderViewWithElement:v53 width:*(void *)(a1 + 48) context:a4];
LABEL_42:
    uint64_t v14 = (SKUISegmentedControlViewElementController *)v15;
LABEL_80:
    double v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    if (!v14) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_35:
  unint64_t v22 = [*(id *)(a1 + 40) addButtonWithElement:v53 width:*(void *)(a1 + 48) context:a4];
  [v22 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:0x20000];
  [v22 addTarget:*(void *)(a1 + 32) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
  [v22 addTarget:*(void *)(a1 + 32) action:sel__showConfirmationAction_ forControlEvents:0x40000];
  LODWORD(v23) = -1097229926;
  [v22 setCharge:v23];
  [v22 setItemOfferDelegate:*(void *)(a1 + 32)];
  double v24 = v22;
  double v11 = v24;
  uint64_t v12 = 0;
LABEL_50:
  uint64_t v13 = 0;
LABEL_51:
  uint64_t v14 = v24;
  if (v24)
  {
LABEL_52:
    v34 = [*(id *)(a1 + 48) textPropertiesForViewElement:v53 width:a4];
    [*(id *)(a1 + 40) setTextProperties:v34 forView:v14];
    [*(id *)(*(void *)(a1 + 32) + 832) setObject:v14 forKey:v53];
  }
LABEL_53:
  if (v11)
  {
    v35 = [v53 buyButtonDescriptor];
    if (v35)
    {
      v36 = *(void **)(*(void *)(a1 + 32) + 824);
      if (!v36)
      {
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:517 capacity:1];
        uint64_t v38 = *(void *)(a1 + 32);
        v39 = *(void **)(v38 + 824);
        *(void *)(v38 + 824) = v37;

        v36 = *(void **)(*(void *)(a1 + 32) + 824);
      }
      [v36 setObject:v11 forKey:v35];
    }
  }
  if (v13)
  {
    v40 = [*(id *)(a1 + 48) imageResourceCacheKeyForViewElement:v53];
    if (v40)
    {
      v41 = *(void **)(*(void *)(a1 + 32) + 840);
      if (!v41)
      {
        uint64_t v42 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:1];
        uint64_t v43 = *(void *)(a1 + 32);
        v44 = *(void **)(v43 + 840);
        *(void *)(v43 + 840) = v42;

        v41 = *(void **)(*(void *)(a1 + 32) + 840);
      }
      [v41 setObject:v40 forKey:v13];
    }
  }
  if (v12)
  {
    v45 = *(void **)(*(void *)(a1 + 32) + 816);
    if (!v45)
    {
      uint64_t v46 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
      uint64_t v47 = *(void *)(a1 + 32);
      v48 = *(void **)(v47 + 816);
      *(void *)(v47 + 816) = v46;

      v45 = *(void **)(*(void *)(a1 + 32) + 816);
    }
    [v45 addObject:v12];
  }
LABEL_69:
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
        uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = [(NSMapTable *)self->_imageViewToImageResourceCacheKey objectForKey:v15];
        double v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        double v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v24 = [v15 imageView];
            uint64_t v21 = v27;
            [v24 setImage:v27];
          }
          else
          {
            uint64_t v21 = v27;
            [v15 setImage:v27];
          }
          unint64_t v22 = v8;

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
    unint64_t v22 = v26;
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
    unint64_t v22 = v8;
    uint64_t v21 = v27;
  }
LABEL_24:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v24 = [v9 clientContext];
  double v25 = self;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = self->_buyButtonDescriptorToButton;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v16 canPersonalizeUsingItemState:v8])
        {
          double v17 = [(NSMapTable *)v25->_buyButtonDescriptorToButton objectForKey:v16];
          v13 |= [v17 setValuesUsingBuyButtonDescriptor:v16 itemState:v8 clientContext:v24 animated:v5];
        }
      }
      uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }
  else
  {
    int v13 = 0;
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v18 = v25->_offerViews;
  uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v13 |= [*(id *)(*((void *)&v26 + 1) + 8 * j) updateWithItemState:v8 context:v9 animated:v5];
      }
      uint64_t v20 = [(NSHashTable *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  if (v13) {
    [(SKUIProductLockupCollectionViewCell *)v25 setNeedsLayout];
  }

  return v13 & 1;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = self->_elementViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "itmlID", (void)v15);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          int v13 = [(NSMapTable *)self->_elementViews objectForKey:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int v13 = 0;
LABEL_11:

  return v13;
}

- (void)layoutSubviews
{
  v139.receiver = self;
  v139.super_class = (Class)SKUIProductLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v139 layoutSubviews];
  id v3 = [(SKUIProductLockupCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(SKUIViewReuseCollectionViewCell *)self contentInset];
  double v76 = v13;
  double v77 = v12;
  uint64_t v133 = 0;
  v134 = (double *)&v133;
  uint64_t v135 = 0x3010000000;
  v136 = &unk_1C1D0F257;
  uint64_t v70 = v15;
  uint64_t v71 = v14;
  uint64_t v137 = v15;
  uint64_t v138 = v14;
  long long v16 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:3];
  long long v17 = [v16 firstObject];

  if (v17)
  {
    long long v18 = [(NSMapTable *)self->_elementViews objectForKey:v17];
    [v18 frame];
    CGFloat v19 = v134[4];
    CGFloat v20 = v134[5];
    objc_msgSend(v18, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v19, v20, v21, v23, v5, v7, v9, v11);
    objc_msgSend(v18, "setFrame:");
    v140.origin.double x = v19;
    v140.origin.double y = v20;
    v140.size.double width = v22;
    v140.size.double height = v24;
    v134[4] = CGRectGetMaxX(v140) + 13.0;
  }
  double v80 = v134[5];
  double v81 = v134[4];
  double v25 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:5];
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  double v78 = v11 - v77 - v80;
  double v79 = v9 - v76 - v81;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v81, v80, v79, v78, v5, v7, v9, v11);
  if (ShouldReverseLayoutDirection) {
    uint64_t v27 = 7;
  }
  else {
    uint64_t v27 = 8;
  }
  [(SKUIProductLockupCollectionViewCell *)self _stackElements:v25 alignment:v27 inRect:v11 - v77];
  double v75 = SKUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(v28, v29, v30, v31, v5, v7, v9, v11);
  uint64_t v68 = v33;
  uint64_t v69 = v32;
  uint64_t v67 = v34;
  long long v35 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:1];
  -[SKUIProductLockupCollectionViewCell _stackBottomRightElements:inRect:](self, "_stackBottomRightElements:inRect:", v35, v81, v80, v79, v78);
  double v66 = v36;
  double v73 = v38;
  double v74 = v37;
  double rect = v39;
  uint64_t v125 = 0;
  v126 = (CGFloat *)&v125;
  uint64_t v127 = 0x4010000000;
  v128 = &unk_1C1D0F257;
  double v129 = v81;
  double v130 = v80;
  double v131 = v9 - v76 - v81;
  double v132 = v11 - v77 - v80;
  if ([v25 count]) {
    v126[6] = v75 - 5.0 - v126[4];
  }
  v40 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:4];
  if (storeShouldReverseLayoutDirection()) {
    uint64_t v41 = 8;
  }
  else {
    uint64_t v41 = 7;
  }
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v126[4], v126[5], v126[6], v126[7], v5, v7, v9, v11);
  -[SKUIProductLockupCollectionViewCell _stackElements:alignment:inRect:](self, "_stackElements:alignment:inRect:", v40, v41);
  CGFloat v46 = SKUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(v42, v43, v44, v45, v5, v7, v9, v11);
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E64261F0;
  v103 = &v125;
  double v104 = v81;
  double v105 = v80;
  double v106 = v9 - v76 - v81;
  double v107 = v11 - v77 - v80;
  id v53 = v40;
  id v99 = v53;
  CGFloat v108 = v46;
  uint64_t v109 = v48;
  uint64_t v110 = v50;
  uint64_t v111 = v52;
  CGFloat v112 = v5;
  CGFloat v113 = v7;
  CGFloat v114 = v9;
  CGFloat v115 = v11;
  uint64_t v116 = v71;
  uint64_t v117 = v70;
  double v118 = v77;
  double v119 = v76;
  id v54 = v25;
  id v100 = v54;
  double v120 = v75;
  uint64_t v121 = v69;
  uint64_t v122 = v68;
  uint64_t v123 = v67;
  id v55 = v35;
  id v101 = v55;
  v102 = self;
  uint64_t v124 = v41;
  v56 = (void (**)(double, double, double, double, double))_Block_copy(aBlock);
  v56[2](v66, v74, v73, rect, 0.0);
  v57 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:0];
  if ([v57 count])
  {
    int64_t v58 = [(SKUIProductLockupLayout *)self->_layout bottomLeftLayoutStyle];
    if (v58 == 2)
    {
      uint64_t v92 = 0;
      v93 = (double *)&v92;
      v59 = (void *)*((void *)v134 + 4);
      uint64_t v94 = 0x2020000000;
      v95 = v59;
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_2;
      v97[3] = &unk_1E6426218;
      *(double *)&v97[6] = v9 - v76 - v81;
      *(double *)&v97[7] = v11 - v77 - v80;
      v97[4] = self;
      v97[5] = &v92;
      *(CGFloat *)&v97[8] = v5;
      *(CGFloat *)&v97[9] = v7;
      *(CGFloat *)&v97[10] = v9;
      *(CGFloat *)&v97[11] = v11;
      v97[12] = v71;
      v97[13] = v70;
      *(double *)&v97[14] = v77;
      *(double *)&v97[15] = v76;
      [v57 enumerateObjectsUsingBlock:v97];
      if ([v55 count])
      {
        v141.origin.double x = v66;
        v141.size.double width = v73;
        v141.origin.double y = v74;
        v141.size.double height = rect;
        if (CGRectGetMinX(v141) < v93[3])
        {
          if ([(SKUIProductLockupLayout *)self->_layout hasBottomRightElementWithRightAlignment])
          {
            double v60 = v93[3];
            v142.origin.double x = v81;
            v142.origin.double y = v80;
            v142.size.double width = v9 - v76 - v81;
            v142.size.double height = v78;
            double MinY = CGRectGetMinY(v142);
            v143.origin.double x = v81;
            v143.origin.double y = v80;
            v143.size.double width = v79;
            v143.size.double height = v78;
            double MaxX = CGRectGetMaxX(v143);
            v144.origin.double x = v81;
            v144.origin.double y = v80;
            v144.size.double width = v79;
            v144.size.double height = v78;
            -[SKUIProductLockupCollectionViewCell _stackBottomRightElements:inRect:](self, "_stackBottomRightElements:inRect:", v55, v60, MinY, MaxX - v93[3], CGRectGetHeight(v144));
            ((void (*)(void (**)(double, double, double, double, double)))v56[2])(v56);
          }
        }
      }
    }
    else
    {
      if ([v55 count]) {
        double v63 = v66 - 5.0 - v81;
      }
      else {
        double v63 = v9 - v76 - v81;
      }
      uint64_t v92 = 0;
      v93 = (double *)&v92;
      uint64_t v94 = 0x3010000000;
      v95 = &unk_1C1D0F257;
      long long v96 = *MEMORY[0x1E4F1DB30];
      uint64_t v88 = 0;
      v89 = &v88;
      uint64_t v90 = 0x2020000000;
      uint64_t v91 = 0;
      uint64_t v84 = 0;
      v85 = &v84;
      uint64_t v86 = 0x2020000000;
      uint64_t v87 = 0;
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_3;
      v83[3] = &unk_1E6426240;
      *(double *)&v83[8] = v63;
      *(CGFloat *)&v83[9] = v5;
      *(CGFloat *)&v83[10] = v7;
      *(CGFloat *)&v83[11] = v9;
      *(CGFloat *)&v83[12] = v11;
      v83[4] = self;
      v83[5] = &v84;
      v83[6] = &v92;
      v83[7] = &v88;
      [v57 enumerateObjectsUsingBlock:v83];
      v64 = v93;
      if (v58 && v93[4] < v63) {
        double v63 = v93[4];
      }
      v93[4] = v63;
      v89[3] = 0;
      v134[5] = v65 - v64[5];
      v85[3] = 0;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_4;
      v82[3] = &unk_1E6426268;
      v82[4] = self;
      v82[5] = &v133;
      v82[6] = &v88;
      v82[7] = &v84;
      v82[8] = &v92;
      *(CGFloat *)&v82[9] = v5;
      *(CGFloat *)&v82[10] = v7;
      *(CGFloat *)&v82[11] = v9;
      *(CGFloat *)&v82[12] = v11;
      [v57 enumerateObjectsUsingBlock:v82];
      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v88, 8);
    }
    _Block_object_dispose(&v92, 8);
  }

  _Block_object_dispose(&v125, 8);
  _Block_object_dispose(&v133, 8);
}

double __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v11 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(v10 + 48) = v11;
  if ([*(id *)(a1 + 32) count])
  {
    *(CGFloat *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = CGRectGetMaxY(*(CGRect *)(a1 + 104)) + 5.0;
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 56) = *(double *)(a1 + 160)
                                                                - *(double *)(a1 + 184)
                                                                - *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 40);
  }
  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    double v13 = *(double *)(a1 + 200) - 5.0 - *(double *)(v12 + 32);
    if (*(double *)(v12 + 48) < v13) {
      double v13 = *(double *)(v12 + 48);
    }
    *(double *)(v12 + 48) = v13;
  }
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v14 = *(double **)(*(void *)(a1 + 64) + 8);
    if (a6 <= 0.00000011920929)
    {
      double v16 = a2 - 5.0 - v14[4];
      if (v14[6] < v16) {
        double v16 = v14[6];
      }
      v14[6] = v16;
    }
    else
    {
      double v15 = a3 - 5.0 - v14[5];
      if (v14[7] < v15) {
        double v15 = v14[7];
      }
      v14[7] = v15;
    }
  }
  long long v17 = *(id **)(a1 + 56);
  long long v18 = [v17[106] viewElementsForSection:2];
  uint64_t v19 = *(void *)(a1 + 232);
  CGFloat v20 = *(CGFloat **)(*(void *)(a1 + 64) + 8);
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v20[4], v20[5], v20[6], v20[7], *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144), *(CGFloat *)(a1 + 152), *(CGFloat *)(a1 + 160));
  objc_msgSend(v17, "_stackElements:alignment:inRect:", v18, v19);
  double v22 = v21;

  return v22;
}

void __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:a2];
  if (([v9 isHidden] & 1) == 0)
  {
    [v9 frame];
    objc_msgSend(v9, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
    v11.size.CGFloat width = v3;
    v11.size.CGFloat height = v4;
    v11.origin.CGFloat x = *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v11.origin.CGFloat y = *(double *)(a1 + 88) - *(double *)(a1 + 112) - v4;
    CGRect v12 = CGRectIntegral(v11);
    CGFloat x = v12.origin.x;
    CGFloat y = v12.origin.y;
    CGFloat width = v12.size.width;
    CGFloat height = v12.size.height;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v12.origin.x, v12.origin.y, v12.size.width, v12.size.height, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
    objc_msgSend(v9, "setFrame:");
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxX(v13) + 5.0;
  }
}

void __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_3(uint64_t a1, void *a2)
{
  id v17 = a2;
  CGFloat v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 832), "objectForKey:");
  if (([v3 isHidden] & 1) == 0)
  {
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 64), 1.79769313e308);
    double v10 = v9;
    if (v8 >= *(double *)(a1 + 64)) {
      double v11 = *(double *)(a1 + 64);
    }
    else {
      double v11 = v8;
    }
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v5, v7, v11, v9, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
    objc_msgSend(v3, "setFrame:");
    if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= 0)
    {
      id v12 = v17;
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 848) topPaddingForViewElement:v17];
      id v12 = v17;
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v13
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 40);
    }
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 40);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    double v15 = *(double *)(v14 + 32);
    if (v15 < v11) {
      double v15 = v11;
    }
    *(double *)(v14 + 32) = v15;
    [*(id *)(*(void *)(a1 + 32) + 848) bottomPaddingForViewElement:v12];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v16;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_4(uint64_t a1, void *a2)
{
  id v20 = a2;
  CGFloat v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 832), "objectForKey:");
  if (([v3 isHidden] & 1) == 0)
  {
    [v3 frame];
    double v5 = v4;
    uint64_t v7 = v6;
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
       + *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) < 1)
    {
      CGFloat v9 = v20;
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 848) topPaddingForViewElement:v20];
      CGFloat v9 = v20;
      double v8 = v8 + v10;
    }
    if ([v9 elementType] == 77)
    {
      double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      double v5 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32);
    }
    else
    {
      double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      if (*(void *)(*(void *)(a1 + 32) + 872) != 1) {
        double v11 = v11 + *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) - v5;
      }
    }
    double v12 = v8;
    double v13 = v5;
    uint64_t v14 = v7;
    CGRect v22 = CGRectIntegral(*(CGRect *)&v11);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v22.origin.x, v22.origin.y, v22.size.width, v22.size.height, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
    objc_msgSend(v3, "setFrame:");
    [*(id *)(*(void *)(a1 + 32) + 848) bottomPaddingForViewElement:v20];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CGRectGetMaxY(v23);
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  if (([a3 isShowingConfirmation] & 1) == 0)
  {
    [(SKUIGradientView *)self->_offerConfirmationGradientView removeFromSuperview];
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;
  }
}

- (BOOL)offerViewAnimateTransition:(id)a3
{
  return 0;
}

- (void)offerViewDidAnimateTransition:(id)a3
{
  if (([a3 isShowingConfirmation] & 1) == 0)
  {
    [(SKUIGradientView *)self->_offerConfirmationGradientView removeFromSuperview];
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;
  }
}

- (void)_buttonAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v15 = SKUICollectionViewForView(self);
  double v5 = [v15 delegate];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_elementViews;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      double v10 = v5;
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [(NSMapTable *)self->_elementViews objectForKey:v12];

        if (v13 == v4)
        {
          double v5 = v10;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v14 = [v15 indexPathForCell:self];
            [v10 collectionView:v15 didConfirmButtonElement:v12 withClickInfo:0 forItemAtIndexPath:v14];
          }
          else
          {
            [v12 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
          }
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      double v5 = v10;
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4 = a3;
  [(SKUIProductLockupCollectionViewCell *)self bringSubviewToFront:v4];
  [v4 setShowingConfirmation:0 animated:1];
}

- (void)_imageTapAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 view];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = self->_elementViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v11 = -[NSMapTable objectForKey:](self->_elementViews, "objectForKey:", v10, (void)v12);

        if (v11 == v4)
        {
          [v10 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_showConfirmationAction:(id)a3
{
  id v4 = a3;
  [(SKUIProductLockupCollectionViewCell *)self _prepareOfferConfirmationGradientForView:v4];
  [v4 setShowingConfirmation:1 animated:1];
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
        +[SKUIProductLockupCollectionViewCell _attributedStringForButton:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  long long v15 = [v5 buttonTitleStyle];
  long long v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v5 style];
  }
  long long v18 = v17;

  long long v19 = SKUIViewElementFontWithStyle(v18);
  if (!v19)
  {
    long long v19 = SKUIFontLimitedPreferredFontForTextStyle(21, 5);
  }
  id v20 = [v6 tintColor];
  uint64_t v21 = SKUIViewElementPlainColorWithStyle(v18, v20);

  if (!v21)
  {
    uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  }
  CGRect v22 = [v5 buttonText];
  CGRect v23 = [v22 attributedStringWithDefaultFont:v19 foregroundColor:v21 style:v18];

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
        +[SKUIProductLockupCollectionViewCell _attributedStringForLabel:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  long long v15 = [v5 style];
  long long v16 = SKUIViewElementFontWithStyle(v15);
  id v17 = [v6 tintColor];

  long long v18 = SKUIViewElementPlainColorWithStyle(v15, v17);

  switch([v5 labelViewStyle])
  {
    case 0:
    case 1:
      if (v16)
      {
        if (!v18) {
          goto LABEL_21;
        }
      }
      else
      {
        long long v16 = SKUIFontForTextStyle(10);
        if (!v18)
        {
LABEL_21:
          long long v19 = (void *)MEMORY[0x1E4FB1618];
          double v20 = 0.6;
          goto LABEL_22;
        }
      }
LABEL_26:
      CGRect v22 = [v5 text];
      CGRect v23 = [v22 attributedStringWithDefaultFont:v16 foregroundColor:v18 style:v15];

      return v23;
    case 2:
    case 5:
      if (v16)
      {
        if (v18) {
          goto LABEL_26;
        }
      }
      else
      {
        long long v16 = SKUIFontLimitedPreferredFontForTextStyle(2, 5);
        if (v18) {
          goto LABEL_26;
        }
      }
      uint64_t v21 = [MEMORY[0x1E4FB1618] blackColor];
LABEL_25:
      long long v18 = (void *)v21;
      goto LABEL_26;
    case 3:
      if (!v16)
      {
        long long v16 = SKUIFontForTextStyle(10);
      }
      if (v18) {
        goto LABEL_26;
      }
      long long v19 = (void *)MEMORY[0x1E4FB1618];
      double v20 = 0.4;
      goto LABEL_22;
    case 4:
      if (!v16)
      {
        long long v16 = SKUIFontLimitedPreferredFontForTextStyle(21, 5);
      }
      if (v18) {
        goto LABEL_26;
      }
      long long v19 = (void *)MEMORY[0x1E4FB1618];
      double v20 = 0.8;
LABEL_22:
      uint64_t v21 = [v19 colorWithWhite:0.0 alpha:v20];
      goto LABEL_25;
    default:
      goto LABEL_26;
  }
}

+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIProductLockupCollectionViewCell _requestLayoutForViewElements:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  long long v18 = [v9 labelLayoutCache];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v8;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        CGFloat v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v25 = objc_msgSend(v24, "elementType", (void)v28);
        if (v25 > 76)
        {
          switch(v25)
          {
            case 135:
              long long v26 = SKUIStarRatingViewElementView;
              break;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              continue;
            case 138:
              uint64_t v27 = [a1 _attributedStringForLabel:v24 context:v9];
              [v18 requestLayoutForLabel:v24 attributedString:v27 width:(uint64_t)a4];
              goto LABEL_27;
            case 141:
              goto LABEL_20;
            case 144:
              long long v26 = SKUITomatoRatingView;
              break;
            default:
              if (v25 == 77)
              {
                long long v26 = SKUIOfferView;
              }
              else
              {
                if (v25 != 131) {
                  continue;
                }
                long long v26 = SKUIStackListCollectionViewCell;
              }
              break;
          }
LABEL_30:
          [(__objc2_class *)v26 requestLayoutForViewElement:v24 width:v9 context:a4];
          continue;
        }
        if (v25 > 47)
        {
          if (v25 == 48)
          {
            long long v26 = SKUISectionHeaderView;
          }
          else
          {
            if (v25 != 62) {
              continue;
            }
            long long v26 = SKUIHorizontalListView;
          }
          goto LABEL_30;
        }
        if (v25 == 8)
        {
          [v18 requestLayoutForBadge:v24 width:(uint64_t)a4];
        }
        else if (v25 == 12)
        {
LABEL_20:
          uint64_t v27 = [a1 _attributedStringForButton:v24 context:v9];
          [v18 requestLayoutForButton:v24 attributedString:v27 width:(uint64_t)a4];
LABEL_27:
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v21);
  }
}

- (CGRect)_frameForSection:(int64_t)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x4010000000;
  long long v18 = &unk_1C1D0F257;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v19 = *MEMORY[0x1E4F1DB28];
  long long v20 = v4;
  id v5 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:a3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__SKUIProductLockupCollectionViewCell__frameForSection___block_invoke;
  v14[3] = &unk_1E6426290;
  v14[4] = self;
  v14[5] = &v15;
  [v5 enumerateObjectsUsingBlock:v14];

  double v6 = v16[4];
  double v7 = v16[5];
  double v8 = v16[6];
  double v9 = v16[7];
  _Block_object_dispose(&v15, 8);
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

void __56__SKUIProductLockupCollectionViewCell__frameForSection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:a2];
  if (v5)
  {
    id v13 = v5;
    if (a3)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v6 = a1 + 40;
      double v8 = *(CGRect **)(v7 + 8);
      [v5 frame];
      v16.origin.CGFloat x = v9;
      v16.origin.CGFloat y = v10;
      v16.size.CGFloat width = v11;
      v16.size.CGFloat height = v12;
      CGRect v15 = CGRectUnion(v8[1], v16);
    }
    else
    {
      [v5 frame];
      uint64_t v6 = a1 + 40;
    }
    *(CGRect *)(*(void *)(*(void *)v6 + 8) + 32) = v15;
    id v5 = v13;
  }
}

- (void)_layoutConfirmationGradientRelativeToSection:(int64_t)a3 alpha:(double)a4
{
  v34[3] = *MEMORY[0x1E4F143B8];
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  if (offerConfirmationGradientView)
  {
    uint64_t v27 = 0;
    long long v28 = (double *)&v27;
    uint64_t v29 = 0x4010000000;
    long long v30 = &unk_1C1D0F257;
    long long v31 = 0u;
    long long v32 = 0u;
    [(SKUIGradientView *)offerConfirmationGradientView frame];
    *(void *)&long long v31 = v8;
    *((void *)&v31 + 1) = v9;
    *(void *)&long long v32 = v10;
    *((void *)&v32 + 1) = v11;
    CGFloat v12 = [(SKUIGradientView *)self->_offerConfirmationGradientView layer];
    [(SKUIProductLockupCollectionViewCell *)self _frameForSection:a3];
    double v15 = v13;
    uint64_t v17 = v16;
    double v18 = v14;
    uint64_t v20 = v19;
    uint64_t v21 = v28;
    if (a3)
    {
      v28[4] = v13 + -30.0;
      v21[6] = v14 + 30.0;
      v33[0] = &unk_1F1D61C88;
      uint64_t v22 = [NSNumber numberWithDouble:30.0 / (v14 + 30.0)];
      v33[1] = v22;
      v33[2] = &unk_1F1D61C70;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
    }
    else
    {
      v28[4] = v13;
      v21[6] = v14 + 30.0;
      v34[0] = &unk_1F1D61C70;
      uint64_t v22 = [NSNumber numberWithDouble:1.0 - 30.0 / (v14 + 30.0)];
      v34[1] = v22;
      v34[2] = &unk_1F1D61C88;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    CGRect v23 = };
    [v12 setLocations:v23];

    CGFloat v24 = [(SKUIGradientView *)self->_offerConfirmationGradientView superview];
    uint64_t v25 = [v24 subviews];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __90__SKUIProductLockupCollectionViewCell__layoutConfirmationGradientRelativeToSection_alpha___block_invoke;
    v26[3] = &unk_1E64262B8;
    *(double *)&v26[5] = v15;
    v26[6] = v17;
    *(double *)&v26[7] = v18;
    v26[8] = v20;
    v26[4] = &v27;
    [v25 enumerateObjectsUsingBlock:v26];

    [(SKUIGradientView *)self->_offerConfirmationGradientView setAlpha:a4];
    -[SKUIGradientView setFrame:](self->_offerConfirmationGradientView, "setFrame:", v28[4], v28[5], v28[6], v28[7]);

    _Block_object_dispose(&v27, 8);
  }
}

void __90__SKUIProductLockupCollectionViewCell__layoutConfirmationGradientRelativeToSection_alpha___block_invoke(double *a1, void *a2)
{
  [a2 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v7 = a1[5];
  CGFloat v8 = a1[7];
  v10.origin.CGFloat x = v7;
  v10.origin.CGFloat y = v3;
  v10.size.CGFloat width = v8;
  v10.size.CGFloat height = v5;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*((void *)a1 + 4) + 8) + 32), v10))
  {
    v11.origin.CGFloat x = v7;
    v11.origin.CGFloat y = v4;
    v11.size.CGFloat width = v8;
    v11.size.CGFloat height = v6;
    CGRect v9 = CGRectUnion(*(CGRect *)(*(void *)(*((void *)a1 + 4) + 8) + 32), v11);
    *(CGFloat *)(*(void *)(*((void *)a1 + 4) + 8) + 40) = v9.origin.y;
    *(CGFloat *)(*(void *)(*((void *)a1 + 4) + 8) + 56) = v9.size.height;
  }
}

- (void)_prepareOfferConfirmationGradientForView:(id)a3
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  CGRect v23 = -[SKUIProductLockupCollectionViewCell _viewElementForView:](self, "_viewElementForView:");
  if (v23)
  {
    CGFloat v4 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:1];
    unsigned int v5 = [v4 containsObject:v23];

    CGFloat v6 = [v22 superview];
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x3032000000;
    long long v32 = __Block_byref_object_copy__31;
    uint64_t v33 = __Block_byref_object_dispose__31;
    id v34 = 0;
    CGFloat v7 = -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:");
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke;
    v26[3] = &unk_1E64262E0;
    v26[4] = self;
    long long v28 = &v29;
    id v8 = v6;
    id v27 = v8;
    [v7 enumerateObjectsUsingBlock:v26];

    for (uint64_t i = 0; i != 4; ++i)
    {
      CGRect v10 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:qword_1C1CCB7E8[i]];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke_2;
      v24[3] = &unk_1E6426308;
      v24[4] = self;
      id v11 = v8;
      id v25 = v11;
      [v10 enumerateObjectsUsingBlock:v24];
    }
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    if (!offerConfirmationGradientView)
    {
      double v13 = [SKUIGradientView alloc];
      double v14 = -[SKUIGradientView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v15 = self->_offerConfirmationGradientView;
      self->_offerConfirmationGradientView = v14;

      uint64_t v16 = [(SKUIProductLockupCollectionViewCell *)self backgroundColor];
      uint64_t v17 = [(SKUIGradientView *)self->_offerConfirmationGradientView layer];
      id v18 = [v16 colorWithAlphaComponent:0.0];
      v35[0] = [v18 CGColor];
      id v19 = v16;
      v35[1] = [v19 CGColor];
      id v20 = v19;
      v35[2] = [v20 CGColor];
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
      [v17 setColors:v21];

      objc_msgSend(v17, "setEndPoint:", 1.0, 0.5);
      objc_msgSend(v17, "setStartPoint:", 0.0, 0.5);

      offerConfirmationGradientView = self->_offerConfirmationGradientView;
    }
    [v11 insertSubview:offerConfirmationGradientView belowSubview:v30[5]];
    [(SKUIProductLockupCollectionViewCell *)self _layoutConfirmationGradientRelativeToSection:v5 alpha:0.0];

    _Block_object_dispose(&v29, 8);
  }
}

void __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke(uint64_t a1, uint64_t a2)
{
  CGFloat v3 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  unsigned int v5 = (id *)(v4 + 40);
  id v7 = v3;
  if (!v6)
  {
    objc_storeStrong(v5, v3);
    CGFloat v3 = v7;
  }
  [*(id *)(a1 + 40) bringSubviewToFront:v3];
}

void __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:a2];
  [*(id *)(a1 + 40) bringSubviewToFront:v3];
}

- (CGRect)_stackBottomRightElements:(id)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  uint64_t v22 = 0;
  CGRect v23 = (double *)&v22;
  uint64_t v24 = 0x4010000000;
  id v25 = &unk_1C1D0F257;
  long long v26 = 0u;
  long long v27 = 0u;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v28);
  *(CGFloat *)&long long v26 = x;
  *((CGFloat *)&v26 + 1) = MaxY;
  long long v27 = 0uLL;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__SKUIProductLockupCollectionViewCell__stackBottomRightElements_inRect___block_invoke;
  v19[3] = &unk_1E6426330;
  *(CGFloat *)&v19[8] = x;
  *(CGFloat *)&v19[9] = y;
  *(CGFloat *)&v19[10] = width;
  *(CGFloat *)&v19[11] = height;
  v19[4] = self;
  v19[5] = &v22;
  v19[6] = v21;
  v19[7] = v20;
  [v9 enumerateObjectsWithOptions:2 usingBlock:v19];
  double v11 = v23[4];
  double v12 = v23[5];
  double v13 = v23[6];
  double v14 = v23[7];
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

void __72__SKUIProductLockupCollectionViewCell__stackBottomRightElements_inRect___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 832), "objectForKey:");
  if (([v3 isHidden] & 1) == 0)
  {
    objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 80), 1.79769313e308);
    v18.size.CGFloat width = v4;
    v18.size.CGFloat height = v5;
    v18.origin.CGFloat x = *(double *)(a1 + 64) + *(double *)(a1 + 80) - v4;
    v18.origin.CGFloat y = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
                 - v5
                 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    CGRect v19 = CGRectIntegral(v18);
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
    [*(id *)(a1 + 32) bounds];
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v10, v11, v12, v13);
    objc_msgSend(v3, "setFrame:");
    [v3 setNeedsLayout];
    double v14 = *(CGRect **)(*(void *)(a1 + 40) + 8);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGRect v20 = CGRectUnion(v14[1], v21);
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
      double v14 = *(CGRect **)(*(void *)(a1 + 40) + 8);
      v14[1].origin.CGFloat x = v20.origin.x;
    }
    else
    {
      v14[1].origin.CGFloat x = x;
    }
    v14[1].origin.CGFloat y = y;
    v14[1].size.CGFloat width = width;
    v14[1].size.CGFloat height = height;
    [*(id *)(*(void *)(a1 + 32) + 848) bottomPaddingForViewElement:v16];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v15;
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
}

- (CGRect)_stackElements:(id)a3 alignment:(int64_t)a4 inRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  uint64_t v25 = 0;
  long long v26 = (double *)&v25;
  uint64_t v27 = 0x4010000000;
  CGRect v28 = &unk_1C1D0F257;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v29 = *MEMORY[0x1E4F1DB28];
  long long v30 = v12;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__SKUIProductLockupCollectionViewCell__stackElements_alignment_inRect___block_invoke;
  v21[3] = &unk_1E6426358;
  *(CGFloat *)&v21[9] = x;
  *(CGFloat *)&v21[10] = y;
  *(CGFloat *)&v21[11] = width;
  *(CGFloat *)&v21[12] = height;
  void v21[4] = self;
  v21[5] = &v25;
  v21[13] = a4;
  v21[6] = v24;
  v21[7] = v22;
  v21[8] = v23;
  [v11 enumerateObjectsUsingBlock:v21];
  double v13 = v26[4];
  double v14 = v26[5];
  double v15 = v26[6];
  double v16 = v26[7];
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

void __71__SKUIProductLockupCollectionViewCell__stackElements_alignment_inRect___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 832), "objectForKey:");
  if (([v3 isHidden] & 1) == 0)
  {
    double v4 = [*(id *)(a1 + 32) textPropertiesForView:v3];
    objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 88), 1.79769313e308);
    CGFloat v7 = v6;
    if (v5 >= *(double *)(a1 + 88)) {
      double v9 = *(double *)(a1 + 88);
    }
    else {
      double v9 = v5;
    }
    double v8 = *(double *)(a1 + 80);
    double v10 = v8 + CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
    double v11 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v12 = *(double *)(a1 + 72);
    if (*(void *)(a1 + 104) == 8) {
      double v12 = CGRectGetMaxX(*(CGRect *)(a1 + 72)) - v9;
    }
    double v13 = v10 + v11;
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [v4 desiredOffsetTop];
      double v15 = v14;
      [*(id *)(*(void *)(a1 + 32) + 848) topPaddingForViewElement:v25];
      if (v15 >= v16) {
        double v16 = v15;
      }
      float v17 = v16 - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      double v13 = v13 + fmaxf(roundf(v17), 0.0);
    }
    v27.origin.CGFloat x = v12;
    v27.origin.CGFloat y = v13;
    v27.size.CGFloat width = v9;
    v27.size.CGFloat height = v7;
    CGRect v28 = CGRectIntegral(v27);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    objc_msgSend(v3, "setFrame:");
    uint64_t v22 = *(CGRect **)(*(void *)(a1 + 40) + 8);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      CGRect v29 = CGRectUnion(v22[1], v30);
      CGFloat y = v29.origin.y;
      CGFloat width = v29.size.width;
      CGFloat height = v29.size.height;
      uint64_t v22 = *(CGRect **)(*(void *)(a1 + 40) + 8);
      v22[1].origin.CGFloat x = v29.origin.x;
    }
    else
    {
      v22[1].origin.CGFloat x = x;
    }
    v22[1].origin.CGFloat y = y;
    v22[1].size.CGFloat width = width;
    v22[1].size.CGFloat height = height;
    [*(id *)(*(void *)(a1 + 32) + 848) bottomPaddingForViewElement:v25];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23;
    [v4 baselineOffsetFromBottom];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v24;
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
}

- (void)_updateLayoutToAnimateOfferTransitionForView:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIProductLockupCollectionViewCell *)self _viewElementForView:v4];
  double v6 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:1];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    [v4 frame];
    double x = v41.origin.x;
    double y = v41.origin.y;
    double MaxX = CGRectGetMaxX(v41);
    objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    double v12 = v11;
    double v14 = v13;
    int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    double v16 = MaxX - v12;
    if (ShouldReverseLayoutDirection) {
      double v16 = x;
    }
    objc_msgSend(v4, "setFrame:", v16, y, v12, v14);
    uint64_t v17 = 1;
  }
  else
  {
    if ([(SKUIProductLockupLayout *)self->_layout bottomLeftLayoutStyle] == 2)
    {
      double v18 = [(SKUIProductLockupLayout *)self->_layout viewElementsForSection:0];
      uint64_t v37 = 0;
      double v38 = (CGFloat *)&v37;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0;
      elementViews = self->_elementViews;
      double v20 = [v18 firstObject];
      CGRect v21 = [(NSMapTable *)elementViews objectForKey:v20];
      [v21 frame];
      uint64_t v23 = v22;

      uint64_t v40 = v23;
      if (storeShouldReverseLayoutDirection())
      {
        uint64_t v24 = self->_elementViews;
        id v25 = [v18 firstObject];
        long long v26 = [(NSMapTable *)v24 objectForKey:v25];
        [v26 frame];
        v38[3] = CGRectGetMaxX(v42);
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __84__SKUIProductLockupCollectionViewCell__updateLayoutToAnimateOfferTransitionForView___block_invoke;
      v34[3] = &unk_1E64262E0;
      void v34[4] = self;
      double v36 = &v37;
      id v35 = v4;
      [v18 enumerateObjectsUsingBlock:v34];

      _Block_object_dispose(&v37, 8);
    }
    else
    {
      [v4 frame];
      double v27 = v43.origin.x;
      double v28 = v43.origin.y;
      double v29 = CGRectGetMaxX(v43);
      objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
      double v31 = v30;
      double v33 = v32;
      if (!self->_offerMetadataPosition && !storeShouldReverseLayoutDirection()) {
        double v27 = v29 - v31;
      }
      objc_msgSend(v4, "setFrame:", v27, v28, v31, v33);
    }
    uint64_t v17 = 0;
  }
  [(SKUIProductLockupCollectionViewCell *)self _layoutConfirmationGradientRelativeToSection:v17 alpha:1.0];
}

uint64_t __84__SKUIProductLockupCollectionViewCell__updateLayoutToAnimateOfferTransitionForView___block_invoke(void *a1, uint64_t a2)
{
  long long v26 = [*(id *)(a1[4] + 832) objectForKey:a2];
  uint64_t v3 = [v26 isHidden];
  id v4 = v26;
  if ((v3 & 1) == 0)
  {
    [v26 frame];
    CGFloat v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    if (storeShouldReverseLayoutDirection())
    {
      double v13 = *(double *)(*(void *)(a1[6] + 8) + 24);
      v28.origin.double x = v6;
      v28.origin.double y = v8;
      v28.size.CGFloat width = v10;
      v28.size.CGFloat height = v12;
      double v14 = v13 - CGRectGetWidth(v28);
    }
    else
    {
      double v14 = *(double *)(*(void *)(a1[6] + 8) + 24);
    }
    v29.origin.double x = v14;
    v29.origin.double y = v8;
    v29.size.CGFloat width = v10;
    v29.size.CGFloat height = v12;
    double MaxX = CGRectGetMaxX(v29);
    if (v26 == (void *)a1[5])
    {
      objc_msgSend(v26, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
      double v10 = v16;
      double v12 = v17;
    }
    if (storeShouldReverseLayoutDirection())
    {
      v30.origin.double x = v14;
      v30.origin.double y = v8;
      v30.size.CGFloat width = v10;
      v30.size.CGFloat height = v12;
      double v14 = MaxX - CGRectGetWidth(v30);
    }
    objc_msgSend(v26, "setFrame:", v14, v8, v10, v12);
    int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    double v19 = v14;
    double v20 = v8;
    double v21 = v10;
    double v22 = v12;
    if (ShouldReverseLayoutDirection)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v19);
      double v24 = -5.0;
    }
    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v19);
      double v24 = 5.0;
    }
    id v4 = v26;
    *(double *)(*(void *)(a1[6] + 8) + 24) = MinX + v24;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)_viewElementForView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = self->_elementViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_elementViews, "objectForKey:", v10, (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControlControllers, 0);
  objc_storeStrong((id *)&self->_offerViews, 0);
  objc_storeStrong((id *)&self->_offerConfirmationGradientView, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_elementViews, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);

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

+ (void)_requestLayoutForViewElements:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end