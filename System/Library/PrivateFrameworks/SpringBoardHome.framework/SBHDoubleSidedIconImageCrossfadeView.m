@interface SBHDoubleSidedIconImageCrossfadeView
+ (Class)_containerViewClass;
+ (Class)layerClass;
- (SBHDoubleSidedIconImageCrossfadeView)initWithSource:(id)a3 crossfadeView:(id)a4;
- (void)_applyCornerRadius:(double)a3;
- (void)_applyCornerRadiusToBackgroundView;
- (void)_applyCornerRadiusToCrossfadeView;
- (void)_applyCornerRadiusToIconImageView;
- (void)_applyCornerRadiusToViews;
- (void)_applyCrossfadeScaleX:(double)a3 scaleY:(double)a4;
- (void)_setCornerRadiusEnabled:(BOOL)a3;
- (void)cleanup;
- (void)layoutSubviews;
- (void)prepareGeometry;
@end

@implementation SBHDoubleSidedIconImageCrossfadeView

- (SBHDoubleSidedIconImageCrossfadeView)initWithSource:(id)a3 crossfadeView:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  v4 = [(SBIconImageCrossfadeView *)&v8 initWithSource:a3 crossfadeView:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SBIconImageCrossfadeView *)v4 iconImageView];
    v5->_iconImageViewClipsToBounds = [v6 clipsToBounds];
  }
  return v5;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (Class)_containerViewClass
{
  return (Class)self;
}

- (void)prepareGeometry
{
  v11.receiver = self;
  v11.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  [(SBIconImageCrossfadeView *)&v11 prepareGeometry];
  v3 = [(SBIconImageCrossfadeView *)self iconImageView];
  v4 = [v3 layer];

  [v4 setZPosition:0.01];
  [v4 setDoubleSided:0];
  v5 = [(SBIconImageCrossfadeView *)self backgroundView];
  v6 = [v5 layer];
  [v6 setDoubleSided:0];

  v7 = [(SBIconImageCrossfadeView *)self crossfadeContainerView];
  objc_super v8 = [v7 layer];

  [v8 setZPosition:-0.01];
  v9 = [(SBIconImageCrossfadeView *)self crossfadeView];
  v10 = [v9 layer];
  [v10 setDoubleSided:0];
}

- (void)_applyCrossfadeScaleX:(double)a3 scaleY:(double)a4
{
  self->_scaleX = a3;
  self->_scaleY = a4;
  memset(&v10, 0, sizeof(v10));
  CATransform3DMakeScale(&v10, a3, a4, 1.0);
  memset(&v9, 0, sizeof(v9));
  CATransform3DMakeRotation(&v9, -3.14159265, 0.0, 1.0, 0.0);
  v5 = [(SBIconImageCrossfadeView *)self crossfadeView];
  CATransform3D a = v9;
  CATransform3D v6 = v10;
  CATransform3DConcat(&v8, &a, &v6);
  [v5 setTransform3D:&v8];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  [(SBIconImageCrossfadeView *)&v3 layoutSubviews];
  [(SBHDoubleSidedIconImageCrossfadeView *)self _applyCornerRadiusToViews];
}

- (void)cleanup
{
  v16.receiver = self;
  v16.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  [(SBIconImageCrossfadeView *)&v16 cleanup];
  objc_super v3 = [(SBIconImageCrossfadeView *)self crossfadeView];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v15[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v15[5] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v15[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v15[7] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v15[0] = *MEMORY[0x1E4F39B10];
  v15[1] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v15[3] = v7;
  [v3 setTransform3D:v15];
  CATransform3D v8 = [(SBIconImageCrossfadeView *)self iconImageView];
  [v8 setClipsToBounds:self->_iconImageViewClipsToBounds];
  CATransform3D v9 = [v8 layer];
  [v9 setZPosition:0.0];
  [v9 setDoubleSided:1];
  CATransform3D v10 = [(SBIconImageCrossfadeView *)self backgroundView];
  objc_super v11 = [v10 layer];
  [v11 setDoubleSided:1];

  v12 = [(SBIconImageCrossfadeView *)self crossfadeContainerView];
  v13 = [v12 layer];

  [v13 setZPosition:0.0];
  v14 = [v3 layer];
  [v14 setDoubleSided:1];
}

- (void)_setCornerRadiusEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(SBIconImageCrossfadeView *)self iconImageView];
  long long v6 = v5;
  if (v3)
  {
    [v5 setClipsToBounds:1];

    long long v7 = [(SBIconImageCrossfadeView *)self backgroundView];
    [v7 setClipsToBounds:1];

    CATransform3D v8 = [(SBIconImageCrossfadeView *)self crossfadeView];
    id v11 = v8;
    uint64_t v9 = 1;
  }
  else
  {
    [v5 setClipsToBounds:0];

    CATransform3D v10 = [(SBIconImageCrossfadeView *)self backgroundView];
    [v10 setClipsToBounds:0];

    CATransform3D v8 = [(SBIconImageCrossfadeView *)self crossfadeView];
    id v11 = v8;
    uint64_t v9 = 0;
  }
  [v8 setClipsToBounds:v9];
}

- (void)_applyCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(SBHDoubleSidedIconImageCrossfadeView *)self _applyCornerRadiusToViews];
}

- (void)_applyCornerRadiusToViews
{
  [(SBHDoubleSidedIconImageCrossfadeView *)self _applyCornerRadiusToIconImageView];
  [(SBHDoubleSidedIconImageCrossfadeView *)self _applyCornerRadiusToBackgroundView];
  [(SBHDoubleSidedIconImageCrossfadeView *)self _applyCornerRadiusToCrossfadeView];
}

- (void)_applyCornerRadiusToIconImageView
{
  if (1.0 / self->_scaleX <= 1.0 / self->_scaleY) {
    double v3 = 1.0 / self->_scaleX;
  }
  else {
    double v3 = 1.0 / self->_scaleY;
  }
  [(SBIconImageCrossfadeView *)self morphFraction];
  double v5 = 1.0 - v4 * (1.0 - v3);
  id v6 = [(SBIconImageCrossfadeView *)self iconImageView];
  [v6 _setContinuousCornerRadius:self->_cornerRadius / v5];
}

- (void)_applyCornerRadiusToBackgroundView
{
  id v3 = [(SBIconImageCrossfadeView *)self backgroundView];
  [v3 _setContinuousCornerRadius:self->_cornerRadius];
}

- (void)_applyCornerRadiusToCrossfadeView
{
  if (self->_scaleX <= self->_scaleY) {
    double scaleX = self->_scaleX;
  }
  else {
    double scaleX = self->_scaleY;
  }
  [(SBIconImageCrossfadeView *)self morphFraction];
  double v5 = 1.0 - (1.0 - v4) * (1.0 - scaleX);
  id v6 = [(SBIconImageCrossfadeView *)self crossfadeView];
  [v6 _setContinuousCornerRadius:self->_cornerRadius / v5];
}

@end