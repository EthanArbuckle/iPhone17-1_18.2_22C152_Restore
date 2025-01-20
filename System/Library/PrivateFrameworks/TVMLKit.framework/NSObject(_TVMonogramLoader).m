@interface NSObject(_TVMonogramLoader)
- (uint64_t)tv_generatorType;
- (void)tv_setGeneratorType:()_TVMonogramLoader;
@end

@implementation NSObject(_TVMonogramLoader)

- (uint64_t)tv_generatorType
{
  v1 = objc_getAssociatedObject(a1, sel_tv_generatorType);
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)tv_setGeneratorType:()_TVMonogramLoader
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_tv_generatorType, v2, (void *)1);
}

@end