@interface AlphabeticallyOrderedDataSource
- (AlphabeticallyOrderedDataSource)initWithAlphabeticallySortableObject:(id)a3;
- (AlphabeticallyOrderedDataSource)initWithObjects:(id)a3;
- (NSArray)orderedObjects;
- (NSArray)sectionIndexTitles;
- (NSArray)sections;
- (id)objectAtIndexPath:(id)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)numberOfSectionsNotEmpty;
- (void)setOrderedObjects:(id)a3;
- (void)setSectionIndexTitles:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation AlphabeticallyOrderedDataSource

- (AlphabeticallyOrderedDataSource)initWithObjects:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___AlphabeticallySortableObject])[v5 addObject:v11]; {
      }
        }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];
  v13 = [(AlphabeticallyOrderedDataSource *)self initWithAlphabeticallySortableObject:v12];

  return v13;
}

- (AlphabeticallyOrderedDataSource)initWithAlphabeticallySortableObject:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AlphabeticallyOrderedDataSource;
  id v5 = [(AlphabeticallyOrderedDataSource *)&v40 init];
  if (v5)
  {
    id v6 = +[UILocalizedIndexedCollation currentCollation];
    id v7 = [v6 sectionIndexTitles];
    id v8 = (NSArray *)[v7 copy];
    sectionIndexTitles = v5->_sectionIndexTitles;
    v34 = v5;
    v5->_sectionIndexTitles = v8;

    v10 = [v6 sectionTitles];
    v11 = (char *)[v10 count];

    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v11];
    id v32 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    if (v11)
    {
      v13 = v11;
      do
      {
        id v14 = objc_alloc_init((Class)NSMutableArray);
        [v12 addObject:v14];

        --v13;
      }
      while (v13);
    }
    v33 = v11;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v35 = v4;
    id v15 = v4;
    id v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v20, "conformsToProtocol:", &OBJC_PROTOCOL___AlphabeticallySortableObject, v32))
          {
            v21 = [v12 objectAtIndexedSubscript:[v6 sectionForObject:v20 collationStringSelector:@"_maps_alphabeticallySortableObject_name"]];
            [v21 addObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v17);
    }

    if (v33)
    {
      v22 = 0;
      unint64_t v23 = 0;
      v24 = v32;
      do
      {
        v25 = [v12 objectAtIndexedSubscript:v22, v32];
        v26 = [v6 sortedArrayFromArray:v25 collationStringSelector:"_maps_alphabeticallySortableObject_name"];
        [v12 setObject:v26 atIndexedSubscript:v22];
        if ([v25 count]) {
          ++v23;
        }
        [v24 addObjectsFromArray:v26];

        ++v22;
      }
      while (v33 != v22);
    }
    else
    {
      unint64_t v23 = 0;
      v24 = v32;
    }
    v27 = [v12 copy];
    id v5 = v34;
    sections = v34->_sections;
    v34->_sections = v27;

    v29 = (NSArray *)[v24 copy];
    orderedObjects = v34->_orderedObjects;
    v34->_orderedObjects = v29;

    v34->_numberOfSectionsNotEmpty = v23;
    id v4 = v35;
  }

  return v5;
}

- (int64_t)numberOfSections
{
  v2 = [(AlphabeticallyOrderedDataSource *)self sections];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  id v4 = [(AlphabeticallyOrderedDataSource *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(AlphabeticallyOrderedDataSource *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:[v4 section]];

  id v7 = [v4 row];
  id v8 = [v6 objectAtIndexedSubscript:v7];

  return v8;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  return 0;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (void)setSectionIndexTitles:(id)a3
{
}

- (unint64_t)numberOfSectionsNotEmpty
{
  return self->_numberOfSectionsNotEmpty;
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

  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
}

@end