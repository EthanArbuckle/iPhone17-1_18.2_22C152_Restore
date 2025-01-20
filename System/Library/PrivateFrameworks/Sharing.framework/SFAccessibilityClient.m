@interface SFAccessibilityClient
+ (void)requestLabelForActivityWithSlotID:(unsigned int)a3 completionHandler:(id)a4;
@end

@implementation SFAccessibilityClient

+ (void)requestLabelForActivityWithSlotID:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  if (v5)
  {
    v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFAccessibilityClient/requestLabelForActivityWithSlotID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    if (requestLabelForActivityWithSlotID_completionHandler__onceToken != -1) {
      dispatch_once(&requestLabelForActivityWithSlotID_completionHandler__onceToken, &__block_literal_global_39);
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.sharing.accessibility" options:0];
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39500];
    [v7 setRemoteObjectInterface:v8];

    [v7 _setQueue:requestLabelForActivityWithSlotID_completionHandler____xpc_queue];
    [v7 resume];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__SFAccessibilityClient_requestLabelForActivityWithSlotID_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5BBCD68;
    id v9 = v5;
    id v13 = v9;
    v10 = [v7 remoteObjectProxyWithErrorHandler:v12];
    v11 = v10;
    if (v10) {
      [v10 requestLabelForActivityWithSlotID:v4 completionHandler:v9];
    }
    else {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }

    os_activity_scope_leave(&state);
  }
}

void __77__SFAccessibilityClient_requestLabelForActivityWithSlotID_completionHandler___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.sharing.accessibility", v2);
  v1 = (void *)requestLabelForActivityWithSlotID_completionHandler____xpc_queue;
  requestLabelForActivityWithSlotID_completionHandler____xpc_queue = (uint64_t)v0;
}

uint64_t __77__SFAccessibilityClient_requestLabelForActivityWithSlotID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_SharingClientS.isa, a2);
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

@end