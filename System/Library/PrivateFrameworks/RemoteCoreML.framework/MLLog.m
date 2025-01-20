@interface MLLog
@end

@implementation MLLog

uint64_t __16___MLLog_common__block_invoke()
{
  common__common = (uint64_t)os_log_create("com.apple.ml.remotelog", "RemoteCommon");
  return MEMORY[0x270F9A758]();
}

uint64_t __25___MLLog_clientFramework__block_invoke()
{
  clientFramework__framework = (uint64_t)os_log_create("com.apple.ml.remotelog", "RemoteClient");
  return MEMORY[0x270F9A758]();
}

uint64_t __16___MLLog_daemon__block_invoke()
{
  daemon__daemon = (uint64_t)os_log_create("com.apple.ml.remotelog", "RemoteDaemon");
  return MEMORY[0x270F9A758]();
}

uint64_t __25___MLLog_serverFramework__block_invoke()
{
  serverFramework__framework = (uint64_t)os_log_create("com.apple.ml.remotelog", "RemoteServer");
  return MEMORY[0x270F9A758]();
}

uint64_t __14___MLLog_tool__block_invoke()
{
  tool__tool = (uint64_t)os_log_create("com.apple.ml.remotelog", "RemoteTool");
  return MEMORY[0x270F9A758]();
}

@end