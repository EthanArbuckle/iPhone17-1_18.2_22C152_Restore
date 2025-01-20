@interface NSDiffableDataSourceSectionSnapshot
- (NSString)_maps_recursiveDescription;
- (id)_maps_applyChangesWithNewRootSnapshot:(id)a3 oldRootSnapshot:(id)a4;
- (id)_maps_internal_recursiveDescriptionOfItem:(id)a3;
- (id)_maps_recursiveDescriptionOfItem:(id)a3;
- (void)_maps_updateWithNodeSnapshot:(id)a3 previousNodeSnapshot:(id)a4 reloadedItems:(id)a5 insertedItems:(id)a6 deletedItems:(id)a7 movedItems:(id)a8 expandedItems:(id)a9 collapsedItems:(id)a10;
@end

@implementation NSDiffableDataSourceSectionSnapshot

- (NSString)_maps_recursiveDescription
{
  v3 = [(NSDiffableDataSourceSectionSnapshot *)self description];
  v4 = +[NSMutableString stringWithString:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = [(NSDiffableDataSourceSectionSnapshot *)self rootItems];
  id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [(NSDiffableDataSourceSectionSnapshot *)self _maps_internal_recursiveDescriptionOfItem:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n |  "];
        [v4 appendFormat:@"\n +-- %@", v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSString *)v4;
}

- (id)_maps_recursiveDescriptionOfItem:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDiffableDataSourceSectionSnapshot *)self snapshotOfParentItem:v4 includingParentItem:1];
  id v6 = [v5 _maps_internal_recursiveDescriptionOfItem:v4];

  return v6;
}

- (id)_maps_internal_recursiveDescriptionOfItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 description];
  id v6 = +[NSMutableString stringWithString:v5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = v4;
  uint64_t v7 = [(NSDiffableDataSourceSectionSnapshot *)self snapshotOfParentItem:v4 includingParentItem:0];
  v8 = [v7 rootItems];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = [(NSDiffableDataSourceSectionSnapshot *)self _maps_internal_recursiveDescriptionOfItem:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        long long v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n |  "];
        [v6 appendFormat:@"\n +-- %@", v14];
      }
      id v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v6;
}

- (id)_maps_applyChangesWithNewRootSnapshot:(id)a3 oldRootSnapshot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSMutableArray array];
  id v9 = +[NSMutableArray array];
  id v10 = +[NSMutableArray array];
  uint64_t v11 = +[NSMutableArray array];
  v12 = +[NSMutableArray array];
  long long v13 = +[NSMutableArray array];
  [(NSDiffableDataSourceSectionSnapshot *)self _maps_updateWithNodeSnapshot:v7 previousNodeSnapshot:v6 reloadedItems:v8 insertedItems:v9 deletedItems:v10 movedItems:v11 expandedItems:v12 collapsedItems:v13];

  long long v14 = [[MapsUIDiffableDataSourceSectionSnapshotUpdateDifference alloc] initWithReloadedItems:v8 insertedItems:v9 deletedItems:v10 movedItems:v11 expandedItems:v12 collapsedItems:v13];

  return v14;
}

- (void)_maps_updateWithNodeSnapshot:(id)a3 previousNodeSnapshot:(id)a4 reloadedItems:(id)a5 insertedItems:(id)a6 deletedItems:(id)a7 movedItems:(id)a8 expandedItems:(id)a9 collapsedItems:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v77 = a5;
  id v81 = a6;
  id v79 = a7;
  id v80 = a8;
  id v76 = a9;
  id v75 = a10;
  v78 = v17;
  long long v18 = [v17 childSnapshots];
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_1005B566C;
  v90[3] = &unk_1012F0D90;
  v90[4] = self;
  long long v19 = sub_100099700(v18, v90);

  long long v20 = [v16 childSnapshots];
  long long v21 = sub_100099700(v20, &stru_1012F0DD0);

  uint64_t v22 = sub_100099700(v19, &stru_1012F0DF0);
  v70 = (void *)v22;
  v71 = v21;
  v74 = v16;
  v72 = v19;
  if (v21 != (void *)v22)
  {
    uint64_t v23 = v22;
    if (([v21 isEqual:v22] & 1) == 0)
    {
      v24 = [v21 differenceFromArray:v23 withOptions:4];
      v25 = +[NSMutableArray arrayWithArray:v19];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v26 = v24;
      id v27 = [v26 countByEnumeratingWithState:&v86 objects:v98 count:16];
      if (!v27) {
        goto LABEL_28;
      }
      id v28 = v27;
      uint64_t v29 = *(void *)v87;
      v30 = GEOResultRefinementSort_ptr;
      while (1)
      {
        v31 = 0;
        id v73 = v28;
        do
        {
          if (*(void *)v87 != v29) {
            objc_enumerationMutation(v26);
          }
          v32 = *(void **)(*((void *)&v86 + 1) + 8 * (void)v31);
          v33 = [v32 object];
          id v34 = [v32 changeType];
          if (v34 == (id)1)
          {
            v94 = v33;
            v40 = [v30[501] arrayWithObjects:&v94 count:1];
            [(NSDiffableDataSourceSectionSnapshot *)self deleteItems:v40];

            v41 = [v25 objectAtIndexedSubscript:[v32 index]];
            [v25 removeObjectAtIndex:[v32 index]];
            if ([v32 associatedIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
              [v79 addObject:v41];
            }
            goto LABEL_23;
          }
          if (v34) {
            goto LABEL_24;
          }
          id v35 = [v32 index];
          if (v35 >= [v25 count])
          {
            v38 = v25;
            v97 = v33;
            v36 = [v30[501] arrayWithObjects:&v97 count:1];
            v37 = [v74 identifierPath];
            if (![v37 length])
            {
              [(NSDiffableDataSourceSectionSnapshot *)self appendItems:v36 intoParentItem:0];
              goto LABEL_19;
            }
            v39 = [v74 identifierPath];
            [(NSDiffableDataSourceSectionSnapshot *)self appendItems:v36 intoParentItem:v39];
          }
          else if ([v32 index])
          {
            v95 = v33;
            v36 = [v30[501] arrayWithObjects:&v95 count:1];
            v37 = [v25 objectAtIndexedSubscript:[v32 index] - 1];
            [v37 identifierPath];
            v39 = v38 = v25;
            [(NSDiffableDataSourceSectionSnapshot *)self insertItems:v36 afterItem:v39];
          }
          else
          {
            v96 = v33;
            v36 = [v30[501] arrayWithObjects:&v96 count:1];
            v37 = [v25 objectAtIndexedSubscript:0];
            [v37 identifierPath];
            v39 = v38 = v25;
            [(NSDiffableDataSourceSectionSnapshot *)self insertItems:v36 beforeItem:v39];
          }

LABEL_19:
          v42 = [v33 identifiers];
          v43 = [v42 lastObject];
          v41 = [v74 childSnapshotWithIdentifier:v43];

          [v38 insertObject:v41 atIndex:[v32 index]];
          if ([v32 associatedIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
            v44 = v81;
          }
          else {
            v44 = v80;
          }
          [v44 addObject:v41];
          v25 = v38;
          v30 = GEOResultRefinementSort_ptr;
          id v28 = v73;
LABEL_23:

LABEL_24:
          v31 = (char *)v31 + 1;
        }
        while (v28 != v31);
        id v45 = [v26 countByEnumeratingWithState:&v86 objects:v98 count:16];
        id v28 = v45;
        if (!v45)
        {
LABEL_28:

          id v16 = v74;
          break;
        }
      }
    }
  }
  v46 = [v16 identifierPath];
  id v47 = [v46 length];

  if (v47)
  {
    if (([v16 expanded] & 1) == 0)
    {
      v48 = [v16 identifierPath];
      unsigned int v49 = [(NSDiffableDataSourceSectionSnapshot *)self isExpanded:v48];

      if (v49)
      {
        v50 = [v16 identifierPath];
        v93 = v50;
        v51 = +[NSArray arrayWithObjects:&v93 count:1];
        [(NSDiffableDataSourceSectionSnapshot *)self collapseItems:v51];

        [v75 addObject:v16];
      }
    }
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v52 = [v16 childSnapshots];
  id v53 = [v52 countByEnumeratingWithState:&v82 objects:v92 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v83;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v83 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v58 = [v57 identifierPath];
        v59 = [v58 identifiers];
        v60 = [v59 lastObject];
        v61 = [v78 childSnapshotWithIdentifier:v60];

        -[NSDiffableDataSourceSectionSnapshot _maps_updateWithNodeSnapshot:previousNodeSnapshot:reloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:](self, "_maps_updateWithNodeSnapshot:previousNodeSnapshot:reloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:", v57, v61, v77, v81, v79, v80, v76, v75, v70, v71);
      }
      id v54 = [v52 countByEnumeratingWithState:&v82 objects:v92 count:16];
    }
    while (v54);
  }

  v62 = [v74 identifierPath];
  id v63 = [v62 length];

  if (v63)
  {
    if ([v74 expanded])
    {
      v64 = [v74 identifierPath];
      unsigned __int8 v65 = [(NSDiffableDataSourceSectionSnapshot *)self isExpanded:v64];

      if ((v65 & 1) == 0)
      {
        v66 = [v74 identifierPath];
        v91 = v66;
        v67 = +[NSArray arrayWithObjects:&v91 count:1];
        [(NSDiffableDataSourceSectionSnapshot *)self expandItems:v67];

        [v76 addObject:v74];
      }
    }
    v68 = [v74 identifierPath];
    unsigned int v69 = [(NSDiffableDataSourceSectionSnapshot *)self isVisible:v68];

    if (v78 && v69 && [v74 needsReloadFromPreviousItemSnapshot:v78]) {
      [v77 addObject:v74];
    }
  }
}

@end