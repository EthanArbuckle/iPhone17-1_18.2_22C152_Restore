@interface PUIColorWellView
- (CGSize)intrinsicContentSize;
- (PUIColorWell)colorWell;
- (PUIColorWellView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PUIColorWellView

- (PUIColorWellView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUIColorWellView;
  v3 = -[PUIColorWellView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PUIColorWell alloc];
    uint64_t v5 = -[UIColorWell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    colorWell = v3->_colorWell;
    v3->_colorWell = (PUIColorWell *)v5;

    [(UIColorWell *)v3->_colorWell setSupportsAlpha:0];
    [(PUIColorWellView *)v3 addSubview:v3->_colorWell];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUIColorWellView;
  [(PUIColorWellView *)&v3 layoutSubviews];
  [(PUIColorWell *)self->_colorWell intrinsicContentSize];
  [(PUIColorWellView *)self intrinsicContentSize];
  UIRectCenteredRect();
  -[PUIColorWell setFrame:](self->_colorWell, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (void).cxx_destruct
{
}

@end