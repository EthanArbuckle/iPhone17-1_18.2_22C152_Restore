@interface SUUIDynamicGridViewElementPageSection
- (BOOL)_updateShowsSectionHeaders;
- (BOOL)isEditing;
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIDynamicGridViewElementPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)pinningContentInsetForItemAtIndexPath:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)_dynamicGridViewElement;
- (id)_entityValueProviderForGlobalIndex:(int64_t)a3 sectionIndex:(int64_t *)a4;
- (id)_itemTemplateViewElementForEntityValueProvider:(id)a3;
- (id)_sectionTemplateViewElementForEntityValueProvider:(id)a3;
- (id)_templateViewElementsForType:(id)a3 mode:(id)a4;
- (id)_viewElementAtGlobalIndex:(int64_t)a3;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)gridViewElementPageSectionConfiguration:(id)a3 viewElementForIndexPath:(id)a4;
- (id)indexPathsForPinningItems;
- (id)relevantEntityProviders;
- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4;
- (int64_t)_entityGlobalIndexForGlobalIndex:(int64_t)a3 returningSection:(int64_t *)a4;
- (int64_t)_globalIndexForEntityGlobalIndex:(int64_t)a3;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)numberOfCells;
- (int64_t)pinningStyleForItemAtIndexPath:(id)a3;
- (void)_enumerateVisibleCellsUsingBlock:(id)a3;
- (void)_invalidateCellSizeCache;
- (void)_reloadEntityProperties;
- (void)_reloadViewElementProperties;
- (void)_reloadVisibleCellsAnimated:(BOOL)a3;
- (void)_resetLayoutProperties;
- (void)_setContext:(id)a3;
- (void)_updateStyleProperties;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidConfirmButtonElement:(id)a3 withClickInfo:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)deselectItemsAnimated:(BOOL)a3;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)gridViewElementPageSectionConfiguration:(id)a3 configurePosition:(int64_t *)a4 forItemAtIndexPath:(id)a5;
- (void)invalidateCachedLayoutInformation;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)reloadVisibleCellsWithReason:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIDynamicGridViewElementPageSection

- (SUUIDynamicGridViewElementPageSection)initWithPageComponent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  v3 = [(SUUIStorePageSection *)&v9 initWithPageComponent:a3];
  if (v3)
  {
    v4 = objc_alloc_init(SUUIMutableIntegerValue);
    reusableGlobalIndexIntegerValue = v3->_reusableGlobalIndexIntegerValue;
    v3->_reusableGlobalIndexIntegerValue = v4;

    v6 = objc_alloc_init(SUUIGridViewElementPageSectionConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = v6;

    [(SUUIGridViewElementPageSectionConfiguration *)v3->_configuration setDataSource:v3];
    [(SUUIDynamicGridViewElementPageSection *)v3 _reloadViewElementProperties];
  }
  return v3;
}

- (void)dealloc
{
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:0];
  sectionHeaderGlobalIndices = self->_sectionHeaderGlobalIndices;
  if (sectionHeaderGlobalIndices)
  {
    free(sectionHeaderGlobalIndices);
    self->_sectionHeaderGlobalIndices = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v4 dealloc];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  int64_t result = [(SUUIStorePageSection *)&v9 applyUpdateType:a3];
  if (result != 2)
  {
    int64_t v5 = result;
    BOOL v6 = [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration showsEditMode];
    int64_t v7 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper totalNumberOfEntities];
    [(SUUIDynamicGridViewElementPageSection *)self _reloadViewElementProperties];
    [(SUUIDynamicGridViewElementPageSection *)self _invalidateCellSizeCache];
    if (v6 == [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration showsEditMode]
      || v7 != [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper totalNumberOfEntities])
    {
      v8.receiver = self;
      v8.super_class = (Class)SUUIDynamicGridViewElementPageSection;
      return [(SUUIStorePageSection *)&v8 applyUpdateType:v5];
    }
    else
    {
      [(SUUIDynamicGridViewElementPageSection *)self _resetLayoutProperties];
      return 1;
    }
  }
  return result;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", [v4 item]);
  if (!v5
    || ([(SUUIGridViewElementPageSectionConfiguration *)self->_configuration backgroundColorForViewElement:v5], (BOOL v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)SUUIDynamicGridViewElementPageSection;
    BOOL v6 = [(SUUIStorePageSection *)&v8 backgroundColorForIndexPath:v4];
  }

  return v6;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", [v4 item]);
  if (v5)
  {
    [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration requestCellLayoutForViewElement:v5];
    BOOL v6 = [(SUUIViewElementLayoutContext *)self->_cellLayoutContext labelLayoutCache];
    int64_t v7 = [v6 layoutCache];
    [v7 commitLayoutRequests];

    objc_super v8 = [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration cellForViewElement:v5 indexPath:v4];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)_templateViewElementsForType:(id)a3 mode:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v7 = [a3 stringByAppendingString:a4];
  }
  else
  {
    id v7 = a3;
  }
  objc_super v8 = v7;
  objc_super v9 = [(NSMutableDictionary *)self->_templateViewElementsCache objectForKey:v7];
  if (!v9)
  {
    v10 = objc_msgSend(-[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement"), "templateDefinitionViewElementsForType:mode:", a3, a4);
    v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) contentViewElement];
          v18 = [v17 children];
          v19 = [v18 firstObject];

          [v11 addObject:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    templateViewElementsCache = self->_templateViewElementsCache;
    if (templateViewElementsCache)
    {
      v21 = (void *)[v11 copy];
      [(NSMutableDictionary *)templateViewElementsCache setObject:v21 forKey:v8];
    }
    else
    {
      v22 = (void *)MEMORY[0x263EFF9A0];
      v21 = (void *)[v11 copy];
      v23 = [v22 dictionaryWithObject:v21 forKey:v8];
      v24 = self->_templateViewElementsCache;
      self->_templateViewElementsCache = v23;
    }
    objc_super v9 = 0;
  }
  return v9;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v56 = [a3 item];
  id v4 = (double *)MEMORY[0x263F001B0];
  BOOL usesSizingEntityValueProvider = self->_usesSizingEntityValueProvider;
  self->_BOOL usesSizingEntityValueProvider = 1;
  reusableSizeCacheKey = self->_reusableSizeCacheKey;
  if (!reusableSizeCacheKey)
  {
    id v7 = objc_alloc_init(_SUUIDynamicGridSizeCacheKey);
    objc_super v8 = self->_reusableSizeCacheKey;
    self->_reusableSizeCacheKey = v7;

    reusableSizeCacheKey = self->_reusableSizeCacheKey;
  }
  double v9 = *v4;
  double v10 = v4[1];
  [(_SUUIDynamicGridSizeCacheKey *)reusableSizeCacheKey setPosition:0];
  if ([(SUUIGridViewElementPageSectionConfiguration *)self->_configuration numberOfColumns] == 1)
  {
    uint64_t v68 = 0x7FFFFFFFFFFFFFFFLL;
    [(SUUIDynamicGridViewElementPageSection *)self _entityGlobalIndexForGlobalIndex:v56 returningSection:&v68];
    v11 = &SUUITemplateDefinitionViewElementTypeSection;
    if (v68 == 0x7FFFFFFFFFFFFFFFLL) {
      v11 = &SUUITemplateDefinitionViewElementTypeItem;
    }
    uint64_t v12 = *v11;
    if (self->_editing) {
      uint64_t v13 = 0x2704FD8D0;
    }
    else {
      uint64_t v13 = 0;
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v14 = [(SUUIDynamicGridViewElementPageSection *)self _templateViewElementsForType:v12 mode:v13];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      BOOL v55 = usesSizingEntityValueProvider;
      char v17 = 0;
      char v59 = 1;
      v18 = &OBJC_IVAR___SUUIMediaPlayerInterface__observers;
      uint64_t v19 = *(void *)v65;
      double v20 = v10;
      double v21 = v9;
      uint64_t v57 = *(void *)v65;
      id v58 = v14;
      while (1)
      {
        uint64_t v22 = 0;
        uint64_t v61 = v16;
        do
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(v14);
          }
          v23 = *(void **)(*((void *)&v64 + 1) + 8 * v22);
          [(_SUUIDynamicGridSizeCacheKey *)self->_reusableSizeCacheKey setViewElement:v23];
          uint64_t v24 = v18[306];
          id v25 = (id)[*(id *)((char *)&self->super.super.isa + v24) objectForKey:self->_reusableSizeCacheKey];
          if (v25)
          {
            [v25 CGSizeValue];
            double v27 = v26;
            double v29 = v28;
            if ((v17 & 1) == 0) {
              goto LABEL_24;
            }
          }
          else
          {
            id v63 = [[SUUISizingEntityValueProvider alloc] initForViewElement:v23];
            objc_msgSend(v23, "setEntityValueProvider:");
            independentlySizedViewElement = self->_independentlySizedViewElement;
            v62 = independentlySizedViewElement;
            objc_storeStrong((id *)&self->_independentlySizedViewElement, v23);
            [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration requestCellLayoutForViewElement:v23];
            v32 = [(SUUIViewElementLayoutContext *)self->_cellLayoutContext labelLayoutCache];
            v33 = [v32 layoutCache];
            [v33 commitLayoutRequests];

            [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration cellSizeForViewElement:v23 indexPath:a3];
            double v27 = v34;
            double v29 = v35;
            objc_storeStrong((id *)&self->_independentlySizedViewElement, independentlySizedViewElement);
            v36 = *(Class *)((char *)&self->super.super.isa + v24);
            if (!v36)
            {
              v37 = (objc_class *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
              v38 = *(Class *)((char *)&self->super.super.isa + v24);
              *(Class *)((char *)&self->super.super.isa + v24) = v37;

              v36 = *(Class *)((char *)&self->super.super.isa + v24);
            }
            v39 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v27, v29);
            [v36 setObject:v39 forKey:self->_reusableSizeCacheKey];

            uint64_t v19 = v57;
            id v14 = v58;
            uint64_t v16 = v61;
            v18 = &OBJC_IVAR___SUUIMediaPlayerInterface__observers;
            if ((v17 & 1) == 0)
            {
LABEL_24:
              double v20 = v29;
              double v21 = v27;
              goto LABEL_25;
            }
          }
          double v26 = vabdd_f64(v29, v20);
          if (vabdd_f64(v27, v21) > 0.00000011920929 || v26 > 0.00000011920929) {
            char v59 = 0;
          }
LABEL_25:
          ++v22;
          char v17 = 1;
        }
        while (v16 != v22);
        uint64_t v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v69, 16, v26);
        if (!v16)
        {

          BOOL usesSizingEntityValueProvider = v55;
          if (v59) {
            goto LABEL_38;
          }
          goto LABEL_30;
        }
      }
    }
  }
LABEL_30:
  v40 = [(SUUIDynamicGridViewElementPageSection *)self _viewElementAtGlobalIndex:v56];
  if (v40)
  {
    [(_SUUIDynamicGridSizeCacheKey *)self->_reusableSizeCacheKey setViewElement:v40];
    v41 = [(NSMutableDictionary *)self->_sizeCacheKeyToCachedCellSize objectForKey:self->_reusableSizeCacheKey];
    v42 = v41;
    if (v41)
    {
      [v41 CGSizeValue];
      double v9 = v43;
      double v10 = v44;
    }
    else
    {
      [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration requestCellLayoutForViewElement:v40];
      v45 = [(SUUIViewElementLayoutContext *)self->_cellLayoutContext labelLayoutCache];
      v46 = [v45 layoutCache];
      [v46 commitLayoutRequests];

      [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration cellSizeForViewElement:v40 indexPath:a3];
      double v9 = v47;
      double v10 = v48;
      sizeCacheKeyToCachedCellSize = self->_sizeCacheKeyToCachedCellSize;
      if (!sizeCacheKeyToCachedCellSize)
      {
        v50 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
        v51 = self->_sizeCacheKeyToCachedCellSize;
        self->_sizeCacheKeyToCachedCellSize = v50;

        sizeCacheKeyToCachedCellSize = self->_sizeCacheKeyToCachedCellSize;
      }
      v52 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v9, v10);
      [(NSMutableDictionary *)sizeCacheKeyToCachedCellSize setObject:v52 forKey:self->_reusableSizeCacheKey];
    }
  }

  double v20 = v10;
  double v21 = v9;
LABEL_38:
  self->_BOOL usesSizingEntityValueProvider = usesSizingEntityValueProvider;
  double v53 = v21;
  double v54 = v20;
  result.height = v54;
  result.width = v53;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", [v4 item]);
  BOOL v6 = [v5 entityValueProvider];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F4B450]);
    objc_super v8 = [(SUUIStorePageSection *)self context];
    double v9 = [v8 clientContext];
    double v10 = [v9 _scriptAppContext];
    v11 = (void *)[v7 initWithAppContext:v10];

    if (v11)
    {
      [v11 setEntityValueProvider:v6];
      uint64_t v15 = @"entityValueProvider";
      v16[0] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
      v14[3] = &unk_265401368;
      v14[4] = self;
      [v5 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:v12 completionBlock:v14];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v13 collectionViewDidSelectItemAtIndexPath:v4];
}

void __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_265400980;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v4 = [v2 parentViewController];

  if (SUUIViewControllerIsVisible(v4))
  {
    v3 = [v4 transitionCoordinator];

    if (!v3) {
      [*(id *)(a1 + 32) deselectItemsAnimated:1];
    }
  }
}

- (void)collectionViewDidConfirmButtonElement:(id)a3 withClickInfo:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SUUIStorePageSection *)self context];
  uint64_t v12 = [v11 clientContext];
  objc_super v13 = [v12 _scriptAppContext];

  if (v13)
  {
    id v14 = -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", [v10 item]);
    uint64_t v15 = [v14 entityValueProvider];
    if (v15)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F4B450]) initWithAppContext:v13];
      char v17 = v16;
      if (v16)
      {
        [v16 setEntityValueProvider:v15];
        v18 = (void *)[v9 mutableCopy];
        [v18 setObject:v17 forKeyedSubscript:@"entityValueProvider"];
        uint64_t v19 = (void *)[v18 copy];
        [v8 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:v19 completionBlock:0];
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v20 collectionViewDidConfirmButtonElement:v8 withClickInfo:v9 forItemAtIndexPath:v10];
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  [(SUUIGridViewElementPageSectionConfiguration *)configuration collectionViewWillApplyLayoutAttributes:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v6 collectionViewWillApplyLayoutAttributes:v5];
}

- (void)deselectItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [(SUUIStorePageSection *)self context];
  objc_super v6 = [v5 collectionView];

  id v7 = [v6 indexPathsForSelectedItems];
  int64_t v8 = [(SUUIStorePageSection *)self sectionIndex];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v14 section] == v8) {
          [v6 deselectItemAtIndexPath:v14 animated:v3];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v15.receiver = self;
  v15.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v15 deselectItemsAnimated:v3];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6 = a4;
  if (self->_entityProvider == a3)
  {
    id v10 = v6;
    if (([v6 invalidateEverything] & 1) != 0
      || [v10 invalidateDataSourceCounts])
    {
      [(SUUIDynamicGridViewElementPageSection *)self _reloadEntityProperties];
      [(SUUIDynamicGridViewElementPageSection *)self _updateStyleProperties];
      id v7 = [(SUUIStorePageSection *)self context];
      int64_t v8 = [v7 collectionView];
      id v9 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
      [v8 reloadSections:v9];
    }
    else
    {
      [(CPLRUDictionary *)self->_globalIndexToTemplateViewElementCache removeAllObjects];
      [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper reloadData];
      [(SUUIDynamicGridViewElementPageSection *)self _reloadVisibleCellsAnimated:0];
    }
    id v6 = v10;
  }
}

- (id)indexPathsForPinningItems
{
  int64_t v3 = [(SUUIStorePageSection *)self sectionIndex];
  if (self->_numberOfSections)
  {
    int64_t v4 = v3;
    id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (self->_numberOfSections)
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = [MEMORY[0x263F088C8] indexPathForItem:self->_sectionHeaderGlobalIndices[v6] inSection:v4];
        [v5 addObject:v7];

        ++v6;
      }
      while (v6 < self->_numberOfSections);
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)invalidateCachedLayoutInformation
{
  [(SUUIDynamicGridViewElementPageSection *)self _invalidateCellSizeCache];
  v3.receiver = self;
  v3.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v3 invalidateCachedLayoutInformation];
}

- (int64_t)numberOfCells
{
  int64_t v3 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper totalNumberOfEntities];
  if (self->_showsSectionHeaders) {
    v3 += [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper numberOfSections];
  }
  return v3;
}

- (UIEdgeInsets)pinningContentInsetForItemAtIndexPath:(id)a3
{
  double v3 = *MEMORY[0x263F834E8];
  double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)pinningStyleForItemAtIndexPath:(id)a3
{
  double v4 = -[SUUIDynamicGridViewElementPageSection _entityValueProviderForGlobalIndex:sectionIndex:](self, "_entityValueProviderForGlobalIndex:sectionIndex:", [a3 item], 0);
  double v5 = [(SUUIDynamicGridViewElementPageSection *)self _sectionTemplateViewElementForEntityValueProvider:v4];
  double v6 = v5;
  if (v5)
  {
    int64_t v7 = 1;
    switch([v5 pinStyle])
    {
      case 1:
        int64_t v7 = 0;
        break;
      case 2:
        break;
      case 3:
        int64_t v7 = 2;
        break;
      case 4:
        int64_t v7 = 3;
        break;
      case 5:
        int64_t v7 = 4;
        break;
      default:
        goto LABEL_3;
    }
  }
  else
  {
LABEL_3:
    int64_t v7 = [(SUUIStorePageSection *)self defaultItemPinningStyle];
  }

  return v7;
}

- (id)relevantEntityProviders
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  double v3 = [(SUUIStorePageSection *)&v7 relevantEntityProviders];
  double v4 = v3;
  if (self->_entityProvider)
  {
    if (v3)
    {
      uint64_t v5 = objc_msgSend(v3, "setByAddingObject:");

      double v4 = (void *)v5;
    }
    else
    {
      double v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
    }
  }
  return v4;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v7 = a3;
  double v6 = -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", [v7 item]);
  if (v6) {
    [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration reloadCellWithIndexPath:v7 forViewElement:v6 reason:a4];
  }
}

- (void)reloadVisibleCellsWithReason:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v6 reloadVisibleCellsWithReason:a3];
  cellLayoutContext = self->_cellLayoutContext;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode"));
  [(SUUIViewElementLayoutContext *)cellLayoutContext setAggregateValue:v5 forKey:0x2705094F0];
}

- (UIEdgeInsets)sectionContentInset
{
  configuration = self->_configuration;
  v25.receiver = self;
  v25.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v25 sectionContentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(SUUIDynamicGridViewElementPageSection *)self _dynamicGridViewElement];
  -[SUUIGridViewElementPageSectionConfiguration sectionContentInsetAdjustedFromValue:forGridViewElement:](configuration, "sectionContentInsetAdjustedFromValue:forGridViewElement:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(SUUIStorePageSection *)self pageComponent];
  double v8 = [v7 viewElement];
  double v9 = [v8 indexBarEntryID];
  int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    if (self->_showsSectionHeaders)
    {
      if (self->_numberOfSections > a4)
      {
        unint64_t v11 = self->_sectionHeaderGlobalIndices[a4];
        uint64_t v12 = (void *)MEMORY[0x263F088C8];
        int64_t v13 = [(SUUIStorePageSection *)self sectionIndex];
        double v14 = v12;
        unint64_t v15 = v11;
LABEL_7:
        double v19 = [v14 indexPathForItem:v15 inSection:v13];
        goto LABEL_9;
      }
    }
    else if ([(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper numberOfSections] > a4)
    {
      uint64_t v16 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper rangeForSectionAtIndex:a4];
      double v17 = (void *)MEMORY[0x263F088C8];
      int64_t v18 = [(SUUIDynamicGridViewElementPageSection *)self _globalIndexForEntityGlobalIndex:v16];
      int64_t v13 = [(SUUIStorePageSection *)self sectionIndex];
      double v14 = v17;
      unint64_t v15 = v18;
      goto LABEL_7;
    }
  }
  double v19 = 0;
LABEL_9:
  return v19;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = [(SUUIStorePageSection *)self context];
  unint64_t v11 = [v10 collectionView];
  uint64_t v12 = [v11 cellForItemAtIndexPath:v8];

  int v13 = [v12 updateWithItemState:v9 context:self->_cellLayoutContext animated:v5];
  if (v13)
  {
    double v14 = -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", [v8 item]);
    if (v14) {
      [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration requestCellLayoutForViewElement:v14];
    }
  }
  return v13;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 collectionView];
  [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration registerReusableClassesForCollectionView:v5];
  id v6 = [SUUIViewElementTextLayoutCache alloc];
  double v7 = [v4 textLayoutCache];
  id v8 = [(SUUIViewElementTextLayoutCache *)v6 initWithLayoutCache:v7];
  labelLayoutCache = self->_labelLayoutCache;
  self->_labelLayoutCache = v8;

  cellLayoutContext = self->_cellLayoutContext;
  if (cellLayoutContext) {
    [(SUUIViewElementLayoutContext *)cellLayoutContext setArtworkRequestDelegate:0];
  }
  unint64_t v11 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4];
  uint64_t v12 = self->_cellLayoutContext;
  self->_cellLayoutContext = v11;

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  int v13 = self->_cellLayoutContext;
  double v14 = [v4 parentViewController];
  unint64_t v15 = [v14 clientContext];
  [(SUUIViewElementLayoutContext *)v13 setClientContext:v15];

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setLabelLayoutCache:self->_labelLayoutCache];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:MEMORY[0x263EFFA88] forKey:0x2705026F0];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:&unk_2705D0D30 forKey:0x270505AD0];
  uint64_t v16 = self->_cellLayoutContext;
  double v17 = [v4 parentViewController];
  [(SUUIViewElementLayoutContext *)v16 setParentViewController:v17];

  int64_t v18 = self->_cellLayoutContext;
  double v19 = [v4 resourceLoader];
  [(SUUIViewElementLayoutContext *)v18 setResourceLoader:v19];

  double v20 = self->_cellLayoutContext;
  double v21 = [v5 tintColor];
  [(SUUIViewElementLayoutContext *)v20 setTintColor:v21];

  double v22 = [(SUUIStorePageSection *)self pageComponent];
  double v23 = [v22 viewElement];

  -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", [v23 elementType]);
  [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration setCellLayoutContext:self->_cellLayoutContext];
  [(SUUIDynamicGridViewElementPageSection *)self _resetLayoutProperties];
  [(SUUIDynamicGridViewElementPageSection *)self _invalidateCellSizeCache];
  v24.receiver = self;
  v24.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  [(SUUIStorePageSection *)&v24 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  id v8 = a4;
  [(SUUIViewElementLayoutContext *)cellLayoutContext setActivePageWidth:width];
  [(SUUIDynamicGridViewElementPageSection *)self _resetLayoutProperties];
  [(SUUIDynamicGridViewElementPageSection *)self _invalidateCellSizeCache];
  v9.receiver = self;
  v9.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)_setContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  id v4 = a3;
  [(SUUIStorePageSection *)&v5 _setContext:v4];
  -[SUUIGridViewElementPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__SUUIDynamicGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke;
  v10[3] = &unk_2654038C0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(SUUIDynamicGridViewElementPageSection *)self _enumerateVisibleCellsUsingBlock:v10];
}

void __69__SUUIDynamicGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  objc_super v5 = objc_msgSend(*(id *)(a1 + 32), "_viewElementAtGlobalIndex:", objc_msgSend(a3, "item"));
  uint64_t v6 = [v5 elementType];
  BOOL v7 = (unint64_t)(v6 - 14) > 0x34 || ((1 << (v6 - 14)) & 0x10001C00000001) == 0;
  if ((!v7 || v6 == 152) && [v8 conformsToProtocol:&unk_2705ED578]) {
    [v8 setImage:*(void *)(a1 + 40) forArtworkRequest:*(void *)(a1 + 48) context:*(void *)(*(void *)(a1 + 32) + 88)];
  }
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(SUUIDynamicGridViewElementPageSection *)self _reloadVisibleCellsAnimated:a4];
  }
}

- (id)gridViewElementPageSectionConfiguration:(id)a3 viewElementForIndexPath:(id)a4
{
  independentlySizedViewElement = self->_independentlySizedViewElement;
  if (independentlySizedViewElement)
  {
    objc_super v5 = independentlySizedViewElement;
  }
  else
  {
    -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(a4, "item", a3));
    objc_super v5 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)gridViewElementPageSectionConfiguration:(id)a3 configurePosition:(int64_t *)a4 forItemAtIndexPath:(id)a5
{
  if (self->_showsSectionHeaders)
  {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v7 = -[SUUIDynamicGridViewElementPageSection _entityGlobalIndexForGlobalIndex:returningSection:](self, "_entityGlobalIndexForGlobalIndex:returningSection:", objc_msgSend(a5, "item", a3), &v14);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      if (![(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper getItem:&v13 section:&v12 forGlobalIndex:v7])return; {
      if (v13)
      }
      {
        uint64_t v8 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper rangeForSectionAtIndex:v12];
        if (v13 != v9 + v8 - 1) {
          return;
        }
        uint64_t v10 = 32;
      }
      else
      {
        uint64_t v10 = 8;
      }
      unint64_t v11 = *a4 & 0xFFFFFFFFFFFFFFC7 | v10;
    }
    else
    {
      unint64_t v11 = *a4 & 0xFFFFFFFFFFFFFFC7 | 0x10;
    }
    *a4 = v11;
  }
}

- (id)_dynamicGridViewElement
{
  v2 = [(SUUIStorePageSection *)self pageComponent];
  double v3 = [v2 viewElement];

  return v3;
}

- (int64_t)_entityGlobalIndexForGlobalIndex:(int64_t)a3 returningSection:(int64_t *)a4
{
  if (self->_showsSectionHeaders && (unint64_t numberOfSections = self->_numberOfSections) != 0)
  {
    int64_t v5 = 0;
    int64_t v6 = a3 - numberOfSections;
    while (1)
    {
      int64_t v7 = self->_sectionHeaderGlobalIndices[v5];
      if (v7 >= a3) {
        break;
      }
      if (numberOfSections == ++v5)
      {
        int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
        a3 = v6;
        if (a4) {
          goto LABEL_9;
        }
        return a3;
      }
    }
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v7 == a3) {
      int64_t v8 = v5;
    }
    a3 -= v5;
    if (a4) {
      goto LABEL_9;
    }
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4) {
LABEL_9:
    }
      *a4 = v8;
  }
  return a3;
}

- (id)_entityValueProviderForGlobalIndex:(int64_t)a3 sectionIndex:(int64_t *)a4
{
  int64_t v7 = [(SUUIMutableIntegerValue *)self->_reusableGlobalIndexIntegerValue integerValue];
  [(SUUIMutableIntegerValue *)self->_reusableGlobalIndexIntegerValue setIntegerValue:a3];
  int64_t v8 = [(CPLRUDictionary *)self->_globalIndexToEntityValueProviderValueCache objectForKey:self->_reusableGlobalIndexIntegerValue];
  int64_t v17 = 0;
  if (v8)
  {
    uint64_t v9 = v8;
    int64_t v17 = [(_SUUIDynamicGridEntityValueProviderValue *)v8 sectionIndex];
    uint64_t v10 = [(_SUUIDynamicGridEntityValueProviderValue *)v9 entityValueProvider];
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int64_t v12 = [(SUUIDynamicGridViewElementPageSection *)self _entityGlobalIndexForGlobalIndex:a3 returningSection:&v17];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper entityIndexPathForGlobalIndex:v12];
    if (v13)
    {
      uint64_t v10 = [(SUUIEntityProviding *)self->_entityProvider entityValueProviderAtIndexPath:v13];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else if (*(unsigned char *)&self->_entityProviderFlags)
  {
    uint64_t v10 = -[SUUIEntityProviding sectionEntityValueProviderAtIndex:](self->_entityProvider, "sectionEntityValueProviderAtIndex:");
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v9 = objc_alloc_init(_SUUIDynamicGridEntityValueProviderValue);
  [(_SUUIDynamicGridEntityValueProviderValue *)v9 setSectionIndex:v17];
  [(_SUUIDynamicGridEntityValueProviderValue *)v9 setEntityValueProvider:v10];
  globalIndexToEntityValueProviderValueCache = self->_globalIndexToEntityValueProviderValueCache;
  if (!globalIndexToEntityValueProviderValueCache)
  {
    unint64_t v15 = (CPLRUDictionary *)[objc_alloc(MEMORY[0x263F255B8]) initWithMaximumCapacity:50];
    uint64_t v16 = self->_globalIndexToEntityValueProviderValueCache;
    self->_globalIndexToEntityValueProviderValueCache = v15;

    globalIndexToEntityValueProviderValueCache = self->_globalIndexToEntityValueProviderValueCache;
  }
  [(CPLRUDictionary *)globalIndexToEntityValueProviderValueCache setObject:v9 forKey:self->_reusableGlobalIndexIntegerValue];
  if (a4) {
LABEL_3:
  }
    *a4 = v17;
LABEL_4:
  [(SUUIMutableIntegerValue *)self->_reusableGlobalIndexIntegerValue setIntegerValue:v7];

  return v10;
}

- (void)_enumerateVisibleCellsUsingBlock:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SUUIStorePageSection *)self context];
  int64_t v6 = [v5 collectionView];

  int64_t v7 = [v6 visibleCells];
  int64_t v8 = [(SUUIStorePageSection *)self sectionIndex];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__SUUIDynamicGridViewElementPageSection__enumerateVisibleCellsUsingBlock___block_invoke;
  v11[3] = &unk_2654038E8;
  id v13 = v4;
  int64_t v14 = v8;
  id v12 = v6;
  id v9 = v4;
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:v11];
}

void __74__SUUIDynamicGridViewElementPageSection__enumerateVisibleCellsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:");
  id v4 = v3;
  if (v3 && [v3 section] == *(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (int64_t)_globalIndexForEntityGlobalIndex:(int64_t)a3
{
  if (!self->_showsSectionHeaders) {
    return a3;
  }
  unint64_t numberOfSections = self->_numberOfSections;
  if (!numberOfSections) {
    return a3;
  }
  sectionHeaderGlobalIndices = self->_sectionHeaderGlobalIndices;
  int64_t result = a3;
  do
  {
    int64_t v6 = *sectionHeaderGlobalIndices++;
    if (v6 <= a3) {
      ++result;
    }
    --numberOfSections;
  }
  while (numberOfSections);
  return result;
}

- (void)_invalidateCellSizeCache
{
}

- (id)_itemTemplateViewElementForEntityValueProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIDynamicGridViewElementPageSection *)self _dynamicGridViewElement];
  int64_t v6 = v5;
  if (self->_editing) {
    uint64_t v7 = 0x2704FD8D0;
  }
  else {
    uint64_t v7 = 0;
  }
  int64_t v8 = [v5 templateDefinitionViewElementsForType:0x2704F9F70 mode:v7];
  id v9 = [v6 bestTemplateDefinitionViewElementFromTemplateDefinitionViewElements:v8 entityValueProvider:v4];

  id v10 = [v9 contentViewElement];
  unint64_t v11 = [v10 children];
  id v12 = [v11 firstObject];

  return v12;
}

- (void)_reloadEntityProperties
{
  [(CPLRUDictionary *)self->_globalIndexToEntityValueProviderValueCache removeAllObjects];
  [(CPLRUDictionary *)self->_globalIndexToTemplateViewElementCache removeAllObjects];
  [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper reloadData];
  [(SUUIDynamicGridViewElementPageSection *)self _updateShowsSectionHeaders];
  sectionHeaderGlobalIndices = self->_sectionHeaderGlobalIndices;
  if (sectionHeaderGlobalIndices)
  {
    free(sectionHeaderGlobalIndices);
    self->_sectionHeaderGlobalIndices = 0;
  }
  if (self->_showsSectionHeaders)
  {
    int64_t v4 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper numberOfSections];
    self->_sectionHeaderGlobalIndices = (unint64_t *)malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
    if (v4 >= 1)
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        self->_sectionHeaderGlobalIndices[v5] = v6;
        [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper rangeForSectionAtIndex:v5];
        v6 += v7 + 1;
        ++v5;
      }
      while (v4 != v5);
    }
    self->_unint64_t numberOfSections = v4;
  }
}

- (void)_reloadViewElementProperties
{
  [(NSMutableDictionary *)self->_templateViewElementsCache removeAllObjects];
  id v11 = [(SUUIDynamicGridViewElementPageSection *)self _dynamicGridViewElement];
  double v3 = [v11 explicitEntityProvider];
  entityProvider = self->_entityProvider;
  if (entityProvider == v3 || ([(SUUIEntityProviding *)entityProvider isEqual:v3] & 1) != 0)
  {
    int v5 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_entityProvider, v3);
    *(unsigned char *)&self->_entityProviderFlags = *(unsigned char *)&self->_entityProviderFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    if (!dynamicPageSectionIndexMapper)
    {
      uint64_t v7 = objc_alloc_init(SUUIDynamicPageSectionIndexMapper);
      int64_t v8 = self->_dynamicPageSectionIndexMapper;
      self->_dynamicPageSectionIndexMapper = v7;

      dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    }
    [(SUUIDynamicPageSectionIndexMapper *)dynamicPageSectionIndexMapper setEntityProvider:self->_entityProvider];
    int v5 = 1;
  }
  int64_t v9 = [v11 minimumEntityCountForSections];
  if (self->_minimumEntityCountForSections != v9)
  {
    self->_minimumEntityCountForSections = v9;
    -[SUUIGridViewElementPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", [v11 rendersWithPerspective]);
    goto LABEL_11;
  }
  -[SUUIGridViewElementPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", [v11 rendersWithPerspective]);
  if (v5) {
LABEL_11:
  }
    [(SUUIDynamicGridViewElementPageSection *)self _reloadEntityProperties];
  [(SUUIDynamicGridViewElementPageSection *)self _updateStyleProperties];
  id v10 = [v11 collectionFeature];
  [v10 setCollectionTarget:self];
}

- (void)_reloadVisibleCellsAnimated:(BOOL)a3
{
  int64_t v4 = [(SUUIViewElementLayoutContext *)self->_cellLayoutContext labelLayoutCache];
  int v5 = [v4 layoutCache];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__SUUIDynamicGridViewElementPageSection__reloadVisibleCellsAnimated___block_invoke;
  v7[3] = &unk_265407858;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(SUUIDynamicGridViewElementPageSection *)self _enumerateVisibleCellsUsingBlock:v7];
}

void __69__SUUIDynamicGridViewElementPageSection__reloadVisibleCellsAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 conformsToProtocol:&unk_2705ED578])
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_viewElementAtGlobalIndex:", objc_msgSend(v5, "item"));
    if (v6)
    {
      [*(id *)(*(void *)(a1 + 32) + 96) requestCellLayoutForViewElement:v6];
      [*(id *)(a1 + 40) commitLayoutRequests];
      [*(id *)(*(void *)(a1 + 32) + 96) configureCell:v7 forViewElement:v6 indexPath:v5];
    }
  }
}

- (void)_resetLayoutProperties
{
  configuration = self->_configuration;
  id v4 = [(SUUIStorePageSection *)self pageComponent];
  double v3 = [v4 viewElement];
  [(SUUIGridViewElementPageSectionConfiguration *)configuration updateLayoutPropertiesForGridViewElement:v3];
}

- (id)_sectionTemplateViewElementForEntityValueProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIDynamicGridViewElementPageSection *)self _dynamicGridViewElement];
  id v6 = v5;
  if (self->_editing) {
    uint64_t v7 = 0x2704FD8D0;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [v5 templateDefinitionViewElementsForType:0x2704FD8F0 mode:v7];
  int64_t v9 = [v6 bestTemplateDefinitionViewElementFromTemplateDefinitionViewElements:v8 entityValueProvider:v4];

  id v10 = [v9 contentViewElement];
  id v11 = [v10 children];
  id v12 = [v11 firstObject];

  return v12;
}

- (BOOL)_updateShowsSectionHeaders
{
  double v3 = [(SUUIDynamicGridViewElementPageSection *)self _dynamicGridViewElement];
  if ([v3 hasSectionHeaders]) {
    int v4 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper totalNumberOfEntities] >= self->_minimumEntityCountForSections;
  }
  else {
    int v4 = 0;
  }

  int showsSectionHeaders = self->_showsSectionHeaders;
  if (showsSectionHeaders != v4) {
    self->_int showsSectionHeaders = v4;
  }
  return showsSectionHeaders != v4;
}

- (void)_updateStyleProperties
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v3 = [(SUUIDynamicGridViewElementPageSection *)self _dynamicGridViewElement];
  int v4 = v3;
  if (self->_editing) {
    uint64_t v5 = 0x2704FD8D0;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [v3 templateDefinitionViewElementsForType:0x2704F9F70 mode:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) contentViewElement];
        id v13 = [v12 children];
        if ([v13 count])
        {
          if (!v9) {
            int64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
          }
          [v9 addObjectsFromArray:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }
  [(SUUIGridViewElementPageSectionConfiguration *)self->_configuration updateStylePropertiesForGridViewElement:v4 gridItemViewElements:v9 numberOfGridItems:[(SUUIDynamicGridViewElementPageSection *)self numberOfCells]];
}

- (id)_viewElementAtGlobalIndex:(int64_t)a3
{
  int64_t v5 = [(SUUIMutableIntegerValue *)self->_reusableGlobalIndexIntegerValue integerValue];
  [(SUUIMutableIntegerValue *)self->_reusableGlobalIndexIntegerValue setIntegerValue:a3];
  id v6 = [(CPLRUDictionary *)self->_globalIndexToTemplateViewElementCache objectForKey:self->_reusableGlobalIndexIntegerValue];
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = [(SUUIDynamicGridViewElementPageSection *)self _entityValueProviderForGlobalIndex:a3 sectionIndex:&v15];
  if (v6)
  {
    if (!self->_usesSizingEntityValueProvider) {
      goto LABEL_13;
    }
LABEL_11:
    id v11 = [[SUUISizingEntityValueProvider alloc] initForViewElement:v6];
    [v6 setEntityValueProvider:v11];

    goto LABEL_14;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    [(SUUIDynamicGridViewElementPageSection *)self _itemTemplateViewElementForEntityValueProvider:v7];
  }
  else {
  id v6 = [(SUUIDynamicGridViewElementPageSection *)self _sectionTemplateViewElementForEntityValueProvider:v7];
  }
  if (!v6) {
    goto LABEL_14;
  }
  globalIndexToTemplateViewElementCache = self->_globalIndexToTemplateViewElementCache;
  if (!globalIndexToTemplateViewElementCache)
  {
    int64_t v9 = (CPLRUDictionary *)[objc_alloc(MEMORY[0x263F255B8]) initWithMaximumCapacity:50];
    uint64_t v10 = self->_globalIndexToTemplateViewElementCache;
    self->_globalIndexToTemplateViewElementCache = v9;

    globalIndexToTemplateViewElementCache = self->_globalIndexToTemplateViewElementCache;
  }
  [(CPLRUDictionary *)globalIndexToTemplateViewElementCache setObject:v6 forKey:self->_reusableGlobalIndexIntegerValue];
  if (self->_usesSizingEntityValueProvider) {
    goto LABEL_11;
  }
  id v12 = [v6 entityValueProperties];
  id v13 = (id)[v7 valuesForEntityProperties:v12];

LABEL_13:
  [v6 setEntityValueProvider:v7];
LABEL_14:
  [(SUUIMutableIntegerValue *)self->_reusableGlobalIndexIntegerValue setIntegerValue:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateViewElementsCache, 0);
  objc_storeStrong((id *)&self->_sizeCacheKeyToCachedCellSize, 0);
  objc_storeStrong((id *)&self->_reusableGlobalIndexIntegerValue, 0);
  objc_storeStrong((id *)&self->_reusableSizeCacheKey, 0);
  objc_storeStrong((id *)&self->_labelLayoutCache, 0);
  objc_storeStrong((id *)&self->_independentlySizedViewElement, 0);
  objc_storeStrong((id *)&self->_globalIndexToTemplateViewElementCache, 0);
  objc_storeStrong((id *)&self->_globalIndexToEntityValueProviderValueCache, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end