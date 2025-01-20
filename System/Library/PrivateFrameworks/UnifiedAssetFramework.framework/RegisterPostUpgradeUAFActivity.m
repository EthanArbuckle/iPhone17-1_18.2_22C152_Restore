@interface RegisterPostUpgradeUAFActivity
@end

@implementation RegisterPostUpgradeUAFActivity

void ___RegisterPostUpgradeUAFActivity_block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_object_t v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A0], 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81A0], 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF8210]);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82C8], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8268], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82B8], 1);
    xpc_activity_set_criteria(activity, v3);
  }
}

void ___RegisterPostUpgradeUAFActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = a3;
  v4 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "_RegisterPostUpgradeUAFActivity_block_invoke_2";
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Post-Upgrade registering for startup complete notification", (uint8_t *)&v7, 0xCu);
  }

  v5 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "_RegisterPostUpgradeUAFActivity_block_invoke";
    _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s Disallowing removal of assets post-upgrade", (uint8_t *)&v7, 0xCu);
  }

  v6 = +[UAFSubscriptionStoreManager writeManager];
  [v6 setSystemConfigurationForKey:@"NoRemove" withValue:@"1"];

  if (v3) {
    v3[2](v3);
  }
}

@end