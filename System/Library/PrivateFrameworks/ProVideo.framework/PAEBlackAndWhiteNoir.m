@interface PAEBlackAndWhiteNoir
- (BOOL)addParameters;
- (PAEBlackAndWhiteNoir)initWithAPIManager:(id)a3;
@end

@implementation PAEBlackAndWhiteNoir

- (PAEBlackAndWhiteNoir)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBlackAndWhiteNoir;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 26;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end