@interface WFACEUtilities
+ (void)wf_handleCommand:(id)a3 onRemoteDevice:(id)a4 usingClient:(id)a5 commandHandler:(id)a6 completion:(id)a7;
@end

@implementation WFACEUtilities

+ (void)wf_handleCommand:(id)a3 onRemoteDevice:(id)a4 usingClient:(id)a5 commandHandler:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, void, id))a7;
  v15 = (void *)MEMORY[0x1E4F28F98];
  v16 = [a3 dictionary];
  id v24 = 0;
  v17 = [v15 dataWithPropertyList:v16 format:200 options:0 error:&v24];
  id v18 = v24;

  if (v18)
  {
    if (v14) {
      v14[2](v14, 0, v18);
    }
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F96638]);
    [v19 setRemoteDevice:v11];
    [v19 setRequiresResponseFromRemote:1];
    [v19 setSerializedCommand:v17];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke;
    v22[3] = &unk_1E65580E8;
    id v23 = v13;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke_2;
    v20[3] = &unk_1E6558110;
    v21 = v14;
    [v12 handleCommand:v19 afterCurrentRequest:0 commandHandler:v22 completion:v20];
  }
}

void __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315906;
      id v12 = "WFEnforceClass";
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      uint64_t v18 = v4;
      id v8 = v16;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v11, 0x2Au);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    v10 = [v6 result];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

uint64_t __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end