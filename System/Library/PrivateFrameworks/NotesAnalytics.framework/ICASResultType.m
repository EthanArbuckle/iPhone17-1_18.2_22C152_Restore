@interface ICASResultType
- (ICASResultType)initWithResultType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)resultType;
@end

@implementation ICASResultType

- (ICASResultType)initWithResultType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASResultType;
  result = [(ICASResultType *)&v5 init];
  if (result) {
    result->_resultType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASResultType *)self resultType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B89B0[v3 - 1];
  }
}

- (int64_t)resultType
{
  return self->_resultType;
}

@end