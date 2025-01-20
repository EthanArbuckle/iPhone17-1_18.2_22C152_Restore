@interface PXStoryExtendedTraitCollection
- (CGSize)layoutReferenceSize;
- (NSShadow)viewportShadow;
- (PXStoryExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3;
- (PXStoryExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3 displayScale:(double)a4;
- (double)bottomTitleContentOffset;
- (double)displayScale;
- (double)viewportCornerRadius;
- (int64_t)layoutOrientation;
- (void)performChanges:(id)a3;
- (void)setDisplayScale:(double)a3;
- (void)setLayoutReferenceSize:(CGSize)a3;
@end

@implementation PXStoryExtendedTraitCollection

- (void).cxx_destruct
{
}

- (double)bottomTitleContentOffset
{
  return self->_bottomTitleContentOffset;
}

- (NSShadow)viewportShadow
{
  return self->_viewportShadow;
}

- (double)viewportCornerRadius
{
  return self->_viewportCornerRadius;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryExtendedTraitCollection;
  [(PXStoryExtendedTraitCollection *)&v3 performChanges:a3];
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
  v3.receiver = self;
  v3.super_class = (Class)PXStoryExtendedTraitCollection;
  -[PXExtendedTraitCollection setDisplayScale:](&v3, sel_setDisplayScale_);
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  self->_layoutReferenceSize = a3;
  v3.receiver = self;
  v3.super_class = (Class)PXStoryExtendedTraitCollection;
  [(PXExtendedTraitCollection *)&v3 setLayoutReferenceSize:sel_setLayoutReferenceSize_];
}

- (int64_t)layoutOrientation
{
  if (self->_layoutReferenceSize.width <= self->_layoutReferenceSize.height) {
    return 1;
  }
  else {
    return 2;
  }
}

- (PXStoryExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3 displayScale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryExtendedTraitCollection;
  CGSize result = [(PXExtendedTraitCollection *)&v8 initWithViewController:0];
  if (result)
  {
    result->_layoutReferenceSize.CGFloat width = width;
    result->_layoutReferenceSize.CGFloat height = height;
    result->_displayScale = a4;
  }
  return result;
}

- (PXStoryExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3
{
  return -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:displayScale:](self, "initWithLayoutReferenceSize:displayScale:", a3.width, a3.height, 1.0);
}

@end