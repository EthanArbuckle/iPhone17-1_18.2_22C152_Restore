@interface SBSUISystemNotesWindowScene
- (void)takeScreenshotOfDisplays:(id)a3 handler:(id)a4;
@end

@implementation SBSUISystemNotesWindowScene

- (void)takeScreenshotOfDisplays:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F4F670];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke;
    v14[3] = &unk_1E5CCCED8;
    id v15 = v6;
    id v9 = a3;
    v10 = [v8 responderWithHandler:v14];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FA6C70]) initWithDisplaysToScreenshot:v9 responder:v10];

    v12 = [(SBSUISystemNotesWindowScene *)self _FBSScene];
    v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    [v12 sendActions:v13];
  }
}

void __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v14 = [v2 error];
  id v15 = v2;
  v3 = [v2 info];
  v4 = [v3 objectForSetting:0];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 machPortSendRight];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke_2;
        v16[3] = &unk_1E5CCCEB0;
        v16[4] = v11;
        id v17 = v5;
        [v12 accessPort:v16];
        [v12 invalidate];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke_2(uint64_t a1, mach_port_t port)
{
  IOSurfaceRef v7 = IOSurfaceLookupFromMachPort(port);
  [*(id *)(a1 + 32) scale];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) _initWithIOSurface:v7 scale:0 orientation:v3];
  v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) displayIdentity];
  [v5 setObject:v4 forKey:v6];
}

@end