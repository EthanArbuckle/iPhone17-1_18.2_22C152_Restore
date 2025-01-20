void init_gestalt_plugin()
{
  xpc_event_provider_create();
}

void sub_353C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (qword_42E0 != -1) {
    dispatch_once(&qword_42E0, &stru_4148);
  }
  if (a1 == 2)
  {
    v10 = (void *)qword_42D8;
    v11 = +[NSNumber numberWithUnsignedLongLong:a2];
    v7 = [v10 objectForKeyedSubscript:v11];

    if (v7)
    {
      [v7 pointerValue];
      MGCancelNotifications();
      v12 = (void *)qword_42D8;
      v13 = +[NSNumber numberWithUnsignedLongLong:a2];
      [v12 removeObjectForKey:v13];
    }
    goto LABEL_21;
  }
  if (a1 == 1)
  {
    v6 = xpc_dictionary_get_value(v5, "Queries");
    v7 = v6;
    if (!v6)
    {
      v16 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m", 47);
      if (v16) {
        v17 = v16 + 1;
      }
      else {
        v17 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
      }
      NSLog(&cfstr_SDNoQueriesSpe.isa, v17, 16);
      goto LABEL_21;
    }
    if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_array)
    {
      v8 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m", 47);
      if (v8) {
        v9 = v8 + 1;
      }
      else {
        v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
      }
      NSLog(&cfstr_SDQueriesValue.isa, v9, 21);
LABEL_21:

      goto LABEL_22;
    }
    v18 = +[NSMutableSet set];
    size_t count = xpc_array_get_count(v7);
    if (count)
    {
      size_t v20 = count;
      for (size_t i = 0; i != v20; ++i)
      {
        string = xpc_array_get_string(v7, i);
        if (string)
        {
          v23 = +[NSString stringWithUTF8String:string];
          [v18 addObject:v23];
        }
        else
        {
          v24 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m", 47);
          if (v24) {
            v25 = v24 + 1;
          }
          else {
            v25 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
          }
          NSLog(&cfstr_SDIllegalQuery.isa, v25, 30, i);
        }
      }
    }
    v26 = [v18 allObjects];

    if (v26)
    {
      v27 = dispatch_get_global_queue(0, 0);
      uint64_t v28 = MGRegisterForBulkUpdates();

      if (v28 == -1)
      {
        v32 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m", 47);
        if (v32) {
          v33 = v32 + 1;
        }
        else {
          v33 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
        }
        NSLog(&cfstr_SDMgregisterfo.isa, v33, 66);
      }
      else
      {
        v29 = +[NSValue valueWithPointer:v28];
        v30 = (void *)qword_42D8;
        v31 = +[NSNumber numberWithUnsignedLongLong:a2];
        [v30 setObject:v29 forKeyedSubscript:v31];
      }
    }
  }
  else
  {
    v14 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m", 47);
    if (v14) {
      v15 = v14 + 1;
    }
    else {
      v15 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltEvents/MobileGestaltEvents.m";
    }
    NSLog(&cfstr_SDUnknownActio.isa, v15, 85, a1);
  }
LABEL_22:
}

uint64_t sub_38E0()
{
  return notify_post("com.apple.MobileGestalt.LocaleChanged");
}

void sub_38EC(id a1)
{
  qword_42D8 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

void sub_3928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[NSMutableDictionary dictionary];
  if (a2) {
    [v5 setObject:a2 forKeyedSubscript:@"ChangedQuestions"];
  }
  if (a3) {
    [v5 setObject:a3 forKeyedSubscript:@"AdditionalInfo"];
  }
  _CFXPCCreateXPCObjectFromCFObject();
  xpc_event_provider_token_fire();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

uint64_t MGCancelNotifications()
{
  return _MGCancelNotifications();
}

uint64_t MGRegisterForBulkUpdates()
{
  return _MGRegisterForBulkUpdates();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

char *__cdecl rindex(const char *a1, int a2)
{
  return _rindex(a1, a2);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}