@interface ICASStartState
- (ICASStartState)initWithStartState:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)startState;
@end

@implementation ICASStartState

- (ICASStartState)initWithStartState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASStartState;
  result = [(ICASStartState *)&v5 init];
  if (result) {
    result->_startState = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASStartState *)self startState];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B9050[v3 - 1];
  }
}

- (int64_t)startState
{
  return self->_startState;
}

@end