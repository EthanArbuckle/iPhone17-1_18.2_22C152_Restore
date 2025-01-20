@interface RBSResourceViolationHandler
+ (void)notifyCPUViolation:(int)a3;
@end

@implementation RBSResourceViolationHandler

+ (void)notifyCPUViolation:(int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  mach_service = xpc_connection_create_mach_service("com.apple.runningboard.resource_notify", 0, 2uLL);
  if (mach_service)
  {
    v5 = rbs_process_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a3;
      _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_DEFAULT, "Notified CPU resource violation on pid:%d", (uint8_t *)v9, 8u);
    }

    xpc_connection_set_event_handler(mach_service, &__block_literal_global_13);
    xpc_connection_resume(mach_service);
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "cmd", 1uLL);
    xpc_dictionary_set_uint64(v6, "pid", a3);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
    if (!v7)
    {
      v8 = rbs_general_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[RBSResourceViolationHandler notifyCPUViolation:](v8);
      }
    }
  }
  else
  {
    v6 = rbs_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[RBSResourceViolationHandler notifyCPUViolation:](v6);
    }
  }
}

+ (void)notifyCPUViolation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "Could not connect to runningboard resource violation server", v1, 2u);
}

+ (void)notifyCPUViolation:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "received nil reply from resource violation server", v1, 2u);
}

@end