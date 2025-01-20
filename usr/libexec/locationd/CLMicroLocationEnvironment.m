@interface CLMicroLocationEnvironment
+ (id)shared;
- (BOOL)isTestingEnvironment;
- (CLMicroLocationEnvironment)init;
- (void)setIsTestingEnvironment:(BOOL)a3;
@end

@implementation CLMicroLocationEnvironment

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A54BC;
  block[3] = &unk_10229FED8;
  block[4] = a1;
  if (qword_10247A728 != -1) {
    dispatch_once(&qword_10247A728, block);
  }
  return (id)qword_10247A720;
}

- (CLMicroLocationEnvironment)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationEnvironment;
  result = [(CLMicroLocationEnvironment *)&v3 init];
  if (result) {
    result->_isTestingEnvironment = 0;
  }
  return result;
}

- (BOOL)isTestingEnvironment
{
  if (!self->_isTestingEnvironment) {
    return 0;
  }
  sub_100103240();

  return sub_10073E30C();
}

- (void)setIsTestingEnvironment:(BOOL)a3
{
  self->_isTestingEnvironment = a3;
}

@end