@interface SBSApplicationShortcutItem
@end

@implementation SBSApplicationShortcutItem

id __108__SBSApplicationShortcutItem_SBHAdditions__sb_buildIconImageWithApplicationBundleURL_image_systemImageName___block_invoke(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) contactIdentifier];
  if (v4)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v5 = (void *)getCNContactStoreClass_softClass;
    uint64_t v30 = getCNContactStoreClass_softClass;
    if (!getCNContactStoreClass_softClass)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __getCNContactStoreClass_block_invoke;
      v25 = &unk_1E6AAD648;
      v26 = &v27;
      __getCNContactStoreClass_block_invoke((uint64_t)&v22);
      v5 = (void *)v28[3];
    }
    v6 = v5;
    _Block_object_dispose(&v27, 8);
    id v7 = objc_alloc_init(v6);
    v8 = [getCNMonogrammerClass() descriptorForRequiredKeysIncludingImage:1];
    v31[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    v10 = [v7 unifiedContactWithIdentifier:v4 keysToFetch:v9 error:0];

    if (v10)
    {
      v11 = [v3 monogramForContact:v10];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v12 = (id *)(a1 + 32);
    v10 = [v13 firstName];
    v14 = [*v12 lastName];
    v15 = [*v12 imageData];
    if (v15)
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2050000000;
      v16 = (void *)getCNMutableContactClass_softClass;
      uint64_t v30 = getCNMutableContactClass_softClass;
      if (!getCNMutableContactClass_softClass)
      {
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __getCNMutableContactClass_block_invoke;
        v25 = &unk_1E6AAD648;
        v26 = &v27;
        __getCNMutableContactClass_block_invoke((uint64_t)&v22);
        v16 = (void *)v28[3];
      }
      v17 = v16;
      _Block_object_dispose(&v27, 8);
      id v18 = objc_alloc_init(v17);
      v19 = v18;
      if (v10) {
        [v18 setGivenName:v10];
      }
      if (v14) {
        [v19 setFamilyName:v14];
      }
      [v19 setImageData:v15];
      v11 = [v3 monogramForContact:v19];
    }
    else
    {
      v11 = [v3 monogramForPersonWithFirstName:v10 lastName:v14];
    }
  }
  if (!v11)
  {
    v11 = [v3 silhouetteMonogram];
  }
  v20 = [v11 imageWithRenderingMode:1];

  return v20;
}

@end