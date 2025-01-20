@interface SWCTrackingDomainInfo
@end

@implementation SWCTrackingDomainInfo

void __86___SWCTrackingDomainInfo__getTrackingDomainInfoWithDomains_sources_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) _trackingDomainInfoWithDomains:*(void *)(a1 + 32) sources:*(void *)(a1 + 56)];
  id v3 = (id)v2;
  if (!v2) {
    uint64_t v2 = MEMORY[0x1E4F1CC08];
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2);
}

uint64_t __78___SWCTrackingDomainInfo_getTrackingDomainInfoWithDomains_sources_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56___SWCTrackingDomainInfo_trackingDomainInfoWithDomains___block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __78___SWCTrackingDomainInfo_getTrackingDomainInfoWithDomains_sources_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65___SWCTrackingDomainInfo__trackingDomainInfoWithDomains_sources___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "_trackingDomainInfoWithDomain:JSONObject:expectedSources:");
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
}

void __41___SWCTrackingDomainInfo_Private___queue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("_SWCTrackingDomainInfo I/O queue", v2);
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v0;
}

@end