@interface RegisterXPCActivity
@end

@implementation RegisterXPCActivity

void ___RegisterXPCActivity_block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      if (!a1[5]) {
        goto LABEL_14;
      }
      if (!xpc_activity_set_state(v3, 4))
      {
        v5 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "_RegisterXPCActivity_block_invoke";
          _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to continue", buf, 0xCu);
        }
      }
      uint64_t v6 = a1[5];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = ___RegisterXPCActivity_block_invoke_282;
      v12[3] = &unk_264CEAB50;
      v13 = v3;
      (*(void (**)(uint64_t, _xpc_activity_s *, void *))(v6 + 16))(v6, v13, v12);
    }
  }
  else
  {
    uint64_t v7 = a1[6];
    if (v7) {
      (*(void (**)(uint64_t, _xpc_activity_s *))(v7 + 16))(v7, v3);
    }
  }
  if (xpc_activity_should_defer(v3))
  {
    BOOL v8 = xpc_activity_set_state(v3, 3);
    v9 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = @"No";
      uint64_t v11 = a1[4];
      v15 = "_RegisterXPCActivity_block_invoke";
      *(_DWORD *)buf = 136315650;
      __int16 v16 = 2112;
      if (v8) {
        v10 = @"Yes";
      }
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Deferring activity:%@ deferred:%@", buf, 0x20u);
    }
  }
LABEL_14:
}

void ___RegisterXPCActivity_block_invoke_282(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    v1 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v2 = 136315138;
      v3 = "_RegisterXPCActivity_block_invoke";
      _os_log_error_impl(&dword_23797A000, v1, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to done", (uint8_t *)&v2, 0xCu);
    }
  }
}

@end