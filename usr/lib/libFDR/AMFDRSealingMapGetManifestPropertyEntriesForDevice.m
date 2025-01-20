@interface AMFDRSealingMapGetManifestPropertyEntriesForDevice
@end

@implementation AMFDRSealingMapGetManifestPropertyEntriesForDevice

uint64_t ___AMFDRSealingMapGetManifestPropertyEntriesForDevice_block_invoke(uint64_t a1)
{
  v1 = (const void *)copyProductType(*(void *)(a1 + 32));
  if (v1)
  {
    _AMFDRSealingMapGetManifestPropertyEntriesForDevice_deviceManifestProperties = (uint64_t)_AMFDRSealingMapGetManifestPropertiesEntries(v1);
    if (!_AMFDRSealingMapGetManifestPropertyEntriesForDevice_deviceManifestProperties) {
      _AMFDRSealingMapGetManifestPropertyEntriesForDevice_deviceManifestProperties = (uint64_t)_AMFDRSealingMapGetManifestPropertiesEntries(@"iRefDefault");
    }
  }
  else
  {
    AMSupportLogInternal();
  }

  return AMSupportSafeRelease();
}

@end