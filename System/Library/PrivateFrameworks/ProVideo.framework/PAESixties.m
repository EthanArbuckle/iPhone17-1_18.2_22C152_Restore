@interface PAESixties
- (BOOL)addParameters;
- (PAESixties)initWithAPIManager:(id)a3;
@end

@implementation PAESixties

- (PAESixties)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESixties;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 14;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end