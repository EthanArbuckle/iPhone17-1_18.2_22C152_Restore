@interface WaterStateInterface
+ (id)sharedInstance;
- (BOOL)isWaterStateON;
@end

@implementation WaterStateInterface

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WaterStateInterface_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WaterStateInterface sharedInstance]::onceToken != -1) {
    dispatch_once(&+[WaterStateInterface sharedInstance]::onceToken, block);
  }
  v2 = (void *)+[WaterStateInterface sharedInstance]::sharedWaterStateInterface;

  return v2;
}

uint64_t __37__WaterStateInterface_sharedInstance__block_invoke(uint64_t a1)
{
  +[WaterStateInterface sharedInstance]::sharedWaterStateInterface = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (BOOL)isWaterStateON
{
  return 0;
}

@end