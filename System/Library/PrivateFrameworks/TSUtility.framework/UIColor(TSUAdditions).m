@interface UIColor(TSUAdditions)
+ (id)grayCheckerboardColor;
+ (id)transparentGrayCheckerboardColor;
+ (uint64_t)checkerboardColorWithColor:()TSUAdditions andColor:squareSize:;
+ (uint64_t)tableViewCellDarkBlueTextColor;
@end

@implementation UIColor(TSUAdditions)

+ (uint64_t)checkerboardColorWithColor:()TSUAdditions andColor:squareSize:
{
  v16.CGFloat width = a1 + a1;
  CGFloat width = v16.width;
  v16.CGFloat height = a2 + a2;
  CGFloat height = v16.height;
  UIGraphicsBeginImageContext(v16);
  [a5 setFill];
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  UIRectFill(v17);
  [a6 setFill];
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.CGFloat width = a1;
  v18.size.CGFloat height = a2;
  UIRectFill(v18);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.CGFloat width = a1;
  v19.size.CGFloat height = a2;
  UIRectFill(v19);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (!ImageFromCurrentImageContext) {
    return 0;
  }
  v13 = (void *)MEMORY[0x263F1C550];
  return [v13 colorWithPatternImage:ImageFromCurrentImageContext];
}

+ (id)grayCheckerboardColor
{
  id result = (id)grayCheckerboardColor_sColor;
  if (!grayCheckerboardColor_sColor)
  {
    uint64_t v3 = [MEMORY[0x263F1C550] darkGrayColor];
    id result = (id)objc_msgSend(a1, "checkerboardColorWithColor:andColor:squareSize:", v3, objc_msgSend(MEMORY[0x263F1C550], "lightGrayColor"), 16.0, 16.0);
    grayCheckerboardColor_sColor = (uint64_t)result;
  }
  return result;
}

+ (id)transparentGrayCheckerboardColor
{
  id result = (id)transparentGrayCheckerboardColor_sColor;
  if (!transparentGrayCheckerboardColor_sColor)
  {
    uint64_t v3 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.25];
    id result = (id)objc_msgSend(a1, "checkerboardColorWithColor:andColor:squareSize:", v3, objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.25), 16.0, 16.0);
    transparentGrayCheckerboardColor_sColor = (uint64_t)result;
  }
  return result;
}

+ (uint64_t)tableViewCellDarkBlueTextColor
{
  uint64_t result = tableViewCellDarkBlueTextColor_sColor;
  if (!tableViewCellDarkBlueTextColor_sColor)
  {
    uint64_t result = [objc_alloc(MEMORY[0x263F1C550]) initWithRed:0.219607843 green:0.329411765 blue:0.529411765 alpha:1.0];
    tableViewCellDarkBlueTextColor_sColor = result;
  }
  return result;
}

@end