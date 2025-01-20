@interface PLProcessCPUWrapper
+ (id)start;
- (PLProcessCPUWrapper)init;
@end

@implementation PLProcessCPUWrapper

+ (id)start
{
  if (_MergedGlobals_80 != -1) {
    dispatch_once(&_MergedGlobals_80, &__block_literal_global_6);
  }
  v2 = (void *)qword_1EBD5B918;
  return v2;
}

uint64_t __28__PLProcessCPUWrapper_start__block_invoke()
{
  qword_1EBD5B918 = objc_alloc_init(PLProcessCPUWrapper);
  return MEMORY[0x1F41817F8]();
}

- (PLProcessCPUWrapper)init
{
}

uint64_t __27__PLProcessCPUWrapper_init__block_invoke()
{
  return PLProcessCPU::processPids((PLProcessCPU *)processCPU);
}

@end