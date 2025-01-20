@interface SKUIMenuBarTemplateShelfPageSectionConfiguration
- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5;
- (SKUIMenuBarTemplateShelfPageSectionConfiguration)init;
- (SKUIMenuBarTemplateShelfPageSectionConfiguration)initWithNumberOfIterations:(unint64_t)a3;
- (id)_focusedViewElement;
- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4;
- (id)effectiveViewElementForShelfItemViewElement:(id)a3;
- (int64_t)numberOfSectionCells;
- (unint64_t)numberOfIterations;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)registerReusableClassesForCollectionView:(id)a3;
- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation SKUIMenuBarTemplateShelfPageSectionConfiguration

- (SKUIMenuBarTemplateShelfPageSectionConfiguration)init
{
  return [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self initWithNumberOfIterations:1];
}

- (SKUIMenuBarTemplateShelfPageSectionConfiguration)initWithNumberOfIterations:(unint64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  result = [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)&v7 init];
  if (result)
  {
    if (a3 <= 1) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = a3;
    }
    result->_numberOfIterations = v6;
  }
  return result;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  v7[0] = 0;
  v7[1] = 0;
  uint64_t v8 = 0;
  id v3 = a3;
  SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(v3, (uint64_t)v7);
  v4 = [v3 children];

  v5 = [v4 objectAtIndex:v8];

  return v5;
}

- (unint64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (int64_t)numberOfSectionCells
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  return [(SKUIShelfPageSectionConfiguration *)&v3 numberOfSectionCells] + 1;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 item] + 1;
  if (v8 == [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self numberOfSectionCells])
  {
    v9 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
    v10 = [v9 collectionView];
    v11 = [v10 dequeueReusableCellWithReuseIdentifier:0x1F1C8A188 forIndexPath:v7];

    v12 = [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
    v13 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v13 activePageWidth];
    double v15 = v14;
    v16 = [(SKUIShelfPageSectionConfiguration *)self cellLayoutContext];
    [v11 reloadWithViewElement:v12 width:v16 context:v15];

    id fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
    self->_id fixedElementsCollectionViewCell = v11;

    v18 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
    v18 = [(SKUIShelfPageSectionConfiguration *)&v20 cellForShelfViewElement:v6 indexPath:v7];
  }

  return v18;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 item] + 1;
  if (v10 == [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self numberOfSectionCells])
  {
    v11 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v11 activePageWidth];
    double v13 = v12;

    double v14 = [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
    double v15 = [(SKUIShelfPageSectionConfiguration *)self cellLayoutContext];
    +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell sizeThatFitsWidth:v14 viewElement:v15 context:v13];
    double v17 = v16;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
    [(SKUIShelfPageSectionConfiguration *)&v25 cellSizeForShelfViewElement:v8 indexPath:v9 numberOfShelfItems:a5];
    double v13 = v18;
    double v17 = v19;
    if ([(SKUIShelfPageSectionConfiguration *)self wantsZoomingShelfLayout])
    {
      [(SKUIShelfPageSectionConfiguration *)self zoomingShelfLayoutScaledItemWidth];
      double v21 = v20;
      [(SKUIShelfPageSectionConfiguration *)self zoomingShelfLayoutItemWidth];
      double v17 = v17 - (v21 - v22);
    }
  }

  double v23 = v13;
  double v24 = v17;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  [(SKUIShelfPageSectionConfiguration *)&v8 collectionViewWillApplyLayoutAttributes:v4];
  v5 = [v4 indexPath];
  uint64_t v6 = [v5 item] + 1;
  int64_t v7 = [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self numberOfSectionCells];

  if (v6 == v7) {
    [v4 setZIndex:1];
  }
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  id v3 = a3;
  [(SKUIShelfPageSectionConfiguration *)&v4 registerReusableClassesForCollectionView:v3];
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1F1C8A188, v4.receiver, v4.super_class);
}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  BOOL v6 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  [(SKUIShelfPageSectionConfiguration *)&v16 reloadShelfLayoutDataForShelfViewElement:a3 withShelfItemViewElements:a4 requestCellLayouts:a5 numberOfShelfItems:a6];
  if (v6)
  {
    objc_super v8 = [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
    id v9 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v9 activePageWidth];
    double v11 = v10;
    double v12 = [(SKUIShelfPageSectionConfiguration *)self cellLayoutContext];
    +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:v8 width:v12 context:v11];

    double v13 = [(SKUIShelfPageSectionConfiguration *)self cellLayoutContext];
    double v14 = [v13 labelLayoutCache];
    double v15 = [v14 layoutCache];
    [v15 commitLayoutRequests];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SKUIMenuBarTemplateShelfPageSectionConfiguration;
  [(SKUIShelfPageSectionConfiguration *)&v22 scrollViewDidScroll:v4];
  if ([(SKUIShelfPageSectionConfiguration *)self wantsZoomingShelfLayout])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 collectionViewLayout];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [v5 menuBarFocusedItemIndexPathWithTransitionProgress:0];
        int64_t focusedIndex = self->_focusedIndex;
        if (focusedIndex != [v6 item])
        {
          self->_int64_t focusedIndex = [v6 item];
          objc_super v8 = [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
          id v9 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
          [v9 activePageWidth];
          double v11 = v10;
          double v12 = [(SKUIShelfPageSectionConfiguration *)self cellLayoutContext];
          +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:v8 width:v12 context:v11];

          double v13 = [(SKUIShelfPageSectionConfiguration *)self cellLayoutContext];
          double v14 = [v13 labelLayoutCache];
          double v15 = [v14 layoutCache];
          [v15 commitLayoutRequests];

          id fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
          double v17 = [(SKUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
          double v18 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
          [v18 activePageWidth];
          double v20 = v19;
          double v21 = [(SKUIShelfPageSectionConfiguration *)self cellLayoutContext];
          [fixedElementsCollectionViewCell reloadWithViewElement:v17 width:v21 context:v20];
        }
      }
    }
  }
}

- (id)_focusedViewElement
{
  id v3 = [(SKUIShelfPageSectionConfiguration *)self dataSource];
  id v4 = [v3 shelfPageSectionConfiguration:self viewElementAtIndex:self->_focusedIndex];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(v4, (uint64_t)&v8);
  v5 = [v4 children];
  BOOL v6 = [v5 objectAtIndex:v9];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)initWithNumberOfIterations:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:]";
}

@end