@interface PAEDramaticCoolFG
- (BOOL)addParameters;
- (PAEDramaticCoolFG)initWithAPIManager:(id)a3;
@end

@implementation PAEDramaticCoolFG

- (PAEDramaticCoolFG)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticCoolFG;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 23;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end