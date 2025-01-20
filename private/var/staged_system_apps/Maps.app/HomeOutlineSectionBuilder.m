@interface HomeOutlineSectionBuilder
+ (id)_itemSnapshotsWithStack:(id)a3 items:(id)a4 hidden:(BOOL)a5 itemIdentifierBlock:(id)a6 viewModelBlock:(id)a7 childItemsBlock:(id)a8 expandedBlock:(id)a9;
+ (id)itemSnapshotsWithItems:(id)a3 sectionIdentifier:(id)a4 sectionExpanded:(BOOL)a5 itemIdentifierBlock:(id)a6 viewModelBlock:(id)a7 childItemsBlock:(id)a8 expandedBlock:(id)a9;
@end

@implementation HomeOutlineSectionBuilder

+ (id)itemSnapshotsWithItems:(id)a3 sectionIdentifier:(id)a4 sectionExpanded:(BOOL)a5 itemIdentifierBlock:(id)a6 viewModelBlock:(id)a7 childItemsBlock:(id)a8 expandedBlock:(id)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if ([v15 count])
  {
    v21 = [[HomeOutlineSectionBuilderStack alloc] initWithSectionIdentifier:v16 sectionIndex:0];
    v22 = [a1 _itemSnapshotsWithStack:v21 items:v15 hidden:!v12 itemIdentifierBlock:v17 viewModelBlock:v18 childItemsBlock:v19 expandedBlock:v20];
  }
  else
  {
    v22 = &__NSArray0__struct;
  }

  return v22;
}

+ (id)_itemSnapshotsWithStack:(id)a3 items:(id)a4 hidden:(BOOL)a5 itemIdentifierBlock:(id)a6 viewModelBlock:(id)a7 childItemsBlock:(id)a8 expandedBlock:(id)a9
{
  BOOL v12 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v40 = (void (**)(id, void, id))a7;
  id v17 = (void (**)(id, void, id))a8;
  id v18 = (void (**)(void, void, void))v16;
  v37 = v17;
  v36 = (uint64_t (**)(id, void, id))a9;
  id v32 = +[NSMutableArray array];
  id v19 = +[NSMutableSet set];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = v15;
  id v43 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v43)
  {
    uint64_t v21 = 0;
    id v33 = v20;
    uint64_t v42 = *(void *)v45;
    BOOL v34 = v12;
    v39 = v18;
    do
    {
      v22 = 0;
      uint64_t v38 = v21;
      do
      {
        if (*(void *)v45 != v42) {
          objc_enumerationMutation(v20);
        }
        uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v22);
        [v14 _pushItem:v23 index:(char *)v22 + v21];
        v24 = ((void (**)(void, uint64_t, id))v18)[2](v18, v23, v14);
        if (v24 && ![v19 containsObject:v24])
        {
          [v14 _setTopIdentifier:v24];
          v25 = [v14 identifiers];
          v41 = +[IdentifierPath identifierPathWithIdentifiers:v25];

          if (v12) {
            +[HomeOutlineHiddenViewModel sharedViewModel];
          }
          else {
          v26 = v40[2](v40, v23, v14);
          }
          if (v26)
          {
            uint64_t v27 = v36[2](v36, v23, v14);
            v28 = v37[2](v37, v23, v14);
            id v18 = v39;
            v29 = [a1 _itemSnapshotsWithStack:v14 items:v28 hidden:v12 | v27 ^ 1 itemIdentifierBlock:v39 viewModelBlock:v40 childItemsBlock:v37 expandedBlock:v36];
            v30 = [[MapsUIDiffableDataSourceOutlineNodeSnapshot alloc] initWithIdentifierPath:v41 viewModel:v26 childSnapshots:v29 expanded:v27];
            if (v30)
            {
              [v32 addObject:v30];
              [v19 addObject:v24];
            }
            [v14 _pop];

            BOOL v12 = v34;
            id v20 = v33;
            uint64_t v21 = v38;
          }
          else
          {
            [v14 _pop];
            id v18 = v39;
          }
        }
        else
        {
          [v14 _pop];
        }

        v22 = (char *)v22 + 1;
      }
      while (v43 != v22);
      v21 += (uint64_t)v22;
      id v43 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v43);
  }

  return v32;
}

@end