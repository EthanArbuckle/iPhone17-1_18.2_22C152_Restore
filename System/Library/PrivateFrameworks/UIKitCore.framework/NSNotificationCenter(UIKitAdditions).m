@interface NSNotificationCenter(UIKitAdditions)
+ (id)uikitCenter;
@end

@implementation NSNotificationCenter(UIKitAdditions)

+ (id)uikitCenter
{
  if (qword_1EB262430 != -1) {
    dispatch_once(&qword_1EB262430, &__block_literal_global_2_16);
  }
  v0 = (void *)qword_1EB262428;
  return v0;
}

@end