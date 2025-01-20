@interface NSOperationQueue(MSVAdditions)
- (uint64_t)decreaseQualityOfService;
- (uint64_t)increaseQualityOfService;
@end

@implementation NSOperationQueue(MSVAdditions)

- (uint64_t)decreaseQualityOfService
{
  uint64_t result = [a1 qualityOfService];
  if (result > 24)
  {
    if (result == 25)
    {
      uint64_t v3 = -1;
    }
    else
    {
      if (result != 33) {
        return result;
      }
      uint64_t v3 = 25;
    }
  }
  else if (result == -1)
  {
    uint64_t v3 = 17;
  }
  else
  {
    if (result != 17) {
      return result;
    }
    uint64_t v3 = 9;
  }
  return [a1 setQualityOfService:v3];
}

- (uint64_t)increaseQualityOfService
{
  uint64_t result = [a1 qualityOfService];
  if (result > 16)
  {
    if (result == 25)
    {
      uint64_t v3 = 33;
    }
    else
    {
      if (result != 17) {
        return result;
      }
      uint64_t v3 = -1;
    }
  }
  else if (result == -1)
  {
    uint64_t v3 = 25;
  }
  else
  {
    if (result != 9) {
      return result;
    }
    uint64_t v3 = 17;
  }
  return [a1 setQualityOfService:v3];
}

@end