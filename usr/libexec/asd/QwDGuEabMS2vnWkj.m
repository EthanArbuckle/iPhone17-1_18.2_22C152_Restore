@interface QwDGuEabMS2vnWkj
+ (id)errorFromUnderlyingError:(id)a3;
+ (id)wrongXPCParameterError;
- (QwDGuEabMS2vnWkj)initWithsk6s81V5EsZL9icr:(unsigned __int8)a3;
- (void)SOUWv5VjPwXYslMm:(id)a3 noUfOiGjp1iQmKZX:(id)a4 pPGyXmlDbN3mzzHm:(id)a5 iSOZt67ioKsVcqQZ:(id)a6 hjCrdFOLMJN0Cc5Q:(id)a7 lE40aye8U2u533Ka:(id)a8 JRuZv6Feh9qwrGmN:(unint64_t)a9 Wn0aIR2B54NCtGQc:(unint64_t)a10 B3l3lS18BITy5E4L:(id)a11 UywAszL6AB8Y6LTJ:(id)a12 uNao9X8A82jVmQkK:(id)a13 completion:(id)a14;
- (void)VE7BAlWGDSKrO5xc:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 HY6FXG20397zwmVg:(id)a8;
- (void)djoNSwl5j57W5mfl:(id)a3 eqF2XJh3hHBJQf2K:(id)a4;
- (void)f9MGfLOgnHPuKTrU:(id)a3 HY6FXG20397zwmVg:(id)a4;
- (void)fetchConfigWithCompletionXPC:(id)a3;
- (void)fetchGeoCodingsForAddressesXPC:(id)a3 completion:(id)a4;
- (void)k0p7Rchr49btq6wB:(id)a3 HY6FXG20397zwmVg:(id)a4;
- (void)k4eQYhyzyebbQqys:(id)a3;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7;
- (void)pRo6qBDnfEL0sBNs:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)rGvculjlqIwBJaoX:(id)a3 completion:(id)a4;
- (void)registerICloudLoginWithCompletionXPC:(id)a3;
- (void)unregisterICloudLoginWithCompletionXPC:(id)a3;
- (void)updateGeoCodingsXPC:(id)a3 completion:(id)a4;
- (void)xs00laTiKIpDUzDP:(id)a3;
@end

@implementation QwDGuEabMS2vnWkj

- (QwDGuEabMS2vnWkj)initWithsk6s81V5EsZL9icr:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QwDGuEabMS2vnWkj;
  result = [(QwDGuEabMS2vnWkj *)&v5 init];
  if (result) {
    result->yUeYlMhe6tbatNIz = a3;
  }
  return result;
}

- (void)k0p7Rchr49btq6wB:(id)a3 HY6FXG20397zwmVg:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[git3vZFAfTws6rT8 alloc] initWithDictionary:v6];

  if (v7)
  {
    if (+[YeQHj6zXMU2P8KDh sensitiveLoggingEnabled])
    {
      v8 = qword_1006AD1A0;
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "with %@", buf, 0xCu);
      }
    }
    id v9 = [(git3vZFAfTws6rT8 *)v7 endpointIdentifier];
    [v9 UTF8String];

    buf[0] = 0;
    char v13 = 0;
    sub_1003581FC();
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100697600, &v13);
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Unknown endpoint identifier";
    v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v12 = +[NSError errorWithDomain:v10 code:-801 userInfo:v11];
  }
  else
  {
    v12 = +[QwDGuEabMS2vnWkj wrongXPCParameterError];
  }
  (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v12);
}

- (void)VE7BAlWGDSKrO5xc:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 HY6FXG20397zwmVg:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = +[pNjRsniwrVEhiG7R sharedInstance];
  [v19 QeMnG23X94qgz7jT:v18 hostChallenge:v17 challengeResponse:v16 seid:v15 nonce:v14 completion:v13];
}

- (void)f9MGfLOgnHPuKTrU:(id)a3 HY6FXG20397zwmVg:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[pNjRsniwrVEhiG7R sharedInstance];
  [v7 ZfE6lVphNUVrZcKx:v6 completion:v5];
}

- (void)xs00laTiKIpDUzDP:(id)a3
{
  id v3 = a3;
  id v4 = +[pNjRsniwrVEhiG7R sharedInstance];
  [v4 vffg4lwI2HftPvpO:v3];
}

- (void)SOUWv5VjPwXYslMm:(id)a3 noUfOiGjp1iQmKZX:(id)a4 pPGyXmlDbN3mzzHm:(id)a5 iSOZt67ioKsVcqQZ:(id)a6 hjCrdFOLMJN0Cc5Q:(id)a7 lE40aye8U2u533Ka:(id)a8 JRuZv6Feh9qwrGmN:(unint64_t)a9 Wn0aIR2B54NCtGQc:(unint64_t)a10 B3l3lS18BITy5E4L:(id)a11 UywAszL6AB8Y6LTJ:(id)a12 uNao9X8A82jVmQkK:(id)a13 completion:(id)a14
{
  id v40 = a3;
  id v38 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  v39 = v23;
  if (a9 <= 4 && v40 && v19 && v20 && v22)
  {
    if (a9)
    {
      v27 = qword_1006AD1A0;
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "GO C", buf, 2u);
      }
    }
    id v37 = v21;
    v28 = [[ASReleasableBuffer alloc] initWithData:v40];
    if (v28)
    {
      v29 = v28;
      v30 = +[pNjRsniwrVEhiG7R sharedInstance];
      id v36 = v23;
      v31 = v38;
      [v30 zGi22DPZsVGfawap:v29 xz5EHXEN4FjlhJbi:v38 uhVTXyAfCFn7u0Ue:v19 EQUjQp7JcQbqcPcD:v20 A5wDLa5TFdFZlz3A:v37 TJKMyOe6zn5PdGIr:v22 eCqgGM0WcnHOslnr:a9 eCszfxdv3kUXvhgV:a10 uWp4aZpP2vLhc04Q:v36 QZYtNpvp0hKd248p:v24 oCwPYmtRv8s31KUH:v25 completion:v26];

      id v21 = v37;
    }
    else
    {
      v33 = +[NSString stringWithUTF8String:off_100697600];
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      CFStringRef v43 = @"Error creating buffer";
      v34 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v35 = +[NSError errorWithDomain:v33 code:-27002 userInfo:v34];

      (*((void (**)(id, void, void, void, uint64_t, void *))v26 + 2))(v26, 0, 0, 0, 0xFFFFFFFFLL, v35);
      id v21 = v37;
      v31 = v38;
    }
  }
  else
  {
    v32 = +[QwDGuEabMS2vnWkj wrongXPCParameterError];
    (*((void (**)(id, void, void, void, uint64_t, void *))v26 + 2))(v26, 0, 0, 0, 0xFFFFFFFFLL, v32);

    v31 = v38;
  }
}

- (void)k4eQYhyzyebbQqys:(id)a3
{
  id v3 = a3;
  id v6 = +[RavioliManagerObjC shared];
  id v4 = +[RavioliConstants ravioliUUID];
  id v5 = +[DefinedRavioliNotificationIds xpc];
  [v6 triggerImmediateRavioliFetchWithBagID:v4 notificationId:v5 completion:v3];
}

- (void)updateGeoCodingsXPC:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = self;
  id v42 = 0;
  v8 = +[ASDGeoCodingKeyedUnarchiver unarchivedObjectOfClass:v7 fromData:v5 error:&v42];
  id v9 = v42;

  v10 = [v8 objectForKeyedSubscript:@"addresses"];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"locations"];
  v12 = (void *)v11;
  if (v9) {
    goto LABEL_2;
  }
  if (!v10)
  {
    id v9 = +[QwDGuEabMS2vnWkj wrongXPCParameterError];
LABEL_2:
    v6[2](v6, v9);
    goto LABEL_28;
  }
  v31 = v10;
  v32 = (void *)v11;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v10;
  id v14 = (char *)[v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v39;
    while (2)
    {
      id v17 = 0;
      do
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          id v9 = +[QwDGuEabMS2vnWkj wrongXPCParameterError];
          v6[2](v6, v9);

          goto LABEL_27;
        }
        ++v17;
      }
      while (v15 != v17);
      id v15 = (char *)[v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  v29 = v6;
  id v30 = v5;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v32;
  id v21 = (char *)[v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    while (2)
    {
      id v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = self;
        if (objc_opt_isKindOfClass())
        {
        }
        else
        {
          id v26 = self;
          char v27 = objc_opt_isKindOfClass();

          if ((v27 & 1) == 0)
          {
            id v9 = +[QwDGuEabMS2vnWkj wrongXPCParameterError];
            id v6 = v29;
            v29[2](v29, v9);

            goto LABEL_26;
          }
        }
        ++v24;
      }
      while (v22 != v24);
      id v22 = (char *)[v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  v28 = +[PJXBDBF1h0EU80dy sharedInstance];
  id v33 = 0;
  [v28 updateGeoCodeForAddresses:v13 locations:v20 error:&v33];
  id v9 = v33;

  id v6 = v29;
  v29[2](v29, v9);
LABEL_26:
  id v5 = v30;
LABEL_27:
  v10 = v31;
  v12 = v32;
LABEL_28:
}

- (void)fetchGeoCodingsForAddressesXPC:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = self;
  id v25 = 0;
  v8 = +[ASDGeoCodingKeyedUnarchiver unarchivedObjectOfClass:v7 fromData:v5 error:&v25];
  id v9 = v25;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v8;
    v12 = (char *)[v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        id v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            id v9 = +[QwDGuEabMS2vnWkj wrongXPCParameterError];
            v6[2](v6, 0, v9);
            goto LABEL_16;
          }
          ++v15;
        }
        while (v13 != v15);
        id v13 = (char *)[v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v18 = +[PJXBDBF1h0EU80dy sharedInstance];
    id v11 = [v18 fetchGeoCodingsForAddresses:v11];

    id v20 = 0;
    id v19 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v20];
    id v9 = v20;
    ((void (**)(id, void *, id))v6)[2](v6, v19, v9);

LABEL_16:
  }
  else
  {
    v6[2](v6, 0, v9);
  }
}

- (void)fetchConfigWithCompletionXPC:(id)a3
{
  id v4 = a3;
  id v6 = +[ASDConfigurationManager shared];
  id v5 = [v6 configDictionaryForCoreODI];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100009A98;
  v25[3] = &unk_10065EC20;
  id v13 = a7;
  v25[4] = self;
  id v26 = v13;
  uint64_t v14 = objc_retainBlock(v25);
  if (v10)
  {
    id v15 = +[PrecomputationManager shared];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100009AF8;
    v23[3] = &unk_10065EC88;
    uint64_t v16 = (id *)&v24;
    long long v24 = v14;
    [v15 triggerDuePrecomputationsWithDataProtectionClass:4 shouldDefer:&stru_10065EC60 completionHandler:v23];
LABEL_11:

    goto LABEL_12;
  }
  if (v9)
  {
    id v15 = +[PrecomputationManager shared];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100009B0C;
    v21[3] = &unk_10065ECB0;
    uint64_t v16 = (id *)&v22;
    long long v22 = v14;
    [v15 triggerAllPrecomputationsWithCompletionHandler:v21];
    goto LABEL_11;
  }
  if (v12 && !v8)
  {
    id v15 = +[PrecomputationManager shared];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100009B20;
    v19[3] = &unk_10065ECD8;
    uint64_t v16 = (id *)&v20;
    id v20 = v14;
    [v15 triggerPrecomputationWithWorkflowID:v12 completionHandler:v19];
    goto LABEL_11;
  }
  if (v12 && v8)
  {
    id v15 = +[PrecomputationManager shared];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009B34;
    v17[3] = &unk_10065ECD8;
    uint64_t v16 = (id *)&v18;
    id v18 = v14;
    [v15 triggerPregenerationWithWorkflowID:v12 completionHandler:v17];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)djoNSwl5j57W5mfl:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PJXBDBF1h0EU80dy sharedInstance];
  [v7 dKsJLlNX54lzKt5n:v6 eqF2XJh3hHBJQf2K:v5];
}

- (void)rGvculjlqIwBJaoX:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  id v6 = a3;
  id v7 = +[PJXBDBF1h0EU80dy sharedInstance];
  id v10 = 0;
  BOOL v8 = [v7 evrtH713YbFfEOzk:v6 error:&v10];

  id v9 = v10;
  if (v9) {
    v5[2](v5, 0, v9);
  }
  ((void (**)(id, void *, id))v5)[2](v5, v8, 0);
}

- (void)registerICloudLoginWithCompletionXPC:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = +[PushCoordinator shared];
  [v3 registerICloud];

  v4[2](v4, 0);
}

- (void)unregisterICloudLoginWithCompletionXPC:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id v3 = +[PushCoordinator shared];
  [v3 unregister];

  id v4 = objc_alloc_init(Vr3QrKl7Yn9l4CTz);
  [(Vr3QrKl7Yn9l4CTz *)v4 sFFfMcUAtN14Bjc5];

  v5[2](v5, 0);
}

- (void)pRo6qBDnfEL0sBNs:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[AssessmentPayloadStore shared];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009E74;
  v12[3] = &unk_10065ED00;
  id v13 = v7;
  id v11 = v7;
  [v10 fetchFor:v9 withBindings:v8 completionHandler:v12];
}

+ (id)errorFromUnderlyingError:(id)a3
{
  id v3 = off_100697600;
  id v4 = a3;
  id v5 = +[NSString stringWithUTF8String:v3];
  id v6 = [v4 code];

  id v7 = +[NSError errorWithDomain:v5 code:v6 userInfo:0];

  return v7;
}

+ (id)wrongXPCParameterError
{
  v2 = +[NSString stringWithUTF8String:off_100697600];
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = @"Error decoding XPC args";
  id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = +[NSError errorWithDomain:v2 code:-802 userInfo:v3];

  return v4;
}

@end