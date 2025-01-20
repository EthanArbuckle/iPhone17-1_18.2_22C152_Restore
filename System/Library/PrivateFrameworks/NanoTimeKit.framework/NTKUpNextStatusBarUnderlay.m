@interface NTKUpNextStatusBarUnderlay
- (NTKUpNextStatusBarUnderlay)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NTKUpNextStatusBarUnderlay

- (NTKUpNextStatusBarUnderlay)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextStatusBarUnderlay;
  v3 = -[NTKUpNextStatusBarUnderlay initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(NTKUpNextStatusBarUnderlay *)v3 addSubview:v5];
    overlayView = v3->_overlayView;
    v3->_overlayView = v5;
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextStatusBarUnderlay;
  [(NTKUpNextStatusBarUnderlay *)&v4 layoutSubviews];
  [(NTKUpNextStatusBarUnderlay *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(NTKUpNextStatusBarUnderlay *)self bounds];
  -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v6));
}

- (void).cxx_destruct
{
}

@end