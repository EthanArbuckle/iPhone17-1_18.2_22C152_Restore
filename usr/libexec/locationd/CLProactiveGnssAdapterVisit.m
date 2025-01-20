@interface CLProactiveGnssAdapterVisit
- (BOOL)valid;
- (CLProactiveGnssAdapterVisit)initWithProactiveGnss:(void *)a3;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLProactiveGnssAdapterVisit

- (CLProactiveGnssAdapterVisit)initWithProactiveGnss:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLProactiveGnssAdapterVisit;
  result = [(CLProactiveGnssAdapterVisit *)&v5 init];
  if (result)
  {
    result->_valid = 0;
    if (a3)
    {
      result->_visitProactiveGnss = a3;
      result->_valid = 1;
    }
  }
  return result;
}

- (void)onVisit:(id)a3
{
  if (qword_1024193D0 != -1) {
    dispatch_once(&qword_1024193D0, &stru_102349EA0);
  }
  objc_super v5 = qword_1024193D8;
  if (os_log_type_enabled((os_log_t)qword_1024193D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ProactiveGnss,onVisit", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193D0 != -1) {
      dispatch_once(&qword_1024193D0, &stru_102349EA0);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLProactiveGnssAdapterVisit onVisit:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  visitProactiveGnss = self->_visitProactiveGnss;
  if (visitProactiveGnss) {
    sub_1019BA344((uint64_t)visitProactiveGnss, a3);
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