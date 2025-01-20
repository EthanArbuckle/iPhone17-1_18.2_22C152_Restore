@interface SearchListOrderedDataSource
+ (int64_t)searchResultTypeWithGEOType:(int64_t)a3;
- (NSArray)orderedObjects;
- (NSArray)sections;
- (SearchListOrderedDataSource)initWithObjects:(id)a3;
- (SearchListOrderedDataSource)initWithObjects:(id)a3 searchSectionList:(id)a4;
- (id)objectAtIndexPath:(id)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_createSectionsWithObjects:(id)a3 searchSectionList:(id)a4;
- (void)setOrderedObjects:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation SearchListOrderedDataSource

- (SearchListOrderedDataSource)initWithObjects:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchListOrderedDataSource;
  return [(SearchListOrderedDataSource *)&v4 init];
}

- (SearchListOrderedDataSource)initWithObjects:(id)a3 searchSectionList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SearchListOrderedDataSource;
  v8 = [(SearchListOrderedDataSource *)&v10 init];
  if (v8 && [v6 count]) {
    [(SearchListOrderedDataSource *)v8 _createSectionsWithObjects:v6 searchSectionList:v7];
  }

  return v8;
}

- (int64_t)numberOfSections
{
  v2 = [(SearchListOrderedDataSource *)self sections];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  objc_super v4 = [(SearchListOrderedDataSource *)self sections];
  v5 = [v4 objectAtIndexedSubscript:a3];

  id v6 = [v5 searchResults];
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  v5 = [(SearchListOrderedDataSource *)self sections];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= a3)
  {
    v8 = [(SearchListOrderedDataSource *)self sections];
    v9 = [v8 objectAtIndexedSubscript:a3];

    if ([v9 type] == (id)1)
    {
      id v7 = [v9 title];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SearchListOrderedDataSource *)self sections];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  if ([v7 type] == (id)1)
  {
    v8 = [v7 title];
    if ([v8 length]) {
      v9 = [[ResultsSectionHeaderView alloc] initWithTitle:v8 isFirstNonEmptySection:v4 showHairline:MapsFeature_IsEnabled_SearchAndDiscovery() ^ 1];
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 >= (id)[(NSArray *)self->_sections count])
  {
    v11 = 0;
  }
  else
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v4 section]);
    id v7 = [v4 row];
    v8 = [v6 searchResults];
    id v9 = [v8 count];

    if (v7 >= v9)
    {
      v11 = 0;
    }
    else
    {
      objc_super v10 = [v6 searchResults];
      v11 = [v10 objectAtIndexedSubscript:v7];
    }
  }

  return v11;
}

- (void)_createSectionsWithObjects:(id)a3 searchSectionList:(id)a4
{
  id v6 = a3;
  id v46 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v67;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v67 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v14 = [v13 mapItem];
        v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v14 _muid]);
        [v8 setObject:v13 forKey:v15];
      }
      id v10 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v10);
  }

  id v16 = objc_alloc((Class)NSMutableArray);
  v17 = [v46 searchSections];
  id v53 = [v16 initWithCapacity:[v17 count]];

  v18 = [v46 searchSections];
  id v19 = [v18 count];

  if (v19)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v50 = [v46 searchSections];
    id v54 = [v50 countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (!v54) {
      goto LABEL_35;
    }
    uint64_t v52 = *(void *)v63;
    id v47 = v7;
    v48 = self;
    while (1)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v63 != v52) {
          objc_enumerationMutation(v50);
        }
        v21 = *(void **)(*((void *)&v62 + 1) + 8 * v20);
        id v22 = objc_alloc_init((Class)NSMutableArray);
        id v23 = [v21 sectionType];
        uint64_t v55 = v20;
        if (v23 == (id)2)
        {
          if (MapsFeature_IsEnabled_SearchAndDiscovery())
          {
            v25 = v21;
            v35 = [(SearchResult *)v25 sectionGuide];
            v36 = [v35 placeCollections];
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_100CD7C08;
            v56[3] = &unk_101321068;
            id v57 = v22;
            [v36 enumerateObjectsUsingBlock:v56];
          }
          else
          {
            v25 = [[SearchResult alloc] initWithSearchSection:v21];
            [v22 insertObject:v25 atIndex:0];
          }
        }
        else
        {
          if (v23 != (id)1) {
            goto LABEL_33;
          }
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          v24 = [v21 sectionPlace];
          v25 = [v24 mapItemIds];

          id v26 = [(SearchResult *)v25 countByEnumeratingWithState:&v58 objects:v74 count:16];
          if (v26)
          {
            id v27 = v26;
            v49 = v21;
            uint64_t v28 = *(void *)v59;
            do
            {
              for (j = 0; j != v27; j = (char *)j + 1)
              {
                if (*(void *)v59 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
                v31 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 muid]);
                v32 = [v8 objectForKey:v31];

                if (v32)
                {
                  [v22 addObject:v32];
                }
                else
                {
                  v33 = sub_100109E50();
                  if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
                  {
                    v34 = (NSArray *)[v30 muid];
                    *(_DWORD *)buf = 134217984;
                    v71 = v34;
                    _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)0x90u, "SearchSectionList has a place section containing a place_id that does not exist among the list of map items in the maps_result. Identifier muid: %llu", buf, 0xCu);
                  }
                }
              }
              id v27 = [(SearchResult *)v25 countByEnumeratingWithState:&v58 objects:v74 count:16];
            }
            while (v27);
            id v7 = v47;
            self = v48;
            v21 = v49;
          }
        }

LABEL_33:
        [v7 addObjectsFromArray:v22];
        v37 = [SearchResultSection alloc];
        v38 = [v21 name];
        v39 = [[SearchResultSection alloc] initWithTitle:v38 type:[objc_opt_class() searchResultTypeWithGEOType:[v21 sectionType]] searchResults:v22];

        [v53 addObject:v39];
        uint64_t v20 = v55 + 1;
      }
      while ((id)(v55 + 1) != v54);
      id v54 = [v50 countByEnumeratingWithState:&v62 objects:v75 count:16];
      if (!v54)
      {
LABEL_35:

        break;
      }
    }
  }
  v40 = sub_100109E50();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    orderedObjects = self->_orderedObjects;
    *(_DWORD *)buf = 138412546;
    v71 = orderedObjects;
    __int16 v72 = 2112;
    id v73 = v53;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "SearchListOrderedDataSource. _orderedObjects: %@, sections = %@", buf, 0x16u);
  }

  v42 = (NSArray *)[v7 copy];
  v43 = self->_orderedObjects;
  self->_orderedObjects = v42;

  v44 = (NSArray *)[v53 copy];
  sections = self->_sections;
  self->_sections = v44;
}

+ (int64_t)searchResultTypeWithGEOType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (NSArray)orderedObjects
{
  return self->_orderedObjects;
}

- (void)setOrderedObjects:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_orderedObjects, 0);
}

@end