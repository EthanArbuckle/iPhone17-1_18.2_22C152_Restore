@interface HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc
@end

@implementation HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc

void *__get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HealthKitLibrary();
  result = dlsym(v2, "_HKPrivateMetadataKeySleepAlarmUserSetBedtime");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

@end