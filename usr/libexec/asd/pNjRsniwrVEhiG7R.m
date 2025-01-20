@interface pNjRsniwrVEhiG7R
+ (int)_ex9HyFJUdpLOOtaX:(id)a3 inS0qtOusqaPbbgj:(id *)a4;
+ (pNjRsniwrVEhiG7R)sharedInstance;
- (id)QRKmlh1jb9SsY8of:(id)a3;
- (id)Z0E7K4HXPkrVY9dm:(int)a3;
- (id)bfeta0KhydoCRvAc;
- (id)ygKhjfpV8v6SMJkN:(id)a3;
- (id)zdkFgT82CObMtwJn:(char *)a3 D2AyhLGEbXMCneo6:(unsigned int)a4;
- (int64_t)getEnvironmentValue;
- (pNjRsniwrVEhiG7R)init;
- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4;
- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8;
- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14;
- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4;
- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4;
- (void)dKsJLlNX54lzKt5n:(id)a3 fields:(id)a4;
- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4;
- (void)fetchConfigThrowingWithCompletion:(id)a3;
- (void)fetchConfigWithCompletion:(id)a3;
- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7;
- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)pRo6qBDnfEL0sBNs:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)registerICloudLoginWithCompletion:(id)a3;
- (void)unregisterICloudLoginWithCompletion:(id)a3;
- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4;
- (void)updateRavioliWithCompletion:(id)a3;
- (void)vffg4lwI2HftPvpO:(id)a3;
- (void)zGi22DPZsVGfawap:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14;
@end

@implementation pNjRsniwrVEhiG7R

- (int64_t)getEnvironmentValue
{
  if (!self->TvHUenoY6Ma3xE12)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [v3 objectForKey:@"environment"];
    TvHUenoY6Ma3xE12 = self->TvHUenoY6Ma3xE12;
    self->TvHUenoY6Ma3xE12 = v4;
  }
  NSSelectorFromString(@"integerValue");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v6 = self->TvHUenoY6Ma3xE12;

  return [(NSNumber *)v6 integerValue];
}

+ (pNjRsniwrVEhiG7R)sharedInstance
{
  if (qword_1006A5DA0 != -1) {
    dispatch_once(&qword_1006A5DA0, &stru_10065F0F8);
  }
  v2 = (void *)qword_1006A5D98;

  return (pNjRsniwrVEhiG7R *)v2;
}

+ (int)_ex9HyFJUdpLOOtaX:(id)a3 inS0qtOusqaPbbgj:(id *)a4
{
  id v5 = a3;
  if (!a4)
  {
    int v9 = -27002;
    goto LABEL_16;
  }
  ApplePayModelSigning = (const void *)SecPolicyCreateApplePayModelSigning();
  id v7 = v5;
  int v8 = SecCMSVerify();
  if (v8 > -51)
  {
    if (v8 == -50)
    {
      int v9 = -27652;
      goto LABEL_13;
    }
    if (!v8)
    {

      int v9 = 0;
      *a4 = 0;
      goto LABEL_14;
    }
LABEL_10:
    int v9 = -27660;
    goto LABEL_13;
  }
  if (v8 == -26275)
  {
    int v9 = -27650;
    goto LABEL_13;
  }
  if (v8 != -25293) {
    goto LABEL_10;
  }
  int v9 = -27651;
LABEL_13:

LABEL_14:
  if (ApplePayModelSigning) {
    CFRelease(ApplePayModelSigning);
  }
LABEL_16:

  return v9;
}

- (pNjRsniwrVEhiG7R)init
{
  v6.receiver = self;
  v6.super_class = (Class)pNjRsniwrVEhiG7R;
  v2 = [(pNjRsniwrVEhiG7R *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.asd.rse", 0);
    dPb4ucaLxk7hgr3U = v2->dPb4ucaLxk7hgr3U;
    v2->dPb4ucaLxk7hgr3U = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)bfeta0KhydoCRvAc
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  if ([(pNjRsniwrVEhiG7R *)self getEnvironmentValue]) {
    uint64_t v2 = -3;
  }
  else {
    uint64_t v2 = -2;
  }
  sub_100558738(v2, (uint64_t)&v10, (uint64_t)&v9, (uint64_t)&v11, (uint64_t)&v9 + 4);
  if (v3)
  {
    int v4 = v3;
    id v5 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055D018(v4, v5);
    }
    id v6 = 0;
  }
  else
  {
    id v7 = objc_alloc((Class)NSData);
    id v6 = [v7 initWithBytes:v11 length:16];
    sub_100558434(v10);
    sub_100558434(v11);
  }

  return v6;
}

- (id)Z0E7K4HXPkrVY9dm:(int)a3
{
  if (a3 > 2)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = objc_opt_new();
  }
  return v4;
}

- (id)zdkFgT82CObMtwJn:(char *)a3 D2AyhLGEbXMCneo6:(unsigned int)a4
{
  int64_t v6 = [(pNjRsniwrVEhiG7R *)self getEnvironmentValue];
  if (v6 == 2)
  {
    LOBYTE(v19) = -13;
    id v7 = &xmmword_10058CA91;
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    LOBYTE(v19) = 58;
    id v7 = &xmmword_10058CA50;
LABEL_5:
    long long v8 = v7[1];
    long long v15 = *v7;
    long long v16 = v8;
    long long v9 = v7[3];
    long long v17 = v7[2];
    long long v18 = v9;
    id v10 = objc_alloc((Class)NSData);
    uint64_t v11 = (char *)&v15;
    uint64_t v12 = 65;
    goto LABEL_7;
  }
  id v10 = objc_alloc((Class)NSData);
  uint64_t v12 = a4;
  uint64_t v11 = a3;
LABEL_7:
  id v13 = [v10 initWithBytes:v11 length:v12 bytesPerRow:v15 bytesPerPlane:v16 planes:v17];

  return v13;
}

- (id)QRKmlh1jb9SsY8of:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 endpointID];
  id v5 = objc_opt_new();
  [v5 setEngineType:0];
  int64_t v6 = [v3 phone];
  [v5 setValue:v6];

  id v7 = objc_opt_new();
  [v7 setEngineType:2];
  long long v8 = [v3 email];
  [v7 setValue:v8];

  if (v4)
  {
    if (v4 == 2)
    {
      v14[0] = v5;
      v14[1] = v7;
      long long v9 = +[NSArray arrayWithObjects:v14 count:2];
    }
    else
    {
      long long v9 = &__NSArray0__struct;
    }
  }
  else
  {
    id v10 = objc_opt_new();
    [v10 setEngineType:1];
    uint64_t v11 = [v3 name];
    [v10 setValue:v11];

    v13[0] = v5;
    v13[1] = v10;
    v13[2] = v7;
    long long v9 = +[NSArray arrayWithObjects:v13 count:3];
  }

  return v9;
}

- (id)ygKhjfpV8v6SMJkN:(id)a3
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_10001A638;
  uint64_t v19 = sub_10001A648;
  id v20 = 0;
  id v4 = a3;
  CC_SHA256([v4 bytes], (CC_LONG)[v4 length], md);
  id v5 = [objc_alloc((Class)NSData) initWithBytes:md length:32];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [objc_alloc((Class)IDSPhoneCertificateVendor) initWithQueue:self->dPb4ucaLxk7hgr3U];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A650;
  v12[3] = &unk_10065F148;
  v14 = &v15;
  long long v8 = v6;
  id v13 = v8;
  [v7 generatePhoneAuthenticationSignatureOverData:v5 withCompletion:v12];
  dispatch_time_t v9 = dispatch_time(0, 400000000);
  if (dispatch_semaphore_wait(v8, v9)) {
    sub_100027C40(-32007);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v42 = a4;
  v43 = v6;
  id v7 = [(pNjRsniwrVEhiG7R *)self QRKmlh1jb9SsY8of:v6];
  long long v8 = +[NSMutableDictionary dictionary];
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)qword_1006AD1A8);
  id v10 = (id)qword_1006AD1A8;
  uint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "pub_1", "enableTelemetry=YES", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v62;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v19 = -[pNjRsniwrVEhiG7R Z0E7K4HXPkrVY9dm:](self, "Z0E7K4HXPkrVY9dm:", [v18 engineType]);
        id v20 = [v19 WnJ3gJFPRgsreXQi:v18];
        [v8 addEntriesFromDictionary:v20];
      }
      id v15 = [v13 countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v15);
  }

  uint64_t v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  *(_OWORD *)buf = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v21 = v8;
  id v22 = [v21 countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v58;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
        v27 = [v21 objectForKeyedSubscript:v26];
        [v27 floatValue];
        *(_DWORD *)&buf[4 * (int)[v26 intValue]] = v28;
      }
      id v23 = [v21 countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v23);
  }

  long long v55 = 0uLL;
  uint64_t v56 = 0;
  *(_DWORD *)v44 = 0;
  sub_1003581FC();
  v54 = 0;
  unsigned int v53 = 0;
  BOOL v52 = [v43 settingsType:v44] == (id)1;
  unsigned __int8 v51 = [v43 endpointID];
  *(_DWORD *)v44 = 0;
  sub_1003581FC();
  int v29 = *(_DWORD *)v44;
  if (*(_DWORD *)v44)
  {
    v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100697600, v44, spid);
    NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
    CFStringRef v66 = @"Error during computation";
    v31 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v32 = +[NSError errorWithDomain:v30 code:v29 userInfo:v31];
    v33 = v42;
    (*((void (**)(id, void, void, void *))v42 + 2))(v42, 0, 0, v32);

    if (v54) {
      free(v54);
    }
    *(_DWORD *)v44 = 0;
    sub_1003581FC();
    v46 = _NSConcreteStackBlock;
    uint64_t v47 = 3221225472;
    v48 = sub_10001AF1C;
    v49 = &unk_10065F168;
    int v50 = v29;
    AnalyticsSendEventLazy();
  }
  else
  {
    v34 = objc_opt_new();
    *(_OWORD *)v44 = v55;
    uint64_t v45 = v56;
    [v34 YdwGDxa5y8ubHXip:v44, v44];
    v33 = v42;
    if (v51)
    {
      v35 = [(pNjRsniwrVEhiG7R *)self zdkFgT82CObMtwJn:v54 D2AyhLGEbXMCneo6:v53];
      [v34 setPpszCwt7GD641hHj:v35];
    }
    free(v54);
    [v34 setRUC18JCl8oMcmXim:v51];
    v36 = (id)qword_1006AD1A8;
    v37 = v36;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)v44 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, spid, "pub_1", "", v44, 2u);
    }

    v38 = +[RXs9KixbxmL4RM2Z sharedInstance];
    v39 = [v38 KvXBZ2Y159GbeEgH:v34];

    id v40 = [objc_alloc((Class)NSData) initWithBytes:v67 length:16];
    (*((void (**)(id, void *, id, void))v42 + 2))(v42, v39, v40, 0);
  }
}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  long long v18 = (void (**)(id, void, id))a8;
  id v101 = 0;
  v80 = 0;
  unsigned int v79 = 0;
  uint64_t v19 = +[RXs9KixbxmL4RM2Z sharedInstance];
  id v20 = [v19 xkNh5bfoCwq3gGYr:v13];

  if (v20)
  {
    if (v17)
    {
      if ([v17 length] == (id)8 && !objc_msgSend(v20, "rUC18JCl8oMcmXim"))
      {
        id v21 = +[NSMutableData dataWithData:v17];
        [v21 appendData:v17];

        id v17 = v21;
      }
    }
    else
    {
      id v17 = [(pNjRsniwrVEhiG7R *)self bfeta0KhydoCRvAc];
    }
    os_signpost_id_t v24 = os_signpost_id_generate((os_log_t)qword_1006AD1A8);
    v25 = (id)qword_1006AD1A8;
    v26 = v25;
    unint64_t v58 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "pub_2", "enableTelemetry=YES", buf, 2u);
    }
    os_signpost_id_t spid = v24;

    if (!v14 || !v15 || !v16)
    {
      v27 = objc_opt_new();
      *(void *)buf = 0;
      long long v74 = buf;
      uint64_t v75 = 0x3032000000;
      long long v76 = sub_10001A638;
      long long v77 = sub_10001A648;
      id v78 = 0;
      *(void *)v67 = 0;
      v68 = v67;
      uint64_t v69 = 0x3032000000;
      long long v70 = sub_10001A638;
      long long v71 = sub_10001A648;
      id v72 = 0;
      uint64_t v61 = 0;
      long long v62 = &v61;
      uint64_t v63 = 0x3032000000;
      long long v64 = sub_10001A638;
      NSErrorUserInfoKey v65 = sub_10001A648;
      id v66 = 0;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_10001B864;
      v60[3] = &unk_10065F190;
      v60[4] = buf;
      v60[5] = v67;
      v60[6] = &v61;
      [v27 traHoYtdjqKLUZYc:v60];
      id v28 = *((id *)v68 + 5);

      id v29 = (id)v62[5];
      id v30 = *((id *)v74 + 5);

      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(v67, 8);

      _Block_object_dispose(buf, 8);
      id v16 = v30;
      id v15 = v29;
      id v14 = v28;
    }
    *(void *)buf = 0;
    long long v74 = 0;
    uint64_t v75 = 0;
    [v20 Xj38ZYkbLwtCgBTH];
    v81 = buf;
    uint64_t v82 = 0;
    uint64_t v83 = 1;
    id v17 = v17;
    id v84 = [v17 bytes];
    unsigned int v85 = [v17 length];
    [v15 subdataWithRange:0, 8];
    id v31 = objc_claimAutoreleasedReturnValue();
    id v91 = [v31 bytes];

    int v92 = 8;
    [v15 subdataWithRange:NSMakeRange(8, 8)];
    id v32 = objc_claimAutoreleasedReturnValue();
    id v93 = [v32 bytes];

    int v94 = 8;
    int v88 = 24;
    id v14 = v14;
    id v89 = [v14 bytes];
    unsigned int v90 = [v14 length];
    id v33 = [v20 PpszCwt7GD641hHj];
    id v96 = [v33 bytes];

    v34 = [v20 PpszCwt7GD641hHj];
    unsigned int v97 = [v34 length];

    id v99 = 0;
    int v98 = 1;
    unsigned __int8 v100 = [v20 rUC18JCl8oMcmXim];
    int v102 = 0;
    if (v16)
    {
      char v95 = 0;
      id v35 = [v16 dataUsingEncoding:4];
      v36 = (unsigned __int8 *)[v35 bytes];

      for (uint64_t i = 0; i != 24; ++i)
      {
        int v38 = *v36;
        unsigned int v39 = v38 - 48;
        unsigned int v40 = v38 - 97;
        if ((v38 - 65) >= 6) {
          char v41 = -1;
        }
        else {
          char v41 = v38 - 55;
        }
        char v42 = v38 - 87;
        if (v40 > 5) {
          char v42 = v41;
        }
        if (v39 < 0xA) {
          char v42 = v39;
        }
        int v43 = v36[1];
        unsigned int v44 = v43 - 48;
        unsigned int v45 = v43 - 97;
        if ((v43 - 65) >= 6) {
          char v46 = -1;
        }
        else {
          char v46 = v43 - 55;
        }
        char v47 = v43 - 87;
        if (v45 > 5) {
          char v47 = v46;
        }
        if (v44 < 0xA) {
          char v47 = v44;
        }
        *((unsigned char *)&v86 + i) = v47 | (16 * v42);
        v36 += 2;
      }
    }
    else
    {
      char v95 = 1;
      int v88 = 24;
      long long v86 = xmmword_10058CAD2;
      uint64_t v87 = 0x605040302010605;
    }
    unsigned int v48 = [v20 rUC18JCl8oMcmXim];
    if (v48 == 10 || v48 == 2)
    {
      v102 |= 3u;
    }
    else if (!v48)
    {
      id v99 = [(pNjRsniwrVEhiG7R *)self ygKhjfpV8v6SMJkN:v17];
    }
    *(_DWORD *)v67 = 0;
    sub_1003581FC();
    int v49 = *(_DWORD *)v67;
    if (*(_DWORD *)v67)
    {
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
        sub_10055D16C();
      }
      AnalyticsSendEventLazy();
      int v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100697600, v67, spid);
      id v51 = +[NSError errorWithDomain:v50 code:v49 userInfo:0];

      v18[2](v18, 0, v51);
    }
    else
    {
      id v52 = objc_alloc((Class)NSData);
      id v51 = [v52 initWithBytes:v80 length:v79, v67, spid];
      ((void (**)(id, id, id))v18)[2](v18, v51, 0);
    }

    unsigned int v53 = (id)qword_1006AD1A8;
    v54 = v53;
    if (v58 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v53))
    {
      *(_WORD *)v67 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_END, spida, "pub_2", "", v67, 2u);
    }

    long long v55 = +[RXs9KixbxmL4RM2Z sharedInstance];
    [v55 f5FVXJrOBjzaLi8u:v13];

    free(v80);
    if (v99) {
  }
    }
  else
  {
    id v22 = +[NSString stringWithUTF8String:off_100697600];
    id v23 = +[NSError errorWithDomain:v22 code:-17 userInfo:0];

    v18[2](v18, 0, v23);
  }
}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v35 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  if (a3)
  {
    id v33 = v24;
    id v27 = v23;
    id v28 = v22;
    id v29 = v21;
    id v30 = v20;
    id v31 = v19;
    id v32 = a3;
    a3 = [[ASReleasableBuffer alloc] initWithData:v32];

    id v19 = v31;
    id v20 = v30;
    id v21 = v29;
    id v22 = v28;
    id v23 = v27;
    id v24 = v33;
  }
  [(pNjRsniwrVEhiG7R *)self zGi22DPZsVGfawap:a3 xz5EHXEN4FjlhJbi:v35 uhVTXyAfCFn7u0Ue:v19 EQUjQp7JcQbqcPcD:v20 A5wDLa5TFdFZlz3A:v21 TJKMyOe6zn5PdGIr:v22 eCqgGM0WcnHOslnr:a9 eCszfxdv3kUXvhgV:a10 uWp4aZpP2vLhc04Q:v23 QZYtNpvp0hKd248p:v24 oCwPYmtRv8s31KUH:v25 completion:v26];
}

- (void)zGi22DPZsVGfawap:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v19 = a3;
  id v83 = a4;
  id v85 = a5;
  id v20 = a6;
  id v80 = a7;
  id v84 = a8;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v82 = a14;
  uint64_t v135 = 0;
  long long v133 = 0u;
  long long v134 = 0u;
  *(_OWORD *)cf = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v120 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  *(_OWORD *)v106 = 0u;
  v105 = 0;
  unsigned int v104 = 0;
  v103 = 0;
  unsigned int v102 = 0;
  v81 = v19;
  unsigned int v24 = [v19 originalDataLength];
  memset(v119, 0, sizeof(v119));
  int v118 = 0;
  uint64_t v117 = 0;
  id v25 = +[PrecomputationManager shared];
  [v25 pausePrecomputationsWithCompletionHandler:&stru_10065F1B0];

  id v26 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v24;
    *(_WORD *)v114 = 2048;
    *(void *)&v114[2] = a9;
    *(_WORD *)&v114[10] = 2048;
    *(void *)&v114[12] = a10;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Len = %d, o = %ld, c = %ld", buf, 0x1Cu);
  }
  os_signpost_id_t v27 = os_signpost_id_generate((os_log_t)qword_1006AD1A8);
  id v28 = (id)qword_1006AD1A8;
  id v29 = v28;
  os_signpost_id_t spid = v27;
  unint64_t v30 = v27 - 1;
  if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, spid, "pub_3", "enableTelemetry=YES", buf, 2u);
  }

  id v31 = +[YeQHj6zXMU2P8KDh sharedInstance];
  [v31 cGauGmZFPJJkT1d3:v85];

  if (v21 && v22 && v23)
  {
    id v32 = v22;
  }
  else
  {
    id v33 = objc_opt_new();
    *(void *)buf = 0;
    *(void *)v114 = buf;
    *(void *)&v114[8] = 0x3032000000;
    *(void *)&v114[16] = sub_10001A638;
    v115 = sub_10001A648;
    id v116 = 0;
    uint64_t v96 = 0;
    unsigned int v97 = &v96;
    uint64_t v98 = 0x3032000000;
    id v99 = sub_10001A638;
    unsigned __int8 v100 = sub_10001A648;
    id v101 = 0;
    uint64_t v90 = 0;
    id v91 = &v90;
    uint64_t v92 = 0x3032000000;
    id v93 = sub_10001A638;
    int v94 = sub_10001A648;
    id v95 = 0;
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10001C6C8;
    v89[3] = &unk_10065F190;
    v89[4] = buf;
    v89[5] = &v96;
    v89[6] = &v90;
    [v33 traHoYtdjqKLUZYc:v89];
    id v34 = (id)v97[5];

    id v32 = (id)v91[5];
    id v35 = *(id *)(*(void *)v114 + 40);

    _Block_object_dispose(&v90, 8);
    _Block_object_dispose(&v96, 8);

    _Block_object_dispose(buf, 8);
    if (!v35)
    {
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
        sub_10055D254();
      }
      id v23 = 0;
      long long v62 = 0;
      id v61 = 0;
      signed int v59 = -702;
      goto LABEL_53;
    }
    id v21 = v34;
    id v23 = v35;
  }
  HIDWORD(v127) = 3;
  id v36 = v84;
  *((void *)&v121 + 1) = [v36 bytes];
  LODWORD(v122) = [v36 length];
  [v32 subdataWithRange:0, 8];
  id v37 = objc_claimAutoreleasedReturnValue();
  *(void *)&long long v125 = [v37 bytes];

  DWORD2(v125) = 8;
  [v32 subdataWithRange:NSMakeRange(8, 8)];
  id v38 = objc_claimAutoreleasedReturnValue();
  *(void *)&long long v126 = [v38 bytes];

  DWORD2(v126) = 8;
  HIDWORD(v123) = 24;
  id v34 = v21;
  *(void *)&long long v124 = [v34 bytes];
  DWORD2(v124) = [v34 length];
  *(void *)&long long v130 = 0;
  BYTE12(v126) = 0;
  id v39 = [v23 dataUsingEncoding:4];
  unsigned int v40 = (unsigned __int8 *)[v39 bytes];

  for (uint64_t i = 36; i != 60; ++i)
  {
    int v42 = *v40;
    unsigned int v43 = v42 - 48;
    unsigned int v44 = v42 - 97;
    if ((v42 - 65) >= 6) {
      char v45 = -1;
    }
    else {
      char v45 = v42 - 55;
    }
    char v46 = v42 - 87;
    if (v44 > 5) {
      char v46 = v45;
    }
    if (v43 < 0xA) {
      char v46 = v43;
    }
    int v47 = v40[1];
    unsigned int v48 = v47 - 48;
    unsigned int v49 = v47 - 97;
    if ((v47 - 65) >= 6) {
      char v50 = -1;
    }
    else {
      char v50 = v47 - 55;
    }
    char v51 = v47 - 87;
    if (v49 > 5) {
      char v51 = v50;
    }
    if (v48 < 0xA) {
      char v51 = v48;
    }
    *((unsigned char *)&v120 + i) = v51 | (16 * v46);
    v40 += 2;
  }
  if (v20 && [v20 count])
  {
    *(void *)&long long v134 = v119;
    *((void *)&v134 + 1) = &v117;
    id v52 = [v20 count];
    int v53 = 3;
    if ((unint64_t)v52 < 3) {
      int v53 = (int)v52;
    }
    LODWORD(v135) = v53;
    if (v53)
    {
      unint64_t v54 = 0;
      do
      {
        id v55 = [v20 objectAtIndexedSubscript:v54];
        id v56 = [v55 bytes];
        *(void *)(v134 + 8 * v54) = v56;

        long long v57 = [v20 objectAtIndexedSubscript:v54];
        unsigned int v58 = [v57 length];
        *(_DWORD *)(*((void *)&v134 + 1) + 4 * v54) = v58;

        ++v54;
      }
      while (v54 < v135);
    }
  }
  HIDWORD(v135) = 1;
  if (v83)
  {
    id v88 = 0;
    signed int v59 = +[pNjRsniwrVEhiG7R _ex9HyFJUdpLOOtaX:v83 inS0qtOusqaPbbgj:&v88];
    id v60 = v88;
    id v61 = v60;
    if (v59)
    {
      long long v62 = 0;
      goto LABEL_53;
    }
    unsigned int v63 = [v60 length];
    if (!v63)
    {
      long long v62 = 0;
      signed int v59 = -27600;
      goto LABEL_53;
    }
  }
  else
  {
    unsigned int v63 = 0;
    id v61 = 0;
  }
  if (v24 && (id v64 = [v81 takeDataAndOwnership]) != 0)
  {
    v106[1] = v64;
    LODWORD(v107) = v24;
    id v61 = v61;
    id v65 = [v61 bytes];
    LODWORD(v108) = v63;
    *((void *)&v107 + 1) = v65;
    v106[0] = &v120;
    *((void *)&v108 + 1) = &v105;
    *(void *)&long long v109 = &v104;
    *((void *)&v109 + 1) = &v103;
    *(void *)&long long v110 = &v102;
    *((void *)&v110 + 1) = v85;
    LODWORD(v111) = a9;
    if (v80 && (a9 & 2) != 0)
    {
      DWORD2(v111) = 2;
      id v66 = v80;
      *(void *)&long long v112 = [v66 bytes];
      DWORD2(v112) = [v66 length];
    }
    else
    {
      DWORD2(v111) = 1;
    }
    DWORD1(v111) = a10;
    long long v62 = (void *)os_transaction_create();
    *(_DWORD *)buf = 0;
    id v78 = buf;
    sub_1003581FC();
    signed int v59 = *(_DWORD *)buf;
    if (!*(_DWORD *)buf)
    {
      id v67 = objc_alloc((Class)NSData);
      id v68 = [v67 initWithBytes:v105 length:v104 buf];
      id v69 = objc_alloc((Class)NSData);
      id v70 = [v69 initWithBytes:v103 length:v102];
      (*((void (**)(id, id, id, void, uint64_t, void))v82 + 2))(v82, v70, v68, 0, 2, 0);

      signed int v59 = 0;
    }
  }
  else
  {
    long long v62 = 0;
    signed int v59 = -27823;
  }
LABEL_53:
  if (v106[1])
  {
    free(v106[1]);
    v106[1] = 0;
  }
  long long v71 = +[PrecomputationManager shared];
  [v71 resumePrecomputationsWithCompletionHandler:&stru_10065F1D0];

  if (v105) {
    free(v105);
  }
  if (v103) {
    free(v103);
  }
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  if (cf[1] && v132)
  {
    free((void *)cf[1]);
    cf[1] = 0;
    LODWORD(v132) = 0;
  }
  id v72 = (id)qword_1006AD1A8;
  long long v73 = v72;
  if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_END, spid, "pub_3", "", buf, 2u);
  }

  if ((a10 & 8) != 0)
  {
    uint64_t v75 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "Skipping bindings due to bindingsCaptureDisabled flag", buf, 2u);
    }
  }
  else
  {
    long long v74 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C788;
    block[3] = &unk_10065F1F8;
    id v87 = v85;
    dispatch_async(v74, block);
  }
  if (v59)
  {
    AnalyticsSendEventLazy();
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055D1E0();
    }
    long long v76 = +[NSString stringWithUTF8String:off_100697600];
    long long v77 = +[NSError errorWithDomain:v76 code:v59 userInfo:0];

    (*((void (**)(id, void, void, void, uint64_t, void *))v82 + 2))(v82, 0, 0, 0, 0xFFFFFFFFLL, v77);
  }
}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id, void, id))a4;
  id v6 = a3;
  id v7 = +[PJXBDBF1h0EU80dy sharedInstance];
  id v12 = 0;
  id v8 = [v7 nYOW3DfIUVSEf2Hm:v6 rTZQrPNUbDSIifrh:&v12];

  id v9 = v12;
  id v10 = [[Vr3QrKl7Yn9l4CTz alloc] initWithfOZWnqN9bY6jwOMf:v7];
  [(Vr3QrKl7Yn9l4CTz *)v10 ppirDXSrO0poQaQJ];

  uint64_t v11 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Maintenance triggered, purged %ld records", buf, 0xCu);
  }
  v5[2](v5, v8, 0, v9);
}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  uint64_t v5 = 0;
  id v6 = 0;
  id v3 = (void (**)(id, void *, void))a3;
  sub_1003581FC();
  id v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", 0, 0, &v5);
  v3[2](v3, v4, 0);

  if (v6) {
    free(v6);
  }
}

- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D288();
  }
  v4[2](v4, 0);
}

- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4
{
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D2BC();
  }
}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D2F0();
  }
  id v4 = +[NSString stringWithUTF8String:off_100697600];
  uint64_t v5 = +[NSError errorWithDomain:v4 code:141 userInfo:0];
  v3[2](v3, v5);
}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D324();
  }
  v3[2](v3, 0);
}

- (void)fetchConfigThrowingWithCompletion:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D358();
  }
  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  id v7 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D38C(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)dKsJLlNX54lzKt5n:(id)a3 fields:(id)a4
{
  id v4 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D404(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  id v4 = a4;
  uint64_t v5 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D47C(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
    sub_10055D4F4();
  }
}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  uint64_t v5 = (void (**)(id, void, void *))a5;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
    sub_10055D4F4();
  }
  uint64_t v6 = +[NSString stringWithUTF8String:off_100697600];
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  CFStringRef v10 = @"Not implemented";
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  uint64_t v8 = +[NSError errorWithDomain:v6 code:-27006 userInfo:v7];
  v5[2](v5, 0, v8);
}

- (void)registerICloudLoginWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
    sub_10055D4F4();
  }
  id v4 = +[NSString stringWithUTF8String:off_100697600];
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  CFStringRef v8 = @"Not implemented";
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  uint64_t v6 = +[NSError errorWithDomain:v4 code:-27006 userInfo:v5];
  v3[2](v3, v6);
}

- (void)unregisterICloudLoginWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
    sub_10055D4F4();
  }
  id v4 = +[NSString stringWithUTF8String:off_100697600];
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  CFStringRef v8 = @"Not implemented";
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  uint64_t v6 = +[NSError errorWithDomain:v4 code:-27006 userInfo:v5];
  v3[2](v3, v6);
}

- (void)pRo6qBDnfEL0sBNs:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v5 = a5;
  uint64_t v6 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055D528(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dPb4ucaLxk7hgr3U, 0);

  objc_storeStrong((id *)&self->TvHUenoY6Ma3xE12, 0);
}

@end