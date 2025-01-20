@interface PAEDramaticWarmBG
- (BOOL)addParameters;
- (PAEDramaticWarmBG)initWithAPIManager:(id)a3;
@end

@implementation PAEDramaticWarmBG

- (PAEDramaticWarmBG)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticWarmBG;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 21;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end