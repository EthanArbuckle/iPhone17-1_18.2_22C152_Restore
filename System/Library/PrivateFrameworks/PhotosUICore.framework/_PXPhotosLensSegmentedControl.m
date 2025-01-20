@interface _PXPhotosLensSegmentedControl
+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4;
+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)lastTouchRemainedOnSelectedSegment;
- (_PXPhotosLensSegmentedControl)initWithFrame:(CGRect)a3;
- (void)_highlightSegment:(int64_t)a3;
- (void)_updateAppearanceEffect;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _PXPhotosLensSegmentedControl

- (BOOL)lastTouchRemainedOnSelectedSegment
{
  return self->_lastTouchRemainedOnSelectedSegment;
}

- (void)_highlightSegment:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0
    && [(_PXPhotosLensSegmentedControl *)self selectedSegmentIndex] != a3)
  {
    self->_lastTouchRemainedOnSelectedSegment = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_PXPhotosLensSegmentedControl;
  [(_PXPhotosLensSegmentedControl *)&v5 _highlightSegment:a3];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_lastTouchRemainedOnSelectedSegment = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PXPhotosLensSegmentedControl;
  [(_PXPhotosLensSegmentedControl *)&v4 touchesCancelled:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_PXPhotosLensSegmentedControl *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16 = [v7 anyObject];
  [v16 locationInView:self];
  v21.x = v17;
  v21.y = v18;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  BOOL v19 = CGRectContainsPoint(v22, v21);

  if (!v19) {
    self->_lastTouchRemainedOnSelectedSegment = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)_PXPhotosLensSegmentedControl;
  [(_PXPhotosLensSegmentedControl *)&v20 touchesEnded:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  p_locationForCurrentTouch = &self->_locationForCurrentTouch;
  self->_locationForPreviousTouch = self->_locationForCurrentTouch;
  id v7 = a4;
  id v8 = a3;
  CGFloat v9 = [v8 anyObject];
  [v9 locationInView:self];
  p_locationForCurrentTouch->x = v10;
  p_locationForCurrentTouch->y = v11;

  v12.receiver = self;
  v12.super_class = (Class)_PXPhotosLensSegmentedControl;
  [(_PXPhotosLensSegmentedControl *)&v12 touchesMoved:v8 withEvent:v7];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_lastTouchRemainedOnSelectedSegment = 1;
  p_locationForPreviousTouch = &self->_locationForPreviousTouch;
  id v7 = a4;
  id v8 = a3;
  CGFloat v9 = [v8 anyObject];
  [v9 locationInView:self];
  p_locationForPreviousTouch->x = v10;
  p_locationForPreviousTouch->y = v11;

  self->_locationForCurrentTouch = *p_locationForPreviousTouch;
  v12.receiver = self;
  v12.super_class = (Class)_PXPhotosLensSegmentedControl;
  [(_PXPhotosLensSegmentedControl *)&v12 touchesBegan:v8 withEvent:v7];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v5 = 0;
LABEL_17:
    v14.receiver = self;
    v14.super_class = (Class)_PXPhotosLensSegmentedControl;
    BOOL v12 = [(_PXPhotosLensSegmentedControl *)&v14 gestureRecognizerShouldBegin:v4];
    goto LABEL_18;
  }
  id v5 = v4;

  if (!v5) {
    goto LABEL_17;
  }
  id v6 = [v5 view];

  if (v6 == self) {
    goto LABEL_17;
  }
  double v7 = self->_locationForCurrentTouch.x - self->_locationForPreviousTouch.x;
  double v8 = self->_locationForCurrentTouch.y - self->_locationForPreviousTouch.y;
  double v9 = -v8;
  if (v8 >= 0.0) {
    double v9 = self->_locationForCurrentTouch.y - self->_locationForPreviousTouch.y;
  }
  double v10 = -v7;
  if (v7 >= 0.0) {
    double v10 = self->_locationForCurrentTouch.x - self->_locationForPreviousTouch.x;
  }
  if (v9 <= v10 && (v7 != *MEMORY[0x1E4F1DAD8] || v8 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))) {
    goto LABEL_17;
  }
  BOOL v12 = 1;
LABEL_18:

  return v12;
}

- (void)_updateAppearanceEffect
{
  v3 = (void *)MEMORY[0x1E4FB1EA0];
  id v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
  id v4 = [v3 _effectForBlurEffect:v5 vibrancyStyle:110];
  [(_PXPhotosLensSegmentedControl *)self _setSelectedSegmentVibrancyEffect:v4];
}

- (_PXPhotosLensSegmentedControl)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PXPhotosLensSegmentedControl;
  v3 = -[_PXPhotosLensSegmentedControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(_PXPhotosLensSegmentedControl *)v3 setApportionsSegmentWidthsByContent:1];
    [(_PXPhotosLensSegmentedControl *)v4 setTransparentBackground:1];
    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.45];
    [(_PXPhotosLensSegmentedControl *)v4 setSelectedSegmentTintColor:v5];

    [(_PXPhotosLensSegmentedControl *)v4 _setAlwaysEmitValueChanged:1];
    [(_PXPhotosLensSegmentedControl *)v4 _updateAppearanceEffect];
  }
  return v4;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 4.0;
}

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  return 18.0;
}

@end