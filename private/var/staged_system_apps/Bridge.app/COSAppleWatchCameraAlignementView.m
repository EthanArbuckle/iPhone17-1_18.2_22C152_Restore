@interface COSAppleWatchCameraAlignementView
- (BOOL)animationsEnabled;
- (CGRect)frameForPhoneBackgroundViewForRestingPosition:(BOOL)a3;
- (CGRect)frameForPhoneViewForRestingPosition:(BOOL)a3;
- (CGRect)frameForWatchViewForRestingPosition:(BOOL)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)phoneAssetSize;
- (CGSize)watchAssetSize;
- (COSAppleWatchCameraAlignementView)initWithFrame:(CGRect)a3;
- (UIImageView)phone;
- (UIImageView)watch;
- (UIView)phoneBG;
- (UIView)phoneCompositeView;
- (void)layoutForLiftedPhone;
- (void)layoutForOpticalPairing;
- (void)layoutInRestingPosition;
- (void)pickUpDevicesAnimation;
- (void)restDevicesAnimation;
- (void)setAnimationsEnabled:(BOOL)a3;
- (void)setPhone:(id)a3;
- (void)setPhoneAssetSize:(CGSize)a3;
- (void)setPhoneBG:(id)a3;
- (void)setPhoneCompositeView:(id)a3;
- (void)setWatch:(id)a3;
- (void)setWatchAssetSize:(CGSize)a3;
@end

@implementation COSAppleWatchCameraAlignementView

- (COSAppleWatchCameraAlignementView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)COSAppleWatchCameraAlignementView;
  v3 = -[COSAppleWatchCameraAlignementView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIImageSymbolConfiguration configurationWithWeight:2];
    v5 = +[UIImage systemImageNamed:@"applewatch" withConfiguration:v4];
    [v5 size];
    v3->_watchAssetSize.width = v6;
    v3->_watchAssetSize.height = v7;
    v8 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v5];
    watch = v3->_watch;
    v3->_watch = v8;

    v10 = v3->_watch;
    v11 = +[UIColor whiteColor];
    [(UIImageView *)v10 setTintColor:v11];

    [(COSAppleWatchCameraAlignementView *)v3 addSubview:v3->_watch];
    v12 = (UIView *)objc_alloc_init((Class)UIView);
    phoneCompositeView = v3->_phoneCompositeView;
    v3->_phoneCompositeView = v12;

    v14 = (UIView *)objc_alloc_init((Class)UIView);
    phoneBG = v3->_phoneBG;
    v3->_phoneBG = v14;

    v16 = [(UIView *)v3->_phoneBG layer];
    [v16 setCornerRadius:20.0];

    v17 = v3->_phoneBG;
    v18 = +[UIColor colorWithWhite:0.0 alpha:0.45];
    [(UIView *)v17 setBackgroundColor:v18];

    [(UIView *)v3->_phoneCompositeView addSubview:v3->_phoneBG];
    v19 = +[UIImage systemImageNamed:@"iphone" withConfiguration:v4];
    [v19 size];
    v3->_phoneAssetSize.width = v20;
    v3->_phoneAssetSize.height = v21;
    v22 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v19];
    phone = v3->_phone;
    v3->_phone = v22;

    v24 = v3->_phone;
    v25 = +[UIColor whiteColor];
    [(UIImageView *)v24 setTintColor:v25];

    [(UIImageView *)v3->_phone setAutoresizingMask:18];
    [(UIView *)v3->_phoneCompositeView addSubview:v3->_phone];
    [(COSAppleWatchCameraAlignementView *)v3 addSubview:v3->_phoneCompositeView];
    [(COSAppleWatchCameraAlignementView *)v3 layoutInRestingPosition];
  }
  return v3;
}

- (CGRect)frameForPhoneBackgroundViewForRestingPosition:(BOOL)a3
{
  double v3 = 60.0;
  if (a3) {
    double v3 = 57.0;
  }
  double v4 = 30.0;
  if (a3) {
    double v4 = 27.0;
  }
  double v5 = 150.0;
  if (a3) {
    double v5 = 123.0;
  }
  double v6 = 260.0;
  if (a3) {
    double v6 = 220.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForPhoneViewForRestingPosition:(BOOL)a3
{
  double v3 = 212.5;
  if (a3) {
    double v4 = self->_phoneAssetSize.height * 212.5 / self->_phoneAssetSize.width;
  }
  else {
    double v4 = self->_phoneAssetSize.height * 212.5 / self->_phoneAssetSize.width * 1.2;
  }
  double v5 = 63.0;
  if (a3) {
    double v5 = 77.0;
  }
  double v6 = 0.0;
  if (a3) {
    double v6 = 15.0;
  }
  else {
    double v3 = 255.0;
  }
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)frameForWatchViewForRestingPosition:(BOOL)a3
{
  double v3 = 95.0;
  double width = self->_watchAssetSize.width;
  double height = self->_watchAssetSize.height;
  double v6 = height * 95.0 / width;
  double v7 = height * 74.0 / width;
  if (!a3) {
    double v6 = v7;
  }
  double v8 = 74.5;
  if (a3) {
    double v8 = 10.0;
  }
  double v9 = 90.0;
  if (a3) {
    double v9 = 87.0;
  }
  else {
    double v3 = 74.0;
  }
  result.size.double height = v6;
  result.size.double width = v3;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)layoutForLiftedPhone
{
  phoneBG = self->_phoneBG;
  [(COSAppleWatchCameraAlignementView *)self frameForPhoneBackgroundViewForRestingPosition:0];
  -[UIView setFrame:](phoneBG, "setFrame:");
  double v4 = [(UIView *)self->_phoneBG layer];
  [v4 setCornerRadius:30.0];

  phoneCompositeView = self->_phoneCompositeView;
  [(COSAppleWatchCameraAlignementView *)self frameForPhoneViewForRestingPosition:0];

  -[UIView setFrame:](phoneCompositeView, "setFrame:");
}

- (void)layoutInRestingPosition
{
  phoneBG = self->_phoneBG;
  [(COSAppleWatchCameraAlignementView *)self frameForPhoneBackgroundViewForRestingPosition:1];
  -[UIView setFrame:](phoneBG, "setFrame:");
  double v4 = [(UIView *)self->_phoneBG layer];
  [v4 setCornerRadius:20.0];

  phoneCompositeView = self->_phoneCompositeView;
  [(COSAppleWatchCameraAlignementView *)self frameForPhoneViewForRestingPosition:1];
  -[UIView setFrame:](phoneCompositeView, "setFrame:");
  watch = self->_watch;
  [(COSAppleWatchCameraAlignementView *)self frameForWatchViewForRestingPosition:1];

  -[UIImageView setFrame:](watch, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  [(COSAppleWatchCameraAlignementView *)self frameForPhoneViewForRestingPosition:0];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(COSAppleWatchCameraAlignementView *)self frameForPhoneViewForRestingPosition:1];
  CGFloat MaxX = CGRectGetMaxX(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  double MaxY = CGRectGetMaxY(v16);
  double v13 = MaxX;
  result.double height = MaxY;
  result.double width = v13;
  return result;
}

- (void)setAnimationsEnabled:(BOOL)a3
{
  if (!self->_animationsEnabled && a3) {
    [(COSAppleWatchCameraAlignementView *)self pickUpDevicesAnimation];
  }
  self->_animationsEnabled = a3;
}

- (void)pickUpDevicesAnimation
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E13F4;
  v3[3] = &unk_1002438A0;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000E13FC;
  v2[3] = &unk_100244CE0;
  v2[4] = self;
  +[UIView animateWithDuration:2 delay:v3 options:v2 animations:0.5 completion:1.5];
}

- (void)layoutForOpticalPairing
{
  [(COSAppleWatchCameraAlignementView *)self frame];
  double v4 = v3;
  [(UIView *)self->_phoneCompositeView frame];
  uint64_t v6 = v5;
  double v8 = v7;
  uint64_t v10 = v9;
  [(UIImageView *)self->_watch frame];
  float v11 = (v4 - v8) * 0.5;
  float v13 = (v4 - v12) * 0.5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000E1570;
  v17[3] = &unk_100246D38;
  v17[4] = self;
  *(double *)&v17[5] = floorf(v11) + -8.0;
  v17[6] = v6;
  *(double *)&v17[7] = v8;
  v17[8] = v10;
  *(double *)&v17[9] = floorf(v13);
  v17[10] = v14;
  *(double *)&v17[11] = v12;
  v17[12] = v15;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E15D4;
  v16[3] = &unk_100244CE0;
  v16[4] = self;
  +[UIView animateWithDuration:2 delay:v17 options:v16 animations:0.5 completion:0.75];
}

- (void)restDevicesAnimation
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E16B8;
  v3[3] = &unk_1002438A0;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000E16C0;
  v2[3] = &unk_100244CE0;
  v2[4] = self;
  +[UIView animateWithDuration:2 delay:v3 options:v2 animations:0.5 completion:2.0];
}

- (UIView)phoneCompositeView
{
  return self->_phoneCompositeView;
}

- (void)setPhoneCompositeView:(id)a3
{
}

- (UIView)phoneBG
{
  return self->_phoneBG;
}

- (void)setPhoneBG:(id)a3
{
}

- (UIImageView)phone
{
  return self->_phone;
}

- (void)setPhone:(id)a3
{
}

- (UIImageView)watch
{
  return self->_watch;
}

- (void)setWatch:(id)a3
{
}

- (BOOL)animationsEnabled
{
  return self->_animationsEnabled;
}

- (CGSize)phoneAssetSize
{
  double width = self->_phoneAssetSize.width;
  double height = self->_phoneAssetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPhoneAssetSize:(CGSize)a3
{
  self->_phoneAssetSize = a3;
}

- (CGSize)watchAssetSize
{
  double width = self->_watchAssetSize.width;
  double height = self->_watchAssetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWatchAssetSize:(CGSize)a3
{
  self->_watchAssetSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_phoneBG, 0);

  objc_storeStrong((id *)&self->_phoneCompositeView, 0);
}

@end