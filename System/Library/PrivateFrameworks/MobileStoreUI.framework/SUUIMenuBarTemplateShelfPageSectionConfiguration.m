@interface SUUIMenuBarTemplateShelfPageSectionConfiguration
- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5;
- (SUUIMenuBarTemplateShelfPageSectionConfiguration)init;
- (SUUIMenuBarTemplateShelfPageSectionConfiguration)initWithNumberOfIterations:(unint64_t)a3;
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

@implementation SUUIMenuBarTemplateShelfPageSectionConfiguration

- (SUUIMenuBarTemplateShelfPageSectionConfiguration)init
{
  return [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self initWithNumberOfIterations:1];
}

- (SUUIMenuBarTemplateShelfPageSectionConfiguration)initWithNumberOfIterations:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  result = [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)&v6 init];
  if (result)
  {
    if (a3 <= 1) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = a3;
    }
    result->_numberOfIterations = v5;
  }
  return result;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  id v5 = a3;
  v10[0] = 0;
  v10[1] = 0;
  uint64_t v11 = 0;
  SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(v5, (uint64_t)v10);
  if (!LOBYTE(v10[0]))
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SUUIMenuBarTemplateShelfPageSectionConfiguration.m" lineNumber:44 description:@"All shelf items vended by the shelf page section need to be valid."];
  }
  objc_super v6 = [v5 children];
  v7 = [v6 objectAtIndex:v11];

  return v7;
}

- (unint64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (int64_t)numberOfSectionCells
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  return [(SUUIShelfPageSectionConfiguration *)&v3 numberOfSectionCells] + 1;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 item] + 1;
  if (v8 == [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self numberOfSectionCells])
  {
    v9 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
    v10 = [v9 collectionView];
    uint64_t v11 = [v10 dequeueReusableCellWithReuseIdentifier:0x270505B70 forIndexPath:v7];

    v12 = [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
    v13 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v13 activePageWidth];
    double v15 = v14;
    v16 = [(SUUIShelfPageSectionConfiguration *)self cellLayoutContext];
    [v11 reloadWithViewElement:v12 width:v16 context:v15];

    id fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
    self->_id fixedElementsCollectionViewCell = v11;

    v18 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
    v18 = [(SUUIShelfPageSectionConfiguration *)&v20 cellForShelfViewElement:v6 indexPath:v7];
  }

  return v18;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 item] + 1;
  if (v10 == [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self numberOfSectionCells])
  {
    uint64_t v11 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v11 activePageWidth];
    double v13 = v12;

    double v14 = [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
    double v15 = [(SUUIShelfPageSectionConfiguration *)self cellLayoutContext];
    +[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell sizeThatFitsWidth:v14 viewElement:v15 context:v13];
    double v17 = v16;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
    [(SUUIShelfPageSectionConfiguration *)&v25 cellSizeForShelfViewElement:v8 indexPath:v9 numberOfShelfItems:a5];
    double v13 = v18;
    double v17 = v19;
    if ([(SUUIShelfPageSectionConfiguration *)self wantsZoomingShelfLayout])
    {
      [(SUUIShelfPageSectionConfiguration *)self zoomingShelfLayoutScaledItemWidth];
      double v21 = v20;
      [(SUUIShelfPageSectionConfiguration *)self zoomingShelfLayoutItemWidth];
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
  v8.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  [(SUUIShelfPageSectionConfiguration *)&v8 collectionViewWillApplyLayoutAttributes:v4];
  id v5 = [v4 indexPath];
  uint64_t v6 = [v5 item] + 1;
  int64_t v7 = [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self numberOfSectionCells];

  if (v6 == v7) {
    [v4 setZIndex:1];
  }
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  id v3 = a3;
  [(SUUIShelfPageSectionConfiguration *)&v4 registerReusableClassesForCollectionView:v3];
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x270505B70, v4.receiver, v4.super_class);
}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  BOOL v6 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  [(SUUIShelfPageSectionConfiguration *)&v16 reloadShelfLayoutDataForShelfViewElement:a3 withShelfItemViewElements:a4 requestCellLayouts:a5 numberOfShelfItems:a6];
  if (v6)
  {
    objc_super v8 = [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
    id v9 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v9 activePageWidth];
    double v11 = v10;
    double v12 = [(SUUIShelfPageSectionConfiguration *)self cellLayoutContext];
    +[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:v8 width:v12 context:v11];

    double v13 = [(SUUIShelfPageSectionConfiguration *)self cellLayoutContext];
    double v14 = [v13 labelLayoutCache];
    double v15 = [v14 layoutCache];
    [v15 commitLayoutRequests];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  [(SUUIShelfPageSectionConfiguration *)&v22 scrollViewDidScroll:v4];
  if ([(SUUIShelfPageSectionConfiguration *)self wantsZoomingShelfLayout])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 collectionViewLayout];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [v5 menuBarFocusedItemIndexPathWithTransitionProgress:0];
        int64_t focusedIndex = self->_focusedIndex;
        if (focusedIndex != [v6 item])
        {
          self->_int64_t focusedIndex = [v6 item];
          objc_super v8 = [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
          id v9 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
          [v9 activePageWidth];
          double v11 = v10;
          double v12 = [(SUUIShelfPageSectionConfiguration *)self cellLayoutContext];
          +[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:v8 width:v12 context:v11];

          double v13 = [(SUUIShelfPageSectionConfiguration *)self cellLayoutContext];
          double v14 = [v13 labelLayoutCache];
          double v15 = [v14 layoutCache];
          [v15 commitLayoutRequests];

          id fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
          double v17 = [(SUUIMenuBarTemplateShelfPageSectionConfiguration *)self _focusedViewElement];
          double v18 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
          [v18 activePageWidth];
          double v20 = v19;
          double v21 = [(SUUIShelfPageSectionConfiguration *)self cellLayoutContext];
          [fixedElementsCollectionViewCell reloadWithViewElement:v17 width:v21 context:v20];
        }
      }
    }
  }
}

- (id)_focusedViewElement
{
  id v4 = [(SUUIShelfPageSectionConfiguration *)self dataSource];
  id v5 = [v4 shelfPageSectionConfiguration:self viewElementAtIndex:self->_focusedIndex];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(v5, (uint64_t)&v10);
  if (!(_BYTE)v10)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SUUIMenuBarTemplateShelfPageSectionConfiguration.m" lineNumber:133 description:@"All shelf items vended by the shelf page section need to be valid."];
  }
  BOOL v6 = [v5 children];
  int64_t v7 = [v6 objectAtIndex:v11];

  return v7;
}

- (void).cxx_destruct
{
}

@end