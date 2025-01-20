@interface PLImageScrollView
- (BOOL)adjustZoomScaleAfterRotation;
- (PLImageScrollView)initWithFrame:(CGRect)a3;
- (void)setAdjustZoomScaleAfterRotation:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)willAnimateRotationToInterfaceOrientation:(id)a3;
@end

@implementation PLImageScrollView

- (void)setAdjustZoomScaleAfterRotation:(BOOL)a3
{
  self->_adjustZoomScaleAfterRotation = a3;
}

- (BOOL)adjustZoomScaleAfterRotation
{
  return self->_adjustZoomScaleAfterRotation;
}

- (void)willAnimateRotationToInterfaceOrientation:(id)a3
{
  [(PLImageScrollView *)self zoomScale];
  double v6 = v5;
  [(PLImageScrollView *)self contentOffset];
  double v8 = v7;
  double v10 = v9;
  v11.receiver = self;
  v11.super_class = (Class)PLImageScrollView;
  [(PLImageScrollView *)&v11 willAnimateRotationToInterfaceOrientation:a3];
  if ([(PLImageScrollView *)self adjustZoomScaleAfterRotation])
  {
    [(PLImageScrollView *)self setZoomScale:v6];
    -[PLImageScrollView setContentOffset:](self, "setContentOffset:", v8, v10);
  }
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PLImageScrollView;
  -[PLImageScrollView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLImageScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLImageScrollView;
  objc_super v3 = -[PLImageScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PLImageScrollView *)v3 setScrollsToTop:0];
    [(PLImageScrollView *)v4 setDecelerationRate:*MEMORY[0x1E4F43CD8]];
    [(PLImageScrollView *)v4 setExclusiveTouch:1];
    v4->_adjustZoomScaleAfterRotation = 0;
  }
  return v4;
}

@end