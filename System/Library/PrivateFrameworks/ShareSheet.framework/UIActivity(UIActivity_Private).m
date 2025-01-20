@interface UIActivity(UIActivity_Private)
+ (unint64_t)_xpcAttributes;
@end

@implementation UIActivity(UIActivity_Private)

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

@end