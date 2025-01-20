@interface ICASClickContext
- (ICASClickContext)initWithClickContext:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)clickContext;
@end

@implementation ICASClickContext

- (ICASClickContext)initWithClickContext:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASClickContext;
  result = [(ICASClickContext *)&v5 init];
  if (result) {
    result->_clickContext = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASClickContext *)self clickContext];
  if ((unint64_t)(v3 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_1E64B8E18[v3 - 1];
  }
}

- (int64_t)clickContext
{
  return self->_clickContext;
}

@end