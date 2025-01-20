@interface TIAutofill
+ (void)sendAutofillCredentialCandidate:(id)a3 completionHandler:(id)a4;
@end

@implementation TIAutofill

+ (void)sendAutofillCredentialCandidate:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (sendAutofillCredentialCandidate_completionHandler__onceToken != -1) {
      dispatch_once(&sendAutofillCredentialCandidate_completionHandler__onceToken, &__block_literal_global_7741);
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput.autofill-server" options:4096];
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC54B60];
    [v7 setRemoteObjectInterface:v8];

    [v7 _setQueue:sendAutofillCredentialCandidate_completionHandler____xpc_queue];
    [v7 resume];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__TIAutofill_sendAutofillCredentialCandidate_completionHandler___block_invoke_2;
    v12[3] = &unk_1E55599D8;
    v9 = (void (**)(void))v6;
    id v13 = v9;
    v10 = [v7 remoteObjectProxyWithErrorHandler:v12];
    v11 = v10;
    if (v10) {
      [v10 reportSelectedAutofillCredential:v5 completionHandler:v9];
    }
    else {
      v9[2](v9);
    }
  }
}

uint64_t __64__TIAutofill_sendAutofillCredentialCandidate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_AppReportedCan.isa, a2);
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void __64__TIAutofill_sendAutofillCredentialCandidate_completionHandler___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.autofill-request", v2);
  v1 = (void *)sendAutofillCredentialCandidate_completionHandler____xpc_queue;
  sendAutofillCredentialCandidate_completionHandler____xpc_queue = (uint64_t)v0;
}

@end