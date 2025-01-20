@interface TIResponseKitTrainer
+ (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation TIResponseKitTrainer

+ (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (performTrainingForClient_withCompletionHandler__onceToken != -1) {
    dispatch_once(&performTrainingForClient_withCompletionHandler__onceToken, &__block_literal_global_8700);
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput.rdt" options:4096];
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC54BC0];
  [v6 setRemoteObjectInterface:v7];

  [v6 _setQueue:performTrainingForClient_withCompletionHandler__xpcQueue];
  [v6 resume];
  v8 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_7_8704];
  v9 = v8;
  if (v8) {
    [v8 performTrainingForClient:v10 withCompletionHandler:v5];
  }
}

void __71__TIResponseKitTrainer_performTrainingForClient_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __71__TIResponseKitTrainer_performTrainingForClient_withCompletionHandler___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.response-kit-trainer", v2);
  v1 = (void *)performTrainingForClient_withCompletionHandler__xpcQueue;
  performTrainingForClient_withCompletionHandler__xpcQueue = (uint64_t)v0;
}

@end