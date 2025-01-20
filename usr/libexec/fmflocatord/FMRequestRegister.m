@interface FMRequestRegister
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (FMRequestRegister)initWithProvider:(id)a3 andCause:(id)a4;
- (NSMutableDictionary)requestBody;
- (NSMutableSet)registeredCauses;
- (NSString)cause;
- (double)maxRetryInterval;
- (id)_informationDigestForDeviceInfoDictionary:(id)a3 keysToExclude:(id)a4;
- (id)flattenedArrayFromObject:(id)a3 parentIndices:(id)a4;
- (id)newRequestBody;
- (id)registrationInformationDigestIncludingKeys;
- (id)requestUrl;
- (id)retryCauseExclusions;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (int64_t)nonEssentialRetryCount;
- (void)deinitializeRequest;
- (void)setCause:(id)a3;
- (void)setNonEssentialRetryCount:(int64_t)a3;
- (void)setRegisteredCauses:(id)a3;
- (void)setRequestBody:(id)a3;
@end

@implementation FMRequestRegister

- (void)deinitializeRequest
{
  v2.receiver = self;
  v2.super_class = (Class)FMRequestRegister;
  [(FMRequest *)&v2 deinitializeRequest];
}

- (FMRequestRegister)initWithProvider:(id)a3 andCause:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMRequestRegister;
  v7 = [(FMRequest *)&v14 initWithProvider:a3];
  v8 = v7;
  if (v7)
  {
    [(FMRequestRegister *)v7 setCause:v6];
    v9 = +[NSMutableSet setWithObject:v6];
    [(FMRequestRegister *)v8 setRegisteredCauses:v9];

    id v10 = [(FMRequestRegister *)v8 newRequestBody];
    [(FMRequestRegister *)v8 setRequestBody:v10];

    if ([v6 isEqualToString:@"wristStateChanged"])
    {
      v11 = +[PreferencesMgr sharedInstance];
      id v12 = [v11 wristRegisterRetryCount];
LABEL_6:
      [(FMRequestRegister *)v8 setNonEssentialRetryCount:v12];

      goto LABEL_7;
    }
    if ([v6 isEqualToString:@"networkStateChanged"])
    {
      v11 = +[PreferencesMgr sharedInstance];
      id v12 = [v11 networkRegisterRetryCount];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v8;
}

- (id)requestUrl
{
  objc_super v2 = [(FMRequest *)self provider];
  v3 = [v2 formattedURLForTemplate:@"${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/register"];

  return v3;
}

- (id)newRequestBody
{
  v12.receiver = self;
  v12.super_class = (Class)FMRequestRegister;
  v3 = [(FMRequest *)&v12 requestBody];
  v4 = [(FMRequest *)self provider];
  v5 = [v4 registerDeviceContext];

  id v6 = [(FMRequestRegister *)self cause];
  [v5 fm_safelyMapKey:@"cause" toObject:v6];

  v7 = [(FMRequestRegister *)self registeredCauses];
  v8 = [v7 allObjects];
  [v5 fm_safelyMapKey:@"registeredCauses" toObject:v8];

  [v3 setObject:v5 forKeyedSubscript:@"deviceContext"];
  v9 = [(FMRequest *)self provider];
  id v10 = [v9 fullDeviceInfo];
  [v3 setObject:v10 forKeyedSubscript:@"deviceInfo"];

  return v3;
}

- (double)maxRetryInterval
{
  return 3600.0;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return -1;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return -1;
}

- (BOOL)canRequestBeRetriedNow
{
  uint64_t v3 = [(FMRequestRegister *)self nonEssentialRetryCount];
  [(FMRequestRegister *)self setNonEssentialRetryCount:v3 - 1];
  if (v3 < 1) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)FMRequestRegister;
  return [(FMRequest *)&v5 canRequestBeRetriedNow];
}

- (BOOL)canReplace:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      id v10 = [(FMRequest *)self delegate];
      v15 = [v4 delegate];
      BOOL v11 = v10 == v15;

      goto LABEL_15;
    }
    id v5 = v4;
    id v6 = [(FMRequestRegister *)self registeredCauses];
    v7 = [v5 registeredCauses];
    v8 = [v7 allObjects];
    [v6 addObjectsFromArray:v8];

    v9 = [(FMRequestRegister *)self registeredCauses];
    if ([v9 containsObject:@"wristStateChanged"])
    {
    }
    else
    {
      objc_super v12 = [(FMRequestRegister *)self registeredCauses];
      unsigned int v13 = [v12 containsObject:@"networkStateChanged"];

      if (!v13)
      {
LABEL_11:
        objc_super v14 = sub_10001B6D4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Replaced FMRequestRegister with new register.", v17, 2u);
        }

        goto LABEL_14;
      }
    }
    -[FMRequestRegister setNonEssentialRetryCount:](self, "setNonEssentialRetryCount:", [v5 nonEssentialRetryCount]);
    goto LABEL_11;
  }
  id v10 = sub_10001B6D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request not FMRequestRegister or FMRequestQueueCheck. Not replacing.", buf, 2u);
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (id)retryCauseExclusions
{
  id v2 = objc_alloc((Class)NSSet);
  v6[0] = @"wristStateChanged";
  v6[1] = @"networkStateChanged";
  uint64_t v3 = +[NSArray arrayWithObjects:v6 count:2];
  id v4 = [v2 initWithArray:v3];

  return v4;
}

- (id)registrationInformationDigestIncludingKeys
{
  uint64_t v3 = [(FMRequestRegister *)self requestBody];
  id v4 = [v3 objectForKeyedSubscript:@"deviceInfo"];

  v8[0] = @"lastActiveTime";
  v8[1] = @"processId";
  v8[2] = @"unlockState";
  v8[3] = @"lastOnWristTime";
  v8[4] = @"wristStatus";
  v8[5] = @"connectionStatus";
  id v5 = +[NSArray arrayWithObjects:v8 count:6];
  id v6 = [(FMRequestRegister *)self _informationDigestForDeviceInfoDictionary:v4 keysToExclude:v5];

  return v6;
}

- (id)_informationDigestForDeviceInfoDictionary:(id)a3 keysToExclude:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mutableCopy];
  [v8 removeObjectsForKeys:v7];
  v9 = [v8 objectForKeyedSubscript:@"otherDevices"];
  id v10 = +[NSMutableArray array];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100024D6C;
  v36[3] = &unk_10005A478;
  id v32 = v7;
  id v37 = v32;
  id v11 = v10;
  id v38 = v11;
  v33 = v9;
  [v9 enumerateObjectsUsingBlock:v36];
  [v8 setObject:v11 forKeyedSubscript:@"otherDevices"];
  objc_super v12 = [(FMRequestRegister *)self flattenedArrayFromObject:v8 parentIndices:&off_10005F138];
  id v13 = [v12 mutableCopy];

  objc_super v14 = [(FMRequest *)self provider];
  v15 = [v14 lastForcedRegisterTimePrefKey];

  v16 = +[FMPreferencesUtil dateForKey:v15 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  [v13 addObject:@"lastForcedTime"];
  if (!v16)
  {
    [v13 addObject:@"null"];
    if (v13) {
      goto LABEL_3;
    }
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  v17 = +[NSString stringWithFormat:@"%@", v16];
  [v13 addObject:v17];

  if (!v13) {
    goto LABEL_13;
  }
LABEL_3:
  id v30 = v11;
  v31 = v15;
  v18 = [v13 componentsJoinedByString:@", "];
  v19 = +[NSRegularExpression regularExpressionWithPattern:@"authToken.*," options:1 error:0];
  v20 = [v19 stringByReplacingMatchesInString:v18 options:0 range:[v18 length] withTemplate:@"authToken_redacted,"];
  v21 = sub_10001B6D4();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100038BDC((uint64_t)v20, v21);
  }

  id v35 = 0;
  v22 = +[NSJSONSerialization dataWithJSONObject:v13 options:0 error:&v35];
  id v23 = v35;
  if (v23)
  {
    id v29 = v6;
    v24 = sub_10001B6D4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100038B2C(self, (uint64_t)v23, v24);
    }

    v25 = sub_10001B804();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100038AB4((uint64_t)v20, v25);
    }

    id v6 = v29;
  }

  id v11 = v30;
  v15 = v31;
LABEL_14:
  id v26 = v22;
  CC_SHA1([v26 bytes], (CC_LONG)[v26 length], md);
  v27 = +[NSData dataWithBytes:md length:20];

  return v27;
}

- (id)flattenedArrayFromObject:(id)a3 parentIndices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100025084;
  v28 = sub_100025094;
  v9 = &__NSArray0__struct;
  if (v7) {
    v9 = v7;
  }
  id v29 = v9;
  id v10 = +[NSMutableArray array];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v6;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002509C;
    v22[3] = &unk_10005A4A0;
    v23[3] = v11;
    v23[4] = v12;
    v23[0] = v10;
    v23[1] = self;
    v23[2] = &v24;
    [v13 enumerateKeysAndObjectsUsingBlock:v22];
    objc_super v14 = (void **)v23;
LABEL_7:
    v16 = *v14;
    v17 = v6;
    goto LABEL_9;
  }
  if (objc_opt_isKindOfClass())
  {
    id v15 = v6;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000251D4;
    v20[3] = &unk_10005A4C8;
    v21[2] = &v24;
    v21[0] = v10;
    v21[1] = self;
    [v15 enumerateObjectsUsingBlock:v20];
    objc_super v14 = (void **)v21;
    goto LABEL_7;
  }
  v17 = [(id)v25[5] componentsJoinedByString:@"_"];
  v16 = +[NSString stringWithFormat:@"%@_%@", v17, v6];
  [v10 addObject:v16];
LABEL_9:

  v18 = [v10 sortedArrayUsingSelector:"compare:"];

  _Block_object_dispose(&v24, 8);

  return v18;
}

- (NSMutableDictionary)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
}

- (int64_t)nonEssentialRetryCount
{
  return self->_nonEssentialRetryCount;
}

- (void)setNonEssentialRetryCount:(int64_t)a3
{
  self->_nonEssentialRetryCount = a3;
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
}

- (NSMutableSet)registeredCauses
{
  return self->_registeredCauses;
}

- (void)setRegisteredCauses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredCauses, 0);
  objc_storeStrong((id *)&self->_cause, 0);

  objc_storeStrong((id *)&self->_requestBody, 0);
}

@end