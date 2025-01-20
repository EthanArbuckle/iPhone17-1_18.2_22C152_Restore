uint64_t start()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  void block[4];
  id v7;

  v1 = dispatch_get_global_queue(0, 0);
  signal(15, (void (__cdecl *)(int))1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000038A4;
  block[3] = &unk_100004138;
  v7 = v1;
  v2 = qword_100008028;
  v3 = v1;
  if (v2 != -1) {
    dispatch_once(&qword_100008028, block);
  }

  v4 = BLTWorkQueue();
  dispatch_async(v4, &stru_1000040F0);

  CFRunLoopRun();
  return 0;
}

void sub_10000381C(id a1)
{
  uint64_t v1 = +[BLTBulletinDistributor sharedDistributor];
  v2 = (void *)qword_100008018;
  qword_100008018 = v1;

  id v4 = +[BLTTestServiceServer sharedTestServer];
  [v4 resume];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, BLTDaemonRestartedNotification, 0, 0, 1u);
}

void sub_1000038A4(uint64_t a1)
{
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *(dispatch_queue_t *)(a1 + 32));
  v2 = (void *)qword_100008020;
  qword_100008020 = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100008020, &stru_100004110);
  v3 = qword_100008020;

  dispatch_activate(v3);
}

void sub_10000390C(id a1)
{
}

uint64_t BLTWorkQueue()
{
  return _BLTWorkQueue();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRunLoopRun(void)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedDistributor(void *a1, const char *a2, ...)
{
  return [a1 sharedDistributor];
}

id objc_msgSend_sharedTestServer(void *a1, const char *a2, ...)
{
  return [a1 sharedTestServer];
}