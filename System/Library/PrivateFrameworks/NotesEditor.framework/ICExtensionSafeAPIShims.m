@interface ICExtensionSafeAPIShims
+ (BOOL)canOpenURL:(id)a3;
+ (id)openURLHandler;
+ (int64_t)applicationState;
+ (void)openURL:(id)a3 originatingView:(id)a4 completionHandler:(id)a5;
+ (void)setOpenURLHandler:(id)a3;
@end

@implementation ICExtensionSafeAPIShims

+ (int64_t)applicationState
{
  if (_UIApplicationIsExtension()) {
    return 0;
  }
  v3 = (void *)*MEMORY[0x263F83300];

  return [v3 applicationState];
}

+ (BOOL)canOpenURL:(id)a3
{
  return [(id)*MEMORY[0x263F83300] canOpenURL:a3];
}

+ (void)openURL:(id)a3 originatingView:(id)a4 completionHandler:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [a1 openURLHandler];
  v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v8);
  }
  else {
    [(id)*MEMORY[0x263F83300] _openURL:v9 originatingView:v12 completionHandler:v8];
  }
}

+ (id)openURLHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__12;
  id v9 = __Block_byref_object_dispose__12;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__ICExtensionSafeAPIShims_openURLHandler__block_invoke;
  v4[3] = &unk_2640B9818;
  v4[4] = &v5;
  ICWithOpenURLHandlerLock(v4);
  v2 = _Block_copy((const void *)v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __41__ICExtensionSafeAPIShims_openURLHandler__block_invoke(uint64_t a1)
{
  v2 = _Block_copy((const void *)_openURLHandler);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x270F9A758](v2, v4);
}

+ (void)setOpenURLHandler:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ICExtensionSafeAPIShims_setOpenURLHandler___block_invoke;
  v5[3] = &unk_2640B8B80;
  id v6 = v3;
  id v4 = v3;
  ICWithOpenURLHandlerLock(v5);
}

uint64_t __45__ICExtensionSafeAPIShims_setOpenURLHandler___block_invoke(uint64_t a1)
{
  v1 = _Block_copy(*(const void **)(a1 + 32));
  uint64_t v2 = _openURLHandler;
  _openURLHandler = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

@end