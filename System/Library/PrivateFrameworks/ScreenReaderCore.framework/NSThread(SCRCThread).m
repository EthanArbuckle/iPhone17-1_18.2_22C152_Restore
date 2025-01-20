@interface NSThread(SCRCThread)
- (uint64_t)shouldStop;
- (void)registerForStopNotification;
- (void)unregisterForStopNotification;
@end

@implementation NSThread(SCRCThread)

- (void)registerForStopNotification
{
  v1 = [a1 threadDictionary];
  if (v1)
  {
    id v3 = v1;
    v2 = [v1 objectForKeyedSubscript:@"SCRCThreadKey"];
    if (v2)
    {
      [(id)_RegistryLock lock];
      [(id)_StoppableThreads addObject:v2];
      [(id)_RegistryLock unlock];
    }

    v1 = v3;
  }
}

- (void)unregisterForStopNotification
{
  v1 = [a1 threadDictionary];
  if (v1)
  {
    id v3 = v1;
    v2 = [v1 objectForKeyedSubscript:@"SCRCThreadKey"];
    if (v2)
    {
      [(id)_RegistryLock lock];
      [(id)_StoppableThreads removeObject:v2];
      [(id)_RegistryLock unlock];
    }

    v1 = v3;
  }
}

- (uint64_t)shouldStop
{
  v1 = [a1 threadDictionary];
  v2 = v1;
  if (v1)
  {
    id v3 = [v1 objectForKeyedSubscript:@"SCRCThreadKey"];
    uint64_t v4 = [v3 _shouldStop];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end