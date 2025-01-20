@interface PAEInstant
- (BOOL)addParameters;
- (PAEInstant)initWithAPIManager:(id)a3;
@end

@implementation PAEInstant

- (PAEInstant)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEInstant;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 7;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end