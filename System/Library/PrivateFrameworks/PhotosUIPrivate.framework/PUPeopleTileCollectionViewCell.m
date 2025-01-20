@interface PUPeopleTileCollectionViewCell
+ (CGSize)itemSizeForTraitCollection:(id)a3;
+ (OS_dispatch_queue)sharedContactFetchQueue;
+ (void)_fetchContactInfoForPerson:(id)a3 completion:(id)a4;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5;
- (CGSize)previousContentViewSize;
- (PHAsset)asset;
- (PHPerson)person;
- (PUPeopleTileCollectionViewCell)initWithFrame:(CGRect)a3;
- (PUPeopleTileDelegate)peopleDelegate;
- (PXPhotoKitAssetCollectionActionManager)personActionManager;
- (UIButton)menuButton;
- (UIGraphicsImageRenderer)renderer;
- (UIImageView)avatarImageView;
- (UIView)questionView;
- (UIView)shadowView;
- (id)_reviewActionForPerson:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)undoManagerForActionPerformer:(id)a3;
- (void)_customizeAlbumActionTapped:(id)a3;
- (void)_displayAvatarImageRequestResult:(id)a3 faceRect:(CGRect)a4 person:(id)a5 error:(id)a6;
- (void)_fetchAvatarImageForPerson:(id)a3;
- (void)_fetchContactImageForPerson:(id)a3 contact:(id)a4;
- (void)_makeKeyPhotoActionTapped:(id)a3 asset:(id)a4;
- (void)_nameActionTapped:(id)a3;
- (void)_reloadAvatarImageViewForPerson:(id)a3;
- (void)_setPerson:(id)a3 asset:(id)a4 reloadAvatar:(BOOL)a5;
- (void)_setupActionsForPerson:(id)a3 asset:(id)a4;
- (void)_showAlbumActionTapped:(id)a3;
- (void)_unnameActionTapped:(id)a3 asset:(id)a4;
- (void)accessibilityInvertColorsStatusDidChange:(id)a3;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)layoutSubviews;
- (void)refreshPerson;
- (void)setAsset:(id)a3;
- (void)setPeopleDelegate:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPerson:(id)a3 asset:(id)a4;
- (void)setPersonActionManager:(id)a3;
- (void)setPreviousContentViewSize:(CGSize)a3;
- (void)setQuestionView:(id)a3;
- (void)setRenderer:(id)a3;
@end

@implementation PUPeopleTileCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personActionManager, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_questionView, 0);
  objc_destroyWeak((id *)&self->_peopleDelegate);
}

- (void)setPersonActionManager:(id)a3
{
}

- (PXPhotoKitAssetCollectionActionManager)personActionManager
{
  return self->_personActionManager;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPreviousContentViewSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_previousContentViewSize, &v3, 16, 1, 0);
}

- (CGSize)previousContentViewSize
{
  objc_copyStruct(v4, &self->_previousContentViewSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setRenderer:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (UIButton)menuButton
{
  return self->_menuButton;
}

- (void)setQuestionView:(id)a3
{
}

- (UIView)questionView
{
  return self->_questionView;
}

- (void)setPeopleDelegate:(id)a3
{
}

- (PUPeopleTileDelegate)peopleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peopleDelegate);
  return (PUPeopleTileDelegate *)WeakRetained;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  v5 = [a3 actionType];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F90DE8]];

  if (a4 == 30)
  {
    if (v6)
    {
      [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.tilingView.featureLessTapped" withPayload:MEMORY[0x1E4F1CC08]];
      px_dispatch_on_main_queue();
    }
  }
}

uint64_t __65__PUPeopleTileCollectionViewCell_actionPerformer_didChangeState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshPerson];
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = [a4 presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:v6];

  return 1;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 2)
  {
    v10 = [(PUPeopleTileCollectionViewCell *)self peopleDelegate];
    [v10 presentPeopleViewController:v9];
  }
  else
  {
    if (a5 != 1)
    {
      BOOL v11 = 0;
      goto LABEL_7;
    }
    v10 = [(PUPeopleTileCollectionViewCell *)self peopleDelegate];
    [v10 pushPeopleViewController:v9];
  }

  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  return 0;
}

- (void)_makeKeyPhotoActionTapped:(id)a3 asset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    id v8 = PXAssertGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Expected to have a person and asset pair for make key photo action", buf, 2u);
    }
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F90040]) initWithPerson:v5 asset:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PUPeopleTileCollectionViewCell__makeKeyPhotoActionTapped_asset___block_invoke;
  v12[3] = &unk_1E5F2D4B8;
  id v13 = v5;
  id v14 = v7;
  id v10 = v7;
  id v11 = v5;
  [v9 executeWithUndoManager:0 completionHandler:v12];
}

void __66__PUPeopleTileCollectionViewCell__makeKeyPhotoActionTapped_asset___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLOneUpGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) localIdentifier];
      id v9 = [*(id *)(a1 + 40) localIdentifier];
      int v14 = 138412546;
      v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      id v10 = "Make Key Photo succeeded from 1up for person %@ asset %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [*(id *)(a1 + 32) localIdentifier];
    id v9 = [*(id *)(a1 + 40) localIdentifier];
    int v14 = 138412802;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    id v10 = "Make Key Photo failed from 1up for person %@ asset %@. Error: %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
    goto LABEL_6;
  }
}

- (void)_nameActionTapped:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F903F8];
  id v5 = a3;
  id v14 = [v4 contextWithPerson:v5 type:1];
  uint64_t v6 = [MEMORY[0x1E4F90428] isPersonHiddenFromPeopleHome:v5];

  [v14 setWantsToBeAddedToPeopleAlbum:v6];
  v7 = NSString;
  id v8 = [MEMORY[0x1E4F28F80] processInfo];
  id v9 = [v8 processName];
  id v10 = [@"/Library/Caches/com.apple.xbs/Sources/Photos_UIPrivate/Projects/PhotosUI/PhotosUI/iOS/People Tile/PUPeopleTileCollectionViewCell.m" lastPathComponent];
  id v11 = [v7 stringWithFormat:@"%@:%@:%s:%d", v9, v10, "-[PUPeopleTileCollectionViewCell _nameActionTapped:]", 466];
  [v14 setCallerInfo:v11];

  os_log_type_t v12 = [MEMORY[0x1E4F90428] bootstrapViewControllerForContext:v14 delegate:0];
  uint32_t v13 = [(PUPeopleTileCollectionViewCell *)self peopleDelegate];
  [v13 presentPeopleViewController:v12];

  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.tilingView.nameTapped" withPayload:MEMORY[0x1E4F1CC08]];
}

- (void)_unnameActionTapped:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4F90428];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __60__PUPeopleTileCollectionViewCell__unnameActionTapped_asset___block_invoke;
  v15 = &unk_1E5F2D490;
  objc_copyWeak(&v16, &location);
  id v9 = [v8 alertControllerForUntaggingPerson:v6 asset:v7 completion:&v12];
  objc_msgSend(v9, "setModalPresentationStyle:", 7, v12, v13, v14, v15);
  id v10 = [v9 popoverPresentationController];
  [v10 setSourceView:self];
  [(PUPeopleTileCollectionViewCell *)self bounds];
  objc_msgSend(v10, "setSourceRect:");
  id v11 = [(PUPeopleTileCollectionViewCell *)self peopleDelegate];
  [v11 presentPeopleViewController:v9];

  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.tilingView.untagTapped" withPayload:MEMORY[0x1E4F1CC08]];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__PUPeopleTileCollectionViewCell__unnameActionTapped_asset___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    double v3 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v3);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained(v3);
      id v6 = [v5 peopleDelegate];
      [v6 presentPeopleViewController:v7];
    }
  }
}

- (void)_customizeAlbumActionTapped:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v3 = (objc_class *)MEMORY[0x1E4F904C0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  id v7 = (void *)[v5 initWithPeople:v6];
  id v8 = [v7 actionPerformerForActionType:*MEMORY[0x1E4F90FC0]];
  id v9 = PXPresentationEnvironmentForSender();
  [v8 setPresentationEnvironment:v9];

  [v8 performActionWithCompletionHandler:0];
}

- (void)_showAlbumActionTapped:(id)a3
{
  id v4 = a3;
  id v8 = [(PUPeopleTileCollectionViewCell *)self peopleDelegate];
  id v5 = (void *)MEMORY[0x1E4F90428];
  id v6 = [v8 allPeople];
  id v7 = [v5 makeLemonadeDetailViewControllerForPerson:v4 allPeople:v6];

  [v8 presentPeopleViewController:v7];
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.tilingView.showAlbumTapped" withPayload:MEMORY[0x1E4F1CC08]];
}

- (id)_reviewActionForPerson:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = PXLemonadeLocalizedString();
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.rectangle.stack"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PUPeopleTileCollectionViewCell__reviewActionForPerson___block_invoke;
  v11[3] = &unk_1E5F2D440;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  id v9 = [v5 actionWithTitle:v6 image:v7 identifier:0 handler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __57__PUPeopleTileCollectionViewCell__reviewActionForPerson___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _customizeAlbumActionTapped:*(void *)(a1 + 32)];
}

- (void)_setupActionsForPerson:(id)a3 asset:(id)a4
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPeopleTileCollectionViewCell.m", 340, @"%s must be called on the main thread", "-[PUPeopleTileCollectionViewCell _setupActionsForPerson:asset:]");
  }
  objc_initWeak(location, self);
  id v9 = [(PUPeopleTileCollectionViewCell *)self personActionManager];
  v50 = [v9 standardActionForActionType:*MEMORY[0x1E4F90DE8]];

  id v10 = objc_msgSend(v7, "px_localizedName");
  v46 = v10;
  if ([v10 length])
  {
    id v11 = PXLocalizedStringForPersonOrPetAndVisibility();
    v43 = v10;
    v53 = PXStringWithValidatedFormat();
  }
  else
  {
    v53 = PXLocalizedString();
  }
  id v12 = (void *)MEMORY[0x1E4FB13F0];
  id v13 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"rectangle.stack", v43);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke;
  v62[3] = &unk_1E5F2D440;
  objc_copyWeak(&v64, location);
  id v14 = v7;
  id v63 = v14;
  v48 = [v12 actionWithTitle:v53 image:v13 identifier:0 handler:v62];

  v52 = PXLocalizedString();
  v51 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.stack.person.crop"];
  v15 = (void *)MEMORY[0x1E4FB13F0];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_2;
  v58[3] = &unk_1E5F2D468;
  objc_copyWeak(&v61, location);
  id v16 = v14;
  id v59 = v16;
  id v45 = v8;
  id v60 = v45;
  v49 = [v15 actionWithTitle:v52 image:v51 identifier:0 handler:v58];
  v17 = [(PUPeopleTileCollectionViewCell *)self personActionManager];
  __int16 v18 = [v17 standardActionForActionType:*MEMORY[0x1E4F90E08]];

  if (v18)
  {
    id v19 = (void *)MEMORY[0x1E4FB1970];
    v73[0] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:1];
    uint64_t v21 = [v19 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v20];
  }
  else
  {
    uint64_t v21 = 0;
  }
  v47 = [(PUPeopleTileCollectionViewCell *)self _reviewActionForPerson:v16];
  v22 = [v16 name];
  v44 = (void *)v21;
  if ([v22 length])
  {
    v23 = (void *)MEMORY[0x1E4FB13F0];
    v24 = PXLocalizedString();
    v25 = PXStringWithValidatedFormat();
    v26 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"person.crop.circle.badge.xmark", v46);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_3;
    v54[3] = &unk_1E5F2D468;
    objc_copyWeak(&v57, location);
    id v55 = v16;
    id v56 = v45;
    v27 = [v23 actionWithTitle:v25 image:v26 identifier:0 handler:v54];

    [v27 setAttributes:2];
    id v28 = v22;
    v29 = (void *)MEMORY[0x1E4FB1970];
    v72[0] = v50;
    v72[1] = v27;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    v31 = [v29 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v30];

    if (v18
      && (v32 = (void *)MEMORY[0x1E4FB1970],
          v71 = v18,
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1],
          v33 = objc_claimAutoreleasedReturnValue(),
          [v32 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v33],
          v34 = objc_claimAutoreleasedReturnValue(),
          v33,
          v34))
    {
      v70[0] = v34;
      v70[1] = v48;
      v70[2] = v49;
      v70[3] = v47;
      v70[4] = v31;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];
    }
    else
    {
      v69[0] = v48;
      v69[1] = v49;
      v69[2] = v47;
      v69[3] = v31;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:4];
    }

    objc_destroyWeak(&v57);
  }
  else
  {
    v36 = (void *)MEMORY[0x1E4FB1970];
    v68 = v50;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    v38 = [v36 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v37];

    if (v44)
    {
      v66[1] = v44;
      v66[2] = v48;
      v66[3] = v49;
      v66[4] = v47;
      v39 = &v67;
    }
    else
    {
      location[1] = v48;
      location[2] = v49;
      location[3] = v47;
      v39 = v66;
    }
    uint64_t *v39 = (uint64_t)v38;
    v35 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

    id v28 = 0;
  }
  if (v18) {
    [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 children:v35];
  }
  else {
  v40 = [MEMORY[0x1E4FB1970] menuWithTitle:v28 children:v35];
  }
  v41 = [(PUPeopleTileCollectionViewCell *)self menuButton];
  [v41 setMenu:v40];

  objc_destroyWeak(&v61);
  objc_destroyWeak(&v64);

  objc_destroyWeak(location);
}

void __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showAlbumActionTapped:*(void *)(a1 + 32)];
}

void __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _makeKeyPhotoActionTapped:*(void *)(a1 + 32) asset:*(void *)(a1 + 40)];
}

void __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _unnameActionTapped:*(void *)(a1 + 32) asset:*(void *)(a1 + 40)];
}

- (UIGraphicsImageRenderer)renderer
{
  renderer = self->_renderer;
  if (!renderer)
  {
    id v4 = [(PUPeopleTileCollectionViewCell *)self traitCollection];
    +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:v4];
    double v6 = v5;
    double v8 = v7;

    id v9 = (UIGraphicsImageRenderer *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v6, v8);
    id v10 = self->_renderer;
    self->_renderer = v9;

    renderer = self->_renderer;
  }
  return renderer;
}

- (void)_displayAvatarImageRequestResult:(id)a3 faceRect:(CGRect)a4 person:(id)a5 error:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(PUPeopleTileCollectionViewCell *)self person];

  if (v16 == v14)
  {
    if (v13)
    {
      v17 = [(PUPeopleTileCollectionViewCell *)self avatarImageView];
      [v17 frame];
      double v19 = v18;
      uint64_t v20 = [v17 layer];
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      BOOL v21 = CGRectEqualToRect(v40, *MEMORY[0x1E4F91340]);
      BOOL v22 = !v21;
      [v20 setMasksToBounds:v22];
      double v23 = v19 * 0.5;
      BOOL v24 = !v21;
      if (v21) {
        uint64_t v25 = 4;
      }
      else {
        uint64_t v25 = 1;
      }
      if (v24) {
        double v26 = 1.0;
      }
      else {
        double v26 = 0.0;
      }
      if (!v24) {
        double v23 = 0.0;
      }
      [v20 setCornerRadius:v23];
      [v20 setBorderWidth:v26];
      objc_msgSend(v20, "setContentsRect:", x, y, width, height);
      [v17 setContentMode:v25];
      [v17 setBackgroundColor:0];
      if (v22)
      {
        [v17 setImage:v13];
      }
      else
      {
        v27 = [(PUPeopleTileCollectionViewCell *)self renderer];
        uint64_t v29 = MEMORY[0x1E4F143A8];
        uint64_t v30 = 3221225472;
        v31 = __89__PUPeopleTileCollectionViewCell__displayAvatarImageRequestResult_faceRect_person_error___block_invoke;
        v32 = &unk_1E5F2DBC0;
        double v34 = v19;
        id v33 = v13;
        id v28 = [v27 imageWithActions:&v29];
        -[NSObject setImage:](v17, "setImage:", v28, v29, v30, v31, v32);
      }
    }
    else
    {
      v17 = PLUIGetLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v20 = [v15 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v36 = v14;
      __int16 v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "No face image returned from face crop manager. Person: %@ - Error: %@", buf, 0x16u);
    }

    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __89__PUPeopleTileCollectionViewCell__displayAvatarImageRequestResult_faceRect_person_error___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (CGContext *)[a2 CGContext];
  double v4 = *(double *)(a1 + 40) + -2.0;
  v12.origin.CGFloat x = 1.0;
  v12.origin.CGFloat y = 1.0;
  v12.size.CGFloat width = v4;
  v12.size.CGFloat height = v4;
  CGRect v13 = CGRectInset(v12, -1.0, -1.0);
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGContextSetGrayFillColor(v3, 1.0, 1.0);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGContextFillEllipseInRect(v3, v14);
  id v9 = *(void **)(a1 + 32);
  return objc_msgSend(v9, "drawInRect:", 1.0, 1.0, v4, v4);
}

- (void)_fetchAvatarImageForPerson:(id)a3
{
  id v4 = a3;
  double v5 = [(PUPeopleTileCollectionViewCell *)self traitCollection];
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:v5];
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_alloc(MEMORY[0x1E4F90408]);
  [v5 displayScale];
  CGRect v12 = objc_msgSend(v10, "initWithPerson:targetSize:displayScale:", v4, v7, v9, v11);
  [v12 setCornerStyle:2];
  objc_initWeak(&location, self);
  CGRect v13 = [MEMORY[0x1E4F90410] sharedManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__PUPeopleTileCollectionViewCell__fetchAvatarImageForPerson___block_invoke;
  v15[3] = &unk_1E5F2D418;
  objc_copyWeak(&v17, &location);
  id v14 = v4;
  id v16 = v14;
  [v13 requestFaceCropForOptions:v12 resultHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __61__PUPeopleTileCollectionViewCell__fetchAvatarImageForPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v5;
  id v8 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __61__PUPeopleTileCollectionViewCell__fetchAvatarImageForPerson___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F90FA0]];
  double v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F90FA8]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 40);
  [v5 CGRectValue];
  objc_msgSend(WeakRetained, "_displayAvatarImageRequestResult:faceRect:person:error:", v4, *(void *)(a1 + 48), v2);
}

- (void)_fetchContactImageForPerson:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUPeopleTileCollectionViewCell *)self traitCollection];
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:v8];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [v8 layoutDirection];
  objc_initWeak(&location, self);
  id v14 = (void *)MEMORY[0x1E4F8FF58];
  [v8 displayScale];
  double v16 = v15;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__PUPeopleTileCollectionViewCell__fetchContactImageForPerson_contact___block_invoke;
  v18[3] = &unk_1E5F2D3C8;
  objc_copyWeak(&v20, &location);
  id v17 = v6;
  id v19 = v17;
  objc_msgSend(v14, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v7, v13 == 1, 0, v18, v10, v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __70__PUPeopleTileCollectionViewCell__fetchContactImageForPerson_contact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v5;
  id v8 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __70__PUPeopleTileCollectionViewCell__fetchContactImageForPerson_contact___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_displayAvatarImageRequestResult:faceRect:person:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), 0, *MEMORY[0x1E4F91340], *(double *)(MEMORY[0x1E4F91340] + 8), *(double *)(MEMORY[0x1E4F91340] + 16), *(double *)(MEMORY[0x1E4F91340] + 24));
}

- (void)_reloadAvatarImageViewForPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPeopleTileCollectionViewCell *)self avatarImageView];
  id v6 = [v5 layer];
  [v5 frame];
  double v8 = v7;
  [v5 setImage:0];
  id v9 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setBackgroundColor:v9];

  [v6 setMasksToBounds:1];
  [v6 setCornerRadius:v8 * 0.5];
  [v6 setBorderWidth:1.0];
  objc_initWeak(&location, self);
  double v10 = objc_opt_class();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PUPeopleTileCollectionViewCell__reloadAvatarImageViewForPerson___block_invoke;
  v12[3] = &unk_1E5F2D3A0;
  objc_copyWeak(&v14, &location);
  id v11 = v4;
  id v13 = v11;
  [v10 _fetchContactInfoForPerson:v11 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__PUPeopleTileCollectionViewCell__reloadAvatarImageViewForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v6) {
    [WeakRetained _fetchContactImageForPerson:v5 contact:v6];
  }
  else {
    [WeakRetained _fetchAvatarImageForPerson:v5];
  }
}

- (void)refreshPerson
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F90428];
  id v4 = [(PUPeopleTileCollectionViewCell *)self person];
  uint64_t v5 = [v4 localIdentifier];
  v9[0] = *MEMORY[0x1E4F397E0];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  double v7 = [v3 personWithLocalIdentifier:v5 propertySets:v6];

  double v8 = [(PUPeopleTileCollectionViewCell *)self asset];
  [(PUPeopleTileCollectionViewCell *)self _setPerson:v7 asset:v8 reloadAvatar:0];
}

- (void)_setPerson:(id)a3 asset:(id)a4 reloadAvatar:(BOOL)a5
{
  BOOL v5 = a5;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_person, a3);
  objc_storeStrong((id *)&self->_asset, a4);
  if (v5) {
    [(PUPeopleTileCollectionViewCell *)self _reloadAvatarImageViewForPerson:v9];
  }
  id v11 = [(PUPeopleTileCollectionViewCell *)self questionView];
  double v12 = [v9 name];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = v11;
    uint64_t v15 = 1;
  }
  else
  {
    if (!v11)
    {
      double v16 = (void *)MEMORY[0x1E4FB1EB0];
      id v17 = [MEMORY[0x1E4FB1618] systemBlueColor];
      id v11 = objc_msgSend(v16, "px_circularGlyphViewWithName:backgroundColor:", @"questionmark.circle", v17);

      [(PUPeopleTileCollectionViewCell *)self setQuestionView:v11];
      double v18 = [(PUPeopleTileCollectionViewCell *)self contentView];
      [v18 addSubview:v11];
    }
    id v14 = v11;
    uint64_t v15 = 0;
  }
  [v14 setHidden:v15];
  if (v9)
  {
    id v19 = [(PUPeopleTileCollectionViewCell *)self personActionManager];

    if (!v19)
    {
      id v20 = (void *)MEMORY[0x1E4F38EE8];
      BOOL v21 = [v9 photoLibrary];
      BOOL v22 = [v20 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:0 identifier:0 photoLibrary:v21];

      double v23 = (void *)[objc_alloc(MEMORY[0x1E4F90438]) initWithAssetCollection:v22 displayTitleInfo:0];
      [(PUPeopleTileCollectionViewCell *)self setPersonActionManager:v23];

      BOOL v24 = [(PUPeopleTileCollectionViewCell *)self personActionManager];
      [v24 setPerformerDelegate:self];
    }
  }
  id v25 = objc_alloc(MEMORY[0x1E4F39150]);
  v34[0] = v9;
  double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  v27 = [v9 photoLibrary];
  id v28 = [MEMORY[0x1E4F391F0] fetchType];
  uint64_t v29 = (void *)[v25 initWithObjects:v26 photoLibrary:v27 fetchType:v28 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  uint64_t v30 = [(PUPeopleTileCollectionViewCell *)self personActionManager];
  [v30 setPeople:v29];

  v31 = objc_msgSend(v9, "px_localizedName");
  if ([v31 length])
  {
    v32 = [(PUPeopleTileCollectionViewCell *)self menuButton];
    [v32 setAccessibilityLabel:v31];
  }
  else
  {
    v32 = PXLocalizedStringForPersonOrPetAndVisibility();
    id v33 = [(PUPeopleTileCollectionViewCell *)self menuButton];
    [v33 setAccessibilityLabel:v32];
  }
  [(PUPeopleTileCollectionViewCell *)self _setupActionsForPerson:v9 asset:v10];
}

- (void)setPerson:(id)a3 asset:(id)a4
{
}

- (void)accessibilityInvertColorsStatusDidChange:(id)a3
{
  if (UIAccessibilityIsInvertColorsEnabled()) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v7 = [MEMORY[0x1E4FB1618] blackColor];
  }
  uint64_t v4 = [v7 CGColor];
  BOOL v5 = [(PUPeopleTileCollectionViewCell *)self shadowView];
  id v6 = [v5 layer];
  [v6 setShadowColor:v4];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(PUPeopleTileCollectionViewCell *)self menuButton];
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(PUPeopleTileCollectionViewCell *)self menuButton];
  id v14 = objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);

  return v14;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PUPeopleTileCollectionViewCell;
  [(PUPeopleTileCollectionViewCell *)&v26 layoutSubviews];
  double v3 = [(PUPeopleTileCollectionViewCell *)self contentView];
  uint64_t v4 = [v3 effectiveUserInterfaceLayoutDirection];

  BOOL v5 = [(PUPeopleTileCollectionViewCell *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = [(PUPeopleTileCollectionViewCell *)self avatarImageView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  uint64_t v15 = [(PUPeopleTileCollectionViewCell *)self menuButton];
  objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

  double v16 = [(PUPeopleTileCollectionViewCell *)self shadowView];
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v13);

  if (v4 == 1) {
    double v17 = 0.0;
  }
  else {
    double v17 = v11 - v11 * 0.400000006;
  }
  double v18 = [(PUPeopleTileCollectionViewCell *)self questionView];
  objc_msgSend(v18, "setFrame:", v17, v13 - v11 * 0.400000006, v11 * 0.400000006, v11 * 0.400000006);

  [(PUPeopleTileCollectionViewCell *)self previousContentViewSize];
  if (v11 != v20 || v13 != v19)
  {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v11, v11, v11 * 0.5);
    id v21 = objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v21 CGPath];
    double v23 = [(PUPeopleTileCollectionViewCell *)self shadowView];
    BOOL v24 = [v23 layer];
    [v24 setShadowPath:v22];

    [(PUPeopleTileCollectionViewCell *)self setRenderer:0];
    id v25 = [(PUPeopleTileCollectionViewCell *)self person];
    [(PUPeopleTileCollectionViewCell *)self _reloadAvatarImageViewForPerson:v25];
  }
  -[PUPeopleTileCollectionViewCell setPreviousContentViewSize:](self, "setPreviousContentViewSize:", v11, v13);
}

- (PUPeopleTileCollectionViewCell)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PUPeopleTileCollectionViewCell;
  double v3 = -[PUPeopleTileCollectionViewCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [(PUPeopleTileCollectionViewCell *)v3 contentView];
    double v6 = (UIView *)objc_opt_new();
    double v7 = [(UIView *)v6 layer];
    if (UIAccessibilityIsInvertColorsEnabled()) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    id v8 = [MEMORY[0x1E4FB1618] blackColor];
    }
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    LODWORD(v9) = 1051931443;
    [v7 setShadowOpacity:v9];
    objc_msgSend(v7, "setShadowOffset:", 0.0, 1.0);
    [v7 setShadowRadius:4.0];
    shadowView = v4->_shadowView;
    v4->_shadowView = v6;
    double v11 = v6;

    [v5 addSubview:v11];
    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v4 selector:sel_accessibilityInvertColorsStatusDidChange_ name:*MEMORY[0x1E4FB2450] object:0];

    id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v14 = (UIImageView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v15 = [(UIImageView *)v14 layer];
    id v16 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    avatarImageView = v4->_avatarImageView;
    v4->_avatarImageView = v14;
    double v18 = v14;

    [v5 addSubview:v18];
    double v19 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    [(UIButton *)v19 setShowsMenuAsPrimaryAction:1];
    -[UIButton _setTouchInsets:](v19, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    menuButton = v4->_menuButton;
    v4->_menuButton = v19;
    id v21 = v19;

    [v5 addSubview:v21];
  }
  return v4;
}

+ (void)_fetchContactInfoForPerson:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [(id)objc_opt_class() sharedContactFetchQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke;
  v10[3] = &unk_1E5F2EA60;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  v10[0] = *MEMORY[0x1E4F1AF98];
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v4 = [v2 linkedContactWithKeysToFetch:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke_2;
  v7[3] = &unk_1E5F2EA60;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (OS_dispatch_queue)sharedContactFetchQueue
{
  if (sharedContactFetchQueue_onceToken != -1) {
    dispatch_once(&sharedContactFetchQueue_onceToken, &__block_literal_global_95543);
  }
  double v2 = (void *)sharedContactFetchQueue_contactFetchQueue;
  return (OS_dispatch_queue *)v2;
}

void __57__PUPeopleTileCollectionViewCell_sharedContactFetchQueue__block_invoke()
{
  double v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("OneUpPeopleContactFetchQueue", v2);
  v1 = (void *)sharedContactFetchQueue_contactFetchQueue;
  sharedContactFetchQueue_contactFetchQueue = (uint64_t)v0;
}

+ (CGSize)itemSizeForTraitCollection:(id)a3
{
  uint64_t v3 = PXUserInterfaceSizeClassFromUITraitCollection();
  double v4 = 32.0;
  if (v3 == 2) {
    double v4 = 40.0;
  }
  double v5 = v4;
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

@end