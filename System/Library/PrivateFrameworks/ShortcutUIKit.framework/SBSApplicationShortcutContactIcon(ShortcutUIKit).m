@interface SBSApplicationShortcutContactIcon(ShortcutUIKit)
- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit;
@end

@implementation SBSApplicationShortcutContactIcon(ShortcutUIKit)

- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  v18[1] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFEC20]) initWithStyle:2 diameter:35.0];
  v3 = [a1 contactIdentifier];
  if (!v3) {
    goto LABEL_13;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v5 = [MEMORY[0x263EFEC20] descriptorForRequiredKeysIncludingImage:1];
  v18[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v7 = [v4 unifiedContactWithIdentifier:v3 keysToFetch:v6 error:0];

  if (!v7
    || ([v2 monogramForContact:v7],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_13:
    uint64_t v9 = [a1 imageData];
    if (!v9) {
      goto LABEL_14;
    }
    v10 = (void *)v9;
    id v11 = objc_alloc_init(MEMORY[0x263EFEAF0]);
    [v11 setImageData:v10];
    v12 = [a1 firstName];
    [v11 setGivenName:v12];

    v13 = [a1 lastName];
    [v11 setFamilyName:v13];

    v8 = [v2 monogramForContact:v11];

    if (!v8)
    {
LABEL_14:
      v14 = [a1 firstName];
      v15 = [a1 lastName];
      v8 = [v2 monogramForPersonWithFirstName:v14 lastName:v15];

      if (!v8)
      {
        v8 = [v2 silhouetteMonogram];
      }
    }
  }
  v16 = [v8 imageWithRenderingMode:1];

  return v16;
}

@end