@interface PXGraphDiagnosticsService
+ (id)viewControllerForDetailsOfAsset:(id)a3;
- (BOOL)canProvideConsoleDescription;
- (BOOL)canProvideContextualViewController;
- (BOOL)canProvideSettingsViewController;
- (id)contextualViewController;
- (id)saliencyStringForAsset:(id)a3;
- (id)settingsViewController;
- (id)title;
@end

@implementation PXGraphDiagnosticsService

+ (id)viewControllerForDetailsOfAsset:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "px_curationDebugString");
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Asset Details" message:0 preferredStyle:1];
  [v5 _setAttributedMessage:v4];
  v6 = (void *)MEMORY[0x1E4FB1410];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke;
  v19[3] = &unk_1E5DD0030;
  id v20 = v4;
  id v7 = v4;
  v8 = [v6 actionWithTitle:@"Copy Text" style:0 handler:v19];
  [v5 addAction:v8];

  v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2;
  v17 = &unk_1E5DD0030;
  id v18 = v3;
  id v10 = v3;
  v11 = [v9 actionWithTitle:@"Copy UUID" style:0 handler:&v14];
  objc_msgSend(v5, "addAction:", v11, v14, v15, v16, v17);

  v12 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:0];
  [v5 addAction:v12];

  return v5;
}

void __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = [*(id *)(a1 + 32) string];
  v5[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setObjects:v4];
}

void __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = [*(id *)(a1 + 32) uuid];
  v5[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setObjects:v4];
}

- (id)settingsViewController
{
  return 0;
}

- (BOOL)canProvideSettingsViewController
{
  return 0;
}

- (id)contextualViewController
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v2 = [(PXDiagnosticsService *)self itemProviders];
  id v3 = (void *)[v2 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (!v3)
  {

    v30 = 0;
    v5 = 0;
    v31 = 0;
    v4 = 0;
    v65 = 0;
    v66 = 0;
    goto LABEL_31;
  }
  v65 = 0;
  v66 = 0;
  v4 = 0;
  v63 = 0;
  v64 = 0;
  v5 = 0;
  v59 = 0;
  v62 = 0;
  uint64_t v6 = *(void *)v70;
  id v7 = @"PXDiagnosticsItemIdentifierAsset";
  v8 = @"PXDiagnosticsItemIdentifierMemory";
  do
  {
    v9 = 0;
    v60 = v3;
    do
    {
      if (*(void *)v70 != v6) {
        objc_enumerationMutation(v2);
      }
      id v10 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v9);
      if ([v10 hasItemForIdentifier:v7])
      {
        uint64_t v11 = [v10 itemForIdentifier:v7];

        v62 = (void *)v11;
      }
      if ([v10 hasItemForIdentifier:v8])
      {
        uint64_t v12 = [v10 itemForIdentifier:v8];

        v64 = (void *)v12;
      }
      if ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierHighlight"])
      {
        uint64_t v13 = [v10 itemForIdentifier:@"PXDiagnosticsItemIdentifierHighlight"];

        v4 = (void *)v13;
      }
      if ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedCollection"])
      {
        uint64_t v14 = [v10 itemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedCollection"];

        v63 = (void *)v14;
      }
      if ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedReferenceObject"])
      {
        uint64_t v15 = v8;
        uint64_t v16 = v6;
        v17 = v7;
        id v18 = v2;
        v19 = v4;
        id v20 = [v10 itemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedReferenceObject"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v21 = v59;
          v59 = v20;
          goto LABEL_18;
        }
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v23 = v5;
        v21 = v5;
        v5 = v20;
        if (isKindOfClass)
        {
LABEL_18:
          v24 = v20;

          v23 = v5;
        }
        v5 = v23;

        v4 = v19;
        v2 = v18;
        id v7 = v17;
        uint64_t v6 = v16;
        v8 = v15;
        id v3 = v60;
      }
      if ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierViewDescription"])
      {
        uint64_t v25 = [v10 itemForIdentifier:@"PXDiagnosticsItemIdentifierViewDescription"];

        v66 = (void *)v25;
      }
      if ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierLayoutDescription"])
      {
        uint64_t v26 = [v10 itemForIdentifier:@"PXDiagnosticsItemIdentifierLayoutDescription"];

        v65 = (void *)v26;
      }
      v9 = (char *)v9 + 1;
    }
    while (v3 != v9);
    id v3 = (void *)[v2 countByEnumeratingWithState:&v69 objects:v75 count:16];
  }
  while (v3);

  v27 = v62;
  if (!v62)
  {
    v30 = v59;
    v31 = v63;
    id v3 = v64;
LABEL_31:
    v32 = [MEMORY[0x1E4F1CA60] dictionary];
    v33 = [v31 highlightLocalIdentifier];

    v61 = v4;
    if (v33)
    {
      v34 = [v31 highlightLocalIdentifier];
    }
    else
    {
      v35 = [v31 momentLocalIdentifiers];
      uint64_t v36 = [v35 count];

      if (v36 != 1)
      {
        v42 = [MEMORY[0x1E4F38EE8] graphOptionsForTransientAssetCollection:v31 needsCompleteMomentsInfo:0 options:0];
        [v32 setObject:v42 forKeyedSubscript:@"PHPhotosGraphOptionRelatedOptions"];

        BOOL v38 = 0;
        v34 = 0;
        v28 = v5;
        v4 = v61;
        goto LABEL_39;
      }
      v37 = [v31 momentLocalIdentifiers];
      v34 = [v37 firstObject];

      v4 = v61;
    }
    BOOL v38 = v34 != 0;
    v28 = v5;
    if (v30 && v34)
    {
      v39 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      v40 = [(PXDebugRelatedViewController *)v30 localIdentifier];
      id v68 = 0;
      v41 = [v39 relatedDebugInformationBetweenAssetForLocalIdentifier:v40 andRelatedAssetCollectionForLocalIdentifier:v34 options:v32 relatedType:63 error:&v68];
      id v29 = v68;

      v28 = [[PXDebugRelatedViewController alloc] initWithDictionary:v41];
      goto LABEL_44;
    }
LABEL_39:
    if (v3)
    {
      v28 = [[PXDebugMemoriesViewController alloc] initWithMemory:v3 memoryInfo:0];
LABEL_43:
      id v29 = 0;
      goto LABEL_44;
    }
    if (v4)
    {
      v28 = [[PXHighlightDiagnosticsViewController alloc] initWithHighlight:v4];
      [(PXDebugRelatedViewController *)v28 setHostViewDiagnosticDescription:v66];
      [(PXDebugRelatedViewController *)v28 setHostLayoutDiagnosticDescription:v65];
      [(PXDebugRelatedViewController *)v28 setCurrentCurationType:3];
      goto LABEL_43;
    }
    if (!v28) {
      goto LABEL_43;
    }
    if ([(PXDebugRelatedViewController *)v28 assetCollectionType] == 5)
    {
      v47 = v28;
      v48 = [(PXDebugRelatedViewController *)v47 highlightLocalIdentifier];

      if (v48)
      {
        v49 = [(PXDebugRelatedViewController *)v47 highlightLocalIdentifier];
      }
      else
      {
        v51 = [(PXDebugRelatedViewController *)v47 momentLocalIdentifiers];
        uint64_t v52 = [v51 count];

        if (v52 == 1)
        {
          v53 = [(PXDebugRelatedViewController *)v47 momentLocalIdentifiers];
          v49 = [v53 firstObject];
        }
        else
        {
          v54 = [MEMORY[0x1E4F38EE8] graphOptionsForTransientAssetCollection:v47 needsCompleteMomentsInfo:0 options:0];
          [v32 setObject:v54 forKeyedSubscript:@"PHPhotosGraphOptionReferenceOptions"];

          v49 = 0;
        }
      }
    }
    else
    {
      if ([(PXDebugRelatedViewController *)v28 assetCollectionType] == 1
        && [(PXDebugRelatedViewController *)v28 assetCollectionSubtype] == 2
        || [(PXDebugRelatedViewController *)v28 assetCollectionType] == 2
        && [(PXDebugRelatedViewController *)v28 assetCollectionSubtype] == 200)
      {
        v50 = [MEMORY[0x1E4F38EE8] graphOptionsForTransientAssetCollection:v28 needsCompleteMomentsInfo:0 options:0];
        [v32 setObject:v50 forKeyedSubscript:@"PHPhotosGraphOptionReferenceOptions"];

        v49 = 0;
        goto LABEL_70;
      }
      v49 = [(PXDebugRelatedViewController *)v28 localIdentifier];
    }
    if (v49) {
      BOOL v55 = v38;
    }
    else {
      BOOL v55 = 0;
    }
    if (v55)
    {
      v56 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      id v67 = 0;
      v57 = [v56 relatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:v49 andRelatedAssetCollectionForLocalIdentifier:v34 options:v32 relatedType:63 error:&v67];
      id v29 = v67;

      v28 = [[PXDebugRelatedViewController alloc] initWithDictionary:v57];
LABEL_71:

LABEL_44:
      v27 = 0;
      if (!v28) {
        goto LABEL_45;
      }
      goto LABEL_48;
    }
LABEL_70:
    v28 = 0;
    id v29 = 0;
    v57 = 0;
    goto LABEL_71;
  }
  v61 = v4;
  v28 = [(id)objc_opt_class() viewControllerForDetailsOfAsset:v62];
  id v29 = 0;
  v30 = v59;
  v31 = v63;
  id v3 = v64;
  if (!v28)
  {
LABEL_45:
    v43 = PLUIGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      [(PXDiagnosticsService *)self itemProviders];
      v45 = v44 = v27;
      *(_DWORD *)buf = 138412290;
      v74 = v45;
      _os_log_impl(&dword_1A9AE7000, v43, OS_LOG_TYPE_DEFAULT, "Memories & Related Diagnosis Error: No item providers can be used (%@)", buf, 0xCu);

      v27 = v44;
    }
  }
LABEL_48:

  return v28;
}

- (id)saliencyStringForAsset:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 preferredCropRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v3 pixelWidth];
  uint64_t v13 = [v3 pixelHeight];
  double v14 = v5 * (double)v12;
  double v15 = v7 * (double)v13;
  CGFloat v16 = round(v9 * (double)v12);
  CGFloat v17 = round(v11 * (double)v13);
  CGFloat v18 = round(v14);
  CGFloat v19 = round(v15);
  [v3 acceptableCropRect];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  uint64_t v28 = [v3 pixelWidth];
  uint64_t v29 = [v3 pixelHeight];

  double v30 = v21 * (double)v28;
  double v31 = v23 * (double)v29;
  CGFloat v32 = round(v25 * (double)v28);
  CGFloat v33 = round(v27 * (double)v29);
  CGFloat v34 = round(v30);
  CGFloat v35 = round(v31);
  uint64_t v36 = NSString;
  v47.origin.x = v18;
  v47.origin.y = v19;
  v47.size.width = v16;
  v47.size.height = v17;
  v37 = NSStringFromCGRect(v47);
  BOOL v38 = [v36 stringWithFormat:@"Preferred crop rect: %@", v37];

  v39 = NSString;
  v48.origin.x = v34;
  v48.origin.y = v35;
  v48.size.width = v32;
  v48.size.height = v33;
  v40 = NSStringFromCGRect(v48);
  v41 = [v39 stringWithFormat:@"Acceptable crop rect: %@", v40];

  v45[0] = v38;
  v45[1] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v43 = [v42 componentsJoinedByString:@"\n"];

  return v43;
}

- (BOOL)canProvideContextualViewController
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = +[PXDiagnosticsSettings sharedInstance];
  int v4 = [v3 enableGraphService];

  if (!v4) {
    return 0;
  }
  [(PXDiagnosticsService *)self itemProviders];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierAsset", (void)v13) & 1) != 0
          || ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierMemory"] & 1) != 0
          || ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierHighlight"] & 1) != 0
          || ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedCollection"] & 1) != 0
          || ([v10 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedReferenceObject"] & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_18;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_18:

  return v11;
}

- (BOOL)canProvideConsoleDescription
{
  return 0;
}

- (id)title
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = @"Graph Diagnostics";
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierAsset"])
        {
          uint64_t v6 = @"Asset Details";
          goto LABEL_19;
        }
        if ([v8 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierMemory"])
        {
          uint64_t v6 = @"Memory Details";
          goto LABEL_19;
        }
        if ([v8 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierHighlight"])
        {
          uint64_t v6 = @"Highlight Details";
          goto LABEL_19;
        }
        if (([v8 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedCollection"] & 1) != 0
          || ([v8 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierRelatedReferenceObject"] & 1) != 0)
        {
          uint64_t v6 = @"Related Details";
          goto LABEL_19;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v6 = @"Graph Diagnostics";
  }
LABEL_19:

  return v6;
}

@end