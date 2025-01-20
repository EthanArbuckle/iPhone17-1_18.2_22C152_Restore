@interface TRILogCategory
@end

@implementation TRILogCategory

uint64_t __TRILogCategory_ClientFramework_block_invoke()
{
  qword_1EB3B7980 = (uint64_t)os_log_create("com.apple.triald", "_");
  return MEMORY[0x1F41817F8]();
}

uint64_t __TRILogCategory_Daemon_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.triald", "_");
  uint64_t v1 = qword_1EB3B7990;
  qword_1EB3B7990 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __TRILogCategory_Server_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.triald", "server");
  uint64_t v1 = qword_1EB3B79A0;
  qword_1EB3B79A0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __TRILogCategory_Backtrace_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.triald", "backtrace");
  uint64_t v1 = qword_1EB3B79B0;
  qword_1EB3B79B0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __TRILogCategory_XCTest_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.triald", "test");
  uint64_t v1 = qword_1EB3B79C0;
  qword_1EB3B79C0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __TRILogCategory_InternalTool_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.triald", "tool");
  uint64_t v1 = qword_1EB3B79D0;
  qword_1EB3B79D0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __TRILogCategory_Archiving_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.triald", "archiving");
  uint64_t v1 = qword_1EB3B79E0;
  qword_1EB3B79E0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end