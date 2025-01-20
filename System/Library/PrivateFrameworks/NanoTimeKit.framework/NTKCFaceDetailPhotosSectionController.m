@interface NTKCFaceDetailPhotosSectionController
+ (BOOL)hasPhotosSectionForFace:(id)a3 forEditMode:(int64_t)a4;
- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4;
- (BOOL)_handleDidSelectActionRowForOption:(id)a3;
- (BOOL)_handleDidSelectOption:(id)a3;
- (BOOL)canAddFace;
- (BOOL)hasChanges;
- (Class)actionRowCellClass;
- (NSArray)externalAssets;
- (NTKCFaceDetailPhotosSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7 externalAssets:(id)a8;
- (NTKCompanionCustomPhotosEditor)customPhotosEditor;
- (NTKCompanionMemoriesEditor)memoriesEditor;
- (NTKCompanionSyncedAlbumEditor)syncedAlbumEditor;
- (NTKCompanionTransientCustomPhotosEditor)transientEditor;
- (UIViewController)parentViewController;
- (id)_actionNameForOption:(id)a3;
- (id)_currentEditor;
- (unint64_t)contentType;
- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4;
- (void)_setPhotos:(id)a3;
- (void)_updatePhotosSection;
- (void)albumChooserDidFinish:(id)a3;
- (void)customPhotosControllerDidFinish:(id)a3;
- (void)faceDidChange;
- (void)faceDidChangeResourceDirectory;
- (void)saveChangesWithCompletion:(id)a3;
- (void)setCustomPhotosEditor:(id)a3;
- (void)setExternalAssets:(id)a3;
- (void)setMemoriesEditor:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setSelectedOptions:(id)a3;
- (void)setSyncedAlbumEditor:(id)a3;
- (void)setTransientEditor:(id)a3;
@end

@implementation NTKCFaceDetailPhotosSectionController

+ (BOOL)hasPhotosSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  uint64_t v5 = [a3 faceStyle];
  return a4 == 12 && v5 == 22;
}

- (NTKCFaceDetailPhotosSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7 externalAssets:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    id v19 = [v16 filteredCollectionWithObjectsPassingTest:&__block_literal_global_134];
  }
  else
  {
    id v19 = v16;
  }
  v20 = v19;
  v24.receiver = self;
  v24.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  v21 = [(NTKCFaceDetailEditOptionVerticalSectionController *)&v24 initWithTableViewController:v14 face:v15 inGallery:v11 editOptionCollection:v19 faceView:v17];
  v22 = v21;
  if (v21) {
    [(NTKCFaceDetailPhotosSectionController *)v21 setExternalAssets:v18];
  }

  return v22;
}

BOOL __129__NTKCFaceDetailPhotosSectionController_initWithTableViewController_face_inGallery_editOptionCollection_faceView_externalAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 photosContent] == 1;
}

- (Class)actionRowCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canAddFace
{
  v3 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
  v4 = NSNumber;
  uint64_t v5 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "mode"));
  v7 = [v3 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 photosContent];
  if (v8) {
    BOOL v9 = v8 == 2;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    BOOL v10 = 1;
  }
  else if (v8 == 1)
  {
    transientEditor = self->_transientEditor;
    if (!transientEditor) {
      transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
    }
    BOOL v10 = [(NTKCompanionTransientCustomPhotosEditor *)transientEditor photosCount] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)contentType
{
  return self->_currentContent;
}

- (void)faceDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  [(NTKCFaceDetailEditOptionVerticalSectionController *)&v3 faceDidChange];
  [(NTKCFaceDetailPhotosSectionController *)self _updatePhotosSection];
}

- (void)faceDidChangeResourceDirectory
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  [(NTKCFaceDetailSectionController *)&v3 faceDidChangeResourceDirectory];
  [(NTKCFaceDetailPhotosSectionController *)self _updatePhotosSection];
}

- (void)setSelectedOptions:(id)a3
{
  v107.receiver = self;
  v107.super_class = (Class)NTKCFaceDetailPhotosSectionController;
  id v4 = a3;
  [(NTKCFaceDetailEditOptionVerticalSectionController *)&v107 setSelectedOptions:v4];
  BOOL v5 = *(_OWORD *)&self->_syncedAlbumEditor == 0 && !self->_customPhotosEditor && self->_transientEditor == 0;
  v6 = NSNumber;
  v7 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  uint64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "mode"));
  BOOL v9 = [v4 objectForKeyedSubscript:v8];

  if (v5 || (unint64_t currentContent = self->_currentContent, currentContent != [v9 photosContent]))
  {
    unint64_t v11 = [v9 photosContent];
    self->_unint64_t currentContent = v11;
    if (v11)
    {
      if (v11 != 2)
      {
        if (v11 != 1)
        {
LABEL_65:
          [(NTKCFaceDetailEditOptionVerticalSectionController *)self reloadActionRow];
          goto LABEL_66;
        }
        v12 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_PHOTOS_OPTION_DESCRIPTION", @"Photos");
        [(NTKCFaceDetailEditOptionVerticalSectionController *)self setFooter:v12];

        externalAssets = self->_externalAssets;
        if (externalAssets)
        {
          id v14 = [(NSArray *)externalAssets firstObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            transientEditor = self->_transientEditor;
            if (!transientEditor)
            {
              id v17 = [NTKCompanionTransientCustomPhotosEditor alloc];
              id v18 = [(NTKCFaceDetailSectionController *)self face];
              id v19 = [v18 device];
              v20 = [(NTKCompanionTransientCustomPhotosEditor *)v17 initWithResourceDirectory:0 forDevice:v19];
              [(NTKCFaceDetailPhotosSectionController *)self setTransientEditor:v20];

              [(NTKCompanionTransientCustomPhotosEditor *)self->_transientEditor addImageList:self->_externalAssets];
              transientEditor = self->_transientEditor;
            }
            v21 = [(NTKCompanionResourceDirectoryEditor *)transientEditor galleryPreviewResourceDirectory];

            v22 = self->_transientEditor;
            if (!v21)
            {
              v106[0] = MEMORY[0x1E4F143A8];
              v106[1] = 3221225472;
              v106[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke;
              v106[3] = &unk_1E62C19C8;
              v106[4] = self;
              v23 = v106;
LABEL_64:
              [v22 generateGalleryPreviewResourceDirectoryWithCompletion:v23];
              goto LABEL_65;
            }
            goto LABEL_33;
          }
        }
        if (v5)
        {
          v36 = self->_externalAssets;
          if (v36)
          {
            v37 = [(NSArray *)v36 firstObject];
            objc_opt_class();
            char v38 = objc_opt_isKindOfClass();

            if (v38)
            {
              v39 = [NTKCompanionCustomPhotosEditor alloc];
              v40 = [(NTKCFaceDetailSectionController *)self face];
              v41 = [v40 device];
              v42 = [(NTKCompanionCustomPhotosEditor *)v39 initWithResourceDirectory:0 forDevice:v41];
              customPhotosEditor = self->_customPhotosEditor;
              self->_customPhotosEditor = v42;

              [(NTKCompanionCustomPhotosEditor *)self->_customPhotosEditor addAssetsFromAssetList:self->_externalAssets];
              v22 = self->_customPhotosEditor;
              v105[0] = MEMORY[0x1E4F143A8];
              v105[1] = 3221225472;
              v105[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_2;
              v105[3] = &unk_1E62C19C8;
              v105[4] = self;
              v23 = v105;
              goto LABEL_64;
            }
          }
          v82 = [NTKCompanionCustomPhotosEditor alloc];
          v26 = [(NTKCFaceDetailSectionController *)self face];
          v27 = [v26 resourceDirectory];
          v28 = [(NTKCFaceDetailSectionController *)self face];
          v29 = [v28 device];
          v34 = [(NTKCompanionCustomPhotosEditor *)v82 initWithResourceDirectory:v27 forDevice:v29];
          uint64_t v35 = 160;
          goto LABEL_46;
        }
        BOOL v63 = [(NTKCFaceDetailSectionController *)self inGallery];
        v64 = self->_customPhotosEditor;
        if (v63)
        {
          if (!v64)
          {
            v65 = [NTKCompanionCustomPhotosEditor alloc];
            v66 = [(NTKCFaceDetailSectionController *)self face];
            v67 = [v66 device];
            v68 = [(NTKCompanionCustomPhotosEditor *)v65 initWithResourceDirectory:0 forDevice:v67];
            v69 = self->_customPhotosEditor;
            self->_customPhotosEditor = v68;

            v64 = self->_customPhotosEditor;
          }
          v70 = [(NTKCompanionResourceDirectoryEditor *)v64 galleryPreviewResourceDirectory];

          v71 = self->_customPhotosEditor;
          if (v70)
          {
            uint64_t v72 = [(NTKCompanionResourceDirectoryEditor *)v71 galleryPreviewResourceDirectory];
          }
          else
          {
            v97 = [(NTKCompanionResourceDirectoryEditor *)v71 resourceDirectory];

            v98 = self->_customPhotosEditor;
            if (!v97)
            {
              v104[0] = MEMORY[0x1E4F143A8];
              v104[1] = 3221225472;
              v104[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_3;
              v104[3] = &unk_1E62C19C8;
              v104[4] = self;
              [(NTKCompanionCustomPhotosEditor *)v98 generateGalleryPreviewResourceDirectoryWithCompletion:v104];
              goto LABEL_60;
            }
            uint64_t v72 = [(NTKCompanionResourceDirectoryEditor *)v98 resourceDirectory];
          }
          v89 = (void *)v72;
          v99 = [(NTKCFaceDetailSectionController *)self face];
          [v99 setResourceDirectory:v89];
        }
        else
        {
          if (!v64)
          {
            v84 = [NTKCompanionCustomPhotosEditor alloc];
            v85 = [(NTKCFaceDetailSectionController *)self face];
            v86 = [v85 device];
            v87 = [(NTKCompanionCustomPhotosEditor *)v84 initWithResourceDirectory:0 forDevice:v86];
            v88 = self->_customPhotosEditor;
            self->_customPhotosEditor = v87;
          }
          v89 = [(NTKCFaceDetailSectionController *)self face];
          [v89 setResourceDirectory:0];
        }

LABEL_60:
        if (!self->_externalAssets
          && ![(NTKCompanionCustomPhotosEditor *)self->_customPhotosEditor photosCount])
        {
          [(NTKCFaceDetailPhotosSectionController *)self _handleDidSelectActionRowForOption:v9];
        }
        goto LABEL_65;
      }
      v32 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_DYNAMIC_OPTION_DESCRIPTION", @"Dynamic");
      [(NTKCFaceDetailEditOptionVerticalSectionController *)self setFooter:v32];

      if (v5)
      {
        v33 = [NTKCompanionMemoriesEditor alloc];
        v26 = [(NTKCFaceDetailSectionController *)self face];
        v27 = [v26 resourceDirectory];
        v28 = [(NTKCFaceDetailSectionController *)self face];
        v29 = [v28 device];
        v34 = [(NTKCompanionSinglePHAssetEditor *)v33 initWithResourceDirectory:v27 forDevice:v29 shouldFinalize:[(NTKCFaceDetailSectionController *)self inGallery]];
        uint64_t v35 = 176;
LABEL_46:
        v83 = *(Class *)((char *)&self->super.super.super.super.isa + v35);
        *(Class *)((char *)&self->super.super.super.super.isa + v35) = v34;

        goto LABEL_47;
      }
      BOOL v53 = [(NTKCFaceDetailSectionController *)self inGallery];
      memoriesEditor = self->_memoriesEditor;
      if (v53)
      {
        if (!memoriesEditor)
        {
          v54 = [NTKCompanionMemoriesEditor alloc];
          v55 = [(NTKCFaceDetailSectionController *)self face];
          v56 = [v55 device];
          v57 = [(NTKCompanionSinglePHAssetEditor *)v54 initWithResourceDirectory:0 forDevice:v56 shouldFinalize:1];
          v58 = self->_memoriesEditor;
          self->_memoriesEditor = v57;

          memoriesEditor = self->_memoriesEditor;
        }
        v59 = [memoriesEditor galleryPreviewResourceDirectory];

        v22 = self->_memoriesEditor;
        if (v59)
        {
LABEL_33:
          uint64_t v60 = [v22 galleryPreviewResourceDirectory];
LABEL_34:
          v61 = (void *)v60;
          v62 = [(NTKCFaceDetailSectionController *)self face];
          [v62 setResourceDirectory:v61];

          goto LABEL_65;
        }
        v90 = [v22 resourceDirectory];

        v22 = self->_memoriesEditor;
        if (!v90)
        {
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_6;
          v101[3] = &unk_1E62C19C8;
          v101[4] = self;
          v23 = v101;
          goto LABEL_64;
        }
LABEL_52:
        uint64_t v60 = [v22 resourceDirectory];
        goto LABEL_34;
      }
      if (memoriesEditor)
      {
LABEL_44:
        v80 = [memoriesEditor resourceDirectory];
        v81 = [(NTKCFaceDetailSectionController *)self face];
        [v81 setResourceDirectory:v80];

LABEL_55:
        v96 = self->_customPhotosEditor;
        self->_customPhotosEditor = 0;

        goto LABEL_65;
      }
      v91 = [NTKCompanionMemoriesEditor alloc];
      v92 = [(NTKCFaceDetailSectionController *)self face];
      v93 = [v92 device];
      v94 = [(NTKCompanionSinglePHAssetEditor *)v91 initWithResourceDirectory:0 forDevice:v93 shouldFinalize:1];
      v95 = self->_memoriesEditor;
      self->_memoriesEditor = v94;

      v78 = self->_memoriesEditor;
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_7;
      v100[3] = &unk_1E62C19C8;
      v100[4] = self;
      v79 = v100;
    }
    else
    {
      objc_super v24 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_SYNCED_ALBUM_OPTION_DESCRIPTION", @"Synced Album");
      [(NTKCFaceDetailEditOptionVerticalSectionController *)self setFooter:v24];

      if (v5)
      {
        v25 = [NTKCompanionSyncedAlbumEditor alloc];
        v26 = [(NTKCFaceDetailSectionController *)self face];
        v27 = [v26 resourceDirectory];
        v28 = [(NTKCFaceDetailSectionController *)self face];
        v29 = [v28 device];
        v30 = [(NTKCompanionSinglePHAssetEditor *)v25 initWithResourceDirectory:v27 forDevice:v29 shouldFinalize:[(NTKCFaceDetailSectionController *)self inGallery]];
        syncedAlbumEditor = self->_syncedAlbumEditor;
        self->_syncedAlbumEditor = v30;

LABEL_47:
        goto LABEL_65;
      }
      BOOL v44 = [(NTKCFaceDetailSectionController *)self inGallery];
      memoriesEditor = self->_syncedAlbumEditor;
      if (v44)
      {
        if (!memoriesEditor)
        {
          v46 = [NTKCompanionSyncedAlbumEditor alloc];
          v47 = [(NTKCFaceDetailSectionController *)self face];
          v48 = [v47 device];
          v49 = [(NTKCompanionSinglePHAssetEditor *)v46 initWithResourceDirectory:0 forDevice:v48 shouldFinalize:1];
          v50 = self->_syncedAlbumEditor;
          self->_syncedAlbumEditor = v49;

          memoriesEditor = self->_syncedAlbumEditor;
        }
        v51 = [memoriesEditor galleryPreviewResourceDirectory];

        v22 = self->_syncedAlbumEditor;
        if (v51) {
          goto LABEL_33;
        }
        v52 = [v22 resourceDirectory];

        v22 = self->_syncedAlbumEditor;
        if (!v52)
        {
          v103[0] = MEMORY[0x1E4F143A8];
          v103[1] = 3221225472;
          v103[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_4;
          v103[3] = &unk_1E62C19C8;
          v103[4] = self;
          v23 = v103;
          goto LABEL_64;
        }
        goto LABEL_52;
      }
      if (memoriesEditor) {
        goto LABEL_44;
      }
      v73 = [NTKCompanionSyncedAlbumEditor alloc];
      v74 = [(NTKCFaceDetailSectionController *)self face];
      v75 = [v74 device];
      v76 = [(NTKCompanionSinglePHAssetEditor *)v73 initWithResourceDirectory:0 forDevice:v75 shouldFinalize:1];
      v77 = self->_syncedAlbumEditor;
      self->_syncedAlbumEditor = v76;

      v78 = self->_syncedAlbumEditor;
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_5;
      v102[3] = &unk_1E62C19C8;
      v102[4] = self;
      v79 = v102;
    }
    [v78 finalizeWithCompletion:v79];
    goto LABEL_55;
  }
LABEL_66:
}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

void __60__NTKCFaceDetailPhotosSectionController_setSelectedOptions___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4
{
  id v6 = a4;
  if (!self->_externalAssets) {
    goto LABEL_5;
  }
  transientEditor = self->_transientEditor;
  if (!transientEditor) {
    transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
  }
  if (![(NTKCompanionTransientCustomPhotosEditor *)transientEditor photosCount])
  {
    BOOL v8 = 0;
  }
  else
  {
LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)NTKCFaceDetailPhotosSectionController;
    BOOL v8 = [(NTKCFaceDetailEditOptionSectionController *)&v10 _canDisplayActionRowForCustomEditMode:a3 andOption:v6];
  }

  return v8;
}

- (BOOL)_handleDidSelectOption:(id)a3
{
  id v4 = a3;
  if ([v4 photosContent] == 1 || -[NTKCFaceDetailSectionController inGallery](self, "inGallery")) {
    goto LABEL_6;
  }
  if (self->_currentContent != 1 || self->_canDeleteCustomPhotos)
  {
    self->_canDeleteCustomPhotos = 0;
LABEL_6:
    BOOL v5 = 1;
    goto LABEL_7;
  }
  if ([v4 photosContent])
  {
    if ([v4 photosContent] != 2)
    {
      objc_super v10 = 0;
      goto LABEL_14;
    }
    BOOL v8 = @"PHOTOS_DELETE_CUSTOM_FOR_MEMORY_MESSAGE";
    BOOL v9 = @"delete for memory custom message";
  }
  else
  {
    BOOL v8 = @"PHOTOS_DELETE_CUSTOM_FOR_SYNCED_ALBUM_MESSAGE";
    BOOL v9 = @"delete for synced album custom message";
  }
  objc_super v10 = NTKCCustomizationLocalizedString(v8, (uint64_t)v9, v7);
LABEL_14:
  unint64_t v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v10 preferredStyle:0];
  if ([(NTKCompanionCustomPhotosEditor *)self->_customPhotosEditor photosCount] == 1) {
    v12 = @"_SINGULAR";
  }
  else {
    v12 = @"_PLURAL";
  }
  v13 = [@"PHOTOS_DELETE_BUTTON" stringByAppendingString:v12];
  id v15 = NTKCCustomizationLocalizedString(v13, @"Delete Confirmation", v14);

  id v16 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __64__NTKCFaceDetailPhotosSectionController__handleDidSelectOption___block_invoke;
  v26 = &unk_1E62C8100;
  v27 = self;
  id v28 = v4;
  id v17 = [v16 actionWithTitle:v15 style:2 handler:&v23];
  objc_msgSend(v11, "addAction:", v17, v23, v24, v25, v26, v27);

  id v18 = (void *)MEMORY[0x1E4FB1410];
  v20 = NTKCCustomizationLocalizedString(@"PHOTOS_CANCEL_BUTTON", @"Cancel", v19);
  v21 = [v18 actionWithTitle:v20 style:1 handler:0];
  [v11 addAction:v21];

  v22 = [(NTKCFaceDetailPhotosSectionController *)self parentViewController];
  [v22 presentViewController:v11 animated:1 completion:0];

  BOOL v5 = 0;
LABEL_7:

  return v5;
}

uint64_t __64__NTKCFaceDetailPhotosSectionController__handleDidSelectOption___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 1;
  v2 = [*(id *)(a1 + 32) actionRow];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) rows];
    id v4 = [*(id *)(a1 + 32) actionRow];
    uint64_t v5 = [v3 indexOfObject:v4];
  }
  else
  {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  id v6 = [*(id *)(a1 + 32) collection];
  uint64_t v7 = [v6 options];
  uint64_t v8 = [v7 indexOfObject:*(void *)(a1 + 40)];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v8 < v5) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v8 + 1;
  }
  unint64_t v11 = *(void **)(a1 + 32);
  return [v11 didSelectRow:v10];
}

- (BOOL)_handleDidSelectActionRowForOption:(id)a3
{
  id v4 = a3;
  if ([v4 photosContent] == 1)
  {
    if ([(NTKCompanionCustomPhotosEditor *)self->_customPhotosEditor photosCount]
      || [(NTKCompanionTransientCustomPhotosEditor *)self->_transientEditor photosCount])
    {
      transientEditor = self->_transientEditor;
      if (!transientEditor) {
        transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
      }
      id v6 = transientEditor;
      uint64_t v7 = [NTKCFaceDetailCustomPhotosViewController alloc];
      uint64_t v8 = [(NTKCFaceDetailSectionController *)self face];
      BOOL v9 = [(NTKCFaceDetailSectionController *)self inGallery];
      uint64_t v10 = [(NTKCFaceDetailEditOptionSectionController *)self faceView];
      unint64_t v11 = [(NTKCFaceDetailCustomPhotosViewController *)v7 initWithPhotosEditor:v6 forFace:v8 inGallery:v9 faceView:v10 externalImagesSet:self->_externalAssets != 0];

      [(NTKCFaceDetailCustomPhotosViewController *)v11 setDelegate:self];
      v12 = [(NTKCFaceDetailPhotosSectionController *)self parentViewController];

      [v12 presentViewController:v11 animated:1 completion:0];
    }
    else
    {
      unint64_t v11 = [(NTKCFaceDetailPhotosSectionController *)self parentViewController];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __76__NTKCFaceDetailPhotosSectionController__handleDidSelectActionRowForOption___block_invoke;
      v20[3] = &unk_1E62C8128;
      v20[4] = self;
      +[NTKCPhotosAddController presentPhotosAddControllerFromViewController:v11 selectionLimit:24 withCompletion:v20];
    }

    goto LABEL_11;
  }
  if (![v4 photosContent])
  {
    uint64_t v14 = [NTKCFaceDetailAlbumChooserViewController alloc];
    syncedAlbumEditor = self->_syncedAlbumEditor;
    id v16 = [(NTKCFaceDetailSectionController *)self face];
    id v17 = [(NTKCFaceDetailAlbumChooserViewController *)v14 initWithPhotosEditor:syncedAlbumEditor forFace:v16 inGallery:[(NTKCFaceDetailSectionController *)self inGallery]];

    [(NTKCFaceDetailAlbumChooserViewController *)v17 setDelegate:self];
    id v18 = [(NTKCFaceDetailPhotosSectionController *)self parentViewController];
    [v18 presentViewController:v17 animated:1 completion:0];

LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

uint64_t __76__NTKCFaceDetailPhotosSectionController__handleDidSelectActionRowForOption___block_invoke(uint64_t a1)
{
  return 0;
}

- (id)_actionNameForOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 photosContent] == 1)
    {
      transientEditor = self->_transientEditor;
      if (!transientEditor) {
        transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
      }
      uint64_t v7 = transientEditor;
      uint64_t v8 = [(NTKCompanionTransientCustomPhotosEditor *)v7 photosCount];
      if (v8)
      {
        uint64_t v10 = v8;
        unint64_t v11 = NSString;
        v12 = NTKCCustomizationLocalizedFormat(@"PHOTOS_NUMBER", @"%d Photos", v9);
        BOOL v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
      }
      else
      {
        v17.receiver = self;
        v17.super_class = (Class)NTKCFaceDetailPhotosSectionController;
        BOOL v13 = [(NTKCFaceDetailEditOptionSectionController *)&v17 _actionNameForOption:v5];
      }
    }
    else
    {
      BOOL v13 = 0;
    }
    if (![v5 photosContent])
    {
      uint64_t v14 = [(NTKCompanionSinglePHAssetEditor *)self->_syncedAlbumEditor albumName];

      BOOL v13 = (void *)v14;
      if (!v14)
      {
        v16.receiver = self;
        v16.super_class = (Class)NTKCFaceDetailPhotosSectionController;
        BOOL v13 = [(NTKCFaceDetailEditOptionSectionController *)&v16 _actionNameForOption:v5];
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKCFaceDetailPhotosSectionController;
    BOOL v13 = [(NTKCFaceDetailEditOptionSectionController *)&v18 _actionNameForOption:v4];
  }

  return v13;
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(NTKCFaceDetailPhotosSectionController *)self _actionNameForOption:v6];
    uint64_t v8 = [v14 textLabel];
    [v8 setText:v7];

    if ([v6 photosContent])
    {
      transientEditor = self->_transientEditor;
      if (!transientEditor) {
        transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
      }
      if ([(NTKCompanionTransientCustomPhotosEditor *)transientEditor photosCount]) {
        goto LABEL_6;
      }
    }
    else
    {
      v12 = [(NTKCompanionSinglePHAssetEditor *)self->_syncedAlbumEditor albumName];

      if (v12)
      {
LABEL_6:
        uint64_t v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        uint64_t v11 = 1;
LABEL_9:
        BOOL v13 = [v14 textLabel];
        [v13 setTextColor:v10];

        [v14 setAccessoryType:v11];
        goto LABEL_10;
      }
    }
    uint64_t v10 = NTKCActionColor();
    uint64_t v11 = 0;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_setPhotos:(id)a3
{
  [(NTKCompanionCustomPhotosEditor *)self->_customPhotosEditor addPhotosFromUIImagePicker:a3];
  [(NTKCFaceDetailPhotosSectionController *)self _updatePhotosSection];
  if ([(NTKCFaceDetailSectionController *)self inGallery])
  {
    customPhotosEditor = self->_customPhotosEditor;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__NTKCFaceDetailPhotosSectionController__setPhotos___block_invoke;
    v5[3] = &unk_1E62C19C8;
    v5[4] = self;
    [(NTKCompanionCustomPhotosEditor *)customPhotosEditor generateGalleryPreviewResourceDirectoryWithCompletion:v5];
  }
  else
  {
    [(NTKCFaceDetailPhotosSectionController *)self saveChangesWithCompletion:0];
  }
}

void __52__NTKCFaceDetailPhotosSectionController__setPhotos___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 face];
  [v5 setResourceDirectory:v4];

  id v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) face];
    uint64_t v8 = [v7 resourceDirectory];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "updated preview directory for custom face to %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_updatePhotosSection
{
  unint64_t currentContent = self->_currentContent;
  if (currentContent == 1)
  {
    transientEditor = self->_transientEditor;
    if (!transientEditor) {
      transientEditor = (NTKCompanionTransientCustomPhotosEditor *)self->_customPhotosEditor;
    }
    uint64_t v5 = [(NTKCompanionTransientCustomPhotosEditor *)transientEditor photosCount];
    id v6 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];

    if (v6)
    {
      if (self->_externalAssets) {
        BOOL v7 = v5 == 0;
      }
      else {
        BOOL v7 = 0;
      }
      if (v7) {
        [(NTKCFaceDetailEditOptionVerticalSectionController *)self reloadActionRow];
      }
      else {
        [(NTKCFaceDetailEditOptionSectionController *)self _refreshActionRowContent];
      }
    }
    unint64_t currentContent = self->_currentContent;
  }
  if (!currentContent)
  {
    uint64_t v8 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];

    if (v8)
    {
      [(NTKCFaceDetailEditOptionSectionController *)self _refreshActionRowContent];
      [(NTKCFaceDetailEditOptionVerticalSectionController *)self reloadActionRow];
    }
  }
  id v9 = [(NTKCFaceDetailEditOptionSectionController *)self delegate];
  [v9 photoSectionDidUpdate:self];
}

- (id)_currentEditor
{
  unint64_t currentContent = self->_currentContent;
  switch(currentContent)
  {
    case 0uLL:
      id v3 = &OBJC_IVAR___NTKCFaceDetailPhotosSectionController__syncedAlbumEditor;
      goto LABEL_8;
    case 1uLL:
      transientEditor = self->_transientEditor;
      if (transientEditor)
      {
LABEL_9:
        uint64_t v5 = transientEditor;
        goto LABEL_11;
      }
      id v3 = &OBJC_IVAR___NTKCFaceDetailPhotosSectionController__customPhotosEditor;
LABEL_8:
      transientEditor = *(NTKCompanionTransientCustomPhotosEditor **)((char *)&self->super.super.super.super.isa + *v3);
      goto LABEL_9;
    case 2uLL:
      id v3 = &OBJC_IVAR___NTKCFaceDetailPhotosSectionController__memoriesEditor;
      goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_11:
  return v5;
}

- (BOOL)hasChanges
{
  v2 = [(NTKCFaceDetailPhotosSectionController *)self _currentEditor];
  BOOL v3 = [v2 state] == 2;

  return v3;
}

- (void)saveChangesWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(NTKCFaceDetailPhotosSectionController *)self hasChanges])
  {
    uint64_t v5 = [(NTKCFaceDetailPhotosSectionController *)self _currentEditor];
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __67__NTKCFaceDetailPhotosSectionController_saveChangesWithCompletion___block_invoke;
      v6[3] = &unk_1E62C8150;
      v6[4] = self;
      BOOL v7 = v4;
      [v5 finalizeWithCompletion:v6];
    }
    else if (v4)
    {
      v4[2](v4);
    }
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

void __67__NTKCFaceDetailPhotosSectionController_saveChangesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _updatePhotosSection];
    id v4 = [*(id *)(a1 + 32) face];
    [v4 setResourceDirectory:v3];

    uint64_t v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) face];
      BOOL v7 = [v6 resourceDirectory];
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "finalizeWithCompletion: new face resource directory is %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (void)customPhotosControllerDidFinish:(id)a3
{
  id v4 = a3;
  [(NTKCFaceDetailPhotosSectionController *)self _updatePhotosSection];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)albumChooserDidFinish:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 editor];
    BOOL v7 = [v6 albumIdentifier];
    *(_DWORD *)buf = 138412290;
    objc_super v16 = v7;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "-[NTKCFaceDetailPhotosSectionController albumChooserDidFinish:] chose asset collection %@", buf, 0xCu);
  }
  uint64_t v8 = [v4 editor];
  uint64_t v9 = [v8 state];

  if (v9 != 1)
  {
    int v10 = [v4 inGallery];
    uint64_t v11 = [v4 editor];
    v12 = v11;
    if (v10)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke;
      v14[3] = &unk_1E62C19C8;
      v14[4] = self;
      [v11 generateGalleryPreviewResourceDirectoryWithCompletion:v14];
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke_2;
      v13[3] = &unk_1E62C19C8;
      v13[4] = self;
      [v11 finalizeWithCompletion:v13];
    }
  }
  [v4 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 face];
  [v5 setResourceDirectory:v4];

  id v6 = *(void **)(a1 + 32);
  return [v6 _updatePhotosSection];
}

uint64_t __63__NTKCFaceDetailPhotosSectionController_albumChooserDidFinish___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 face];
  [v5 setResourceDirectory:v4];

  id v6 = *(void **)(a1 + 32);
  return [v6 _updatePhotosSection];
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (NTKCompanionCustomPhotosEditor)customPhotosEditor
{
  return self->_customPhotosEditor;
}

- (void)setCustomPhotosEditor:(id)a3
{
}

- (NTKCompanionSyncedAlbumEditor)syncedAlbumEditor
{
  return self->_syncedAlbumEditor;
}

- (void)setSyncedAlbumEditor:(id)a3
{
}

- (NTKCompanionMemoriesEditor)memoriesEditor
{
  return self->_memoriesEditor;
}

- (void)setMemoriesEditor:(id)a3
{
}

- (NTKCompanionTransientCustomPhotosEditor)transientEditor
{
  return self->_transientEditor;
}

- (void)setTransientEditor:(id)a3
{
}

- (NSArray)externalAssets
{
  return self->_externalAssets;
}

- (void)setExternalAssets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAssets, 0);
  objc_storeStrong((id *)&self->_transientEditor, 0);
  objc_storeStrong((id *)&self->_memoriesEditor, 0);
  objc_storeStrong((id *)&self->_syncedAlbumEditor, 0);
  objc_storeStrong((id *)&self->_customPhotosEditor, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
}

@end