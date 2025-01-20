@interface SKUIStorePageSplitCollectionViewLayout
- (BOOL)rendersWithParallax;
- (BOOL)rendersWithPerspective;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGRect)_frameForLayout:(id)a3 offset:(CGPoint)a4 relativeToEdges:(unint64_t)a5 fromSiblingLayout:(id)a6;
- (NSArray)indexPathsForGradientItems;
- (NSArray)indexPathsForPinningItems;
- (NSString)backdropGroupName;
- (SKUIStorePageSplitCollectionViewLayout)init;
- (id)_newStorePageCollectionViewLayout;
- (id)layoutAttributesForUnpinnedItemAtIndexPath:(id)a3;
- (id)pinnedLayoutAttributesForItemsInRect:(CGRect)a3;
- (id)sublayouts;
- (void)_createSectionsToIndexRangesMapTableIfNeededForSublayout:(id)a3;
- (void)addSublayout:(id)a3 forElementKinds:(id)a4;
- (void)addSublayout:(id)a3 forItems:(id)a4 inSection:(int64_t)a5 offset:(CGPoint)a6 relativeToEdges:(unint64_t)a7 fromSiblingLayout:(id)a8;
- (void)addSublayout:(id)a3 forSections:(id)a4 offset:(CGPoint)a5 relativeToEdges:(unint64_t)a6 fromSiblingLayout:(id)a7;
- (void)addSublayoutsUsingSplitsDescription:(id)a3;
- (void)init;
- (void)removeSublayout:(id)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setIndexPathsForGradientItems:(id)a3;
- (void)setRendersWithParallax:(BOOL)a3;
- (void)setRendersWithPerspective:(BOOL)a3;
@end

@implementation SKUIStorePageSplitCollectionViewLayout

- (SKUIStorePageSplitCollectionViewLayout)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStorePageSplitCollectionViewLayout init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  v3 = [(_UICollectionViewCompositionLayout *)&v7 init];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedSublayouts = v3->_orderedSublayouts;
    v3->_orderedSublayouts = v4;

    [(SKUIStorePageSplitCollectionViewLayout *)v3 registerClass:objc_opt_class() forDecorationViewOfKind:0x1F1C95828];
    [(SKUIStorePageSplitCollectionViewLayout *)v3 registerClass:objc_opt_class() forDecorationViewOfKind:0x1F1C90208];
  }
  return v3;
}

- (void)addSublayoutsUsingSplitsDescription:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SKUIStorePageSplitCollectionViewLayout *)self sublayouts];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v4 numberOfSplits];
  if (v7 == [v6 count])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:0];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __78__SKUIStorePageSplitCollectionViewLayout_addSublayoutsUsingSplitsDescription___block_invoke;
    v48[3] = &unk_1E6429CD8;
    id v9 = v8;
    id v49 = v9;
    id v50 = v6;
    [v4 enumerateSplitsUsingBlock:v48];
  }
  else
  {
    id v9 = 0;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v10);
        }
        [(SKUIStorePageSplitCollectionViewLayout *)self removeSublayout:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [v4 topSplit];
  v16 = (double *)MEMORY[0x1E4F1DAD8];
  v40 = (void *)v15;
  if (v15)
  {
    v17 = (void *)v15;
    id v18 = [v9 objectForKey:v15];
    if (!v18) {
      id v18 = [(SKUIStorePageSplitCollectionViewLayout *)self _newStorePageCollectionViewLayout];
    }
    uint64_t v19 = [v17 numberOfPageSections];
    v20 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v19);
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v18, v20, 0, 0, *v16, v16[1]);

    id v43 = v18;
    uint64_t v21 = 4;
  }
  else
  {
    uint64_t v21 = 0;
    id v43 = 0;
    uint64_t v19 = 0;
  }
  v22 = [v4 leftSplit];
  id v42 = v9;
  if (v22)
  {
    id v23 = v4;
    id v24 = [v9 objectForKey:v22];
    if (!v24) {
      id v24 = [(SKUIStorePageSplitCollectionViewLayout *)self _newStorePageCollectionViewLayout];
    }
    uint64_t v25 = [v22 numberOfPageSections];
    v26 = [v22 sectionContext];
    [v26 activePageWidth];
    objc_msgSend(v24, "setOverrideContentWidth:");

    v27 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v19, v25);
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v24, v27, v21, v43, *v16, v16[1]);

    v19 += v25;
    id v28 = v24;

    uint64_t v21 = 8;
    v41 = v28;
    id v4 = v23;
    id v9 = v42;
  }
  else
  {
    v41 = 0;
    id v28 = v43;
  }
  v29 = [v4 rightSplit];
  if (v29)
  {
    id v39 = v4;
    id v30 = [v9 objectForKey:v29];
    if (!v30) {
      id v30 = [(SKUIStorePageSplitCollectionViewLayout *)self _newStorePageCollectionViewLayout];
    }
    uint64_t v31 = [v29 numberOfPageSections];
    v32 = [v29 sectionContext];
    [v32 activePageWidth];
    objc_msgSend(v30, "setOverrideContentWidth:");

    v33 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v19, v31);
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v30, v33, v21, v28, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    v19 += v31;
    id v34 = v41;

    id v28 = v34;
    id v4 = v39;
    id v9 = v42;
  }
  v35 = [v4 bottomSplit];
  if (v35)
  {
    id v36 = [v9 objectForKey:v35];
    if (!v36) {
      id v36 = [(SKUIStorePageSplitCollectionViewLayout *)self _newStorePageCollectionViewLayout];
    }
    uint64_t v37 = [v35 numberOfPageSections];
    v38 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v19, v37);
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v36, v38, 4, v28, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    id v9 = v42;
  }
}

void __78__SKUIStorePageSplitCollectionViewLayout_addSublayoutsUsingSplitsDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectAtIndex:a3];
  [v4 setObject:v7 forKey:v6];
}

- (NSArray)indexPathsForPinningItems
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SKUIStorePageSplitCollectionViewLayout *)self sublayouts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) indexPathsForPinningItems];
        if ([v8 count])
        {
          if (!v5)
          {
            v5 = [MEMORY[0x1E4F1CA48] array];
          }
          [v5 addObjectsFromArray:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)layoutAttributesForUnpinnedItemAtIndexPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 item];
  uint64_t v19 = [NSNumber numberWithInteger:v5];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(SKUIStorePageSplitCollectionViewLayout *)self sublayouts];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v18 = v4;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v13 = -[NSMapTable objectForKey:](self->_sublayoutToSectionsToIndexRanges, "objectForKey:", v12, v18);
        v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 objectForKey:v19];
          if ([v15 containsIndex:v6])
          {
            id v4 = v18;
            v16 = [v12 layoutAttributesForUnpinnedItemAtIndexPath:v18];

            goto LABEL_14;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    v16 = 0;
    id v4 = v18;
  }
  else
  {
    v16 = 0;
  }
LABEL_14:

  return v16;
}

- (id)pinnedLayoutAttributesForItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_orderedSublayouts;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    long long v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        -[SKUIStorePageSplitCollectionViewLayout convertRect:toLayout:](self, "convertRect:toLayout:", v14, x, y, width, height, (void)v17);
        uint64_t v15 = objc_msgSend(v14, "pinnedLayoutAttributesForItemsInRect:");
        if ([v15 count])
        {
          if (v11) {
            [v11 addObjectsFromArray:v15];
          }
          else {
            long long v11 = (void *)[v15 mutableCopy];
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (void)setBackdropGroupName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  backdropGroupName = self->_backdropGroupName;
  if (backdropGroupName != v4 && ![(NSString *)backdropGroupName isEqualToString:v4])
  {
    uint64_t v6 = (NSString *)[(NSString *)v4 copy];
    id v7 = self->_backdropGroupName;
    self->_backdropGroupName = v6;

    uint64_t v8 = [(SKUIStorePageSplitCollectionViewLayout *)self sublayouts];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setBackdropGroupName:v4];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_rendersWithPerspective != a3)
  {
    BOOL v3 = a3;
    self->_rendersWithPerspective = a3;
    id v4 = [(SKUIStorePageSplitCollectionViewLayout *)self sublayouts];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) setRendersWithPerspective:v3];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setRendersWithParallax:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_rendersWithParallax != a3)
  {
    self->_rendersWithParalladouble x = a3;
    id v4 = [(SKUIStorePageSplitCollectionViewLayout *)self sublayouts];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setRendersWithParallax:self->_rendersWithParallax];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)addSublayout:(id)a3 forElementKinds:(id)a4
{
  BOOL rendersWithPerspective = self->_rendersWithPerspective;
  id v7 = a4;
  id v8 = a3;
  [v8 setRendersWithPerspective:rendersWithPerspective];
  [v8 setRendersWithParallax:self->_rendersWithParallax];
  [(NSMutableArray *)self->_orderedSublayouts addObject:v8];
  v9.receiver = self;
  v9.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  [(_UICollectionViewCompositionLayout *)&v9 addSublayout:v8 forElementKinds:v7];
}

- (void)addSublayout:(id)a3 forItems:(id)a4 inSection:(int64_t)a5 offset:(CGPoint)a6 relativeToEdges:(unint64_t)a7 fromSiblingLayout:(id)a8
{
  double y = a6.y;
  double x = a6.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  [v15 setRendersWithPerspective:self->_rendersWithPerspective];
  [v15 setRendersWithParallax:self->_rendersWithParallax];
  [(NSMutableArray *)self->_orderedSublayouts addObject:v15];
  [(SKUIStorePageSplitCollectionViewLayout *)self _createSectionsToIndexRangesMapTableIfNeededForSublayout:v15];
  uint64_t v18 = [(NSMapTable *)self->_sublayoutToSectionsToIndexRanges objectForKey:v15];
  long long v19 = [NSNumber numberWithInteger:a5];
  long long v20 = [v18 objectForKey:v19];
  if (v20)
  {
    long long v21 = v20;
    [v20 addIndexes:v16];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v22 = [v16 mutableCopy];
  if (v22)
  {
    long long v21 = (void *)v22;
    [v18 setObject:v22 forKey:v19];
    goto LABEL_5;
  }
LABEL_6:
  v23.receiver = self;
  v23.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout addSublayout:forItems:inSection:offset:relativeToEdges:fromSiblingLayout:](&v23, sel_addSublayout_forItems_inSection_offset_relativeToEdges_fromSiblingLayout_, v15, v16, a5, a7, v17, x, y);
}

- (void)addSublayout:(id)a3 forSections:(id)a4 offset:(CGPoint)a5 relativeToEdges:(unint64_t)a6 fromSiblingLayout:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  BOOL rendersWithPerspective = self->_rendersWithPerspective;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  [v16 setRendersWithPerspective:rendersWithPerspective];
  [v16 setRendersWithParallax:self->_rendersWithParallax];
  [(NSMutableArray *)self->_orderedSublayouts addObject:v16];
  [(SKUIStorePageSplitCollectionViewLayout *)self _createSectionsToIndexRangesMapTableIfNeededForSublayout:v16];
  id v17 = [(NSMapTable *)self->_sublayoutToSectionsToIndexRanges objectForKey:v16];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __108__SKUIStorePageSplitCollectionViewLayout_addSublayout_forSections_offset_relativeToEdges_fromSiblingLayout___block_invoke;
  v20[3] = &unk_1E6426698;
  id v21 = v17;
  id v18 = v17;
  [v15 enumerateIndexesUsingBlock:v20];
  v19.receiver = self;
  v19.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](&v19, sel_addSublayout_forSections_offset_relativeToEdges_fromSiblingLayout_, v16, v15, a6, v14, x, y);
}

void __108__SKUIStorePageSplitCollectionViewLayout_addSublayout_forSections_offset_relativeToEdges_fromSiblingLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  [v3 setObject:v4 forKey:v5];
}

- (CGRect)_frameForLayout:(id)a3 offset:(CGPoint)a4 relativeToEdges:(unint64_t)a5 fromSiblingLayout:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout _frameForLayout:offset:relativeToEdges:fromSiblingLayout:](&v25, sel__frameForLayout_offset_relativeToEdges_fromSiblingLayout_, a3, a5, v11, x, y);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (a5 & 8) != 0 && (objc_opt_respondsToSelector())
  {
    [v11 _frame];
    double v15 = v20;
  }

  double v21 = v13;
  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)removeSublayout:(id)a3
{
  orderedSublayouts = self->_orderedSublayouts;
  id v5 = a3;
  [(NSMutableArray *)orderedSublayouts removeObjectIdenticalTo:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  [(_UICollectionViewCompositionLayout *)&v6 removeSublayout:v5];
}

- (id)sublayouts
{
  return self->_orderedSublayouts;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(SKUIStorePageSplitCollectionViewLayout *)self sublayouts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "shouldInvalidateLayoutForBoundsChange:", x, y, width, height))
        {

          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  BOOL v13 = -[SKUIStorePageSplitCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v15, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
LABEL_11:

  return v13;
}

- (void)_createSectionsToIndexRangesMapTableIfNeededForSublayout:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v10 = v4;
    if (self->_sublayoutToSectionsToIndexRanges)
    {
      objc_super v6 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
      sublayoutToSectionsToIndexRanges = self->_sublayoutToSectionsToIndexRanges;
      self->_sublayoutToSectionsToIndexRanges = v6;

      id v5 = v10;
      id v8 = self->_sublayoutToSectionsToIndexRanges;
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v9 = [(NSMapTable *)v8 objectForKey:v5];
    if (!v9)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
      [(NSMapTable *)self->_sublayoutToSectionsToIndexRanges setObject:v9 forKey:v10];
    }

    id v5 = v10;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (id)_newStorePageCollectionViewLayout
{
  BOOL v3 = objc_alloc_init(SKUIStorePageCollectionViewLayout);
  [(SKUIStorePageCollectionViewLayout *)v3 setBackdropGroupName:self->_backdropGroupName];
  [(SKUIStorePageCollectionViewLayout *)v3 setRendersWithPerspective:self->_rendersWithPerspective];
  [(SKUIStorePageCollectionViewLayout *)v3 setRendersWithParallax:self->_rendersWithParallax];
  return v3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (NSArray)indexPathsForGradientItems
{
  return self->_indexPathsForGradientItems;
}

- (void)setIndexPathsForGradientItems:(id)a3
{
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublayoutToSectionsToIndexRanges, 0);
  objc_storeStrong((id *)&self->_orderedSublayouts, 0);
  objc_storeStrong((id *)&self->_indexPathsForGradientItems, 0);

  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStorePageSplitCollectionViewLayout init]";
}

@end