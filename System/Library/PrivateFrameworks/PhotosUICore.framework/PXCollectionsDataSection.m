@interface PXCollectionsDataSection
- (PXCollectionsDataSection)init;
- (PXCollectionsDataSection)initWithCollectionsDataSource:(id)a3 lockStatePerCollection:(id)a4 outlineObject:(id)a5;
- (PXCollectionsDataSection)initWithCollectionsDataSource:(id)a3 outlineObject:(id)a4;
- (PXCollectionsDataSection)initWithDisplayCollection:(id)a3 lockState:(unint64_t)a4 outlineObject:(id)a5;
- (PXCollectionsDataSection)initWithDisplayCollection:(id)a3 outlineObject:(id)a4;
- (id)existingAssetsFetchResultAtIndex:(int64_t)a3;
- (int64_t)countForCollection:(id)a3;
- (int64_t)indexOfCollection:(id)a3;
- (unint64_t)lockStateForCollection:(id)a3;
@end

@implementation PXCollectionsDataSection

- (id)existingAssetsFetchResultAtIndex:(int64_t)a3
{
  return 0;
}

- (unint64_t)lockStateForCollection:(id)a3
{
  return 0;
}

- (int64_t)countForCollection:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)indexOfCollection:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXCollectionsDataSection.m", 198, @"Method %s is a responsibility of subclass %@", "-[PXCollectionsDataSection indexOfCollection:]", v8 object file lineNumber description];

  abort();
}

- (PXCollectionsDataSection)init
{
  v3 = [[_PXSingleCollectionDataSection alloc] initWithDisplayCollection:0 lockState:0 outlineObject:0];

  return &v3->super;
}

- (PXCollectionsDataSection)initWithDisplayCollection:(id)a3 lockState:(unint64_t)a4 outlineObject:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[_PXSingleCollectionDataSection alloc] initWithDisplayCollection:v9 lockState:a4 outlineObject:v8];

  return &v10->super;
}

- (PXCollectionsDataSection)initWithCollectionsDataSource:(id)a3 lockStatePerCollection:(id)a4 outlineObject:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_PXCollectionsDataSourceSection alloc] initWithCollectionsDataSource:v10 lockStatePerCollection:v9 outlineObject:v8];

  return &v11->super;
}

- (PXCollectionsDataSection)initWithDisplayCollection:(id)a3 outlineObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXCollectionsDataSection *)[_PXSingleCollectionDataSection alloc] initWithDisplayCollection:v7 outlineObject:v6];

  return &v8->super;
}

- (PXCollectionsDataSection)initWithCollectionsDataSource:(id)a3 outlineObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_PXCollectionsDataSourceSection alloc] initWithCollectionsDataSource:v7 outlineObject:v6];

  return &v8->super;
}

@end