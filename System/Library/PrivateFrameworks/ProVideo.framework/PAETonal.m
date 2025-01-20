@interface PAETonal
- (BOOL)addParameters;
- (PAETonal)initWithAPIManager:(id)a3;
@end

@implementation PAETonal

- (PAETonal)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAETonal;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 1;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end