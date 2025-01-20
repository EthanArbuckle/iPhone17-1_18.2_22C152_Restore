@interface ScheduledActivityGetRegistration
@end

@implementation ScheduledActivityGetRegistration

void ___ScheduledActivityGetRegistration_block_invoke(void *a1)
{
  v2 = _RegisteredClients();
  id v7 = [v2 objectForKeyedSubscript:a1[4]];

  v3 = [v7 activityRegistrations];
  uint64_t v4 = [v3 objectForKeyedSubscript:a1[5]];
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end