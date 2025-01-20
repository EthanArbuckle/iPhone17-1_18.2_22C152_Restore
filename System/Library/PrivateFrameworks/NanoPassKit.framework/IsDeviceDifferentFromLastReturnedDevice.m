@interface IsDeviceDifferentFromLastReturnedDevice
@end

@implementation IsDeviceDifferentFromLastReturnedDevice

void ____IsDeviceDifferentFromLastReturnedDevice_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.NanoPassKit.LastReturnedDevice", 0);
  v1 = (void *)__LastReturnedDeviceQueue;
  __LastReturnedDeviceQueue = (uint64_t)v0;
}

void ____IsDeviceDifferentFromLastReturnedDevice_block_invoke_2(uint64_t a1)
{
  id obj = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F57620]];
  if ((objc_msgSend((id)__LastReturnedDevicePairingID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&__LastReturnedDevicePairingID, obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end