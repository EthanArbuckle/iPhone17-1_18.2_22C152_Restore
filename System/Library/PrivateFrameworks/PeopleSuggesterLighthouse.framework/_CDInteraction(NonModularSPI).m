@interface _CDInteraction(NonModularSPI)
+ (id)lh_init;
@end

@implementation _CDInteraction(NonModularSPI)

+ (id)lh_init
{
  id v1 = objc_alloc_init(a1);
  return v1;
}

@end