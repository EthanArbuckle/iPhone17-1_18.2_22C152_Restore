@interface SAKPerfState
- (void)nextSampleForThread:(int)a3 isOnCore:;
@end

@implementation SAKPerfState

- (void)nextSampleForThread:(int)a3 isOnCore:
{
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:a2];
    id v6 = (id)v5;
    if (a3) {
      [v4 addObject:v5];
    }
    else {
      [v4 removeObject:v5];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentSampleTimestamp, 0);
  objc_storeStrong((id *)&self->_onCoreThreads, 0);
}

@end