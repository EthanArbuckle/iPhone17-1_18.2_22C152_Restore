@interface ZhuGeSupportAssistant
+ (BOOL)isInternalAssistant;
+ (id)armoryClassName;
+ (id)classList;
+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4;
+ (id)getXpcProxyWithError:(id *)a3;
+ (id)isKey:(id)a3 withError:(id *)a4;
+ (id)serviceXpcName;
+ (void)getDylibHandlerWithError:(id *)a3;
@end

@implementation ZhuGeSupportAssistant

+ (BOOL)isInternalAssistant
{
  return 0;
}

+ (id)classList
{
  return &off_100017648;
}

+ (id)armoryClassName
{
  return @"OBJC_CLASS_$_ZhuGeArmory";
}

+ (id)serviceXpcName
{
  return @"com.apple.ZhuGeService";
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0;
    if (qword_10001A240 != -1) {
      dispatch_once(&qword_10001A240, &stru_1000146A8);
    }
    *a3 = (id) qword_10001A248;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getDylibHandlerWithError:]", 60, @"error p-pointer is nil!", v3, v4, v5, v8);
  }
  return (void *)qword_10001A250;
}

+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if [a1 isInternalAssistant] && (isZhuGeInRestoreOS()) {
    goto LABEL_10;
  }
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]", 95, @"error p-pointer is nil!", v7, v8, v9, v31);
LABEL_10:
    id v19 = 0;
    id v15 = 0;
    goto LABEL_15;
  }
  *a4 = 0;
  v10 = [a1 classList];
  unsigned __int8 v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]", 101, @"Unknown class name!", v12, v13, v14, v31);
    id v29 = +[NSError errorWithZhuGeErrorCode:38 underlyingError:0];
    id v19 = 0;
LABEL_12:
    id v15 = 0;
LABEL_14:
    *a4 = v29;
    goto LABEL_15;
  }
  id v32 = 0;
  id v15 = [a1 getDylibHandlerWithError:&v32];
  id v19 = v32;
  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]", 109, @"Failed to get ZhuGe armory handler!", v16, v17, v18, v31);
    id v29 = v19;
    id v19 = v29;
    goto LABEL_14;
  }
  id v20 = v6;
  v21 = dlsym(v15, (const char *)[v20 UTF8String]);
  if (!v21)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]", 116, @"Failed to find class symbol for \"%@\"!", v22, v23, v24, (uint64_t)v20);
    id v29 = +[NSError errorWithZhuGeErrorCode:13 underlyingError:0];
    goto LABEL_12;
  }
  id v15 = [v21 sharedInstance];
  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]", 123, @"Failed to have shared instance for \"%@\"!", v25, v26, v27, (uint64_t)v20);
    uint64_t v28 = +[NSError errorWithZhuGeErrorCode:38 underlyingError:0];

    id v19 = (id)v28;
  }
LABEL_15:

  return v15;
}

+ (id)isKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if [a1 isInternalAssistant] && (isZhuGeInRestoreOS()) {
    goto LABEL_9;
  }
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant isKey:withError:]", 146, @"error p-pointer is nil!", v7, v8, v9, v24);
LABEL_9:
    id v17 = 0;
    id v15 = 0;
    unsigned __int8 v11 = 0;
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  *a4 = 0;
  v10 = [a1 armoryClassName];
  id v26 = 0;
  unsigned __int8 v11 = [a1 getSharedInstanceByName:v10 withError:&v26];
  id v12 = v26;

  if (v11)
  {
    uint64_t v13 = [v11 helper];
    id v25 = v12;
    uint64_t v14 = [v13 getConfigOfKey:v6 withError:&v25];
    id v15 = v25;

    uint64_t v16 = &__kCFBooleanTrue;
    if (!v14) {
      uint64_t v16 = &__kCFBooleanFalse;
    }
    id v17 = v16;
  }
  else
  {
    uint64_t v18 = [a1 armoryClassName];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant isKey:withError:]", 154, @"Failed to get a shared instance for \"%@\"!", v19, v20, v21, (uint64_t)v18);

    id v15 = v12;
    id v17 = 0;
    unsigned __int8 v11 = 0;
    uint64_t v14 = 0;
    *a4 = v15;
  }
LABEL_11:
  id v22 = v17;

  return v22;
}

+ (id)getXpcProxyWithError:(id *)a3
{
  if (![a1 isInternalAssistant] || (isZhuGeInRestoreOS() & 1) == 0)
  {
    if (a3)
    {
      *a3 = 0;
      if (qword_10001A258 != -1) {
        dispatch_once(&qword_10001A258, &stru_1000146C8);
      }
      pthread_mutex_lock(&stru_10001A260);
      if (!qword_10001A2A0)
      {
        id v15 = objc_alloc((Class)NSXPCConnection);
        uint64_t v16 = [a1 serviceXpcName];
        id v11 = [v15 initWithServiceName:v16];

        if (v11)
        {
          id v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ZhuGeServiceProtocol];
          [v11 setRemoteObjectInterface:v17];

          uint64_t v42 = objc_opt_class();
          uint64_t v41 = objc_opt_class();
          uint64_t v40 = objc_opt_class();
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          uint64_t v21 = objc_opt_class();
          uint64_t v22 = objc_opt_class();
          uint64_t v23 = objc_opt_class();
          id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v42, v41, v40, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
          uint64_t v24 = [v11 remoteObjectInterface];
          [v24 setClasses:v12 forSelector:"setBulkKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          id v25 = [v11 remoteObjectInterface];
          [v25 setClasses:v12 forSelector:"setBulkInternalKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          id v26 = [v11 remoteObjectInterface];
          [v26 setClasses:v12 forSelector:"setBulkMGKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          uint64_t v27 = [v11 remoteObjectInterface];
          [v27 setClasses:v12 forSelector:"setBulkInternalMGKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_10000933C;
          v44[3] = &unk_100014400;
          v44[4] = a1;
          [v11 setInvalidationHandler:v44];
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_1000093D4;
          v43[3] = &unk_100014400;
          v43[4] = a1;
          [v11 setInterruptionHandler:v43];
          [v11 activate];
          uint64_t v28 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000146E8];
          id v29 = (void *)qword_10001A2A0;
          qword_10001A2A0 = v28;

          if (qword_10001A2A0) {
            goto LABEL_11;
          }
          v30 = [a1 serviceXpcName];
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getXpcProxyWithError:]", 257, @"Failed to get proxy for \"%@\"!", v31, v32, v33, (uint64_t)v30);

          id v34 = +[NSError errorWithZhuGeErrorCode:66 underlyingError:0];
        }
        else
        {
          v35 = [a1 serviceXpcName];
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getXpcProxyWithError:]", 200, @"Failed to connect \"%@\"!", v36, v37, v38, (uint64_t)v35);

          id v34 = +[NSError errorWithZhuGeErrorCode:67 underlyingError:0];
          id v11 = 0;
          id v12 = 0;
        }
        *a3 = v34;
        goto LABEL_11;
      }
      uint64_t v8 = @"XPC proxy is already available";
      int v9 = 524544;
      uint64_t v10 = 193;
    }
    else
    {
      uint64_t v8 = @"error p-pointer is nil!";
      int v9 = 1040;
      uint64_t v10 = 181;
    }
    ZhuGeLog(v9, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getXpcProxyWithError:]", v10, v8, v5, v6, v7, v39);
  }
  id v11 = 0;
  id v12 = 0;
LABEL_11:
  pthread_mutex_unlock(&stru_10001A260);
  id v13 = (id)qword_10001A2A0;

  return v13;
}

@end