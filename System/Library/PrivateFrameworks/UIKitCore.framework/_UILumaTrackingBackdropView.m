@interface _UILumaTrackingBackdropView
+ (Class)layerClass;
- ($F24F406B2B787EFB06265DBA3D28CBD5)transitionBoundaries;
- (BOOL)isPaused;
- (_UILumaTrackingBackdropView)initWithTransitionBoundaries:(id)a3 delegate:(id)a4 frame:(CGRect)a5;
- (_UILumaTrackingBackdropViewDelegate)delegate;
- (unint64_t)backgroundLuminanceLevel;
- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4;
- (void)setPaused:(BOOL)a3;
- (void)setTransitionBoundaries:(id)a3;
- (void)unpauseAfterSeedingWithLumaLevel:(unint64_t)a3;
@end

@implementation _UILumaTrackingBackdropView

+ (Class)layerClass
{
  return (Class)self;
}

- (unint64_t)backgroundLuminanceLevel
{
  return self->_backgroundLuminanceLevel;
}

- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4
{
  if (!self) {
    return;
  }
  unint64_t backgroundLuminanceLevel = self->_backgroundLuminanceLevel;
  if (BSFloatGreaterThanOrEqualToFloat()) {
    goto LABEL_3;
  }
  if (BSFloatLessThanOrEqualToFloat()) {
    goto LABEL_5;
  }
  if (self->_backgroundLuminanceLevel) {
    goto LABEL_7;
  }
  if (BSFloatGreaterThanOrEqualToFloat()) {
LABEL_3:
  }
    unint64_t v7 = 1;
  else {
LABEL_5:
  }
    unint64_t v7 = 2;
  self->_unint64_t backgroundLuminanceLevel = v7;
LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupDelegate);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_groupDelegate);
    [v10 backgroundLumaView:self didChangeLuma:a4];
  }
  else
  {
    if (self->_backgroundLuminanceLevel == backgroundLuminanceLevel) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);

    if (!v9) {
      return;
    }
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 backgroundLumaView:self didTransitionToLevel:self->_backgroundLuminanceLevel];
  }
}

- (void)setTransitionBoundaries:(id)a3
{
  self->_transitionBoundaries = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    id v4 = [(_UILumaTrackingBackdropView *)self _backdropLayer];
    [v4 setTracksLuma:!v3];
  }
}

- (_UILumaTrackingBackdropView)initWithTransitionBoundaries:(id)a3 delegate:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_UILumaTrackingBackdropView;
  v13 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(UIView *)v13 setUserInteractionEnabled:0];
    v14->_unint64_t backgroundLuminanceLevel = 0;
    v14->_transitionBoundaries.minimum = var0;
    v14->_transitionBoundaries.maximum = var1;
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_paused = 1;
    v15 = [(_UILumaTrackingBackdropView *)v14 _backdropLayer];
    [v15 setCaptureOnly:1];

    v16 = [(_UILumaTrackingBackdropView *)v14 _backdropLayer];
    [v16 setScale:0.5];
  }
  return v14;
}

- (void)unpauseAfterSeedingWithLumaLevel:(unint64_t)a3
{
  if (self->_paused)
  {
    if (a3 && self->_backgroundLuminanceLevel != a3)
    {
      self->_unint64_t backgroundLuminanceLevel = a3;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained backgroundLumaView:self didTransitionToLevel:self->_backgroundLuminanceLevel];
    }
    [(_UILumaTrackingBackdropView *)self setPaused:0];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)transitionBoundaries
{
  double minimum = self->_transitionBoundaries.minimum;
  double maximum = self->_transitionBoundaries.maximum;
  result.double var1 = maximum;
  result.double var0 = minimum;
  return result;
}

- (_UILumaTrackingBackdropViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UILumaTrackingBackdropViewDelegate *)WeakRetained;
}

- (BOOL)isPaused
{
  return self->_paused;
}

@end