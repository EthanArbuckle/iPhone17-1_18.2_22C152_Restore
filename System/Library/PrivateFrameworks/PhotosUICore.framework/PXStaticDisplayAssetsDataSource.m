@interface PXStaticDisplayAssetsDataSource
- (BOOL)hasCurationForAssetCollection:(id)a3;
- (NSArray)assetCollectionBySection;
- (NSArray)assetsBySection;
- (NSArray)curatedAssetsBySection;
- (NSArray)exposedAssetsBySection;
- (NSArray)keyAssetsBySection;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (PXStaticDisplayAssetsDataSource)init;
- (PXStaticDisplayAssetsDataSource)initWithAssetCollectionBySection:(id)a3 assetsBySection:(id)a4 curatedAssetsBySection:(id)a5 keyAssetsBySection:(id)a6 sectionContent:(int64_t)a7;
- (PXStaticDisplayAssetsDataSource)initWithDisplayAssetFetchResults:(id)a3;
- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3;
- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3;
- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)sectionContent;
@end

@implementation PXStaticDisplayAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedAssetsBySection, 0);
  objc_storeStrong((id *)&self->_keyAssetsBySection, 0);
  objc_storeStrong((id *)&self->_curatedAssetsBySection, 0);
  objc_storeStrong((id *)&self->_assetsBySection, 0);
  objc_storeStrong((id *)&self->_assetCollectionBySection, 0);
}

- (NSArray)exposedAssetsBySection
{
  return self->_exposedAssetsBySection;
}

- (NSArray)keyAssetsBySection
{
  return self->_keyAssetsBySection;
}

- (NSArray)curatedAssetsBySection
{
  return self->_curatedAssetsBySection;
}

- (NSArray)assetsBySection
{
  return self->_assetsBySection;
}

- (NSArray)assetCollectionBySection
{
  return self->_assetCollectionBySection;
}

- (int64_t)sectionContent
{
  return self->_sectionContent;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v14 = a4;
  long long v6 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v6;
  int64_t v7 = [(PXStaticDisplayAssetsDataSource *)self identifier];
  id v8 = [v14 leafObject];
  if ([(PXStaticDisplayAssetsDataSource *)self numberOfSections] >= 1)
  {
    v9 = [(PXStaticDisplayAssetsDataSource *)self assetCollectionBySection];
    id v10 = [v9 objectAtIndexedSubscript:0];
    if (v8 == v10)
    {
    }
    else
    {
      v11 = v10;
      char v12 = [v8 isEqual:v10];

      if ((v12 & 1) == 0)
      {
        [(PXStaticDisplayAssetsDataSource *)self exposedAssetsBySection];
        [(id)objc_claimAutoreleasedReturnValue() objectAtIndexedSubscript:0];
        objc_claimAutoreleasedReturnValue();
        PXSectionedFetchResultIndexOfObject();
      }
    }
    retstr->dataSourceIdentifier = v7;
    retstr->section = 0;
    retstr->item = 0x7FFFFFFFFFFFFFFFLL;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }

  return result;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PXStaticDisplayAssetsDataSource *)self assetCollectionBySection];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v7 = 0;
  }
  else
  {
    id v8 = [(PXStaticDisplayAssetsDataSource *)self keyAssetsBySection];
    int64_t v7 = [v8 objectAtIndexedSubscript:v6];
  }
  return v7;
}

- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXStaticDisplayAssetsDataSource *)self identifier])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXStaticDisplayAssetsDataSource.m", 143, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXStaticDisplayAssetsDataSource *)self keyAssetsBySection];
  id v8 = [v7 objectAtIndexedSubscript:a3->section];

  return v8;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  return [(PXStaticDisplayAssetsDataSource *)self sectionContent] == 1;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXStaticDisplayAssetsDataSource *)self identifier])
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXStaticDisplayAssetsDataSource.m", 128, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStaticDisplayAssetsDataSource.m" lineNumber:133 description:@"Index path has to be for a section."];

    abort();
  }
  v9 = [(PXStaticDisplayAssetsDataSource *)self exposedAssetsBySection];
  id v10 = [v9 objectAtIndexedSubscript:a3->section];

  return v10;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXStaticDisplayAssetsDataSource *)self identifier])
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXStaticDisplayAssetsDataSource.m", 115, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8)
  {
LABEL_14:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStaticDisplayAssetsDataSource.m" lineNumber:122 description:@"Index path has to be for a section or item."];

    abort();
  }
  int64_t item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(PXStaticDisplayAssetsDataSource *)self assetCollectionBySection];
    v9 = [v8 objectAtIndexedSubscript:a3->section];
    goto LABEL_11;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  id v8 = [(PXStaticDisplayAssetsDataSource *)self exposedAssetsBySection];
  id v10 = [v8 objectAtIndexedSubscript:a3->section];
  v9 = [v10 objectAtIndexedSubscript:a3->item];

LABEL_11:
  return v9;
}

- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXStaticDisplayAssetsDataSource *)self identifier])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXStaticDisplayAssetsDataSource.m", 110, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXStaticDisplayAssetsDataSource *)self assetsBySection];
  id v8 = [v7 objectAtIndexedSubscript:a3->section];

  return v8;
}

- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  id v4 = [(PXStaticDisplayAssetsDataSource *)self uncuratedAssetsInSectionIndexPath:v7];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXStaticDisplayAssetsDataSource *)self identifier])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXStaticDisplayAssetsDataSource.m", 101, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXStaticDisplayAssetsDataSource *)self curatedAssetsBySection];
  id v8 = [v7 objectAtIndexedSubscript:a3->section];

  return v8;
}

- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  id v4 = [(PXStaticDisplayAssetsDataSource *)self curatedAssetsInSectionIndexPath:v7];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXStaticDisplayAssetsDataSource *)self assetCollectionBySection];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v8 = [(PXStaticDisplayAssetsDataSource *)self assetsBySection];
  v9 = [v8 objectAtIndexedSubscript:v6];
  int64_t v10 = [v9 count];

  return v10;
}

- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXStaticDisplayAssetsDataSource *)self assetCollectionBySection];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v8 = [(PXStaticDisplayAssetsDataSource *)self curatedAssetsBySection];
  v9 = [v8 objectAtIndexedSubscript:v6];
  int64_t v10 = [v9 count];

  return v10;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4 = [(PXStaticDisplayAssetsDataSource *)self exposedAssetsBySection];
  int64_t v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)numberOfSections
{
  v2 = [(PXStaticDisplayAssetsDataSource *)self assetCollectionBySection];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXStaticDisplayAssetsDataSource)init
{
  return [(PXStaticDisplayAssetsDataSource *)self initWithDisplayAssetFetchResults:MEMORY[0x1E4F1CBF0]];
}

- (PXStaticDisplayAssetsDataSource)initWithDisplayAssetFetchResults:(id)a3
{
  return [(PXStaticDisplayAssetsDataSource *)self initWithAssetCollectionBySection:0 assetsBySection:a3 curatedAssetsBySection:0 keyAssetsBySection:0 sectionContent:0];
}

- (PXStaticDisplayAssetsDataSource)initWithAssetCollectionBySection:(id)a3 assetsBySection:(id)a4 curatedAssetsBySection:(id)a5 keyAssetsBySection:(id)a6 sectionContent:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v35.receiver = self;
  v35.super_class = (Class)PXStaticDisplayAssetsDataSource;
  v17 = [(PXStaticDisplayAssetsDataSource *)&v35 init];
  if (!v17) {
    goto LABEL_27;
  }
  SEL v33 = a2;
  id obj = a6;
  unint64_t v18 = [v13 count];
  unint64_t v19 = [v14 count];
  if (v18 <= v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v18;
  }
  unint64_t v21 = [v15 count];
  unint64_t v22 = [v16 count];
  if (v21 <= v22) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v21;
  }
  if (v20 <= v23) {
    uint64_t v20 = v23;
  }
  if (v13 && [v13 count] != v20)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:v33, v17, @"PXStaticDisplayAssetsDataSource.m", 32, @"Invalid parameter not satisfying: %@", @"!assetCollectionBySection || assetCollectionBySection.count == maxCount" object file lineNumber description];

    if (!v14) {
      goto LABEL_15;
    }
  }
  else if (!v14)
  {
    goto LABEL_15;
  }
  if ([v14 count] != v20)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:v33, v17, @"PXStaticDisplayAssetsDataSource.m", 33, @"Invalid parameter not satisfying: %@", @"!assetsBySection || assetsBySection.count == maxCount" object file lineNumber description];
  }
LABEL_15:
  if (v15 && [v15 count] != v20)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:v33, v17, @"PXStaticDisplayAssetsDataSource.m", 34, @"Invalid parameter not satisfying: %@", @"!curatedAssetsBySection || curatedAssetsBySection.count == maxCount" object file lineNumber description];

    if (v16)
    {
LABEL_18:
      if ([v16 count] != v20)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:v33, v17, @"PXStaticDisplayAssetsDataSource.m", 35, @"Invalid parameter not satisfying: %@", @"!keyAssetsBySection || keyAssetsBySection.count == maxCount" object file lineNumber description];
      }
    }
  }
  else if (v16)
  {
    goto LABEL_18;
  }
  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v20 >= 1)
    {
      do
      {
        v24 = [[PXMockDisplayAssetCollection alloc] initWithTitle:0 subtitle:0 type:1 subtype:2];
        [v13 addObject:v24];

        --v20;
      }
      while (v20);
    }
  }
  objc_storeStrong((id *)&v17->_assetCollectionBySection, v13);
  objc_storeStrong((id *)&v17->_assetsBySection, a4);
  objc_storeStrong((id *)&v17->_curatedAssetsBySection, a5);
  objc_storeStrong((id *)&v17->_keyAssetsBySection, obj);
  v17->_sectionContent = a7;
  v25 = v14;
  if (!a7) {
    goto LABEL_26;
  }
  if (a7 == 1)
  {
    v25 = v15;
LABEL_26:
    v26 = v25;
    exposedAssetsBySection = v17->_exposedAssetsBySection;
    v17->_exposedAssetsBySection = v26;
  }
LABEL_27:

  return v17;
}

@end