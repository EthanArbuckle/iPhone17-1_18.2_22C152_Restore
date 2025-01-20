@interface ICASErrorStatus
- (ICASErrorStatus)initWithErrorStatus:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)errorStatus;
@end

@implementation ICASErrorStatus

- (ICASErrorStatus)initWithErrorStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASErrorStatus;
  result = [(ICASErrorStatus *)&v5 init];
  if (result) {
    result->_errorStatus = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASErrorStatus *)self errorStatus];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8AD8[v3 - 1];
  }
}

- (int64_t)errorStatus
{
  return self->_errorStatus;
}

@end