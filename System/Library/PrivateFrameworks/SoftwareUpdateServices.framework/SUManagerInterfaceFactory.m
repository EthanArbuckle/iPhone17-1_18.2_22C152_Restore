@interface SUManagerInterfaceFactory
+ (id)sharedInstance;
@end

@implementation SUManagerInterfaceFactory

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance___instance_0;
  return v2;
}

uint64_t __43__SUManagerInterfaceFactory_sharedInstance__block_invoke()
{
  sharedInstance___instance_0 = objc_alloc_init(SUManagerPolicy);
  return MEMORY[0x270F9A758]();
}

@end