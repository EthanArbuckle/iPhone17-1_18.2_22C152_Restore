@interface CKKSActualLockStateProvider
- (BOOL)queryAKSLocked;
- (CKKSActualLockStateProvider)init;
@end

@implementation CKKSActualLockStateProvider

- (BOOL)queryAKSLocked
{
  CFTypeRef cf = 0;
  *(_DWORD *)buf = -1431655766;
  uint64_t v2 = sub_10001AE90(dword_10035D2B0, buf);
  if (sub_100029664(v2, &cf, @"aks_get_lock_state failed: %x", v2)) {
    return buf[0] & 1;
  }
  v3 = sub_1000CD884(@"ckks", 0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFTypeRef v8 = cf;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "error querying lock state: %@", buf, 0xCu);
  }

  CFTypeRef v4 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v4);
  }
  return 1;
}

- (CKKSActualLockStateProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKKSActualLockStateProvider;
  return [(CKKSActualLockStateProvider *)&v3 init];
}

@end