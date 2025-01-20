@interface ICASCollabActivityContextPath
- (ICASCollabActivityContextPath)initWithCollabActivityContextPath:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)collabActivityContextPath;
@end

@implementation ICASCollabActivityContextPath

- (ICASCollabActivityContextPath)initWithCollabActivityContextPath:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCollabActivityContextPath;
  result = [(ICASCollabActivityContextPath *)&v5 init];
  if (result) {
    result->_collabActivityContextPath = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCollabActivityContextPath *)self collabActivityContextPath];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B9390[v3 - 1];
  }
}

- (int64_t)collabActivityContextPath
{
  return self->_collabActivityContextPath;
}

@end