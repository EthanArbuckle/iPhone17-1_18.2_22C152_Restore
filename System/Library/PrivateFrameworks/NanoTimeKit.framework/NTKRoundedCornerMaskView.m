@interface NTKRoundedCornerMaskView
+ (id)_maskForDevice:(id)a3;
+ (id)_maskWithSize:(CGSize)a3 screenScale:(double)a4 cornerRadius:(double)a5;
- (NTKRoundedCornerMaskView)initWithDevice:(id)a3;
- (NTKRoundedCornerMaskView)initWithFrame:(CGRect)a3 screenScale:(double)a4 cornerRadius:(double)a5;
- (id)_initWithFrame:(CGRect)a3 mask:(id)a4;
@end

@implementation NTKRoundedCornerMaskView

- (NTKRoundedCornerMaskView)initWithDevice:(id)a3
{
  id v4 = a3;
  v5 = +[NTKRoundedCornerMaskView _maskForDevice:v4];
  [v4 screenBounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = -[NTKRoundedCornerMaskView _initWithFrame:mask:](self, "_initWithFrame:mask:", v5, v7, v9, v11, v13);
  return v14;
}

- (NTKRoundedCornerMaskView)initWithFrame:(CGRect)a3 screenScale:(double)a4 cornerRadius:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = +[NTKRoundedCornerMaskView _maskWithSize:screenScale:cornerRadius:](NTKRoundedCornerMaskView, "_maskWithSize:screenScale:cornerRadius:", a3.size.width, a3.size.height, a4, a5);
  double v11 = -[NTKRoundedCornerMaskView _initWithFrame:mask:](self, "_initWithFrame:mask:", v10, x, y, width, height);

  return v11;
}

- (id)_initWithFrame:(CGRect)a3 mask:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKRoundedCornerMaskView;
  double v10 = -[NTKRoundedCornerMaskView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F39BE8] layer];
    maskLayer = v10->_maskLayer;
    v10->_maskLayer = (CALayer *)v11;

    [(NTKRoundedCornerMaskView *)v10 bounds];
    -[CALayer setFrame:](v10->_maskLayer, "setFrame:");
    -[CALayer setContents:](v10->_maskLayer, "setContents:", [v9 CGImage]);
    double v13 = v10->_maskLayer;
    v14 = [(NTKRoundedCornerMaskView *)v10 layer];
    [v14 setMask:v13];
  }
  return v10;
}

+ (id)_maskForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_maskForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&_maskForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_maskForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_maskForDevice____cachedDevice, v4);
    _maskForDevice____previousCLKDeviceVersion = [v4 version];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__NTKRoundedCornerMaskView__maskForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __43__NTKRoundedCornerMaskView__maskForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _maskForDevice____previousCLKDeviceVersion;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_maskForDevice____lock);
  id v11 = (id)_maskForDevice__mask;

  return v11;
}

void __43__NTKRoundedCornerMaskView__maskForDevice___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;
  [v3 screenScale];
  double v9 = v8;
  [v3 screenCornerRadius];
  double v11 = v10;

  uint64_t v12 = objc_msgSend(v2, "_maskWithSize:screenScale:cornerRadius:", v5, v7, v9, v11);
  double v13 = (void *)_maskForDevice__mask;
  _maskForDevice__mask = v12;
}

+ (id)_maskWithSize:(CGSize)a3 screenScale:(double)a4 cornerRadius:(double)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  CGFloat v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v10 = -[NTKRoundedCornerOverlayView initWithFrame:screenScale:cornerRadius:]([NTKRoundedCornerOverlayView alloc], "initWithFrame:screenScale:cornerRadius:", *MEMORY[0x1E4F1DAD8], v9, a3.width, a3.height, a4, a5);
  v17.CGFloat width = width;
  v17.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v17, 0, a4);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v12 = [MEMORY[0x1E4FB1618] whiteColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v12 CGColor]);

  v18.origin.double x = v8;
  v18.origin.double y = v9;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v18);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
  double v13 = [(NTKRoundedCornerOverlayView *)v10 layer];
  [v13 renderInContext:CurrentContext];

  v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

- (void).cxx_destruct
{
}

@end