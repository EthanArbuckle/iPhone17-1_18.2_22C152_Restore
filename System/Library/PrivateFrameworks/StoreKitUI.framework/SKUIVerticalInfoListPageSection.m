@interface SKUIVerticalInfoListPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIVerticalInfoListPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)_contentInsetForIndexPath:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)_reloadColumnDataIfNecessary;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)_numberOfColumnsForWidth:(double)a3;
- (int64_t)numberOfCells;
- (void)_enumerateVisibleIndexPathsUsingBlock:(id)a3;
- (void)_requestCellLayout;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIVerticalInfoListPageSection

- (SKUIVerticalInfoListPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIVerticalInfoListPageSection initWithPageComponent:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIVerticalInfoListPageSection;
  v5 = [(SKUIStorePageSection *)&v11 initWithPageComponent:v4];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    columns = v5->_columns;
    v5->_columns = v6;

    uint64_t v8 = [v4 viewElement];
    infoList = v5->_infoList;
    v5->_infoList = (SKUIInfoListViewElement *)v8;
  }
  return v5;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SKUIStorePageSection *)self pageComponent];
  v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIInfoListViewElement *)self->_infoList style];
  v6 = [v5 ikBackgroundColor];
  id v7 = [v6 color];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUIVerticalInfoListPageSection;
    id v8 = [(SKUIStorePageSection *)&v11 backgroundColorForIndexPath:v4];
  }
  v9 = v8;

  return v9;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];

  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:0x1F1C9C9E8 forIndexPath:v4];
  [(SKUIVerticalInfoListPageSection *)self _contentInsetForIndexPath:v4];
  objc_msgSend(v7, "setContentInset:");
  id v8 = [(SKUIVerticalInfoListPageSection *)self _reloadColumnDataIfNecessary];
  uint64_t v9 = [v4 item];

  v10 = [v8 objectAtIndex:v9];
  [v7 reloadWithViewElements:v10 width:self->_cellLayoutContext context:self->_columnWidth];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIVerticalInfoListPageSection *)self _reloadColumnDataIfNecessary];
  double columnWidth = self->_columnWidth;
  double columnHeight = self->_columnHeight;
  [(SKUIVerticalInfoListPageSection *)self _contentInsetForIndexPath:v4];
  double v9 = v8;
  double v11 = v10;

  double v12 = columnWidth + v9 + v11;
  double v13 = columnHeight;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self pageComponent];
  v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self pageComponent];
  v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SKUIVerticalInfoListPageSection *)self _requestCellLayout];
  v8.receiver = self;
  v8.super_class = (Class)SKUIVerticalInfoListPageSection;
  [(SKUIStorePageSection *)&v8 entityProvider:v7 didInvalidateWithContext:v6];
}

- (int64_t)numberOfCells
{
  v2 = [(SKUIVerticalInfoListPageSection *)self _reloadColumnDataIfNecessary];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v10 = a3;
  id v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 collectionView];
  id v7 = [v6 cellForItemAtIndexPath:v10];

  if (v7)
  {
    objc_super v8 = [(SKUIVerticalInfoListPageSection *)self _reloadColumnDataIfNecessary];
    objc_super v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v10, "item"));
    [v7 reloadWithViewElements:v9 width:self->_cellLayoutContext context:self->_columnWidth];
  }
}

- (UIEdgeInsets)sectionContentInset
{
  v16.receiver = self;
  v16.super_class = (Class)SKUIVerticalInfoListPageSection;
  [(SKUIStorePageSection *)&v16 sectionContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(SKUIStorePageSection *)self isTopSection];
  double v12 = 12.0;
  if (!v11) {
    double v12 = v4;
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C9C9E8];
  double v6 = self->_cellLayoutContext;
  double v7 = [[SKUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  [(SKUIViewElementLayoutContext *)self->_cellLayoutContext setContainerViewElementType:[(SKUIInfoListViewElement *)self->_infoList elementType]];
  [(SKUIVerticalInfoListPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
  [(SKUIStorePageSection *)&v9 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  id v8 = a4;
  [(SKUIViewElementLayoutContext *)cellLayoutContext setActivePageWidth:width];
  [(SKUIVerticalInfoListPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SKUIVerticalInfoListPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKUIStorePageSection *)self context];
  objc_super v9 = [v8 collectionView];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SKUIVerticalInfoListPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_1E6429400;
  id v14 = v9;
  id v15 = v7;
  id v16 = v6;
  v17 = self;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  [(SKUIVerticalInfoListPageSection *)self _enumerateVisibleIndexPathsUsingBlock:v13];
}

void __63__SKUIVerticalInfoListPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) cellForItemAtIndexPath:a2];
  [v3 setImage:*(void *)(a1 + 40) forArtworkRequest:*(void *)(a1 + 48) context:*(void *)(*(void *)(a1 + 56) + 88)];
}

- (UIEdgeInsets)_contentInsetForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIVerticalInfoListPageSection *)self _reloadColumnDataIfNecessary];
  uint64_t v6 = [v4 item];

  uint64_t v7 = [v5 count];
  double v8 = 11.0;
  if (v6 == v7 - 1) {
    double v9 = 15.0;
  }
  else {
    double v9 = 11.0;
  }
  if (v6) {
    double v10 = 11.0;
  }
  else {
    double v10 = 15.0;
  }
  if (v6) {
    double v8 = v9;
  }
  if (v7 == 1) {
    double v11 = 15.0;
  }
  else {
    double v11 = v10;
  }
  if (v7 == 1) {
    double v12 = 15.0;
  }
  else {
    double v12 = v8;
  }

  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v11;
  double v16 = v12;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

- (void)_enumerateVisibleIndexPathsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self context];
  uint64_t v6 = [v5 collectionView];

  uint64_t v7 = [v6 indexPathsForVisibleItems];
  int64_t v8 = [(SKUIStorePageSection *)self sectionIndex];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SKUIVerticalInfoListPageSection__enumerateVisibleIndexPathsUsingBlock___block_invoke;
  v10[3] = &unk_1E6429428;
  id v11 = v4;
  int64_t v12 = v8;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __73__SKUIVerticalInfoListPageSection__enumerateVisibleIndexPathsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 section] == *(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)_numberOfColumnsForWidth:(double)a3
{
  double v3 = fmax(a3 / 160.0, 1.0);
  if (v3 > 3.0) {
    double v3 = 3.0;
  }
  unint64_t v4 = (uint64_t)v3;
  double v5 = [(SKUIViewElement *)self->_infoList flattenedChildren];
  unint64_t v6 = [v5 count];

  if (v6 >= v4) {
    return v4;
  }
  else {
    return v6;
  }
}

- (id)_reloadColumnDataIfNecessary
{
  if (![(NSMutableArray *)self->_columns count] && self->_numberOfColumns >= 1)
  {
    v26 = [(SKUIViewElement *)self->_infoList flattenedChildren];
    uint64_t v25 = [v26 count];
    double v3 = (double *)malloc_type_malloc(8 * self->_numberOfColumns, 0x100004000313F17uLL);
    bzero(v3, 8 * self->_numberOfColumns);
    int64_t numberOfColumns = self->_numberOfColumns;
    if (numberOfColumns >= 1)
    {
      for (int64_t i = 0; i < numberOfColumns; ++i)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(NSMutableArray *)self->_columns addObject:v6];

        int64_t numberOfColumns = self->_numberOfColumns;
      }
    }
    uint64_t v7 = v25 - 1;
    if (v25 >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        int64_t v9 = self->_numberOfColumns;
        if (v9 >= 2)
        {
          uint64_t v10 = v7;
          do
          {
            uint64_t v11 = v9--;
            if (v10 >= v8 && v25 >= v11)
            {
              while (v3[v9] < v3[v11 - 2])
              {
                int64_t v12 = [v26 objectAtIndex:v10];
                double v13 = [(NSMutableArray *)self->_columns objectAtIndex:v9];
                [v13 insertObject:v12 atIndex:0];

                +[SKUIVerticalInfoListCollectionViewCell sizeThatFitsWidth:v12 viewElement:self->_cellLayoutContext context:self->_columnWidth];
                v3[v9] = v3[v9] + v14;
                uint64_t v7 = v10 - 1;

                BOOL v15 = v10-- <= v8;
                if (v15) {
                  goto LABEL_17;
                }
              }
            }
            uint64_t v7 = v10;
LABEL_17:
            uint64_t v10 = v7;
          }
          while (v11 > 2);
        }
        if (v7 >= v8)
        {
          double v16 = [v26 objectAtIndex:v8];
          v17 = [(NSMutableArray *)self->_columns objectAtIndex:0];
          [v17 addObject:v16];

          +[SKUIVerticalInfoListCollectionViewCell sizeThatFitsWidth:v16 viewElement:self->_cellLayoutContext context:self->_columnWidth];
          *double v3 = *v3 + v18;
        }
        BOOL v15 = v8++ < v7;
      }
      while (v15);
      int64_t numberOfColumns = self->_numberOfColumns;
    }
    if (numberOfColumns >= 1)
    {
      int64_t v19 = 0;
      do
      {
        v20 = [(NSMutableArray *)self->_columns objectAtIndex:v19];
        uint64_t v21 = [v20 count];

        if (v21 <= 1)
        {
          double columnHeight = v3[v19];
        }
        else
        {
          double columnHeight = v3[v19] + (float)((float)(v21 - 1) * 13.0);
          v3[v19] = columnHeight;
        }
        if (self->_columnHeight >= columnHeight) {
          double columnHeight = self->_columnHeight;
        }
        self->_double columnHeight = columnHeight;
        ++v19;
      }
      while (v19 < self->_numberOfColumns);
    }
    free(v3);
  }
  columns = self->_columns;

  return columns;
}

- (void)_requestCellLayout
{
  double v3 = [(SKUIStorePageSection *)self context];
  [v3 activePageWidth];
  double v5 = v4;

  self->_double columnWidth = v5 + -30.0;
  int64_t v6 = [(SKUIVerticalInfoListPageSection *)self _numberOfColumnsForWidth:v5];
  self->_int64_t numberOfColumns = v6;
  if (v6 >= 2)
  {
    float v7 = (self->_columnWidth + (float)((float)(v6 - 1) * -22.0)) / (double)v6;
    self->_double columnWidth = floorf(v7);
  }
  infoList = self->_infoList;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SKUIVerticalInfoListPageSection__requestCellLayout__block_invoke;
  v9[3] = &unk_1E6423570;
  v9[4] = self;
  [(SKUIInfoListViewElement *)infoList enumerateChildrenUsingBlock:v9];
  self->_double columnHeight = -1.0;
  [(NSMutableArray *)self->_columns removeAllObjects];
}

uint64_t __53__SKUIVerticalInfoListPageSection__requestCellLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SKUIVerticalInfoListCollectionViewCell requestLayoutForViewElement:a2 width:*(void *)(*(void *)(a1 + 32) + 88) context:*(double *)(*(void *)(a1 + 32) + 112)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoList, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIVerticalInfoListPageSection initWithPageComponent:]";
}

@end