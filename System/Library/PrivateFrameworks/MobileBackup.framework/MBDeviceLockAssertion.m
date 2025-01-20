@interface MBDeviceLockAssertion
- (BOOL)holdWithError:(id *)a3;
- (void)_drop;
- (void)dealloc;
- (void)drop;
@end

@implementation MBDeviceLockAssertion

- (void)dealloc
{
  [(MBDeviceLockAssertion *)self _drop];
  v3.receiver = self;
  v3.super_class = (Class)MBDeviceLockAssertion;
  [(MBDeviceLockAssertion *)&v3 dealloc];
}

- (BOOL)holdWithError:(id *)a3
{
  int v5 = MKBDeviceUnlockedSinceBoot();
  int v6 = MKBGetDeviceLockState();
  v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v17[0]) = v5;
    WORD2(v17[0]) = 1024;
    *(_DWORD *)((char *)v17 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MKBDeviceUnlockedSinceBoot=%d, MKBGetDeviceLockState=%d", buf, 0xEu);
    _MBLog();
  }

  CFStringRef v14 = @"MKBAssertionKey";
  CFStringRef v15 = @"RestoreFromBackup";
  v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v9 = (__MKBAssertion *)MKBDeviceLockAssertion();
  if (v9)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Acquired the device lock assertion (%p)", buf, 0xCu);
      _MBLog();
    }

    self->_assertion = v9;
  }
  else
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to acquire the device lock assertion: %@", buf, 0xCu);
      _MBLog();
    }

    v12 = +[MBError errorWithCode:208 error:0 format:@"Failed to acquire the device lock assertion"];

    if (a3) {
      *a3 = v12;
    }
  }
  return v9 != 0;
}

- (void)_drop
{
  assertion = self->_assertion;
  if (assertion)
  {
    self->_assertion = 0;
    objc_super v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v5 = assertion;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing the device lock assertion (%p)", buf, 0xCu);
      _MBLog();
    }

    CFRelease(assertion);
  }
}

- (void)drop
{
  obj = self;
  objc_sync_enter(obj);
  [(MBDeviceLockAssertion *)obj _drop];
  objc_sync_exit(obj);
}

@end