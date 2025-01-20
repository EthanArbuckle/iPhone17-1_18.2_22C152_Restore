@interface UIView(NCPlatterShadowAdditions)
- (BOOL)nc_isPlatterSubordinateIconShadowEnabled;
- (void)nc_setPlatterSubordinateIconShadowEnabled:()NCPlatterShadowAdditions;
@end

@implementation UIView(NCPlatterShadowAdditions)

- (BOOL)nc_isPlatterSubordinateIconShadowEnabled
{
  v1 = [a1 layer];
  [v1 shadowOpacity];
  if (!BSFloatEqualToFloat()) {
    goto LABEL_7;
  }
  [v1 shadowRadius];
  if (v2 != 7.0) {
    goto LABEL_7;
  }
  [v1 shadowOffset];
  BOOL v4 = 0;
  if (v5 == 0.0 && v3 == 3.0)
  {
    if ([v1 shadowColor])
    {
      v6 = (CGColor *)[v1 shadowColor];
      id v7 = [MEMORY[0x1E4FB1618] blackColor];
      BOOL v4 = CGColorEqualToColor(v6, (CGColorRef)[v7 CGColor]);

      goto LABEL_8;
    }
LABEL_7:
    BOOL v4 = 0;
  }
LABEL_8:

  return v4;
}

- (void)nc_setPlatterSubordinateIconShadowEnabled:()NCPlatterShadowAdditions
{
  BOOL v4 = [a1 layer];
  id v7 = v4;
  if (a3)
  {
    [v4 setShadowPathIsBounds:1];
    id v5 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v5, "CGColor"));

    LODWORD(v6) = 1045220557;
    [v7 setShadowOpacity:v6];
    objc_msgSend(v7, "setShadowOffset:", 0.0, 3.0);
    [v7 setShadowRadius:7.0];
  }
  else
  {
    [v4 setShadowOpacity:0.0];
  }
}

@end