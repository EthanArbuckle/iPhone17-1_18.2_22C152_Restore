@interface PAEMono
- (BOOL)addParameters;
- (PAEMono)initWithAPIManager:(id)a3;
@end

@implementation PAEMono

- (PAEMono)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEMono;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 0;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end