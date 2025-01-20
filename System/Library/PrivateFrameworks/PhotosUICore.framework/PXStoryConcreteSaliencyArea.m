@interface PXStoryConcreteSaliencyArea
- (CGRect)contentsRect;
- (PXStoryConcreteSaliencyArea)init;
- (PXStoryConcreteSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4;
- (float)confidence;
@end

@implementation PXStoryConcreteSaliencyArea

- (float)confidence
{
  return self->_confidence;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXStoryConcreteSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryConcreteSaliencyArea;
  CGRect result = [(PXStoryConcreteSaliencyArea *)&v10 init];
  if (result)
  {
    result->_contentsRect.origin.CGFloat x = x;
    result->_contentsRect.origin.CGFloat y = y;
    result->_contentsRect.size.CGFloat width = width;
    result->_contentsRect.size.CGFloat height = height;
    result->_confidence = a4;
  }
  return result;
}

- (PXStoryConcreteSaliencyArea)init
{
  return -[PXStoryConcreteSaliencyArea initWithContentsRect:confidence:](self, "initWithContentsRect:confidence:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0.0);
}

@end