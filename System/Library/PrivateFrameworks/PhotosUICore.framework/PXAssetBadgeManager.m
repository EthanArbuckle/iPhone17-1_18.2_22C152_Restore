@interface PXAssetBadgeManager
+ (PXAssetBadgeManager)defaultManager;
- (PXAssetBadgeInfo)badgeInfoForAsset:(SEL)a3 inCollection:(id)a4 options:(id)a5;
- (PXAssetBadgeInfo)badgeInfoForCollection:(SEL)a3 options:(id)a4;
@end

@implementation PXAssetBadgeManager

- (PXAssetBadgeInfo)badgeInfoForAsset:(SEL)a3 inCollection:(id)a4 options:(id)a5
{
  char v6 = a6;
  id v8 = a4;
  v9 = v8;
  long long v10 = *((_OWORD *)off_1E5DAAEC8 + 1);
  *(_OWORD *)&retstr->badges = *(_OWORD *)off_1E5DAAEC8;
  *(_OWORD *)&retstr->count = v10;
  if (v8)
  {
    int v11 = [v8 mediaSubtypes];
    if (PXDisplayAssetSupportsSyndication(v9) && PXDisplayAssetIsSyndicatedAndUnsaved(v9))
    {
      id v12 = v9;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }

      v14 = [v13 photoLibrary];

      if (v14)
      {
        v15 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v14];
        if ([v15 showUnsavedSyndicatedContentInPhotosGrids]) {
          retstr->badges |= 0x80000000uLL;
        }
      }
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = [v9 playbackStyle];
    }
    else {
      uint64_t v16 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      int v17 = [v9 playbackVariation];
    }
    else {
      int v17 = 0;
    }
    if ([v9 isFavorite])
    {
      retstr->badges |= 1uLL;
      if ((v11 & 1) == 0)
      {
LABEL_21:
        if ((v11 & 2) == 0) {
          goto LABEL_22;
        }
        goto LABEL_28;
      }
    }
    else if ((v11 & 1) == 0)
    {
      goto LABEL_21;
    }
    retstr->badges |= 2uLL;
    if ((v11 & 2) == 0)
    {
LABEL_22:
      if ((v11 & 0x100000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
LABEL_28:
    retstr->badges |= 4uLL;
    if ((v11 & 0x100000) == 0)
    {
LABEL_23:
      if ((v11 & 0x10) == 0) {
        goto LABEL_24;
      }
      goto LABEL_30;
    }
LABEL_29:
    retstr->badges |= 0x400uLL;
    if ((v11 & 0x10) == 0)
    {
LABEL_24:
      if ((v6 & 4) != 0) {
        goto LABEL_33;
      }
LABEL_31:
      if (v16 == 4)
      {
        [v9 duration];
        retstr->duration = v18;
      }
LABEL_33:
      if ((v6 & 8) != 0 && (objc_opt_respondsToSelector() & 1) != 0 && [v9 isSpatialMedia]) {
        retstr->badges |= 0x20000000000uLL;
      }
      if (v17 == 1 && v16 == 5)
      {
        uint64_t v19 = 128;
      }
      else if (v17 == 2 && v16 == 5)
      {
        uint64_t v19 = 256;
      }
      else if (v17 == 3)
      {
        uint64_t v19 = 512;
      }
      else
      {
        uint64_t v19 = 64;
        if (v16 != 3 && (v11 & 8) == 0)
        {
LABEL_48:
          if (v6 & 2) != 0 && (objc_opt_respondsToSelector())
          {
            int64_t v20 = [v9 originalFileSize];
            if (v20 >= 1)
            {
              retstr->badges |= 0x10000000000uLL;
              retstr->fileSize = v20;
            }
          }
          v21 = +[PXPhotosDetailsSettings sharedInstance];
          v22 = v21;
          if (v21) {
            [v21 debugBadgeInfo];
          }

          PXAssetBadgeInfoIsNull();
        }
      }
      retstr->badges |= v19;
      goto LABEL_48;
    }
LABEL_30:
    retstr->badges |= 0x10uLL;
    if ((v6 & 4) != 0) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }

  return result;
}

+ (PXAssetBadgeManager)defaultManager
{
  if (defaultManager_onceToken_109747 != -1) {
    dispatch_once(&defaultManager_onceToken_109747, &__block_literal_global_109748);
  }
  v2 = (void *)defaultManager_defaultManager_109749;
  return (PXAssetBadgeManager *)v2;
}

void __37__PXAssetBadgeManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(PXAssetBadgeManager);
  v1 = (void *)defaultManager_defaultManager_109749;
  defaultManager_defaultManager_109749 = (uint64_t)v0;
}

- (PXAssetBadgeInfo)badgeInfoForCollection:(SEL)a3 options:(id)a4
{
  id v12 = a4;
  long long v6 = *((_OWORD *)off_1E5DAAEC8 + 1);
  *(_OWORD *)&retstr->badges = *(_OWORD *)off_1E5DAAEC8;
  *(_OWORD *)&retstr->count = v6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v12;
  if (isKindOfClass)
  {
    uint64_t v9 = [v12 assetCollectionSubtype];
    if (v9 == 203)
    {
      uint64_t v10 = 1;
      id v8 = v12;
    }
    else
    {
      id v8 = v12;
      if (v9 != 201) {
        goto LABEL_7;
      }
      uint64_t v10 = 2;
    }
    retstr->badges |= v10;
  }
LABEL_7:

  return result;
}

@end