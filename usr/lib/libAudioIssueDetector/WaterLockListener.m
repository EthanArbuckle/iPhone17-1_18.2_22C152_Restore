@interface WaterLockListener
+ (id)sharedInstance;
- (BOOL)isWaterLockedOff;
@end

@implementation WaterLockListener

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WaterLockListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WaterLockListener sharedInstance]::onceToken != -1) {
    dispatch_once(&+[WaterLockListener sharedInstance]::onceToken, block);
  }
  v2 = (void *)+[WaterLockListener sharedInstance]::sharedWaterLockListener;

  return v2;
}

uint64_t __35__WaterLockListener_sharedInstance__block_invoke(uint64_t a1)
{
  +[WaterLockListener sharedInstance]::sharedWaterLockListener = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (BOOL)isWaterLockedOff
{
  return 0;
}

@end