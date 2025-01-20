@interface PAEBlackAndWhiteMono
- (BOOL)addParameters;
- (PAEBlackAndWhiteMono)initWithAPIManager:(id)a3;
@end

@implementation PAEBlackAndWhiteMono

- (PAEBlackAndWhiteMono)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBlackAndWhiteMono;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 27;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end