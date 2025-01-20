@interface OBTextBulletedListAccessoryButton
+ (id)accessoryButton;
@end

@implementation OBTextBulletedListAccessoryButton

+ (id)accessoryButton
{
  uint64_t v2 = *MEMORY[0x1E4FB2950];
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___OBTextBulletedListAccessoryButton;
  v3 = objc_msgSendSuper2(&v5, sel_accessoryButtonWithTextStyle_, v2);
  return v3;
}

@end