@interface PXPhotoKitAssetSpotlightActionPerformer
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (id)_appIconForBundleIdentifier:(id)a3;
+ (id)_bundleIdentifierForAsset:(id)a3;
+ (id)_owningAppBundleIdentifierForAsset:(id)a3;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
@end

@implementation PXPhotoKitAssetSpotlightActionPerformer

+ (id)_appIconForBundleIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v3];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 32.0, 32.0, 3.0);
  v15[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v4 prepareImagesForImageDescriptors:v6];

  v7 = [v4 imageForDescriptor:v5];
  if ([v7 placeholder])
  {
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"appstore.app"];
    v9 = (CGImage *)[v8 CGImage];
  }
  else
  {
    v9 = (CGImage *)[v7 CGImage];
  }
  CGImageRetain(v9);
  if (v9)
  {
    v10 = [MEMORY[0x1E4FB1818] imageWithCGImage:v9];
  }
  else
  {
    v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Unable to retrieve app icon for app with bundle identifier: %@ for Spotlight 1Up", (uint8_t *)&v13, 0xCu);
    }

    v10 = 0;
  }
  CGImageRelease(v9);

  return v10;
}

+ (id)_owningAppBundleIdentifierForAsset:(id)a3
{
  id v3 = [a1 _bundleIdentifierForAsset:a3];
  if ([v3 length])
  {
    v4 = v3;
    v5 = PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs();
    int v6 = [v5 containsObject:v4];

    if (v6)
    {

      v4 = @"com.apple.DocumentsApp";
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_bundleIdentifierForAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 photoLibrary];
  uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

  if (v5 == 3)
  {
    int v6 = [v3 curationProperties];
    v7 = [v6 importedByBundleIdentifier];
    if (!v7)
    {
      id v8 = PLUIGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412546;
        id v11 = v3;
        __int16 v12 = 2112;
        int v13 = v6;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Could not locate bundle identifier for syndicated asset: %@ in the asset curation properties: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    v7 = @"com.apple.mobileslideshow";
  }

  return v7;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a5, "selectionManager", a3, a4);
  int v6 = [v5 selectionSnapshot];
  v7 = [v6 dataSource];
  *(void *)buf = [v7 identifier];
  *(void *)&buf[8] = 0;
  *(void *)&buf[16] = 0;
  uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  id v8 = [v7 objectAtIndexPath:buf];
  if (v8)
  {
    v9 = +[PXPhotoKitAssetSpotlightActionPerformer _owningAppBundleIdentifierForAsset:v8];
    int v10 = +[PXPhotoKitAssetSpotlightActionPerformer _appIconForBundleIdentifier:v9];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
      [v11 setImage:v10 forState:0];
      __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v11];
      PXLocalizedStringFromTable(@"PXSpotlightPhotosIconAXDescription", @"PhotosUICore");
      int v13 = v33 = v10;
      [v12 setAccessibilityLabel:v13];

      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v14 = [v11 centerXAnchor];
      v15 = [v12 customView];
      [v15 centerXAnchor];
      v16 = v35 = v5;
      v36 = [v14 constraintEqualToAnchor:v16];

      v17 = [v11 centerYAnchor];
      v18 = [v12 customView];
      [v18 centerYAnchor];
      v19 = v34 = v6;
      uint64_t v20 = [v17 constraintEqualToAnchor:v19];

      v21 = [v11 widthAnchor];
      v22 = [v21 constraintEqualToConstant:32.0];

      v23 = [v11 heightAnchor];
      v24 = [v23 constraintEqualToConstant:32.0];

      v25 = (void *)MEMORY[0x1E4F28DC8];
      v37[0] = v36;
      v37[1] = v20;
      v26 = v7;
      v27 = v8;
      v28 = v9;
      v29 = (void *)v20;
      v37[2] = v22;
      v37[3] = v24;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
      v31 = v25;
      uint64_t v5 = v35;
      [v31 activateConstraints:v30];

      int v6 = v34;
      int v10 = v33;

      v9 = v28;
      id v8 = v27;
      v7 = v26;
    }
    else
    {
      id v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Unable to create 'open in app' button for Spotlight 1Up display without app icon image for asset: %@ with bundle identifier %@", buf, 0x16u);
      }
      __int16 v12 = 0;
    }
  }
  else
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v39 = (uint64_t)v5;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Unable to locate asset in datasource: %@ with selection snapshot: %@, selection manager: %@ for Spotlight 'open in app' 1Up action", buf, 0x20u);
    }
    __int16 v12 = 0;
  }

  return v12;
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  return 1;
}

@end