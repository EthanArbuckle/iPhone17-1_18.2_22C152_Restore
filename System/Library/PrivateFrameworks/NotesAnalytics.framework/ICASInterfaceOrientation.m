@interface ICASInterfaceOrientation
- (ICASInterfaceOrientation)initWithInterfaceOrientation:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)interfaceOrientation;
@end

@implementation ICASInterfaceOrientation

- (ICASInterfaceOrientation)initWithInterfaceOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASInterfaceOrientation;
  result = [(ICASInterfaceOrientation *)&v5 init];
  if (result) {
    result->_interfaceOrientation = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASInterfaceOrientation *)self interfaceOrientation];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E64B9420[v3 - 1];
  }
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

@end