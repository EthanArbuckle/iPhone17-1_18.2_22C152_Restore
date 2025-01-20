@interface PLCropOverlayCropView
- (CGRect)cropRect;
- (PLCropOverlayCropView)initWithFrame:(CGRect)a3;
- (void)_removeCropViews;
- (void)_updateCropRectIfNeeded;
- (void)dealloc;
- (void)setAlpha:(double)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation PLCropOverlayCropView

- (void)_removeCropViews
{
  if (self->_cropRectView)
  {
    [(UIView *)self->_aboveCropView removeFromSuperview];

    self->_aboveCropView = 0;
    [(UIView *)self->_cropRectView removeFromSuperview];

    self->_cropRectView = 0;
    [(UIView *)self->_belowCropView removeFromSuperview];

    self->_belowCropView = 0;
  }
}

- (void)_updateCropRectIfNeeded
{
  [(PLCropOverlayCropView *)self alpha];
  double v4 = v3;
  [(PLCropOverlayCropView *)self cropRect];
  if (v4 <= 0.0 || (double v9 = v5, v10 = v6, v11 = v7, v12 = v8, CGRectIsEmpty(*(CGRect *)&v5)))
  {
    [(PLCropOverlayCropView *)self _removeCropViews];
  }
  else
  {
    if (!self->_cropRectView)
    {
      uint64_t v13 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5];
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      self->_aboveCropView = v14;
      [(UIView *)v14 setBackgroundColor:v13];
      [(PLCropOverlayCropView *)self addSubview:self->_aboveCropView];
      self->_cropRectView = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      -[UIView setBackgroundColor:](self->_cropRectView, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
      -[CALayer setBorderColor:](-[UIView layer](self->_cropRectView, "layer"), "setBorderColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 1.0, 0.5), "CGColor"));
      [(CALayer *)[(UIView *)self->_cropRectView layer] setBorderWidth:1.0];
      [(PLCropOverlayCropView *)self addSubview:self->_cropRectView];
      v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      self->_belowCropView = v15;
      [(UIView *)v15 setBackgroundColor:v13];
      [(PLCropOverlayCropView *)self addSubview:self->_belowCropView];
    }
    [(PLCropOverlayCropView *)self bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v28.origin.x = v9;
    v28.origin.y = v10;
    v28.size.width = v11;
    v28.size.height = v12;
    -[UIView setFrame:](self->_aboveCropView, "setFrame:", v17, v19, v21, CGRectGetMinY(v28));
    -[UIView setFrame:](self->_cropRectView, "setFrame:", v9, v10, v11, v12);
    v29.origin.x = v9;
    v29.origin.y = v10;
    v29.size.width = v11;
    v29.size.height = v12;
    double MaxY = CGRectGetMaxY(v29);
    v30.origin.x = v9;
    v30.origin.y = v10;
    v30.size.width = v11;
    v30.size.height = v12;
    double v25 = CGRectGetMaxY(v30);
    belowCropView = self->_belowCropView;
    -[UIView setFrame:](belowCropView, "setFrame:", v17, MaxY, v21, v23 - v25);
  }
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLCropOverlayCropView;
  [(PLCropOverlayCropView *)&v4 setAlpha:a3];
  [(PLCropOverlayCropView *)self _updateCropRectIfNeeded];
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PLCropOverlayCropView *)self frame];
  if (width != v9 || height != v8) {
    [(PLCropOverlayCropView *)self _updateCropRectIfNeeded];
  }
  v11.receiver = self;
  v11.super_class = (Class)PLCropOverlayCropView;
  -[PLCropOverlayCropView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
  [(PLCropOverlayCropView *)self _updateCropRectIfNeeded];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayCropView;
  [(PLCropOverlayCropView *)&v3 dealloc];
}

- (PLCropOverlayCropView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayCropView;
  objc_super v3 = -[PLCropOverlayCropView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    -[PLCropOverlayCropView setCropRect:](v3, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  return v4;
}

@end