@interface SSLockdown
+ (id)sharedInstance;
- (__CFString)copyDeviceGUID;
@end

@implementation SSLockdown

id __28__SSLockdown_sharedInstance__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  sharedInstance_sSharedInstance = (uint64_t)result;
  return result;
}

- (__CFString)copyDeviceGUID
{
  v2 = (void *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFStringGetTypeID())
  {
    if (SSDeviceIsAppleTV()) {
      v5 = (const void *)[v3 uppercaseString];
    }
    else {
      v5 = v3;
    }
    v6 = (__CFString *)CFRetain(v5);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SSLockdown_sharedInstance__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = a1;
  if (sharedInstance_sInstanceGuard != -1) {
    dispatch_once(&sharedInstance_sInstanceGuard, block);
  }
  return (id)sharedInstance_sSharedInstance;
}

@end