@interface SKUITabularLockupView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)_sizeViewsForColumn:(id)a3 toFitWidth:(double)a4;
- (SKUITabularLockupView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_layoutSubviewsForColumn:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUITabularLockupView

- (SKUITabularLockupView)initWithFrame:(CGRect)a3
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
        -[SKUITabularLockupView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUITabularLockupView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElementViews = v16->_viewElementViews;
    v16->_viewElementViews = (NSMapTable *)v17;
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
        +[SKUITabularLockupView prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITabularLockupView preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUITabularLockupView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [[SKUITabularLockupLayout alloc] initWithLockup:v8 context:v9];
  [(SKUITabularLockupLayout *)v18 sizeColumnsToFitWidth:v9 context:a4];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = [(SKUITabularLockupLayout *)v18 columns];
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
        v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v24 size];
        double v26 = v25;
        v27 = [v24 childViewElements];
        [a1 _requestLayoutForViewElements:v27 width:v9 context:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v21);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUITabularLockupView sizeThatFitsWidth:viewElement:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  viewElementViews = self->_viewElementViews;
  id v10 = a3;
  [(NSMapTable *)viewElementViews removeAllObjects];
  uint64_t v11 = [[SKUITabularLockupLayout alloc] initWithLockup:v10 context:v8];

  layout = self->_layout;
  self->_layout = v11;

  [(SKUITabularLockupLayout *)self->_layout sizeColumnsToFitWidth:v8 context:a4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_1E642A530;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:v14];
}

void __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 424) columns];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v6[3] = &unk_1E642A508;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 size];
  double v5 = v4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend(v3, "childViewElements", 0);
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
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 elementType] == 138)
        {
          uint64_t v12 = *(void **)(a1 + 32);
          id v13 = v11;
          double v14 = objc_msgSend(*(id *)(a1 + 40), "addLabelViewWithElement:width:context:", v13, *(void *)(a1 + 32), (double)objc_msgSend(v12, "maxWidthForElement:withDefaultWidth:", v13, (uint64_t)v5));

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
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SKUITabularLockupView;
  [(SKUITabularLockupView *)&v12 layoutSubviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(SKUITabularLockupLayout *)self->_layout columns];
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
        [(SKUITabularLockupView *)self _layoutSubviewsForColumn:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUITabularLockupView _attributedStringForLabel:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  long long v15 = +[SKUITabularLockupLayout fontForLabelViewElement:v5 context:v6];
  long long v16 = [v5 style];
  long long v17 = [v6 tintColor];

  long long v18 = SKUIViewElementPlainColorWithStyle(v16, v17);

  if (!v18)
  {
    long long v18 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v19 = [v5 text];
  uint64_t v20 = [v5 style];
  uint64_t v21 = [v19 attributedStringWithDefaultFont:v15 foregroundColor:v18 style:v20];

  return v21;
}

+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUITabularLockupView _requestLayoutForViewElements:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  long long v17 = [v8 labelLayoutCache];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v23 elementType] == 138)
        {
          id v24 = v23;
          uint64_t v25 = [v8 maxWidthForElement:v24 withDefaultWidth:(uint64_t)a4];
          double v26 = [a1 _attributedStringForLabel:v24 context:v8];
          [v17 requestLayoutForLabel:v24 attributedString:v26 width:v25];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v20);
  }
}

- (void)_layoutSubviewsForColumn:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  [(SKUITabularLockupView *)self bounds];
  CGFloat v30 = v7;
  CGFloat v31 = v6;
  CGFloat v28 = v9;
  CGFloat v29 = v8;
  [(SKUITabularLockupView *)self bounds];
  [(SKUITabularLockupView *)self _sizeViewsForColumn:v4 toFitWidth:CGRectGetWidth(v39)];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v10 = [v4 childViewElements];
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
        uint64_t v15 = [(NSMapTable *)self->_viewElementViews objectForKey:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v15 frame];
        double v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat rect = v18;
        switch(v5)
        {
          case 2:
            v42.origin.double y = v30;
            v42.origin.double x = v31;
            v42.size.double height = v28;
            v42.size.double width = v29;
            double Width = CGRectGetWidth(v42);
            v43.origin.double x = v17;
            v43.origin.double y = v19;
            v43.size.double width = v21;
            v43.size.double height = v23;
            double v17 = Width - CGRectGetWidth(v43);
            break;
          case 1:
            v40.origin.double y = v30;
            v40.origin.double x = v31;
            v40.size.double height = v28;
            v40.size.double width = v29;
            double v24 = CGRectGetWidth(v40);
            v41.origin.double x = v17;
            v41.origin.double y = v19;
            v41.size.double width = v21;
            v41.size.double height = v23;
            double v17 = floor((v24 - CGRectGetWidth(v41)) * 0.5);
            break;
          case 0:
            double v17 = 0.0;
            break;
        }
        v44.origin.double x = v31;
        v44.origin.double y = v30;
        v44.size.double width = v29;
        v44.size.double height = v28;
        double Height = CGRectGetHeight(v44);
        v45.origin.double x = v17;
        v45.origin.double y = rect;
        v45.size.double width = v21;
        v45.size.double height = v23;
        CGFloat v27 = CGRectGetHeight(v45);
        SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v17, floor((Height - v27) * 0.5), v21, v23, v31, v30, v29, v28);
        objc_msgSend(v15, "setFrame:");
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
  double v16 = &unk_1C1D0F257;
  long long v17 = *MEMORY[0x1E4F1DB30];
  double v7 = [v6 childViewElements];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__SKUITabularLockupView__sizeViewsForColumn_toFitWidth___block_invoke;
  v12[3] = &unk_1E6425218;
  *(double *)&v12[6] = a4;
  v12[4] = self;
  v12[5] = &v13;
  [v7 enumerateObjectsUsingBlock:v12];
  double v8 = v14[4];
  double v9 = v14[5];

  _Block_object_dispose(&v13, 8);
  double v10 = v8;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

void __56__SKUITabularLockupView__sizeViewsForColumn_toFitWidth___block_invoke(uint64_t a1, uint64_t a2)
{
  id v15 = [*(id *)(*(void *)(a1 + 32) + 432) objectForKey:a2];
  uint64_t v3 = *MEMORY[0x1E4F1DB28];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
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

+ (void)_attributedStringForLabel:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_requestLayoutForViewElements:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end