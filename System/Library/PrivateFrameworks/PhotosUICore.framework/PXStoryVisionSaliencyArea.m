@interface PXStoryVisionSaliencyArea
- (CGRect)sourceRegionOfInterest;
- (PXStoryVisionSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4;
- (PXStoryVisionSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4 type:(int64_t)a5 sourceRegionOfInterest:(CGRect)a6;
- (int64_t)type;
@end

@implementation PXStoryVisionSaliencyArea

- (CGRect)sourceRegionOfInterest
{
  double x = self->_sourceRegionOfInterest.origin.x;
  double y = self->_sourceRegionOfInterest.origin.y;
  double width = self->_sourceRegionOfInterest.size.width;
  double height = self->_sourceRegionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (PXStoryVisionSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4 type:(int64_t)a5 sourceRegionOfInterest:(CGRect)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryVisionSaliencyArea;
  CGRect result = -[PXStoryConcreteSaliencyArea initWithContentsRect:confidence:](&v8, sel_initWithContentsRect_confidence_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_type = a5;
    result->_sourceRegionOfInterest = a6;
  }
  return result;
}

- (PXStoryVisionSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4
{
  return -[PXStoryVisionSaliencyArea initWithContentsRect:confidence:type:sourceRegionOfInterest:](self, "initWithContentsRect:confidence:type:sourceRegionOfInterest:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24));
}

@end