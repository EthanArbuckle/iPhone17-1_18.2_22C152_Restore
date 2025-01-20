@interface RBMaxPendingProcessStates
@end

@implementation RBMaxPendingProcessStates

void ___RBMaxPendingProcessStates_block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v2 = 0;
  size_t v1 = 4;
  if (!sysctlbyname("kern.maxproc", &v2, &v1, 0, 0) && v2 >= 0x4B0) {
    _RBMaxPendingProcessStates_maxPendingProcessStates = (v2 >> 1) + 100;
  }
  v0 = rbs_process_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v4 = _RBMaxPendingProcessStates_maxPendingProcessStates;
    _os_log_impl(&dword_226AB3000, v0, OS_LOG_TYPE_DEFAULT, "RBMaxPendingProcessStates is %u", buf, 8u);
  }
}

@end