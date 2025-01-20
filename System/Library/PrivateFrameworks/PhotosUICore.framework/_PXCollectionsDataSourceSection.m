@interface _PXCollectionsDataSourceSection
- (NSDictionary)lockStatePerCollection;
- (PXCollectionsDataSource)collectionsDataSource;
- (_PXCollectionsDataSourceSection)initWithCollectionsDataSource:(id)a3 lockStatePerCollection:(id)a4 outlineObject:(id)a5;
- (_PXCollectionsDataSourceSection)initWithCollectionsDataSource:(id)a3 outlineObject:(id)a4;
- (id)content;
- (id)existingAssetsFetchResultAtIndex:(int64_t)a3;
- (id)objectAtIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)countForCollection:(id)a3;
- (int64_t)indexOfCollection:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)lockStateForCollection:(id)a3;
- (unint64_t)section;
@end

@implementation _PXCollectionsDataSourceSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStatePerCollection, 0);
  objc_storeStrong((id *)&self->_collectionsDataSource, 0);
}

- (unint64_t)section
{
  return self->_section;
}

- (NSDictionary)lockStatePerCollection
{
  return self->_lockStatePerCollection;
}

- (PXCollectionsDataSource)collectionsDataSource
{
  return self->_collectionsDataSource;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v10 = [(_PXCollectionsDataSourceSection *)self collectionsDataSource];
  if (![v10 numberOfSections])
  {
    unint64_t v13 = 0;
    goto LABEL_7;
  }
  if ([v10 numberOfSections] != 1)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXCollectionsDataSection.m" lineNumber:104 description:@"This code path is not implemented."];

    abort();
  }
  uint64_t v18 = [v10 identifier];
  long long v19 = xmmword_1AB359AA0;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  id v11 = [v10 objectsInIndexPath:&v18];
  v12 = v11;
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXCollectionsDataSection.m", 101, @"%@ should conform to protocol %@, but it is nil", @"objects", @"NSFastEnumeration" object file lineNumber description];
LABEL_10:

    goto LABEL_5;
  }
  if (([v11 conformsToProtocol:&unk_1F034EA18] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXCollectionsDataSection.m", 101, @"%@ should conform to protocol %@, but %@ doesn't", @"objects", @"NSFastEnumeration", v16 object file lineNumber description];

    goto LABEL_10;
  }
LABEL_5:
  unint64_t v13 = [v12 countByEnumeratingWithState:a3 objects:a4 count:a5];

LABEL_7:
  return v13;
}

- (id)objectAtIndex:(int64_t)a3
{
  v4 = [(_PXCollectionsDataSourceSection *)self collectionsDataSource];
  v7[0] = [v4 identifier];
  v7[1] = 0;
  v7[2] = a3;
  v7[3] = 0x7FFFFFFFFFFFFFFFLL;
  v5 = [v4 objectAtIndexPath:v7];

  return v5;
}

- (int64_t)count
{
  return self->_count;
}

- (id)content
{
  v2 = [(_PXCollectionsDataSourceSection *)self collectionsDataSource];
  v3 = [v2 content];

  return v3;
}

- (id)existingAssetsFetchResultAtIndex:(int64_t)a3
{
  v4 = [(_PXCollectionsDataSourceSection *)self collectionsDataSource];
  if ([v4 numberOfSections] == 1)
  {
    v7[0] = [v4 identifier];
    v7[1] = 0;
    v7[2] = a3;
    v7[3] = 0x7FFFFFFFFFFFFFFFLL;
    v5 = [v4 existingAssetsFetchResultAtIndexPath:v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)lockStateForCollection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCollectionsDataSection.m", 59, @"Invalid parameter not satisfying: %@", @"collection" object file lineNumber description];
  }
  v6 = [(_PXCollectionsDataSourceSection *)self lockStatePerCollection];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    v8 = [(_PXCollectionsDataSourceSection *)self lockStatePerCollection];
    v9 = [v8 objectForKeyedSubscript:v5];

    unint64_t v10 = [v9 unsignedIntegerValue];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (int64_t)countForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(_PXCollectionsDataSourceSection *)self collectionsDataSource];
  int64_t v6 = [v5 countForCollection:v4];

  return v6;
}

- (int64_t)indexOfCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(_PXCollectionsDataSourceSection *)self collectionsDataSource];
  int64_t v6 = [v5 indexPathForCollection:v4];

  if (v6) {
    int64_t v7 = objc_msgSend(v6, "px_item");
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (_PXCollectionsDataSourceSection)initWithCollectionsDataSource:(id)a3 outlineObject:(id)a4
{
  return [(_PXCollectionsDataSourceSection *)self initWithCollectionsDataSource:a3 lockStatePerCollection:MEMORY[0x1E4F1CC08] outlineObject:a4];
}

- (_PXCollectionsDataSourceSection)initWithCollectionsDataSource:(id)a3 lockStatePerCollection:(id)a4 outlineObject:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 numberOfSections] >= 2)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXCollectionsDataSection.m", 33, @"Invalid parameter not satisfying: %@", @"collectionsDataSource.numberOfSections <= 1" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)_PXCollectionsDataSourceSection;
  unint64_t v13 = [(PXDataSection *)&v18 initWithOutlineObject:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_collectionsDataSource, a3);
    objc_storeStrong((id *)&v14->_lockStatePerCollection, a4);
    if ([v10 numberOfSections] == 1) {
      uint64_t v15 = [v10 numberOfItemsInSection:0];
    }
    else {
      uint64_t v15 = 0;
    }
    v14->_count = v15;
  }

  return v14;
}

@end