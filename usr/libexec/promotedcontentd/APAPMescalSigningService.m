@interface APAPMescalSigningService
- (APAPMescalSigningService)initWithInterval:(unint64_t)a3;
- (APMescalSigningSettings)mescalSigningSettings;
- (APMescalSigningStateChangedDelegate)delegate;
- (BOOL)initializeFairPlay;
- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5;
- (FPSAPContextOpaque_)session;
- (FairPlayHWInfo_)hwInfo;
- (id)rawSignatureForData:(id)a3 error:(id *)a4;
- (unint64_t)intervalId;
- (unsigned)version;
- (void)certificateRetrievalDidFinish:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)fairPlaySAPExchange:(id)a3 certificateIsCached:(BOOL)a4;
- (void)requestCertificate;
- (void)retrySetup;
- (void)setDelegate:(id)a3;
- (void)setHwInfo:(FairPlayHWInfo_ *)a3;
- (void)setMescalSigningSettings:(id)a3;
- (void)setSession:(FPSAPContextOpaque_ *)a3;
- (void)setState:(int64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setup;
- (void)setupNegotiationStepDidFinish:(id)a3 certificateIsCached:(BOOL)a4 error:(id)a5;
- (void)setupRequestSigningWithCachedCertificate:(BOOL)a3;
@end

@implementation APAPMescalSigningService

- (APAPMescalSigningService)initWithInterval:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)APAPMescalSigningService;
  v4 = [(APAPMescalSigningService *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_intervalId = a3;
    v4->_version = 200;
    uint64_t v6 = +[APMescalSigningSettings settings];
    mescalSigningSettings = v5->_mescalSigningSettings;
    v5->_mescalSigningSettings = (APMescalSigningSettings *)v6;
  }
  return v5;
}

- (void)setup
{
}

- (void)retrySetup
{
}

- (void)setState:(int64_t)a3
{
  v5 = [(APAPMescalSigningService *)self delegate];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    [WeakRetained mescalStateChanged:a3];
  }
}

- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v8 options:0];
  if (!v10)
  {
    if (a5)
    {
      CFStringRef v32 = @"reason";
      CFStringRef v33 = @"Unable to decode signature string.";
      v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      *a5 = +[NSError errorWithDomain:@"com.apple.ap.MescalSigning" code:1102 userInfo:v22];
    }
    v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643075;
      v25 = "-[APAPMescalSigningService signatureIsValid:data:error:]";
      __int16 v26 = 2117;
      *(void *)v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Unable to decode signature string %{sensitive}@; cannot verify signature.",
        buf,
        0x16u);
    }
    goto LABEL_12;
  }
  id v11 = [v9 mutableCopy];
  [(APAPMescalSigningService *)self session];
  id v12 = v10;
  [v12 bytes];
  [v12 length];
  id v13 = v11;
  [v13 mutableBytes];
  [v13 length];
  sub_10004767C();
  uint64_t v15 = v14;

  BOOL v16 = v15 == 0;
  if (v15)
  {
    v17 = [v12 base64EncodedStringWithOptions:32];
    if (a5)
    {
      CFStringRef v30 = @"reason";
      v18 = +[NSString stringWithFormat:@"Signature validation failed with error %d.", v15];
      v31 = v18;
      +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v20 = id v19 = v9;
      *a5 = +[NSError errorWithDomain:@"com.apple.ap.MescalSigning" code:1103 userInfo:v20];

      id v9 = v19;
    }
    v21 = APLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643587;
      v25 = "-[APAPMescalSigningService signatureIsValid:data:error:]";
      __int16 v26 = 1024;
      *(_DWORD *)v27 = v15;
      *(_WORD *)&v27[4] = 2117;
      *(void *)&v27[6] = v8;
      __int16 v28 = 2117;
      v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Signature validation failed with error %d\nBase64-encoded signature: %{sensitive}@\nBase64-encoded body: %{sensitive}@", buf, 0x26u);
    }

LABEL_12:
    BOOL v16 = 0;
  }

  return v16;
}

- (id)rawSignatureForData:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  unsigned int v18 = 0;
  id v6 = a3;
  v7 = [(APAPMescalSigningService *)self session];
  id v8 = v6;
  id v9 = [v8 bytes];
  id v10 = [v8 length];

  sub_100028FDC((uint64_t)v7, (uint64_t)v9, (uint64_t)v10, (uint64_t)&v19, (uint64_t)&v18);
  if (v11)
  {
    uint64_t v12 = v11;
    if (v19) {
      sub_100026968(v19);
    }
    if (a4)
    {
      CFStringRef v24 = @"reason";
      id v13 = +[NSString stringWithFormat:@"failed with error code %d.", v12];
      v25 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.ap.MescalSigning" code:1104 userInfo:v14];
    }
    uint64_t v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643075;
      v21 = "-[APAPMescalSigningService rawSignatureForData:error:]";
      __int16 v22 = 1024;
      int v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: FairPlaySAPSign failed with error code %d. Unable to generate signature - disabling request signing.", buf, 0x12u);
    }

    [(APAPMescalSigningService *)self setState:3];
    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = +[NSData dataWithBytes:v19 length:v18];
    sub_100026968(v19);
  }

  return v16;
}

- (BOOL)initializeFairPlay
{
  if ([(APAPMescalSigningService *)self session])
  {
    sub_1000198E0((uint64_t)[(APAPMescalSigningService *)self session]);
    [(APAPMescalSigningService *)self setSession:0];
  }
  sub_10004923C(0, 0, (uint64_t)&self->_hwInfo);
  if (v3)
  {
    int v4 = v3;
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136643075;
      uint64_t v12 = "-[APAPMescalSigningService initializeFairPlay]";
      __int16 v13 = 1026;
      int v14 = v4;
      id v6 = "[%{sensitive}s]: FairPlayGetHWInfo returned %{public}d";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v11, 0x12u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  sub_100025DE8((uint64_t)&self->_session, (uint64_t)&self->_hwInfo);
  int v8 = v7;
  id v9 = APLogForCategory();
  v5 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136643075;
      uint64_t v12 = "-[APAPMescalSigningService initializeFairPlay]";
      __int16 v13 = 1026;
      int v14 = v8;
      id v6 = "[%{sensitive}s]: FairPlaySAPInit returned %{public}d";
      goto LABEL_9;
    }
LABEL_10:

    [(APAPMescalSigningService *)self setState:3];
    return 0;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136642819;
    uint64_t v12 = "-[APAPMescalSigningService initializeFairPlay]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Fairplay initialized successfully.", (uint8_t *)&v11, 0xCu);
  }

  return 1;
}

- (void)dealloc
{
  if ([(APAPMescalSigningService *)self session]) {
    sub_1000198E0((uint64_t)[(APAPMescalSigningService *)self session]);
  }
  v3.receiver = self;
  v3.super_class = (Class)APAPMescalSigningService;
  [(APAPMescalSigningService *)&v3 dealloc];
}

- (void)setupRequestSigningWithCachedCertificate:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = APPerfLogForCategory();
  unint64_t v6 = [(APAPMescalSigningService *)self intervalId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Initialize Fairplay", "", (uint8_t *)&v18, 2u);
    }
  }

  if ([(APAPMescalSigningService *)self initializeFairPlay])
  {
    int v8 = APPerfLogForCategory();
    unint64_t v9 = [(APAPMescalSigningService *)self intervalId];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v10, "Initialize Fairplay", "", (uint8_t *)&v18, 2u);
      }
    }

    if (!v3)
    {
      [(APAPMescalSigningService *)self requestCertificate];
      return;
    }
    int v11 = [(APAPMescalSigningService *)self mescalSigningSettings];
    uint64_t v12 = [v11 cachedCertificate];

    __int16 v13 = APLogForCategory();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Beginning Mescal negotiation with a cached certificate.", (uint8_t *)&v18, 2u);
      }

      [(APAPMescalSigningService *)self fairPlaySAPExchange:v12 certificateIsCached:1];
    }
    else
    {
      if (v14)
      {
        int v18 = 136642819;
        uint64_t v19 = "-[APAPMescalSigningService setupRequestSigningWithCachedCertificate:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: No cached Mescal certificate available.", (uint8_t *)&v18, 0xCu);
      }

      [(APAPMescalSigningService *)self requestCertificate];
    }
  }
  else
  {
    uint64_t v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136642819;
      uint64_t v19 = "-[APAPMescalSigningService setupRequestSigningWithCachedCertificate:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Fairplay initialization failed.", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v12 = APPerfLogForCategory();
    unint64_t v16 = [(APAPMescalSigningService *)self intervalId];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v12))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v17, "Initialize Fairplay", "", (uint8_t *)&v18, 2u);
      }
    }
  }
}

- (void)requestCertificate
{
  BOOL v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136642819;
    unint64_t v9 = "-[APAPMescalSigningService requestCertificate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Requesting Mescal certificate from AdServer", buf, 0xCu);
  }

  int v4 = APPerfLogForCategory();
  unint64_t v5 = [(APAPMescalSigningService *)self intervalId];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Request Certificate", "", buf, 2u);
    }
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010DC88;
  v7[3] = &unk_1002362A8;
  v7[4] = self;
  +[APMescalSigningLegacyInterface requestCertificateWithCompletion:v7];
}

- (void)fairPlaySAPExchange:(id)a3 certificateIsCached:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_signpost_id_t v7 = APPerfLogForCategory();
  unint64_t v8 = [(APAPMescalSigningService *)self intervalId];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SAP Exchange", "", buf, 2u);
    }
  }

  uint64_t v41 = 0;
  unsigned int v40 = 0;
  char v39 = -1;
  os_signpost_id_t v10 = +[NSDate date];
  [v10 timeIntervalSince1970];
  double v12 = v11;

  uint64_t v13 = [(APAPMescalSigningService *)self version];
  BOOL v14 = [(APAPMescalSigningService *)self session];
  id v15 = v6;
  id v16 = [v15 bytes];
  id v17 = [v15 length];

  sub_10004C714(v13, (uint64_t)&self->_hwInfo, (uint64_t)v14, (uint64_t)v16, (uint64_t)v17, (uint64_t)&v41, (uint64_t)&v40, (uint64_t)&v39);
  int v19 = v18;
  v20 = +[NSDate date];
  [v20 timeIntervalSince1970];
  double v22 = v21;

  int v23 = APPerfLogForCategory();
  unint64_t v24 = [(APAPMescalSigningService *)self intervalId];
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v25, "SAP Exchange", "", buf, 2u);
    }
  }

  __int16 v26 = APLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136643075;
    v43 = "-[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:]";
    __int16 v44 = 2048;
    double v45 = v22 - v12;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: FairPlaySAPExchange took %.2f seconds", buf, 0x16u);
  }

  if (v39 == 1)
  {
    id v27 = objc_alloc((Class)NSData);
    id v28 = [v27 initWithBytes:v41 length:v40];
  }
  else
  {
    id v28 = 0;
  }
  sub_100026968(v41);
  if (v39 != -1)
  {
    if (v39)
    {
      if (v39 == 1)
      {
        v29 = APPerfLogForCategory();
        unint64_t v30 = [(APAPMescalSigningService *)self intervalId];
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v31 = v30;
          if (os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v31, "SAP Negotiating", "", buf, 2u);
          }
        }

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10010E214;
        v37[3] = &unk_1002362D0;
        v37[4] = self;
        BOOL v38 = v4;
        +[APMescalSigningLegacyInterface requestMescalSetupForData:v28 completionHandler:v37];
      }
      else
      {
        v36 = +[NSString stringWithFormat:@"FairPlaySAPExchange returned unexpected code: %d.", v39];
        APSimulateCrash();
      }
      goto LABEL_29;
    }
    v34 = self;
    uint64_t v35 = 2;
LABEL_28:
    [(APAPMescalSigningService *)v34 setState:v35];
    goto LABEL_29;
  }
  CFStringRef v32 = APLogForCategory();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  if (!v4)
  {
    if (v33)
    {
      *(_DWORD *)buf = 136643075;
      v43 = "-[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:]";
      __int16 v44 = 1026;
      LODWORD(v45) = v19;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Negotiation using a fresh certificate failed with error %{public}d; request signing will be disabled.",
        buf,
        0x12u);
    }

    v34 = self;
    uint64_t v35 = 3;
    goto LABEL_28;
  }
  if (v33)
  {
    *(_DWORD *)buf = 136643075;
    v43 = "-[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:]";
    __int16 v44 = 1026;
    LODWORD(v45) = v19;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Negotiation using cached certificate failed with error %{public}d; requesting a fresh certificate"
      " and trying again.",
      buf,
      0x12u);
  }

  [(APAPMescalSigningService *)self requestCertificate];
LABEL_29:
}

- (void)certificateRetrievalDidFinish:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v7 code];
      os_signpost_id_t v10 = [v7 localizedDescription];
      int v16 = 136643331;
      id v17 = "-[APAPMescalSigningService certificateRetrievalDidFinish:error:]";
      __int16 v18 = 2048;
      id v19 = v9;
      __int16 v20 = 2114;
      double v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Error %ld retrieving Mescal certificate from AdServer - %{public}@. Requests will not be signed.", (uint8_t *)&v16, 0x20u);
    }
    double v11 = self;
    uint64_t v12 = 3;
LABEL_5:
    [(APAPMescalSigningService *)v11 setState:v12];
    goto LABEL_10;
  }
  uint64_t v13 = APLogForCategory();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v14)
    {
      int v16 = 136642819;
      id v17 = "-[APAPMescalSigningService certificateRetrievalDidFinish:error:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Server returned an empty certificate for Mescal setup; requests will not be signed.",
        (uint8_t *)&v16,
        0xCu);
    }

    double v11 = self;
    uint64_t v12 = 4;
    goto LABEL_5;
  }
  if (v14)
  {
    int v16 = 136642819;
    id v17 = "-[APAPMescalSigningService certificateRetrievalDidFinish:error:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Successfully retrieved certificate; continuing negotiation.",
      (uint8_t *)&v16,
      0xCu);
  }

  id v15 = [(APAPMescalSigningService *)self mescalSigningSettings];
  [v15 setCachedCertificate:v6];

  [(APAPMescalSigningService *)self fairPlaySAPExchange:v6 certificateIsCached:0];
LABEL_10:
}

- (void)setupNegotiationStepDidFinish:(id)a3 certificateIsCached:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    os_signpost_id_t v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v9 code];
      uint64_t v12 = [v9 localizedDescription];
      int v14 = 136643331;
      id v15 = "-[APAPMescalSigningService setupNegotiationStepDidFinish:certificateIsCached:error:]";
      __int16 v16 = 2050;
      id v17 = v11;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Mescal negotiation failed with error code %{public}ld. %{public}@", (uint8_t *)&v14, 0x20u);
    }
LABEL_4:

    [(APAPMescalSigningService *)self setState:3];
    goto LABEL_9;
  }
  uint64_t v13 = APLogForCategory();
  os_signpost_id_t v10 = v13;
  if (!v8)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136642819;
      id v15 = "-[APAPMescalSigningService setupNegotiationStepDidFinish:certificateIsCached:error:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to retrieve Mescal negotiation response; requests will not be signed.",
        (uint8_t *)&v14,
        0xCu);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136642819;
    id v15 = "-[APAPMescalSigningService setupNegotiationStepDidFinish:certificateIsCached:error:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Successfully retrieved setup buffer; continuing negotiation.",
      (uint8_t *)&v14,
      0xCu);
  }

  [(APAPMescalSigningService *)self fairPlaySAPExchange:v8 certificateIsCached:v6];
LABEL_9:
}

- (APMescalSigningStateChangedDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (APMescalSigningStateChangedDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (FPSAPContextOpaque_)session
{
  return self->_session;
}

- (void)setSession:(FPSAPContextOpaque_ *)a3
{
  self->_session = a3;
}

- (FairPlayHWInfo_)hwInfo
{
  *retstr = self[2];
  return self;
}

- (void)setHwInfo:(FairPlayHWInfo_ *)a3
{
  long long v3 = *(_OWORD *)&a3->IDLength;
  *(void *)&self->_hwInfo.ID[12] = *(void *)&a3->ID[12];
  *(_OWORD *)&self->_hwInfo.IDLength = v3;
}

- (APMescalSigningSettings)mescalSigningSettings
{
  return self->_mescalSigningSettings;
}

- (void)setMescalSigningSettings:(id)a3
{
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mescalSigningSettings, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end