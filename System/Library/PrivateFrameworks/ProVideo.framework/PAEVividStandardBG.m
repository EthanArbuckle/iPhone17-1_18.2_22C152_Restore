@interface PAEVividStandardBG
- (BOOL)addParameters;
- (PAEVividStandardBG)initWithAPIManager:(id)a3;
@end

@implementation PAEVividStandardBG

- (PAEVividStandardBG)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEVividStandardBG;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 16;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end