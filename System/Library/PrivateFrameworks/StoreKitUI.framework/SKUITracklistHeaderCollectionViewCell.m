@interface SKUITracklistHeaderCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeForHeaderTitleLabel:(id)a3;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUITracklistHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUITracklistHeaderCollectionViewCell

- (SKUITracklistHeaderCollectionViewCell)initWithFrame:(CGRect)a3
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
        -[SKUITracklistHeaderCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SKUITracklistHeaderCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    columnViews = v16->_columnViews;
    v16->_columnViews = v17;

    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    bottomSeparatorView = v16->_bottomSeparatorView;
    v16->_bottomSeparatorView = v19;

    v21 = v16->_bottomSeparatorView;
    v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v21 setBackgroundColor:v22];

    v23 = [(SKUITracklistHeaderCollectionViewCell *)v16 contentView];
    [v23 addSubview:v16->_bottomSeparatorView];

    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topSeparatorView = v16->_topSeparatorView;
    v16->_topSeparatorView = v24;

    v26 = v16->_topSeparatorView;
    v27 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v26 setBackgroundColor:v27];

    v28 = [(SKUITracklistHeaderCollectionViewCell *)v16 contentView];
    [v28 addSubview:v16->_topSeparatorView];
  }
  return v16;
}

+ (CGSize)sizeForHeaderTitleLabel:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUITracklistHeaderCollectionViewCell sizeForHeaderTitleLabel:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [a1 _attributedStringForLabel:v4 context:0];
  [v13 size];
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUITracklistHeaderCollectionViewCell prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUITracklistHeaderCollectionViewCell preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
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
  id v7 = a5;
  id v8 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUITracklistHeaderCollectionViewCell requestLayoutForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  double v17 = [v7 aggregateValueForKey:0x1F1C8E028];
  double v18 = [v7 labelLayoutCache];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__SKUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E642A5B0;
  id v23 = v18;
  id v24 = a1;
  id v22 = v7;
  id v19 = v18;
  id v20 = v7;
  [v17 enumerateColumnsForHeader:v8 usingBlock:v21];
}

void __83__SKUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)a1[6];
  uint64_t v6 = a1[4];
  id v7 = a3;
  id v8 = a2;
  id v12 = [v5 _attributedStringForLabel:v7 context:v6];
  BOOL v9 = (void *)a1[5];
  [v8 width];
  double v11 = v10;

  [v9 requestLayoutForLabel:v7 attributedString:v12 width:(uint64_t)v11];
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
        +[SKUITracklistHeaderCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v27 = 0;
  v28 = (double *)&v27;
  uint64_t v29 = 0x3010000000;
  objc_super v30 = &unk_1C1D0F257;
  uint64_t v32 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  double v31 = a3;
  double v17 = [v8 aggregateValueForKey:0x1F1C8E028];
  double v18 = [v8 labelLayoutCache];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__SKUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v24[3] = &unk_1E642A5D8;
  id v19 = v18;
  id v25 = v19;
  v26 = &v27;
  [v17 enumerateColumnsForHeader:v7 usingBlock:v24];
  double v20 = v28[4];
  double v21 = v28[5] + 6.0;
  v28[5] = v21;

  _Block_object_dispose(&v27, 8);
  double v22 = v20;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

void __79__SKUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [a2 width];
  objc_msgSend(v5, "estimatedSizeForLabel:width:", v6);
  double v8 = v7;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(double *)(v9 + 40);
  if (v10 < v8) {
    double v10 = v8;
  }
  *(double *)(v9 + 40) = v10;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v8 aggregateValueForKey:0x1F1C8E028];
  columnData = self->_columnData;
  self->_columnData = v9;

  [(NSMutableDictionary *)self->_columnViews removeAllObjects];
  uint64_t v11 = [v7 style];
  uint64_t v12 = [v11 ikBorderColor];
  uint64_t v13 = [v12 color];

  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  }
  uint64_t v15 = v14;
  [(UIView *)self->_bottomSeparatorView setBackgroundColor:v14];
  [(UIView *)self->_topSeparatorView setBackgroundColor:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v18[3] = &unk_1E6422380;
  v18[4] = self;
  id v19 = v7;
  id v20 = v8;
  id v16 = v8;
  id v17 = v7;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v18];
}

void __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 824);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_1E642A600;
  id v10 = v3;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v5 enumerateColumnsForHeader:v4 usingBlock:v9];
}

void __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = (objc_class *)NSNumber;
  id v8 = a3;
  id v9 = a2;
  id v14 = (id)[[v7 alloc] initWithUnsignedInteger:a4];
  id v10 = (void *)a1[4];
  [v9 width];
  double v12 = v11;

  uint64_t v13 = [v10 addLabelViewWithElement:v8 width:a1[5] context:v12];

  [*(id *)(a1[6] + 832) setObject:v13 forKey:v14];
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
  v35.receiver = self;
  v35.super_class = (Class)SKUITracklistHeaderCollectionViewCell;
  [(SKUICollectionViewCell *)&v35 layoutSubviews];
  id v3 = [(SKUITracklistHeaderCollectionViewCell *)self contentView];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(SKUITracklistColumnData *)self->_columnData interColumnSpacing];
  uint64_t v13 = v12;
  id v14 = [(SKUITracklistHeaderCollectionViewCell *)self contentView];
  uint64_t v15 = [v14 effectiveUserInterfaceLayoutDirection];

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  uint64_t v34 = 0;
  [(SKUITracklistColumnData *)self->_columnData leftEdgeInset];
  uint64_t v34 = v16;
  id v17 = [(SKUITracklistColumnData *)self->_columnData columns];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  double v23 = __55__SKUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke;
  id v24 = &unk_1E642A628;
  uint64_t v27 = v5;
  uint64_t v28 = v7;
  double v29 = v9;
  double v30 = v11;
  id v25 = self;
  v26 = v33;
  BOOL v32 = v15 == 1;
  uint64_t v31 = v13;
  [v17 enumerateObjectsUsingBlock:&v21];

  double v18 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v21, v22, v23, v24);
  [v18 scale];
  double v20 = 1.0 / v19;

  -[UIView setFrame:](self->_bottomSeparatorView, "setFrame:", 0.0, v11 - v20, v9, v20);
  -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, v9, v20);
  _Block_object_dispose(v33, 8);
}

void __55__SKUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 832) objectForKey:v5];
  [v20 width];
  double v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", v7, *(double *)(a1 + 72));
    double v10 = v9;
    double v12 = v11;
    *(float *)&double v9 = (*(double *)(a1 + 72) - v11) * 0.5;
    float v13 = floorf(*(float *)&v9);
    switch([v20 headerAlignment])
    {
      case 0:
      case 3:
      case 4:
        double v14 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        break;
      case 1:
        double v15 = (v8 - v10) * 0.5 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        goto LABEL_7;
      case 2:
        double v15 = v8 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - v10;
LABEL_7:
        float v16 = v15;
        double v14 = floorf(v16);
        break;
      default:
        double v14 = *MEMORY[0x1E4F1DB28];
        break;
    }
    double v17 = v13;
    if (*(unsigned char *)(a1 + 88))
    {
      double v14 = CGRectWithFlippedOriginRelativeToBoundingRect(v14, v17, v10, v12, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
      double v10 = v18;
      double v12 = v19;
    }
    objc_msgSend(v6, "setFrame:", v14, v17, v10, v12);
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                              + *(double *)(a1 + 80)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v9 = [v6 clientContext];
    uint64_t v10 = SKUIUserInterfaceIdiom(v9);

    double v11 = 10.0;
    if (v10 == 1) {
      double v11 = 11.0;
    }
    double v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v11];
  }
  double v12 = [v6 tintColor];
  float v13 = SKUIViewElementPlainColorWithStyle(v7, v12);

  if (!v13)
  {
    float v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  }
  double v14 = [v5 text];
  double v15 = [v14 attributedStringWithDefaultFont:v8 foregroundColor:v13 style:v7];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_columnData, 0);

  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeForHeaderTitleLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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