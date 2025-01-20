@interface UIDragItem(MobileSafariExtras)
+ (id)_sf_itemWithTabGroup:()MobileSafariExtras;
+ (void)_sf_loadObjectsFromDragItems:()MobileSafariExtras usingLocalObjectLoader:objectLoader:completionHandler:;
- (id)_sf_localBookmark;
- (id)_sf_localTabGroup;
- (id)_sf_localURL;
- (id)safari_fluidCollectionViewSourceItem;
- (id)safari_fluidCollectionViewSourceView;
- (uint64_t)_sf_initWithSiriSuggestion:()MobileSafariExtras;
- (void)_sf_initWithBookmark:()MobileSafariExtras;
- (void)safari_setFluidCollectionViewSourceItem:()MobileSafariExtras;
- (void)safari_setFluidCollectionViewSourceView:()MobileSafariExtras;
@end

@implementation UIDragItem(MobileSafariExtras)

+ (void)_sf_loadObjectsFromDragItems:()MobileSafariExtras usingLocalObjectLoader:objectLoader:completionHandler:
{
  id v9 = a3;
  id v10 = a6;
  dispatch_group_t v11 = dispatch_group_create();
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3812000000;
  v38[3] = __Block_byref_object_copy__5;
  v38[4] = __Block_byref_object_dispose__5;
  v38[5] = &unk_18C77CCCE;
  int v39 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke;
  aBlock[3] = &unk_1E54EBF70;
  v37 = v38;
  id v13 = v12;
  id v36 = v13;
  v14 = _Block_copy(aBlock);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_2;
  v25[3] = &unk_1E54EBFC0;
  uint64_t v29 = a4;
  id v15 = v14;
  id v27 = v15;
  v28 = &v31;
  v16 = v11;
  v26 = v16;
  uint64_t v30 = a5;
  [v9 enumerateObjectsUsingBlock:v25];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_4;
  v21[3] = &unk_1E54EBFE8;
  v24 = v38;
  id v17 = v13;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  v19 = (void (**)(void))_Block_copy(v21);
  v20 = v19;
  if (*((unsigned char *)v32 + 24)) {
    v19[2](v19);
  }
  else {
    dispatch_group_notify(v16, MEMORY[0x1E4F14428], v19);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v38, 8);
}

+ (id)_sf_itemWithTabGroup:()MobileSafariExtras
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F28D78]);
  v5 = [v3 richTextForPasteboard];
  v6 = (void *)[v4 initWithObject:v5];

  if ([v3 isSyncable])
  {
    v7 = (void *)MEMORY[0x1E4F22488];
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    id v9 = [v3 lastSelectedTabUUID];
    id v10 = (void *)[v8 initWithUUIDString:v9];
    id v11 = objc_alloc(MEMORY[0x1E4F29128]);
    v12 = [v3 uuid];
    id v13 = (void *)[v11 initWithUUIDString:v12];
    v14 = objc_msgSend(v7, "_sf_windowCreationActivityWithTabUUID:tabGroupUUID:browserControllerUUID:", v10, v13, 0);

    [v6 registerObject:v14 visibility:0];
  }
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v6];
  [v15 setLocalObject:v3];

  return v15;
}

- (void)_sf_initWithBookmark:()MobileSafariExtras
{
  id v4 = a3;
  if (([v4 isFolder] & 1) == 0)
  {
    id v10 = [v4 address];
    v6 = objc_msgSend(v10, "safari_bestURLForUserTypedString");

    id v11 = (void *)MEMORY[0x1E4F28D78];
    id v8 = [v4 title];
    uint64_t v9 = [v11 itemProviderWithURL:v6 title:v8];
    goto LABEL_5;
  }
  v5 = +[_SFNavigationIntentBuilder builderWithModifierFlags:0];
  v6 = [v5 navigationIntentWithBookmark:v4];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28D78]);
    id v8 = objc_msgSend(MEMORY[0x1E4F22488], "_sf_windowCreationActivityWithNavigationIntent:", v6);
    uint64_t v9 = [v7 initWithObject:v8];
LABEL_5:
    id v12 = (id)v9;

    goto LABEL_6;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F28D78]);
LABEL_6:

  id v13 = (void *)[a1 initWithItemProvider:v12];
  v14 = v13;
  if (v13)
  {
    [v13 setLocalObject:v4];
    id v15 = v14;
  }

  return v14;
}

- (uint64_t)_sf_initWithSiriSuggestion:()MobileSafariExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28D78];
  v6 = [v4 pageURL];
  id v7 = [v4 title];
  id v8 = [v5 itemProviderWithURL:v6 title:v7];

  uint64_t v9 = [a1 initWithItemProvider:v8];
  return v9;
}

- (id)_sf_localBookmark
{
  v1 = [a1 localObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v3 = 0;
  }
  else {
    id v3 = v1;
  }
  if ((isKindOfClass & 1) == 0) {
    v1 = 0;
  }

  return v1;
}

- (id)_sf_localURL
{
  v1 = [a1 localObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v3 = 0;
  }
  else {
    id v3 = v1;
  }
  if ((isKindOfClass & 1) == 0) {
    v1 = 0;
  }

  return v1;
}

- (id)_sf_localTabGroup
{
  v1 = [a1 localObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v3 = 0;
  }
  else {
    id v3 = v1;
  }
  if ((isKindOfClass & 1) == 0) {
    v1 = 0;
  }

  return v1;
}

- (id)safari_fluidCollectionViewSourceItem
{
  return objc_getAssociatedObject(a1, (const void *)fcvSourceItemKey);
}

- (void)safari_setFluidCollectionViewSourceItem:()MobileSafariExtras
{
}

- (id)safari_fluidCollectionViewSourceView
{
  return objc_getAssociatedObject(a1, (const void *)fcvSourceViewKey);
}

- (void)safari_setFluidCollectionViewSourceView:()MobileSafariExtras
{
}

@end