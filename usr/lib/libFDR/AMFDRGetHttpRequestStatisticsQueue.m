@interface AMFDRGetHttpRequestStatisticsQueue
@end

@implementation AMFDRGetHttpRequestStatisticsQueue

dispatch_queue_t ___AMFDRGetHttpRequestStatisticsQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.libFDR.httpRequestStatistic", 0);
  _AMFDRGetHttpRequestStatisticsQueue_queue = (uint64_t)result;
  return result;
}

@end