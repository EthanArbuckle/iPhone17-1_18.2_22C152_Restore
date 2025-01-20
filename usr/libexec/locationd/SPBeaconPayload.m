@interface SPBeaconPayload
- (BOOL)isEqualToPayload:(id)a3;
@end

@implementation SPBeaconPayload

- (BOOL)isEqualToPayload:(id)a3
{
  if (a3)
  {
    unsigned int v5 = [[-[SPBeaconPayload advertisement](self, "advertisement") isEqualToAdvertisement:[a3 advertisement]];
    if (v5)
    {
      if ([(SPBeaconPayload *)self location])
      {
        id v6 = [(SPBeaconPayload *)self location];
        id v7 = [a3 location];
        LOBYTE(v5) = _[v6 isEqualToEstimatedLocation:v7];
      }
      else
      {
        LOBYTE(v5) = [a3 location] == 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

@end