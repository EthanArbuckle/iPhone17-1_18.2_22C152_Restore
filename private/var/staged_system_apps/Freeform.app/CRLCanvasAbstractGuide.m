@interface CRLCanvasAbstractGuide
- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5;
- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3;
- (CGColor)guideColor;
- (CGRect)snappingObjectFrame;
- (CRLCanvasAbstractGuide)init;
- (CRLCanvasLayout)snappingObjectLayout;
- (double)offset;
- (id)description;
- (id)renderableWithICC:(id)a3;
- (void)dealloc;
- (void)setGuideColor:(CGColor *)a3;
- (void)setOffset:(double)a3;
- (void)setSnappingObjectFrame:(CGRect)a3;
- (void)setSnappingObjectLayout:(id)a3;
@end

@implementation CRLCanvasAbstractGuide

- (id)renderableWithICC:(id)a3
{
  return 0;
}

- (CRLCanvasAbstractGuide)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasAbstractGuide;
  v2 = [(CRLCanvasAbstractGuide *)&v6 init];
  if (v2)
  {
    v3 = +[CRLCanvasGuideController guideColor];
    v2->mGuideColor = CGColorRetain((CGColorRef)[v3 CGColor]);

    CGSize size = CGRectNull.size;
    v2->mSnappingObjectFrame.origin = CGRectNull.origin;
    v2->mSnappingObjectFrame.CGSize size = size;
  }
  return v2;
}

- (void)setGuideColor:(CGColor *)a3
{
  mGuideColor = self->mGuideColor;
  if (mGuideColor) {
    CGColorRelease(mGuideColor);
  }
  self->mGuideColor = CGColorRetain(a3);
}

- (void)setSnappingObjectFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!sub_100064208(self->mSnappingObjectFrame.origin.x, self->mSnappingObjectFrame.origin.y, self->mSnappingObjectFrame.size.width, self->mSnappingObjectFrame.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    self->mSnappingObjectFrame.origin.CGFloat x = x;
    self->mSnappingObjectFrame.origin.CGFloat y = y;
    self->mSnappingObjectFrame.size.CGFloat width = width;
    self->mSnappingObjectFrame.size.CGFloat height = height;
    self->mLocationInvalidated = 1;
  }
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  return 1;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  return 1;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Abstract guide at offset %f", *(void *)&self->mOffset];
}

- (void)dealloc
{
  mGuideColor = self->mGuideColor;
  if (mGuideColor) {
    CGColorRelease(mGuideColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasAbstractGuide;
  [(CRLCanvasAbstractGuide *)&v4 dealloc];
}

- (double)offset
{
  return self->mOffset;
}

- (void)setOffset:(double)a3
{
  self->mOffset = a3;
}

- (CRLCanvasLayout)snappingObjectLayout
{
  return self->mSnappingObjectLayout;
}

- (void)setSnappingObjectLayout:(id)a3
{
}

- (CGRect)snappingObjectFrame
{
  double x = self->mSnappingObjectFrame.origin.x;
  double y = self->mSnappingObjectFrame.origin.y;
  double width = self->mSnappingObjectFrame.size.width;
  double height = self->mSnappingObjectFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGColor)guideColor
{
  return self->mGuideColor;
}

- (void).cxx_destruct
{
}

@end