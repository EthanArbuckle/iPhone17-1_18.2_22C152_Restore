@interface PXSharedLibraryAssetStatusProvider
+ (id)_appendMediaTypeForStatusStringFormat:(id)a3 mediaType:(int64_t)a4;
+ (id)_applyAttributesToTitle:(id)a3;
+ (id)_displayNameFont;
+ (id)_libraryNameFont;
+ (id)_localizedContributionStatusForContributor:(id)a3 status:(unint64_t)a4 assetMediaType:(int64_t)a5;
+ (id)_primaryFont;
+ (id)localizedContributionStatusStringForParticipants:(id)a3 assetMediaType:(int64_t)a4 showOnlyOneNameToShortenStatus:(BOOL)a5;
- (BOOL)hasSharedLibraryOrPreview;
- (NSString)localizedContributionStatus;
- (PHAsset)asset;
- (PHFetchResult)fetchedParticipants;
- (PXSharedLibraryAssetStatusProvider)init;
- (PXSharedLibraryAssetStatusProvider)initWithAsset:(id)a3;
- (id)attributedLocalizedContributionStatusForPreferredWidth:(double)a3 maximumNumberOfLines:(double)a4;
- (id)fetchParticipants;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (unint64_t)status;
- (void)_setPhotoLibrary:(id)a3;
- (void)_updateProperties;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)setAsset:(id)a3;
- (void)setFetchedParticipants:(id)a3;
- (void)setHasSharedLibraryOrPreview:(BOOL)a3;
- (void)setLocalizedContributionStatus:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation PXSharedLibraryAssetStatusProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedParticipants, 0);
  objc_storeStrong((id *)&self->_localizedContributionStatus, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setFetchedParticipants:(id)a3
{
}

- (PHFetchResult)fetchedParticipants
{
  return self->_fetchedParticipants;
}

- (BOOL)hasSharedLibraryOrPreview
{
  return self->_hasSharedLibraryOrPreview;
}

- (NSString)localizedContributionStatus
{
  return self->_localizedContributionStatus;
}

- (unint64_t)status
{
  return self->_status;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 3) != 0 && (void *)PXSharedLibraryStatusProviderObservationContext_142831 == a5)
  {
    BOOL v6 = [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider hasSharedLibraryOrPreview];
    [(PXSharedLibraryAssetStatusProvider *)self setHasSharedLibraryOrPreview:v6];
  }
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"current"];
    v9 = [(PXSharedLibraryAssetStatusProvider *)self asset];

    if (v8 == v9)
    {
      v10 = [v7 objectForKeyedSubscript:@"new"];
      [(PXSharedLibraryAssetStatusProvider *)self setAsset:v10];
    }
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__142838;
  v20 = __Block_byref_object_dispose__142839;
  id v21 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXSharedLibraryAssetStatusProvider_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if (v17[5])
  {
    v5 = objc_msgSend(v4, "changeDetailsForObject:");
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 objectAfterChanges];
      v8 = (void *)v7;
      if (v7)
      {
        uint64_t v9 = v17[5];
        v24[0] = @"current";
        v24[1] = @"new";
        v25[0] = v9;
        v25[1] = v7;
        v10 = (__CFString **)v24;
        id v11 = v25;
        uint64_t v12 = 2;
      }
      else
      {
        v22 = @"current";
        uint64_t v23 = v17[5];
        v10 = &v22;
        id v11 = &v23;
        uint64_t v12 = 1;
      }
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:v12];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __67__PXSharedLibraryAssetStatusProvider_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) asset];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)attributedLocalizedContributionStatusForPreferredWidth:(double)a3 maximumNumberOfLines:(double)a4
{
  uint64_t v7 = [(PXSharedLibraryAssetStatusProvider *)self fetchParticipants];
  v8 = [v7 fetchedObjects];
  uint64_t v9 = [(PXSharedLibraryAssetStatusProvider *)self asset];
  uint64_t v10 = [v9 mediaType];

  id v11 = +[PXSharedLibraryAssetStatusProvider localizedContributionStatusStringForParticipants:v8 assetMediaType:v10 showOnlyOneNameToShortenStatus:0];
  uint64_t v12 = +[PXSharedLibraryAssetStatusProvider _applyAttributesToTitle:v11];
  objc_msgSend(v12, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", (uint64_t)(a4 + 1.0), 1, a3);
  double v14 = v13;
  v15 = +[PXSharedLibraryAssetStatusProvider _primaryFont];
  [v15 lineHeight];
  double v17 = v16;

  if (floor(v14 / v17) > a4)
  {
    uint64_t v18 = +[PXSharedLibraryAssetStatusProvider localizedContributionStatusStringForParticipants:v8 assetMediaType:v10 showOnlyOneNameToShortenStatus:1];

    uint64_t v19 = +[PXSharedLibraryAssetStatusProvider _applyAttributesToTitle:v18];

    uint64_t v12 = (void *)v19;
    id v11 = (void *)v18;
  }

  return v12;
}

- (void)_updateProperties
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXSharedLibraryAssetStatusProvider *)self asset];
  id v4 = [v3 photoLibrary];
  [(PXSharedLibraryAssetStatusProvider *)self _setPhotoLibrary:v4];

  if (self->_asset && self->_hasSharedLibraryOrPreview)
  {
    v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    id v6 = [MEMORY[0x1E4F392E8] fetchContributorsForAsset:self->_asset options:v5];
    if ([v6 count])
    {
      uint64_t v7 = 3;
    }
    else
    {
      v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      v31[0] = *MEMORY[0x1E4F394C0];
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      [v8 setFetchPropertySets:v9];

      uint64_t v10 = (void *)MEMORY[0x1E4F38EB8];
      id v11 = [(PHAsset *)self->_asset localIdentifier];
      v30 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      double v13 = [v10 fetchAssetsWithLocalIdentifiers:v12 options:v8];

      double v14 = [v13 firstObject];
      int v15 = [v14 participatesInLibraryScope];
      double v16 = [v14 libraryScopeProperties];
      int v17 = [v16 assetIsInOnboardingPreviewState];

      if (v15)
      {
        uint64_t v18 = PLSharedLibraryGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          asset = self->_asset;
          *(_DWORD *)buf = 138412546;
          v27 = v6;
          __int16 v28 = 2112;
          v29 = asset;
          _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, "No name for contributors: %@, of asset: %@", buf, 0x16u);
        }

        uint64_t v7 = 3;
      }
      else if (v17)
      {
        uint64_t v7 = 2;
      }
      else
      {
        uint64_t v7 = 1;
      }
    }
  }
  else
  {
    id v6 = 0;
    uint64_t v7 = 0;
  }
  v20 = [v6 fetchedObjects];
  id v21 = +[PXSharedLibraryAssetStatusProvider _localizedContributionStatusForContributor:v20 status:v7 assetMediaType:[(PHAsset *)self->_asset mediaType]];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__PXSharedLibraryAssetStatusProvider__updateProperties__block_invoke;
  v23[3] = &unk_1E5DD0510;
  id v24 = v21;
  uint64_t v25 = v7;
  v23[4] = self;
  id v22 = v21;
  [(PXSharedLibraryAssetStatusProvider *)self performChanges:v23];
}

uint64_t __55__PXSharedLibraryAssetStatusProvider__updateProperties__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStatus:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setLocalizedContributionStatus:v3];
}

- (void)_setPhotoLibrary:(id)a3
{
  uint64_t v12 = (PHPhotoLibrary *)a3;
  p_photoLibrary = &self->_photoLibrary;
  id v6 = self->_photoLibrary;
  if (v6 == v12)
  {
  }
  else
  {
    uint64_t v7 = v6;
    char v8 = -[PHPhotoLibrary isEqual:](v6, "isEqual:");

    if ((v8 & 1) == 0)
    {
      if (*p_photoLibrary)
      {
        [(PHPhotoLibrary *)*p_photoLibrary px_unregisterChangeObserver:self];
        [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider unregisterChangeObserver:self context:PXSharedLibraryStatusProviderObservationContext_142831];
        sharedLibraryStatusProvider = self->_sharedLibraryStatusProvider;
        self->_sharedLibraryStatusProvider = 0;

        self->_hasSharedLibraryOrPreview = 0;
      }
      objc_storeStrong((id *)&self->_photoLibrary, a3);
      if (*p_photoLibrary)
      {
        [(PHPhotoLibrary *)*p_photoLibrary px_registerChangeObserver:self];
        uint64_t v10 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:*p_photoLibrary];
        id v11 = self->_sharedLibraryStatusProvider;
        self->_sharedLibraryStatusProvider = v10;

        [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider registerChangeObserver:self context:PXSharedLibraryStatusProviderObservationContext_142831];
        self->_hasSharedLibraryOrPreview = [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider hasSharedLibraryOrPreview];
      }
    }
  }
}

- (void)setLocalizedContributionStatus:(id)a3
{
  char v8 = (NSString *)a3;
  v5 = self->_localizedContributionStatus;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_localizedContributionStatus, a3);
      [(PXSharedLibraryAssetStatusProvider *)self signalChange:2];
    }
  }
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    [(PXSharedLibraryAssetStatusProvider *)self signalChange:1];
  }
}

- (void)setHasSharedLibraryOrPreview:(BOOL)a3
{
  if (self->_hasSharedLibraryOrPreview != a3)
  {
    self->_hasSharedLibraryOrPreview = a3;
    [(PXSharedLibraryAssetStatusProvider *)self _updateProperties];
  }
}

- (id)fetchParticipants
{
  uint64_t v3 = [(PXSharedLibraryAssetStatusProvider *)self asset];
  id v4 = [(PXSharedLibraryAssetStatusProvider *)self fetchedParticipants];
  if (!v4 && v3)
  {
    if (![(PXSharedLibraryAssetStatusProvider *)self hasSharedLibraryOrPreview]) {
      goto LABEL_6;
    }
    id v4 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v5 = [MEMORY[0x1E4F392E8] fetchContributorsForAsset:v3 options:v4];
    [(PXSharedLibraryAssetStatusProvider *)self setFetchedParticipants:v5];
  }
LABEL_6:
  id v6 = [(PXSharedLibraryAssetStatusProvider *)self fetchedParticipants];

  return v6;
}

- (void)setAsset:(id)a3
{
  uint64_t v9 = (PHAsset *)a3;
  id v4 = self->_asset;
  asset = v9;
  if (v4 != v9)
  {
    id v6 = v4;
    char v7 = [(PHAsset *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    char v8 = v9;
    asset = self->_asset;
    self->_asset = v8;
  }

LABEL_5:
  [(PXSharedLibraryAssetStatusProvider *)self setFetchedParticipants:0];
  [(PXSharedLibraryAssetStatusProvider *)self _updateProperties];
}

- (PXSharedLibraryAssetStatusProvider)init
{
  return [(PXSharedLibraryAssetStatusProvider *)self initWithAsset:0];
}

- (PXSharedLibraryAssetStatusProvider)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryAssetStatusProvider;
  id v6 = [(PXSharedLibraryAssetStatusProvider *)&v9 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    [(PXSharedLibraryAssetStatusProvider *)v7 _updateProperties];
  }

  return v7;
}

+ (id)_libraryNameFont
{
}

+ (id)_displayNameFont
{
}

+ (id)_primaryFont
{
}

+ (id)_applyAttributesToTitle:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v16 = +[PXSharedLibraryAssetStatusProvider _primaryFont];
  id v4 = +[PXSharedLibraryAssetStatusProvider _displayNameFont];
  id v5 = +[PXSharedLibraryAssetStatusProvider _libraryNameFont];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  v21[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v6 = v21[0];
  v21[1] = v7;
  v22[0] = v16;
  char v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v22[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  v19[1] = v7;
  v20[0] = v4;
  v19[0] = v6;
  uint64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
  v20[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  v17[1] = v7;
  v18[0] = v5;
  v17[0] = v6;
  uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
  v18[1] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  double v14 = objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v3, v9, v11, v13);

  return v14;
}

+ (id)_appendMediaTypeForStatusStringFormat:(id)a3 mediaType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = @"Item";
  if (a4 == 2) {
    uint64_t v7 = @"Video";
  }
  if (a4 == 1) {
    char v8 = @"Photo";
  }
  else {
    char v8 = v7;
  }
  objc_super v9 = [v5 stringByAppendingString:v8];

  return v9;
}

+ (id)localizedContributionStatusStringForParticipants:(id)a3 assetMediaType:(int64_t)a4 showOnlyOneNameToShortenStatus:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v9);
        }
        int v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v15 isCurrentUser])
        {
          char v12 = 1;
        }
        else
        {
          double v16 = PXSharedLibraryShortNameForParticipant(v15);
          [v8 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v11);

    if (v12)
    {
      if ((unint64_t)[v8 count] > 2 || v5 && objc_msgSend(v8, "count"))
      {
        int v17 = +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:@"PXSharedLibraryInfoPanelTitle_YouAndOtherContributors_" mediaType:a4];
        uint64_t v18 = PXLocalizedSharedLibraryString(v17);

        [v8 count];
        PXLocalizedStringWithValidatedFormat(v18, @"%lu");
        id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
        uint64_t v23 = v19;
        goto LABEL_35;
      }
      if ([v8 count] == 2)
      {
        v29 = @"PXSharedLibraryInfoPanelTitle_YouAndTwoContributors_";
LABEL_32:
        v30 = +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:v29 mediaType:a4];
        uint64_t v18 = PXLocalizedSharedLibraryString(v30);

        id v21 = [v8 objectAtIndex:0];
        __int16 v28 = [v8 objectAtIndex:1];
        uint64_t v23 = PXLocalizedStringWithValidatedFormat(v18, @"%@ %@");
        goto LABEL_33;
      }
      if ([v8 count] == 1)
      {
        v32 = @"PXSharedLibraryInfoPanelTitle_YouAndOneContributors_";
LABEL_41:
        v33 = +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:v32 mediaType:a4];
        uint64_t v18 = PXLocalizedSharedLibraryString(v33);

        id v21 = [v8 firstObject];
        id v22 = @"%@";
        goto LABEL_20;
      }
      id v24 = @"PXSharedLibraryInfoPanelTitle_YouContributor_";
LABEL_22:
      uint64_t v25 = +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:v24 mediaType:a4];
      v26 = PXLocalizedSharedLibraryString(v25);

      id v19 = v26;
      uint64_t v18 = v19;
      goto LABEL_23;
    }
  }
  else
  {
  }
  if (![v8 count])
  {
    id v24 = @"PXSharedLibraryInfoPanelTitle_NoContributors_";
    goto LABEL_22;
  }
  if ((unint64_t)[v8 count] <= 3 && (!v5 || (unint64_t)objc_msgSend(v8, "count") < 2))
  {
    if ([v8 count] == 3)
    {
      v27 = +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:@"PXSharedLibraryInfoPanelTitle_ThreeContributors_" mediaType:a4];
      uint64_t v18 = PXLocalizedSharedLibraryString(v27);

      id v21 = [v8 objectAtIndex:0];
      __int16 v28 = [v8 objectAtIndex:1];
      v34 = [v8 objectAtIndex:2];
      uint64_t v23 = PXLocalizedStringWithValidatedFormat(v18, @"%@ %@ %@");

LABEL_33:
      goto LABEL_34;
    }
    if ([v8 count] == 2)
    {
      v29 = @"PXSharedLibraryInfoPanelTitle_TwoContributors_";
      goto LABEL_32;
    }
    v32 = @"PXSharedLibraryInfoPanelTitle_OneContributor_";
    goto LABEL_41;
  }
  v20 = +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:@"PXSharedLibraryInfoPanelTitle_OneAndOtherContributors_" mediaType:a4];
  uint64_t v18 = PXLocalizedSharedLibraryString(v20);

  id v21 = [v8 firstObject];
  [v8 count];
  id v22 = @"%@ %lu";
LABEL_20:
  uint64_t v23 = PXLocalizedStringWithValidatedFormat(v18, v22);
LABEL_34:

LABEL_35:
  return v23;
}

+ (id)_localizedContributionStatusForContributor:(id)a3 status:(unint64_t)a4 assetMediaType:(int64_t)a5
{
  id v7 = a3;
  char v8 = v7;
  if (a4 == 1)
  {
    char v12 = @"PXSharedLibrary_AssetStatus_NotShared";
  }
  else
  {
    if (a4 != 2)
    {
      if (a4 == 3 && [v7 count])
      {
        id v9 = +[PXSharedLibraryAssetStatusProvider localizedContributionStatusStringForParticipants:v8 assetMediaType:a5 showOnlyOneNameToShortenStatus:0];
        uint64_t v10 = +[PXSharedLibraryAssetStatusProvider _applyAttributesToTitle:v9];
        uint64_t v11 = [v10 string];
      }
      else
      {
        uint64_t v11 = 0;
      }
      goto LABEL_10;
    }
    char v12 = @"PXSharedLibrary_AssetStatus_SharedByMe";
  }
  uint64_t v11 = PXLocalizedSharedLibraryString(v12);
LABEL_10:

  return v11;
}

@end