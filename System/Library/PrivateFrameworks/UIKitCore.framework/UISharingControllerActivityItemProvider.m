@interface UISharingControllerActivityItemProvider
@end

@implementation UISharingControllerActivityItemProvider

uint64_t __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_3;
  v8[3] = &unk_1E5311510;
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v8);

  return 0;
}

void __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && v8)
  {
    v11 = [v8 setupInfo];
    v12 = (void *)[v11 copy];

    v13 = [v12 containerOptions];
    v14 = [v13 applicationBundleIdentifierOverrideForContainerAccess];

    if (!v14)
    {
      v15 = [v12 containerOptions];
      v16 = [v8 primaryIdentifier];
      [v15 setApplicationBundleIdentifierOverride:v16];
    }
    v17 = (void *)[objc_alloc((Class)getCKPreSharingContextClass()) initWithShare:v7 containerSetupInfo:v12 allowedOptions:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    goto LABEL_10;
  }
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = v9;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  v20 = (void (*)(id))getCKXPCSuitableErrorSymbolLoc_ptr;
  v28 = getCKXPCSuitableErrorSymbolLoc_ptr;
  if (!getCKXPCSuitableErrorSymbolLoc_ptr)
  {
    v21 = CloudKitLibrary();
    v26[3] = (uint64_t)dlsym(v21, "CKXPCSuitableError");
    getCKXPCSuitableErrorSymbolLoc_ptr = (_UNKNOWN *)v26[3];
    v20 = (void (*)(id))v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (v20)
  {
    v22 = v20(v19);

    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v22);
LABEL_10:

    return;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  v24 = [NSString stringWithUTF8String:"NSError *_CKXPCSuitableError(NSError * _Nullable __strong)"];
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"UICloudSharingController.m", 67, @"%s", dlerror());

  __break(1u);
}

@end