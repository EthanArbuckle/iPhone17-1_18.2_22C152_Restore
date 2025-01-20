@interface PAECalifornia
- (BOOL)addParameters;
- (PAECalifornia)initWithAPIManager:(id)a3;
@end

@implementation PAECalifornia

- (PAECalifornia)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAECalifornia;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 10;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end