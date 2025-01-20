@interface NTPBNetworkEvent(FCNetworkBehaviorMonitorAdditions)
- (BOOL)isSuccess;
- (uint64_t)endTime;
- (uint64_t)pbNetworkEventType;
- (uint64_t)totalDuration;
@end

@implementation NTPBNetworkEvent(FCNetworkBehaviorMonitorAdditions)

- (uint64_t)pbNetworkEventType
{
  unsigned int v1 = [a1 type];
  if (v1 > 0x1A) {
    return 0;
  }
  else {
    return dword_1A4973948[v1];
  }
}

- (uint64_t)totalDuration
{
  uint64_t v2 = [a1 dnsDuration];
  uint64_t v3 = [a1 connectDuration] + v2;
  uint64_t v4 = [a1 requestDuration];
  return v3 + v4 + [a1 responseDuration];
}

- (uint64_t)endTime
{
  uint64_t v2 = [a1 startTime];
  return [a1 totalDuration] + v2;
}

- (BOOL)isSuccess
{
  if ([a1 errorCode]) {
    return 0;
  }
  if ([a1 httpStatusCode]
    && ((unint64_t)[a1 httpStatusCode] < 0xC8
     || (unint64_t)[a1 httpStatusCode] >= 0x12C))
  {
    return [a1 httpStatusCode] == 304;
  }
  return 1;
}

@end