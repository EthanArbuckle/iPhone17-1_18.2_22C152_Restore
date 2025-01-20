@interface GetFairPlayContext
@end

@implementation GetFairPlayContext

void ____GetFairPlayContext_block_invoke()
{
  id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", CPSharedResourcesDirectory(), @"Media", @"iTunes_Control", @"iTunes", 0);
  uint64_t v0 = objc_msgSend(NSString, "pathWithComponents:");
  v1 = (void *)__GetFairPlayContext_sFolderPath;
  __GetFairPlayContext_sFolderPath = v0;

  uint64_t v2 = MGCopyAnswer();
  if (v2)
  {
    CFStringRef v3 = (const __CFString *)v2;
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v3, SystemEncoding, 0);
    if (ExternalRepresentation)
    {
      CFDataRef v6 = ExternalRepresentation;
      BytePtr = CFDataGetBytePtr(ExternalRepresentation);
      CFIndex Length = CFDataGetLength(v6);
      zxcm2Qme0x((uint64_t)BytePtr, Length, (uint64_t)&__GetFairPlayContext_sHardwareInfo);
      CFRelease(v6);
    }
    else
    {
      zxcm2Qme0x(0, 0, (uint64_t)&__GetFairPlayContext_sHardwareInfo);
    }
    CFRelease(v3);
  }
}

@end