@interface PRWidgetSuggestionsView
- (PRWidgetSuggestionsView)initWithLayoutDelegate:(id)a3 usingSidebarLayout:(BOOL)a4;
- (UICollectionView)collectionView;
- (id)_makeLayout;
- (void)layoutSubviews;
@end

@implementation PRWidgetSuggestionsView

- (PRWidgetSuggestionsView)initWithLayoutDelegate:(id)a3 usingSidebarLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PRWidgetSuggestionsView;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = -[PRWidgetSuggestionsView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (v4)
    {
      v13 = [PRSidebarWidgetSuggestionsCollectionViewLayout alloc];
      v14 = [(PRWidgetSuggestionsView *)v12 traitCollection];
      [v14 displayScale];
      v15 = -[PRSidebarWidgetSuggestionsCollectionViewLayout initWithDisplayScale:](v13, "initWithDisplayScale:");

      [(PRSidebarWidgetSuggestionsCollectionViewLayout *)v15 setLayoutDelegate:v6];
    }
    else
    {
      v15 = [(PRWidgetSuggestionsView *)v11 _makeLayout];
    }
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v15, v7, v8, v9, v10);
    collectionView = v12->_collectionView;
    v12->_collectionView = (UICollectionView *)v16;

    v18 = v12->_collectionView;
    v19 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v18 setBackgroundColor:v19];

    [(UICollectionView *)v12->_collectionView setShowsVerticalScrollIndicator:0];
    [(PRWidgetSuggestionsView *)v12 addSubview:v12->_collectionView];
  }
  return v12;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PRWidgetSuggestionsView;
  [(PRWidgetSuggestionsView *)&v4 layoutSubviews];
  collectionView = self->_collectionView;
  [(PRWidgetSuggestionsView *)self bounds];
  -[UICollectionView setFrame:](collectionView, "setFrame:");
}

- (id)_makeLayout
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1588]);
  [v2 setInterSectionSpacing:20.0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSectionProvider:&__block_literal_global_22 configuration:v2];

  return v3;
}

id __38__PRWidgetSuggestionsView__makeLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB1338];
  objc_super v4 = (void *)MEMORY[0x1E4FB1308];
  id v5 = a3;
  id v6 = [v4 estimatedDimension:60.0];
  double v7 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
  double v8 = [v3 sizeWithWidthDimension:v6 heightDimension:v7];

  double v9 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v8];
  double v10 = (void *)MEMORY[0x1E4FB1338];
  v11 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v12 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
  v13 = [v10 sizeWithWidthDimension:v11 heightDimension:v12];

  v14 = (void *)MEMORY[0x1E4FB1318];
  v36[0] = v9;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  uint64_t v16 = [v14 horizontalGroupWithLayoutSize:v13 subitems:v15];

  [MEMORY[0x1E4F5E4A8] interComplicationSpacingExcludingInnerInset];
  v17 = objc_msgSend(MEMORY[0x1E4FB1340], "fixedSpacing:");
  [v16 setInterItemSpacing:v17];

  v18 = [MEMORY[0x1E4FB1330] sectionWithGroup:v16];
  [v18 setInterGroupSpacing:16.0];
  [v18 setOrthogonalScrollingBehavior:0];
  [MEMORY[0x1E4F5E4A8] gridUnitSize];
  double v20 = v19;
  [MEMORY[0x1E4F5E4A8] complicationEdgeInset];
  double v22 = v20 + v21 * 2.0;
  [MEMORY[0x1E4F5E4A8] interComplicationSpacingExcludingInnerInset];
  double v24 = v22 * 4.0 + v23 * 3.0;
  double v25 = v22 * 3.0 + v23 + v23;
  v26 = [v5 container];

  [v26 contentSize];
  double v28 = v27;
  double v30 = v29;

  v31 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v31 scale];
  double v33 = 1.0 / v32;

  double v34 = (v30 - v25) * 0.5;
  if (v34 < 0.0) {
    double v34 = 0.0;
  }
  objc_msgSend(v18, "setContentInsets:", v34, (v28 - v24) * 0.5 - v33, 0.0, (v28 - v24) * 0.5 - v33);

  return v18;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
}

@end