@interface SettableIntrinsicSizeView
- (BOOL)usesIntrinsicHeightSetting;
- (CGSize)intrinsicContentSize;
- (double)intrinsicHeight;
- (void)setIntrinsicHeight:(double)a3;
- (void)setUsesIntrinsicHeightSetting:(BOOL)a3;
@end

@implementation SettableIntrinsicSizeView

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)SettableIntrinsicSizeView;
  [(SettableIntrinsicSizeView *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  if ([(SettableIntrinsicSizeView *)self usesIntrinsicHeightSetting])
  {
    [(SettableIntrinsicSizeView *)self intrinsicHeight];
    double v6 = v7;
  }
  double v8 = v4;
  double v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)usesIntrinsicHeightSetting
{
  return self->usesIntrinsicHeightSetting;
}

- (void)setUsesIntrinsicHeightSetting:(BOOL)a3
{
  self->usesIntrinsicHeightSetting = a3;
}

- (void)setIntrinsicHeight:(double)a3
{
  self->_intrinsicHeight = a3;
  [(SettableIntrinsicSizeView *)self invalidateIntrinsicContentSize];
}

- (double)intrinsicHeight
{
  return self->_intrinsicHeight;
}

@end