@interface BKSHIDEventDeferringEnvironment(UIKitAdditions_Internal)
+ (id)ui_systemKeyCommandOverlayEnvironment;
@end

@implementation BKSHIDEventDeferringEnvironment(UIKitAdditions_Internal)

+ (id)ui_systemKeyCommandOverlayEnvironment
{
  if (qword_1EB260708 != -1) {
    dispatch_once(&qword_1EB260708, &__block_literal_global_5_1);
  }
  v0 = (void *)qword_1EB260700;
  return v0;
}

@end