@interface SKIDirectInvocation
+ (id)makeParseWithDirectInvocationPayload:(id)a3;
+ (id)runSiriKitExecutorCommandWithContext:(id)a3 parse:(id)a4 appBundleId:(id)a5;
+ (id)runSiriKitExecutorCommandWithContext:(id)a3 payload:(id)a4;
+ (id)wrapCommandInStartLocalRequest:(id)a3;
@end

@implementation SKIDirectInvocation

+ (id)runSiriKitExecutorCommandWithContext:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]();
  }
  v7 = v6;
  if (!v6) {
    +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]();
  }
  v8 = +[SKIDirectInvocation makeParseWithDirectInvocationPayload:v6];
  v9 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v5 parse:v8 appBundleId:0];

  return v9;
}

+ (id)wrapCommandInStartLocalRequest:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F64E28];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x263F08C38] UUID];
  v7 = [v6 UUIDString];
  [v5 setAceId:v7];

  v33[0] = v4;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v5 setClientBoundCommands:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F64BC8]);
  v10 = [MEMORY[0x263F08C38] UUID];
  v11 = [v10 UUIDString];
  [v9 setAceId:v11];

  v12 = [v5 aceId];
  [v9 setRefId:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F64BD0]);
  v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [v14 UUIDString];
  [v13 setAceId:v15];

  v16 = [v5 aceId];
  [v13 setRefId:v16];

  [v13 setCode:0];
  id v32 = v9;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  [v13 setCommands:v17];

  id v18 = objc_alloc_init(MEMORY[0x263F64820]);
  v19 = [MEMORY[0x263F08C38] UUID];
  v20 = [v19 UUIDString];
  [v18 setAceId:v20];

  v21 = [v5 aceId];
  [v18 setRefId:v21];

  id v22 = objc_alloc_init(MEMORY[0x263F64BD0]);
  v23 = [MEMORY[0x263F08C38] UUID];
  v24 = [v23 UUIDString];
  [v22 setAceId:v24];

  v25 = [v5 aceId];
  [v22 setRefId:v25];

  [v22 setCode:-1];
  id v31 = v18;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  [v22 setCommands:v26];

  v30[0] = v13;
  v30[1] = v22;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  [v4 setCallbacks:v27];

  v28 = [v5 aceId];
  [v4 setRefId:v28];

  return v5;
}

+ (id)runSiriKitExecutorCommandWithContext:(id)a3 parse:(id)a4 appBundleId:(id)a5
{
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x263F64A18];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  v12 = [MEMORY[0x263F08C38] UUID];
  id v13 = [v12 UUIDString];
  [v11 setAceId:v13];

  [v11 setParameterPrompts:MEMORY[0x263EFFA68]];
  [v11 setMultiUser:0];
  [v11 setDirectAction:1];
  [v11 setRequiresConditionalMultiUserGrounding:0];
  [v11 setUserInitiatedAction:*MEMORY[0x263F65970]];
  id v14 = objc_alloc_init(MEMORY[0x263F64A40]);
  [v11 setRemoteExecution:v14];

  [v11 setParse:v9];
  objc_msgSend(v11, "setTextToSpeechEnabled:", objc_msgSend(v10, "isTextToSpeechEnabled"));
  objc_msgSend(v11, "setVoiceTriggerEnabled:", objc_msgSend(v10, "isVoiceTriggerEnabled"));
  v15 = [v10 interactionType];
  [v11 setInteractionType:v15];

  v16 = [v10 inputOrigin];
  [v11 setInputOrigin:v16];

  objc_msgSend(v11, "setEyesFree:", objc_msgSend(v10, "isEyesFree"));
  v17 = [v10 responseMode];

  [v11 setMode:v17];
  if (v7 && [v7 length])
  {
    id v18 = objc_alloc_init(MEMORY[0x263F64E58]);
    [v18 setBundleId:v7];
    id v19 = objc_alloc_init(MEMORY[0x263F64A28]);
    [v19 setRequestedApp:v18];
    [v11 setAppSelectionState:v19];
  }

  return v11;
}

+ (id)makeParseWithDirectInvocationPayload:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F64998];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 identifier];
  [v5 setInvocationIdentifier:v6];

  id v7 = (void *)MEMORY[0x263F08AC0];
  v8 = [v4 userData];

  id v14 = 0;
  id v9 = [v7 dataWithPropertyList:v8 format:200 options:0 error:&v14];
  id v10 = v14;
  [v5 setData:v9];

  if (v10)
  {
    id v11 = SKIDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SKIDirectInvocation makeParseWithDirectInvocationPayload:]((uint64_t)v10, v11);
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x263F649E0]);
  [v12 setType:*MEMORY[0x263F65938]];
  [v12 setDirectInvocation:v5];

  return v12;
}

+ (void)runSiriKitExecutorCommandWithContext:payload:.cold.1()
{
  __assert_rtn("+[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]", "SKIDirectInvocation.m", 22, "context != nil");
}

+ (void)runSiriKitExecutorCommandWithContext:payload:.cold.2()
{
  __assert_rtn("+[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]", "SKIDirectInvocation.m", 23, "payload != nil");
}

+ (void)makeParseWithDirectInvocationPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D851000, a2, OS_LOG_TYPE_ERROR, "error serializing SKIDirectInvocationPayload: %@", (uint8_t *)&v2, 0xCu);
}

@end