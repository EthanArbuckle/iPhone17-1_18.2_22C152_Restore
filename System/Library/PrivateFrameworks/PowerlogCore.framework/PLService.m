@interface PLService
+ (id)initServices;
+ (void)load;
@end

@implementation PLService

+ (void)load
{
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___PLService;
    objc_msgSendSuper2(&v4, sel_load);
  }
}

+ (id)initServices
{
  return (id)[MEMORY[0x1E4F1CA60] dictionary];
}

@end