@interface PXChangePersonKeyFaceAction
- (PHFace)keyFace;
- (PHPerson)person;
- (PXChangePersonKeyFaceAction)initWithPerson:(id)a3 asset:(id)a4;
- (PXChangePersonKeyFaceAction)initWithPerson:(id)a3 keyFace:(id)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)analyticsEventName;
- (void)_fetchKeyFaceForUndoIfNeeded;
- (void)_invalidateCache;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXChangePersonKeyFaceAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_keyFaceForUndo, 0);
  objc_storeStrong((id *)&self->_keyFace, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PHPerson)person
{
  return self->_person;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PXChangePersonKeyFaceAction_performUndo___block_invoke;
  v8[3] = &unk_1E5DD36F8;
  v8[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PXChangePersonKeyFaceAction_performUndo___block_invoke_2;
  v6[3] = &unk_1E5DD2B90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXPhotosAction *)self performChanges:v8 completionHandler:v6];
}

void __43__PXChangePersonKeyFaceAction_performUndo___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F39200];
  v3 = [*(id *)(a1 + 32) person];
  id v4 = [v2 changeRequestForPerson:v3];

  [v4 setKeyFace:*(void *)(*(void *)(a1 + 32) + 104)];
}

uint64_t __43__PXChangePersonKeyFaceAction_performUndo___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _invalidateCache];
  }
  return result;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PXChangePersonKeyFaceAction_performAction___block_invoke;
  v8[3] = &unk_1E5DD36F8;
  v8[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PXChangePersonKeyFaceAction_performAction___block_invoke_2;
  v6[3] = &unk_1E5DD2B90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXPhotosAction *)self performChanges:v8 completionHandler:v6];
}

void __45__PXChangePersonKeyFaceAction_performAction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchKeyFaceForUndoIfNeeded];
  v2 = (void *)MEMORY[0x1E4F39200];
  v3 = [*(id *)(a1 + 32) person];
  id v5 = [v2 changeRequestForPerson:v3];

  id v4 = [*(id *)(a1 + 32) keyFace];
  [v5 setKeyFace:v4];
}

uint64_t __45__PXChangePersonKeyFaceAction_performAction___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _invalidateCache];
  }
  return result;
}

- (id)analyticsEventName
{
  return @"com.apple.photos.CPAnalytics.people.detailView.keyPhotoChanged";
}

- (id)actionNameLocalizationKey
{
  return @"PXPeopleMakeKeyPhoto";
}

- (id)actionIdentifier
{
  return @"ChangePersonKeyFace";
}

- (void)_fetchKeyFaceForUndoIfNeeded
{
  if (!self->_keyFaceForUndo)
  {
    id v5 = [(PXChangePersonKeyFaceAction *)self person];
    v3 = +[PXPeopleUtilities keyFaceForPerson:v5];
    keyFaceForUndo = self->_keyFaceForUndo;
    self->_keyFaceForUndo = v3;
  }
}

- (void)_invalidateCache
{
  id v4 = +[PXPeopleFaceCropManager sharedManager];
  v3 = [(PXChangePersonKeyFaceAction *)self person];
  [v4 invalidateCacheForPerson:v3];
}

- (PHFace)keyFace
{
  v10[1] = *MEMORY[0x1E4F143B8];
  keyFace = self->_keyFace;
  if (!keyFace)
  {
    if (self->_asset)
    {
      id v4 = [(PXChangePersonKeyFaceAction *)self person];
      v10[0] = self->_asset;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      v6 = +[PXPeopleUtilities facesForPerson:v4 inAssets:v5];
      id v7 = [v6 firstObject];
      v8 = self->_keyFace;
      self->_keyFace = v7;

      keyFace = self->_keyFace;
    }
    else
    {
      keyFace = 0;
    }
  }
  return keyFace;
}

- (PXChangePersonKeyFaceAction)initWithPerson:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 photoLibrary];
  v12.receiver = self;
  v12.super_class = (Class)PXChangePersonKeyFaceAction;
  v10 = [(PXPhotosAction *)&v12 initWithPhotoLibrary:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
  }

  return v10;
}

- (PXChangePersonKeyFaceAction)initWithPerson:(id)a3 keyFace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 photoLibrary];
  v12.receiver = self;
  v12.super_class = (Class)PXChangePersonKeyFaceAction;
  v10 = [(PXPhotosAction *)&v12 initWithPhotoLibrary:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    objc_storeStrong((id *)&v10->_keyFace, a4);
  }

  return v10;
}

@end