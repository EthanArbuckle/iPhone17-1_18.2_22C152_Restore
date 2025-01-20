@interface RegisterOnBootUAFActivity
@end

@implementation RegisterOnBootUAFActivity

void ___RegisterOnBootUAFActivity_block_invoke(uint64_t a1, void *a2)
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
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82C8], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82B8], 1);
    xpc_activity_set_criteria(activity, v3);
  }
}

void ___RegisterOnBootUAFActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  xpc_object_t v3 = +[UAFSubscriptionStoreManager writeManager];
  v4 = +[UAFConfigurationManager defaultManager];
  +[UAFAssetSetManager configureAssetDelivery:v3 configurationManager:v4 lockIfUnchanged:0];

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

@end