@interface PHMoment(PLMomentProcessingProtocol)
- (double)pl_coordinate;
@end

@implementation PHMoment(PLMomentProcessingProtocol)

- (double)pl_coordinate
{
  v1 = objc_msgSend(a1, "pl_location");
  v2 = v1;
  if (v1)
  {
    [v1 coordinate];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1E750];
  }

  return v4;
}

@end