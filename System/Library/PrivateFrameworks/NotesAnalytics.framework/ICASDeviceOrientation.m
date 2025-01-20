@interface ICASDeviceOrientation
- (ICASDeviceOrientation)initWithDeviceOrientation:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)deviceOrientation;
@end

@implementation ICASDeviceOrientation

- (ICASDeviceOrientation)initWithDeviceOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASDeviceOrientation;
  result = [(ICASDeviceOrientation *)&v5 init];
  if (result) {
    result->_deviceOrientation = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASDeviceOrientation *)self deviceOrientation];
  if ((unint64_t)(v3 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_1E64B99A0[v3 - 1];
  }
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

@end