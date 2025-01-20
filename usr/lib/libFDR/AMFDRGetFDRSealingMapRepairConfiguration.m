@interface AMFDRGetFDRSealingMapRepairConfiguration
@end

@implementation AMFDRGetFDRSealingMapRepairConfiguration

void ___AMFDRGetFDRSealingMapRepairConfiguration_block_invoke()
{
  if (!fileSystemSealingMapRepairConfiguration)
  {
    CFURLRef v0 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], @"/System/Library/FDR/FDRSealingMapRepairConfiguration.plist", kCFURLPOSIXPathStyle, 0);
    if (v0)
    {
      CFURLRef v1 = v0;
      CFTypeID v2 = CFGetTypeID(v0);
      if (v2 == CFURLGetTypeID()) {
        AMSupportCreateDictionaryFromFileURL();
      }
      AMSupportLogInternal();
      CFRelease(v1);
    }
    else
    {
      AMSupportLogInternal();
    }
    fileSystemSealingMapRepairConfiguration = 0;
  }
}

@end