@interface OS_xpc_remote_listener
- (void)dealloc;
@end

@implementation OS_xpc_remote_listener

- (void)dealloc
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  v2 = (const void *)_os_crash_msg();
  __break(1u);
  _Block_object_dispose(v2, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->cancel_handler, 0);
  objc_storeStrong(&self->accept_handler, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end