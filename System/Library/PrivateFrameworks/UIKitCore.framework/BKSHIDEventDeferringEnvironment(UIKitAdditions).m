@interface BKSHIDEventDeferringEnvironment(UIKitAdditions)
+ (id)ui_cameraCaptureButtonEnvironment;
+ (id)ui_environmentForUIPhysicalButton:()UIKitAdditions;
@end

@implementation BKSHIDEventDeferringEnvironment(UIKitAdditions)

+ (id)ui_cameraCaptureButtonEnvironment
{
  if (qword_1EB2606F8 != -1) {
    dispatch_once(&qword_1EB2606F8, &__block_literal_global_211);
  }
  v0 = (void *)_MergedGlobals_1047;
  return v0;
}

+ (id)ui_environmentForUIPhysicalButton:()UIKitAdditions
{
  if (a3 == 5)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F4F280], "ui_cameraCaptureButtonEnvironment", v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end