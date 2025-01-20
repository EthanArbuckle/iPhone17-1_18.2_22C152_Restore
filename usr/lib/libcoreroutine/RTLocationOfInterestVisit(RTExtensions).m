@interface RTLocationOfInterestVisit(RTExtensions)
- (uint64_t)initWithLearnedVisit:()RTExtensions;
@end

@implementation RTLocationOfInterestVisit(RTExtensions)

- (uint64_t)initWithLearnedVisit:()RTExtensions
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 entryDate];
  v7 = [v4 exitDate];
  v8 = [v4 location];
  v9 = [v8 location];
  [v4 placeConfidence];
  double v11 = v10;
  uint64_t v12 = [v4 placeSource];

  uint64_t v13 = [a1 initWithIdentifier:v5 entry:v6 exit:v7 location:v9 locationOfInterestConfidence:v12 locationOfInterestSource:v11];
  return v13;
}

@end