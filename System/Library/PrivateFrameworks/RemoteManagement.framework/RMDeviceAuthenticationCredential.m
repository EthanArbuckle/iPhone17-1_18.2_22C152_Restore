@interface RMDeviceAuthenticationCredential
- (BOOL)prepareTask:(id)a3 error:(id *)a4;
- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4;
@end

@implementation RMDeviceAuthenticationCredential

- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 HTTPBody];
  if (!v6)
  {
    v6 = [&stru_1000C74D0 dataUsingEncoding:4];
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_10000CF2C;
  v38 = sub_10000CF3C;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_10000CF2C;
  v32 = sub_10000CF3C;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000CF2C;
  v26 = sub_10000CF3C;
  id v27 = 0;
  id v7 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  v8 = +[RMDeviceIdentity sharedDeviceIdentity];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000CF44;
  v16[3] = &unk_1000C4E70;
  id v9 = v7;
  id v17 = v9;
  v19 = &v34;
  id v10 = v6;
  id v18 = v10;
  v20 = &v22;
  v21 = &v28;
  [v8 deviceIdentityWithCompletionHandler:v16];

  [v9 lockWhenCondition:1];
  [v9 unlock];
  uint64_t v11 = v23[5];
  if (v11)
  {
    if (a4)
    {
      v12 = +[RMErrorUtilities createInternalError];
      v13 = v12;
      if (v12) {
        *a4 = v12;
      }
    }
  }
  else
  {
    v14 = +[RMLog deviceAuthenticationCredential];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10000D258(v14);
    }

    [v5 setValue:v35[5] forHTTPHeaderField:@"X-Apple-RM-Signature-Data"];
    [v5 setValue:v29[5] forHTTPHeaderField:@"X-Apple-RM-Signature-Certificates"];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v11 == 0;
}

- (BOOL)prepareTask:(id)a3 error:(id *)a4
{
  return 1;
}

@end