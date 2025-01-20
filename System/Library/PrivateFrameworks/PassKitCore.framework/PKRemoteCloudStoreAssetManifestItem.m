@interface PKRemoteCloudStoreAssetManifestItem
+ (BOOL)supportsSecureCoding;
- (NSString)recordName;
- (unint64_t)itemType;
- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4;
- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 tryCount:(unint64_t)a4 completion:(id)a5;
@end

@implementation PKRemoteCloudStoreAssetManifestItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)recordName
{
  v2 = [(PKRemoteAssetManifestItem *)self remoteURL];
  v3 = [v2 resourceSpecifier];

  return (NSString *)v3;
}

- (unint64_t)itemType
{
  return 1;
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4
{
}

- (void)downloadAssetWithCloudStoreCoordinatorDelegate:(id)a3 tryCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (!v8)
    {
      if (PKRunningInPassd())
      {
        id v8 = 0;
      }
      else
      {
        id v8 = +[PKCloudStoreService sharedInstance];
      }
    }
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__81;
    v34 = __Block_byref_object_dispose__81;
    id v35 = 0;
    if (v8)
    {
      v10 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(PKRemoteCloudStoreAssetManifestItem *)self recordName];
        *(_DWORD *)buf = 138412290;
        v37 = v11;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Downloading recordName from cloudkit %@", buf, 0xCu);
      }
      v12 = [(PKRemoteCloudStoreAssetManifestItem *)self recordName];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __106__PKRemoteCloudStoreAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke;
      v25[3] = &unk_1E56F48F0;
      v28 = &v30;
      unint64_t v29 = a4;
      v25[4] = self;
      id v26 = v8;
      id v27 = v9;
      [v26 itemOfItemType:4 recordName:v12 qualityOfService:25 completion:v25];
    }
    else
    {
      v13 = [(PKRemoteCloudStoreAssetManifestItem *)self recordName];
      uint64_t v21 = PKValidationErrorWithReason(@"A cloudStoreCoordinatorDelegate is not set on the PKRemoteCloudStoreAssetManifestItem with recordName %@. Cannot download remote cloud asset.", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
      v22 = (void *)v31[5];
      v31[5] = v21;

      v23 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)v31[5];
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      (*((void (**)(id, void, uint64_t, uint64_t))v9 + 2))(v9, 0, 1, v31[5]);
    }
    _Block_object_dispose(&v30, 8);
  }
}

void __106__PKRemoteCloudStoreAssetManifestItem_downloadAssetWithCloudStoreCoordinatorDelegate_tryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedDescription];
    uint64_t v15 = PKValidationErrorWithReason(@"Couldn't download remote cloud store asset. Error: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

LABEL_6:
    v25 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v26 = PKValidationErrorWithReason(@"Invalid PKCloudRecordObject %@ returned when downloading remote cloud store asset.", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v30);
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    goto LABEL_6;
  }
  v25 = [v30 assetData];
LABEL_7:
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && [*(id *)(a1 + 32) isRequired]
    && (unint64_t v29 = *(void *)(a1 + 64), v29 <= 2))
  {
    [*(id *)(a1 + 32) downloadAssetWithCloudStoreCoordinatorDelegate:*(void *)(a1 + 40) tryCount:v29 + 1 completion:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

@end