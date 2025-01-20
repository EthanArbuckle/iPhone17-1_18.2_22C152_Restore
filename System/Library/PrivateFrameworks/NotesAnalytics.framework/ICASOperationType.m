@interface ICASOperationType
- (ICASOperationType)initWithOperationType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)operationType;
@end

@implementation ICASOperationType

- (ICASOperationType)initWithOperationType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASOperationType;
  result = [(ICASOperationType *)&v5 init];
  if (result) {
    result->_operationType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASOperationType *)self operationType];
  if ((unint64_t)(v3 - 1) > 0xA) {
    return @"unknown";
  }
  else {
    return off_1E64B93C8[v3 - 1];
  }
}

- (int64_t)operationType
{
  return self->_operationType;
}

@end