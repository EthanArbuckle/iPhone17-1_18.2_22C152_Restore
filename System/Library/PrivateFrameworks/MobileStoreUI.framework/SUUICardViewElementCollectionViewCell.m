@interface SUUICardViewElementCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)artworkBoundingSizeWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)_defaultWidthForLockupWithContext:(id)a3;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CALayer)compactAdCardHairlineLayer;
- (NSString)impressionIdentifier;
- (NSString)lineItem;
- (SUUICardViewElementCollectionViewCell)initWithFrame:(CGRect)a3;
- (SUUISizeValue)artworkBoundingSize;
- (UIView)adCardBackgroundView;
- (double)_dividerHeight:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_imageTapAction:(id)a3;
- (void)_performDefaultActionForViewElement:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setAdCardBackgroundView:(id)a3;
- (void)setArtworkBoundingSize:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCompactAdCardHairlineLayer:(id)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)suuiadvertising_advertSelectionEventShouldBeForwarded:(id)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SUUICardViewElementCollectionViewCell

- (SUUICardViewElementCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUICardViewElementCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElements = v3->_viewElements;
    v3->_viewElements = (NSMapTable *)v4;
  }
  return v3;
}

+ (CGSize)artworkBoundingSizeWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  v21 = "";
  long long v22 = *MEMORY[0x263F001B0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__SUUICardViewElementCollectionViewCell_artworkBoundingSizeWithViewElement_width_context___block_invoke;
  v14[3] = &unk_265402460;
  v16 = &v18;
  id v9 = v8;
  id v15 = v9;
  double v17 = a4;
  [v7 enumerateChildrenUsingBlock:v14];
  double v10 = v19[4];
  double v11 = v19[5];

  _Block_object_dispose(&v18, 8);
  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __90__SUUICardViewElementCollectionViewCell_artworkBoundingSizeWithViewElement_width_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v5 = [v10 elementType];
  if (v5 != 152)
  {
    if (v5 == 62)
    {
      +[SUUIHorizontalListView preferredSizeForViewElement:v10 context:*(void *)(a1 + 32)];
      if (v6 == *MEMORY[0x263F001B0] && v7 == *(double *)(MEMORY[0x263F001B0] + 8)) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    if (v5 != 49) {
      goto LABEL_10;
    }
  }
  [*(id *)(a1 + 32) sizeForViewElement:v10 width:*(double *)(a1 + 48)];
LABEL_9:
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v9 + 32) = v6;
  *(double *)(v9 + 40) = v7;
  *a3 = 1;
LABEL_10:
}

- (void)setArtworkBoundingSize:(id)a3
{
  id v4 = a3;
  uint64_t artworkBoundingSize = (uint64_t)self->_artworkBoundingSize;
  if ((id)artworkBoundingSize != v4)
  {
    id v8 = v4;
    uint64_t artworkBoundingSize = [(id)artworkBoundingSize isEqual:v4];
    id v4 = v8;
    if ((artworkBoundingSize & 1) == 0)
    {
      double v6 = (SUUISizeValue *)[v8 copy];
      double v7 = self->_artworkBoundingSize;
      self->_uint64_t artworkBoundingSize = v6;

      uint64_t artworkBoundingSize = [(SUUICardViewElementCollectionViewCell *)self setNeedsLayout];
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](artworkBoundingSize, v4);
}

- (UIView)adCardBackgroundView
{
  adCardBackgroundView = self->_adCardBackgroundView;
  if (!adCardBackgroundView)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    uint64_t v5 = self->_adCardBackgroundView;
    self->_adCardBackgroundView = v4;

    double v6 = [(UIView *)self->_adCardBackgroundView layer];
    [v6 setCornerRadius:5.0];

    double v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 scale];
    double v9 = 1.0 / v8;
    id v10 = [(UIView *)self->_adCardBackgroundView layer];
    [v10 setBorderWidth:v9];

    id v11 = [MEMORY[0x263F825C8] colorWithHue:0.57292 saturation:0.06531 brightness:0.96078 alpha:1.0];
    uint64_t v12 = [v11 CGColor];
    double v13 = [(UIView *)self->_adCardBackgroundView layer];
    [v13 setBorderColor:v12];

    adCardBackgroundView = self->_adCardBackgroundView;
  }
  v14 = adCardBackgroundView;
  return v14;
}

- (CALayer)compactAdCardHairlineLayer
{
  compactAdCardHairlineLayer = self->_compactAdCardHairlineLayer;
  if (!compactAdCardHairlineLayer)
  {
    id v4 = [MEMORY[0x263F157E8] layer];
    uint64_t v5 = self->_compactAdCardHairlineLayer;
    self->_compactAdCardHairlineLayer = v4;

    id v6 = [MEMORY[0x263F825C8] colorWithHue:0.57292 saturation:0.06531 brightness:0.96078 alpha:1.0];
    -[CALayer setBackgroundColor:](self->_compactAdCardHairlineLayer, "setBackgroundColor:", [v6 CGColor]);

    compactAdCardHairlineLayer = self->_compactAdCardHairlineLayer;
  }
  double v7 = compactAdCardHairlineLayer;
  return v7;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  BOOL v9 = [v7 cardType] == 1;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__SUUICardViewElementCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
  v12[3] = &unk_265408680;
  int64_t v15 = a4;
  id v10 = v8;
  BOOL v16 = v9;
  id v13 = v10;
  v14 = &v17;
  [v7 enumerateChildrenUsingBlock:v12];
  LOBYTE(v8) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

void __88__SUUICardViewElementCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 elementType];
  if (v3 == 49)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v8 = v13;
      LODWORD(v9) = 1045220557;
      [v8 setLayerShadowOpacity:v9];
      [v8 setLayerShadowRadius:10.0];
      objc_msgSend(v8, "setLayerShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

      id v10 = v13;
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 0;
  }
  else if (v3 == 66)
  {
    char v4 = +[SUUIHorizontalLockupView prefetchResourcesForViewElement:v13 reason:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = [v13 firstChildForElementType:49];
      id v7 = v5;
      if (v5)
      {
        LODWORD(v6) = 1045220557;
        [v5 setLayerShadowOpacity:v6];
        [v7 setLayerShadowRadius:10.0];
        objc_msgSend(v7, "setLayerShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      }
    }
  }
  else
  {
    char v4 = [*(id *)(a1 + 32) prefetchResourcesForViewElement:v13 reason:*(void *)(a1 + 48)];
  }
  id v10 = v13;
LABEL_12:
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v11 + 24)) {
    char v12 = 1;
  }
  else {
    char v12 = v4;
  }
  *(unsigned char *)(v11 + 24) = v12;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  id v8 = [v6 style];
  double v9 = [v8 itemWidth];
  [v9 floatValue];
  float v11 = v10;

  if (v11 <= 0.00000011921)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __77__SUUICardViewElementCollectionViewCell_preferredSizeForViewElement_context___block_invoke;
    v19[3] = &unk_265400BE8;
    id v20 = v7;
    v21 = &v23;
    id v22 = a1;
    [v6 enumerateChildrenUsingBlock:v19];

    double v12 = v24[3];
  }
  else
  {
    double v12 = v11;
    v24[3] = v11;
  }
  if (v12 <= 0.00000011920929) {
    [v7 defaultItemWidthForViewElement:v6];
  }
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v6, v7);
  double v14 = v13;
  double v16 = v15;
  _Block_object_dispose(&v23, 8);

  double v17 = v14;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

void __77__SUUICardViewElementCollectionViewCell_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 elementType];
  if (v3 <= 65)
  {
    if (v3 == 49)
    {
      [*(id *)(a1 + 32) sizeForImageElement:v12];
    }
    else
    {
      if (v3 != 62) {
        goto LABEL_23;
      }
      +[SUUIHorizontalListView preferredSizeForViewElement:v12 context:*(void *)(a1 + 32)];
      if (v4 == *MEMORY[0x263F001B0] && v5 == *(double *)(MEMORY[0x263F001B0] + 8)) {
        goto LABEL_23;
      }
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v10 + 24) >= v4) {
      double v4 = *(double *)(v10 + 24);
    }
    goto LABEL_22;
  }
  if (v3 == 66)
  {
    double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [*(id *)(a1 + 48) _defaultWidthForLockupWithContext:*(void *)(a1 + 32)];
    if (v11 >= v4) {
      double v4 = v11;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_22:
    *(double *)(v10 + 24) = v4;
    goto LABEL_23;
  }
  if (v3 == 152)
  {
    id v7 = [v12 thumbnailImage];
    [*(id *)(a1 + 32) sizeForImageElement:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v9 + 24) >= v8) {
      double v8 = *(double *)(v9 + 24);
    }
    *(double *)(v9 + 24) = v8;
  }
LABEL_23:
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = +[SUUICardLayout layoutWithCardViewElement:v8 context:v7];
  uint64_t v10 = [v7 labelLayoutCache];
  [v9 horizontalContentInset];
  v15[1] = 3221225472;
  v15[0] = MEMORY[0x263EF8330];
  v15[2] = __83__SUUICardViewElementCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v15[3] = &unk_2654023C0;
  id v16 = v9;
  id v17 = v10;
  double v19 = a4 + v11 * -2.0;
  id v18 = v7;
  id v12 = v7;
  id v13 = v10;
  id v14 = v9;
  [v8 enumerateChildrenUsingBlock:v15];
}

void __83__SUUICardViewElementCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 elementType];
  if (v3 <= 61)
  {
    if (v3 <= 47)
    {
      if (v3 == 8)
      {
        [*(id *)(a1 + 40) requestLayoutForBadge:v8 width:(uint64_t)*(double *)(a1 + 56)];
        goto LABEL_26;
      }
      BOOL v4 = v3 == 12;
      double v5 = v8;
      if (!v4) {
        goto LABEL_27;
      }
      id v6 = [*(id *)(a1 + 32) attributedStringForButton:v8];
      [*(id *)(a1 + 40) requestLayoutForButton:v8 attributedString:v6 width:(uint64_t)*(double *)(a1 + 56)];
LABEL_20:

LABEL_26:
      double v5 = v8;
      goto LABEL_27;
    }
    if (v3 == 48)
    {
      id v7 = SUUISectionHeaderView;
    }
    else
    {
      BOOL v4 = v3 == 51;
      double v5 = v8;
      if (!v4) {
        goto LABEL_27;
      }
      id v7 = SUUIImageDeckView;
    }
LABEL_25:
    [(__objc2_class *)v7 requestLayoutForViewElement:v8 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    goto LABEL_26;
  }
  if (v3 <= 130)
  {
    if (v3 == 62)
    {
      id v7 = SUUIHorizontalListView;
    }
    else
    {
      BOOL v4 = v3 == 66;
      double v5 = v8;
      if (!v4) {
        goto LABEL_27;
      }
      id v7 = SUUIHorizontalLockupView;
    }
    goto LABEL_25;
  }
  if (v3 == 131)
  {
    id v7 = SUUIStackListCollectionViewCell;
    goto LABEL_25;
  }
  BOOL v4 = v3 == 138;
  double v5 = v8;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) attributedStringForLabel:v8];
    [*(id *)(a1 + 40) requestLayoutForLabel:v8 attributedString:v6 width:(uint64_t)*(double *)(a1 + 56)];
    goto LABEL_20;
  }
LABEL_27:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x3010000000;
  v53 = "";
  double v54 = a3;
  uint64_t v55 = 0;
  uint64_t v9 = +[SUUICardLayout layoutWithCardViewElement:v7 context:v8];
  [v9 horizontalContentInset];
  double v11 = v10;
  uint64_t v45 = 0;
  v46 = (double *)&v45;
  uint64_t v47 = 0x3010000000;
  v48 = "";
  long long v49 = *MEMORY[0x263F001B0];
  long long v29 = v49;
  id v12 = [v7 flattenedChildren];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__93;
  v43[4] = __Block_byref_object_dispose__93;
  id v44 = 0;
  uint64_t v13 = [v7 cardType];
  double v14 = a3 + v11 * -2.0;
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x3010000000;
  v41 = "";
  long long v42 = v29;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __79__SUUICardViewElementCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v30[3] = &unk_2654086A8;
  id v15 = v9;
  double v36 = v14;
  id v31 = v15;
  v32 = &v45;
  v33 = &v38;
  v34 = v43;
  BOOL v37 = v13 == 2;
  v35 = &v50;
  [v12 enumerateObjectsUsingBlock:v30];
  uint64_t v16 = [v12 lastObject];
  id v17 = (void *)v16;
  if (v13 == 2)
  {
    id v18 = v39;
    double v19 = v51;
    double v20 = v39[5] + v51[5];
    v51[5] = v20;
    if (v18[5] == 0.0) {
      double v21 = 30.0;
    }
    else {
      double v21 = 15.0;
    }
    goto LABEL_7;
  }
  if (v16)
  {
    [v15 bottomInsetForLastViewElement:v16 width:v14];
    double v19 = v51;
    double v21 = v51[5];
LABEL_7:
    v19[5] = v20 + v21;
    goto LABEL_8;
  }
  double v19 = v51;
LABEL_8:
  id v22 = v46;
  double v23 = v46[4];
  double v24 = v19[4];
  if (v23 > v24)
  {
    void v19[4] = v23;
    double v24 = v23;
  }
  double v25 = v22[5];
  double v26 = v19[5];
  if (v25 > v26)
  {
    v19[5] = v25;
    double v26 = v25;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v50, 8);

  double v27 = v24;
  double v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

void __79__SUUICardViewElementCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v18 = a2;
  uint64_t v6 = [v18 elementType];
  [*(id *)(a1 + 32) sizeForViewElement:v18 width:*(double *)(a1 + 72)];
  double v9 = v8;
  if (v6 == 7)
  {
    double v10 = v18;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v7 > *(double *)(v11 + 32))
    {
      *(double *)(v11 + 32) = v7;
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    if (v8 > *(double *)(v11 + 40)) {
      *(double *)(v11 + 40) = v8;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    *(double *)(v12 + 32) = v7;
    *(double *)(v12 + 40) = v8;
  }
  else
  {
    [*(id *)(a1 + 32) topInsetForViewElement:v18 previousViewElement:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) width:*(double *)(a1 + 72)];
    double v14 = v13;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    if (*(unsigned char *)(a1 + 80))
    {
      double v15 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      BOOL v16 = a3 > 1;
      if (v15 <= 0.0) {
        BOOL v16 = 0;
      }
      BOOL v17 = v15 != 0.0 && !v16;
      double v10 = v18;
      if (!v17) {
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v9
      }
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 40);
    }
    else
    {
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v9
                                                                  + v14
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 40);
      double v10 = v18;
    }
  }
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [(NSHashTable *)self->_artworkRelatedChildViewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  objc_storeStrong((id *)&self->_cardElement, a3);
  uint64_t v11 = +[SUUICardLayout layoutWithCardViewElement:v9 context:v10];
  layout = self->_layout;
  self->_layout = v11;

  productImageElement = self->_productImageElement;
  self->_productImageElement = 0;

  [(NSMapTable *)self->_viewElements removeAllObjects];
  self->_hasBottomAlignedItems = 0;
  self->_isActivityCard = [v9 cardType] == 1;
  int64_t v14 = [(SUUICardLayout *)self->_layout layoutStyle];
  programmedCardBackgroundView = self->_programmedCardBackgroundView;
  BOOL v16 = v14 == 1;
  if (v14 == 1)
  {
    if (!programmedCardBackgroundView)
    {
      BOOL v17 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      id v18 = self->_programmedCardBackgroundView;
      self->_programmedCardBackgroundView = v17;

      double v19 = [(UIView *)self->_programmedCardBackgroundView layer];
      [v19 setCornerRadius:5.0];

      double v20 = [(SUUICardViewElementCollectionViewCell *)self contentView];
      [v20 addSubview:self->_programmedCardBackgroundView];

      programmedCardBackgroundView = self->_programmedCardBackgroundView;
    }
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  [(UIView *)programmedCardBackgroundView setHidden:v21];
  int v22 = [v9 isAdCard];
  double v23 = [(SUUICardViewElementCollectionViewCell *)self adCardBackgroundView];
  double v24 = v23;
  if (v22)
  {
    [v23 setHidden:0];

    double v25 = [(SUUICardViewElementCollectionViewCell *)self compactAdCardHairlineLayer];
    double v26 = v25;
    uint64_t v27 = 0;
  }
  else
  {
    [v23 setHidden:1];

    double v25 = [(SUUICardViewElementCollectionViewCell *)self compactAdCardHairlineLayer];
    double v26 = v25;
    uint64_t v27 = 1;
  }
  [v25 setHidden:v27];

  [(SUUICardLayout *)self->_layout horizontalContentInset];
  double v29 = a4 + v28 * -2.0;
  backgroundWrapper = self->_backgroundWrapper;
  self->_backgroundWrapper = 0;

  backgroundViewWithParallax = self->_backgroundViewWithParallax;
  self->_backgroundViewWithParallax = 0;

  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v53 = MEMORY[0x263EF8330];
  uint64_t v54 = 3221225472;
  uint64_t v55 = __77__SUUICardViewElementCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v56 = &unk_2654086D0;
  id v32 = v9;
  id v57 = v32;
  double v61 = v29;
  id v33 = v10;
  id v58 = v33;
  v59 = self;
  BOOL v62 = v16;
  v60 = &v63;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:&v53];
  if (objc_msgSend(v32, "cardType", v53, v54, v55, v56) == 2 && self->_backgroundWrapper && *((unsigned char *)v64 + 24)) {
    self->_hasBottomAlignedItems = 1;
  }
  if (self->_isActivityCard)
  {
    v34 = [v33 clientContext];
    uint64_t v35 = SUUIUserInterfaceIdiom(v34);

    if (v35 == 1)
    {
      double v36 = [(SUUICardViewElement *)self->_cardElement style];
      BOOL v37 = [v36 borderRadius];

      if (v37)
      {
        id v38 = objc_alloc_init(MEMORY[0x263F15880]);
        [v37 cornerRadiiValue];
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        uint64_t v47 = (void *)MEMORY[0x263F824C0];
        [(SUUICardViewElementCollectionViewCell *)self bounds];
        uint64_t v48 = 4 * (v40 > 0.0);
        if (v42 > 0.0) {
          uint64_t v48 = (4 * (v40 > 0.0)) | 8;
        }
        if (v46 == 0.0) {
          uint64_t v49 = v48 | (v44 != 0.0);
        }
        else {
          uint64_t v49 = v48 | (v44 != 0.0) | 2;
        }
        objc_msgSend(v47, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v49);
        id v50 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setPath:", objc_msgSend(v50, "CGPath"));
        v51 = [(SUUICardViewElementCollectionViewCell *)self layer];
        [v51 setMasksToBounds:1];

        uint64_t v52 = [(SUUICardViewElementCollectionViewCell *)self layer];
        [v52 setMask:v38];
      }
    }
  }

  _Block_object_dispose(&v63, 8);
}

void __77__SUUICardViewElementCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v46 = a2;
  [*(id *)(a1 + 32) flattenedChildren];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v48;
    double v6 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
    do
    {
      uint64_t v8 = 0;
      double v44 = sel__imageTapAction_;
      do
      {
        if (*(void *)v48 != v5) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "elementType", v44);
        id v11 = 0;
        if (v10 > 61)
        {
          if (v10 <= 137)
          {
            if (v10 == 62)
            {
              if (!*(void *)(*(void *)(a1 + 48) + 888) && !*(unsigned char *)(a1 + 72))
              {
                +[SUUIHorizontalListView preferredSizeForViewElement:v9 context:*(void *)(a1 + 40)];
                if (v23 != v6 || v22 != v7) {
                  objc_storeStrong((id *)(*(void *)(a1 + 48) + 888), v9);
                }
              }
              double v25 = [v46 addHorizontalListWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
LABEL_70:
              id v13 = v25;
              id v11 = 0;
              uint64_t v12 = v13;
              goto LABEL_45;
            }
            if (v10 == 66)
            {
              id v13 = [v46 addHorizontalLockupWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
              double v26 = *(void **)(*(void *)(a1 + 48) + 832);
              if (v26) {
                [v26 setLockup:v13];
              }
              id v11 = 0;
              uint64_t v12 = v13;
              goto LABEL_45;
            }
            uint64_t v12 = 0;
            id v13 = 0;
            if (v10 != 131) {
              goto LABEL_57;
            }
            uint64_t v14 = [v46 addStackListViewWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
            goto LABEL_43;
          }
          if (v10 == 138)
          {
            uint64_t v14 = [v46 addLabelViewWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
            goto LABEL_43;
          }
          if (v10 == 152)
          {
            id v38 = (id *)(*(void *)(a1 + 48) + 888);
            if (!*v38) {
              objc_storeStrong(v38, v9);
            }
            id v39 = [v46 addImageViewWithVideoElement:v9 context:*(void *)(a1 + 40)];
LABEL_68:
            id v13 = v39;
            uint64_t v12 = 0;
            id v11 = v39;
            goto LABEL_45;
          }
          uint64_t v12 = 0;
          id v13 = 0;
          if (v10 != 141) {
            goto LABEL_57;
          }
        }
        else
        {
          if (v10 > 31)
          {
            switch(v10)
            {
              case '0':
                uint64_t v14 = [v46 addHeaderViewWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
                goto LABEL_43;
              case '1':
                double v40 = [v46 addImageViewWithElement:v9 context:*(void *)(a1 + 40)];
                double v41 = [v40 tapRecognizer];
                [v41 addTarget:*(void *)(a1 + 48) action:v44];

                double v42 = (id *)(*(void *)(a1 + 48) + 888);
                if (!*v42 && !*(unsigned char *)(a1 + 72)) {
                  objc_storeStrong(v42, v9);
                }
                id v39 = v40;
                goto LABEL_68;
              case '2':
                goto LABEL_22;
              case '3':
                double v25 = [v46 addImageDeckViewWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
                goto LABEL_70;
              default:
                uint64_t v12 = 0;
                id v13 = 0;
                if (v10 != 32) {
                  goto LABEL_57;
                }
                id v13 = [v46 addDividerWithElement:v9 context:*(void *)(a1 + 40)];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v20 = v9;
                  if ([v20 dividerType] == 3)
                  {
                    [*(id *)(a1 + 48) _dividerHeight:v20];
                    objc_msgSend(v13, "setDividerSize:");
                    uint64_t v21 = 1;
                  }
                  else
                  {
                    uint64_t v21 = 0;
                  }
                  [v13 setDividerOrientation:v21];
                }
                break;
            }
            goto LABEL_44;
          }
          if (v10 == 7)
          {
            double v15 = [v9 firstChildForElementType:49];
            BOOL v16 = [v46 addImageViewWithElement:v15 context:*(void *)(a1 + 40)];
            BOOL v17 = [[SUUIBackgroundImageWrapperForHorizontalLockup alloc] initWithImage:v16];
            uint64_t v18 = *(void *)(a1 + 48);
            double v19 = *(void **)(v18 + 832);
            *(void *)(v18 + 832) = v17;

            id v11 = *(id *)(*(void *)(a1 + 48) + 832);
            id v13 = v16;
            if ([v13 conformsToProtocol:&unk_270640F38]) {
              objc_storeStrong((id *)(*(void *)(a1 + 48) + 824), v16);
            }

            uint64_t v12 = 0;
            goto LABEL_45;
          }
          if (v10 == 8)
          {
            uint64_t v14 = [v46 addBadgeViewWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
LABEL_43:
            id v13 = (id)v14;
            goto LABEL_44;
          }
          uint64_t v12 = 0;
          id v13 = 0;
          if (v10 != 12) {
            goto LABEL_57;
          }
        }
LABEL_22:
        id v13 = [v46 addButtonWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 64)];
        [v13 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
LABEL_44:
        uint64_t v12 = 0;
        id v11 = 0;
LABEL_45:
        if (v13) {
          [*(id *)(*(void *)(a1 + 48) + 896) setObject:v9 forKey:v13];
        }
        if (v11)
        {
          uint64_t v27 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v9];
          if (v27)
          {
            double v28 = *(void **)(*(void *)(a1 + 48) + 856);
            if (!v28)
            {
              uint64_t v29 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
              uint64_t v30 = *(void *)(a1 + 48);
              id v31 = *(void **)(v30 + 856);
              *(void *)(v30 + 856) = v29;

              double v28 = *(void **)(*(void *)(a1 + 48) + 856);
            }
            [v28 setObject:v27 forKey:v11];
          }
        }
        if (v12)
        {
          id v32 = *(void **)(*(void *)(a1 + 48) + 816);
          if (!v32)
          {
            uint64_t v33 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
            uint64_t v34 = *(void *)(a1 + 48);
            uint64_t v35 = *(void **)(v34 + 816);
            *(void *)(v34 + 816) = v33;

            id v32 = *(void **)(*(void *)(a1 + 48) + 816);
          }
          [v32 addObject:v12];
        }
LABEL_57:
        double v36 = [v9 style];
        uint64_t v37 = [v36 elementPosition];

        if (v37 == 3) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }

        ++v8;
      }
      while (v4 != v8);
      uint64_t v43 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      uint64_t v4 = v43;
    }
    while (v43);
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  id v25 = v8;
  uint64_t v10 = [v8 requestIdentifier];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        BOOL v16 = [(NSMapTable *)self->_imageViewToImageResourceCacheKey objectForKey:v15];
        BOOL v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        uint64_t v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          uint64_t v21 = v26;
          [v15 setImage:v26];

          LOBYTE(v19) = 1;
          double v22 = v8;
          goto LABEL_22;
        }
      }
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = self->_artworkRelatedChildViewElementViews;
  uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v29;
    double v22 = v25;
    uint64_t v21 = v26;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * j) setImage:v26 forArtworkRequest:v25 context:v9])
        {
          LOBYTE(v19) = 1;
          goto LABEL_22;
        }
      }
      uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v22 = v8;
    uint64_t v21 = v26;
  }
LABEL_22:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v10 = [(SUUIViewElement *)self->_cardElement flattenedChildren];
  uint64_t v11 = [(SUUIViewReuseCollectionViewCell *)self allExistingViews];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__SUUICardViewElementCollectionViewCell_updateWithItemState_context_animated___block_invoke;
  v17[3] = &unk_2654086F8;
  id v12 = v11;
  id v18 = v12;
  uint64_t v21 = &v23;
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  BOOL v22 = a5;
  [v10 enumerateObjectsUsingBlock:v17];
  char v15 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __78__SUUICardViewElementCollectionViewCell_updateWithItemState_context_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 elementType];
  if (v7 == 66 || v7 == 62)
  {
    id v9 = [*(id *)(a1 + 32) objectAtIndex:a3];
    char v8 = [v9 updateWithItemState:*(void *)(a1 + 40) context:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 64)];
    *a4 = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  }
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIViewElement *)self->_cardElement flattenedChildren];
  double v6 = [(SUUIViewReuseCollectionViewCell *)self allExistingViews];
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__93;
  id v19 = __Block_byref_object_dispose__93;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__SUUICardViewElementCollectionViewCell_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_265405D00;
  id v7 = v6;
  id v12 = v7;
  id v14 = &v15;
  id v8 = v4;
  id v13 = v8;
  [v5 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __66__SUUICardViewElementCollectionViewCell_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 elementType];
  if (v7 == 66 || v7 == 62)
  {
    id v11 = [*(id *)(a1 + 32) objectAtIndex:a3];
    uint64_t v8 = [v11 viewForElementIdentifier:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      *a4 = 1;
    }
  }
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)setPerspectiveTargetView:(id)a3
{
  backgroundViewWithParallax = self->_backgroundViewWithParallax;
  id v4 = a3;
  [(SUUIPerspectiveView *)backgroundViewWithParallax setPerspectiveTargetView:v4];
}

- (void)setVanishingPoint:(CGPoint)a3
{
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

- (void)applyLayoutAttributes:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUICardViewElementCollectionViewCell;
  [(SUUIViewReuseCollectionViewCell *)&v9 applyLayoutAttributes:a3];
  if ([(SUUICardViewElement *)self->_cardElement isAdCard])
  {
    id v4 = [(SUUICardViewElementCollectionViewCell *)self adCardBackgroundView];
    char v5 = [v4 isHidden];

    if ((v5 & 1) == 0)
    {
      id v6 = [MEMORY[0x263F825C8] whiteColor];
      uint64_t v7 = [v6 CGColor];
      uint64_t v8 = [(SUUICardViewElementCollectionViewCell *)self layer];
      [v8 setBackgroundColor:v7];
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUUICardViewElementCollectionViewCell;
  -[SUUICollectionViewCell setSelected:](&v6, sel_setSelected_);
  if (v3)
  {
    if ([(SUUICardViewElement *)self->_cardElement isAdCard])
    {
      char v5 = [MEMORY[0x263F82438] sharedApplication];
      [v5 sendAction:sel_suuiadvertising_advertWasSelected_ to:0 from:self forEvent:0];
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  if (self->_isActivityCard)
  {
    id v4 = objc_msgSend(MEMORY[0x263F825C8], "clearColor", a3);
    v6.receiver = self;
    v6.super_class = (Class)SUUICardViewElementCollectionViewCell;
    [(SUUIViewReuseCollectionViewCell *)&v6 setBackgroundColor:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUICardViewElementCollectionViewCell;
    [(SUUIViewReuseCollectionViewCell *)&v5 setBackgroundColor:a3];
  }
}

- (void)layoutSubviews
{
  v124.receiver = self;
  v124.super_class = (Class)SUUICardViewElementCollectionViewCell;
  [(SUUICollectionViewCell *)&v124 layoutSubviews];
  BOOL v3 = [(SUUICardViewElementCollectionViewCell *)self backgroundColor];
  id v4 = [(SUUIViewElement *)self->_cardElement firstChildForElementType:7];

  int64_t v94 = [(SUUICardViewElement *)self->_cardElement cardType];
  v95 = v4;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F825C8] clearColor];

    BOOL v3 = (void *)v5;
  }
  objc_super v6 = [(SUUICardViewElementCollectionViewCell *)self contentView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SUUIViewReuseCollectionViewCell *)self contentInset];
  double v16 = v8 + v15;
  double v18 = v10 + v17;
  double v20 = v12 - (v15 + v19);
  double v22 = v14 - (v17 + v21);

  programmedCardBackgroundView = self->_programmedCardBackgroundView;
  if (programmedCardBackgroundView && ![(UIView *)programmedCardBackgroundView isHidden])
  {
    unint64_t v24 = SUUIColorSchemeStyleForColor(v3);
    if (v24 <= 3)
    {
      uint64_t v25 = SUUIColorByAdjustingBrightness(v3, flt_2568A19D0[v24]);

      BOOL v3 = (void *)v25;
    }
    [(UIView *)self->_programmedCardBackgroundView setBackgroundColor:v3];
    -[UIView setFrame:](self->_programmedCardBackgroundView, "setFrame:", v16, v18, v20, v22);
  }
  [(SUUICardLayout *)self->_layout horizontalContentInset];
  double v27 = v26;
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x3032000000;
  v122[3] = __Block_byref_object_copy__93;
  v122[4] = __Block_byref_object_dispose__93;
  id v123 = 0;
  long long v28 = [(SUUIViewReuseCollectionViewCell *)self allExistingViews];
  uint64_t v29 = [v28 count];
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2020000000;
  *(double *)&v121[3] = v18;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__93;
  v119 = __Block_byref_object_dispose__93;
  id v120 = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  v114[3] = 0x402E000000000000;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x2020000000;
  v113[3] = 0;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x2020000000;
  char v112 = 0;
  long long v30 = [(SUUICardViewElementCollectionViewCell *)self adCardBackgroundView];
  [v30 removeFromSuperview];

  long long v31 = [(SUUICardViewElementCollectionViewCell *)self compactAdCardHairlineLayer];
  [v31 removeFromSuperlayer];

  double v32 = v16 + v27;
  double v33 = v20 + v27 * -2.0;
  if ([(SUUICardViewElement *)self->_cardElement isAdCard])
  {
    long long v34 = [(SUUICardViewElementCollectionViewCell *)self traitCollection];
    uint64_t v35 = [v34 horizontalSizeClass];

    [(SUUICardViewElement *)self->_cardElement style];
    if (v35 == 1) {
      double v36 = {;
    }
      uint64_t v37 = [v36 ikBackgroundColor];
      id v38 = [v37 color];
      uint64_t v39 = [v38 CGColor];
      double v40 = [(SUUICardViewElementCollectionViewCell *)self layer];
      [v40 setBackgroundColor:v39];

      double v41 = [(SUUICardViewElementCollectionViewCell *)self contentView];
      double v42 = [v41 layer];
      uint64_t v43 = [(SUUICardViewElementCollectionViewCell *)self compactAdCardHairlineLayer];
      [v42 addSublayer:v43];

      double v44 = [(SUUICardViewElementCollectionViewCell *)self contentView];
      double v45 = [v44 layer];
      [v45 frame];
      double Width = CGRectGetWidth(v125);
      long long v47 = [MEMORY[0x263F82B60] mainScreen];
      [v47 scale];
      double v49 = v48;

      long long v50 = [(SUUICardViewElementCollectionViewCell *)self contentView];
      v51 = [v50 layer];
      [v51 frame];
      double MaxY = CGRectGetMaxY(v126);
      v127.origin.double x = *(CGFloat *)MEMORY[0x263F001A8];
      v127.origin.double y = *(CGFloat *)(MEMORY[0x263F001A8] + 8);
      CGFloat v53 = 1.0 / v49;
      v127.size.width = Width;
      v127.size.height = v53;
      double Height = CGRectGetHeight(v127);

      id v55 = [(SUUICardViewElementCollectionViewCell *)self compactAdCardHairlineLayer];
      objc_msgSend(v55, "setFrame:", 0.0, MaxY - Height, Width, v53);
    }
    else {
      v56 = {;
    }
      id v57 = [v56 ikBackgroundColor];
      uint64_t v58 = [v57 color];

      v59 = [(SUUICardViewElementCollectionViewCell *)self adCardBackgroundView];
      [v59 setBackgroundColor:v58];

      v60 = [(SUUICardViewElementCollectionViewCell *)self contentView];
      double v61 = [(SUUICardViewElementCollectionViewCell *)self adCardBackgroundView];
      [v60 addSubview:v61];

      BOOL v62 = [(SUUICardViewElementCollectionViewCell *)self contentView];
      uint64_t v63 = [(SUUICardViewElementCollectionViewCell *)self adCardBackgroundView];
      [v62 sendSubviewToBack:v63];

      v128.origin.double x = v32;
      v128.origin.double y = v18;
      v128.size.width = v20 + v27 * -2.0;
      v128.size.height = v22;
      CGRect v129 = CGRectInset(v128, -10.0, -10.0);
      double x = v129.origin.x;
      double y = v129.origin.y;
      double v66 = v129.size.width;
      double v67 = v129.size.height;
      v68 = [(SUUICardViewElementCollectionViewCell *)self adCardBackgroundView];
      objc_msgSend(v68, "setFrame:", x, y, v66, v67);

      id v55 = [MEMORY[0x263F825C8] whiteColor];
      uint64_t v69 = [v55 CGColor];
      v70 = [(SUUICardViewElementCollectionViewCell *)self layer];
      [v70 setBackgroundColor:v69];

      BOOL v3 = (void *)v58;
    }
  }
  v96[0] = MEMORY[0x263EF8330];
  v96[1] = 3221225472;
  v96[2] = __55__SUUICardViewElementCollectionViewCell_layoutSubviews__block_invoke;
  v96[3] = &unk_265408720;
  double v105 = v32;
  double v106 = v18;
  double v107 = v33;
  double v108 = v22;
  v96[4] = self;
  v99 = v113;
  BOOL v110 = v94 == 2;
  v100 = &v115;
  v101 = v111;
  uint64_t v109 = v29;
  v102 = v114;
  v103 = v121;
  v104 = v122;
  id v71 = v28;
  id v97 = v71;
  id v72 = v3;
  id v98 = v72;
  [v71 enumerateObjectsUsingBlock:v96];
  if ([(SUUICardViewElement *)self->_cardElement isAdCard])
  {
    v73 = [(SUUICardViewElementCollectionViewCell *)self compactAdCardHairlineLayer];
    [v73 frame];
    double v75 = v74;
    double v77 = v76;

    v78 = [(SUUICardViewElementCollectionViewCell *)self contentView];
    [v78 bounds];
    double v79 = CGRectGetWidth(v130);
    v80 = [MEMORY[0x263F82B60] mainScreen];
    [v80 scale];
    double v82 = v81;

    v83 = [(SUUICardViewElementCollectionViewCell *)self compactAdCardHairlineLayer];
    objc_msgSend(v83, "setFrame:", v75, v77, v79, 1.0 / v82);
  }
  if (v95 && v116[5] && v94 != 2)
  {
    v84 = -[NSMapTable objectForKey:](self->_viewElements, "objectForKey:");
    [(id)v116[5] frame];
    double v86 = v85;
    double v88 = v87;
    double v90 = v89;
    v131.origin.double x = v32;
    v131.origin.double y = v18;
    v131.size.width = v33;
    v131.size.height = v22;
    double v91 = CGRectGetMaxY(v131);
    [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v93) bottomInsetForLastViewElement:v84 width:v33];
    objc_msgSend((id)v116[5], "setFrame:", v86, v91 - v90 - v92, v88, v90);
  }
  _Block_object_dispose(v111, 8);
  _Block_object_dispose(v113, 8);
  _Block_object_dispose(v114, 8);
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v122, 8);
}

void __55__SUUICardViewElementCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v51 = a2;
  objc_super v6 = (double *)MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = [*(id *)(*(void *)(a1 + 32) + 896) objectForKey:v51];
  double v9 = *(double *)(a1 + 120);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 864))
  {
    double v9 = v9 + -2.0;
    double v10 = 1.0;
  }
  else
  {
    double v10 = 0.0;
  }
  objc_msgSend(v51, "sizeThatFits:", v9, 1.79769313e308);
  double v12 = v11;
  double v14 = v13;
  if ([v8 elementType] == 7)
  {
    float v15 = (*(double *)(a1 + 120) - v12) * 0.5;
    double v16 = *(double *)(a1 + 104) + floorf(v15);
    [v51 setContentMode:2];
    objc_msgSend(v51, "setFrame:", v16, v7, v12, v14);
    [*(id *)(a1 + 32) sendSubviewToBack:v51];
    if (*(unsigned char *)(*(void *)(a1 + 32) + 848))
    {
      v53.origin.double x = v16;
      v53.origin.double y = v7;
      v53.size.width = v12;
      v53.size.height = v14;
      *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CGRectGetHeight(v53);
    }
    goto LABEL_51;
  }
  double v17 = [v8 style];
  unint64_t v18 = SUUIViewElementAlignmentForStyle(v17);

  if (v18 > 5)
  {
    double v20 = *v6;
  }
  else if (((1 << v18) & 0x25) != 0)
  {
    float v19 = (*(double *)(a1 + 120) - v12) * 0.5;
    double v20 = *(double *)(a1 + 104) + floorf(v19);
  }
  else if (((1 << v18) & 0x12) != 0)
  {
    double v20 = v10 + *(double *)(a1 + 104);
  }
  else
  {
    double v20 = *(double *)(a1 + 104) + *(double *)(a1 + 120) - v12;
  }
  uint64_t v21 = [v8 elementType];
  if (v21 == 66)
  {
    id v22 = v8;
    uint64_t v23 = [v22 lockupViewType];
    BOOL v24 = v23 == 7;
    if (v23 != 7) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    }
    if ([*(id *)(*(void *)(a1 + 32) + 840) isAdCard]
      && ([*(id *)(a1 + 32) adCardBackgroundView],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          char v26 = [v25 isHidden],
          v25,
          (v26 & 1) == 0))
    {
      double v27 = [*(id *)(a1 + 32) adCardBackgroundView];
      long long v28 = [v27 backgroundColor];
      [v51 setGradientColor:v28];
    }
    else
    {
      [v51 setGradientColor:0];
    }
  }
  else
  {
    BOOL v24 = 0;
  }
  if (*(unsigned char *)(a1 + 144))
  {
    uint64_t v29 = [v8 style];
    uint64_t v30 = [v29 elementPosition];

    if (v30 == 3
      && *(unsigned char *)(*(void *)(a1 + 32) + 848)
      && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      double v31 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      v54.origin.double x = v20;
      v54.origin.double y = v7;
      v54.size.width = v12;
      v54.size.height = v14;
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v31 - CGRectGetHeight(v54);
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 24);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    double v32 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v55.origin.double x = v20;
    v55.origin.double y = v32;
    v55.size.width = v12;
    v55.size.height = v14;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = CGRectGetHeight(v55) + v32;
    goto LABEL_29;
  }
  if (*(void *)(a1 + 136) - 1 == a3 && [v8 elementType] == 32)
  {
    double v32 = CGRectGetMaxY(*(CGRect *)(a1 + 104)) - v14;
    goto LABEL_29;
  }
  uint64_t v41 = *(void *)(a1 + 32);
  double v42 = *(void **)(v41 + 904);
  if (v42 && v8 == *(void **)(v41 + 888))
  {
    double v47 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    [v42 size];
    float v49 = v47 + (v48 - v14) * 0.5;
    double v32 = floorf(v49);
    if (v24) {
      goto LABEL_29;
    }
  }
  else
  {
    double v32 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (v24) {
      goto LABEL_29;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 872) topInsetForViewElement:v8 previousViewElement:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) width:*(double *)(a1 + 120)];
  double v32 = v32 + v50;
LABEL_29:
  if ([*(id *)(*(void *)(a1 + 32) + 840) isAdCard])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && *(void *)(a1 + 136) - 1 == a3)
    {
      v56.origin.double x = v20;
      v56.origin.double y = v32;
      v56.size.width = v12;
      v56.size.height = v14;
      double Height = CGRectGetHeight(v56);
      double v32 = CGRectGetMaxY(*(CGRect *)(a1 + 104)) - Height;
      long long v34 = [*(id *)(a1 + 40) objectAtIndex:a3 - 1];
      [v34 frame];
      double MaxX = CGRectGetMaxX(v57);
      v58.origin.double x = v20;
      v58.origin.double y = v32;
      v58.size.width = v12;
      v58.size.height = v14;
      double v20 = MaxX - CGRectGetWidth(v58);
    }
  }
  objc_msgSend(v51, "setFrame:", v20, v32, v12, v14);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v8);
  v59.origin.double x = v20;
  v59.origin.double y = v32;
  v59.size.width = v12;
  v59.size.height = v14;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = CGRectGetMaxY(v59);
  uint64_t v36 = *(void *)(a1 + 32);
  if (v21 == 66 || !*(unsigned char *)(v36 + 864))
  {
    if (v21 == 66)
    {
      id v38 = [v8 style];
      uint64_t v39 = [v38 ikBackgroundColor];
      double v40 = [v39 color];

      uint64_t v36 = *(void *)(a1 + 32);
    }
    else
    {
      double v40 = 0;
    }
    if ([*(id *)(v36 + 840) isAdCard])
    {
      uint64_t v43 = [*(id *)(*(void *)(a1 + 32) + 840) style];
      double v44 = [v43 ikBackgroundColor];
      uint64_t v45 = [v44 color];

      double v40 = (void *)v45;
    }
    id v46 = v40;
    if (!v40) {
      id v46 = *(void **)(a1 + 48);
    }
    [v51 setBackgroundColor:v46];
  }
  else
  {
    uint64_t v37 = [MEMORY[0x263F825C8] clearColor];
    [v51 setBackgroundColor:v37];
  }
LABEL_51:
}

- (void)_buttonAction:(id)a3
{
  id v3 = [(NSMapTable *)self->_viewElements objectForKey:a3];
  [v3 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (void)_imageTapAction:(id)a3
{
  id v4 = a3;
  viewElements = self->_viewElements;
  objc_super v6 = [v4 view];
  double v7 = [(NSMapTable *)viewElements objectForKey:v6];

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SUUICardViewElementCollectionViewCell__imageTapAction___block_invoke;
  v9[3] = &unk_265403110;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__SUUICardViewElementCollectionViewCell__imageTapAction___block_invoke(uint64_t a1, int a2, char a3)
{
  if (!a2 || (a3 & 1) == 0)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __57__SUUICardViewElementCollectionViewCell__imageTapAction___block_invoke_2;
    v4[3] = &unk_2654022F8;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __57__SUUICardViewElementCollectionViewCell__imageTapAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performDefaultActionForViewElement:*(void *)(a1 + 32)];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUUICardViewElementCollectionViewCell;
    BOOL v7 = [(SUUICardViewElementCollectionViewCell *)&v9 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (void)suuiadvertising_advertSelectionEventShouldBeForwarded:(id)a3
{
  objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 sendAction:sel_suuiadvertising_advertWasSelected_ to:0 from:self forEvent:0];
}

- (NSString)lineItem
{
  if ([(SUUICardViewElement *)self->_cardElement isAdCard])
  {
    id v3 = [(SUUICardViewElement *)self->_cardElement attributes];
    id v4 = [v3 objectForKeyedSubscript:@"lineItem"];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)impressionIdentifier
{
  if ([(SUUICardViewElement *)self->_cardElement isAdCard])
  {
    id v3 = [(SUUICardViewElement *)self->_cardElement attributes];
    id v4 = [v3 objectForKeyedSubscript:@"impressionId"];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

+ (double)_defaultWidthForLockupWithContext:(id)a3
{
  id v3 = a3;
  [v3 activePageWidth];
  double v5 = v4;
  id v6 = [v3 clientContext];

  uint64_t v7 = SUUIUserInterfaceIdiom(v6);
  if (v7 == 1)
  {
    BOOL v8 = v5 < 500.0;
    objc_super v9 = (double *)&unk_2568A19C0;
    return v9[v8];
  }
  if (v5 > 500.0) {
    return 284.0;
  }
  if (v5 > 414.0) {
    return 357.6;
  }
  if (v5 <= 375.0)
  {
    BOOL v8 = v5 > 320.0;
    objc_super v9 = (double *)&unk_2568A19B0;
    return v9[v8];
  }
  return 364.0;
}

- (double)_dividerHeight:(id)a3
{
  id v3 = [a3 style];
  double v4 = [v3 itemHeight];

  if (v4)
  {
    [v4 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 10.0;
  }

  return v6;
}

- (void)_performDefaultActionForViewElement:(id)a3
{
  id v7 = a3;
  double v4 = SUUICollectionViewForView(self);
  float v5 = [v4 indexPathForCell:self];
  if (v5)
  {
    double v6 = [v4 delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 collectionView:v4 performDefaultActionForViewElement:v7 indexPath:v5];
    }
  }
}

- (SUUISizeValue)artworkBoundingSize
{
  return self->_artworkBoundingSize;
}

- (void)setAdCardBackgroundView:(id)a3
{
}

- (void)setCompactAdCardHairlineLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactAdCardHairlineLayer, 0);
  objc_storeStrong((id *)&self->_adCardBackgroundView, 0);
  objc_storeStrong((id *)&self->_artworkBoundingSize, 0);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_productImageElement, 0);
  objc_storeStrong((id *)&self->_programmedCardBackgroundView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_cardElement, 0);
  objc_storeStrong((id *)&self->_backgroundWrapper, 0);
  objc_storeStrong((id *)&self->_backgroundViewWithParallax, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

@end