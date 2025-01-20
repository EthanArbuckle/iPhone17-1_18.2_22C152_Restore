@interface ICASMode
- (ICASMode)initWithMode:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)mode;
@end

@implementation ICASMode

- (ICASMode)initWithMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASMode;
  result = [(ICASMode *)&v5 init];
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASMode *)self mode];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E64B9968[v3 - 1];
  }
}

- (int64_t)mode
{
  return self->_mode;
}

@end