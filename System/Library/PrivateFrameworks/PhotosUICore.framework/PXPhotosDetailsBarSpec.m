@interface PXPhotosDetailsBarSpec
- (BOOL)_shouldIncludeItem:(id)a3;
- (PXPhotosDetailsBarSpec)initWithExtendedTraitCollection:(id)a3;
- (id)_placementForBarItem:(id)a3;
- (id)_sortPriorityForBarItem:(id)a3 placement:(id)a4;
- (id)sortedBarItemsByPlacement:(id)a3;
- (unint64_t)detailsOptions;
- (void)setDetailsOptions:(unint64_t)a3;
@end

@implementation PXPhotosDetailsBarSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedBarItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortPriorityByBarItemIdentifierByPlacement, 0);
}

- (void)setDetailsOptions:(unint64_t)a3
{
  self->_detailsOptions = a3;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (id)sortedBarItemsByPlacement:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if ([(PXPhotosDetailsBarSpec *)self _shouldIncludeItem:v11]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v8);
  }
  v32 = v6;

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        v19 = [(PXPhotosDetailsBarSpec *)self _placementForBarItem:v18];
        v20 = [v12 objectForKeyedSubscript:v19];
        if (!v20)
        {
          v20 = [MEMORY[0x1E4F1CA48] array];
          [v12 setObject:v20 forKeyedSubscript:v19];
        }
        [v20 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v15);
  }
  v31 = v13;

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = v12;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * k);
        v28 = objc_msgSend(v22, "objectForKeyedSubscript:", v27, v31, v32);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __52__PXPhotosDetailsBarSpec_sortedBarItemsByPlacement___block_invoke;
        v33[3] = &unk_1E5DB0B70;
        v33[4] = self;
        v33[5] = v27;
        v29 = [v28 sortedArrayUsingComparator:v33];
        [v21 setObject:v29 forKeyedSubscript:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v24);
  }

  return v21;
}

uint64_t __52__PXPhotosDetailsBarSpec_sortedBarItemsByPlacement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  uint64_t v8 = [v5 _sortPriorityForBarItem:a2 placement:v6];
  uint64_t v9 = [*(id *)(a1 + 32) _sortPriorityForBarItem:v7 placement:*(void *)(a1 + 40)];

  uint64_t v10 = [v8 compare:v9];
  return v10;
}

- (BOOL)_shouldIncludeItem:(id)a3
{
  includedBarItemIdentifiers = self->_includedBarItemIdentifiers;
  id v4 = [a3 identifier];
  LOBYTE(includedBarItemIdentifiers) = [(NSSet *)includedBarItemIdentifiers containsObject:v4];

  return (char)includedBarItemIdentifiers;
}

- (id)_placementForBarItem:(id)a3
{
  id v4 = [a3 identifier];
  if (([v4 isEqualToString:@"PXBarItemIdentifierTrash"] & 1) != 0
    || ([v4 isEqualToString:@"PXBarItemIdentifierAddTo"] & 1) != 0
    || ([v4 isEqualToString:@"PXBarItemIdentifierShare"] & 1) != 0
    || ([v4 isEqualToString:@"PXBarItemIdentifierFaceMode"] & 1) != 0
    || ([v4 isEqualToString:@"PXBarItemIdentifierAssetMode"] & 1) != 0
    || [v4 isEqualToString:@"PXBarItemIdentifierSelectModeMenu"])
  {
    if (self->_shouldPlaceEditActionsInToolbar) {
      unint64_t v5 = 4;
    }
    else {
      unint64_t v5 = 2;
    }
  }
  else if (([v4 isEqualToString:@"PXBarItemIdentifierFavorite"] & 1) != 0 {
         || ([v4 isEqualToString:@"PXBarItemIdentifierAdd"] & 1) != 0
  }
         || ([v4 isEqualToString:@"PXBarItemIdentifierSelect"] & 1) != 0
         || ([v4 isEqualToString:@"PXBarItemIdentifierCancel"] & 1) != 0
         || ([v4 isEqualToString:@"PXBarItemIdentifierActionMenu"] & 1) != 0
         || ([v4 isEqualToString:@"PXBarItemIdentifierEdit"] & 1) != 0)
  {
    unint64_t v5 = 3;
  }
  else if ([v4 isEqualToString:@"PXBarItemIdentifierDone"])
  {
    unint64_t v5 = ([(PXPhotosDetailsBarSpec *)self detailsOptions] >> 9) & 2;
  }
  else if ([v4 isEqualToString:@"PXBarItemIdentifierInterButtonSpacing"])
  {
    unint64_t v5 = 4;
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];

  return v6;
}

- (id)_sortPriorityForBarItem:(id)a3 placement:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  uint64_t v8 = [(NSDictionary *)self->_sortPriorityByBarItemIdentifierByPlacement objectForKeyedSubscript:v6];

  id v9 = [v8 objectForKeyedSubscript:v7];
  if (!v9)
  {
    uint64_t v10 = [(NSDictionary *)self->_sortPriorityByBarItemIdentifierByPlacement objectForKeyedSubscript:&unk_1F02D5B90];
    uint64_t v11 = [v10 objectForKeyedSubscript:v7];
    id v12 = (void *)v11;
    id v13 = &unk_1F02D5BC0;
    if (v11) {
      id v13 = (void *)v11;
    }
    id v9 = v13;
  }
  return v9;
}

- (PXPhotosDetailsBarSpec)initWithExtendedTraitCollection:(id)a3
{
  v28[12] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosDetailsBarSpec;
  unint64_t v5 = [(PXBarSpec *)&v24 initWithExtendedTraitCollection:v4];
  if (v5)
  {
    v28[0] = @"PXBarItemIdentifierActionMenu";
    v28[1] = @"PXBarItemIdentifierSelect";
    v28[2] = @"PXBarItemIdentifierShare";
    v28[3] = @"PXBarItemIdentifierFavorite";
    v28[4] = @"PXBarItemIdentifierAdd";
    v28[5] = @"PXBarItemIdentifierAddTo";
    v28[6] = @"PXBarItemIdentifierTrash";
    v28[7] = @"PXBarItemIdentifierEdit";
    v28[8] = @"PXBarItemIdentifierDone";
    v28[9] = @"PXBarItemIdentifierCancel";
    v28[10] = @"PXBarItemIdentifierFaceMode";
    v28[11] = @"PXBarItemIdentifierAssetMode";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:12];
    v27[0] = @"PXBarItemIdentifierShare";
    v27[1] = @"PXBarItemIdentifierFaceMode";
    v27[2] = @"PXBarItemIdentifierAssetMode";
    v27[3] = @"PXBarItemIdentifierSelectModeCaption";
    v27[4] = @"PXBarItemIdentifierTrash";
    v27[5] = @"PXBarItemIdentifierInterButtonSpacing";
    v27[6] = @"PXBarItemIdentifierSelectModeMenu";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:7];
    v25[0] = &unk_1F02D5B90;
    v25[1] = &unk_1F02D5BA8;
    v26[0] = v6;
    v26[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    id v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v10 = [v8 allKeys];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke;
    v20[3] = &unk_1E5DD2E68;
    id v21 = v8;
    id v12 = v9;
    id v22 = v12;
    id v13 = v11;
    uint64_t v23 = v13;
    id v14 = v8;
    [v10 enumerateObjectsUsingBlock:v20];
    sortPriorityByBarItemIdentifierByPlacement = v5->_sortPriorityByBarItemIdentifierByPlacement;
    v5->_sortPriorityByBarItemIdentifierByPlacement = v13;
    uint64_t v16 = v13;

    includedBarItemIdentifiers = v5->_includedBarItemIdentifiers;
    v5->_includedBarItemIdentifiers = v12;
    uint64_t v18 = v12;

    v5->_shouldPlaceEditActionsInToolbar = [v4 layoutSizeClass] == 1;
  }

  return v5;
}

void __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v3 objectForKey:v4];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke_2;
  uint64_t v11 = &unk_1E5DBC640;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v8];
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v4, v8, v9, v10, v11);
}

void __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = NSNumber;
  id v7 = a2;
  id v6 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];

  [*(id *)(a1 + 40) addObject:v7];
}

@end