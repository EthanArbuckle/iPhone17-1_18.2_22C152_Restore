@interface HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc
@end

@implementation HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc

void *__get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HealthKitLibrary();
  result = dlsym(v2, "_HKPrivateMetadataKeySleepAlarmUserWakeTime");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

@end