@interface UIFont(PVAdditions)
+ (id)pv_fontWithName:()PVAdditions size:transform:;
@end

@implementation UIFont(PVAdditions)

+ (id)pv_fontWithName:()PVAdditions size:transform:
{
  id v7 = 0;
  OZXCreateFontWithName(a3, a5, a4, (const __CTFont **)&v7);
  id v5 = v7;

  return v5;
}

@end