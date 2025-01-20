@interface MDPerf
@end

@implementation MDPerf

os_log_t ___MDPerf_QueryLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.spotlight.performance", "query");
  _MDPerf_QueryLog_sQueryLog = (uint64_t)result;
  return result;
}

os_log_t ___MDPerf_LifeCycleLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.spotlight.performance", "index_lifecycle");
  _MDPerf_LifeCycleLog_sIndexLifeCycle = (uint64_t)result;
  return result;
}

os_log_t ___MDPerf_IndexingLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.spotlight.performance", "indexing");
  _MDPerf_IndexingLog_sIndexingLog = (uint64_t)result;
  return result;
}

os_log_t ___MDPerf_SignpostLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.spotlight.performance", "singposts");
  _MDPerf_SignpostLog_sIndexingLog = (uint64_t)result;
  return result;
}

@end