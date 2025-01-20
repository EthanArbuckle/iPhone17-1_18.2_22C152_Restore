@interface PAEDramaticWarmFG
- (BOOL)addParameters;
- (PAEDramaticWarmFG)initWithAPIManager:(id)a3;
@end

@implementation PAEDramaticWarmFG

- (PAEDramaticWarmFG)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticWarmFG;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 24;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end