@interface WiFiCloudSyncEngineCheckWaitingForPasswordList
@end

@implementation WiFiCloudSyncEngineCheckWaitingForPasswordList

uint64_t ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke(uint64_t a1)
{
  return __WiFiCloudSyncEngineCheckWaitingForPasswordList(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2(uint64_t a1)
{
  return __WiFiCloudSyncEngineCheckWaitingForPasswordList(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

const void *____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_51(uint64_t a1)
{
  result = *(const void **)(*(void *)(a1 + 40) + 248);
  if (result)
  {
    CFRelease(result);
    *(void *)(*(void *)(a1 + 40) + 248) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    return (const void *)__WiFiCloudSyncEngineCheckWaitingForPasswordList(v3, v4);
  }
  return result;
}

NSObject *____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2_53(uint64_t a1)
{
  result = *(NSObject **)(*(void *)(a1 + 40) + 256);
  if (result)
  {
    dispatch_release(result);
    uint64_t v3 = *(void *)(a1 + 40);
    *(void *)(v3 + 256) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    return __WiFiCloudSyncEngineCheckWaitingForPasswordList(v3, v4);
  }
  return result;
}

@end