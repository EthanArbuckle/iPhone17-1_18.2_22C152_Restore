@interface OBTextSectionAccessoryButton
+ (id)accessoryButton;
- (OBTextSectionAccessoryButton)init;
@end

@implementation OBTextSectionAccessoryButton

- (OBTextSectionAccessoryButton)init
{
  v5.receiver = self;
  v5.super_class = (Class)OBTextSectionAccessoryButton;
  objc_msgSend(-[OBTextSectionAccessoryButton class](&v5, sel_class), "accessoryButton");
  v3 = (OBTextSectionAccessoryButton *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)accessoryButton
{
  uint64_t v2 = *MEMORY[0x1E4FB28C8];
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___OBTextSectionAccessoryButton;
  v3 = objc_msgSendSuper2(&v5, sel_accessoryButtonWithTextStyle_, v2);
  return v3;
}

@end