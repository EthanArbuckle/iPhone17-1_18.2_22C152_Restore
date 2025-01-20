@interface CLCompanionNotifierCompanionAdapter
- (BOOL)valid;
- (CLCompanionNotifierCompanionAdapter)initWithCompanionNotifierCompanion:(void *)a3;
- (void)onAbsoluteAltitudeUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLCompanionNotifierCompanionAdapter

- (CLCompanionNotifierCompanionAdapter)initWithCompanionNotifierCompanion:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLCompanionNotifierCompanionAdapter;
  result = [(CLCompanionNotifierCompanionAdapter *)&v5 init];
  if (result)
  {
    result->_companionNotifierCompanion = a3;
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
  sub_100EF230C((uint64_t)self->_companionNotifierCompanion, a3);
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102302980);
  }
  v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    [a3 filteredPressure];
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "received filtered pressure in CompanionNotifierCompanion,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102302980);
    }
    [a3 filteredPressure];
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionNotifierCompanionAdapter onAbsoluteAltitudeUpdate:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
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