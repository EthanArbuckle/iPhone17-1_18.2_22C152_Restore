@interface SBLockScreenModalViewFactory
+ (id)newLockScreenModalView;
@end

@implementation SBLockScreenModalViewFactory

+ (id)newLockScreenModalView
{
  id v2 = objc_alloc(NSClassFromString(&cfstr_Csmodalview.isa));
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);

  return (id)objc_msgSend(v2, "initWithFrame:", v3, v4, v5, v6);
}

@end