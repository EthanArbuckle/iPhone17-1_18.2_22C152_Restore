@interface TVRCRMSDeviceManager
@end

@implementation TVRCRMSDeviceManager

uint64_t __39___TVRCRMSDeviceManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_3 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

void __58___TVRCRMSDeviceManager__addOrUpdateRecordInUserDefaults___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"networkName"];
  [v4 setObject:*(void *)(a1 + 32) forKey:v5];
}

uint64_t __70___TVRCRMSDeviceManager__removeRecordWithNetworkNameFromUserDefaults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

@end