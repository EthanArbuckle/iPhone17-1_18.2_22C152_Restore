@interface PCSIsMultiDevice
@end

@implementation PCSIsMultiDevice

void ___PCSIsMultiDevice_block_invoke(uint64_t a1)
{
  v2 = (void *)MKBUserTypeDeviceMode();
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
  if ([v3 isEqualToString:*MEMORY[0x1E4F78110]])
  {
    uint64_t v4 = 1;
    _PCSIsMultiDevice_deviceModeIsMultiUser = 1;
  }
  else
  {
    uint64_t v4 = _PCSIsMultiDevice_deviceModeIsMultiUser;
  }
  PCSMigrationLog(*(void *)(a1 + 32), @"multiuser device: %d", v4, 0);
}

@end