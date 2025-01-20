@interface PAENewYork
- (BOOL)addParameters;
- (PAENewYork)initWithAPIManager:(id)a3;
@end

@implementation PAENewYork

- (PAENewYork)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAENewYork;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 13;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end