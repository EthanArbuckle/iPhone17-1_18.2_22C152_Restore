@interface CWFAutoJoinStatus(Dictionary)
- (id)dictionary;
@end

@implementation CWFAutoJoinStatus(Dictionary)

- (id)dictionary
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  v4 = [a1 UUID];
  v5 = [v4 UUIDString];
  [v2 setObject:v5 forKeyedSubscript:@"wifi_uuid"];

  v6 = [a1 interfaceName];
  [v2 setObject:v6 forKeyedSubscript:@"wifi_interface_name"];

  v7 = [a1 startedAt];
  v8 = [v3 stringFromDate:v7];
  [v2 setObject:v8 forKeyedSubscript:@"wifi_auto_join_started_at"];

  v9 = [a1 endedAt];
  v10 = [v3 stringFromDate:v9];
  [v2 setObject:v10 forKeyedSubscript:@"wifi_auto_join_ended_at"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "result"));
  [v2 setObject:v11 forKeyedSubscript:@"wifi_auto_join_result"];

  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "trigger"));
  [v2 setObject:v12 forKeyedSubscript:@"wifi_auto_join_trigger"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "state"));
  [v2 setObject:v13 forKeyedSubscript:@"wifi_auto_join_state"];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v15 = objc_msgSend(a1, "joinAttempts", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionary];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  [v2 setObject:v14 forKeyedSubscript:@"wifi_join_attempts"];
  v21 = [NSDictionary dictionaryWithDictionary:v2];

  return v21;
}

@end