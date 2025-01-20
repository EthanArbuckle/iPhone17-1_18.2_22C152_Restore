@interface PML
@end

@implementation PML

void __PML_LogHandle_block_invoke()
{
  v0 = (void *)MEMORY[0x223C7E5C0]();
  os_log_t v1 = os_log_create("com.apple.proactive", "pml");
  v2 = (void *)PML_LogHandle__pasExprOnceResult;
  PML_LogHandle__pasExprOnceResult = (uint64_t)v1;
}

@end