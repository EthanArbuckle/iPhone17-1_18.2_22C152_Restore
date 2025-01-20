@interface SFActivityAdvertiser
+ (id)sharedAdvertiser;
- (BOOL)shouldEscapeXpcTryCatch;
- (SFActivityAdvertiser)init;
- (SFActivityAdvertiserDelegate)delegate;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6;
- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4;
- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5;
- (void)fetchLoginIDWithCompletionHandler:(id)a3;
- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3;
- (void)pairedDevicesChanged:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SFActivityAdvertiser

+ (id)sharedAdvertiser
{
  if (sharedAdvertiser_onceToken[0] != -1) {
    dispatch_once(sharedAdvertiser_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)sharedAdvertiser_manager;

  return v2;
}

void __40__SFActivityAdvertiser_sharedAdvertiser__block_invoke()
{
  if (SFDeviceSupportsContinuity()) {
    v0 = objc_alloc_init(SFActivityAdvertiser);
  }
  else {
    v0 = 0;
  }
  v1 = (void *)sharedAdvertiser_manager;
  sharedAdvertiser_manager = (uint64_t)v0;
}

- (SFActivityAdvertiser)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFActivityAdvertiser;
  v2 = [(SFXPCClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)SFActivityAdvertiser;
    [(SFXPCClient *)&v5 _activate];
  }
  return v3;
}

- (void)fetchLoginIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFActivityAdvertiser/fetchLoginIDWithCompletionHandler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SFActivityAdvertiser_fetchLoginIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5BC0E20;
  id v6 = v4;
  id v8 = v6;
  [(SFActivityAdvertiser *)self _getRemoteObjectProxyOnQueue:v7];

  os_activity_scope_leave(&state);
}

uint64_t __58__SFActivityAdvertiser_fetchLoginIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 loginIDWithOptions:0 completionHandler:*(void *)(a1 + 32)];
}

- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFActivityAdvertiser/fetchSFPeerDevicesWithCompletionHandler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SFActivityAdvertiser_fetchSFPeerDevicesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5BC0E20;
  id v6 = v4;
  id v8 = v6;
  [(SFActivityAdvertiser *)self _getRemoteObjectProxyOnQueue:v7];

  os_activity_scope_leave(&state);
}

uint64_t __64__SFActivityAdvertiser_fetchSFPeerDevicesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pairedSFPeerDevicesWithOptions:0 completionHandler:*(void *)(a1 + 32)];
}

- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFActivityAdvertiser/fetchPeerForUUID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SFActivityAdvertiser_fetchPeerForUUID_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E5BC0E48;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(SFActivityAdvertiser *)self _getRemoteObjectProxyOnQueue:v11];

  os_activity_scope_leave(&state);
}

uint64_t __63__SFActivityAdvertiser_fetchPeerForUUID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 peerForUUID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFActivityAdvertiser/advertiseAdvertisementPayload", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke;
  v11[3] = &unk_1E5BC0E70;
  void v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(SFActivityAdvertiser *)self _getRemoteObjectProxyOnQueue:v11];

  os_activity_scope_leave(&state);
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = handoff_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_cold_1((uint64_t)a1);
  }

  objc_super v5 = (void *)a1[5];
  uint64_t v6 = a1[6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_131;
  v7[3] = &unk_1E5BBCBD0;
  void v7[4] = a1[4];
  id v8 = v5;
  [v3 advertiseAdvertisementPayload:v8 options:v6 withErrorHandler:v7];
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = handoff_log();
  objc_super v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_131_cold_2(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_131_cold_1(a1);
  }
}

- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = handoff_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = SFAdvertisementDescriptionFromPayloadData(v10);
    *(_DWORD *)buf = 138412802;
    v28 = v16;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_1A5389000, v14, OS_LOG_TYPE_DEFAULT, "[%@] Received payload request from %@ for %@", buf, 0x20u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__SFActivityAdvertiser_activityPayloadForAdvertisementPayload_command_requestedByDevice_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5BC0E98;
  block[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __111__SFActivityAdvertiser_activityPayloadForAdvertisementPayload_command_requestedByDevice_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(*(void *)(a1 + 32) + 32) activityAdvertiser:*(void *)(a1 + 32) activityPayloadForAdvertisementPayload:*(void *)(a1 + 40) command:*(void *)(a1 + 48) requestedByDevice:*(void *)(a1 + 56) withCompletionHandler:*(void *)(a1 + 64)];
    v2 = @"YES";
  }
  else
  {
    v2 = @"NO";
  }
  id v3 = handoff_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
    int v8 = 138413058;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Received payload request from %@ for %@. Handled: %@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__SFActivityAdvertiser_didSendPayloadForActivityIdentifier_toDevice_error___block_invoke;
  v14[3] = &unk_1E5BBD050;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __75__SFActivityAdvertiser_didSendPayloadForActivityIdentifier_toDevice_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(*(void *)(a1 + 32) + 32) activityAdvertiser:*(void *)(a1 + 32) didSendPayloadForActivityIdentifier:*(void *)(a1 + 40) toDevice:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
    v2 = @"YES";
  }
  else
  {
    v2 = @"NO";
  }
  id v3 = handoff_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 40) UUIDString];
    int v8 = 138413058;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_debug_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEBUG, "[%@] Did send payload to %@ for activity identifier %@. Handled: %@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void)pairedDevicesChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SFActivityAdvertiser_pairedDevicesChanged___block_invoke;
  v6[3] = &unk_1E5BBBD18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __45__SFActivityAdvertiser_pairedDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
    return objc_msgSend(v3, "activityAdvertiser:pairedDevicesChangedNotification:");
  }
  return result;
}

- (id)machServiceName
{
  return @"com.apple.sharing.handoff.advertising";
}

- (id)exportedInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA29908];
  [v2 setClass:objc_opt_class() forSelector:sel_activityPayloadForAdvertisementPayload_command_requestedByDevice_withCompletionHandler_ argumentIndex:2 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_didSendPayloadForActivityIdentifier_toDevice_error_ argumentIndex:1 ofReply:0];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_pairedDevicesChanged_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)remoteObjectInterface
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA395C0];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_pairedSFPeerDevicesWithOptions_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  int v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_advertiseAdvertisementPayload_options_withErrorHandler_ argumentIndex:1 ofReply:0];

  return v2;
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFActivityAdvertiserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFActivityAdvertiserDelegate *)a3;
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_cold_1(uint64_t a1)
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1A5389000, v5, v6, "%@ dispatching request to advertise %@", v7, v8, v9, v10, 2u);
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_131_cold_1(uint64_t a1)
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1A5389000, v5, v6, "%@ advertisement request for %@ succeeded", v7, v8, v9, v10, 2u);
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_131_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
  int v10 = 138412802;
  uint64_t v11 = v7;
  OUTLINED_FUNCTION_0_2();
  __int16 v12 = v9;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1A5389000, a3, OS_LOG_TYPE_ERROR, "%@ dispatching advertisement request for %@ failed (%@)", (uint8_t *)&v10, 0x20u);
}

@end