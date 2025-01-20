@interface PXChangePersonAssetsSortOrderAction
- (PHPerson)person;
- (PXChangePersonAssetsSortOrderAction)initWithPerson:(id)a3 sortOrder:(int64_t)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (int64_t)originalSortOrder;
- (int64_t)sortOrder;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXChangePersonAssetsSortOrderAction

- (void).cxx_destruct
{
}

- (int64_t)originalSortOrder
{
  return self->_originalSortOrder;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXChangePersonAssetsSortOrderAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __51__PXChangePersonAssetsSortOrderAction_performUndo___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F39200];
  v3 = [*(id *)(a1 + 32) person];
  id v4 = [v2 changeRequestForPerson:v3];

  objc_msgSend(v4, "setAssetSortOrder:", objc_msgSend(*(id *)(a1 + 32), "originalSortOrder"));
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PXChangePersonAssetsSortOrderAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __53__PXChangePersonAssetsSortOrderAction_performAction___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F39200];
  v3 = [*(id *)(a1 + 32) person];
  id v4 = [v2 changeRequestForPerson:v3];

  objc_msgSend(v4, "setAssetSortOrder:", objc_msgSend(*(id *)(a1 + 32), "sortOrder"));
}

- (id)actionNameLocalizationKey
{
  v2 = [(PXChangePersonAssetsSortOrderAction *)self person];
  v3 = +[PXPeopleUtilities locKeyForPersonOrPet:v2 withVisibility:0 key:@"PXPhotosGridsPeopleSortActionName"];

  return v3;
}

- (id)actionIdentifier
{
  return @"ChangePersonSortOrder";
}

- (PXChangePersonAssetsSortOrderAction)initWithPerson:(id)a3 sortOrder:(int64_t)a4
{
  id v7 = a3;
  v8 = [v7 photoLibrary];
  v11.receiver = self;
  v11.super_class = (Class)PXChangePersonAssetsSortOrderAction;
  v9 = [(PXPhotosAction *)&v11 initWithPhotoLibrary:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    v9->_sortOrder = a4;
    v9->_originalSortOrder = [v7 assetSortOrder];
  }

  return v9;
}

@end