@interface NSPServerFlowDivert
- (NSPServerFlowDivert)init;
- (void)dealloc;
@end

@implementation NSPServerFlowDivert

- (NSPServerFlowDivert)init
{
  v11.receiver = self;
  v11.super_class = (Class)NSPServerFlowDivert;
  v2 = [(NSPServerFlowDivert *)&v11 init];
  if (v2)
  {
    uint64_t v3 = nw_context_create();
    context = v2->_context;
    v2->_context = (OS_nw_context *)v3;

    v5 = NPGetInternalQueue();
    v9 = v2;
    nw_context_set_idle_handler();

    nw_context_set_isolate_protocol_cache();
    nw_context_activate();
    v6 = v9;
    p_super = &v9->super;
  }
  else
  {
    p_super = nplog_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  return v2;
}

- (void)dealloc
{
  sub_1000A6678((uint64_t)self, 1);
  v3.receiver = self;
  v3.super_class = (Class)NSPServerFlowDivert;
  [(NSPServerFlowDivert *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedNetworkTransaction, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_flowDivertControlHandle, 0);
}

@end