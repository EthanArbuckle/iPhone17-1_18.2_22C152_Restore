void start()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  signal(15, (void (__cdecl *)(int))1);
  v0 = dispatch_get_global_queue(21, 0);
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);
  dispatch_source_set_event_handler(v1, &stru_100004110);
  dispatch_activate(v1);
  v3 = +[NSString stringWithFormat:@"adprivacyd launched"];
  _ADLog();

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v4 = +[NSString stringWithFormat:@"ERROR: Unable to set the temp directory. Please file a radar..."];
    _ADLog();
  }
  v5 = +[APOdmlDatabaseConfiguration sharedInstance];
  [v5 setProcessToDaemon];

  if (MKBDeviceUnlockedSinceBoot())
  {
    v6 = +[APOdmlStoreServerContainer sharedInstance];
    [v6 startListening];
  }
  v7 = +[ADAttributionService sharedInstance];
  v8 = +[ADAdTrackingSchedulingManager sharedInstance];
  if (MGGetBoolAnswer())
  {
    v9 = +[ADCoreDefaults sharedInstance];
    v10 = [v9 BOOLForKey:@"ResetiAdIDs"];

    if (v10)
    {
      v11 = +[ADIDManager sharedInstance];
      [v11 clearDSIDRecords];

      v12 = +[ADCoreDefaults sharedInstance];
      [v12 setBool:0 forKey:@"ResetiAdIDs"];

      v13 = +[NSString stringWithFormat:@"Reset all iAd ID records."];
      _ADLog();
    }
  }
  v14 = +[ADIDManager sharedInstance];
  v15 = [v14 activeDSIDRecord];

  if (!v15)
  {
    v16 = +[ADIDManager sharedInstance];
    v17 = +[ADCoreSettings sharedInstance];
    v18 = [v17 iTunesAccountDSID];
    [v16 setDSID:v18 completionHandler:&stru_100004130];
  }
  v19 = +[NSString stringWithFormat:@"adprivacyd starting"];
  _ADLog();

  dispatch_main();
}

void sub_1000034A0(id a1)
{
}

void sub_1000034B4(id a1)
{
  v1 = +[ADIDManager sharedInstance];
  id v7 = [v1 activeDSIDRecord];

  if (v7)
  {
    v2 = [v7 DSID];
    v3 = +[NSString stringWithFormat:@"Set DSID to %@", v2];
    _ADLog();

    v4 = +[ADIDManager sharedInstance];
    v5 = [v4 activeDSIDRecord];
    +[NSString stringWithFormat:@"%@", v5];
  }
  else
  {
    v4 = +[ADCoreSettings sharedInstance];
    v5 = [v4 iTunesAccountDSID];
    +[NSString stringWithFormat:@"Unable to set DSID to %@", v5];
  v6 = };
  _ADLog();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t _ADLog()
{
  return __ADLog();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_activeDSIDRecord(void *a1, const char *a2, ...)
{
  return [a1 activeDSIDRecord];
}

id objc_msgSend_clearDSIDRecords(void *a1, const char *a2, ...)
{
  return [a1 clearDSIDRecords];
}

id objc_msgSend_iTunesAccountDSID(void *a1, const char *a2, ...)
{
  return [a1 iTunesAccountDSID];
}

id objc_msgSend_setProcessToDaemon(void *a1, const char *a2, ...)
{
  return [a1 setProcessToDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}