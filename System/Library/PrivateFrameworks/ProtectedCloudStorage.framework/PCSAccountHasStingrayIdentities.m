@interface PCSAccountHasStingrayIdentities
@end

@implementation PCSAccountHasStingrayIdentities

intptr_t ____PCSAccountHasStingrayIdentities_block_invoke(uint64_t a1, CFDictionaryRef theDict, uint64_t a3)
{
  if (a3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  if (theDict)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, kPCSSecureBackupCFContainsiCloudIdentityKey[0]);
    if (Value)
    {
      CFBooleanRef v6 = Value;
      CFTypeID v7 = CFGetTypeID(Value);
      if (v7 == CFBooleanGetTypeID())
      {
        BOOL v8 = CFBooleanGetValue(v6) == 0;
      }
      else
      {
        CFTypeID v9 = CFGetTypeID(v6);
        if (v9 != CFNumberGetTypeID()) {
          return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
        }
        int valuePtr = 0;
        if (!CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr)) {
          return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
        }
        BOOL v8 = valuePtr == 0;
      }
      char v10 = !v8;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end