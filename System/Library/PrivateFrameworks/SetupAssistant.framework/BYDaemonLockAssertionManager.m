@interface BYDaemonLockAssertionManager
- (id)acquireLockAssertionWithOptions:(id)a3 purpose:(id)a4;
@end

@implementation BYDaemonLockAssertionManager

- (id)acquireLockAssertionWithOptions:(id)a3 purpose:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFTypeRef cf = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v7 = (uint64_t (*)(id, CFTypeRef *))off_100024D68;
  v20 = off_100024D68;
  if (!off_100024D68)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10000A0FC;
    v22 = &unk_10001C560;
    v23 = &v17;
    sub_10000A0FC((uint64_t)buf);
    v7 = (uint64_t (*)(id, CFTypeRef *))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v7)
  {
    sub_10001050C();
    __break(1u);
  }
  v8 = (void *)v7(v5, &cf);
  v9 = _BYLoggingFacility();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Acquired device lock assertion for purpose '%{public}@'", buf, 0xCu);
    }

    v11 = [[BYDaemonLockAssertionWrapper alloc] initWithAssertionRef:v8 purpose:v6];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v13 = _BYIsInternalInstall();
      v14 = (void *)cf;
      if ((v13 & 1) == 0 && cf)
      {
        v8 = [(id)cf domain];
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v8, [(id)cf code]);
        int v15 = 1;
      }
      else
      {
        int v15 = 0;
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to acquire device lock assertion for purpose '%{public}@' - %{public}@", buf, 0x16u);
      if (v15)
      {
      }
    }

    if (cf) {
      CFRelease(cf);
    }
    v11 = 0;
  }

  return v11;
}

@end