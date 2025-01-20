@interface SNNComputePrecision
- (SNNComputePrecision)initWithComputePrecisionKind:(int64_t)a3;
- (int)storageType;
- (int64_t)kind;
@end

@implementation SNNComputePrecision

- (SNNComputePrecision)initWithComputePrecisionKind:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SNNComputePrecision;
  result = [(SNNComputePrecision *)&v5 init];
  if (result) {
    result->_kind = a3;
  }
  return result;
}

- (int)storageType
{
  if ([(SNNComputePrecision *)self kind] == 1) {
    return 65568;
  }
  else {
    return 65552;
  }
}

- (int64_t)kind
{
  return self->_kind;
}

@end