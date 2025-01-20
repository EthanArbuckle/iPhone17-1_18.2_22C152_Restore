@interface ICASEndReason
- (ICASEndReason)initWithEndReason:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)endReason;
@end

@implementation ICASEndReason

- (ICASEndReason)initWithEndReason:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASEndReason;
  result = [(ICASEndReason *)&v5 init];
  if (result) {
    result->_endReason = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASEndReason *)self endReason];
  if ((unint64_t)(v3 - 1) > 6) {
    return @"unknown";
  }
  else {
    return off_1E64B99D0[v3 - 1];
  }
}

- (int64_t)endReason
{
  return self->_endReason;
}

@end