@interface NSDiffableDataSourceSnapshot
+ (id)_maps_singleSectionSnapshotWithIdentifiersForItems:(id)a3;
+ (id)_maps_singleSectionSnapshotWithIdentifiersForItems:(id)a3 reloadingChangesFromPreviousItems:(id)a4;
- (id)_maps_appendIdentifiersForSection:(id)a3 items:(id)a4;
- (id)_maps_appendIdentifiersForSection:(id)a3 items:(id)a4 reloadingChangesFromPreviousItems:(id)a5;
@end

@implementation NSDiffableDataSourceSnapshot

+ (id)_maps_singleSectionSnapshotWithIdentifiersForItems:(id)a3 reloadingChangesFromPreviousItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  v9 = objc_opt_new();
  id v10 = [v8 _maps_appendIdentifiersForSection:v9 items:v6 reloadingChangesFromPreviousItems:v7];

  return v8;
}

- (id)_maps_appendIdentifiersForSection:(id)a3 items:(id)a4 reloadingChangesFromPreviousItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 count])
  {
    v63 = [MapsUIDiffableDataSourceSnapshotDifference alloc];
    if (v10) {
      v64 = v10;
    }
    else {
      v64 = &__NSArray0__struct;
    }
    v62 = [(MapsUIDiffableDataSourceSnapshotDifference *)v63 initWithReloadedItems:&__NSArray0__struct insertedItems:&__NSArray0__struct deletedItems:v64];
    goto LABEL_71;
  }
  v72 = v10;
  id v69 = v8;
  v75 = sub_1000A4B98(v8);
  v107 = v75;
  v11 = +[NSArray arrayWithObjects:&v107 count:1];
  [(NSDiffableDataSourceSnapshot *)self appendSectionsWithIdentifiers:v11];

  v70 = self;
  v12 = [(NSDiffableDataSourceSnapshot *)self itemIdentifiers];
  v76 = +[NSSet setWithArray:v12];

  v13 = +[NSMutableOrderedSet orderedSet];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v68 = v9;
  id v14 = v9;
  id v15 = [v14 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (!v15) {
    goto LABEL_22;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v95;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v95 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v94 + 1) + 8 * i);
      v20 = sub_1000A4B98(v19);
      if (v20)
      {
        if ([v13 containsObject:v20])
        {
          v21 = sub_1000AA148();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v103 = (uint64_t)v75;
            __int16 v104 = 2112;
            v105 = v20;
            v22 = v21;
            v23 = "Diffable identifier is not unique within section '%@': %@";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
            goto LABEL_18;
          }
          goto LABEL_18;
        }
        if ([v76 containsObject:v20])
        {
          v21 = sub_1000AA148();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v103 = (uint64_t)v75;
            __int16 v104 = 2112;
            v105 = v20;
            v22 = v21;
            v23 = "Diffable identifier is not unique outside of section '%@': %@";
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_20;
        }
        [v13 addObject:v20];
      }
      else
      {
        v24 = v13;
        v25 = sub_1000AA148();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v103 = (uint64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Diffable identifier missing for object: %@", buf, 0xCu);
        }

        v13 = v24;
      }
LABEL_20:
    }
    id v16 = [v14 countByEnumeratingWithState:&v94 objects:v106 count:16];
  }
  while (v16);
LABEL_22:

  v26 = [v13 array];
  [(NSDiffableDataSourceSnapshot *)v70 appendItemsWithIdentifiers:v26 intoSectionWithIdentifier:v75];
  id v10 = v72;
  if (v72)
  {
    v66 = v13;
    v67 = v26;
    v77 = +[NSMutableArray array];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v27 = v72;
    id v28 = [v27 countByEnumeratingWithState:&v90 objects:v101 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v91;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v91 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = sub_1000A4B98(*(void **)(*((void *)&v90 + 1) + 8 * (void)j));
          if (v32)
          {
            [v77 addObject:v32];
          }
          else
          {
            v33 = sub_1000AA148();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              uint64_t v34 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              uint64_t v103 = v34;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Diffable identifier from a previous item is nil. item class: %@", buf, 0xCu);
            }
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v90 objects:v101 count:16];
      }
      while (v29);
    }

    v73 = +[NSMutableArray array];
    v74 = +[NSMutableArray array];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v35 = v67;
    id v36 = [v35 countByEnumeratingWithState:&v86 objects:v100 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v87;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v87 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v86 + 1) + 8 * (void)k);
          id v41 = [v77 indexOfObject:v40];
          id v42 = [v35 indexOfObject:v40];
          if (v41 != (id)0x7FFFFFFFFFFFFFFFLL && v42 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v44 = v42;
            v45 = [v27 objectAtIndexedSubscript:v41];
            v46 = [v14 objectAtIndexedSubscript:v44];
            if (v45 != v46 && ([v45 isEqual:v46] & 1) == 0)
            {
              [v73 addObject:v46];
              [v74 addObject:v40];
            }
          }
        }
        id v37 = [v35 countByEnumeratingWithState:&v86 objects:v100 count:16];
      }
      while (v37);
    }

    [(NSDiffableDataSourceSnapshot *)v70 reconfigureItemsWithIdentifiers:v74];
    v47 = [v35 differenceFromArray:v77];
    v48 = +[NSMutableArray array];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v49 = [v47 insertions];
    id v50 = [v49 countByEnumeratingWithState:&v82 objects:v99 count:16];
    v13 = v66;
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = *(void *)v83;
      do
      {
        for (m = 0; m != v51; m = (char *)m + 1)
        {
          if (*(void *)v83 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = [v14 objectAtIndexedSubscript:[m index]];
          [v48 addObject:v54];
        }
        id v51 = [v49 countByEnumeratingWithState:&v82 objects:v99 count:16];
      }
      while (v51);
    }

    v55 = +[NSMutableArray array];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v71 = v47;
    v56 = [v47 removals];
    id v57 = [v56 countByEnumeratingWithState:&v78 objects:v98 count:16];
    v26 = v67;
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v79;
      do
      {
        for (n = 0; n != v58; n = (char *)n + 1)
        {
          if (*(void *)v79 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * (void)n), "index"));
          [v55 addObject:v61];
        }
        id v58 = [v56 countByEnumeratingWithState:&v78 objects:v98 count:16];
      }
      while (v58);
    }

    v62 = [[MapsUIDiffableDataSourceSnapshotDifference alloc] initWithReloadedItems:v73 insertedItems:v48 deletedItems:v55];
    id v10 = v72;
  }
  else
  {
    v62 = [[MapsUIDiffableDataSourceSnapshotDifference alloc] initWithReloadedItems:&__NSArray0__struct insertedItems:v14 deletedItems:&__NSArray0__struct];
  }

  id v9 = v68;
  id v8 = v69;
LABEL_71:

  return v62;
}

+ (id)_maps_singleSectionSnapshotWithIdentifiersForItems:(id)a3
{
  return [a1 _maps_singleSectionSnapshotWithIdentifiersForItems:a3 reloadingChangesFromPreviousItems:0];
}

- (id)_maps_appendIdentifiersForSection:(id)a3 items:(id)a4
{
  return [(NSDiffableDataSourceSnapshot *)self _maps_appendIdentifiersForSection:a3 items:a4 reloadingChangesFromPreviousItems:0];
}

@end