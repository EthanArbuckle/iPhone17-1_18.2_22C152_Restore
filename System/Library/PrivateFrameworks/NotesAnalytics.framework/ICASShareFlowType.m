@interface ICASShareFlowType
- (ICASShareFlowType)initWithShareFlowType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)shareFlowType;
@end

@implementation ICASShareFlowType

- (ICASShareFlowType)initWithShareFlowType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASShareFlowType;
  result = [(ICASShareFlowType *)&v5 init];
  if (result) {
    result->_shareFlowType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASShareFlowType *)self shareFlowType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"initiate";
  }
  else {
    return off_1E64B9010[v3 - 1];
  }
}

- (int64_t)shareFlowType
{
  return self->_shareFlowType;
}

@end