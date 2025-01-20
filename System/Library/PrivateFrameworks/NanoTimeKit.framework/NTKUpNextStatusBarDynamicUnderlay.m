@interface NTKUpNextStatusBarDynamicUnderlay
- (NTKUpNextStatusBarDynamicUnderlay)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)updateBackgroundColor;
@end

@implementation NTKUpNextStatusBarDynamicUnderlay

- (NTKUpNextStatusBarDynamicUnderlay)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextStatusBarDynamicUnderlay;
  v3 = -[NTKUpNextStatusBarDynamicUnderlay initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NTKUpNextStatusBarDynamicUnderlay *)v3 updateBackgroundColor];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_updateBackgroundColor name:*MEMORY[0x1E4FB24A8] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextStatusBarDynamicUnderlay;
  [(NTKUpNextStatusBarDynamicUnderlay *)&v4 dealloc];
}

- (void)updateBackgroundColor
{
  v12[3] = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_overlayView removeFromSuperview];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    objc_super v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v4 setBackgroundColor:v5];
  }
  else
  {
    objc_super v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    v6 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:20.0];
    objc_super v7 = objc_msgSend(MEMORY[0x1E4FB1620], "colorEffectSaturate:", 0.7, v6);
    v12[1] = v7;
    v8 = [MEMORY[0x1E4FB1620] colorEffectBrightness:-0.25];
    v12[2] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

    [(UIView *)v4 setBackgroundEffects:v9];
  }
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  v11 = v4;

  [(NTKUpNextStatusBarDynamicUnderlay *)self addSubview:v11];
  [(NTKUpNextStatusBarDynamicUnderlay *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NTKUpNextStatusBarDynamicUnderlay;
  [(NTKUpNextStatusBarDynamicUnderlay *)&v10 layoutSubviews];
  id v3 = +[CLKRenderingContext sharedRenderingContext];
  objc_super v4 = [v3 device];

  _LayoutConstants_0(v4, v8);
  double v5 = v9;
  double v6 = -v9;
  [(NTKUpNextStatusBarDynamicUnderlay *)self bounds];
  double Width = CGRectGetWidth(v11);
  [(NTKUpNextStatusBarDynamicUnderlay *)self bounds];
  -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, v6, Width, v5 + CGRectGetHeight(v12) + 1.0);
}

- (void).cxx_destruct
{
}

@end