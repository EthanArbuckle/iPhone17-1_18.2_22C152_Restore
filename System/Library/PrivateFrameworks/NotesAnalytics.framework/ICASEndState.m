@interface ICASEndState
- (ICASEndState)initWithEndState:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)endState;
@end

@implementation ICASEndState

- (ICASEndState)initWithEndState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASEndState;
  result = [(ICASEndState *)&v5 init];
  if (result) {
    result->_endState = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASEndState *)self endState];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B9D90[v3 - 1];
  }
}

- (int64_t)endState
{
  return self->_endState;
}

@end