@interface SBApplicationServer
+ (id)sharedInstance;
- (SBApplicationServerHarmonyDelegate)harmonyDelegate;
- (SBApplicationServerMiscDelegate)miscDelegate;
- (SBApplicationServerMultiwindowDelegate)multiwindowDelegate;
- (SBApplicationServerShortcutDelegate)shortcutDelegate;
- (id)_init;
- (void)_handleDeleteApplicationSnapshots:(void *)a3 fromClient:;
- (void)_handleHarmonyFetchWhitePointAdaptivityStyleMessage:(void *)a3 fromClient:;
- (void)_handleMultiwindowShortcutRequestShelfPresentationMessage:(void *)a3 fromClient:;
- (void)_handleMultiwindowShortcutShowAllWindowsMessage:(void *)a3 fromClient:;
- (void)_handleShortcutFetchApplicationShortcutItemsMessage:(void *)a3 fromClient:;
- (void)_handleShortcutUpdateDynamicApplicationShortcutItemsMessage:(void *)a3 fromClient:;
- (void)dealloc;
- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
- (void)setHarmonyDelegate:(id)a3;
- (void)setMiscDelegate:(id)a3;
- (void)setMultiwindowDelegate:(id)a3;
- (void)setShortcutDelegate:(id)a3;
@end

@implementation SBApplicationServer

uint64_t __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke_2()
{
  return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 0:
      -[SBApplicationServer _handleHarmonyFetchWhitePointAdaptivityStyleMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 1:
      -[SBApplicationServer _handleShortcutFetchApplicationShortcutItemsMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 2:
      -[SBApplicationServer _handleShortcutUpdateDynamicApplicationShortcutItemsMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 3:
      -[SBApplicationServer _handleDeleteApplicationSnapshots:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 4:
      -[SBApplicationServer _handleMultiwindowShortcutShowAllWindowsMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    case 5:
      -[SBApplicationServer _handleMultiwindowShortcutRequestShelfPresentationMessage:fromClient:]((uint64_t)self, v8, v9);
      break;
    default:
      v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SBApplicationServer noteDidReceiveMessage:withType:fromClient:]((uint64_t)self, v9, v10);
      }

      break;
  }
}

- (void)_handleShortcutFetchApplicationShortcutItemsMessage:(void *)a3 fromClient:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke;
    v13[3] = &unk_1E6AFC060;
    id v7 = v5;
    id v14 = v7;
    id v8 = (void (**)(void, void))MEMORY[0x1D948C7A0](v13);
    id v9 = [v7 payload];
    v10 = v9;
    if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E4F14590])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (WeakRetained)
      {
        v12 = BSDeserializeStringFromXPCDictionaryWithKey();
        objc_msgSend(WeakRetained, "applicationServer:client:fetchApplicationShortcutItemsOfTypes:forBundleIdentifier:withCompletion:", a1, v6, xpc_dictionary_get_uint64(v10, (const char *)*MEMORY[0x1E4FA7718]), v12, v8);
      }
      else
      {
        v8[2](v8, 0);
      }
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

void __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__SBApplicationServer__handleShortcutFetchApplicationShortcutItemsMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E6AFC038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendReplyMessageWithPacker:v6];
}

- (void)_handleShortcutUpdateDynamicApplicationShortcutItemsMessage:(void *)a3 fromClient:
{
  id v10 = a3;
  if (a1)
  {
    id v5 = [a2 payload];
    id v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E4F14590])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (WeakRetained)
      {
        id v8 = BSDeserializeStringFromXPCDictionaryWithKey();
        id v9 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
        [WeakRetained applicationServer:a1 client:v10 setDynamicApplicationShortcutItems:v9 forBundleIdentifier:v8];
      }
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_79);
  }
  v2 = (void *)sharedInstance___sharedInstance_6;
  return v2;
}

void __37__SBApplicationServer_sharedInstance__block_invoke()
{
  id v0 = -[SBApplicationServer _init]([SBApplicationServer alloc]);
  v1 = (void *)sharedInstance___sharedInstance_6;
  sharedInstance___sharedInstance_6 = (uint64_t)v0;
}

- (id)_init
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F62AC8];
    Serial = (void *)BSDispatchQueueCreateSerial();
    v4 = [v2 queueWithDispatchQueue:Serial];

    uint64_t v5 = *MEMORY[0x1E4FA6EC0];
    v7.receiver = v1;
    v7.super_class = (Class)SBApplicationServer;
    id v1 = objc_msgSendSuper2(&v7, sel_initWithIdentifier_queue_, v5, v4);
  }
  return v1;
}

- (void)dealloc
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationServer.m" lineNumber:40 description:@"you can't deallocate the server"];

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationServer;
  [(FBSServiceFacility *)&v5 dealloc];
}

- (void)_handleDeleteApplicationSnapshots:(void *)a3 fromClient:
{
  id v9 = a3;
  if (a1)
  {
    objc_super v5 = [a2 payload];
    id v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E4F14590])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      if (WeakRetained)
      {
        id v8 = BSDeserializeStringFromXPCDictionaryWithKey();
        [WeakRetained applicationServer:a1 client:v9 deleteSnapshotsForApplicationIdentifier:v8];
      }
    }
  }
}

- (void)_handleHarmonyFetchWhitePointAdaptivityStyleMessage:(void *)a3 fromClient:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke;
    v12[3] = &unk_1E6AF8788;
    id v7 = v5;
    id v13 = v7;
    id v8 = (void (**)(void, void))MEMORY[0x1D948C7A0](v12);
    id v9 = [v7 payload];
    id v10 = v9;
    if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E4F14590])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      if (WeakRetained) {
        objc_msgSend(WeakRetained, "applicationServer:client:fetchWhitePointAdaptivityStyleForDisplayId:withCompletion:", a1, v6, xpc_dictionary_get_uint64(v10, (const char *)*MEMORY[0x1E4FA76E0]), v8);
      }
      else {
        v8[2](v8, -1);
      }
    }
    else
    {
      v8[2](v8, -1);
    }
  }
}

- (void)_handleMultiwindowShortcutShowAllWindowsMessage:(void *)a3 fromClient:
{
  id v9 = a3;
  if (a1)
  {
    id v5 = [a2 payload];
    id v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E4F14590])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      if (WeakRetained)
      {
        id v8 = BSDeserializeStringFromXPCDictionaryWithKey();
        [WeakRetained applicationServer:a1 client:v9 showAllWindowsForBundleIdentifier:v8];
      }
    }
  }
}

- (void)_handleMultiwindowShortcutRequestShelfPresentationMessage:(void *)a3 fromClient:
{
  id v9 = a3;
  if (a1)
  {
    id v5 = [a2 payload];
    id v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E4F14590])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      if (WeakRetained)
      {
        id v8 = BSDeserializeStringFromXPCDictionaryWithKey();
        [WeakRetained applicationServer:a1 client:v9 requestShelfPresentationForSceneWithIdentifier:v8];
      }
    }
  }
}

uint64_t __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v4[4] = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __86__SBApplicationServer__handleHarmonyFetchWhitePointAdaptivityStyleMessage_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (SBApplicationServerMiscDelegate)miscDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_miscDelegate);
  return (SBApplicationServerMiscDelegate *)WeakRetained;
}

- (void)setMiscDelegate:(id)a3
{
}

- (SBApplicationServerHarmonyDelegate)harmonyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_harmonyDelegate);
  return (SBApplicationServerHarmonyDelegate *)WeakRetained;
}

- (void)setHarmonyDelegate:(id)a3
{
}

- (SBApplicationServerShortcutDelegate)shortcutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortcutDelegate);
  return (SBApplicationServerShortcutDelegate *)WeakRetained;
}

- (void)setShortcutDelegate:(id)a3
{
}

- (SBApplicationServerMultiwindowDelegate)multiwindowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_multiwindowDelegate);
  return (SBApplicationServerMultiwindowDelegate *)WeakRetained;
}

- (void)setMultiwindowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_multiwindowDelegate);
  objc_destroyWeak((id *)&self->_shortcutDelegate);
  objc_destroyWeak((id *)&self->_harmonyDelegate);
  objc_destroyWeak((id *)&self->_miscDelegate);
}

- (void)noteDidReceiveMessage:(uint64_t)a1 withType:(void *)a2 fromClient:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [a2 processHandle];
  int v8 = 138543618;
  id v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] sent a message with an unknown format. Ignoring request.", (uint8_t *)&v8, 0x16u);
}

@end