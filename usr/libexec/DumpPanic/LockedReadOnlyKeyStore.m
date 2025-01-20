@interface LockedReadOnlyKeyStore
- (BOOL)unlock;
@end

@implementation LockedReadOnlyKeyStore

- (BOOL)unlock
{
  if (!&_MKBDeviceUnlockedSinceBoot)
  {
LABEL_2:
    v10.receiver = self;
    v10.super_class = (Class)LockedReadOnlyKeyStore;
    LOBYTE(v3) = [(ReadOnlyKeyStore *)&v10 unlock];
    return v3;
  }
  int v4 = MKBDeviceUnlockedSinceBoot();
  if (v4 < 0)
  {
    v8 = qword_10003A5D8;
    BOOL v3 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to get device lock state", buf, 2u);
  }
  else
  {
    int v5 = v4;
    v6 = qword_10003A5D8;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
    if (v5 == 1)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device already after first unlock", buf, 2u);
      }
      goto LABEL_2;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock ...", buf, 2u);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_10003A538, 0xFFFFFFFFFFFFFFFFLL);
    if (MKBDeviceUnlockedSinceBoot() == 1) {
      goto LABEL_2;
    }
  }
  LOBYTE(v3) = 0;
  return v3;
}

@end