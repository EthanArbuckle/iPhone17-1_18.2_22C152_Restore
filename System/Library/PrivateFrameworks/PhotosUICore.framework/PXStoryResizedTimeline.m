@interface PXStoryResizedTimeline
- (CGRect)transformedRectForOriginalClipInfo:(id *)a3 originalRect:(CGRect)a4;
- (CGSize)originalSize;
- (CGSize)targetSize;
- (PXStoryResizedTimeline)initWithOriginalTimeline:(id)a3 targetSize:(CGSize)a4 options:(unint64_t)a5;
- (id)description;
- (unint64_t)options;
@end

@implementation PXStoryResizedTimeline

- (unint64_t)options
{
  return self->_options;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)transformedRectForOriginalClipInfo:(id *)a3 originalRect:(CGRect)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PXStoryResizedTimeline;
  -[PXStoryTransformedTimeline transformedRectForOriginalClipInfo:originalRect:](&v10, sel_transformedRectForOriginalClipInfo_originalRect_);
  if ((a3->var3 & 4) != 0)
  {
    if (([(PXStoryResizedTimeline *)self options] & 1) == 0)
    {
      [(PXStoryResizedTimeline *)self originalSize];
      PXSizeGetAspectRatio();
    }
    [(PXStoryResizedTimeline *)self targetSize];
    PXRectWithOriginAndSize();
  }
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGSize)originalSize
{
  v2 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v2 originalSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)description
{
  id v3 = [NSString alloc];
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(PXStoryResizedTimeline *)self originalSize];
  double v6 = NSStringFromCGSize(v13);
  [(PXStoryResizedTimeline *)self targetSize];
  double v7 = NSStringFromCGSize(v14);
  unint64_t v8 = [(PXStoryResizedTimeline *)self options];
  double v9 = [(PXStoryDerivedTimeline *)self originalTimeline];
  objc_super v10 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; %@ => %@; options: %lx; Original Timeline:\n\t%@>",
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9);

  return v10;
}

- (PXStoryResizedTimeline)initWithOriginalTimeline:(id)a3 targetSize:(CGSize)a4 options:(unint64_t)a5
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  [a3 originalSize];
  PXAffineTransformMakeFromRects();
}

@end