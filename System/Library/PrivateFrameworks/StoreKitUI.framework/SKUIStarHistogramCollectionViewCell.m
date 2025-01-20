@interface SKUIStarHistogramCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForLabelViewElement:(id)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIStarHistogramCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUIStarHistogramCollectionViewCell

- (SKUIStarHistogramCollectionViewCell)initWithFrame:(CGRect)a3
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
        -[SKUIStarHistogramCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIStarHistogramCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  if (v16) {
    [(SKUIViewReuseCollectionViewCell *)v16 registerClass:objc_opt_class() forViewWithReuseIdentifier:@"starBar"];
  }
  return v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIStarHistogramCollectionViewCell prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
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
        +[SKUIStarHistogramCollectionViewCell preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
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
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUIStarHistogramCollectionViewCell requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__SKUIStarHistogramCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v19[3] = &unk_1E6429460;
  double v21 = a4;
  id v20 = v9;
  id v22 = a1;
  id v18 = v9;
  [v8 enumerateChildrenUsingBlock:v19];
}

void __81__SKUIStarHistogramCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 elementType];
  if (v3 == 138)
  {
    v4 = [*(id *)(a1 + 48) _attributedStringForLabelViewElement:v6];
    BOOL v5 = [*(id *)(a1 + 32) labelLayoutCache];
    [v5 requestLayoutForLabel:v6 attributedString:v4 width:(uint64_t)*(double *)(a1 + 40)];
  }
  else if (v3 == 135)
  {
    +[SKUIStarRatingViewElementView requestLayoutForViewElement:v6 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIStarHistogramCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x3010000000;
  v32 = &unk_1C1D0F257;
  uint64_t v34 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  double v33 = a3;
  uint64_t v17 = [v8 labelLayoutCache];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77__SKUIStarHistogramCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v24[3] = &unk_1E6429488;
  v27 = &v29;
  id v18 = v8;
  id v25 = v18;
  double v28 = a3;
  id v19 = v17;
  id v26 = v19;
  [v7 enumerateChildrenUsingBlock:v24];
  double v20 = v30[4];
  double v21 = v30[5];

  _Block_object_dispose(&v29, 8);
  double v22 = v20;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

void __77__SKUIStarHistogramCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 elementType];
  if (v3 == 138)
  {
    [*(id *)(a1 + 40) estimatedSizeForLabel:v11 width:*(double *)(a1 + 56)];
LABEL_7:
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    double v10 = *(double *)(v9 + 40);
    BOOL v5 = (double *)(v9 + 40);
    double v8 = v10;
    goto LABEL_8;
  }
  if (v3 == 135)
  {
    [*(id *)(a1 + 32) sizeForViewElement:v11 width:*(double *)(a1 + 56)];
    goto LABEL_7;
  }
  if (v3 != 133) {
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  double v6 = *(double *)(v4 + 40);
  BOOL v5 = (double *)(v4 + 40);
  double v7 = v6;
  double v8 = 14.0;
LABEL_8:
  *BOOL v5 = v7 + v8;
LABEL_9:
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E6426080;
  double v15 = a4;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v12];
}

void __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v6[3] = &unk_1E64294B0;
  id v7 = v3;
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateChildrenUsingBlock:v6];
}

void __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 elementType];
  if (v3 == 138)
  {
    id v9 = (id)[*(id *)(a1 + 32) addLabelViewWithElement:v10 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
LABEL_9:
    id v5 = v10;
    goto LABEL_10;
  }
  if (v3 == 135)
  {
    double v6 = [*(id *)(a1 + 32) addStarRatingViewWithViewElement:v10 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
    [v6 setElementSpacing:10];
    goto LABEL_8;
  }
  BOOL v4 = v3 == 133;
  id v5 = v10;
  if (v4)
  {
    double v6 = [*(id *)(a1 + 32) addReusableViewWithReuseIdentifier:@"starBar"];
    id v7 = [v10 style];
    [v6 setColoringUsingStyle:v7];

    objc_msgSend(v6, "setNumberOfStars:", objc_msgSend(v10, "numberOfStars"));
    [v10 value];
    [v6 setValue:v8];
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)SKUIStarHistogramCollectionViewCell;
  [(SKUICollectionViewCell *)&v44 layoutSubviews];
  uint64_t v3 = [(SKUIStarHistogramCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v37 = v5;
  CGFloat v38 = v4;
  double rect = v6;
  CGFloat v8 = v7;

  [(SKUIViewReuseCollectionViewCell *)self contentInset];
  CGFloat MaxY = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(SKUIViewReuseCollectionViewCell *)self allExistingViews];
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    double v21 = rect - v12 - v14;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        double v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend(v23, "sizeThatFits:", v21, 1.79769313e308);
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        double v28 = v12;
        if (ShouldReverseLayoutDirection)
        {
          v47.origin.CGFloat y = v37;
          v47.origin.CGFloat x = v38;
          v47.size.double width = rect;
          v47.size.CGFloat height = v8;
          double Width = CGRectGetWidth(v47);
          v48.origin.CGFloat x = 0.0;
          v48.origin.CGFloat y = MaxY;
          v48.size.double width = v25;
          v48.size.CGFloat height = v27;
          double v28 = Width - CGRectGetWidth(v48) - v12;
        }
        CGFloat v30 = MaxY;
        CGFloat v31 = v25;
        CGFloat v32 = v27;
        CGRect v49 = CGRectIntegral(*(CGRect *)&v28);
        CGFloat x = v49.origin.x;
        CGFloat y = v49.origin.y;
        CGFloat v35 = v49.size.width;
        CGFloat height = v49.size.height;
        objc_msgSend(v23, "setFrame:");
        v50.origin.CGFloat x = x;
        v50.origin.CGFloat y = y;
        v50.size.double width = v35;
        v50.size.CGFloat height = height;
        CGFloat MaxY = CGRectGetMaxY(v50);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v19);
  }
}

+ (id)_attributedStringForLabelViewElement:(id)a3
{
  uint64_t v3 = [a3 text];
  double v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  double v5 = [MEMORY[0x1E4FB1618] blackColor];
  double v6 = [v3 attributedStringWithDefaultFont:v4 foregroundColor:v5];

  return v6;
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

@end