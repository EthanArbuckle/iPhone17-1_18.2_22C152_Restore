@interface SKUISectionHeaderView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_linesForViewElement:(id)a3 width:(double)a4 buttonSize:(CGSize)a5 context:(id)a6;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUISectionHeaderView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUISectionHeaderView

- (SKUISectionHeaderView)initWithFrame:(CGRect)a3
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
        -[SKUISectionHeaderView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUISectionHeaderView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    views = v16->_views;
    v16->_views = (NSMapTable *)v17;
  }
  return v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        +[SKUISectionHeaderView prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUISectionHeaderView preferredSizeForViewElement:context:]();
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUISectionHeaderView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [v9 labelLayoutCache];
  v36 = [v8 button];
  v37 = v8;
  v19 = [v8 titleLabels];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v25 = [a1 _attributedStringForLabel:v24 context:v9];
        [v18 requestLayoutForLabel:v24 attributedString:v25 width:(uint64_t)a4];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v21);
  }
  if (v36)
  {
    float v26 = a4 * 0.3;
    uint64_t v27 = vcvtps_s32_f32(v26);
    v28 = [v36 style];
    if ([v28 elementAlignment] == 1)
    {
      uint64_t v29 = [v19 count];

      if (!v29)
      {
        v30 = [v37 style];
        [v30 elementPadding];
        double v32 = v31;
        double v34 = v33;

        uint64_t v27 = (uint64_t)(a4 - (v34 + v32));
      }
    }
    else
    {
    }
    v35 = [a1 _attributedStringForButton:v36 context:v9];
    [v18 requestLayoutForButton:v36 attributedString:v35 width:v27];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUISectionHeaderView sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [v8 button];
  if (v18)
  {
    float v19 = a3 * 0.3;
    [a1 _sizeForViewElement:v18 width:v9 context:(double)(uint64_t)vcvtps_s32_f32(v19)];
    double v21 = v20;
    double v23 = v22 + 10.0;
  }
  else
  {
    double v23 = *MEMORY[0x1E4F1DB30];
    double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  uint64_t v24 = [v8 titleLabels];
  v25 = v24;
  if (a3 <= 600.0)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v40 = [v24 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v59;
      double v30 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v59 != v42) {
            objc_enumerationMutation(v25);
          }
          [a1 _sizeForViewElement:*(void *)(*((void *)&v58 + 1) + 8 * i) width:v9 context:a3];
          double v30 = v30 + v44;
        }
        uint64_t v41 = [v25 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v41);
    }
    else
    {
      double v30 = 0.0;
    }
  }
  else
  {
    v47 = v24;
    v48 = v18;
    id v49 = v8;
    float v26 = objc_msgSend(a1, "_linesForViewElement:width:buttonSize:context:", v8, v9, a3, v23, v21);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v55;
      double v30 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(v26);
          }
          double v32 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v33 = v32;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v62 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v51;
            double v37 = 0.0;
            do
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v51 != v36) {
                  objc_enumerationMutation(v33);
                }
                [a1 _sizeForViewElement:*(void *)(*((void *)&v50 + 1) + 8 * k) width:v9 context:a3];
                if (v37 < v39) {
                  double v37 = v39;
                }
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v62 count:16];
            }
            while (v35);
          }
          else
          {
            double v37 = 0.0;
          }

          double v30 = v30 + v37;
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v28);
    }
    else
    {
      double v30 = 0.0;
    }

    v18 = v48;
    id v8 = v49;
    v25 = v47;
  }
  if (v30 >= v21) {
    double v21 = v30;
  }

  double v45 = a3;
  double v46 = v21;
  result.double height = v46;
  result.double width = v45;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_storeStrong((id *)&self->_header, a3);
  [(id)objc_opt_class() sizeThatFitsWidth:v9 viewElement:v10 context:a4];
  self->_lastFitSize.double width = v11;
  self->_lastFitSize.double height = v12;
  [(NSMapTable *)self->_views removeAllObjects];
  uint64_t v23 = 0;
  uint64_t v24 = (double *)&v23;
  uint64_t v25 = 0x3010000000;
  float v26 = &unk_1C1D0F257;
  long long v27 = *MEMORY[0x1E4F1DB30];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__SKUISectionHeaderView_reloadWithViewElement_width_context___block_invoke;
  v17[3] = &unk_1E64243D8;
  id v13 = v9;
  double v22 = a4;
  id v18 = v13;
  float v19 = self;
  id v14 = v10;
  id v20 = v14;
  double v21 = &v23;
  [(SKUIViewReuseView *)self modifyUsingBlock:v17];
  if (a4 <= 600.0)
  {
    lines = self->_lines;
    self->_lines = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_linesForViewElement:width:buttonSize:context:", self->_header, v14, a4, v24[4], v24[5]);
    uint64_t v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    lines = self->_lines;
    self->_lines = v15;
  }

  _Block_object_dispose(&v23, 8);
}

void __61__SKUISectionHeaderView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) button];
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  float v6 = *(double *)(a1 + 64) * 0.3;
  uint64_t v7 = vcvtps_s32_f32(v6);
  id v8 = [v4 style];
  if ([v8 elementAlignment] != 1)
  {

    goto LABEL_6;
  }
  id v9 = [*(id *)(*(void *)(a1 + 40) + 480) titleLabels];
  uint64_t v10 = [v9 count];

  if (v10)
  {
LABEL_6:
    char v16 = 0;
    goto LABEL_7;
  }
  CGFloat v11 = [*(id *)(a1 + 32) style];
  [v11 elementPadding];
  double v13 = v12;
  double v15 = v14;

  uint64_t v7 = (uint64_t)(*(double *)(a1 + 64) - (v13 + v15));
  char v16 = 1;
LABEL_7:
  uint64_t v17 = [v3 addButtonWithElement:v5 width:*(void *)(a1 + 48) context:(double)v7];
  [v17 addTarget:*(void *)(a1 + 40) action:sel__buttonAction_ forControlEvents:64];
  LODWORD(v18) = -0.5;
  [v17 setCharge:v18];
  [*(id *)(*(void *)(a1 + 40) + 488) setObject:v17 forKey:v5];
  objc_msgSend(v17, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v19 + 32) = v20;
  *(void *)(v19 + 40) = v21;
  if ((v16 & 1) == 0) {
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
  }
                                                                            + 32)
                                                                + 10.0;

LABEL_10:
  double v22 = [*(id *)(a1 + 32) titleLabels];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v28 = [v3 addLabelViewWithElement:v27 width:*(void *)(a1 + 48) context:*(double *)(a1 + 64)];
        [*(id *)(*(void *)(a1 + 40) + 488) setObject:v28 forKey:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUISectionHeaderView *)self setNeedsLayout];
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
  [(SKUISectionHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v11 = [(SKUIHeaderViewElement *)self->_header button];
  double v12 = [v11 style];
  if ([v12 elementAlignment] == 1)
  {
    double v13 = [(SKUIHeaderViewElement *)self->_header titleLabels];
    BOOL v14 = [v13 count] == 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  CGFloat v52 = v4;
  if (v11)
  {
    double v15 = [(NSMapTable *)self->_views objectForKey:v11];
    objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    double v17 = v16;
    uint64_t v19 = v18;
    if (v14)
    {
      uint64_t v20 = [v11 style];
      [v20 elementPadding];
      double v22 = v21;
      double v24 = v23;

      double v25 = v24 + self->_contentInset.left;
      double top = v22 + self->_contentInset.top;
    }
    else
    {
      v85.origin.double x = v4;
      v85.origin.CGFloat y = v6;
      v85.size.double width = v8;
      v85.size.CGFloat height = v10;
      double v25 = CGRectGetMaxX(v85) - self->_contentInset.right - v17;
      double top = self->_contentInset.top;
    }
    double v34 = v17;
    uint64_t v35 = v19;
    CGRect v86 = CGRectIntegral(*(CGRect *)&v25);
    double x = v86.origin.x;
    CGFloat y = v86.origin.y;
    double width = v86.size.width;
    CGFloat height = v86.size.height;
    CGFloat v36 = v4;
    CGFloat v27 = v6;
    CGFloat v37 = v6;
    CGFloat v28 = v8;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v86.origin.x, v86.origin.y, v86.size.width, v86.size.height, v36, v37, v8, v10);
    objc_msgSend(v15, "setFrame:");
    CGFloat v29 = v10;
    if (!v14)
    {
      double x = x + -10.0;
      double width = width + 10.0;
    }
  }
  else
  {
    CGFloat v27 = v6;
    CGFloat v28 = v8;
    CGFloat v29 = v10;
    double v15 = 0;
    double x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  uint64_t v81 = 0;
  v82 = (double *)&v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  long long v38 = [(SKUIHeaderViewElement *)self->_header titleLabels];
  if (self->_lastFitSize.width <= 600.0)
  {
    uint64_t v77 = 0;
    v78 = &v77;
    CGFloat v41 = self->_contentInset.top;
    uint64_t v79 = 0x2020000000;
    CGFloat v80 = v41;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __39__SKUISectionHeaderView_layoutSubviews__block_invoke;
    v65[3] = &unk_1E6424400;
    v65[4] = self;
    v67 = &v77;
    CGFloat v69 = v52;
    CGFloat v70 = v27;
    CGFloat v71 = v28;
    CGFloat v72 = v29;
    double v73 = x;
    CGFloat v74 = y;
    double v75 = width;
    CGFloat v76 = height;
    id v66 = v11;
    v68 = &v81;
    [v38 enumerateObjectsUsingBlock:v65];

    _Block_object_dispose(&v77, 8);
  }
  else
  {
    uint64_t v77 = 0;
    v78 = &v77;
    CGFloat v39 = self->_contentInset.top;
    uint64_t v79 = 0x2020000000;
    CGFloat v80 = v39;
    lines = self->_lines;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __39__SKUISectionHeaderView_layoutSubviews__block_invoke_2;
    v53[3] = &unk_1E6424428;
    v53[4] = self;
    CGFloat v57 = v52;
    CGFloat v58 = v27;
    CGFloat v59 = v28;
    CGFloat v60 = v29;
    id v54 = v11;
    long long v55 = &v77;
    double v61 = x;
    CGFloat v62 = y;
    double v63 = width;
    CGFloat v64 = height;
    long long v56 = &v81;
    [(NSArray *)lines enumerateObjectsUsingBlock:v53];

    _Block_object_dispose(&v77, 8);
  }
  if (v15) {
    char v42 = v14;
  }
  else {
    char v42 = 1;
  }
  if ((v42 & 1) == 0)
  {
    [v15 frame];
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v49 = self->_contentInset.top;
    double v50 = v82[3];
    [v15 baselineOffset];
    *(float *)&double v51 = v49 + v50 - v51;
    objc_msgSend(v15, "setFrame:", v44, roundf(*(float *)&v51), v46, v48);
  }

  _Block_object_dispose(&v81, 8);
}

void __39__SKUISectionHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v31 = a2;
  double v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "objectForKey:");
  objc_msgSend(v5, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  double v8 = v7;
  CGFloat v9 = v6;
  CGFloat v10 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v11 = *(double *)(*(void *)(a1 + 32) + 432);
  double v12 = *(double *)(a1 + 80) - *(double *)(*(void *)(a1 + 32) + 448);
  double v13 = v12 - v11;
  if (*(void *)(a1 + 40))
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v15 = v12 - v11;
    double v16 = v6;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 96), *(CGRect *)&v11)) {
      double v12 = *(double *)(a1 + 96);
    }
  }
  double v17 = *(double *)(*(void *)(a1 + 32) + 432);
  double v18 = v12 - v17;
  if (v8 >= v12 - v17) {
    double v8 = v12 - v17;
  }
  uint64_t v19 = [v31 style];
  unint64_t v20 = SKUIViewElementAlignmentForStyle(v19);

  if (v20 > 5)
  {
    double v21 = *MEMORY[0x1E4F1DB28];
  }
  else if (((1 << v20) & 0x33) != 0)
  {
    double v21 = *(double *)(*(void *)(a1 + 32) + 432);
  }
  else if (v20 == 2)
  {
    double v27 = *(double *)(*(void *)(a1 + 32) + 432);
    float v28 = (v13 - v8) * 0.5;
    double v29 = floorf(v28);
    double v21 = v27 + v29;
    if (*(void *)(a1 + 40))
    {
      v36.origin.CGFloat x = v27 + v29;
      v36.origin.CGFloat y = v10;
      v36.size.CGFloat width = v8;
      v36.size.CGFloat height = v9;
      if (CGRectIntersectsRect(v36, *(CGRect *)(a1 + 96)))
      {
        float v30 = (v18 - v8) * 0.5;
        double v21 = *(double *)(*(void *)(a1 + 32) + 432) + floorf(v30);
      }
    }
  }
  else
  {
    double v21 = v12 - v8;
  }
  v33.origin.CGFloat x = v21;
  v33.origin.CGFloat y = v10;
  v33.size.CGFloat width = v8;
  v33.size.CGFloat height = v9;
  CGRect v34 = CGRectIntegral(v33);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v34.origin.x, v34.origin.y, v34.size.width, v34.size.height, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
  objc_msgSend(v5, "setFrame:");
  if (!a3)
  {
    [v5 baselineOffset];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v26;
  }
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGRectGetMaxY(v35);
}

void __39__SKUISectionHeaderView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = *(double *)(*(void *)(a1 + 32) + 432);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    CGFloat v10 = *MEMORY[0x1E4F1DB28];
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    double v14 = 0.0;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v5);
        }
        double v17 = [*(id *)(*(void *)(a1 + 32) + 488) objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        objc_msgSend(v17, "sizeThatFits:", v12, v13);
        v47.size.CGFloat width = v18;
        v47.size.double height = v19;
        v47.origin.CGFloat x = v10;
        v47.origin.CGFloat y = v11;
        CGRect v48 = CGRectIntegral(v47);
        double height = v48.size.height;
        objc_msgSend(v17, "setFrame:", v48.origin.x, v48.origin.y, v48.size.width);
        [v17 baselineOffset];
        if (v14 < v21) {
          double v14 = v21;
        }
        if (v15 < height) {
          double v15 = height;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v8);
  }
  else
  {
    double v14 = 0.0;
    double v15 = 0.0;
  }
  double v22 = *(double *)(a1 + 80) - *(double *)(*(void *)(a1 + 32) + 448);
  if (*(void *)(a1 + 40))
  {
    v50.origin.CGFloat x = *(CGFloat *)(*(void *)(a1 + 32) + 432);
    v50.size.CGFloat width = v22 - v50.origin.x;
    v50.origin.CGFloat y = *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    v50.size.double height = v15;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 96), v50)) {
      double v22 = *(double *)(a1 + 96);
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v23);
        }
        float v28 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "objectForKey:", *(void *)(*((void *)&v36 + 1) + 8 * j), (void)v36);
        [v28 frame];
        double v30 = v29;
        CGFloat v32 = v31;
        double v33 = v14 + *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        [v28 baselineOffset];
        *(float *)&double v34 = v33 - v34;
        double v35 = roundf(*(float *)&v34);
        if (v30 >= v22 - v6) {
          double v30 = v22 - v6;
        }
        SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v6, v35, v30, v32, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
        objc_msgSend(v28, "setFrame:");
        v49.origin.CGFloat x = v6;
        v49.origin.CGFloat y = v35;
        v49.size.CGFloat width = v30;
        v49.size.double height = v32;
        double v6 = CGRectGetMaxX(v49) + 10.0;
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v25);
  }

  if (!a3) {
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v15
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_lastFitSize.width;
  double height = self->_lastFitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_buttonAction:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = 488;
  double v6 = self->_views;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        id v12 = [*(id *)((char *)&self->super.super.super.super.isa + v5) objectForKey:v11];

        if (v12 == v4)
        {
          double v13 = SKUICollectionViewCellForView(self);
          double v14 = SKUICollectionViewForView(v13);
          double v15 = [v14 delegate];
          if (objc_opt_respondsToSelector())
          {
            [v14 indexPathForCell:v13];
            double v16 = self;
            double v17 = v6;
            uint64_t v18 = v5;
            unint64_t v20 = v19 = v4;
            [v15 collectionView:v14 didConfirmButtonElement:v11 withClickInfo:0 forItemAtIndexPath:v20];

            id v4 = v19;
            uint64_t v5 = v18;
            double v6 = v17;
            self = v16;
            uint64_t v9 = v21;
          }
          else
          {
            [v11 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
          }

          uint64_t v8 = v22;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 buttonTitleStyle];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 style];
  }
  uint64_t v10 = v9;

  CGFloat v11 = SKUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    id v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E0] addingSymbolicTraits:2 options:0];
    CGFloat v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v12 size:0.0];
  }
  double v13 = [v6 tintColor];
  double v14 = SKUIViewElementPlainColorWithStyle(v10, v13);

  if (!v14)
  {
    double v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
  }
  double v15 = [v5 buttonText];
  double v16 = [v15 attributedStringWithDefaultFont:v11 foregroundColor:v14 style:v10];

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 style];
  uint64_t v8 = [v6 aggregateValueForKey:@"SKUISectionHeaderStyleKey"];
  uint64_t v9 = [v8 integerValue];

  uint64_t v10 = SKUIViewElementFontWithStyle(v7);
  CGFloat v11 = [v6 tintColor];

  id v12 = SKUIViewElementPlainColorWithStyle(v7, v11);

  unint64_t v13 = [v5 labelViewStyle];
  if (v13 > 5) {
    goto LABEL_17;
  }
  if (((1 << v13) & 0x1B) == 0)
  {
    if (!v10)
    {
      if (v9 != 1)
      {
        uint64_t v10 = SKUIFontPreferredFontForTextStyle(1);
        if (v12) {
          goto LABEL_17;
        }
LABEL_11:
        uint64_t v17 = [MEMORY[0x1E4FB1618] labelColor];
LABEL_16:
        id v12 = (void *)v17;
        goto LABEL_17;
      }
      double v16 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8] addingSymbolicTraits:2 options:0];
      uint64_t v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v16 size:0.0];
    }
    if (v12) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    if (v12) {
      goto LABEL_17;
    }
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    uint64_t v10 = SKUIFontPreferredFontForTextStyle(8);
    if (v12) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  uint64_t v10 = SKUIFontPreferredFontForTextStyle(21);
  if (!v12)
  {
LABEL_5:
    if (v9 != 1)
    {
      double v14 = (void *)MEMORY[0x1E4FB1618];
      double v15 = 0.6;
LABEL_15:
      uint64_t v17 = [v14 colorWithWhite:0.0 alpha:v15];
      goto LABEL_16;
    }
LABEL_14:
    double v14 = (void *)MEMORY[0x1E4FB1618];
    double v15 = 0.8;
    goto LABEL_15;
  }
LABEL_17:
  uint64_t v18 = SKUIViewElementAlignmentForStyle(v7);
  uint64_t v19 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v18);
  unint64_t v20 = [v5 text];
  uint64_t v21 = [v20 attributedStringWithDefaultFont:v10 foregroundColor:v12 textAlignment:v19 style:v7];

  return v21;
}

+ (id)_linesForViewElement:(id)a3 width:(double)a4 buttonSize:(CGSize)a5 context:(id)a6
{
  double width = a5.width;
  id v10 = a6;
  id v11 = a3;
  id v12 = objc_alloc_init(SKUIViewElementHorizontalLayout);
  [(SKUIViewElementHorizontalLayout *)v12 setElementSpacing:10.0];
  [(SKUIViewElementHorizontalLayout *)v12 setLayoutWidth:a4 - width];
  unint64_t v13 = [v11 titleLabels];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__SKUISectionHeaderView__linesForViewElement_width_buttonSize_context___block_invoke;
  v17[3] = &unk_1E6424450;
  double v20 = a4;
  id v18 = v10;
  id v19 = a1;
  id v14 = v10;
  double v15 = [(SKUIViewElementHorizontalLayout *)v12 layoutViewElements:v13 usingSizingBlock:v17];

  return v15;
}

uint64_t __71__SKUISectionHeaderView__linesForViewElement_width_buttonSize_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _sizeForViewElement:a2 width:*(void *)(a1 + 32) context:*(double *)(a1 + 48)];
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  [a5 sizeForViewElement:a3 width:a4];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_header, 0);

  objc_storeStrong((id *)&self->_lines, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUISectionHeaderView preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end