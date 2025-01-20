@interface PAEDramaticBG
- (BOOL)addParameters;
- (PAEDramaticBG)initWithAPIManager:(id)a3;
@end

@implementation PAEDramaticBG

- (PAEDramaticBG)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticBG;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 19;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end