@interface PDScheduledActivityRegister
@end

@implementation PDScheduledActivityRegister

void ___PDScheduledActivityRegister_block_invoke(uint64_t a1)
{
  v2 = _RegisteredClients();
  id v7 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  v3 = [v7 activityRegistrations];
  v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  v5 = [[PDScheduledActivityRegistration alloc] initWithActivityCriteria:*(void *)(a1 + 48) activityContext:*(void *)(a1 + 56)];
  if (([v4 isEqual:v5] & 1) == 0)
  {
    v6 = [v7 activityRegistrations];
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    _RegisterXPCActivity(*(void **)(a1 + 32), *(void **)(a1 + 40));
    _ArchiveRegisteredClients();
  }
}

@end