@interface PXGadgetCollectionViewCellContentView
- (PXGadgetCollectionViewCellContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PXGadgetCollectionViewCellContentView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXGadgetCollectionViewCellContentView;
  [(PXGadgetCollectionViewCellContentView *)&v5 layoutSubviews];
  v3 = [(PXGadgetCollectionViewCellContentView *)self subviews];
  v4 = [v3 firstObject];

  if (v4)
  {
    [(PXGadgetCollectionViewCellContentView *)self bounds];
    objc_msgSend(v4, "setFrame:");
  }
}

- (PXGadgetCollectionViewCellContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXGadgetCollectionViewCellContentView;
  v3 = -[PXGadgetCollectionViewCellContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PXGadgetCollectionViewCellContentView *)v3 setAutoresizesSubviews:0];
  }
  return v4;
}

@end