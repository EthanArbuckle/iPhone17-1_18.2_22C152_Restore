@interface NSUserDefaults(RTUserDefaults)
- (CFArrayRef)rt_copyKeyListForDomain:()RTUserDefaults;
- (id)rt_objectForKey:()RTUserDefaults domain:;
- (uint64_t)rt_synchronize;
- (uint64_t)rt_synchronizeDomain:()RTUserDefaults;
- (void)rt_refreshDomain:()RTUserDefaults;
- (void)rt_setObject:()RTUserDefaults forKey:domain:;
@end

@implementation NSUserDefaults(RTUserDefaults)

- (uint64_t)rt_synchronize
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
}

- (void)rt_refreshDomain:()RTUserDefaults
{
  v3 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  applicationID = a3;
  CFPreferencesSetValue(@"RTDefaultsManagerForceRefresh", v3, applicationID, v4, v5);
  CFPreferencesSetValue(@"RTDefaultsManagerForceRefresh", 0, applicationID, v4, v5);
}

- (id)rt_objectForKey:()RTUserDefaults domain:
{
  CFStringRef v4 = (void *)CFPreferencesCopyAppValue(key, applicationID);

  return v4;
}

- (void)rt_setObject:()RTUserDefaults forKey:domain:
{
}

- (CFArrayRef)rt_copyKeyListForDomain:()RTUserDefaults
{
  CFArrayRef v3 = CFPreferencesCopyKeyList(applicationID, (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);

  return v3;
}

- (uint64_t)rt_synchronizeDomain:()RTUserDefaults
{
  return CFPreferencesAppSynchronize(applicationID);
}

@end