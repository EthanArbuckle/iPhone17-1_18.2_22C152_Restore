@interface UITextField(SpringBoardUserNotification)
- (uint64_t)sb_maxInputLength;
- (void)sb_setMaxInputLength:()SpringBoardUserNotification;
@end

@implementation UITextField(SpringBoardUserNotification)

- (void)sb_setMaxInputLength:()SpringBoardUserNotification
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "_sb_maxInputLength", v2, (void *)0x301);
}

- (uint64_t)sb_maxInputLength
{
  v1 = objc_getAssociatedObject(a1, "_sb_maxInputLength");
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

@end