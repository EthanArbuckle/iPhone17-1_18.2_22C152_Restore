@interface PAEProcess
- (BOOL)addParameters;
- (PAEProcess)initWithAPIManager:(id)a3;
@end

@implementation PAEProcess

- (PAEProcess)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEProcess;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = 5;
  }
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end