@interface PXPhotoKitAssetCollectionShowPersonInfoActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5;
+ (int64_t)actionTypeForPerson:(id)a3 outContact:(id *)a4;
+ (void)_createPersonInfoActionForPerson:(id)a3 traitCollection:(id)a4 handler:(id)a5 completion:(id)a6;
- (CNContactViewController)pushedContactViewController;
- (void)_handleUnlinkContactButton:(id)a3;
- (void)_performUserInteractionTaskWithType:(int64_t)a3 contact:(id)a4;
- (void)_popContactViewController;
- (void)_showContactDetailViewControllerForContact:(id)a3;
- (void)_showContactPicker;
- (void)_showNamingView;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)performUserInteractionTask;
- (void)setPushedContactViewController:(id)a3;
@end

@implementation PXPhotoKitAssetCollectionShowPersonInfoActionPerformer

+ (void)_createPersonInfoActionForPerson:(id)a3 traitCollection:(id)a4 handler:(id)a5 completion:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  id v41 = 0;
  uint64_t v14 = [a1 actionTypeForPerson:v10 outContact:&v41];
  id v15 = v41;
  switch(v14)
  {
    case 0:
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, @"PXPeopleInfoNameThisPerson");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "px_isHuman")) {
        v17 = @"person.crop.circle.badge.plus";
      }
      else {
        v17 = @"pawprint.fill";
      }
      v18 = [MEMORY[0x1E4FB1818] systemImageNamed:v17];
      v19 = +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:v16 image:v18 identifier:0 handler:v12];
      [v19 setType:0];
      v42 = v19;
      v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = &v42;
      goto LABEL_7;
    case 1:
      id v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.plus"];
      v18 = PXLocalizedStringFromTable(@"PXPeopleInfoLinkContactInfoAction", @"PhotosUICore");
      v19 = +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:v18 image:v16 identifier:0 handler:v12];
      [v19 setType:1];
      v43[0] = v19;
      v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = (void **)v43;
LABEL_7:
      v22 = [v20 arrayWithObjects:v21 count:1];
      v13[2](v13, v22);

      goto LABEL_16;
    case 2:
      if (v11)
      {
        [v11 displayScale];
        double v24 = v23;
        BOOL v25 = [v11 layoutDirection] == 1;
      }
      else
      {
        BOOL v25 = 0;
        double v24 = 1.0;
      }
      v28 = [MEMORY[0x1E4F391F0] fullNameFromContact:v15];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke;
      v35[3] = &unk_1E5DB9518;
      v36 = v28;
      id v38 = v12;
      uint64_t v40 = 2;
      id v37 = v15;
      v39 = v13;
      id v16 = v28;
      +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v37, v25, 1, v35, 48.0, 48.0, v24);

      v18 = v36;
      goto LABEL_16;
    case 3:
      if (v11)
      {
        [v11 displayScale];
        double v27 = v26;
      }
      else
      {
        double v27 = 1.0;
      }
      v29 = objc_msgSend(v10, "px_localizedName");
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke_2;
      v30[3] = &unk_1E5DB9540;
      v31 = v29;
      id v32 = v12;
      uint64_t v34 = 3;
      v33 = v13;
      id v16 = v29;
      +[PXActivityUtilities requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:](PXActivityUtilities, "requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:", v10, 1, v30, 48.0, 48.0, v27);

      v18 = v31;
LABEL_16:

      break;
    default:
      break;
  }
}

void __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:*(void *)(a1 + 32) image:a2 identifier:0 handler:*(void *)(a1 + 48)];
  [v3 setType:*(void *)(a1 + 64)];
  [v3 setContact:*(void *)(a1 + 40)];
  v4 = [*(id *)(a1 + 40) emailAddresses];
  if ([v4 count])
  {
    v5 = [v4 firstObject];
    v6 = [v5 value];
  }
  else
  {
    v5 = [*(id *)(a1 + 40) phoneNumbers];
    if ([v5 count])
    {
      v7 = [v5 firstObject];
      v8 = [v7 value];

      v6 = [v8 stringValue];
    }
    else
    {
      v6 = 0;
    }
  }

  [v3 setSubtitle:v6];
  uint64_t v9 = *(void *)(a1 + 56);
  v11[0] = v3;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke_2(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Failed to get image for named pet with error %@", buf, 0xCu);
    }
  }
  uint64_t v9 = +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:a1[4] image:v6 identifier:0 handler:a1[5]];
  [v9 setType:a1[7]];
  uint64_t v10 = a1[6];
  id v12 = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

+ (int64_t)actionTypeForPerson:(id)a3 outContact:(id *)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!objc_msgSend(v5, "px_isHuman")) {
    goto LABEL_6;
  }
  id v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  id v7 = objc_msgSend(MEMORY[0x1E4F1BBA8], "descriptorForRequiredKeys", v6);
  uint64_t v8 = *MEMORY[0x1E4F1AF98];
  v14[1] = v7;
  v14[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  id v10 = [v5 linkedContactWithKeysToFetch:v9];

  if (v10)
  {
    if (a4)
    {
      id v10 = v10;
      *a4 = v10;
    }
    int64_t v11 = 2;
  }
  else
  {
LABEL_6:
    id v12 = objc_msgSend(v5, "px_localizedName");
    id v10 = (id)[v12 length];

    if (v10)
    {
      id v10 = 0;
      if (objc_msgSend(v5, "px_isHuman")) {
        int64_t v11 = 1;
      }
      else {
        int64_t v11 = 3;
      }
    }
    else
    {
      int64_t v11 = 0;
    }
  }

  return v11;
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [v8 people];
  id v10 = [v9 firstObject];

  int64_t v11 = [v8 traitEnvironment];

  id v12 = [v11 traitCollection];

  v13 = (void *)MEMORY[0x1E4FB16B8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __124__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke;
  v19[3] = &unk_1E5DB94F0;
  id v20 = v10;
  id v21 = v12;
  id v22 = v7;
  id v23 = a1;
  id v14 = v7;
  id v15 = v12;
  id v16 = v10;
  v17 = [v13 elementWithUncachedProvider:v19];

  return v17;
}

uint64_t __124__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 56) _createPersonInfoActionForPerson:*(void *)(a1 + 32) traitCollection:*(void *)(a1 + 40) handler:*(void *)(a1 + 48) completion:a2];
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = objc_msgSend(a4, "people", a3);
  BOOL v5 = [v4 count] == 1;

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setPushedContactViewController:(id)a3
{
}

- (CNContactViewController)pushedContactViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushedContactViewController);
  return (CNContactViewController *)WeakRetained;
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v11 = 0;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "User selected contact for person from info action", v11, 2u);
  }

  id v7 = [(PXAssetCollectionActionPerformer *)self people];
  id v8 = [v7 firstObject];

  if (v8)
  {
    uint64_t v9 = [v8 photoLibrary];
    +[PXPeopleBootstrap nameAndVerifyPerson:v8 toContact:v5 photoLibrary:v9 completionHandler:&__block_literal_global_98806];

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Missing person to assign contact from info action");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v10];
  }
}

void __89__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer_contactPicker_didSelectContact___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to assign contact to person with error %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled contact picking from info action", v5, 2u);
  }

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

- (void)_popContactViewController
{
  v2 = [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self pushedContactViewController];
  v3 = [v2 navigationController];
  id v4 = [v3 topViewController];

  if (v4 == v2)
  {
    id v6 = (id)[v3 popViewControllerAnimated:1];
  }
  else
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Contact details view controller is not top most, which is unexpected. Will not dismiss", v7, 2u);
    }
  }
}

- (void)_handleUnlinkContactButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self pushedContactViewController];
  id v6 = [v5 contact];
  id v7 = [(PXAssetCollectionActionPerformer *)self people];
  uint64_t v8 = [v7 firstObject];

  objc_initWeak(&location, self);
  uint64_t v9 = PXPresentationEnvironmentForSender(v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__handleUnlinkContactButton___block_invoke;
  v10[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v11, &location);
  +[PXPeopleUtilities handleUnlinkContact:v6 person:v8 presentationEnvironment:v9 sourceItem:v4 handleUnlinkageInternally:1 completion:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __85__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__handleUnlinkContactButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _popContactViewController];
}

- (void)_showContactDetailViewControllerForContact:(id)a3
{
  id v5 = +[PXPeopleUtilities contactViewControllerForContact:a3 target:self selector:sel__handleUnlinkContactButton_];
  objc_setAssociatedObject(v5, sel__showContactDetailViewControllerForContact_, self, (void *)1);
  if ([(PXActionPerformer *)self pushViewController:v5])
  {
    [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self setPushedContactViewController:v5];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to push contact detail view controller");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v4];
  }
}

- (void)_showContactPicker
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BB80]);
  [v4 setDelegate:self];
  if (![(PXActionPerformer *)self presentViewController:v4])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present contact picker");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v3];
  }
}

- (void)_showNamingView
{
  v3 = [(PXAssetCollectionActionPerformer *)self people];
  id v9 = [v3 firstObject];

  id v4 = [(PXActionPerformer *)self presentationEnvironment];
  id v5 = +[PXPeopleNamingCreator namingViewControllerFor:v9 presentationEnvironment:v4];

  if ([(PXActionPerformer *)self presentViewController:v5])
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [v9 localIdentifier];
    uint64_t v8 = objc_msgSend(v6, "px_genericErrorWithDebugDescription:", @"Failed to present people naming view for person: %@", v7);
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v8];
  }
}

- (void)_performUserInteractionTaskWithType:(int64_t)a3 contact:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  switch(a3)
  {
    case 0:
    case 3:
      [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self _showNamingView];
      goto LABEL_5;
    case 1:
      [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self _showContactPicker];
      goto LABEL_5;
    case 2:
      [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self _showContactDetailViewControllerForContact:v6];
LABEL_5:
      id v6 = v7;
      break;
    default:
      break;
  }
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitAssetCollectionActionPerformer *)self sendingAction];
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  id v4 = v3;

  if (!v4)
  {
LABEL_6:
    id v7 = [(PXAssetCollectionActionPerformer *)self people];
    uint64_t v8 = [v7 firstObject];

    id v11 = 0;
    uint64_t v9 = [(id)objc_opt_class() actionTypeForPerson:v8 outContact:&v11];
    id v10 = v11;
    [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self _performUserInteractionTaskWithType:v9 contact:v10];

    id v4 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = [v4 type];
  id v6 = [v4 contact];
  [(PXPhotoKitAssetCollectionShowPersonInfoActionPerformer *)self _performUserInteractionTaskWithType:v5 contact:v6];

LABEL_7:
}

@end