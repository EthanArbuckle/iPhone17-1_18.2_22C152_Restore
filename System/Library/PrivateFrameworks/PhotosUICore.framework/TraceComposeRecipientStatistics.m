@interface TraceComposeRecipientStatistics
@end

@implementation TraceComposeRecipientStatistics

void ___TraceComposeRecipientStatistics_block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 containsObject:v4];
  v6 = [v4 personSuggestion];

  if (v5)
  {
    uint64_t v7 = a1 + 48;
    if (v6) {
      uint64_t v7 = a1 + 40;
    }
  }
  else
  {
    if (!v6) {
      return;
    }
    uint64_t v7 = a1 + 56;
  }
  ++*(void *)(*(void *)(*(void *)v7 + 8) + 24);
}

@end