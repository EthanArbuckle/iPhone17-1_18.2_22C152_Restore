@interface PXPersonsSectionedDataSource
- (NSArray)personsSections;
- (NSDictionary)faceTiles;
- (PHPhotoLibrary)photoLibrary;
- (PXPersonsSectionedDataSource)initWithPhotoLibrary:(id)a3 personsSections:(id)a4 faceTiles:(id)a5 peopleHomeSortingType:(unint64_t)a6;
- (id)_personsInSection:(int64_t)a3;
- (id)faceTileForIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (id)sortedObjectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)peopleHomeSortingType;
@end

@implementation PXPersonsSectionedDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personsSections, 0);
  objc_storeStrong((id *)&self->_faceTiles, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_cachedSortedPersonsByTypeAndSection, 0);
}

- (NSArray)personsSections
{
  return self->_personsSections;
}

- (unint64_t)peopleHomeSortingType
{
  return self->_peopleHomeSortingType;
}

- (NSDictionary)faceTiles
{
  return self->_faceTiles;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)faceTileForIndexPath:(PXSimpleIndexPath *)a3
{
  long long v4 = *(_OWORD *)&a3->item;
  v14[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v14[1] = v4;
  v5 = [(PXPersonsSectionedDataSource *)self objectAtIndexPath:v14];
  v6 = [(PXPersonsSectionedDataSource *)self faceTiles];
  v7 = [v5 localIdentifier];
  v8 = [v6 objectForKeyedSubscript:v7];

  v9 = [PXPeopleFaceTile alloc];
  v10 = [v8 face];
  v11 = [v8 asset];
  v12 = [(PXPeopleFaceTile *)v9 initWithFace:v10 asset:v11 person:v5];

  return v12;
}

- (id)_personsInSection:(int64_t)a3
{
  v6 = [(PXPersonsSectionedDataSource *)self personsSections];
  v7 = [v6 objectAtIndexedSubscript:a3];

  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPersonsSectionedDataSource.m", 90, @"%@ invalid section: %lu", self, a3 object file lineNumber description];
  }
  v8 = [v7 fetchedObjects];

  return v8;
}

- (id)sortedObjectsInIndexPath:(PXSimpleIndexPath *)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPersonsSectionedDataSource *)self identifier])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPersonsSectionedDataSource.m", 74, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t section = a3->section;
  id v8 = objc_alloc((Class)off_1E5DA9660);
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXPersonsSectionedDataSource peopleHomeSortingType](self, "peopleHomeSortingType"));
  v18[0] = v9;
  v10 = [NSNumber numberWithInteger:section];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v12 = (void *)[v8 initWithObjects:v11];

  v13 = [(NSMutableDictionary *)self->_cachedSortedPersonsByTypeAndSection objectForKey:v12];
  if (!v13)
  {
    v14 = [(PXPersonsSectionedDataSource *)self _personsInSection:a3->section];
    v15 = +[PXPeopleUtilities comparatorByPeopleHomeSortingType:[(PXPersonsSectionedDataSource *)self peopleHomeSortingType]];
    v13 = [v14 sortedArrayUsingComparator:v15];
    [(NSMutableDictionary *)self->_cachedSortedPersonsByTypeAndSection setObject:v13 forKey:v12];
  }
  return v13;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPersonsSectionedDataSource *)self identifier])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPersonsSectionedDataSource.m", 63, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  v9 = [(PXPersonsSectionedDataSource *)self personsSections];
  v10 = [v9 objectAtIndexedSubscript:a3->section];

  return v10;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPersonsSectionedDataSource *)self identifier])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPersonsSectionedDataSource.m", 50, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  long long v7 = *(_OWORD *)&a3->item;
  long long v16 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v17 = v7;
  id v8 = [(PXPersonsSectionedDataSource *)self sortedObjectsInIndexPath:&v16];
  BOOL v9 = a3->dataSourceIdentifier == *(void *)off_1E5DAAED8 || a3->item == 0x7FFFFFFFFFFFFFFFLL;
  if (v9 || ((v10 = v8, a3->subitem == 0x7FFFFFFFFFFFFFFFLL) ? (BOOL v11 = v8 == 0) : (BOOL v11 = 1), v11))
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    long long v15 = *(_OWORD *)&a3->item;
    long long v16 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v17 = v15;
    PXSimpleIndexPathDescription();
  }
  v12 = objc_msgSend(v8, "objectAtIndex:");

  return v12;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  long long v4 = [(PXPersonsSectionedDataSource *)self personsSections];
  v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)numberOfSections
{
  v2 = [(PXPersonsSectionedDataSource *)self personsSections];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXPersonsSectionedDataSource)initWithPhotoLibrary:(id)a3 personsSections:(id)a4 faceTiles:(id)a5 peopleHomeSortingType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PXPersonsSectionedDataSource;
  v14 = [(PXPersonsSectionedDataSource *)&v23 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_photoLibrary, a3);
    uint64_t v16 = [v12 copy];
    personsSections = v15->_personsSections;
    v15->_personsSections = (NSArray *)v16;

    uint64_t v18 = [v13 copy];
    faceTiles = v15->_faceTiles;
    v15->_faceTiles = (NSDictionary *)v18;

    v15->_peopleHomeSortingType = a6;
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedSortedPersonsByTypeAndSection = v15->_cachedSortedPersonsByTypeAndSection;
    v15->_cachedSortedPersonsByTypeAndSection = v20;
  }
  return v15;
}

@end