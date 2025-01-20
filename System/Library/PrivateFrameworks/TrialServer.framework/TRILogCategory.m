@interface TRILogCategory
@end

@implementation TRILogCategory

uint64_t __TRILogCategory_ClientFramework_block_invoke()
{
  qword_1EA8D8000 = (uint64_t)os_log_create("com.apple.triald", "_");
  return MEMORY[0x1F41817F8]();
}

uint64_t __TRILogCategory_Daemon_block_invoke()
{
  qword_1EA8D8010 = (uint64_t)os_log_create("com.apple.triald", "_");
  return MEMORY[0x1F41817F8]();
}

uint64_t __TRILogCategory_Server_block_invoke()
{
  qword_1EA8D8020 = (uint64_t)os_log_create("com.apple.triald", "server");
  return MEMORY[0x1F41817F8]();
}

uint64_t __TRILogCategory_Backtrace_block_invoke()
{
  qword_1EA8D8030 = (uint64_t)os_log_create("com.apple.triald", "backtrace");
  return MEMORY[0x1F41817F8]();
}

uint64_t __TRILogCategory_XCTest_block_invoke()
{
  qword_1EA8D8040 = (uint64_t)os_log_create("com.apple.triald", "test");
  return MEMORY[0x1F41817F8]();
}

uint64_t __TRILogCategory_InternalTool_block_invoke()
{
  qword_1EA8D8050 = (uint64_t)os_log_create("com.apple.triald", "tool");
  return MEMORY[0x1F41817F8]();
}

uint64_t __TRILogCategory_Archiving_block_invoke()
{
  qword_1EA8D8060 = (uint64_t)os_log_create("com.apple.triald", "archiving");
  return MEMORY[0x1F41817F8]();
}

@end