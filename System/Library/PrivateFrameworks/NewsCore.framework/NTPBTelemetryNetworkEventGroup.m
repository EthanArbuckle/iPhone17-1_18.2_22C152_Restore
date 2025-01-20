@interface NTPBTelemetryNetworkEventGroup
@end

@implementation NTPBTelemetryNetworkEventGroup

uint64_t __87__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__totalDurationStats__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = a2;
  uint64_t v4 = [v3 connectDuration];
  uint64_t v5 = [v3 dnsDuration] + v4;
  uint64_t v6 = [v3 requestDuration];
  uint64_t v7 = [v3 dnsDuration];

  return [v2 numberWithLongLong:v5 + v6 + v7];
}

uint64_t __85__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__dnsDurationStats__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 dnsDuration];
  return [v2 numberWithLongLong:v3];
}

uint64_t __89__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__connectDurationStats__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 connectDuration];
  return [v2 numberWithLongLong:v3];
}

uint64_t __89__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__timeToFirstByteStats__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = a2;
  uint64_t v4 = [v3 dnsDuration];
  uint64_t v5 = [v3 connectDuration] + v4;
  uint64_t v6 = [v3 requestDuration];

  return [v2 numberWithLongLong:v5 + v6];
}

BOOL __82__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__cacheHitCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cacheState] == 1;
}

BOOL __83__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__cacheMissCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cacheState] == 2;
}

@end