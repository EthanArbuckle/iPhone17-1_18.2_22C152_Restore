@interface SUUITracklistHeaderCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeForHeaderTitleLabel:(id)a3;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUITracklistHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUITracklistHeaderCollectionViewCell

- (SUUITracklistHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SUUITracklistHeaderCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    columnViews = v3->_columnViews;
    v3->_columnViews = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v6;

    v8 = v3->_bottomSeparatorView;
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v8 setBackgroundColor:v9];

    v10 = [(SUUITracklistHeaderCollectionViewCell *)v3 contentView];
    [v10 addSubview:v3->_bottomSeparatorView];

    v11 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v11;

    v13 = v3->_topSeparatorView;
    v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v13 setBackgroundColor:v14];

    v15 = [(SUUITracklistHeaderCollectionViewCell *)v3 contentView];
    [v15 addSubview:v3->_topSeparatorView];
  }
  return v3;
}

+ (CGSize)sizeForHeaderTitleLabel:(id)a3
{
  v3 = [a1 _attributedStringForLabel:a3 context:0];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [v7 aggregateValueForKey:0x2704FCC90];
  v10 = [v7 labelLayoutCache];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__SUUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_265402670;
  id v15 = v10;
  id v16 = a1;
  id v14 = v7;
  id v11 = v10;
  id v12 = v7;
  [v9 enumerateColumnsForHeader:v8 usingBlock:v13];
}

void __83__SUUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(void *a1, void *a2, void *a3)
{
  double v5 = (void *)a1[6];
  uint64_t v6 = a1[4];
  id v7 = a3;
  id v8 = a2;
  id v12 = [v5 _attributedStringForLabel:v7 context:v6];
  double v9 = (void *)a1[5];
  [v8 width];
  double v11 = v10;

  [v9 requestLayoutForLabel:v7 attributedString:v12 width:(uint64_t)v11];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  v22 = "";
  uint64_t v21 = 0x3010000000;
  uint64_t v24 = *(void *)(MEMORY[0x263F001B0] + 8);
  double v23 = a3;
  double v9 = [v8 aggregateValueForKey:0x2704FCC90];
  double v10 = [v8 labelLayoutCache];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__SUUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v16[3] = &unk_265402698;
  id v11 = v10;
  id v17 = v11;
  v18 = &v19;
  [v9 enumerateColumnsForHeader:v7 usingBlock:v16];
  double v12 = v20[4];
  double v13 = v20[5] + 6.0;
  v20[5] = v13;

  _Block_object_dispose(&v19, 8);
  double v14 = v12;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

void __79__SUUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
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
  uint64_t v9 = [v8 aggregateValueForKey:0x2704FCC90];
  columnData = self->_columnData;
  self->_columnData = v9;

  [(NSMutableDictionary *)self->_columnViews removeAllObjects];
  id v11 = [v7 style];
  double v12 = [v11 ikBorderColor];
  double v13 = [v12 color];

  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  }
  double v15 = v14;
  [(UIView *)self->_bottomSeparatorView setBackgroundColor:v14];
  [(UIView *)self->_topSeparatorView setBackgroundColor:v15];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v18[3] = &unk_2654026E8;
  v18[4] = self;
  id v19 = v7;
  id v20 = v8;
  id v16 = v8;
  id v17 = v7;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v18];
}

void __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = *(void **)(*(void *)(a1 + 32) + 824);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2654026C0;
  id v10 = v3;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v5 enumerateColumnsForHeader:v4 usingBlock:v9];
}

void __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = (objc_class *)NSNumber;
  id v8 = a3;
  id v9 = a2;
  id v14 = (id)[[v7 alloc] initWithUnsignedInteger:a4];
  id v10 = (void *)a1[4];
  [v9 width];
  double v12 = v11;

  double v13 = [v10 addLabelViewWithElement:v8 width:a1[5] context:v12];

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
  v35.super_class = (Class)SUUITracklistHeaderCollectionViewCell;
  [(SUUICollectionViewCell *)&v35 layoutSubviews];
  id v3 = [(SUUITracklistHeaderCollectionViewCell *)self contentView];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(SUUITracklistColumnData *)self->_columnData interColumnSpacing];
  uint64_t v13 = v12;
  id v14 = [(SUUITracklistHeaderCollectionViewCell *)self contentView];
  uint64_t v15 = [v14 effectiveUserInterfaceLayoutDirection];

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  uint64_t v34 = 0;
  [(SUUITracklistColumnData *)self->_columnData leftEdgeInset];
  uint64_t v34 = v16;
  id v17 = [(SUUITracklistColumnData *)self->_columnData columns];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  double v23 = __55__SUUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke;
  uint64_t v24 = &unk_265402710;
  uint64_t v27 = v5;
  uint64_t v28 = v7;
  double v29 = v9;
  double v30 = v11;
  v25 = self;
  v26 = v33;
  BOOL v32 = v15 == 1;
  uint64_t v31 = v13;
  [v17 enumerateObjectsUsingBlock:&v21];

  v18 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", v21, v22, v23, v24);
  [v18 scale];
  double v20 = 1.0 / v19;

  -[UIView setFrame:](self->_bottomSeparatorView, "setFrame:", 0.0, v11 - v20, v9, v20);
  -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, v9, v20);
  _Block_object_dispose(v33, 8);
}

void __55__SUUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
        double v14 = *MEMORY[0x263F001A8];
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
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v9 = [v6 clientContext];
    uint64_t v10 = SUUIUserInterfaceIdiom(v9);

    double v11 = 10.0;
    if (v10 == 1) {
      double v11 = 11.0;
    }
    double v8 = [MEMORY[0x263F81708] systemFontOfSize:v11];
  }
  double v12 = [v6 tintColor];
  float v13 = SUUIViewElementPlainColorWithStyle(v7, v12);

  if (!v13)
  {
    float v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
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

@end