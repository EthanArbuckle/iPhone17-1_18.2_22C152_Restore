@interface _UIActivityRecipientManager
+ (id)createRemoteDataProxyWithErrorHandler:(id)a3;
+ (void)requestMailRecipientsForSessionID:(id)a3 completionHandler:(id)a4;
+ (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4;
+ (void)requestRecipientsForSessionID:(id)a3 completionHandler:(id)a4;
+ (void)requestRecipientsV2ForSessionID:(id)a3 completionHandler:(id)a4;
@end

@implementation _UIActivityRecipientManager

+ (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = _os_activity_create(&dword_1A0AD8000, "Sharing/_UIActivityRecipientManager/requestMessagesRecipientInfoForSessionID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90___UIActivityRecipientManager_requestMessagesRecipientInfoForSessionID_completionHandler___block_invoke;
    v12[3] = &unk_1E5A23208;
    id v8 = v6;
    id v13 = v8;
    v9 = +[_UIActivityRecipientManager createRemoteDataProxyWithErrorHandler:v12];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __90___UIActivityRecipientManager_requestMessagesRecipientInfoForSessionID_completionHandler___block_invoke_2;
      v10[3] = &unk_1E5A235E0;
      id v11 = v8;
      [v9 requestMessagesRecipientInfoForSessionID:v5 completionHandler:v10];
    }
    else
    {
      (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
    }

    os_activity_scope_leave(&state);
  }
}

+ (void)requestMailRecipientsForSessionID:(id)a3 completionHandler:(id)a4
{
}

+ (void)requestRecipientsForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = _os_activity_create(&dword_1A0AD8000, "Sharing/_UIActivityRecipientManager/requestRecipientsForSessionID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79___UIActivityRecipientManager_requestRecipientsForSessionID_completionHandler___block_invoke;
    v12[3] = &unk_1E5A23208;
    id v8 = v6;
    id v13 = v8;
    v9 = +[_UIActivityRecipientManager createRemoteDataProxyWithErrorHandler:v12];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __79___UIActivityRecipientManager_requestRecipientsForSessionID_completionHandler___block_invoke_4;
      v10[3] = &unk_1E5A23608;
      id v11 = v8;
      [v9 requestRecipientsForSessionID:v5 completionHandler:v10];
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }

    os_activity_scope_leave(&state);
  }
}

+ (void)requestRecipientsV2ForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = _os_activity_create(&dword_1A0AD8000, "Sharing/_UIActivityRecipientManager/requestRecipientsV2ForSessionID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81___UIActivityRecipientManager_requestRecipientsV2ForSessionID_completionHandler___block_invoke;
    v12[3] = &unk_1E5A23208;
    id v8 = v6;
    id v13 = v8;
    v9 = +[_UIActivityRecipientManager createRemoteDataProxyWithErrorHandler:v12];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __81___UIActivityRecipientManager_requestRecipientsV2ForSessionID_completionHandler___block_invoke_7;
      v10[3] = &unk_1E5A23608;
      id v11 = v8;
      [v9 requestRecipientsForSessionID:v5 completionHandler:v10];
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }

    os_activity_scope_leave(&state);
  }
}

+ (id)createRemoteDataProxyWithErrorHandler:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29268];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithMachServiceName:@"com.apple.sharing.sharesheetrecipients" options:0];
  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF3A5378];
  [v6 setClass:objc_opt_class() forSelector:sel_requestMessagesRecipientInfoForSessionID_completionHandler_ argumentIndex:0 ofReply:1];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_requestRecipientsForSessionID_completionHandler_ argumentIndex:0 ofReply:1];

  [v5 setRemoteObjectInterface:v6];
  [v5 resume];
  v10 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v10;
}

@end