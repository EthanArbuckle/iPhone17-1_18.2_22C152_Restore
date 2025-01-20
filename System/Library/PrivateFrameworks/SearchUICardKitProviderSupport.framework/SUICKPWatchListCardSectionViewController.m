@interface SUICKPWatchListCardSectionViewController
+ (id)cardSectionClasses;
@end

@implementation SUICKPWatchListCardSectionViewController

+ (id)cardSectionClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

@end