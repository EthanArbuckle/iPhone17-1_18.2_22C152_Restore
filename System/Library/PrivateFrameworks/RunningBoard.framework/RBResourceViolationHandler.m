@interface RBResourceViolationHandler
+ (id)sharedInstance;
- (void)handleCPUViolationMessage:(uint64_t)a1 fromConnection:(void *)a2;
- (void)handleMessage:(void *)a3 fromConnection:;
- (void)startWithAssertionManager:(uint64_t)a1;
@end

@implementation RBResourceViolationHandler

+ (id)sharedInstance
{
  self;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)sharedInstance_shared;
  return v0;
}

uint64_t __44__RBResourceViolationHandler_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_alloc_init(RBResourceViolationHandler);
  return MEMORY[0x270F9A758]();
}

- (void)handleCPUViolationMessage:(uint64_t)a1 fromConnection:(void *)a2
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "pid");
    v6 = [MEMORY[0x263F64580] identifierWithPid:uint64];
    v7 = rbs_process_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = uint64;
      _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_DEFAULT, "handleCPUViolationMessage on pid:%d", (uint8_t *)v12, 8u);
    }

    if ([*(id *)(a1 + 8) invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:v6])
    {
      v8 = rbs_process_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "handleCPUViolationMessage removed assertions", (uint8_t *)v12, 2u);
      }
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      xpc_dictionary_get_remote_connection(v4);
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v10, reply);

      v11 = rbs_process_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler handleCPUViolationMessage:fromConnection:]();
      }
    }
    else
    {
      v11 = rbs_process_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler handleCPUViolationMessage:fromConnection:]();
      }
    }
  }
}

- (void)handleMessage:(void *)a3 fromConnection:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int uint64 = xpc_dictionary_get_uint64(v5, "cmd");
    if (uint64 == 1)
    {
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = __59__RBResourceViolationHandler_handleMessage_fromConnection___block_invoke;
      activity_block[3] = &unk_2647C7A08;
      activity_block[4] = a1;
      id v10 = v5;
      id v11 = v6;
      _os_activity_initiate(&dword_226AB3000, "handleCPUViolationMessage", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
    else
    {
      v8 = rbs_general_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler handleMessage:fromConnection:](uint64, v8);
      }
    }
  }
}

void __59__RBResourceViolationHandler_handleMessage_fromConnection___block_invoke(uint64_t a1)
{
}

- (void)startWithAssertionManager:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.runningboard.resourceviolationhandler", v5);
    v7 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v6;

    objc_storeStrong((id *)(a1 + 8), a2);
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)*MEMORY[0x263F646B0], *(dispatch_queue_t *)(a1 + 16), 1uLL);
    v9 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = mach_service;

    id v10 = *(_xpc_connection_s **)(a1 + 24);
    if (v10)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke;
      handler[3] = &unk_2647C7A58;
      handler[4] = a1;
      xpc_connection_set_event_handler(v10, handler);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 24));
      id v11 = rbs_general_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "Resource violation server running", v12, 2u);
      }
    }
    else
    {
      id v11 = rbs_general_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBResourceViolationHandler startWithAssertionManager:]();
      }
    }
  }
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x22A661A50]();
  if (v4 == MEMORY[0x263EF86F0])
  {
    id v7 = v3;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2;
    v8[3] = &unk_2647C7A30;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    xpc_connection_set_event_handler((xpc_connection_t)v7, v8);
    xpc_connection_resume((xpc_connection_t)v7);
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 == MEMORY[0x263EF8720])
    {
      if (v3 == (id)MEMORY[0x263EF86A8])
      {
        dispatch_queue_t v6 = rbs_general_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_1();
        }
      }
      else
      {
        if (v3 != (id)MEMORY[0x263EF86A0]) {
          goto LABEL_7;
        }
        dispatch_queue_t v6 = rbs_general_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_2();
        }
      }
    }
    else
    {
      dispatch_queue_t v6 = rbs_general_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_3(v5, v6);
      }
    }
  }
LABEL_7:
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = rbs_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "received incoming resource violation message", v8, 2u);
  }

  uint64_t v5 = MEMORY[0x22A661A50](v3);
  if (v5 == MEMORY[0x263EF8708])
  {
    -[RBResourceViolationHandler handleMessage:fromConnection:](*(void *)(a1 + 32), v3, *(void **)(a1 + 40));
  }
  else
  {
    uint64_t v6 = v5;
    if (v5 == MEMORY[0x263EF8720])
    {
      if (v3 == (id)MEMORY[0x263EF86A8])
      {
        id v7 = rbs_general_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_1();
        }
      }
      else
      {
        if (v3 != (id)MEMORY[0x263EF86A0]) {
          goto LABEL_9;
        }
        id v7 = rbs_general_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_2();
        }
      }
    }
    else
    {
      id v7 = rbs_general_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_3(v6, v7);
      }
    }
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
}

- (void)handleCPUViolationMessage:fromConnection:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "handleCPUViolationMessage - message didn't have reply context", v2, v3, v4, v5, v6);
}

- (void)handleCPUViolationMessage:fromConnection:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "handleCPUViolationMessage done", v2, v3, v4, v5, v6);
}

- (void)handleMessage:(int)a1 fromConnection:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "unrecognized command for resource violation server: %ul", (uint8_t *)v2, 8u);
}

- (void)startWithAssertionManager:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Could not start runningboard resource violation server", v2, v3, v4, v5, v6);
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "resource violation server connection invalid", v2, v3, v4, v5, v6);
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "resource violation server connection interrupted", v2, v3, v4, v5, v6);
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "server resource violation connection had unexpected type %{public}@", (uint8_t *)&v2, 0xCu);
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "resource violation client connection invalid", v2, v3, v4, v5, v6);
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "resource violation client connection interrupted", v2, v3, v4, v5, v6);
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "client resource violation connection had unexpected type %{public}@", (uint8_t *)&v2, 0xCu);
}

@end