@interface PLWarningHelper
- (BOOL)_hasAssetsInLibraryScope:(id)a3;
- (BOOL)_isExitingSharedLibrary;
- (NSArray)_assets;
- (NSString)_clientName;
- (PLPhotoLibrary)photoLibrary;
- (PLWarningHelper)initWithPhotoLibrary:(id)a3;
- (id)_avalancheDeleteWarningForAvalancheStacksCount:(int64_t)a3 nonAvalancheItemsToDeleteCount:(int64_t)a4 nonAvalancheItemsToDeleteType:(signed __int16)a5 avalanchePhotosToDeleteCount:(int64_t)a6 survivingAvalancheFavoritesCount:(int64_t)a7 avalancheUnrelatedFavoritesCount:(int64_t)a8 assetCount:(int64_t)a9;
- (id)_cloudSharedWarningTextForAssetCount:(int64_t)a3 assetType:(signed __int16)a4 albumTitle:(id)a5;
- (id)_cloudSharedWarningTextForAssets:(id)a3;
- (id)_contributorsForAssets:(id)a3;
- (id)_myAssetsFromAssets:(id)a3;
- (id)_usedElsewhereWarningTextForAssetCount:(int64_t)a3 inLibraryScopeCount:(int64_t)a4 myAssets:(id)a5 contributors:(id)a6 inSomeAlbumCount:(int64_t)a7 affectedLocalAlbumsCount:(int64_t)a8 assetType:(signed __int16)a9 actualDeletionCount:(int64_t)a10 syndicationAssetCount:(int64_t)a11;
- (id)_usedElsewhereWarningTextForAssets:(id)a3 actualDeletionCount:(int64_t)a4;
- (id)allWarningMessageCombinations;
- (int64_t)_style;
- (int64_t)_syndicationAssetCount;
- (unint64_t)_assetsInLibraryScopeCountFromAssets:(id)a3;
- (void)_enumerateTestAssetTypesUsingBlock:(id)a3;
- (void)_enumerateTestBooleansUsingBlock:(id)a3;
- (void)_enumerateTestDeviceModelNamesUsingBlock:(id)a3;
- (void)_enumerateTestItemCountsUsingBlock:(id)a3;
- (void)_enumerateTestOtherItemCountsUsingBlock:(id)a3;
- (void)_enumerateWarningMessagesUsingBlock:(id)a3 sectionBlock:(id)a4;
- (void)_getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5;
- (void)_getExpungeWarningMessage:(id *)a3 buttonTitle:(id *)a4 forAssetCount:(int64_t)a5 assetType:(signed __int16)a6 iCPLEnabled:(BOOL)a7 contributors:(id)a8 deviceModelName:(id)a9;
- (void)_getWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forItemSuffix:(id)a6 count:(unint64_t)a7 operation:(int64_t)a8 clientName:(id)a9;
- (void)enumerateWarningMessagesUsingBlock:(id)a3;
- (void)getAvalancheDeleteWarning:(id *)a3 actualDeletionCount:(int64_t *)a4 forAssets:(id)a5;
- (void)getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAlbums:(id)a6 folders:(id)a7 clientName:(id)a8 style:(int64_t)a9;
- (void)getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAssets:(id)a6 syndicationAssetCount:(int64_t)a7 clientName:(id)a8 style:(int64_t)a9;
- (void)getExpungeWarningMessage:(id *)a3 buttonTitle:(id *)a4 forAssets:(id)a5;
- (void)getWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAssets:(id)a6 operation:(int64_t)a7 clientName:(id)a8;
- (void)setPhotoLibrary:(id)a3;
- (void)set_assets:(id)a3;
- (void)set_clientName:(id)a3;
- (void)set_style:(int64_t)a3;
- (void)set_syndicationAssetCount:(int64_t)a3;
@end

@implementation PLWarningHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->__clientName, 0);
  objc_storeStrong((id *)&self->__assets, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)set_style:(int64_t)a3
{
  self->__style = a3;
}

- (int64_t)_style
{
  return self->__style;
}

- (void)set_clientName:(id)a3
{
}

- (NSString)_clientName
{
  return self->__clientName;
}

- (void)set_syndicationAssetCount:(int64_t)a3
{
  self->__syndicationAssetCount = a3;
}

- (int64_t)_syndicationAssetCount
{
  return self->__syndicationAssetCount;
}

- (void)set_assets:(id)a3
{
}

- (NSArray)_assets
{
  return self->__assets;
}

- (void)_enumerateTestDeviceModelNamesUsingBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"iPad");
  (*v3)(v5, @"iPod touch");
  (*v3)(v5, @"other");
}

- (void)_enumerateTestAssetTypesUsingBlock:(id)a3
{
  v3 = (void (**)(id, uint64_t))((char *)a3 + 16);
  v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, 1);
  (*v3)(v5, 3);
}

- (void)_enumerateTestOtherItemCountsUsingBlock:(id)a3
{
  v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  [(PLWarningHelper *)self _enumerateTestItemCountsUsingBlock:v5];
}

- (void)_enumerateTestItemCountsUsingBlock:(id)a3
{
  v3 = (void (**)(id, uint64_t))((char *)a3 + 16);
  v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, 2);
  (*v3)(v5, 1000);
}

- (void)_enumerateTestBooleansUsingBlock:(id)a3
{
  v3 = (void (**)(id, uint64_t))((char *)a3 + 16);
  v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, 1);
}

- (void)_enumerateWarningMessagesUsingBlock:(id)a3 sectionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, __CFString *))((char *)a4 + 16);
  v8 = (void (*)(void))*((void *)a4 + 2);
  id v9 = a4;
  v8();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke;
  v23[3] = &unk_1E58661A0;
  v23[4] = self;
  uint64_t v25 = 0;
  id v10 = v6;
  id v24 = v10;
  [(PLWarningHelper *)self _enumerateTestItemCountsUsingBlock:v23];

  (*v7)(v9, @"Expunge");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_3;
  v21[3] = &unk_1E5866240;
  v21[4] = self;
  id v11 = v10;
  id v22 = v11;
  [(PLWarningHelper *)self _enumerateTestItemCountsUsingBlock:v21];
  (*v7)(v9, @"Avalanche");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_7;
  v19[3] = &unk_1E5866240;
  v19[4] = self;
  id v12 = v11;
  id v20 = v12;
  [(PLWarningHelper *)self _enumerateTestItemCountsUsingBlock:v19];
  (*v7)(v9, @"Cloud Shared");
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_14;
  v17[3] = &unk_1E5866240;
  v17[4] = self;
  id v13 = v12;
  id v18 = v13;
  [(PLWarningHelper *)self _enumerateTestItemCountsUsingBlock:v17];
  (*v7)(v9, @"Deletion");

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_16;
  v15[3] = &unk_1E5866240;
  v15[4] = self;
  id v16 = v13;
  id v14 = v13;
  [(PLWarningHelper *)self _enumerateTestItemCountsUsingBlock:v15];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke(void *a1, uint64_t a2)
{
  v2 = (void *)a1[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_2;
  v5[3] = &unk_1E5866178;
  v5[4] = v2;
  v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  uint64_t v7 = a2;
  uint64_t v8 = v3;
  id v6 = v4;
  [v2 _enumerateTestAssetTypesUsingBlock:v5];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_4;
  v3[3] = &unk_1E5866218;
  v3[4] = v2;
  uint64_t v5 = a2;
  id v4 = *(id *)(a1 + 40);
  [v2 _enumerateTestAssetTypesUsingBlock:v3];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_7(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_8;
  v3[3] = &unk_1E58661A0;
  v3[4] = v2;
  uint64_t v5 = a2;
  id v4 = *(id *)(a1 + 40);
  [v2 _enumerateTestOtherItemCountsUsingBlock:v3];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_14(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_15;
  v3[3] = &unk_1E5866218;
  v3[4] = v2;
  uint64_t v5 = a2;
  id v4 = *(id *)(a1 + 40);
  [v2 _enumerateTestAssetTypesUsingBlock:v3];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  do
  {
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_17;
    v8[3] = &unk_1E5866380;
    uint64_t v7 = *(void **)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    uint64_t v10 = a2;
    uint64_t v11 = v4;
    v8[4] = v7;
    id v9 = v6;
    [v7 _enumerateTestOtherItemCountsUsingBlock:v8];

    ++v4;
  }
  while (v4 != 3);
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_18;
    v4[3] = &unk_1E5866358;
    uint64_t v6 = a2;
    uint64_t v7 = v2;
    v4[4] = v3;
    uint64_t v8 = *(void *)(a1 + 56);
    id v5 = *(id *)(a1 + 40);
    [v3 _enumerateTestOtherItemCountsUsingBlock:v4];
  }
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (a2 || v2 <= 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_19;
    v4[3] = &unk_1E5866330;
    v4[4] = v3;
    long long v6 = *(_OWORD *)(a1 + 56);
    uint64_t v7 = v2;
    uint64_t v8 = a2;
    id v5 = *(id *)(a1 + 40);
    [v3 _enumerateTestOtherItemCountsUsingBlock:v4];
  }
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= a2)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = v2 - 1;
    do
    {
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_20;
      v9[3] = &unk_1E5866308;
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v8 = v10;
      uint64_t v12 = v2;
      long long v13 = *(_OWORD *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 72);
      uint64_t v15 = a2;
      id v11 = v7;
      [v8 _enumerateTestAssetTypesUsingBlock:v9];

      uint64_t v2 = *(void *)(a1 + 48);
      ++v6;
    }
    while (v6 <= v2);
  }
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_20(uint64_t a1, int a2)
{
  LOWORD(v7) = a2;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_usedElsewhereWarningTextForAssetCount:inLibraryScopeCount:myAssets:contributors:inSomeAlbumCount:affectedLocalAlbumsCount:assetType:actualDeletionCount:syndicationAssetCount:", v7, *(void *)(a1 + 48), *(void *)(a1 + 80));
  if (v8)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 72);
LABEL_3:
    uint64_t v6 = [NSString stringWithFormat:@"Selected items: %ld, LibraryScope: %ld, in Albums: %ld, Affected Albums: %ld, Asset Type: %i, Syndicated items: %ld", *(void *)(a1 + 48), *(void *)(a1 + 56), v5, v4, a2, *(void *)(a1 + 80)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    goto LABEL_4;
  }
  uint64_t v4 = *(void *)(a1 + 72);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5) {
      goto LABEL_3;
    }
  }
LABEL_4:
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_15(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _cloudSharedWarningTextForAssetCount:*(void *)(a1 + 48) assetType:a2 albumTitle:@"Some Album"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_8(void *a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_9;
  v4[3] = &unk_1E5866178;
  uint64_t v2 = a1[6];
  id v3 = (void *)a1[5];
  id v5 = (id)a1[4];
  uint64_t v7 = v2;
  uint64_t v8 = a2;
  id v6 = v3;
  [v5 _enumerateTestAssetTypesUsingBlock:v4];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_9(uint64_t a1, __int16 a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_10;
  v3[3] = &unk_1E58662E0;
  v3[4] = v2;
  long long v5 = *(_OWORD *)(a1 + 48);
  __int16 v6 = a2;
  id v4 = *(id *)(a1 + 40);
  [v2 _enumerateTestItemCountsUsingBlock:v3];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_11;
  v3[3] = &unk_1E58662B8;
  v3[4] = v2;
  long long v5 = *(_OWORD *)(a1 + 48);
  __int16 v7 = *(_WORD *)(a1 + 64);
  uint64_t v6 = a2;
  id v4 = *(id *)(a1 + 40);
  [v2 _enumerateTestOtherItemCountsUsingBlock:v3];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_12;
  v3[3] = &unk_1E5866290;
  v3[4] = v2;
  long long v5 = *(_OWORD *)(a1 + 48);
  __int16 v8 = *(_WORD *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = a2;
  id v4 = *(id *)(a1 + 40);
  [v2 _enumerateTestOtherItemCountsUsingBlock:v3];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_13;
  v4[3] = &unk_1E5866268;
  void v4[4] = v2;
  __int16 v9 = *(_WORD *)(a1 + 80);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v7 = v3;
  uint64_t v8 = a2;
  id v5 = *(id *)(a1 + 40);
  [v2 _enumerateTestItemCountsUsingBlock:v4];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_13(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _avalancheDeleteWarningForAvalancheStacksCount:*(void *)(a1 + 48) nonAvalancheItemsToDeleteCount:*(void *)(a1 + 56) nonAvalancheItemsToDeleteType:*(__int16 *)(a1 + 88) avalanchePhotosToDeleteCount:*(void *)(a1 + 64) survivingAvalancheFavoritesCount:*(void *)(a1 + 72) avalancheUnrelatedFavoritesCount:*(void *)(a1 + 80) assetCount:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_4(void *a1, __int16 a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_5;
  v4[3] = &unk_1E58661F0;
  uint64_t v2 = a1[6];
  id v3 = (void *)a1[5];
  id v5 = (id)a1[4];
  uint64_t v7 = v2;
  __int16 v8 = a2;
  id v6 = v3;
  [v5 _enumerateTestBooleansUsingBlock:v4];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_5(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_6;
  v4[3] = &unk_1E58661C8;
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v7 = v2;
  __int16 v8 = *(_WORD *)(a1 + 56);
  char v9 = a2;
  id v6 = v3;
  [v5 _enumerateTestDeviceModelNamesUsingBlock:v4];
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = 0;
  id v7 = 0;
  [v3 _getExpungeWarningMessage:&v7 buttonTitle:&v6 forAssetCount:*(void *)(a1 + 48) assetType:*(__int16 *)(a1 + 56) iCPLEnabled:*(unsigned __int8 *)(a1 + 58) contributors:0 deviceModelName:a2];
  id v4 = v7;
  id v5 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__PLWarningHelper__enumerateWarningMessagesUsingBlock_sectionBlock___block_invoke_2(void *a1)
{
  uint64_t v2 = PLLocalizedKeyForAssetType();
  id v3 = (void *)a1[4];
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  [v3 _getWarningTitle:&v12 message:&v11 buttonTitle:&v10 forItemSuffix:v2 count:a1[6] operation:a1[7] clientName:@"SomeApp"];
  id v4 = v12;
  id v5 = v11;
  id v6 = v10;
  id v7 = NSString;
  __int16 v8 = [NSNumber numberWithInteger:a1[7]];
  char v9 = [v7 stringWithFormat:@"Operation: %@, Kind: %@", v8, v2];

  (*(void (**)(void))(a1[5] + 16))();
  if (v5) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)enumerateWarningMessagesUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PLWarningHelper_enumerateWarningMessagesUsingBlock___block_invoke;
  v6[3] = &unk_1E5866130;
  __int16 v8 = v9;
  id v5 = v4;
  id v7 = v5;
  [(PLWarningHelper *)self _enumerateWarningMessagesUsingBlock:v6 sectionBlock:&__block_literal_global_21528];

  _Block_object_dispose(v9, 8);
}

uint64_t __54__PLWarningHelper_enumerateWarningMessagesUsingBlock___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)allWarningMessageCombinations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__PLWarningHelper_allWarningMessageCombinations__block_invoke;
  v12[3] = &unk_1E5872870;
  id v13 = v3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __48__PLWarningHelper_allWarningMessageCombinations__block_invoke_2;
  char v10 = &unk_1E5872C70;
  id v11 = v13;
  id v4 = v13;
  [(PLWarningHelper *)self _enumerateWarningMessagesUsingBlock:v12 sectionBlock:&v7];
  id v5 = objc_msgSend(v4, "copy", v7, v8, v9, v10);

  return v5;
}

void __48__PLWarningHelper_allWarningMessageCombinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 length]) {
    [*(id *)(a1 + 32) appendFormat:@"%@:\n", v5];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@\n", v6];
}

uint64_t __48__PLWarningHelper_allWarningMessageCombinations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\n\n=== %@ ===\n", a2];
}

- (void)getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAlbums:(id)a6 folders:(id)a7 clientName:(id)a8 style:(int64_t)a9
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = [v13 count];
  v60 = v14;
  uint64_t v17 = [v14 count];
  uint64_t v18 = v17 + v16;
  if (!(v17 + v16))
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"PLWarningHelper.m", 793, @"Invalid parameter not satisfying: %@", @"totalCount > 0" object file lineNumber description];
  }
  v57 = a4;
  v58 = a5;
  if (v17)
  {
    if (v16)
    {
      if (v16 == 1 && v17 == 1)
      {
        v59 = 0;
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        char v55 = 1;
        uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        id v20 = @"ALBUM_FOLDER";
      }
      else
      {
        uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 == 1)
        {
          v59 = 0;
          char v55 = 1;
          uint64_t v16 = v17;
          id v20 = @"ALBUM_FOLDERS";
        }
        else
        {
          v59 = 0;
          if (v17 == 1) {
            id v20 = @"ALBUMS_FOLDER";
          }
          else {
            id v20 = @"ALBUMS_FOLDERS";
          }
          if (v17 != 1) {
            uint64_t v19 = v17;
          }
          char v55 = 1;
        }
      }
    }
    else if (v17 == 1)
    {
      id v22 = [v14 firstObject];
      v59 = [v22 title];

      char v55 = 0;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
      id v20 = @"FOLDER";
    }
    else
    {
      char v55 = 0;
      v59 = 0;
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v16 = v17;
      id v20 = @"FOLDERS";
    }
  }
  else if (v16 == 1)
  {
    v21 = [v13 firstObject];
    v59 = [v21 title];

    char v55 = 0;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    id v20 = @"ALBUM";
  }
  else
  {
    char v55 = 0;
    v59 = 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    id v20 = @"ALBUMS";
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v23 = v13;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v66;
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v66 != v26) {
          objc_enumerationMutation(v23);
        }
        if (![*(id *)(*((void *)&v65 + 1) + 8 * i) isEmpty])
        {
          int v33 = 0;
          id v28 = v23;
          goto LABEL_42;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v65 objects:v70 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v28 = v60;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v62;
    while (2)
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(v28);
        }
        if (![*(id *)(*((void *)&v61 + 1) + 8 * j) isEmpty])
        {
          int v33 = 0;
          goto LABEL_42;
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
      int v33 = 1;
      if (v30) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v33 = 1;
  }
LABEL_42:

  if (v18 == 1)
  {
    if (v15)
    {
      v34 = [NSString stringWithFormat:@"DELETE_WARNING_TITLE_CLIENT_%@", v20];
      v35 = PLServicesLocalizedFrameworkString();

      v36 = PFStringWithValidatedFormat();
      if (v33)
      {
        v37 = 0;
      }
      else
      {
        v37 = PLServicesLocalizedFrameworkString();
      }
    }
    else
    {
      v39 = &stru_1EEB2EB80;
      if (v33) {
        v39 = @"_EMPTY";
      }
      v40 = [NSString stringWithFormat:@"DELETE_WARNING_MESSAGE_%@%@", v20, v39];
      v35 = PLServicesLocalizedFrameworkString();

      v37 = PFStringWithValidatedFormat();
      v41 = [NSString stringWithFormat:@"DELETE_WARNING_TITLE_%@", v20];
      v42 = PLServicesLocalizedFrameworkString();

      v36 = PFStringWithValidatedFormat();
    }
LABEL_61:
    v45 = a3;
    goto LABEL_62;
  }
  if (!v15)
  {
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:a2, self, @"PLWarningHelper.m", 872, @"Invalid parameter not satisfying: %@", @"itemCount != NSNotFound" object file lineNumber description];
    }
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2, self, @"PLWarningHelper.m", 873, @"Invalid parameter not satisfying: %@", @"secondItemCount == NSNotFound" object file lineNumber description];
    }
    v43 = &stru_1EEB2EB80;
    if (v33) {
      v43 = @"_EMPTY";
    }
    v44 = [NSString stringWithFormat:@"DELETE_WARNING_TITLE_MULTIPLE_%@%@", v20, v43];
    v35 = PLServicesLocalizedFrameworkString();

    v37 = PFLocalizedStringWithValidatedFormat();
    v36 = 0;
    goto LABEL_61;
  }
  v38 = [NSString stringWithFormat:@"DELETE_WARNING_TITLE_CLIENT_%@", v20];
  v35 = PLServicesLocalizedFrameworkString();

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2 object:self file:@"PLWarningHelper.m" lineNumber:883 description:@"invalid number of items"];
  }
  v36 = PFLocalizedStringWithValidatedFormat();
  v45 = a3;
  if (v33)
  {
    v37 = 0;
  }
  else
  {
    v37 = PLServicesLocalizedFrameworkString();
  }
LABEL_62:

  char v46 = v55 ^ 1;
  if (a9 == 1) {
    char v46 = 0;
  }
  if (v46)
  {
    v48 = [NSString stringWithFormat:@"DELETE_WARNING_BUTTON_%@", v20];
    v47 = PLServicesLocalizedFrameworkString();
  }
  else
  {
    v47 = PLServicesLocalizedFrameworkString();
  }
  if (v45) {
    id *v45 = v36;
  }
  if (v57) {
    id *v57 = v37;
  }
  if (v58) {
    id *v58 = v47;
  }
}

- (id)_usedElsewhereWarningTextForAssetCount:(int64_t)a3 inLibraryScopeCount:(int64_t)a4 myAssets:(id)a5 contributors:(id)a6 inSomeAlbumCount:(int64_t)a7 affectedLocalAlbumsCount:(int64_t)a8 assetType:(signed __int16)a9 actualDeletionCount:(int64_t)a10 syndicationAssetCount:(int64_t)a11
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = PLLocalizedKeyForAssetType();
  LODWORD(a6) = [(PLPhotoLibrary *)self->_photoLibrary isCloudPhotoLibraryEnabled];
  unint64_t v65 = [v17 count];
  int v19 = (int)a6;
  if (a6)
  {
    if (a10 <= 1) {
      id v20 = &stru_1EEB2EB80;
    }
    else {
      id v20 = @"S";
    }
    v21 = [NSString stringWithFormat:@"DELETE_WARNING_ICLOUDPHOTO_%@%@", v18, v20];
    if (a4 == a3)
    {
      if (a4 <= 1) {
        id v22 = &stru_1EEB2EB80;
      }
      else {
        id v22 = @"S";
      }
      id v23 = v22;
      if ([v16 count] == a4)
      {
        if (v65 >= 3)
        {
          uint64_t v24 = NSString;
LABEL_30:
          [v24 stringWithFormat:@"SHAREDLIBRARY_DELETE_MC_WARNING_%@%@", v18, v23];
          uint64_t v35 = LABEL_43:;

          long long v68 = 0;
LABEL_44:
          v21 = (void *)v35;

          goto LABEL_45;
        }
        if (v65 == 2)
        {
          long long v61 = v23;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          obuint64_t j = v17;
          uint64_t v30 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            long long v63 = v18;
            id v60 = v16;
            uint64_t v32 = *(void *)v70;
            while (2)
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v70 != v32) {
                  objc_enumerationMutation(obj);
                }
                v34 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                if (([v34 isCurrentUser] & 1) == 0)
                {
                  long long v68 = [v34 shortName];
                  goto LABEL_83;
                }
              }
              uint64_t v31 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
              if (v31) {
                continue;
              }
              break;
            }
            long long v68 = 0;
LABEL_83:
            id v16 = v60;
            uint64_t v18 = v63;
          }
          else
          {
            long long v68 = 0;
          }

          id v23 = v61;
          uint64_t v35 = [NSString stringWithFormat:@"SHAREDLIBRARY_DELETE_MC_WARNING_FOR_CONTRIBUTOR_%%@_%@%@", v18, v61];

          goto LABEL_44;
        }
        uint64_t v24 = NSString;
      }
      else
      {
        uint64_t v24 = NSString;
        if (v65 >= 2) {
          goto LABEL_30;
        }
      }
      [v24 stringWithFormat:@"SHAREDLIBRARY_DELETE_WARNING_ICLOUD_%@%@", v18, v23];
      goto LABEL_43;
    }
    if (a4 >= 1)
    {
      uint64_t v27 = [NSString stringWithFormat:@"SHAREDLIBRARY_DELETE_WARNING_ICLOUD_MIXED_%@S", v18];

      long long v68 = 0;
      int v28 = 1;
      v21 = (void *)v27;
      goto LABEL_46;
    }
LABEL_28:
    long long v68 = 0;
LABEL_45:
    int v28 = 1;
    goto LABEL_46;
  }
  if (a7 >= 1)
  {
    uint64_t v25 = @"S";
    if (a8 == 1) {
      uint64_t v26 = &stru_1EEB2EB80;
    }
    else {
      uint64_t v26 = @"S";
    }
    if (a7 < a3 || a10 > a3)
    {
      [NSString stringWithFormat:@"DELETE_WARNING_ALBUM%@_SOME_%@S", v26, v18, v59];
    }
    else
    {
      if (a3 == 1) {
        uint64_t v25 = &stru_1EEB2EB80;
      }
      [NSString stringWithFormat:@"DELETE_WARNING_ALBUM%@_%@%@", v26, v18, v25];
    v21 = };
    goto LABEL_28;
  }
  uint64_t v29 = &stru_1EEB2EB80;
  if (a10 > 1) {
    uint64_t v29 = @"S";
  }
  v21 = [NSString stringWithFormat:@"DELETE_WARNING_NO_ICLOUDPHOTO_%@%@", v18, v29];
  long long v68 = 0;
  int v28 = 0;
LABEL_46:
  if (!v21)
  {
    v42 = 0;
    int v39 = v19;
    v43 = 0;
    goto LABEL_70;
  }
  if (a11 > 0) {
    int v36 = v28;
  }
  else {
    int v36 = 0;
  }
  if (v36 == 1)
  {
    uint64_t v37 = [v21 stringByAppendingString:@"_SYNDICATION"];

    v21 = (void *)v37;
  }
  BOOL v38 = a4 == a3;
  int v39 = v19;
  if (v38) {
    char v40 = v19 ^ 1;
  }
  else {
    char v40 = 1;
  }
  if ((v40 & 1) == 0)
  {
    if (v65 < 3)
    {
      v43 = PLServicesSharedLibraryLocalizedFrameworkString();
LABEL_66:
      uint64_t v44 = PFLocalizedStringWithValidatedFormat();
      goto LABEL_67;
    }
    uint64_t v41 = PLServicesSharedLibraryLocalizedFrameworkString();
LABEL_65:
    v43 = (void *)v41;
    goto LABEL_66;
  }
  if (a4 < 1 || ((v19 ^ 1) & 1) != 0)
  {
    uint64_t v41 = PLServicesLocalizedFrameworkString();
    goto LABEL_65;
  }
  v42 = PLServicesSharedLibraryLocalizedFrameworkString();
  if (v36)
  {
    v43 = 0;
    goto LABEL_68;
  }
  uint64_t v44 = PFLocalizedStringWithValidatedFormat();
  v43 = v42;
LABEL_67:
  v42 = (void *)v44;
LABEL_68:
  if (a8 != 1)
  {
    uint64_t v45 = PFLocalizedStringWithValidatedFormat();

    v42 = (void *)v45;
  }
LABEL_70:
  if (a11 >= 1)
  {
    long long v67 = v43;
    char v46 = @"S";
    if (a11 == 1) {
      char v46 = &stru_1EEB2EB80;
    }
    long long v64 = v18;
    v47 = [NSString stringWithFormat:@"DELETE_WARNING_SYNDICATION_COMBINED_%@%@", v18, v46];
    v48 = PLServicesLocalizedFrameworkString();
    if ([v42 length])
    {
      uint64_t v49 = PLServicesLocalizedFrameworkString();
      PFStringWithValidatedFormat();
      id v50 = (id)objc_claimAutoreleasedReturnValue();

      v42 = (void *)v49;
    }
    else
    {
      id v50 = v48;
    }

    if (a4 >= 1 && ((v39 ^ 1) & 1) == 0)
    {
      v51 = PLServicesLocalizedFrameworkString();
      v52 = PLServicesSharedLibraryLocalizedFrameworkString();
      v58 = PFLocalizedStringWithValidatedFormat();
      PFStringWithValidatedFormat();
      id v53 = v17;
      uint64_t v55 = v54 = v16;

      id v50 = (id)v55;
      id v16 = v54;
      id v17 = v53;
    }

    v42 = v50;
    uint64_t v18 = v64;
    v43 = v67;
  }
  id v56 = v42;

  return v56;
}

- (id)_usedElsewhereWarningTextForAssets:(id)a3 actualDeletionCount:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(PLWarningHelper *)self _assetsInLibraryScopeCountFromAssets:v6];
  uint64_t v8 = [v6 count];
  uint64_t v24 = 0;
  char v9 = [(PLWarningHelper *)self photoLibrary];
  uint64_t v10 = [v9 countOfLocalAlbumsContainingAssets:v6 assetsInSomeAlbumCount:&v24];

  int64_t v11 = [(PLWarningHelper *)self _syndicationAssetCount];
  int64_t v12 = v11;
  if (v11 >= v8) {
    int64_t v13 = 0;
  }
  else {
    int64_t v13 = v11;
  }
  uint64_t v14 = v8 - v13;
  if (v11 >= a4) {
    int64_t v15 = 0;
  }
  else {
    int64_t v15 = v11;
  }
  int64_t v16 = a4 - v15;
  if (v11 < 1)
  {
    int64_t v17 = a4;
  }
  else
  {
    uint64_t v8 = v14;
    int64_t v17 = v16;
  }
  __int16 v18 = PLAssetTypeForItems();
  int v19 = [(PLWarningHelper *)self _myAssetsFromAssets:v6];
  id v20 = [(PLWarningHelper *)self _contributorsForAssets:v6];
  LOWORD(v23) = v18;
  v21 = [(PLWarningHelper *)self _usedElsewhereWarningTextForAssetCount:v8 inLibraryScopeCount:v7 myAssets:v19 contributors:v20 inSomeAlbumCount:v24 affectedLocalAlbumsCount:v10 assetType:v23 actualDeletionCount:v17 syndicationAssetCount:v12];

  return v21;
}

- (id)_cloudSharedWarningTextForAssetCount:(int64_t)a3 assetType:(signed __int16)a4 albumTitle:(id)a5
{
  id v6 = a5;
  unint64_t v7 = PLLocalizedKeyForAssetType();
  id v8 = [NSString alloc];
  if (a3 == 1) {
    char v9 = @"DELETE_SHARED_STREAM_%@_WARNING";
  }
  else {
    char v9 = @"DELETE_SHARED_STREAM_%@S_WARNING";
  }
  uint64_t v10 = objc_msgSend(v8, "initWithFormat:", v9, v7);
  int64_t v11 = PLServicesLocalizedFrameworkString();
  int64_t v12 = PFStringWithValidatedFormat();

  return v12;
}

- (id)_cloudSharedWarningTextForAssets:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isCloudSharedAsset", (void)v15))
        {

          uint64_t v11 = PLAssetTypeForItems();
          int64_t v12 = [v4 lastObject];
          int64_t v13 = [v12 cloudShareAlbum];
          uint64_t v10 = [v13 localizedTitle];

          char v9 = -[PLWarningHelper _cloudSharedWarningTextForAssetCount:assetType:albumTitle:](self, "_cloudSharedWarningTextForAssetCount:assetType:albumTitle:", [v4 count], v11, v10);
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  char v9 = 0;
  uint64_t v10 = v4;
LABEL_11:

  return v9;
}

- (id)_avalancheDeleteWarningForAvalancheStacksCount:(int64_t)a3 nonAvalancheItemsToDeleteCount:(int64_t)a4 nonAvalancheItemsToDeleteType:(signed __int16)a5 avalanchePhotosToDeleteCount:(int64_t)a6 survivingAvalancheFavoritesCount:(int64_t)a7 avalancheUnrelatedFavoritesCount:(int64_t)a8 assetCount:(int64_t)a9
{
  if (a3 >= 1 && !a4)
  {
    uint64_t v14 = @"N";
    if (a7 < 1)
    {
      if (a6 == 1) {
        uint64_t v23 = @"1";
      }
      else {
        uint64_t v23 = @"N";
      }
      if (a3 == 1) {
        uint64_t v14 = @"1";
      }
      long long v18 = [NSString stringWithFormat:@"DELETE_CONF_AVALANCHE_STACKS_ONLY_%@_%@", v23, v14];
      int v19 = PLServicesLocalizedFrameworkString();
      if (((unint64_t)a3 < 2 || a6 < 2) && (unint64_t)a3 < 2 && a6 < 2) {
        goto LABEL_131;
      }
    }
    else
    {
      if (a3 == 1) {
        long long v15 = @"1";
      }
      else {
        long long v15 = @"N";
      }
      if (a6 == 1) {
        long long v16 = @"1";
      }
      else {
        long long v16 = @"N";
      }
      if (a7 == 1)
      {
        uint64_t v14 = @"1";
        BOOL v17 = 0;
      }
      else
      {
        BOOL v17 = a6 > 1;
      }
      long long v18 = [NSString stringWithFormat:@"DELETE_CONF_AVALANCHE_STACKS_ONLY_KEEP_FAVORITES_%@_%@_%@", v14, v16, v15];
      int v19 = PLServicesLocalizedFrameworkString();
      if ((unint64_t)a3 < 2 || !v17)
      {
        char v24 = !v17;
        if (a3 != 1) {
          char v24 = 1;
        }
        if (v24)
        {
          BOOL v36 = a6 != 1 || a7 == 1;
          BOOL v37 = !v36;
          if ((unint64_t)a3 < 2 || !v37)
          {
            char v40 = !v37;
            if (a3 != 1) {
              char v40 = 1;
            }
            if (v40)
            {
              BOOL v45 = a6 > 1 && a7 == 1;
              BOOL v46 = v45;
              if ((unint64_t)a3 < 2 || !v46)
              {
                char v47 = !v46;
                if (a3 != 1) {
                  char v47 = 1;
                }
                if ((v47 & 1) != 0 && ((unint64_t)a3 < 2 || a6 != 1 || a7 != 1))
                {
LABEL_131:
                  id v41 = v19;
                  goto LABEL_101;
                }
              }
            }
          }
        }
      }
    }
    PFLocalizedStringWithValidatedFormat();
    id v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_101:
    v21 = v41;

LABEL_138:
    goto LABEL_139;
  }
  if (a3 >= 1 && a4 >= 1)
  {
    if (a5 > 3) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = off_1E58663A0[(unsigned __int16)a5];
    }
    uint64_t v25 = @"N";
    if (a7 < 1)
    {
      if (a4 == 1) {
        int v33 = @"1";
      }
      else {
        int v33 = @"N";
      }
      if (a3 == 1) {
        v34 = @"1";
      }
      else {
        v34 = @"N";
      }
      if (a6 == 1) {
        uint64_t v25 = @"1";
      }
      BOOL v35 = a6 > 1 && (unint64_t)a3 > 1;
      uint64_t v31 = [NSString stringWithFormat:@"DELETE_CONF_AVALANCHE_STACKS_AND_OTHERS_%@_%@_%@%@", v25, v34, v33, v20];
      uint64_t v32 = PLServicesLocalizedFrameworkString();
      if ((unint64_t)a4 < 2 || !v35)
      {
        char v39 = !v35;
        if (a4 != 1) {
          char v39 = 1;
        }
        if (v39)
        {
          BOOL v43 = a3 != 1 || a6 <= 1;
          BOOL v44 = !v43;
          if ((unint64_t)a4 < 2 || !v44)
          {
            char v52 = !v44;
            if (a4 != 1) {
              char v52 = 1;
            }
            if (v52)
            {
              BOOL v56 = (unint64_t)a3 > 1 && a6 == 1;
              BOOL v57 = v56;
              if ((unint64_t)a4 < 2 || !v57)
              {
                char v59 = !v57;
                if (a4 != 1) {
                  char v59 = 1;
                }
                if ((v59 & 1) != 0 && ((unint64_t)a4 < 2 || a3 != 1 || a6 != 1)) {
                  goto LABEL_223;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      if (a4 == 1) {
        uint64_t v26 = @"1";
      }
      else {
        uint64_t v26 = @"N";
      }
      if (a6 == 1) {
        uint64_t v27 = @"1";
      }
      else {
        uint64_t v27 = @"N";
      }
      if (a7 == 1) {
        int v28 = @"1";
      }
      else {
        int v28 = @"N";
      }
      BOOL v29 = a7 != 1 && a6 > 1;
      if (a3 == 1) {
        uint64_t v25 = @"1";
      }
      BOOL v30 = (unint64_t)a3 > 1 && v29;
      uint64_t v31 = [NSString stringWithFormat:@"DELETE_CONF_AVALANCHE_STACKS_AND_OTHERS_KEEP_FAVORITES_%@_%@_%@_%@%@", v28, v27, v25, v26, v20];
      uint64_t v32 = PLServicesLocalizedFrameworkString();
      if ((unint64_t)a4 < 2 || !v30)
      {
        char v38 = !v30;
        if (a4 != 1) {
          char v38 = 1;
        }
        if (v38)
        {
          BOOL v42 = a3 == 1 && v29;
          if ((unint64_t)a4 < 2 || !v42)
          {
            char v48 = !v42;
            if (a4 != 1) {
              char v48 = 1;
            }
            if (v48)
            {
              BOOL v53 = (unint64_t)a3 > 1;
              BOOL v54 = a6 != 1 || a7 == 1;
              int v55 = !v54;
              if (v54) {
                BOOL v53 = 0;
              }
              if ((unint64_t)a4 < 2 || !v53)
              {
                char v58 = !v53;
                if (a4 != 1) {
                  char v58 = 1;
                }
                if (v58)
                {
                  if (a3 != 1) {
                    int v55 = 0;
                  }
                  if ((unint64_t)a4 < 2 || !v55)
                  {
                    char v60 = v55 ^ 1;
                    if (a4 != 1) {
                      char v60 = 1;
                    }
                    if (v60)
                    {
                      BOOL v61 = (unint64_t)a3 > 1;
                      BOOL v62 = a6 > 1 && a7 == 1;
                      int v63 = v62;
                      if (!v62) {
                        BOOL v61 = 0;
                      }
                      if ((unint64_t)a4 < 2 || !v61)
                      {
                        char v64 = !v61;
                        if (a4 != 1) {
                          char v64 = 1;
                        }
                        if (v64)
                        {
                          if (a3 != 1) {
                            int v63 = 0;
                          }
                          if ((unint64_t)a4 < 2 || !v63)
                          {
                            char v65 = v63 ^ 1;
                            if (a4 != 1) {
                              char v65 = 1;
                            }
                            if (v65)
                            {
                              BOOL v66 = (unint64_t)a3 > 1;
                              BOOL v67 = a6 == 1 && a7 == 1;
                              int v68 = v67;
                              if (!v67) {
                                BOOL v66 = 0;
                              }
                              if ((unint64_t)a4 < 2 || !v66)
                              {
                                char v69 = !v66;
                                if (a4 != 1) {
                                  char v69 = 1;
                                }
                                if (v69)
                                {
                                  if (a3 != 1) {
                                    int v68 = 0;
                                  }
                                  if ((unint64_t)a4 < 2 || !v68)
                                  {
LABEL_223:
                                    id v49 = v32;
                                    uint64_t v32 = v49;
                                    goto LABEL_136;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    PFLocalizedStringWithValidatedFormat();
    id v49 = (id)objc_claimAutoreleasedReturnValue();
LABEL_136:
    v21 = v49;

    if (a8 < 1) {
      goto LABEL_139;
    }
    PLServicesLocalizedFrameworkString();
    long long v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = PFStringWithValidatedFormat();

    v21 = (void *)v50;
    goto LABEL_138;
  }
  v21 = 0;
  if (!a3 && a8 >= 1)
  {
    if (a8 == a9)
    {
      id v22 = @"N";
      if (a8 == 1) {
        id v22 = @"1";
      }
      long long v18 = [NSString stringWithFormat:@"DELETE_CONF_AVALANCHE_FAVORITES_ONLY_%@", v22];
    }
    else
    {
      long long v18 = @"DELETE_CONF_AVALANCHE_FAVORITES_ONLY_SOME";
    }
    v21 = PLServicesLocalizedFrameworkString();
    goto LABEL_138;
  }
LABEL_139:
  return v21;
}

- (void)getAvalancheDeleteWarning:(id *)a3 actualDeletionCount:(int64_t *)a4 forAssets:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v41 = 0;
    uint64_t v8 = *(void *)v52;
    char v9 = @"Error fetching avalanche with UUID: %@ for asset %@";
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v11 isAvalancheStackPhoto]
          && [v11 isPartOfBurst])
        {
          int64_t v12 = [v11 avalancheUUID];
          if (v12
            && (int64_t v13 = [PLAvalanche alloc],
                [v11 photoLibrary],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                long long v15 = [(PLAvalanche *)v13 initWithUUID:v12 photoLibrary:v14],
                v14,
                v15))
          {
            long long v16 = v44;
            if (!v44)
            {
              BOOL v17 = v9;
              long long v18 = (void *)MEMORY[0x1E4F1CA60];
              uint64_t v19 = [v5 count];
              uint64_t v20 = v18;
              char v9 = v17;
              long long v16 = [v20 dictionaryWithCapacity:v19];
            }
            BOOL v44 = v16;
            [v16 setObject:v15 forKey:v12];
            ++v41;
            uint64_t v21 = [(PLAvalanche *)v15 assetsCount];
            id v22 = [(PLAvalanche *)v15 userFavorites];
            uint64_t v23 = [v22 count];

            v45 += v23;
            uint64_t v46 = v21 + v46 - v23;
          }
          else
          {
            NSLog(&v9->isa, v12, v11);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v7);
  }
  else
  {
    BOOL v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v41 = 0;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v5;
  uint64_t v24 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v24)
  {
    uint64_t v42 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    goto LABEL_39;
  }
  uint64_t v25 = v24;
  uint64_t v42 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = *(void *)v48;
  do
  {
    for (uint64_t j = 0; j != v25; ++j)
    {
      if (*(void *)v48 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v31 = *(void **)(*((void *)&v47 + 1) + 8 * j);
      if (![v31 isAvalancheStackPhoto] || (objc_msgSend(v31, "isPartOfBurst") & 1) == 0)
      {
        char v32 = [v31 avalanchePickType];
        if ((v32 & 8) != 0)
        {
          int v33 = [v31 avalancheUUID];
          v34 = [v44 objectForKey:v33];

          if (v34)
          {
            uint64_t v35 = 0;
            --v45;
            ++v46;
LABEL_34:
            v28 += v35;
            continue;
          }
        }
        if ([v31 isPhoto]) {
          ++v26;
        }
        else {
          v42 += [v31 isVideo];
        }
        ++v27;
        if ((v32 & 8) != 0)
        {
          uint64_t v35 = 1;
          goto LABEL_34;
        }
      }
    }
    uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  }
  while (v25);
LABEL_39:

  if (a4) {
    *a4 = v46 + v27;
  }
  if (a3)
  {
    uint64_t v36 = 3;
    if (v27 >= 1 && (v26 < 1 || v42 <= 0))
    {
      if (v42 > 0) {
        unsigned int v37 = 1;
      }
      else {
        unsigned int v37 = 3;
      }
      if (v26 > 0) {
        unsigned int v37 = 0;
      }
      if (v26 | v42) {
        uint64_t v36 = v37;
      }
      else {
        uint64_t v36 = 3;
      }
    }
    -[PLWarningHelper _avalancheDeleteWarningForAvalancheStacksCount:nonAvalancheItemsToDeleteCount:nonAvalancheItemsToDeleteType:avalanchePhotosToDeleteCount:survivingAvalancheFavoritesCount:avalancheUnrelatedFavoritesCount:assetCount:](self, "_avalancheDeleteWarningForAvalancheStacksCount:nonAvalancheItemsToDeleteCount:nonAvalancheItemsToDeleteType:avalanchePhotosToDeleteCount:survivingAvalancheFavoritesCount:avalancheUnrelatedFavoritesCount:assetCount:", v41, v27, v36, v46, v45, v28, [obj count]);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_getExpungeWarningMessage:(id *)a3 buttonTitle:(id *)a4 forAssetCount:(int64_t)a5 assetType:(signed __int16)a6 iCPLEnabled:(BOOL)a7 contributors:(id)a8 deviceModelName:(id)a9
{
  BOOL v9 = a7;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  id v14 = a9;
  long long v15 = PLLocalizedKeyForAssetType();
  long long v16 = &stru_1EEB2EB80;
  if (a5 > 1) {
    long long v16 = @"S";
  }
  BOOL v17 = v16;
  unint64_t v18 = [v13 count];
  if (v9)
  {
    if (v18 < 3)
    {
      if (v18 == 2)
      {
        id v28 = v14;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v29 = v13;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          BOOL v43 = a4;
          uint64_t v32 = *(void *)v45;
          while (2)
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v45 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if (([v34 isCurrentUser] & 1) == 0)
              {
                uint64_t v35 = [v34 shortName];
                goto LABEL_27;
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v31) {
              continue;
            }
            break;
          }
          uint64_t v35 = 0;
LABEL_27:
          a4 = v43;
        }
        else
        {
          uint64_t v35 = 0;
        }

        uint64_t v19 = [NSString stringWithFormat:@"SHAREDLIBRARY_EXPUNGE_MC_WARNING_FOR_CONTRIBUTOR_%%@_%@%@", v15, v17];
        char v38 = PLServicesSharedLibraryLocalizedFrameworkString();
        uint64_t v23 = PFLocalizedStringWithValidatedFormat();

        id v14 = v28;
        goto LABEL_30;
      }
      uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"EXPUNGE_%@%@_WARNING_MESSAGE_WITH_ICLOUD_ON", v15, v17];
      uint64_t v20 = PLServicesLocalizedFrameworkString();
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"SHAREDLIBRARY_EXPUNGE_MC_WARNING_%@%@", v15, v17];
      uint64_t v20 = PLServicesSharedLibraryLocalizedFrameworkString();
    }
    uint64_t v23 = (void *)v20;
LABEL_30:
    unsigned int v37 = PLServicesLocalizedFrameworkString();
    goto LABEL_31;
  }
  uint64_t v42 = a3;
  uint64_t v21 = v17;
  uint64_t v41 = v17;
  id v22 = v15;
  uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"EXPUNGE_%@%@_WARNING_MESSAGE_WITH_ICLOUD_OFF", v15, v41];
  uint64_t v23 = PLServicesLocalizedFrameworkString();
  id v24 = v13;
  if ([v14 isEqualToString:@"iPhone"])
  {
    id v25 = v14;
    uint64_t v26 = a4;
    uint64_t v27 = @"IPHONE";
  }
  else
  {
    uint64_t v26 = a4;
    if ([v14 isEqualToString:@"iPad"])
    {
      id v25 = v14;
      uint64_t v27 = @"IPAD";
    }
    else
    {
      id v25 = v14;
      if ([v14 isEqualToString:@"iPod touch"]) {
        uint64_t v27 = @"IPOD_TOUCH";
      }
      else {
        uint64_t v27 = @"DEVICE";
      }
    }
  }
  uint64_t v36 = (void *)[[NSString alloc] initWithFormat:@"EXPUNGE_BUTTON_TITLE_VIDEO_WITH_ICLOUD_OFF_%@", v27];
  unsigned int v37 = PLServicesLocalizedFrameworkString();

  a4 = v26;
  a3 = v42;
  id v14 = v25;
  id v13 = v24;
  long long v15 = v22;
  BOOL v17 = v21;
LABEL_31:
  id v39 = v23;
  *a3 = v39;
  id v40 = v37;
  *a4 = v40;
}

- (id)_contributorsForAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasLibraryScope", (void)v13))
        {
          uint64_t v11 = [v10 libraryScopeContributors];
          [v4 unionSet:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_myAssetsFromAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "shareState", (void)v12) == 1) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)getExpungeWarningMessage:(id *)a3 buttonTitle:(id *)a4 forAssets:(id)a5
{
  id v9 = a5;
  uint64_t v10 = [v9 count];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLWarningHelper.m", 233, @"Invalid parameter not satisfying: %@", @"outMessage" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PLWarningHelper.m", 234, @"Invalid parameter not satisfying: %@", @"outButtonTitle" object file lineNumber description];

LABEL_3:
  if (v10 <= 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLWarningHelper.m", 235, @"Invalid parameter not satisfying: %@", @"assetCount > 0" object file lineNumber description];
  }
  uint64_t v11 = PLAssetTypeForItems();
  BOOL v12 = [(PLPhotoLibrary *)self->_photoLibrary isCloudPhotoLibraryEnabled];
  id v17 = [(PLWarningHelper *)self _contributorsForAssets:v9];

  long long v13 = DCIM_currentDeviceModelName();
  [(PLWarningHelper *)self _getExpungeWarningMessage:a3 buttonTitle:a4 forAssetCount:v10 assetType:v11 iCPLEnabled:v12 contributors:v17 deviceModelName:v13];
}

- (void)_getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5
{
  id v9 = [(PLWarningHelper *)self _assets];
  unint64_t v10 = [(PLWarningHelper *)self _style];
  uint64_t v39 = [v9 count];
  uint64_t v11 = [(PLWarningHelper *)self _cloudSharedWarningTextForAssets:v9];
  unsigned int v37 = v11;
  if (v11)
  {
    id v36 = v11;
  }
  else
  {
    id v38 = 0;
    [(PLWarningHelper *)self getAvalancheDeleteWarning:&v38 actualDeletionCount:&v39 forAssets:v9];
    id v12 = v38;
    uint64_t v13 = [(PLWarningHelper *)self _usedElsewhereWarningTextForAssets:v9 actualDeletionCount:v39];
    long long v14 = (void *)v13;
    if (v12 && v13)
    {
      if (v10 > 1)
      {
        long long v16 = 0;
      }
      else
      {
        long long v16 = PLServicesLocalizedFrameworkString();
      }
      id v34 = v12;
      uint64_t v35 = v14;
      PFLocalizedStringWithValidatedFormat();
      id v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12) {
        long long v15 = v12;
      }
      else {
        long long v15 = (void *)v13;
      }
      id v36 = v15;
    }
  }
  id v17 = PLSuffixForItems();
  if ([(PLWarningHelper *)self _hasAssetsInLibraryScope:v9])
  {
    uint64_t v18 = PLServicesSharedLibraryLocalizedFrameworkString();
  }
  else
  {
    uint64_t v19 = a4;
    uint64_t v20 = a5;
    uint64_t v21 = @"DELETE_BUTTON_TITLE_";
    if (v10) {
      uint64_t v21 = 0;
    }
    if (v10 == 1) {
      id v22 = @"DELETE_BUTTON_COMPACT_TITLE_";
    }
    else {
      id v22 = v21;
    }
    BOOL v23 = v10 == 1;
    if (v39 == 1) {
      id v24 = &stru_1EEB2EB80;
    }
    else {
      id v24 = @"S";
    }
    id v25 = [(__CFString *)v22 stringByAppendingFormat:@"%@%@", v17, v24];
    uint64_t v26 = PLServicesLocalizedFrameworkString();

    if (v23 || v39 == 1)
    {
      id v27 = v26;
    }
    else
    {
      id v34 = (id)v39;
      PFLocalizedStringWithValidatedFormat();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v18 = v27;

    a5 = v20;
    a4 = v19;
  }
  id v28 = [(PLWarningHelper *)self _clientName];
  if ([v28 length])
  {
    id v29 = a4;
    if (v39 == 1) {
      uint64_t v30 = &stru_1EEB2EB80;
    }
    else {
      uint64_t v30 = @"S";
    }
    uint64_t v31 = [NSString stringWithFormat:@"DELETE_WARNING_TITLE_CLIENT_%@%@", v17, v30];
    uint64_t v32 = PLServicesLocalizedFrameworkString();

    int v33 = PFLocalizedStringWithValidatedFormat();
    a4 = v29;

    if (a3) {
      goto LABEL_37;
    }
  }
  else
  {
    int v33 = 0;
    if (a3) {
LABEL_37:
    }
      *a3 = v33;
  }
  if (a4) {
    *a4 = v36;
  }
  if (a5) {
    *a5 = v18;
  }
}

- (void)getDeletionWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAssets:(id)a6 syndicationAssetCount:(int64_t)a7 clientName:(id)a8 style:(int64_t)a9
{
  id v15 = a8;
  [(PLWarningHelper *)self set_assets:a6];
  [(PLWarningHelper *)self set_syndicationAssetCount:a7];
  [(PLWarningHelper *)self set_clientName:v15];

  [(PLWarningHelper *)self set_style:a9];
  [(PLWarningHelper *)self _getDeletionWarningTitle:a3 message:a4 buttonTitle:a5];
}

- (BOOL)_hasAssetsInLibraryScope:(id)a3
{
  return [(PLWarningHelper *)self _assetsInLibraryScopeCountFromAssets:a3] != 0;
}

- (unint64_t)_assetsInLibraryScopeCountFromAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLWarningHelper *)self _isExitingSharedLibrary])
  {
    unint64_t v5 = 0;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v5 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "libraryScope", (void)v13);

          if (v11) {
            ++v5;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (BOOL)_isExitingSharedLibrary
{
  uint64_t v2 = [(PLWarningHelper *)self photoLibrary];
  id v3 = [v2 managedObjectContext];
  id v4 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v3];

  if (v4) {
    BOOL v5 = [v4 exitState] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_getWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forItemSuffix:(id)a6 count:(unint64_t)a7 operation:(int64_t)a8 clientName:(id)a9
{
  id v22 = a9;
  if (a8) {
    long long v14 = 0;
  }
  else {
    long long v14 = @"HIDE";
  }
  long long v15 = NSString;
  id v16 = a6;
  id v17 = [v15 stringWithFormat:@"WARNING_TITLE_%@_%@_CLIENT", v14, v16];
  uint64_t v18 = PLServicesLocalizedFrameworkString();

  uint64_t v19 = PFStringWithValidatedFormat();
  uint64_t v20 = [NSString stringWithFormat:@"WARNING_BUTTON_%@_%@", v14, v16];

  uint64_t v21 = PLServicesLocalizedFrameworkString();
  if (a3) {
    *a3 = v19;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = v21;
  }
}

- (void)getWarningTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 forAssets:(id)a6 operation:(int64_t)a7 clientName:(id)a8
{
  id v18 = a8;
  id v14 = a6;
  long long v15 = PLSuffixForItems();
  uint64_t v16 = [v14 count];

  if (v16 != 1)
  {
    uint64_t v17 = [v15 stringByAppendingString:@"S"];

    long long v15 = (void *)v17;
  }
  [(PLWarningHelper *)self _getWarningTitle:a3 message:a4 buttonTitle:a5 forItemSuffix:v15 count:v16 operation:a7 clientName:v18];
}

- (PLWarningHelper)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLWarningHelper;
  id v6 = [(PLWarningHelper *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
  }

  return v7;
}

@end