@interface CLLogObjectForCategory
@end

@implementation CLLogObjectForCategory

uint64_t ___CLLogObjectForCategory_ConnectionClient_Default_block_invoke()
{
  logObject_ConnectionClient_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "ConnectionClient");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_RelativeMotionManager_Default_block_invoke()
{
  logObject_RelativeMotionManager_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "RelativeMotionManager");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_TempestDataManager_Default_block_invoke()
{
  logObject_TempestDataManager_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataManager");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_TempestDataReceiver_Default_block_invoke()
{
  logObject_TempestDataReceiver_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataReceiver");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_IPC_Default_block_invoke()
{
  logObject_IPC_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "IPC");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_ConnectionClient_Default_block_invoke_0()
{
  logObject_ConnectionClient_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "ConnectionClient");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_InternalService_Default_block_invoke()
{
  logObject_InternalService_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "InternalService");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_TempestDataManager_Default_block_invoke_0()
{
  logObject_TempestDataManager_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataManager");
  return MEMORY[0x270F9A758]();
}

uint64_t ___CLLogObjectForCategory_ConnectionClient_Default_block_invoke_1()
{
  logObject_ConnectionClient_Default = (uint64_t)os_log_create("com.apple.RelativeMotion", "ConnectionClient");
  return MEMORY[0x270F9A758]();
}

@end