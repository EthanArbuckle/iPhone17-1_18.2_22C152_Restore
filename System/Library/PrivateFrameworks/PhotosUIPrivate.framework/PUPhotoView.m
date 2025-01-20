@interface PUPhotoView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PUPhotoView)initWithFrame:(CGRect)a3;
- (PUPhotoViewContentHelper)contentHelper;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PUPhotoView

- (void).cxx_destruct
{
}

- (PUPhotoViewContentHelper)contentHelper
{
  return self->_contentHelper;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoView;
  id v4 = a3;
  [(PUPhotoView *)&v7 traitCollectionDidChange:v4];
  v5 = [(PUPhotoView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PUPhotoViewContentHelper *)self->_contentHelper contentViewDynamicUserInterfaceTraitDidChange];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoView;
  [(PUPhotoView *)&v3 layoutSubviews];
  [(PUPhotoViewContentHelper *)self->_contentHelper layoutSubviewsOfContentView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PUPhotoViewContentHelper contentViewSizeThatFits:](self->_contentHelper, "contentViewSizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PUPhotoView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoView;
  double v3 = -[PUPhotoView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [[PUPhotoViewContentHelper alloc] initWithContentView:v3];
    contentHelper = v3->_contentHelper;
    v3->_contentHelper = v4;
  }
  return v3;
}

@end