@interface SKUISegmentedControlCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUISegmentedControlCollectionViewCell

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        +[SKUISegmentedControlCollectionViewCell prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUISegmentedControlCollectionViewCell preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v5) {
      +[SKUISegmentedControlCollectionViewCell requestLayoutForViewElement:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
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
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUISegmentedControlCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  [v8 sizeForViewElement:v7 width:a3];
  double v18 = v17;

  double v19 = a3;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        -[SKUISegmentedControlCollectionViewCell reloadWithViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  id v17 = [(SKUISegmentedControlViewElementController *)self->_elementController viewElement];

  if (v17 == v7)
  {
    [(SKUISegmentedControlViewElementController *)self->_elementController reloadAfterDocumentUpdate];
  }
  else
  {
    bottomDividerView = self->_bottomDividerView;
    self->_bottomDividerView = 0;

    elementController = self->_elementController;
    self->_elementController = 0;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__SKUISegmentedControlCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
    v20[3] = &unk_1E6422380;
    id v21 = v7;
    id v22 = v8;
    v23 = self;
    [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v20];
  }
}

void __78__SKUISegmentedControlCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  v3 = [v18 addReusableViewWithReuseIdentifier:0x1F1C8E908];
  BOOL v4 = [*(id *)(a1 + 32) style];
  BOOL v5 = [*(id *)(a1 + 40) tintColor];
  uint64_t v6 = SKUIViewElementPlainColorWithStyle(v4, v5);

  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.588235294 alpha:1.0];
  }
  [v3 setTintColor:v6];
  id v7 = [[SKUISegmentedControlViewElementController alloc] initWithViewElement:*(void *)(a1 + 32) segmentedControl:v3];
  uint64_t v8 = *(void *)(a1 + 48);
  BOOL v9 = *(void **)(v8 + 824);
  *(void *)(v8 + 824) = v7;

  uint64_t v10 = *(void **)(*(void *)(a1 + 48) + 824);
  uint64_t v11 = [*(id *)(a1 + 40) clientContext];
  [v10 setClientContext:v11];

  uint64_t v12 = *(void **)(*(void *)(a1 + 48) + 824);
  uint64_t v13 = [*(id *)(a1 + 40) parentViewController];
  [v12 setParentViewController:v13];

  uint64_t v14 = [*(id *)(a1 + 32) bottomDivider];
  if (v14)
  {
    uint64_t v15 = [v18 addDividerWithElement:v14 context:*(void *)(a1 + 40)];
    uint64_t v16 = *(void *)(a1 + 48);
    id v17 = *(void **)(v16 + 816);
    *(void *)(v16 + 816) = v15;

    [*(id *)(*(void *)(a1 + 48) + 816) setDividerOrientation:0];
    [*(id *)(*(void *)(a1 + 48) + 816) setDividerSize:0.0];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISegmentedControlCollectionViewCell setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISegmentedControlCollectionViewCell updateWithItemState:context:animated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUISegmentedControlCollectionViewCell viewForElementIdentifier:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)layoutSubviews
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementController, 0);

  objc_storeStrong((id *)&self->_bottomDividerView, 0);
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

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end