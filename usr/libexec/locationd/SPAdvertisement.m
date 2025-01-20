@interface SPAdvertisement
- (BOOL)isEqualToAdvertisement:(id)a3;
@end

@implementation SPAdvertisement

- (BOOL)isEqualToAdvertisement:(id)a3
{
  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      unsigned int v5 = [[-[SPAdvertisement address](self) stringByAppendingPathComponent:@"DBCShutdownCookie"];
      if (v5)
      {
        unsigned int v5 = [[-[SPAdvertisement advertisementData](self) isEqualToData:[a3 advertisementData]];
        if (v5)
        {
          unsigned int v6 = [(SPAdvertisement *)self status];
          LOBYTE(v5) = v6 == [a3 status];
        }
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