@interface USLog
+ (id)client;
+ (id)clientUI;
@end

@implementation USLog

+ (id)client
{
  if (client_onceToken != -1) {
    dispatch_once(&client_onceToken, &__block_literal_global);
  }
  v2 = (void *)client__client;

  return v2;
}

uint64_t __15__USLog_client__block_invoke()
{
  client__client = (uint64_t)os_log_create(kUSLogSubsystem, "client");

  return MEMORY[0x270F9A758]();
}

+ (id)clientUI
{
  if (clientUI_onceToken != -1) {
    dispatch_once(&clientUI_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)clientUI__client;

  return v2;
}

uint64_t __17__USLog_clientUI__block_invoke()
{
  clientUI__client = (uint64_t)os_log_create(kUSLogSubsystem, "clientUI");

  return MEMORY[0x270F9A758]();
}

@end