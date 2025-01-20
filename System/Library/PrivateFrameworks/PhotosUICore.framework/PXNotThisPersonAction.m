@interface PXNotThisPersonAction
- (BOOL)didSetPersonAsVerified;
- (PHPerson)person;
- (PXFastEnumeration)faces;
- (PXNotThisPersonAction)initWithPerson:(id)a3 assets:(id)a4;
- (PXNotThisPersonAction)initWithPerson:(id)a3 faces:(id)a4;
- (id)_assetsForLogging;
- (id)_facesForLogging;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)analyticsEventName;
- (id)assets;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setDidSetPersonAsVerified:(BOOL)a3;
@end

@implementation PXNotThisPersonAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)setDidSetPersonAsVerified:(BOOL)a3
{
  self->_didSetPersonAsVerified = a3;
}

- (BOOL)didSetPersonAsVerified
{
  return self->_didSetPersonAsVerified;
}

- (PHPerson)person
{
  return self->_person;
}

- (id)_assetsForLogging
{
  id v2 = [(PXNotThisPersonAction *)self assets];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v2;

    if (v3)
    {
      id v4 = [v3 fetchedObjects];
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v4 = v2;
  id v3 = 0;
LABEL_7:

  return v4;
}

- (id)_facesForLogging
{
  id v2 = [(PXNotThisPersonAction *)self faces];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v2;

    if (v3)
    {
      id v4 = [v3 fetchedObjects];
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v4 = v2;
  id v3 = 0;
LABEL_7:

  return v4;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXNotThisPersonAction *)self person];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__PXNotThisPersonAction_performUndo___block_invoke;
  v12[3] = &unk_1E5DD32A8;
  v12[4] = self;
  id v13 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__PXNotThisPersonAction_performUndo___block_invoke_2;
  v8[3] = &unk_1E5DD1B00;
  id v9 = v13;
  v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v13;
  [(PXPhotosAction *)self performChanges:v12 completionHandler:v8];
}

void __37__PXNotThisPersonAction_performUndo___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) faces];
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) didSetPersonAsVerified]) {
    [v2 setVerified:0];
  }
  [v2 removeRejectedFaces:v3];
  [v2 addFaces:v3];
}

void __37__PXNotThisPersonAction_performUndo___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = @"NO";
      if (a2) {
        id v7 = @"YES";
      }
      v8 = v7;
      uint64_t v10 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      id v11 = v8;
      v12 = [v9 _facesForLogging];
      id v13 = [*(id *)(a1 + 40) _assetsForLogging];

      int v14 = 138413314;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Not this person performUndo succeeded: %@ with error: %@. Person %@, faces: %@, assets: %@", (uint8_t *)&v14, 0x34u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXNotThisPersonAction *)self person];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__PXNotThisPersonAction_performAction___block_invoke;
  v12[3] = &unk_1E5DD32A8;
  v12[4] = self;
  id v13 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PXNotThisPersonAction_performAction___block_invoke_2;
  v8[3] = &unk_1E5DD1B00;
  id v9 = v13;
  uint64_t v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v13;
  [(PXPhotosAction *)self performChanges:v12 completionHandler:v8];
}

void __39__PXNotThisPersonAction_performAction___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) faces];
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 40) isVerified] & 1) == 0)
  {
    [v2 setVerified:1];
    [*(id *)(a1 + 32) setDidSetPersonAsVerified:1];
  }
  [v2 removeFaces:v3];
  [v2 addRejectedFaces:v3 forCluster:0];
}

void __39__PXNotThisPersonAction_performAction___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = @"NO";
      if (a2) {
        id v7 = @"YES";
      }
      v8 = v7;
      uint64_t v10 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      id v11 = v8;
      v12 = [v9 _facesForLogging];
      id v13 = [*(id *)(a1 + 40) _assetsForLogging];

      int v14 = 138413314;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Not this person performAction succeeded: %@ with error: %@. Person %@, faces: %@, assets: %@", (uint8_t *)&v14, 0x34u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)analyticsEventName
{
  return @"com.apple.photos.CPAnalytics.people.detailView.notThisPerson";
}

- (id)actionNameLocalizationKey
{
  id v3 = [(PXNotThisPersonAction *)self faces];
  uint64_t v4 = [v3 count];

  id v5 = [(PXNotThisPersonAction *)self person];
  if (v4 == 1) {
    id v6 = @"PXPersonRejectFaceActionName";
  }
  else {
    id v6 = @"PXPersonRejectFacesActionName";
  }
  id v7 = +[PXPeopleUtilities locKeyForPersonOrPet:v5 withVisibility:0 key:v6];

  return v7;
}

- (id)actionIdentifier
{
  return @"NotThisPerson";
}

- (id)assets
{
  return self->_assets;
}

- (PXFastEnumeration)faces
{
  faces = self->_faces;
  if (!faces)
  {
    uint64_t v4 = [(PXNotThisPersonAction *)self person];
    id v5 = [(PXNotThisPersonAction *)self assets];
    id v6 = +[PXPeopleUtilities facesForPerson:v4 inAssets:v5];
    id v7 = self->_faces;
    self->_faces = v6;

    faces = self->_faces;
  }
  return faces;
}

- (PXNotThisPersonAction)initWithPerson:(id)a3 assets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 photoLibrary];
  v14.receiver = self;
  v14.super_class = (Class)PXNotThisPersonAction;
  uint64_t v10 = [(PXPhotosAction *)&v14 initWithPhotoLibrary:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    uint64_t v11 = [v8 copy];
    assets = v10->_assets;
    v10->_assets = (PXFastEnumeration *)v11;
  }
  return v10;
}

- (PXNotThisPersonAction)initWithPerson:(id)a3 faces:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 photoLibrary];
  v14.receiver = self;
  v14.super_class = (Class)PXNotThisPersonAction;
  uint64_t v10 = [(PXPhotosAction *)&v14 initWithPhotoLibrary:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    uint64_t v11 = [v8 copy];
    faces = v10->_faces;
    v10->_faces = (PXFastEnumeration *)v11;
  }
  return v10;
}

@end