@interface UIOpenInAppActivityDataProvider
@end

@implementation UIOpenInAppActivityDataProvider

void __116___UIOpenInAppActivityDataProvider_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __116___UIOpenInAppActivityDataProvider_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_2;
      v6[3] = &unk_1E5A22768;
      id v7 = v5;
      [v4 registerItemForTypeIdentifier:@"com.apple.ShareUI.openURL.supplementalSecurityContext" loadHandler:v6];
    }
  }
}

void __116___UIOpenInAppActivityDataProvider_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(a1 + 32);
  id v4 = a2;
  id v5 = +[UISUISecurityScopedResource scopedResourceWithFileURL:v3 allowedAccess:2];
  if (v5
    || (+[UISUISecurityScopedResource scopedResourceWithFileURL:v3 allowedAccess:1], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = objc_msgSend(v3, "ui_bookmarkForExportWithError:", 0);
    [v5 setBookmarkExportDataEncodedAsString:v6];

    id v7 = [UISUISecurityContext alloc];
    v10[0] = v5;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v9 = [(UISUISecurityContext *)v7 initWithSecurityScopedResources:v8];
  }
  else
  {
    v9 = 0;
  }

  v4[2](v4, v9, 0);
}

@end