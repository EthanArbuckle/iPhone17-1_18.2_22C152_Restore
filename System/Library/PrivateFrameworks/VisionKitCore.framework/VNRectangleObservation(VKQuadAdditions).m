@interface VNRectangleObservation(VKQuadAdditions)
- (uint64_t)summaryDescription;
@end

@implementation VNRectangleObservation(VKQuadAdditions)

- (uint64_t)summaryDescription
{
  v2 = NSString;
  [a1 topLeft];
  uint64_t v4 = v3;
  [a1 topLeft];
  uint64_t v6 = v5;
  [a1 topRight];
  uint64_t v8 = v7;
  [a1 topRight];
  uint64_t v10 = v9;
  [a1 bottomLeft];
  uint64_t v12 = v11;
  [a1 bottomLeft];
  uint64_t v14 = v13;
  [a1 bottomRight];
  uint64_t v16 = v15;
  [a1 bottomRight];
  return [v2 stringWithFormat:@"TL:%.2f %.2f TR:%.2f %.2f BL:%.2f %.2f BR:%.2f %.2f", v4, v6, v8, v10, v12, v14, v16, v17];
}

@end