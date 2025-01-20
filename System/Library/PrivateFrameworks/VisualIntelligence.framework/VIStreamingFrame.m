@interface VIStreamingFrame
- (CGRect)normalizedRegionOfInterest;
- (VIImageContent)imageContent;
- (VIStreamingFrame)initWithTimeStamp:(double)a3 imageContent:(id)a4 normalizedRegionOfInterest:(CGRect)a5 stabilityScore:(double)a6;
- (double)stabilityScore;
- (double)timestamp;
@end

@implementation VIStreamingFrame

- (VIStreamingFrame)initWithTimeStamp:(double)a3 imageContent:(id)a4 normalizedRegionOfInterest:(CGRect)a5 stabilityScore:(double)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VIStreamingFrame;
  v15 = [(VIStreamingFrame *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_timestamp = a3;
    objc_storeStrong((id *)&v15->_imageContent, a4);
    v16->_normalizedRegionOfInterest.origin.CGFloat y = y;
    v16->_normalizedRegionOfInterest.size.CGFloat width = width;
    v16->_normalizedRegionOfInterest.size.CGFloat height = height;
    v16->_stabilityScore = a6;
    v16->_normalizedRegionOfInterest.origin.CGFloat x = x;
  }

  return v16;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (VIImageContent)imageContent
{
  return self->_imageContent;
}

- (CGRect)normalizedRegionOfInterest
{
  double x = self->_normalizedRegionOfInterest.origin.x;
  double y = self->_normalizedRegionOfInterest.origin.y;
  double width = self->_normalizedRegionOfInterest.size.width;
  double height = self->_normalizedRegionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)stabilityScore
{
  return self->_stabilityScore;
}

- (void).cxx_destruct
{
}

@end