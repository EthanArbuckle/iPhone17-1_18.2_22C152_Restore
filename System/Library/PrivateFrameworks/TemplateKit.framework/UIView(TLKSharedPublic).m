@interface UIView(TLKSharedPublic)
- (id)tlks_screen;
- (void)tlks_scale;
- (void)tlks_setCornerRadius:()TLKSharedPublic withStyle:;
@end

@implementation UIView(TLKSharedPublic)

- (void)tlks_setCornerRadius:()TLKSharedPublic withStyle:
{
  id v6 = a4;
  v7 = [a1 layer];
  [v7 setCornerCurve:v6];

  id v8 = [a1 layer];
  [v8 setCornerRadius:a2];
}

- (id)tlks_screen
{
  v1 = [a1 _screen];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  v4 = v3;

  return v4;
}

- (void)tlks_scale
{
  [a1 effectiveScreenScale];
  if (v2 == 0.0)
  {
    id v3 = objc_msgSend(a1, "tlks_screen");
    [v3 scale];
  }
}

@end