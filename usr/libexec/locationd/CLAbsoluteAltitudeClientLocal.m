@interface CLAbsoluteAltitudeClientLocal
- (BOOL)valid;
- (CLAbsoluteAltitudeClientLocal)initWithElevationSubscription:(void *)a3;
- (void)onAbsoluteAltitudeUpdate:(id)a3;
- (void)onElevationThresold:(float)a3 direction:(BOOL)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLAbsoluteAltitudeClientLocal

- (CLAbsoluteAltitudeClientLocal)initWithElevationSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLAbsoluteAltitudeClientLocal;
  result = [(CLAbsoluteAltitudeClientLocal *)&v5 init];
  if (result)
  {
    result->_elevationSubscription = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)onAbsoluteAltitudeUpdate:(id)a3
{
}

- (void)onElevationThresold:(float)a3 direction:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022CD8A8);
  }
  v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v9 = a3;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "elevation threshold alert,threshold,%f,above,%d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022CD8A8);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAbsoluteAltitudeClientLocal onElevationThresold:direction:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end