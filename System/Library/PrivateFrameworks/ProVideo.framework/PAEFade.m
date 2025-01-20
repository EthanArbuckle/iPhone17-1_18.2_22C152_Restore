@interface PAEFade
- (BOOL)addParameters;
- (PAEFade)initWithAPIManager:(id)a3;
@end

@implementation PAEFade

- (PAEFade)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEFade;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 3;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end