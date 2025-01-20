@interface NSPDNSProxy
- (NSPDNSProxy)init;
- (void)dealloc;
@end

@implementation NSPDNSProxy

- (NSPDNSProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)NSPDNSProxy;
  v2 = [(NSPDNSProxy *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

- (void)dealloc
{
  sub_100047E70((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSPDNSProxy;
  [(NSPDNSProxy *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end