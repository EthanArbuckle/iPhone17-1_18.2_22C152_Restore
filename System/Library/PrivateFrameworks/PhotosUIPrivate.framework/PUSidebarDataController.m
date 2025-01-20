@interface PUSidebarDataController
+ (id)_actionManagerWithActionType:(id)a3;
+ (id)_singleItemDataSourceManagerForCollection:(id)a3 context:(id)a4;
+ (id)fromMyMacAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4;
+ (id)myAlbumsDataSectionManagerForPhotoLibrary:(id)a3 context:(id)a4 hideAdd:(BOOL)a5;
+ (id)otherAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4;
+ (id)sharedAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4 hideAdd:(BOOL)a5;
+ (void)_prepareSectionConfiguration:(id)a3 assetsFilterPredicate:(id)a4;
- (UIImage)emptyAlbumPlaceholderImage;
- (id)backedPlusButtonImage;
- (id)makeSectionManagers;
- (id)sidebarCustomSymbolImageWithName:(id)a3 symbolColor:(id)a4 scale:(double)a5;
- (int64_t)_requestImageForAsset:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (int64_t)requestImageForItem:(id)a3 parentItem:(id)a4 completion:(id)a5;
- (void)appearanceDidChange;
- (void)setEmptyAlbumPlaceholderImage:(id)a3;
@end

@implementation PUSidebarDataController

- (void).cxx_destruct
{
}

- (void)setEmptyAlbumPlaceholderImage:(id)a3
{
}

- (id)sidebarCustomSymbolImageWithName:(id)a3 symbolColor:(id)a4 scale:(double)a5
{
  v6 = (void *)MEMORY[0x1E4FB1830];
  double v7 = a5 * 100.0;
  id v8 = a4;
  id v9 = a3;
  v10 = [v6 configurationWithPointSize:5 weight:v7];
  v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v9 withConfiguration:v10];

  v12 = [MEMORY[0x1E4FB1618] systemGray5Color];
  v13 = objc_msgSend(v11, "px_tintedImageWithColor:", v8);

  v14 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_centeredImage:withBackgroundColor:size:", v13, v12, 100.0, 100.0);

  return v14;
}

- (id)backedPlusButtonImage
{
  v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v4 = [(PUSidebarDataController *)self sidebarCustomSymbolImageWithName:@"plus" symbolColor:v3 scale:0.6];

  return v4;
}

- (UIImage)emptyAlbumPlaceholderImage
{
  emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  if (!emptyAlbumPlaceholderImage)
  {
    v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v5 = [(PUSidebarDataController *)self sidebarCustomSymbolImageWithName:@"photo.on.rectangle" symbolColor:v4 scale:0.5];
    v6 = self->_emptyAlbumPlaceholderImage;
    self->_emptyAlbumPlaceholderImage = v5;

    emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  }
  return emptyAlbumPlaceholderImage;
}

- (int64_t)_requestImageForAsset:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F91288] defaultManager];
  v12 = [v11 imageProviderForAsset:v9];

  id v13 = objc_alloc_init(MEMORY[0x1E4F91260]);
  [v13 setDeliveryMode:1];
  [v13 setResizeMode:2];
  v14 = [(PXSidebarDataController *)self beginRequestForMediaProvider:v12 mediaRequestIDs:0];
  objc_initWeak(&location, self);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __65__PUSidebarDataController__requestImageForAsset_size_completion___block_invoke;
  v25 = &unk_1E5F2DFA0;
  id v15 = v10;
  id v27 = v15;
  objc_copyWeak(&v28, &location);
  id v16 = v14;
  id v26 = v16;
  uint64_t v17 = objc_msgSend(v12, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 1, v13, &v22, width, height);
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28D60]);
    v19 = objc_msgSend(v18, "initWithIndex:", v17, v22, v23, v24, v25);
    [v16 setMediaRequestIDs:v19];
  }
  int64_t v20 = objc_msgSend(v16, "sidebarRequestID", v22, v23, v24, v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v20;
}

void __65__PUSidebarDataController__requestImageForAsset_size_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained cancelRequestDetails:*(void *)(a1 + 32)];
  }
}

- (int64_t)requestImageForItem:(id)a3 parentItem:(id)a4 completion:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v44 = a4;
  id v9 = a5;
  id v10 = PLSidebarGetLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  v12 = v10;
  id v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    id v18 = v13;
  }
  else
  {
    if (os_signpost_enabled(v12))
    {
      id v15 = [v8 identifier];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v15;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.sync", "itemIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v16 = v13;
    if (os_signpost_enabled(v16))
    {
      uint64_t v17 = [v8 identifier];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v17;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.async", "itemIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke;
  aBlock[3] = &unk_1E5F2DED8;
  v19 = v13;
  v62 = v19;
  os_signpost_id_t v64 = v11;
  id v43 = v9;
  id v63 = v43;
  int64_t v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = *MEMORY[0x1E4F91018];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_265;
  v54[3] = &unk_1E5F2DF00;
  id v21 = v8;
  id v55 = v21;
  v56 = self;
  uint64_t v22 = (void (**)(void))_Block_copy(v54);
  uint64_t v23 = +[PUTabbedLibrarySettings sharedInstance];
  int v24 = [v23 sidebarSymbolImagesOnly];

  if (v24)
  {
    v25 = v22[2](v22);
    v20[2](v20, v25);

    id v26 = v19;
    id v27 = v26;
    if (v14 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v27, OS_SIGNPOST_INTERVAL_END, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.sync", "", (uint8_t *)&buf, 2u);
    }

    int64_t v28 = v58[3];
  }
  else
  {
    v29 = [v21 collection];
    if (v44)
    {
      v30 = -[PXSidebarDataController dataSectionManagerForItem:](self, "dataSectionManagerForItem:");
    }
    else
    {
      v30 = 0;
    }
    if (objc_msgSend(v29, "px_isFolder"))
    {
      uint64_t v31 = objc_msgSend(v30, "auxiliaryObjectForKey:dataSectionObject:hintIndex:", *MEMORY[0x1E4F90F80], v21, 0x7FFFFFFFFFFFFFFFLL, v29, v30, v43);
      v32 = (void *)v31;
      v33 = (void *)MEMORY[0x1E4F1CBF0];
      if (v31) {
        v33 = (void *)v31;
      }
      id v34 = v33;

      objc_initWeak(&location, self);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__99122;
      v68 = __Block_byref_object_dispose__99123;
      id v69 = 0;
      v35 = [MEMORY[0x1E4FB1E20] traitCollectionWithDisplayScale:2.0];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_270;
      v52[3] = &unk_1E5F2DF28;
      v52[4] = self;
      v52[5] = &buf;
      v52[6] = &v57;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_2;
      v48[3] = &unk_1E5F2DF50;
      objc_copyWeak(&v51, &location);
      p_long long buf = &buf;
      v49 = v20;
      PUSidebarRequestFolderImageForAssets(v34, v35, v52, v48, 100.0, 100.0);

      objc_destroyWeak(&v51);
      _Block_object_dispose(&buf, 8);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v30, "auxiliaryObjectForKey:dataSectionObject:hintIndex:", *MEMORY[0x1E4F90F98], v21, 0x7FFFFFFFFFFFFFFFLL, v29, v30, v43);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_3;
        v45[3] = &unk_1E5F2DF78;
        v46 = v20;
        v47 = v22;
        int64_t v36 = -[PUSidebarDataController _requestImageForAsset:size:completion:](self, "_requestImageForAsset:size:completion:", v34, v45, 100.0, 100.0);
        v58[3] = v36;

        v37 = v46;
      }
      else
      {
        v37 = v22[2](v22);
        v20[2](v20, v37);
      }
    }
    v38 = v19;
    v39 = v38;
    if (v14 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v39, OS_SIGNPOST_INTERVAL_END, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.sync", "", (uint8_t *)&buf, 2u);
    }

    int64_t v28 = v58[3];
  }

  _Block_object_dispose(&v57, 8);
  return v28;
}

void __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)double v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PUSidebarDataController.requestImageForItem_parentItem_completion_.async", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_265(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) glyphImageName];
  if ([v2 isEqual:*MEMORY[0x1E4F90F90]])
  {
    uint64_t v3 = [*(id *)(a1 + 40) backedPlusButtonImage];
    goto LABEL_5;
  }
  if ([v2 isEqual:*MEMORY[0x1E4F90F88]])
  {
    uint64_t v3 = [*(id *)(a1 + 40) emptyAlbumPlaceholderImage];
LABEL_5:
    v4 = (void *)v3;
    if (!v2) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  v4 = 0;
  if (!v2) {
    goto LABEL_12;
  }
LABEL_8:
  if (!v4)
  {
    int v5 = [*(id *)(a1 + 32) isEmbeddedGlyph];
    os_signpost_id_t v6 = (void *)MEMORY[0x1E4FB1818];
    if (v5)
    {
      double v7 = objc_msgSend(MEMORY[0x1E4F28B50], "px_bundle");
      v4 = [v6 imageNamed:v2 inBundle:v7];
    }
    else
    {
      v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:v2];
    }
  }
LABEL_12:

  return v4;
}

uint64_t __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) beginRequestForMediaProvider:a2 mediaRequestIDs:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sidebarRequestID];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained cancelRequestDetails:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
}

- (void)appearanceDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUSidebarDataController;
  [(PXSidebarDataController *)&v4 appearanceDidChange];
  emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  self->_emptyAlbumPlaceholderImage = 0;
}

- (id)makeSectionManagers
{
  uint64_t v3 = [(PXSidebarDataController *)self photoLibrary];
  objc_super v4 = [(PXSidebarDataController *)self context];
  unsigned int v5 = [(PXSidebarDataController *)self options];
  char v6 = [(PXSidebarDataController *)self options];
  double v7 = objc_msgSend(v3, "px_virtualCollections");
  id v8 = PLSidebarGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  id v10 = v8;
  os_signpost_id_t v11 = v10;
  unint64_t v52 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PUSidebarDataController.makeSectionManagers", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke;
  aBlock[3] = &unk_1E5F2DCF8;
  id v13 = v11;
  v87 = v13;
  id v14 = v12;
  id v88 = v14;
  id v15 = (void (**)(void *, const char *, void *))_Block_copy(aBlock);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_209;
  v81[3] = &unk_1E5F2DD20;
  id v16 = v13;
  v82 = v16;
  v83 = self;
  id v17 = v4;
  id v84 = v17;
  id v18 = v14;
  id v85 = v18;
  id v51 = (void (**)(void *, const char *, uint64_t, void *))_Block_copy(v81);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_211;
  v76[3] = &unk_1E5F2DD48;
  v49 = v16;
  v77 = v49;
  v78 = self;
  id v19 = v17;
  id v79 = v19;
  id v53 = v18;
  id v80 = v53;
  int64_t v20 = (void (**)(void *, const char *, void *, void))_Block_copy(v76);
  id v21 = [v7 momentsCollection];
  v20[2](v20, "photos", v21, 0);

  uint64_t v22 = [(PXSidebarDataController *)self pickerAllPhotosVirtualCollection];

  if (v22)
  {
    uint64_t v23 = [(PXSidebarDataController *)self pickerAllPhotosVirtualCollection];
    v20[2](v20, "all photos", v23, 20);
  }
  int v48 = (v5 >> 1) & 1;
  int v24 = objc_msgSend(v3, "px_assetCollectionForSmartAlbumWithSubtype:", 203, spid);
  v20[2](v20, "favorites", v24, 14);

  v25 = [v7 eventsCollection];
  v20[2](v20, "events", v25, 10);

  id v26 = [v7 peopleCollection];
  v20[2](v20, "people", v26, 19);

  id v27 = [v7 memoriesCollection];
  v20[2](v20, "memories", v27, 1);

  int64_t v28 = [v7 tripsCollection];
  v20[2](v20, "trips", v28, 9);

  v29 = [v7 featuredPhotosCollection];
  v20[2](v20, "featured", v29, 12);

  v30 = [v7 wallpaperSuggestionsCollection];
  v20[2](v20, "wallpaper", v30, 11);

  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_223;
  v74[3] = &unk_1E5F2DD70;
  id v31 = v3;
  id v75 = v31;
  v51[2](v51, "bookmarks", 13, v74);
  if (([(PXSidebarDataController *)self options] & 4) == 0)
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_2;
    v72[3] = &unk_1E5F2DD98;
    v72[4] = self;
    id v73 = v31;
    v15[2](v15, "devices", v72);
  }
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_3;
  v69[3] = &unk_1E5F2DDC0;
  id v32 = v31;
  id v70 = v32;
  BOOL v71 = (v6 & 4) != 0;
  v15[2](v15, "utility", v69);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_4;
  v66[3] = &unk_1E5F2DDE8;
  v66[4] = self;
  id v33 = v32;
  id v67 = v33;
  id v34 = v19;
  id v68 = v34;
  v15[2](v15, "fromMyMac", v66);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_5;
  v62[3] = &unk_1E5F2DE10;
  id v63 = v7;
  os_signpost_id_t v64 = self;
  SEL v65 = a2;
  v35 = v15[2];
  id v36 = v7;
  v35(v15, "mediaTypes", v62);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_7;
  v58[3] = &unk_1E5F2DE38;
  v58[4] = self;
  id v37 = v33;
  id v59 = v37;
  id v38 = v34;
  id v60 = v38;
  char v61 = v48;
  v15[2](v15, "myAlbums", v58);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_8;
  v54[3] = &unk_1E5F2DE60;
  void v54[4] = self;
  id v55 = v37;
  id v56 = v38;
  char v57 = v48;
  v39 = v15[2];
  id v40 = v38;
  id v41 = v37;
  v39(v15, "shared", v54);
  v42 = v49;
  id v43 = v42;
  if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v43, OS_SIGNPOST_INTERVAL_END, spida, "PUSidebarDataController.makeSectionManagers", "", buf, 2u);
  }

  id v44 = (void *)[v53 copy];
  return v44;
}

void __46__PUSidebarDataController_makeSectionManagers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = *(NSObject **)(a1 + 32);
  char v6 = a3;
  os_signpost_id_t v7 = os_signpost_id_generate(v5);
  id v8 = *(id *)(a1 + 32);
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v13 = 136315138;
    uint64_t v14 = a2;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PUSidebarDataController.makeSectionManagers.item", "item=%s", (uint8_t *)&v13, 0xCu);
  }

  id v10 = v6[2](v6);

  os_signpost_id_t v11 = *(id *)(a1 + 32);
  id v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v12, OS_SIGNPOST_INTERVAL_END, v7, "PUSidebarDataController.makeSectionManagers.item", "", (uint8_t *)&v13, 2u);
  }

  if (v10) {
    [*(id *)(a1 + 40) addObject:v10];
  }
}

void __46__PUSidebarDataController_makeSectionManagers__block_invoke_209(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v7 = a4;
  os_signpost_id_t v8 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  os_signpost_id_t v9 = *(id *)(a1 + 32);
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v16 = 136315138;
    uint64_t v17 = a2;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PUSidebarDataController.makeSectionManagers.item", "item=%s", (uint8_t *)&v16, 0xCu);
  }

  os_signpost_id_t v11 = [(id)objc_opt_class() _singleItemDataSourceManagerForCollection:0 context:*(void *)(a1 + 48)];
  id v12 = [*(id *)(a1 + 48) enablementProvider];
  [v12 configureEnablementOfSectionManager:v11 enablementItem:a3];

  int v13 = 0;
  if ([v11 isEnabled])
  {
    int v13 = v7[2](v7);
  }
  uint64_t v14 = *(id *)(a1 + 32);
  uint64_t v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PUSidebarDataController.makeSectionManagers.item", "", (uint8_t *)&v16, 2u);
  }

  if (v13) {
    [*(id *)(a1 + 56) addObject:v13];
  }
}

void __46__PUSidebarDataController_makeSectionManagers__block_invoke_211(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v7 = a1[4];
  id v8 = a3;
  os_signpost_id_t v9 = os_signpost_id_generate(v7);
  id v10 = a1[4];
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v16 = 136315138;
    uint64_t v17 = a2;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PUSidebarDataController.makeSectionManagers.item", "item=%s", (uint8_t *)&v16, 0xCu);
  }

  id v12 = [(id)objc_opt_class() _singleItemDataSourceManagerForCollection:v8 context:a1[6]];

  int v13 = [a1[6] enablementProvider];
  [v13 configureEnablementOfSectionManager:v12 enablementItem:a4];

  uint64_t v14 = a1[4];
  uint64_t v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v15, OS_SIGNPOST_INTERVAL_END, v9, "PUSidebarDataController.makeSectionManagers.item", "", (uint8_t *)&v16, 2u);
  }

  if ([v12 isEnabled]) {
    [a1[7] addObject:v12];
  }
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_223(uint64_t a1)
{
  return [MEMORY[0x1E4F906B8] makeTopCollectionsDataSectionManagerWithLibrary:*(void *)(a1 + 32)];
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 devicesDataSectionManagerForLibrary:v3];
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x1E4F906B8] makeUtilityTypesDataSectionManagerWithLibrary:*(void *)(a1 + 32) forPicker:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 fromMyMacAlbumsDataSectionManagerWithPhotoLibrary:v3 context:v4];
}

id __46__PUSidebarDataController_makeSectionManagers__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaTypesCollectionList];
  uint64_t v3 = [*(id *)(a1 + 40) mediaTypesSectionManager];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v15);
    int v16 = objc_msgSend(v3, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:v13, v14, @"PUSidebarDataController.m", 146, @"%@ should be an instance inheriting from %@, but it is %@", @"self.mediaTypesSectionManager", v12, v16 object file lineNumber description];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    os_signpost_id_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v8 handleFailureInMethod:v9, v10, @"PUSidebarDataController.m", 146, @"%@ should be an instance inheriting from %@, but it is nil", @"self.mediaTypesSectionManager", v12 object file lineNumber description];
  }

LABEL_3:
  id v4 = objc_alloc(MEMORY[0x1E4F903A8]);
  unsigned int v5 = (void *)[v4 initWithIdentifier:*MEMORY[0x1E4F91060] collection:v2];
  [v3 setOutlineObject:v5];

  [v3 setAllowsEmptyDataSection:1];
  if ([*(id *)(a1 + 40) options])
  {
    char v6 = [MEMORY[0x1E4F905E0] sharedScheduler];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_6;
    v17[3] = &unk_1E5F2ED10;
    id v18 = v3;
    [v6 scheduleTaskAfterCATransactionCommits:v17];
  }
  return v3;
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_7(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  return [v2 myAlbumsDataSectionManagerForPhotoLibrary:v3 context:v4 hideAdd:v5];
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_8(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  return [v2 sharedAlbumsDataSectionManagerWithPhotoLibrary:v3 context:v4 hideAdd:v5];
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAllowsEmptyDataSection:0];
}

+ (void)_prepareSectionConfiguration:(id)a3 assetsFilterPredicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PUTabbedLibrarySettings sharedInstance];
  objc_msgSend(v6, "setSimulateNonIncrementalChanges:", objc_msgSend(v7, "sidebarSimulateNonIncrementalChanges"));
  objc_msgSend(v6, "setPausedChangeDetailsBufferLength:", objc_msgSend(v7, "sidebarPausedChangeDetailsBufferLength"));
  [v6 setAssetsFilterPredicate:v5];
}

+ (id)fromMyMacAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLSidebarGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v10 = v8;
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PUSidebarDataController.makeSectionManagers.item", "item=fromMyMac, subItem=albumsFolder", buf, 2u);
  }

  id v12 = objc_msgSend(v6, "px_virtualCollections");
  uint64_t v13 = [v12 rootAlbumCollectionList];

  uint64_t v14 = [MEMORY[0x1E4F90398] configurationWithCollectionList:v13];
  uint64_t v15 = [v7 assetsFilterPredicate];

  [a1 _prepareSectionConfiguration:v14 assetsFilterPredicate:v15];
  [v14 setIncludeKeyAssetFetches:1];
  [v14 setShowSyncedFromMacAlbums:1];
  [v14 setSkipAssetFetches:1];
  [v14 setSkipAssetCountFetches:1];
  int v16 = (void *)[objc_alloc(MEMORY[0x1E4F903A0]) initWithConfiguration:v14];
  uint64_t v17 = v11;
  id v18 = v17;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v18, OS_SIGNPOST_INTERVAL_END, v9, "PUSidebarDataController.makeSectionManagers.item", "", buf, 2u);
  }

  id v19 = objc_alloc(MEMORY[0x1E4F906E0]);
  v45[0] = v16;
  int64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  id v21 = (void *)[v19 initWithChildDataSectionManagers:v20];

  uint64_t v22 = [MEMORY[0x1E4F90308] sharedInstance];
  int v23 = [v22 enableSidebarHeaderSelection];

  if (v23)
  {
    int v24 = objc_msgSend(v6, "px_virtualCollections");
    v25 = [v24 macSyncedAlbumsCollectionList];

    [v21 setAlwaysContainsObjects:1];
    id v26 = [v25 transientIdentifier];
    id v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [v25 localIdentifier];
    }
    v30 = v28;

    id v31 = (void *)[objc_alloc(MEMORY[0x1E4F903A8]) initWithIdentifier:v30 collection:v25];
    [v21 setOutlineObject:v31];
  }
  else
  {
    [v21 setEnabled:0];
    id v29 = objc_alloc(MEMORY[0x1E4F903A8]);
    v25 = (void *)[v29 initWithIdentifier:*MEMORY[0x1E4F90F78]];
    [v21 setOutlineObject:v25];
  }

  id v32 = [MEMORY[0x1E4F905E0] sharedScheduler];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __85__PUSidebarDataController_fromMyMacAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke;
  v39[3] = &unk_1E5F2DEB0;
  id v40 = v18;
  id v41 = v16;
  id v33 = v21;
  id v42 = v33;
  os_signpost_id_t v43 = v9;
  id v34 = v16;
  v35 = v18;
  [v32 scheduleTaskAfterCATransactionCommits:v39];

  id v36 = v42;
  id v37 = v33;

  return v37;
}

void __85__PUSidebarDataController_fromMyMacAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  uint64_t v3 = *(id *)(a1 + 32);
  uint64_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "PUSidebarDataController.makeSectionManagers.item", "item=fromMyMac, subItem=albumsFolder, detail=startBackgroundFetchingIfNeeded", buf, 2u);
  }

  [*(id *)(a1 + 40) startBackgroundFetchingIfNeeded];
  id v5 = *(id *)(a1 + 32);
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)int v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_END, v2, "PUSidebarDataController.makeSectionManagers.item", "", v16, 2u);
  }

  os_signpost_id_t v7 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  id v8 = *(id *)(a1 + 32);
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PUSidebarDataController.makeSectionManagers.item", "item=fromMyMac, detail=enablement", v15, 2u);
  }

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F900B8]) initWithSourceDataSectionManager:*(void *)(a1 + 40)];
  [v10 setEnablementTarget:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) setEnablementForwarder:v10];
  os_signpost_id_t v11 = *(id *)(a1 + 32);
  id v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PUSidebarDataController.makeSectionManagers.item", "", v14, 2u);
  }
}

+ (id)otherAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4
{
  id v4 = a4;
  id v5 = objc_msgSend(MEMORY[0x1E4F39008], "px_otherAlbumsCollectionListIncludeDeleted:includeHidden:includeDuplicates:", 1, 1, 1);
  id v6 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v5 options:0];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  int v23 = __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke;
  int v24 = &unk_1E5F2DE88;
  id v25 = v4;
  id v7 = v4;
  id v8 = PXMap();
  os_signpost_id_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F906E0]) initWithChildDataSectionManagers:v8];
  [v9 setAlwaysContainsObjects:1];
  uint64_t v10 = [MEMORY[0x1E4F905E0] sharedScheduler];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke_2;
  id v19 = &unk_1E5F2ED10;
  id v11 = v9;
  id v20 = v11;
  [v10 scheduleTaskAfterCATransactionCommits:&v16];

  id v12 = v11;
  id v13 = objc_alloc(MEMORY[0x1E4F903A8]);
  uint64_t v14 = objc_msgSend(v13, "initWithIdentifier:", *MEMORY[0x1E4F90F68], v16, v17, v18, v19);
  [v12 setOutlineObject:v14];

  return v12;
}

id __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F903B0]) initWithCollection:v3 context:*(void *)(a1 + 32)];
  [v4 setHiddenWhenEmpty:1];
  if (objc_msgSend(v3, "px_isHiddenSmartAlbum"))
  {
    id v5 = [*(id *)(a1 + 32) enablementProvider];
    [v5 configureEnablementOfSectionManager:v4 enablementItem:2];
  }
  if (objc_msgSend(v3, "px_isRecentlyDeletedSmartAlbum"))
  {
    id v6 = [*(id *)(a1 + 32) enablementProvider];
    [v6 configureEnablementOfSectionManager:v4 enablementItem:3];
  }
  if (objc_msgSend(v3, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
    id v7 = [*(id *)(a1 + 32) enablementProvider];
    [v7 configureEnablementOfSectionManager:v4 enablementItem:21];
  }
  return v4;
}

uint64_t __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlwaysContainsObjects:0];
}

+ (id)sharedAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4 hideAdd:(BOOL)a5
{
  BOOL v5 = a5;
  v44[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(v9, "px_virtualCollections");
  id v11 = objc_alloc(MEMORY[0x1E4F903B0]);
  id v12 = [v10 sharedAlbumsCollection];
  id v13 = (void *)[v11 initWithCollection:v12 context:v8];

  id v14 = objc_alloc(MEMORY[0x1E4F90390]);
  uint64_t v15 = [v10 sharedAlbumsCollection];
  uint64_t v16 = (void *)[v14 initWithAssetCollection:v15 itemCount:0x7FFFFFFFFFFFFFFFLL containerIdentifier:0];
  [v13 setOutlineObject:v16];

  uint64_t v17 = (void *)MEMORY[0x1E4F90398];
  id v18 = objc_msgSend(v9, "px_virtualCollections");

  id v19 = [v18 sharedAlbumsCollectionList];
  id v20 = [v17 configurationWithCollectionList:v19];

  uint64_t v21 = [v8 assetsFilterPredicate];

  [a1 _prepareSectionConfiguration:v20 assetsFilterPredicate:v21];
  [v20 setIncludeKeyAssetFetches:1];
  [v20 setSkipAssetFetches:1];
  [v20 setSkipAssetCountFetches:1];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F903A0]) initWithConfiguration:v20];
  int v23 = [MEMORY[0x1E4F905E0] sharedScheduler];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __90__PUSidebarDataController_sharedAlbumsDataSectionManagerWithPhotoLibrary_context_hideAdd___block_invoke;
  v41[3] = &unk_1E5F2ED10;
  id v24 = v22;
  id v42 = v24;
  [v23 scheduleTaskAfterCATransactionCommits:v41];

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v26 = [MEMORY[0x1E4F90308] sharedInstance];
  if (([v26 enableSidebarHeaderSelection] & 1) == 0) {
    [v25 addObject:v13];
  }
  if (v5)
  {
    v44[0] = v24;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    [v25 addObjectsFromArray:v27];
  }
  else
  {
    id v27 = [a1 _actionManagerWithActionType:*MEMORY[0x1E4F90E50]];
    v43[0] = v24;
    v43[1] = v27;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    [v25 addObjectsFromArray:v28];
  }
  BOOL v29 = !v5;
  id v30 = objc_alloc(MEMORY[0x1E4F906E0]);
  id v31 = (void *)[v25 copy];
  id v32 = (void *)[v30 initWithChildDataSectionManagers:v31];

  [v32 setAlwaysContainsObjects:v29];
  if ([v26 enableSidebarHeaderSelection])
  {
    id v33 = [v10 sharedAlbumsCollection];
    id v34 = [v33 transientIdentifier];
    v35 = v34;
    if (v34)
    {
      id v36 = v34;
    }
    else
    {
      id v36 = [v33 localIdentifier];
    }
    id v38 = v36;

    v39 = (void *)[objc_alloc(MEMORY[0x1E4F903A8]) initWithIdentifier:v38 collection:v33];
    [v32 setOutlineObject:v39];
  }
  else
  {
    id v37 = objc_alloc(MEMORY[0x1E4F903A8]);
    id v33 = (void *)[v37 initWithIdentifier:*MEMORY[0x1E4F90F70]];
    [v32 setOutlineObject:v33];
  }

  return v32;
}

uint64_t __90__PUSidebarDataController_sharedAlbumsDataSectionManagerWithPhotoLibrary_context_hideAdd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startBackgroundFetchingIfNeeded];
}

+ (id)myAlbumsDataSectionManagerForPhotoLibrary:(id)a3 context:(id)a4 hideAdd:(BOOL)a5
{
  BOOL v57 = a5;
  v68[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v7, "px_virtualCollections");
  id v9 = PLSidebarGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PUSidebarDataController.makeSectionManagers.item", "item=search", buf, 2u);
  }

  id v13 = objc_alloc(MEMORY[0x1E4F903B0]);
  id v14 = [v8 myAlbumsCollection];
  uint64_t v15 = (void *)[v13 initWithCollection:v14 context:v6];

  id v16 = objc_alloc(MEMORY[0x1E4F90390]);
  uint64_t v17 = [v8 myAlbumsCollection];
  id v18 = (void *)[v16 initWithAssetCollection:v17 itemCount:0x7FFFFFFFFFFFFFFFLL containerIdentifier:0];
  id v59 = v15;
  [v15 setOutlineObject:v18];

  id v19 = v12;
  id v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v20, OS_SIGNPOST_INTERVAL_END, v10, "PUSidebarDataController.makeSectionManagers.item", "", buf, 2u);
  }

  os_signpost_id_t v21 = os_signpost_id_generate(v20);
  uint64_t v22 = v20;
  int v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PUSidebarDataController.makeSectionManagers.item", "item=myAlbums, subItem=albumsFolder", buf, 2u);
  }

  v58 = v8;
  id v56 = [v8 rootAlbumCollectionList];
  id v24 = objc_msgSend(MEMORY[0x1E4F90398], "configurationWithCollectionList:");
  char v61 = v6;
  id v25 = [v6 assetsFilterPredicate];
  [a1 _prepareSectionConfiguration:v24 assetsFilterPredicate:v25];

  [v24 setIncludeKeyAssetFetches:1];
  [v24 setIncludeUserSmartAlbums:1];
  [v24 setSkipAssetFetches:1];
  [v24 setSkipAssetCountFetches:1];
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F903A0]) initWithConfiguration:v24];
  id v27 = [MEMORY[0x1E4F905E0] sharedScheduler];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __85__PUSidebarDataController_myAlbumsDataSectionManagerForPhotoLibrary_context_hideAdd___block_invoke;
  v63[3] = &unk_1E5F2ECC8;
  id v28 = v23;
  os_signpost_id_t v64 = v28;
  id v60 = v26;
  id v65 = v60;
  [v27 scheduleTaskAfterCATransactionCommits:v63];

  BOOL v29 = v28;
  id v30 = v29;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v30, OS_SIGNPOST_INTERVAL_END, v21, "PUSidebarDataController.makeSectionManagers.item", "", buf, 2u);
  }

  os_signpost_id_t v31 = os_signpost_id_generate(v30);
  id v32 = v30;
  id v33 = v32;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "PUSidebarDataController.makeSectionManagers.item", "item=myAlbums, subItem=MPS", buf, 2u);
  }

  id v34 = (void *)MEMORY[0x1E4F38EE8];
  v35 = objc_msgSend(v7, "px_standardLibrarySpecificFetchOptions");

  uint64_t v36 = [v34 fetchAssetCollectionsWithType:1 subtype:100 options:v35];

  id v55 = (void *)v36;
  id v37 = [MEMORY[0x1E4F90398] configurationWithCollectionsFetchResult:v36];
  id v38 = [v6 assetsFilterPredicate];
  [a1 _prepareSectionConfiguration:v37 assetsFilterPredicate:v38];

  uint64_t v39 = [objc_alloc(MEMORY[0x1E4F903A0]) initWithConfiguration:v37];
  id v40 = v33;
  id v41 = v40;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v41, OS_SIGNPOST_INTERVAL_END, v31, "PUSidebarDataController.makeSectionManagers.item", "", buf, 2u);
  }

  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_signpost_id_t v43 = [MEMORY[0x1E4F90308] sharedInstance];
  if (([v43 enableSidebarHeaderSelection] & 1) == 0) {
    [v42 addObject:v15];
  }
  v54 = (void *)v39;
  if (v57)
  {
    v68[0] = v39;
    v68[1] = v60;
    id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
    [v42 addObjectsFromArray:v44];
  }
  else
  {
    v67[0] = v39;
    v67[1] = v60;
    id v44 = [a1 _actionManagerWithActionType:*MEMORY[0x1E4F90E40]];
    v67[2] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
    [v42 addObjectsFromArray:v45];
  }
  if ([v43 enableSidebarHeaderSelection])
  {
    v46 = v58;
    v47 = [v58 myAlbumsCollection];
    id v48 = [v47 transientIdentifier];
  }
  else
  {
    id v48 = (id)*MEMORY[0x1E4F90F60];
    v46 = v58;
  }
  id v49 = objc_alloc(MEMORY[0x1E4F906E0]);
  v50 = (void *)[v42 copy];
  id v51 = (void *)[v49 initWithChildDataSectionManagers:v50];

  [v51 setAlwaysContainsObjects:!v57];
  unint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F903A8]) initWithIdentifier:v48 collection:v56];
  [v51 setOutlineObject:v52];

  return v51;
}

void __85__PUSidebarDataController_myAlbumsDataSectionManagerForPhotoLibrary_context_hideAdd___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "PUSidebarDataController.makeSectionManagers.item", "item=myAlbums, subItem=albumsFolder, detail=startBackgroundFetchingIfNeeded", buf, 2u);
  }

  [*(id *)(a1 + 40) startBackgroundFetchingIfNeeded];
  BOOL v5 = *(id *)(a1 + 32);
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_END, v2, "PUSidebarDataController.makeSectionManagers.item", "", v7, 2u);
  }
}

+ (id)_actionManagerWithActionType:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F90388];
  id v4 = a3;
  BOOL v5 = (void *)[[v3 alloc] initWithActionType:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F903B0]) initWithItem:v5];
  [v6 setOutlineObject:v5];

  return v6;
}

+ (id)_singleItemDataSourceManagerForCollection:(id)a3 context:(id)a4
{
  BOOL v5 = (objc_class *)MEMORY[0x1E4F903B0];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithCollection:0 context:v6];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F90390]) initWithAssetCollection:v7 itemCount:0x7FFFFFFFFFFFFFFFLL containerIdentifier:0];
  [v8 setOutlineObject:v9];

  return v8;
}

@end