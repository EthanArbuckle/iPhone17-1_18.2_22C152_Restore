@interface PUOneUpCommentsInfoProvider
+ (BOOL)_canHandleDisplayAsset:(id)a3;
+ (BOOL)hasUserLikedDisplayAsset:(id)a3;
+ (unint64_t)commentCountForDisplayAsset:(id)a3;
+ (unint64_t)likeCountForDisplayAsset:(id)a3;
+ (void)toggleLike:(BOOL)a3 forDisplayAsset:(id)a4;
@end

@implementation PUOneUpCommentsInfoProvider

+ (BOOL)_canHandleDisplayAsset:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isCloudSharedAsset];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (void)toggleLike:(BOOL)a3 forDisplayAsset:(id)a4
{
  BOOL v4 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a1 _canHandleDisplayAsset:v6])
  {
    id v7 = v6;
    v8 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
    v9 = objc_msgSend(v7, "pl_managedAssetFromPhotoLibrary:", v8);

    v10 = [v9 photoLibrary];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __58__PUOneUpCommentsInfoProvider_toggleLike_forDisplayAsset___block_invoke;
    v19 = &unk_1E5F2DCD0;
    BOOL v22 = v4;
    id v20 = v7;
    id v21 = v9;
    id v11 = v9;
    id v12 = v7;
    [v10 performTransaction:&v16];

    v13 = (void *)MEMORY[0x1E4F56658];
    if (v4) {
      v14 = @"com.apple.photos.CPAnalytics.oneUpSharedAssetLiked";
    }
    else {
      v14 = @"com.apple.photos.CPAnalytics.oneUpSharedAssetUnliked";
    }
    uint64_t v23 = *MEMORY[0x1E4F56558];
    v24[0] = v12;
    v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1, v16, v17, v18, v19);
    [v13 sendEvent:v14 withPayload:v15];
  }
}

uint64_t __58__PUOneUpCommentsInfoProvider_toggleLike_forDisplayAsset___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v3)
    {
      BOOL v4 = [*(id *)(a1 + 32) uuid];
      v5 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)v9 = 138543618;
      *(void *)&v9[4] = v4;
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = v5;
      id v6 = MEMORY[0x1E4F14500];
      id v7 = "[79401480]: LIKING PHAsset (%{public}@), PLAsset (%{public}@)";
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, v7, v9, 0x16u);
    }
  }
  else if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) uuid];
    v5 = [*(id *)(a1 + 40) uuid];
    *(_DWORD *)v9 = 138543618;
    *(void *)&v9[4] = v4;
    *(_WORD *)&v9[12] = 2114;
    *(void *)&v9[14] = v5;
    id v6 = MEMORY[0x1E4F14500];
    id v7 = "[79401480]: UNLIKING PHAsset (%{public}@), PLAsset (%{public}@)";
    goto LABEL_6;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setUserCloudSharedLiked:", *(unsigned __int8 *)(a1 + 48), *(_OWORD *)v9, *(void *)&v9[16], v10);
}

+ (BOOL)hasUserLikedDisplayAsset:(id)a3
{
  id v4 = a3;
  if ([a1 _canHandleDisplayAsset:v4])
  {
    v5 = [v4 commentProperties];
    char v6 = [v5 hasUserLiked];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (unint64_t)likeCountForDisplayAsset:(id)a3
{
  id v4 = a3;
  if ([a1 _canHandleDisplayAsset:v4])
  {
    v5 = [v4 commentProperties];
    unint64_t v6 = [v5 likeCount];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (unint64_t)commentCountForDisplayAsset:(id)a3
{
  id v4 = a3;
  if ([a1 _canHandleDisplayAsset:v4])
  {
    v5 = [v4 commentProperties];
    unint64_t v6 = [v5 commentCount];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

@end