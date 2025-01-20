@interface SUItemCellConfiguration
+ (id)copyDefaultContext;
@end

@implementation SUItemCellConfiguration

+ (id)copyDefaultContext
{
  return objc_alloc_init(SUItemCellContext);
}

@end