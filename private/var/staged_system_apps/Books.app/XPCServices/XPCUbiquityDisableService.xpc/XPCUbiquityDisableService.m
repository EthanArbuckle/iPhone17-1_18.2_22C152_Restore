int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id BKDisableiCloudServiceLog()
{
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_100004128);
  }
  v0 = (void *)qword_100008790;

  return v0;
}

void sub_100002EE4(id a1)
{
  qword_100008790 = (uint64_t)os_log_create("com.apple.iBooks", "DisableiCloudService");

  _objc_release_x1();
}

void sub_100003468(char a1, uint64_t a2, os_log_t log)
{
  CFStringRef v3 = @"YES";
  if ((a1 & 1) == 0) {
    CFStringRef v3 = @"NO";
  }
  int v4 = 138412546;
  CFStringRef v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set iCloud enabled to %@ for %{public}@.", (uint8_t *)&v4, 0x16u);
}

void sub_100003508(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_isServiceDisabled(%{public}@): TCC returned a NULL array!", (uint8_t *)&v2, 0xCu);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return _TCCAccessCopyBundleIdentifiersDisabledForService();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return _TCCAccessCopyBundleIdentifiersForService();
}

uint64_t TCCAccessSetForBundleId()
{
  return _TCCAccessSetForBundleId();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}
)
      goto LABEL_7;
  }
}

- (BOOL)_isBundleIdentifierInArray:(__CFArray *)a3
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count)
  {
    unint64_t v5 = Count;
    CFIndex v6 = 0;
    BOOL v7 = 1;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, v6);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID()
        && CFEqual(ValueAtIndex, @"com.apple.iBooks"))
      {
        break;
      }
      BOOL v7 = ++v6 < v5;
    }
    while (v5 != v6);
  }
  else
  {
    return 0;
  }
  return v7;
}

- (BOOL)_isServiceEnabledAlternative:(__CFString *)a3
{
  uint64_t v5 = TCCAccessCopyBundleIdentifiersForService();
  if (v5)
  {
    CFIndex v6 = (const void *)v5;
    BOOL v7 = [(XPCUbiquityDisableService *)self _isBundleIdentifierInArray:v5];
    CFRelease(v6);
    return v7;
  }
  else
  {
    CFTypeID v9 = BKDisableiCloudServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100003508((uint64_t)a3, v9);
    }

    return 0;
  }
}

- (BOOL)_isServiceDisabledAlternative:(__CFString *)a3
{
  uint64_t v5 = TCCAccessCopyBundleIdentifiersDisabledForService();
  if (v5)
  {
    CFIndex v6 = (const void *)v5;
    BOOL v7 = [(XPCUbiquityDisableService *)self _isBundleIdentifierInArray:v5];
    CFRelease(v6);
    return v7;
  }
  else
  {
    CFTypeID v9 = BKDisableiCloudServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100003508((uint64_t)a3, v9);
    }

    return 1;
  }
}

@end