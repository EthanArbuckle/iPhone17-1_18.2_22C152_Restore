@interface OBBulletedListItemLinkButton
+ (id)linkButton;
@end

@implementation OBBulletedListItemLinkButton

+ (id)linkButton
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___OBBulletedListItemLinkButton;
  v2 = objc_msgSendSuper2(&v6, sel_buttonWithType_, 1);
  v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBaseBackgroundColor:v4];

  [v3 setButtonSize:3];
  [v3 setTitleAlignment:2];
  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [v2 setConfiguration:v3];

  return v2;
}

@end