@interface SSVGetFairPlayContext
@end

@implementation SSVGetFairPlayContext

void ____SSVGetFairPlayContext_block_invoke()
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Media", @"iTunes_Control", @"iTunes", 0);
  uint64_t v0 = [NSString pathWithComponents:v2];
  v1 = (void *)__SSVGetFairPlayContext_sFolderPath;
  __SSVGetFairPlayContext_sFolderPath = v0;

  SSVFairPlayGetHardwareInfo(__SSVGetFairPlayContext_sHardwareInfo);
}

@end