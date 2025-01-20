@interface NSItemProvider(SafariExtras)
+ (id)safari_itemProviderForTab:()SafariExtras browserController:;
+ (id)safari_itemProviderForTabDocument:()SafariExtras;
+ (id)safari_timeoutQueue;
- (void)safari_registerLinkMetadata:()SafariExtras;
@end

@implementation NSItemProvider(SafariExtras)

+ (id)safari_timeoutQueue
{
  if (safari_timeoutQueue_onceToken != -1) {
    dispatch_once(&safari_timeoutQueue_onceToken, &__block_literal_global_43);
  }
  v0 = (void *)safari_timeoutQueue_queue;
  return v0;
}

+ (id)safari_itemProviderForTabDocument:()SafariExtras
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v5 = (void *)MEMORY[0x1E4F22488];
  v6 = [v3 uuid];
  v7 = [v3 browserController];
  v8 = [v7 UUID];
  v9 = objc_msgSend(v5, "_sf_windowCreationActivityWithTabUUID:tabGroupUUID:browserControllerUUID:", v6, 0, v8);

  [v4 registerObject:v9 visibility:0];
  if ([v3 hasQuickLookContent])
  {
    v10 = [v3 quickLookDocument];
    objc_msgSend(v4, "safari_registerFileRepresentationForQuickLookDocument:", v10);
  }
  v11 = [v3 urlForSharing];
  [v4 registerObject:v11 visibility:0];

  return v4;
}

+ (id)safari_itemProviderForTab:()SafariExtras browserController:
{
  v5 = (objc_class *)MEMORY[0x1E4F28D78];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = (void *)MEMORY[0x1E4F22488];
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  v11 = [v7 uuid];
  v12 = (void *)[v10 initWithUUIDString:v11];
  v13 = [v6 UUID];

  v14 = objc_msgSend(v9, "_sf_windowCreationActivityWithTabUUID:tabGroupUUID:browserControllerUUID:", v12, 0, v13);

  [v8 registerObject:v14 visibility:0];
  v15 = [v7 url];

  [v8 registerObject:v15 visibility:0];
  return v8;
}

- (void)safari_registerLinkMetadata:()SafariExtras
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F309D0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke;
  v7[3] = &unk_1E6D7BFA0;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [a1 registerDataRepresentationForTypeIdentifier:v5 visibility:0 loadHandler:v7];
}

@end