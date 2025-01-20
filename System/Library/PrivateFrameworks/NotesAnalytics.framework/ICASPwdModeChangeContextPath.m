@interface ICASPwdModeChangeContextPath
- (ICASPwdModeChangeContextPath)initWithPwdModeChangeContextPath:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)pwdModeChangeContextPath;
@end

@implementation ICASPwdModeChangeContextPath

- (ICASPwdModeChangeContextPath)initWithPwdModeChangeContextPath:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASPwdModeChangeContextPath;
  result = [(ICASPwdModeChangeContextPath *)&v5 init];
  if (result) {
    result->_pwdModeChangeContextPath = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASPwdModeChangeContextPath *)self pwdModeChangeContextPath];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E64B8FC0[v3 - 1];
  }
}

- (int64_t)pwdModeChangeContextPath
{
  return self->_pwdModeChangeContextPath;
}

@end