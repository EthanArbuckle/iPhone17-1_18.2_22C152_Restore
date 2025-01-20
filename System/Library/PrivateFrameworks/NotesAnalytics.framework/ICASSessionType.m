@interface ICASSessionType
- (ICASSessionType)initWithSessionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)sessionType;
@end

@implementation ICASSessionType

- (ICASSessionType)initWithSessionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASSessionType;
  result = [(ICASSessionType *)&v5 init];
  if (result) {
    result->_sessionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASSessionType *)self sessionType];
  if ((unint64_t)(v3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E64B9170[v3 - 1];
  }
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

@end