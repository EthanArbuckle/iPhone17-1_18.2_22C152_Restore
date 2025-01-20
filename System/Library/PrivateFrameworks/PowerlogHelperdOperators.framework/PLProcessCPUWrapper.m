@interface PLProcessCPUWrapper
+ (id)start;
- (PLProcessCPUWrapper)init;
@end

@implementation PLProcessCPUWrapper

+ (id)start
{
  if (+[PLProcessCPUWrapper start]::oncePLProcessCpuWrapper != -1) {
    dispatch_once(&+[PLProcessCPUWrapper start]::oncePLProcessCpuWrapper, &__block_literal_global_3);
  }
  v2 = (void *)+[PLProcessCPUWrapper start]::sharedPLProcessCpuWrapper;
  return v2;
}

uint64_t __28__PLProcessCPUWrapper_start__block_invoke()
{
  +[PLProcessCPUWrapper start]::sharedPLProcessCpuWrapper = objc_alloc_init(PLProcessCPUWrapper);
  return MEMORY[0x1F41817F8]();
}

- (PLProcessCPUWrapper)init
{
}

uint64_t __27__PLProcessCPUWrapper_init__block_invoke()
{
  return PLProcessCPU::processPids((int32x2_t *)processCPU);
}

@end