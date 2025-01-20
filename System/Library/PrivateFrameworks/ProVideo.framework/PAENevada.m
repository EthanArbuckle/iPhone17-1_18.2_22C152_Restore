@interface PAENevada
- (BOOL)addParameters;
- (PAENevada)initWithAPIManager:(id)a3;
@end

@implementation PAENevada

- (PAENevada)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAENevada;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 12;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end