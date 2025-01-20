@interface ICASSessionDetailType
- (ICASSessionDetailType)initWithSessionDetailType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)sessionDetailType;
@end

@implementation ICASSessionDetailType

- (ICASSessionDetailType)initWithSessionDetailType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASSessionDetailType;
  result = [(ICASSessionDetailType *)&v5 init];
  if (result) {
    result->_sessionDetailType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASSessionDetailType *)self sessionDetailType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8F58[v3 - 1];
  }
}

- (int64_t)sessionDetailType
{
  return self->_sessionDetailType;
}

@end