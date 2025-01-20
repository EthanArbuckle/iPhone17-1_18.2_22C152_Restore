@interface SBSApplicationClient
+ (id)serviceFacilityIdentifier;
- (id)applicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4;
- (void)deleteSnapshotsForApplicationIdentifier:(id)a3;
- (void)fetchApplicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a3 withCompletionHandler:(id)a4;
- (void)requestShelfPresentationForSceneWithIdentifier:(id)a3;
- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3;
- (void)updateDynamicApplicationShortcutItems:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation SBSApplicationClient

void __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    BSSerializeStringToXPCDictionaryWithKey();
    id v3 = v4;
  }
  xpc_dictionary_set_uint64(v3, "itemTypes", *(void *)(a1 + 40));
}

void __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    id v8 = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    id v3 = v8;
    if (v4)
    {
      uint64_t v5 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v3 = v8;
    }
  }
}

void __79__SBSApplicationClient_updateDynamicApplicationShortcutItems_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32)) {
    BSSerializeStringToXPCDictionaryWithKey();
  }
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
}

- (void)updateDynamicApplicationShortcutItems:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F62B40];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __79__SBSApplicationClient_updateDynamicApplicationShortcutItems_bundleIdentifier___block_invoke;
  v15 = &unk_1E566C788;
  id v16 = v7;
  id v17 = v6;
  id v9 = v6;
  id v10 = v7;
  v11 = [v8 messageWithPacker:&v12];
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v11, 2, v12, v13, v14, v15);
}

- (id)applicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  id v7 = (void *)MEMORY[0x1E4F62B40];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke;
  v13[3] = &unk_1E566C170;
  id v8 = v6;
  id v14 = v8;
  unint64_t v15 = a3;
  id v9 = [v7 messageWithPacker:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke_2;
  v12[3] = &unk_1E566C148;
  v12[4] = &v16;
  [(FBSServiceFacilityClient *)self sendMessage:v9 withType:1 replyHandler:v12 waitForReply:1 timeout:0.0];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)serviceFacilityIdentifier
{
  return @"com.apple.springboardservices.application";
}

- (void)deleteSnapshotsForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F62B40];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SBSApplicationClient_deleteSnapshotsForApplicationIdentifier___block_invoke;
  v8[3] = &unk_1E566C1C0;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 messageWithPacker:v8];
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:3];
}

uint64_t __64__SBSApplicationClient_deleteSnapshotsForApplicationIdentifier___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (void)fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke;
    v10[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    unsigned int v11 = a3;
    id v7 = [MEMORY[0x1E4F62B40] messageWithPacker:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E566C0B8;
    id v9 = v6;
    [(FBSServiceFacilityClient *)self sendMessage:v7 withType:0 replyHandler:v8 waitForReply:0 timeout:0.0];
  }
}

void __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590]) {
    xpc_dictionary_get_int64(xdict, "whitePointAdaptivityStyle");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchApplicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F62B40];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke;
    v14[3] = &unk_1E566C170;
    id v15 = v8;
    unint64_t v16 = a3;
    unsigned int v11 = [v10 messageWithPacker:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E566C0B8;
    id v13 = v9;
    [(FBSServiceFacilityClient *)self sendMessage:v11 withType:1 replyHandler:v12 waitForReply:0 timeout:0.0];
  }
}

void __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    BSSerializeStringToXPCDictionaryWithKey();
    id v3 = v4;
  }
  xpc_dictionary_set_uint64(v3, "itemTypes", *(void *)(a1 + 40));
}

void __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  id v4 = (void *)v3;
  if (v3 && MEMORY[0x192FC1100](v3) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F62B40];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SBSApplicationClient_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke;
  v8[3] = &unk_1E566C1C0;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 messageWithPacker:v8];
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:4];
}

uint64_t __76__SBSApplicationClient_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return BSSerializeStringToXPCDictionaryWithKey();
  }
  return result;
}

- (void)requestShelfPresentationForSceneWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F62B40];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SBSApplicationClient_requestShelfPresentationForSceneWithIdentifier___block_invoke;
  v8[3] = &unk_1E566C1C0;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 messageWithPacker:v8];
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:5];
}

uint64_t __71__SBSApplicationClient_requestShelfPresentationForSceneWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return BSSerializeStringToXPCDictionaryWithKey();
  }
  return result;
}

@end