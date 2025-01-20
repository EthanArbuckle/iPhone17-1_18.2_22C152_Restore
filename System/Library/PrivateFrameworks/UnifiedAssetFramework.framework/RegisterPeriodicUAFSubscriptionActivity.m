@interface RegisterPeriodicUAFSubscriptionActivity
@end

@implementation RegisterPeriodicUAFSubscriptionActivity

void ___RegisterPeriodicUAFSubscriptionActivity_block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_object_t v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF8208]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF8298], *MEMORY[0x263EF81F0]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A0], 1);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82B8], 1);
    xpc_activity_set_criteria(activity, v3);
  }
}

void ___RegisterPeriodicUAFSubscriptionActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = a3;
  v4 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "_RegisterPeriodicUAFSubscriptionActivity_block_invoke_2";
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Allowing removal of assets", (uint8_t *)&v11, 0xCu);
  }

  v5 = +[UAFSubscriptionStoreManager writeManager];
  [v5 setSystemConfigurationForKey:@"NoRemove" withValue:@"0"];

  v6 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "_RegisterPeriodicUAFSubscriptionActivity_block_invoke";
    _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s Updating subscriptions", (uint8_t *)&v11, 0xCu);
  }

  v7 = +[UAFSubscriptionStoreManager writeManager];
  [v7 expireSubscriptions];

  v8 = +[UAFSubscriptionStoreManager writeManager];
  v9 = +[UAFConfigurationManager defaultManager];
  +[UAFAssetSetManager configureAssetDelivery:v8 configurationManager:v9];

  v10 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "_RegisterPeriodicUAFSubscriptionActivity_block_invoke";
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s XPC: Done triggering UAF subscription maintenance", (uint8_t *)&v11, 0xCu);
  }

  +[UAFInstrumentationProvider logAvailableAssetDailyStatus];
  if (v3) {
    v3[2](v3);
  }
}

@end