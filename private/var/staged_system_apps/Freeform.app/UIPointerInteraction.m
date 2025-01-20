@interface UIPointerInteraction
+ (double)crl_toolbarRoundedRectCornerRadius;
+ (double)crl_toolbarRoundedRectHeight;
+ (double)crl_toolbarRoundedRectWidth;
+ (id)crl_toolbarPointerStyleProvider;
+ (id)p_roundedRectProviderWithCornerRadius:(double)a3 width:(double)a4 heightBlock:(id)a5;
+ (id)p_roundedRectProviderWithSize:(CGSize)a3 cornerRadius:(double)a4;
@end

@implementation UIPointerInteraction

+ (id)crl_toolbarPointerStyleProvider
{
  [a1 crl_toolbarRoundedRectWidth];
  double v4 = v3;
  [a1 crl_toolbarRoundedRectHeight];
  double v6 = v5;
  [a1 crl_toolbarRoundedRectCornerRadius];

  return [a1 p_roundedRectProviderWithSize:v4 cornerRadius:v6];
}

+ (double)crl_toolbarRoundedRectWidth
{
  return 51.0;
}

+ (double)crl_toolbarRoundedRectHeight
{
  return 37.0;
}

+ (double)crl_toolbarRoundedRectCornerRadius
{
  return 8.0;
}

+ (id)p_roundedRectProviderWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002804DC;
  v6[3] = &unk_1014E7168;
  CGSize v7 = a3;
  double v4 = [a1 p_roundedRectProviderWithCornerRadius:v6 width:a4 heightBlock:a3.width];

  return v4;
}

+ (id)p_roundedRectProviderWithCornerRadius:(double)a3 width:(double)a4 heightBlock:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10028059C;
  v10[3] = &unk_1014E7190;
  id v11 = a5;
  double v12 = a4;
  double v13 = a3;
  id v7 = v11;
  v8 = objc_retainBlock(v10);

  return v8;
}

@end