@interface ICASContextPath
- (ICASContextPath)initWithContextPath:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)contextPath;
@end

@implementation ICASContextPath

- (ICASContextPath)initWithContextPath:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASContextPath;
  result = [(ICASContextPath *)&v5 init];
  if (result) {
    result->_contextPath = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASContextPath *)self contextPath];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E64B8AB8[v3 - 1];
  }
}

- (int64_t)contextPath
{
  return self->_contextPath;
}

@end