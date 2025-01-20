@interface OS_MobileGestalt
- (NSDictionary)overrides;
- (OS_MobileGestalt)init;
- (OS_os_log)log;
- (void)setLog:(id)a3;
- (void)setOverrides:(id)a3;
@end

@implementation OS_MobileGestalt

- (void).cxx_destruct
{
}

- (OS_MobileGestalt)init
{
  v6.receiver = self;
  v6.super_class = (Class)OS_MobileGestalt;
  v2 = [(OS_MobileGestalt *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("MobileGestalt", "Wrapper");
    v2->_log = (OS_os_log *)v3;

    overrides = v2->_overrides;
    v2->_overrides = 0;
  }
  return v2;
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

@end