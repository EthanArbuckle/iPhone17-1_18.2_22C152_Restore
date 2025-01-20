@interface PXNavigationListCollectionsDataSourceDataSectionManager
- (id)dataSectionFromDataSource:(id)a3;
@end

@implementation PXNavigationListCollectionsDataSourceDataSectionManager

- (id)dataSectionFromDataSource:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PXNavigationListCollectionsDataSourceDataSectionManager.m", 20, @"%@ should be an instance inheriting from %@, but it is %@", @"dataSource", v13, v15 object file lineNumber description];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PXNavigationListCollectionsDataSourceDataSectionManager.m", 20, @"%@ should be an instance inheriting from %@, but it is nil", @"dataSource", v13 object file lineNumber description];
  }

LABEL_3:
  v6 = [PXCollectionsDataSection alloc];
  v7 = [(PXDataSectionManager *)self outlineObject];
  v8 = [(PXCollectionsDataSection *)v6 initWithCollectionsDataSource:v5 outlineObject:v7];

  v9 = [[PXNavigationListDataSection alloc] initWithCollectionsDataSection:v8];
  return v9;
}

@end