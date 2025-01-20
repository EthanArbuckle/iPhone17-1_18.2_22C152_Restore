@interface PXSmartScaleView
- (CGSize)displaySize;
- (double)displayScale;
- (void)setDisplaySize:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXSmartScaleView

- (void)setDisplaySize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_displaySize, &v3, 16, 1, 0);
}

- (CGSize)displaySize
{
  objc_copyStruct(v4, &self->_displaySize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)PXSmartScaleView;
  -[PXSmartScaleView setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y);
  [(PXSmartScaleView *)self displaySize];
  if (width != v7 || height != v6)
  {
    -[PXSmartScaleView setDisplaySize:](self, "setDisplaySize:", width, height);
    [(PXSmartScaleView *)self viewScaleDidChange];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXSmartScaleView;
  id v4 = a3;
  [(PXSmartScaleView *)&v10 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  double v6 = v5;

  double v7 = [(PXSmartScaleView *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  if (v6 != v9) {
    [(PXSmartScaleView *)self viewScaleDidChange];
  }
}

- (double)displayScale
{
  double v2 = [(PXSmartScaleView *)self traitCollection];
  [v2 displayScale];
  double v4 = v3;

  return fmax(v4, 1.0);
}

@end