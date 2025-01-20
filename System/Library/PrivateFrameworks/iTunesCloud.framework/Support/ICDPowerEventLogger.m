@interface ICDPowerEventLogger
+ (void)logEvent:(id)a3 payload:(id)a4;
@end

@implementation ICDPowerEventLogger

+ (void)logEvent:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v7 = (unsigned int (*)(uint64_t, id))off_1001F3750;
    v22 = off_1001F3750;
    if (!off_1001F3750)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100011B80;
      v24 = &unk_1001BE9E8;
      v25 = &v19;
      v8 = sub_100011BD0();
      v9 = dlsym(v8, "PLShouldLogRegisteredEvent");
      *(void *)(v25[1] + 24) = v9;
      off_1001F3750 = *(_UNKNOWN **)(v25[1] + 24);
      v7 = (unsigned int (*)(uint64_t, id))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (v7)
    {
      if (!v7(15, v5))
      {
        v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          v14 = "Log Power Event requested but not permitted -- %{public}@ -- %{public}@";
          goto LABEL_13;
        }
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      v10 = (void (*)(uint64_t, id, id, void))off_1001F3760;
      v22 = off_1001F3760;
      if (!off_1001F3760)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100011D24;
        v24 = &unk_1001BE9E8;
        v25 = &v19;
        v11 = sub_100011BD0();
        v12 = dlsym(v11, "PLLogRegisteredEvent");
        *(void *)(v25[1] + 24) = v12;
        off_1001F3760 = *(_UNKNOWN **)(v25[1] + 24);
        v10 = (void (*)(uint64_t, id, id, void))v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (v10)
      {
        v10(15, v5, v6, 0);
        v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          v14 = "Logged Power Event -- %{public}@ -- %{public}@";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      v17 = +[NSAssertionHandler currentHandler];
      v18 = +[NSString stringWithUTF8String:"Boolean soft_PLLogRegisteredEvent(PLClientID, CFStringRef, CFDictionaryRef, CFArrayRef)"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"ICDPowerEventLogger.m", 17, @"%s", dlerror());
    }
    else
    {
      v15 = +[NSAssertionHandler currentHandler];
      v16 = +[NSString stringWithUTF8String:"Boolean soft_PLShouldLogRegisteredEvent(PLClientID, CFStringRef)"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"ICDPowerEventLogger.m", 16, @"%s", dlerror());
    }
    __break(1u);
  }
LABEL_15:
}

@end