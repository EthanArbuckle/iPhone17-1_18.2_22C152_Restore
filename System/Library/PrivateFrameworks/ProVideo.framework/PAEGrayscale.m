@interface PAEGrayscale
- (BOOL)addParameters;
- (PAEGrayscale)initWithAPIManager:(id)a3;
@end

@implementation PAEGrayscale

- (PAEGrayscale)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGrayscale;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 11;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end