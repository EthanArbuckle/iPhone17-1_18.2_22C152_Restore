@interface FMDRequestIdentityV5
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (FMDRequestIdentityV5)initWithProvider:(id)a3 identityInfo:(id)a4;
- (FMDServiceProvider)provider;
- (NSData)requestBodyDataForSignature;
- (NSString)baaAttestationHeader;
- (NSString)baaError;
- (NSString)baaErrorDescription;
- (NSString)baaSignatureHeader;
- (NSString)commandID;
- (NSString)signatureError;
- (NSString)signatureHeader;
- (NSString)skAuthHeader;
- (NSUUID)activationLockRequestUUID;
- (double)maxRetryInterval;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (int64_t)baaIdentityTimeoutIntervalInSec;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (void)_calculateSignatureForBody:(id)a3;
- (void)setActivationLockRequestUUID:(id)a3;
- (void)setBaaAttestationHeader:(id)a3;
- (void)setBaaError:(id)a3;
- (void)setBaaErrorDescription:(id)a3;
- (void)setBaaIdentityTimeoutIntervalInSec:(int64_t)a3;
- (void)setBaaSignatureHeader:(id)a3;
- (void)setCommandID:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRequestBodyDataForSignature:(id)a3;
- (void)setSignatureError:(id)a3;
- (void)setSignatureHeader:(id)a3;
- (void)setSkAuthHeader:(id)a3;
@end

@implementation FMDRequestIdentityV5

- (FMDRequestIdentityV5)initWithProvider:(id)a3 identityInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 account];
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestIdentityV5;
  v9 = [(FMDRequest *)&v14 initWithAccount:v8];

  if (v9)
  {
    [(FMDRequestIdentityV5 *)v9 setProvider:v6];
    id v10 = [v7 timeoutIntervalInSec];
    if ((uint64_t)v10 >= 0) {
      uint64_t v11 = (uint64_t)v10;
    }
    else {
      uint64_t v11 = 60;
    }
    [(FMDRequestIdentityV5 *)v9 setBaaIdentityTimeoutIntervalInSec:v11];
    v12 = [v7 commandID];
    [(FMDRequestIdentityV5 *)v9 setCommandID:v12];
  }
  return v9;
}

- (id)requestUrl
{
  v3 = +[FMDSystemConfig sharedInstance];
  v4 = [v3 deviceUDID];

  v5 = objc_alloc_init(RequestTemplateURL);
  id v6 = [(FMDRequestIdentityV5 *)self provider];
  id v7 = [v6 account];
  v8 = [(RequestTemplateURL *)v5 urlFromTemplate:@"${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/identityV5" account:v7 udid:v4];

  return v8;
}

- (id)requestHeaders
{
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestIdentityV5;
  v3 = [(FMDRequest *)&v14 requestHeaders];
  v4 = [(FMDRequestIdentityV5 *)self signatureHeader];
  [v3 fm_safelyMapKey:@"X-Mme-Sign1" toObject:v4];

  v5 = [(FMDRequestIdentityV5 *)self skAuthHeader];
  [v3 fm_safelyMapKey:@"X-Mme-Sign2" toObject:v5];

  id v6 = [(FMDRequestIdentityV5 *)self baaAttestationHeader];
  [v3 fm_safelyMapKey:@"X-Mme-Sign5" toObject:v6];

  id v7 = [(FMDRequestIdentityV5 *)self baaSignatureHeader];
  [v3 fm_safelyMapKey:@"X-Mme-Sign6" toObject:v7];

  v8 = [(FMDRequestIdentityV5 *)self activationLockRequestUUID];
  v9 = [v8 UUIDString];
  [v3 fm_safelyMapKey:@"X-Apple-AL-ID" toObject:v9];

  id v10 = [(FMDRequestIdentityV5 *)self signatureError];
  [v3 fm_safelyMapKey:@"X-Apple-Sign1-Error" toObject:v10];

  uint64_t v11 = [(FMDRequestIdentityV5 *)self baaError];
  [v3 fm_safelyMapKey:@"X-Apple-Sign5-Error" toObject:v11];

  v12 = [(FMDRequestIdentityV5 *)self baaErrorDescription];
  [v3 fm_safelyMapKey:@"X-Apple-Sign5-Error-Desc" toObject:v12];

  return v3;
}

- (id)requestBody
{
  v43.receiver = self;
  v43.super_class = (Class)FMDRequestIdentityV5;
  v3 = [(FMDRequest *)&v43 requestBody];
  v4 = [(FMDRequestIdentityV5 *)self provider];
  if (v4)
  {
    v5 = objc_alloc_init(FMDActingRequestDecorator);
    id v6 = [(FMDActingRequestDecorator *)v5 standardDeviceContext];

    id v7 = [v4 account];
    v8 = [v7 authId];
    [v3 fm_safelyMapKey:@"dsid" toObject:v8];

    [v3 fm_safelyMapKey:@"deviceContext" toObject:v6];
    v9 = +[ServerDeviceInfo sharedInstance];
    id v10 = [v4 account];
    uint64_t v11 = [v9 identityDeviceInfoForAccount:v10];
    [v3 fm_safelyMapKey:@"deviceInfo" toObject:v11];
  }
  v12 = [(FMDRequestIdentityV5 *)self commandID];
  [v3 fm_safelyMapKey:@"cmdId" toObject:v12];

  v13 = +[FMDSystemConfig sharedInstance];
  objc_super v14 = [v13 internationalMobileEquipmentIdentity];
  [v3 fm_safelyMapKey:@"imei" toObject:v14];

  v15 = +[FMDSystemConfig sharedInstance];
  v16 = [v15 internationalMobileEquipmentIdentityTwo];
  [v3 fm_safelyMapKey:@"imei2" toObject:v16];

  v17 = +[FMDSystemConfig sharedInstance];
  v18 = [v17 mobileEquipmentIdentifier];
  [v3 fm_safelyMapKey:@"meid" toObject:v18];

  v19 = +[FMDSystemConfig sharedInstance];
  v20 = [v19 serialNumber];
  [v3 fm_safelyMapKey:@"serialNumber" toObject:v20];

  v21 = +[FMDSystemConfig sharedInstance];
  v22 = [v21 escrowHash];
  v23 = [v22 hexString];
  [v3 fm_safelyMapKey:@"escrowHash" toObject:v23];

  v24 = +[FMDSystemConfig sharedInstance];
  v25 = [v24 ecid];
  v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%llx", [v25 longLongValue]);
  [v3 fm_safelyMapKey:@"ecid" toObject:v26];

  v27 = +[FMDSystemConfig sharedInstance];
  v28 = [v27 chipId];
  v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%llx", [v28 longLongValue]);
  [v3 fm_safelyMapKey:@"chipId" toObject:v29];

  v30 = +[FMDSystemConfig sharedInstance];
  v31 = [v30 wifiMacAddress];
  [v3 fm_safelyMapKey:@"wifiMac" toObject:v31];

  v32 = +[FMDSystemConfig sharedInstance];
  v33 = [v32 btMacAddress];
  [v3 fm_safelyMapKey:@"btMac" toObject:v33];

  v34 = +[FMDAbsintheV3SigningInterface sharedInterface];
  id v42 = 0;
  v35 = [v34 inFieldCollectionReceipt:&v42];
  id v36 = v42;
  [v3 fm_safelyMapKey:@"ifcReceipt" toObject:v35];

  v37 = [v36 fm_commaSeparatedString];
  [v3 fm_safelyMapKey:@"collectionError" toObject:v37];

  v38 = +[FMSystemInfo sharedInstance];
  LODWORD(v35) = [v38 isInternalBuild];

  if (v35)
  {
    v39 = [v36 description];
    [v3 fm_safelyMapKey:@"collectionErrorDetail" toObject:v39];
  }
  v40 = +[NSUUID UUID];
  [(FMDRequestIdentityV5 *)self setActivationLockRequestUUID:v40];
  [(FMDRequestIdentityV5 *)self _calculateSignatureForBody:v3];

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
  if ((id)[(FMDRequest *)self httpResponseStatus] == (id)501) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FMDRequestIdentityV5;
  return [(FMDRequest *)&v4 canRequestBeRetriedNow];
}

- (BOOL)canReplace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_calculateSignatureForBody:(id)a3
{
  id v4 = a3;
  v45 = [(FMDRequestIdentityV5 *)self activationLockRequestUUID];
  [(FMDRequestIdentityV5 *)self setSignatureHeader:0];
  [(FMDRequestIdentityV5 *)self setSkAuthHeader:0];
  [(FMDRequestIdentityV5 *)self setRequestBodyDataForSignature:0];
  [(FMDRequestIdentityV5 *)self setBaaSignatureHeader:0];
  [(FMDRequestIdentityV5 *)self setBaaAttestationHeader:0];
  if (v4)
  {
    id v64 = 0;
    v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:&v64];
    id v6 = v64;
    [(FMDRequestIdentityV5 *)self setRequestBodyDataForSignature:v5];

    id v7 = [(FMDRequestIdentityV5 *)self requestBodyDataForSignature];
    LODWORD(v5) = v7 == 0;

    if (v5)
    {
      v8 = sub_100004238();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10023F08C(self, v8);
      }
    }
    if (v6)
    {
      v9 = sub_100004238();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10023EFF8(self);
      }

      id v10 = sub_100059618();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10023EF64(self);
      }
    }
  }
  uint64_t v11 = [(FMDRequestIdentityV5 *)self requestBodyDataForSignature];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    v13 = +[NSMutableData data];
    v44 = [(FMDRequest *)self authHeaderValue];
    if ([v44 length])
    {
      objc_super v14 = [v44 dataUsingEncoding:4];
      [v13 appendData:v14];
    }
    v15 = [(FMDRequestIdentityV5 *)self requestBodyDataForSignature];
    [v13 appendData:v15];

    id v16 = v13;
    CC_SHA256([v16 bytes], (CC_LONG)[v16 length], md);
    v17 = +[NSData dataWithBytes:md length:32];
    v18 = +[FMDAbsintheV3SigningInterface sharedInterface];
    id v63 = 0;
    objc_super v43 = [v18 signatureForData:v17 requestUUID:v45 mode:0 error:&v63];
    id v19 = v63;

    if (v19)
    {
      id v20 = [v19 code];
      v21 = [v19 userInfo];
      v22 = [v21 objectForKeyedSubscript:@"kFMDUnderlyingErrorCodeKey"];
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld,%ld", v20, [v22 integerValue]);
      [(FMDRequestIdentityV5 *)self setSignatureError:v23];
    }
    else
    {
      if ([v43 count] != (id)2) {
        goto LABEL_19;
      }
      v40 = [v43 objectAtIndexedSubscript:0];
      v21 = [v40 base64EncodedString];

      v41 = [v43 objectAtIndexedSubscript:1];
      v22 = [v41 base64EncodedString];

      [(FMDRequestIdentityV5 *)self setSignatureHeader:v21];
      id v42 = sub_100004238();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v67) = 138412290;
        *(void *)((char *)&v67 + 4) = v21;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Signature header: %@", (uint8_t *)&v67, 0xCu);
      }

      [(FMDRequestIdentityV5 *)self setSkAuthHeader:v22];
      v23 = sub_100004238();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v67) = 138412290;
        *(void *)((char *)&v67 + 4) = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SkAuth header: %@", (uint8_t *)&v67, 0xCu);
      }
    }

LABEL_19:
    id v24 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
    *(void *)&long long v67 = 0;
    *((void *)&v67 + 1) = &v67;
    uint64_t v68 = 0x3032000000;
    v69 = sub_100055528;
    v70 = sub_100055538;
    id v71 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = sub_100055528;
    v61 = sub_100055538;
    id v62 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_100055528;
    v55 = sub_100055538;
    id v56 = 0;
    id v25 = [objc_alloc((Class)FMDIdentitySigningRequest) initWithData:v17];
    v26 = sub_100004238();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v27 = [(FMDRequestIdentityV5 *)self baaIdentityTimeoutIntervalInSec];
      *(_DWORD *)buf = 134217984;
      int64_t v66 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sign Using BAA with timeout: %lu seconds", buf, 0xCu);
    }

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100055540;
    v46[3] = &unk_1002DB048;
    v48 = &v51;
    v49 = &v67;
    v50 = &v57;
    id v28 = [objc_alloc((Class)FMSynchronizer) initWithDescription:@"FMDRequestIdentityV5.BAASigning" andTimeout:-[FMDRequestIdentityV5 baaIdentityTimeoutIntervalInSec](self, "baaIdentityTimeoutIntervalInSec")];
    id v47 = v28;
    [v24 baaIdentityAttestationForSigningRequest:v25 completion:v46];
    [v28 wait];
    if ([v28 timeoutOccurred])
    {
      uint64_t v29 = +[NSError errorWithDomain:kFMDErrorDomain code:4 userInfo:0];
      v30 = (void *)v52[5];
      v52[5] = v29;
    }
    v31 = [*(id *)(*((void *)&v67 + 1) + 40) base64EncodedString];
    [(FMDRequestIdentityV5 *)self setBaaSignatureHeader:v31];

    v32 = [(id)v58[5] base64EncodedString];
    [(FMDRequestIdentityV5 *)self setBaaAttestationHeader:v32];

    v33 = (void *)v52[5];
    if (v33)
    {
      v34 = [v33 domain];
      v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@|%ld", v34, [(id)v52[5] code]);
      [(FMDRequestIdentityV5 *)self setBaaError:v35];

      id v36 = [(id)v52[5] description];
      [(FMDRequestIdentityV5 *)self setBaaErrorDescription:v36];

      v37 = [FMDALFailureAnalyticsManager alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
      v39 = [(FMDALFailureAnalyticsManager *)v37 initWithProvider:WeakRetained context:@"IdentityV5"];

      [(FMDALFailureAnalyticsManager *)v39 performAnalytics:v52[5]];
    }
    else
    {
      [(FMDRequestIdentityV5 *)self setBaaError:0];
      [(FMDRequestIdentityV5 *)self setBaaErrorDescription:0];
    }

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v57, 8);

    _Block_object_dispose(&v67, 8);
  }
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (NSString)signatureHeader
{
  return self->_signatureHeader;
}

- (void)setSignatureHeader:(id)a3
{
}

- (NSString)skAuthHeader
{
  return self->_skAuthHeader;
}

- (void)setSkAuthHeader:(id)a3
{
}

- (NSString)baaAttestationHeader
{
  return self->_baaAttestationHeader;
}

- (void)setBaaAttestationHeader:(id)a3
{
}

- (NSString)baaSignatureHeader
{
  return self->_baaSignatureHeader;
}

- (void)setBaaSignatureHeader:(id)a3
{
}

- (NSData)requestBodyDataForSignature
{
  return self->_requestBodyDataForSignature;
}

- (void)setRequestBodyDataForSignature:(id)a3
{
}

- (NSUUID)activationLockRequestUUID
{
  return self->_activationLockRequestUUID;
}

- (void)setActivationLockRequestUUID:(id)a3
{
}

- (int64_t)baaIdentityTimeoutIntervalInSec
{
  return self->_baaIdentityTimeoutIntervalInSec;
}

- (void)setBaaIdentityTimeoutIntervalInSec:(int64_t)a3
{
  self->_baaIdentityTimeoutIntervalInSec = a3;
}

- (NSString)commandID
{
  return self->_commandID;
}

- (void)setCommandID:(id)a3
{
}

- (NSString)signatureError
{
  return self->_signatureError;
}

- (void)setSignatureError:(id)a3
{
}

- (NSString)baaError
{
  return self->_baaError;
}

- (void)setBaaError:(id)a3
{
}

- (NSString)baaErrorDescription
{
  return self->_baaErrorDescription;
}

- (void)setBaaErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baaErrorDescription, 0);
  objc_storeStrong((id *)&self->_baaError, 0);
  objc_storeStrong((id *)&self->_signatureError, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
  objc_storeStrong((id *)&self->_activationLockRequestUUID, 0);
  objc_storeStrong((id *)&self->_requestBodyDataForSignature, 0);
  objc_storeStrong((id *)&self->_baaSignatureHeader, 0);
  objc_storeStrong((id *)&self->_baaAttestationHeader, 0);
  objc_storeStrong((id *)&self->_skAuthHeader, 0);
  objc_storeStrong((id *)&self->_signatureHeader, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end