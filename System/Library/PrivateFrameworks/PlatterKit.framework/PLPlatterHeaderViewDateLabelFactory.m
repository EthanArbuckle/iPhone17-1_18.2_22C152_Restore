@interface PLPlatterHeaderViewDateLabelFactory
+ (id)sharedInstance;
@end

@implementation PLPlatterHeaderViewDateLabelFactory

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___factory;
  return v2;
}

uint64_t __53__PLPlatterHeaderViewDateLabelFactory_sharedInstance__block_invoke()
{
  sharedInstance___factory = (uint64_t)objc_alloc_init(MEMORY[0x1E4F4F8A8]);
  return MEMORY[0x1F41817F8]();
}

@end