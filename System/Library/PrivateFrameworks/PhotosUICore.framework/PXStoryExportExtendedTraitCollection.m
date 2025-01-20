@interface PXStoryExportExtendedTraitCollection
- (CGRect)fullScreenReferenceRect;
- (CGRect)overrideFullScreenReferenceRect;
- (PXStoryExportExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3 displayScale:(double)a4 overrideFullScreenReferenceRect:(CGRect)a5;
- (void)performChanges:(id)a3;
- (void)setOverrideFullScreenReferenceRect:(CGRect)a3;
@end

@implementation PXStoryExportExtendedTraitCollection

- (CGRect)overrideFullScreenReferenceRect
{
  double x = self->_overrideFullScreenReferenceRect.origin.x;
  double y = self->_overrideFullScreenReferenceRect.origin.y;
  double width = self->_overrideFullScreenReferenceRect.size.width;
  double height = self->_overrideFullScreenReferenceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryExportExtendedTraitCollection;
  [(PXStoryExtendedTraitCollection *)&v3 performChanges:a3];
}

- (CGRect)fullScreenReferenceRect
{
  p_overrideFullScreenReferenceRect = &self->_overrideFullScreenReferenceRect;
  if (CGRectIsEmpty(self->_overrideFullScreenReferenceRect))
  {
    [(PXStoryExtendedTraitCollection *)self layoutReferenceSize];
    CGFloat width = v4;
    [(PXStoryExtendedTraitCollection *)self layoutReferenceSize];
    double height = v6;
    double x = 0.0;
    double y = 0.0;
  }
  else
  {
    double x = p_overrideFullScreenReferenceRect->origin.x;
    double y = p_overrideFullScreenReferenceRect->origin.y;
    CGFloat width = p_overrideFullScreenReferenceRect->size.width;
    double height = p_overrideFullScreenReferenceRect->size.height;
  }
  double v10 = width;
  result.size.double height = height;
  result.size.CGFloat width = v10;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOverrideFullScreenReferenceRect:(CGRect)a3
{
  self->_overrideFullScreenReferenceRect = a3;
}

- (PXStoryExportExtendedTraitCollection)initWithLayoutReferenceSize:(CGSize)a3 displayScale:(double)a4 overrideFullScreenReferenceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryExportExtendedTraitCollection;
  CGRect result = -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:displayScale:](&v10, sel_initWithLayoutReferenceSize_displayScale_, a3.width, a3.height, a4);
  if (result)
  {
    result->_overrideFullScreenReferenceRect.origin.CGFloat x = x;
    result->_overrideFullScreenReferenceRect.origin.CGFloat y = y;
    result->_overrideFullScreenReferenceRect.size.CGFloat width = width;
    result->_overrideFullScreenReferenceRect.size.CGFloat height = height;
  }
  return result;
}

@end