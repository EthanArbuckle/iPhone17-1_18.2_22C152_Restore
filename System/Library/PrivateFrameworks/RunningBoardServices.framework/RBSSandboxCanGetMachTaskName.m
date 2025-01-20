@interface RBSSandboxCanGetMachTaskName
@end

@implementation RBSSandboxCanGetMachTaskName

uint64_t ___RBSSandboxCanGetMachTaskName_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  _RBSSandboxCanGetMachTaskName_allowed = result == 0;
  return result;
}

@end