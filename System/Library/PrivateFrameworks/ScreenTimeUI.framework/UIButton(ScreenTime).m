@interface UIButton(ScreenTime)
- (void)st_setBackgroundColor:()ScreenTime;
- (void)st_setTitleColor:()ScreenTime;
@end

@implementation UIButton(ScreenTime)

- (void)st_setBackgroundColor:()ScreenTime
{
  id v4 = a3;
  id v7 = [v4 colorWithAlphaComponent:0.5];
  v5 = objc_msgSend(MEMORY[0x263F1C6B0], "st_pointImageOfColor:", v4);

  [a1 setBackgroundImage:v5 forState:0];
  v6 = objc_msgSend(MEMORY[0x263F1C6B0], "st_pointImageOfColor:", v7);
  [a1 setBackgroundImage:v6 forState:1];
}

- (void)st_setTitleColor:()ScreenTime
{
  id v4 = a3;
  id v5 = [v4 colorWithAlphaComponent:0.25];
  [a1 setTitleColor:v4 forState:0];

  [a1 setTitleColor:v5 forState:1];
}

@end