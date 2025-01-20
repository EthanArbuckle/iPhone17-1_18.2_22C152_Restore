@interface HKSHUIWatchMetrics
+ (double)copySafeAreaHeight;
+ (double)copySafeAreaHorizontalInset;
+ (double)copySafeAreaVerticalInset;
+ (double)copySafeAreaWidth;
+ (double)cornerElementHeight;
+ (double)distanceFromFirstBaselineToSecondBaselineInNavBar;
+ (double)distanceFromTopToFirstBaselineInNavBar;
+ (double)distanceFromTopToMidlineInBavBar;
+ (double)navBarHeight;
+ (id)_sharedMetrics;
- (CLKDevice)device;
- (HKSHUIWatchMetrics)init;
@end

@implementation HKSHUIWatchMetrics

+ (id)_sharedMetrics
{
  if (qword_1E9A5A620 != -1) {
    dispatch_once(&qword_1E9A5A620, &__block_literal_global);
  }
  v2 = (void *)qword_1E9A5A618;
  return v2;
}

uint64_t __36__HKSHUIWatchMetrics__sharedMetrics__block_invoke()
{
  qword_1E9A5A618 = objc_alloc_init(HKSHUIWatchMetrics);
  return MEMORY[0x1F41817F8]();
}

- (HKSHUIWatchMetrics)init
{
  v7.receiver = self;
  v7.super_class = (Class)HKSHUIWatchMetrics;
  v2 = [(HKSHUIWatchMetrics *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    uint64_t v4 = [v3 device];
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;
  }
  return v2;
}

+ (double)distanceFromTopToFirstBaselineInNavBar
{
  v2 = [a1 _sharedMetrics];
  v3 = [v2 device];
  _LayoutConstants(v6, v3);
  double v4 = v6[0];

  return v4;
}

+ (double)distanceFromFirstBaselineToSecondBaselineInNavBar
{
  v2 = [a1 _sharedMetrics];
  v3 = [v2 device];
  _LayoutConstants(&v6, v3);
  double v4 = *((double *)&v6 + 1);

  return v4;
}

+ (double)navBarHeight
{
  v2 = [a1 _sharedMetrics];
  v3 = [v2 device];
  _LayoutConstants(&v6, v3);
  double v4 = v7;

  return v4;
}

+ (double)distanceFromTopToMidlineInBavBar
{
  [a1 copySafeAreaVerticalInset];
  double v4 = v3;
  [a1 cornerElementHeight];
  return v4 + v5 * 0.5;
}

+ (double)copySafeAreaHeight
{
  v2 = [a1 _sharedMetrics];
  double v3 = [v2 device];
  _LayoutConstants(&v6, v3);
  double v4 = v7;

  return v4;
}

+ (double)copySafeAreaWidth
{
  v2 = [a1 _sharedMetrics];
  double v3 = [v2 device];
  _LayoutConstants(&v6, v3);
  double v4 = v7;

  return v4;
}

+ (double)copySafeAreaVerticalInset
{
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;
  [a1 copySafeAreaHeight];
  double v7 = (v5 - v6) * 0.5;

  return v7;
}

+ (double)copySafeAreaHorizontalInset
{
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;
  [a1 copySafeAreaWidth];
  double v7 = (v5 - v6) * 0.5;

  return v7;
}

+ (double)cornerElementHeight
{
  v2 = [a1 _sharedMetrics];
  double v3 = [v2 device];
  _LayoutConstants(&v6, v3);
  double v4 = v7;

  return v4;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

@end