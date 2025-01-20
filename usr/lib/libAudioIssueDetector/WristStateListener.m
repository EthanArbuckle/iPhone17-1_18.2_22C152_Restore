@interface WristStateListener
+ (id)sharedInstance;
- (BOOL)isWristOn;
@end

@implementation WristStateListener

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__WristStateListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WristStateListener sharedInstance]::onceToken != -1) {
    dispatch_once(&+[WristStateListener sharedInstance]::onceToken, block);
  }
  v2 = (void *)+[WristStateListener sharedInstance]::sharedWristStateListener;

  return v2;
}

uint64_t __36__WristStateListener_sharedInstance__block_invoke(uint64_t a1)
{
  +[WristStateListener sharedInstance]::sharedWristStateListener = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (BOOL)isWristOn
{
  return 0;
}

@end