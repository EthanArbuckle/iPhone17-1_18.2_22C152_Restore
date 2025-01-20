@interface TelephonyUSBInterfaceRegistrationUnregisterForInterfacesInternal
@end

@implementation TelephonyUSBInterfaceRegistrationUnregisterForInterfacesInternal

void ___TelephonyUSBInterfaceRegistrationUnregisterForInterfacesInternal_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (const void *)v2[1];
  if (v3)
  {
    if (*v2)
    {
      _TelephonyUtilDebugPrint();
      CFRunLoopRemoveSource(**(CFRunLoopRef **)(a1 + 32), *(CFRunLoopSourceRef *)(*(void *)(a1 + 32) + 8), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      v3 = *(const void **)(*(void *)(a1 + 32) + 8);
    }
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
    v2 = *(void **)(a1 + 32);
  }
  v4 = (IONotificationPort *)v2[2];
  if (v4)
  {
    IONotificationPortDestroy(v4);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
  }
}

@end