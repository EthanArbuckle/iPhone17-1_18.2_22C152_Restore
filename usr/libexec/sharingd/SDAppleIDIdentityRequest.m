@interface SDAppleIDIdentityRequest
- (NSString)appleID;
- (OS_dispatch_queue)dispatchQueue;
- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3;
- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5;
- (id)certificateTokenHandler;
- (id)responseHandler;
- (void)_activate;
- (void)_handleCertificate:(__SecCertificate *)a3 intermediateCertificate:(__SecCertificate *)a4 withTrustResult:(BOOL)a5 error:(int)a6;
- (void)_handleCertificateCreateResponseError:(id)a3;
- (void)_handleCertificateCreateResponseWithInfo:(id)a3 error:(id)a4;
- (void)_handleCertificateFetchResponseError:(id)a3;
- (void)_handleCertificateFetchResponseWithInfo:(id)a3 error:(id)a4;
- (void)_handleCreateTimerFired;
- (void)_handleFetchTimerFired;
- (void)_handleKeyPairAvailable;
- (void)_handleReceivedCertificate;
- (void)_invalidate;
- (void)_responseHandlerWithIdentity:(id)a3 error:(id)a4;
- (void)_scheduleCreateCertificateTaskWithDelay:(unint64_t)a3;
- (void)_scheduleCreateRetryWithDelay:(unint64_t)a3;
- (void)_scheduleFetchCertificateTaskWithDelay:(unint64_t)a3;
- (void)_scheduleFetchRetryWithDelay:(unint64_t)a3;
- (void)_sendCreateCertificateRequest;
- (void)_sendFetchCertificateRequest;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setCertificateTokenHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation SDAppleIDIdentityRequest

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activated)
  {
    if (dword_100967F28 > 60 || dword_100967F28 == -1 && !_LogCategory_Initialize()) {
      return;
    }
  }
  else
  {
    if (!self->_invalidated)
    {
      if (dword_100967F28 <= 30 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (self->_certificateToken && self->_privateKeyPersistentReference)
      {
        if (dword_100967F28 <= 30 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(SDAppleIDIdentityRequest *)self _sendFetchCertificateRequest];
      }
      else
      {
        [(SDAppleIDIdentityRequest *)self _sendCreateCertificateRequest];
      }
      self->_activated = 1;
      return;
    }
    if (dword_100967F28 > 60 || dword_100967F28 == -1 && !_LogCategory_Initialize()) {
      return;
    }
  }

  LogPrintF();
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100967F28 <= 30 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    createDelayTimer = self->_createDelayTimer;
    if (createDelayTimer)
    {
      v4 = createDelayTimer;
      dispatch_source_cancel(v4);
      v5 = self->_createDelayTimer;
      self->_createDelayTimer = 0;
    }
    [(SDAppleIDServerTask *)self->_certificateCreateTask setResponseHandler:0];
    [(SDAppleIDServerTask *)self->_certificateCreateTask invalidate];
    certificateCreateTask = self->_certificateCreateTask;
    self->_certificateCreateTask = 0;

    fetchDelayTimer = self->_fetchDelayTimer;
    if (fetchDelayTimer)
    {
      v8 = fetchDelayTimer;
      dispatch_source_cancel(v8);
      v9 = self->_fetchDelayTimer;
      self->_fetchDelayTimer = 0;
    }
    [(SDAppleIDServerTask *)self->_certificateFetchTask setResponseHandler:0];
    [(SDAppleIDServerTask *)self->_certificateFetchTask invalidate];
    certificateFetchTask = self->_certificateFetchTask;
    self->_certificateFetchTask = 0;

    if (self->_activated)
    {
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      v12 = (void *)v11;
      CFStringRef v13 = @"?";
      if (v11) {
        CFStringRef v13 = (const __CFString *)v11;
      }
      CFStringRef v17 = v13;
      v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6723 userInfo:v14];
      [(SDAppleIDIdentityRequest *)self _responseHandlerWithIdentity:0 error:v15];
    }
    self->_invalidated = 1;
  }
}

- (void)dealloc
{
  privateKey = self->_privateKey;
  if (privateKey) {
    CFRelease(privateKey);
  }
  publicKey = self->_publicKey;
  if (publicKey) {
    CFRelease(publicKey);
  }
  v5.receiver = self;
  v5.super_class = (Class)SDAppleIDIdentityRequest;
  [(SDAppleIDIdentityRequest *)&v5 dealloc];
}

- (void)_handleCertificateCreateResponseError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100967F28 <= 90 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
  {
    v4 = [v5 localizedDescription];
    LogPrintF();
  }
  -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v5, v4);
}

- (void)_handleCertificateCreateResponseWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDAppleIDServerTask *)self->_certificateCreateTask invalidate];
  certificateCreateTask = self->_certificateCreateTask;
  self->_certificateCreateTask = 0;

  if (v7)
  {
    id v11 = v7;
    v9 = 0;
    goto LABEL_20;
  }
  if (!v6)
  {
    v9 = 0;
    uint64_t v15 = -6705;
LABEL_19:
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v15, 0, v16);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11) {
      goto LABEL_15;
    }
LABEL_20:
    [(SDAppleIDIdentityRequest *)self _handleCertificateCreateResponseError:v11];

    id v11 = 0;
    goto LABEL_15;
  }
  if (dword_100967F28 <= 30 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v6;
    LogPrintF();
  }
  CFStringGetTypeID();
  v9 = CFDictionaryGetTypedValue();
  if (!v9
    || (objc_storeStrong((id *)&self->_altDSID, v9),
        CFStringGetTypeID(),
        CFDictionaryGetTypedValue(),
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v15 = -6712;
    goto LABEL_19;
  }
  id v11 = v10;
  objc_storeStrong((id *)&self->_certificateToken, v10);
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged) {
    uint64_t v13 = Int64Ranged;
  }
  else {
    uint64_t v13 = 60;
  }
  -[SDAppleIDIdentityRequest _scheduleFetchCertificateTaskWithDelay:](self, "_scheduleFetchCertificateTaskWithDelay:", v13, v16);
  certificateTokenHandler = (void (**)(id, NSString *))self->_certificateTokenHandler;
  if (certificateTokenHandler && self->_privateKeyPersistentReference) {
    certificateTokenHandler[2](certificateTokenHandler, self->_certificateToken);
  }
LABEL_15:
}

- (void)_handleCertificateFetchResponseError:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100967F28 <= 90 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v9;
    LogPrintF();
  }
  if (NSErrorToOSStatus() == -6712 && self->_fetchRetryCount <= 2)
  {
    v4 = [v9 userInfo];
    unint64_t Int64 = CFDictionaryGetInt64();

    uint64_t v6 = 7200;
    if (Int64 < 0x1C20) {
      uint64_t v6 = Int64;
    }
    if (Int64) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 60;
    }
    -[SDAppleIDIdentityRequest _scheduleFetchRetryWithDelay:](self, "_scheduleFetchRetryWithDelay:", v7, v8);
  }
  else
  {
    -[SDAppleIDIdentityRequest _responseHandlerWithIdentity:error:](self, "_responseHandlerWithIdentity:error:", 0, v9, v8);
  }
}

- (void)_handleCertificateFetchResponseWithInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDAppleIDServerTask *)self->_certificateFetchTask invalidate];
  certificateFetchTask = self->_certificateFetchTask;
  self->_certificateFetchTask = 0;

  if (v7)
  {
    id v30 = v7;
    uint64_t v13 = 0;
    v10 = 0;
    goto LABEL_66;
  }
  if (!v6)
  {
    NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
    uint64_t v31 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    v32 = (void *)v31;
    CFStringRef v33 = @"?";
    if (v31) {
      CFStringRef v33 = (const __CFString *)v31;
    }
    CFStringRef v82 = v33;
    v34 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    NSErrorDomain v35 = NSOSStatusErrorDomain;
    uint64_t v36 = -6705;
    goto LABEL_51;
  }
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  if (!v9)
  {
    NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
    uint64_t v37 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    v32 = (void *)v37;
    CFStringRef v38 = @"?";
    if (v37) {
      CFStringRef v38 = (const __CFString *)v37;
    }
    CFStringRef v80 = v38;
    v34 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    NSErrorDomain v35 = NSOSStatusErrorDomain;
    uint64_t v36 = -6712;
LABEL_51:
    id v30 = +[NSError errorWithDomain:v35 code:v36 userInfo:v34];

    v10 = 0;
LABEL_59:
    uint64_t v13 = 0;
    goto LABEL_65;
  }
  v10 = v9;
  altDSID = self->_altDSID;
  if (!altDSID)
  {
    objc_storeStrong((id *)&self->_altDSID, v9);
    altDSID = self->_altDSID;
  }
  if (([v10 isEqualToString:altDSID] & 1) == 0)
  {
    NSErrorDomain v39 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
    uint64_t v40 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    v41 = (void *)v40;
    CFStringRef v42 = @"?";
    if (v40) {
      CFStringRef v42 = (const __CFString *)v40;
    }
    CFStringRef v78 = v42;
    v43 = &v78;
    v44 = &v77;
    goto LABEL_58;
  }
  CFStringGetTypeID();
  v12 = CFDictionaryGetTypedValue();
  if (!v12)
  {
    NSErrorDomain v39 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
    uint64_t v45 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    v41 = (void *)v45;
    CFStringRef v46 = @"?";
    if (v45) {
      CFStringRef v46 = (const __CFString *)v45;
    }
    CFStringRef v76 = v46;
    v43 = &v76;
    v44 = &v75;
LABEL_58:
    v47 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v44 count:1];
    id v30 = +[NSError errorWithDomain:v39 code:-6712 userInfo:v47];

    goto LABEL_59;
  }
  uint64_t v13 = v12;
  if (([v12 isEqualToString:self->_certificateToken] & 1) == 0)
  {
    NSErrorDomain v48 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
    uint64_t v49 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    v50 = (void *)v49;
    CFStringRef v51 = @"?";
    if (v49) {
      CFStringRef v51 = (const __CFString *)v49;
    }
    CFStringRef v74 = v51;
    v52 = &v74;
    v53 = &v73;
LABEL_63:
    v54 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v53 count:1];
    id v30 = +[NSError errorWithDomain:v48 code:-6712 userInfo:v54];

LABEL_65:
    if (!v30) {
      goto LABEL_32;
    }
LABEL_66:
    [(SDAppleIDIdentityRequest *)self _handleCertificateFetchResponseError:v30];

    goto LABEL_32;
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  unint64_t certificateStatus = Int64Ranged;
  self->_unint64_t certificateStatus = Int64Ranged;
  switch(Int64Ranged)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      if (dword_100967F28 > 60) {
        goto LABEL_30;
      }
      if (dword_100967F28 != -1) {
        goto LABEL_12;
      }
      if (_LogCategory_Initialize())
      {
        unint64_t certificateStatus = self->_certificateStatus;
LABEL_12:
        if (certificateStatus > 5) {
          CFStringRef v16 = @"?";
        }
        else {
          CFStringRef v16 = *(&off_1008CDFB8 + certificateStatus);
        }
        unint64_t v63 = certificateStatus;
        CFStringRef v64 = v16;
        LogPrintF();
      }
LABEL_30:
      if (self->_createRetryCount >= 3) {
        goto LABEL_64;
      }
      [(SDAppleIDIdentityRequest *)self _scheduleCreateRetryWithDelay:5];
      goto LABEL_32;
    case 1:
      CFDateGetTypeID();
      CFDictionaryGetTypedValue();
      CFStringRef v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      certificateExpirationDate = self->_certificateExpirationDate;
      self->_certificateExpirationDate = v17;

      if (!self->_certificateExpirationDate)
      {
        NSErrorDomain v48 = NSOSStatusErrorDomain;
        NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
        uint64_t v55 = +[NSString stringWithUTF8String:DebugGetErrorString()];
        v50 = (void *)v55;
        CFStringRef v56 = @"?";
        if (v55) {
          CFStringRef v56 = (const __CFString *)v55;
        }
        CFStringRef v72 = v56;
        v52 = &v72;
        v53 = &v71;
        goto LABEL_63;
      }
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      certificatePEM = self->_certificatePEM;
      self->_certificatePEM = v19;

      if (!self->_certificatePEM)
      {
        NSErrorDomain v48 = NSOSStatusErrorDomain;
        NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
        uint64_t v57 = +[NSString stringWithUTF8String:DebugGetErrorString()];
        v50 = (void *)v57;
        CFStringRef v58 = @"?";
        if (v57) {
          CFStringRef v58 = (const __CFString *)v57;
        }
        CFStringRef v70 = v58;
        v52 = &v70;
        v53 = &v69;
        goto LABEL_63;
      }
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      certificateSerialNumber = self->_certificateSerialNumber;
      self->_certificateSerialNumber = v21;

      if (!self->_certificateSerialNumber)
      {
        NSErrorDomain v48 = NSOSStatusErrorDomain;
        NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
        uint64_t v59 = +[NSString stringWithUTF8String:DebugGetErrorString()];
        v50 = (void *)v59;
        CFStringRef v60 = @"?";
        if (v59) {
          CFStringRef v60 = (const __CFString *)v59;
        }
        CFStringRef v68 = v60;
        v52 = &v68;
        v53 = &v67;
        goto LABEL_63;
      }
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      intermediateCertificatePEM = self->_intermediateCertificatePEM;
      self->_intermediateCertificatePEM = v23;

      if (!self->_intermediateCertificatePEM)
      {
        NSErrorDomain v48 = NSOSStatusErrorDomain;
        NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
        uint64_t v61 = +[NSString stringWithUTF8String:DebugGetErrorString()];
        v50 = (void *)v61;
        CFStringRef v62 = @"?";
        if (v61) {
          CFStringRef v62 = (const __CFString *)v61;
        }
        CFStringRef v66 = v62;
        v52 = &v66;
        v53 = &v65;
        goto LABEL_63;
      }
      [(SDAppleIDIdentityRequest *)self _handleReceivedCertificate];
      goto LABEL_32;
    case 2:
      if (dword_100967F28 > 60) {
        goto LABEL_36;
      }
      if (dword_100967F28 != -1)
      {
        CFStringRef v25 = @"Pending";
        unint64_t v26 = 2;
LABEL_25:
        unint64_t v63 = v26;
        CFStringRef v64 = v25;
        LogPrintF();
        goto LABEL_36;
      }
      if (_LogCategory_Initialize())
      {
        unint64_t v26 = self->_certificateStatus;
        if (v26 > 5) {
          CFStringRef v25 = @"?";
        }
        else {
          CFStringRef v25 = *(&off_1008CDFB8 + v26);
        }
        goto LABEL_25;
      }
LABEL_36:
      unsigned int v27 = CFDictionaryGetInt64Ranged();
      if (self->_fetchRetryCount >= 3)
      {
LABEL_64:
        +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAppleIDErrorDomain, 201227, 0, v63, v64);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_65;
      }
      uint64_t v28 = v27;
      if (v27 >= 0x1C20uLL) {
        uint64_t v28 = 7200;
      }
      if (v27) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 60;
      }
      -[SDAppleIDIdentityRequest _scheduleFetchRetryWithDelay:](self, "_scheduleFetchRetryWithDelay:", v29, v63, v64);
LABEL_32:

      return;
    default:
      if (dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_32;
  }
}

- (void)_handleCertificate:(__SecCertificate *)a3 intermediateCertificate:(__SecCertificate *)a4 withTrustResult:(BOOL)a5 error:(int)a6
{
  BOOL v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = &NSCalendarIdentifierGregorian_ptr;
  if (a6)
  {
    v10 = 0;
    uint64_t v37 = 0;
    id v38 = 0;
    id v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_47;
  }
  a6 = 201209;
  if (!v7)
  {
    v10 = 0;
    uint64_t v37 = 0;
    id v38 = 0;
    id v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    a6 = 201219;
    goto LABEL_47;
  }
  if (dword_100967F28 <= 50 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_altDSID || !self->_appleID || !self->_privateKeyPersistentReference)
  {
    v10 = 0;
    uint64_t v37 = 0;
    id v38 = 0;
    id v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    a6 = -6709;
    goto LABEL_47;
  }
  int v14 = SFAppleIDExpirationDateForCertificate();
  uint64_t v15 = (NSString *)0;
  if (v14 && dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSDate *)self->_certificateExpirationDate timeIntervalSinceDate:v15];
  if (v15)
  {
    if (v16 < 0.0) {
      double v16 = -v16;
    }
    if (v16 > 2592000.0 && dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
    {
      appleID = v15;
      certificateExpirationDate = self->_certificateExpirationDate;
      LogPrintF();
    }
  }
  int v17 = SFAppleIDExpirationDateForCertificate();
  id v18 = 0;
  id v9 = &NSCalendarIdentifierGregorian_ptr;
  if (v17 && dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [v18 timeIntervalSinceNow];
  double v20 = v19;
  if (v19 < 7776000.0 && dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
  {
    double v36 = v20;
    appleID = (NSString *)v18;
    LogPrintF();
  }
  id v38 = v18;
  int v21 = SFAppleIDCommonNameForCertificate();
  v22 = (NSString *)0;
  uint64_t v37 = v22;
  if (v21)
  {
    uint64_t v13 = v15;
    v10 = 0;
    id v11 = 0;
    id v12 = 0;
    a6 = v21;
    goto LABEL_47;
  }
  v23 = v22;
  if (![(NSString *)v22 hasPrefix:@"com.apple.idms.appleid."])
  {
    uint64_t v13 = v15;
    if (dword_100967F28 <= 90 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
    {
      appleID = v37;
      LogPrintF();
    }
    v10 = 0;
    id v11 = 0;
    id v12 = 0;
    goto LABEL_47;
  }
  v24 = +[NSString stringWithFormat:@"Apple ID authorization certificate for %@", self->_appleID];
  a6 = SFAppleIDAddCertificateToKeychain();
  id v12 = 0;

  if (a6)
  {
    uint64_t v13 = v15;
    v10 = 0;
LABEL_46:
    id v11 = 0;
    goto LABEL_47;
  }
  if (![v12 length])
  {
    uint64_t v13 = v15;
    v10 = 0;
LABEL_67:
    id v11 = 0;
    a6 = -6762;
    goto LABEL_47;
  }
  if (dword_100967F28 <= 50 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
  {
    appleID = self->_appleID;
    LogPrintF();
  }
  a6 = SFAppleIDAddCertificateToKeychain();
  id v25 = 0;
  v10 = v25;
  if (a6)
  {
    uint64_t v13 = v15;
    goto LABEL_46;
  }
  if (![v25 length])
  {
    uint64_t v13 = v15;
    goto LABEL_67;
  }
  v32 = v38;
  if (dword_100967F28 <= 50 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
  {
    appleID = self->_appleID;
    LogPrintF();
  }
  id v11 = +[NSDate date];
  id v33 = [objc_alloc((Class)SFAppleIDIdentity) initWithAppleID:self->_appleID altDSID:self->_altDSID];
  if (v33)
  {
    uint64_t v28 = v33;
    [v33 setAccountIdentifier:v23];
    [v28 setCertificateExpirationDate:self->_certificateExpirationDate];
    [v28 setCertificatePersistentReference:v12];
    [v28 setIntermediateCertificateExpirationDate:v38];
    [v28 setIntermediateCertificatePersistentReference:v10];
    [v28 setLastValidationAttemptDate:v11];
    [v28 setLastValidationDate:v11];
    [v28 setModificationDate:v11];
    [v28 setPrivateKeyPersistentReference:self->_privateKeyPersistentReference];
    [v28 setSerialNumber:self->_certificateSerialNumber];
    [(SDAppleIDIdentityRequest *)self _responseHandlerWithIdentity:v28 error:0];
    goto LABEL_50;
  }
  uint64_t v13 = v15;
  a6 = -6728;
LABEL_47:
  uint64_t v26 = a6;
  NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
  uint64_t v27 = [(NSCalendarIdentifier *)(id)v9[225] stringWithUTF8String:DebugGetErrorString()];
  uint64_t v28 = (void *)v27;
  CFStringRef v29 = @"?";
  if (v27) {
    CFStringRef v29 = (const __CFString *)v27;
  }
  CFStringRef v40 = v29;
  id v30 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, appleID);
  uint64_t v31 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v26 userInfo:v30];
  [(SDAppleIDIdentityRequest *)self _responseHandlerWithIdentity:0 error:v31];

  uint64_t v15 = v13;
  v23 = v37;
  v32 = v38;
LABEL_50:
}

- (void)_handleCreateTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100967F28 <= 20 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  createDelayTimer = self->_createDelayTimer;
  if (createDelayTimer)
  {
    v4 = createDelayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_createDelayTimer;
    self->_createDelayTimer = 0;
  }

  [(SDAppleIDIdentityRequest *)self _sendCreateCertificateRequest];
}

- (void)_handleFetchTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100967F28 <= 20 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  fetchDelayTimer = self->_fetchDelayTimer;
  if (fetchDelayTimer)
  {
    v4 = fetchDelayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_fetchDelayTimer;
    self->_fetchDelayTimer = 0;
  }

  [(SDAppleIDIdentityRequest *)self _sendFetchCertificateRequest];
}

- (void)_handleReceivedCertificate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_appleID)
  {
    int v3 = SFAppleIDCreateCertificateWithPEMString();
    if (!v3) {
      int v3 = -6762;
    }
  }
  else
  {
    int v3 = -6709;
  }
  uint64_t v4 = v3;
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  uint64_t v5 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  id v6 = (void *)v5;
  CFStringRef v7 = @"?";
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  CFStringRef v11 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v4 userInfo:v8];
  [(SDAppleIDIdentityRequest *)self _responseHandlerWithIdentity:0 error:v9];
}

- (void)_handleKeyPairAvailable
{
  if (!self->_appleID)
  {
    uint64_t v5 = 0;
    int v9 = -6705;
    goto LABEL_9;
  }
  if (!self->_privateKey || !self->_publicKey || self->_certificateCreateTask)
  {
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  p_csrPEM = &self->_csrPEM;
  csrPEM = self->_csrPEM;
  if (!csrPEM)
  {
    v11[5] = 0;
    int v9 = SFAppleIDCreateCertificateRequestPEMStringForKeyPair();
    id v10 = 0;
    uint64_t v5 = v10;
    if (v9)
    {
LABEL_9:
      id v6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:0];
      [(SDAppleIDIdentityRequest *)self _responseHandlerWithIdentity:0 error:v6];
      goto LABEL_10;
    }
    if (v10)
    {
      objc_storeStrong((id *)&self->_csrPEM, 0);
      csrPEM = *p_csrPEM;
      goto LABEL_7;
    }
LABEL_14:
    int v9 = -6762;
    goto LABEL_9;
  }
  uint64_t v5 = 0;
LABEL_7:
  CFStringRef v12 = @"csr";
  uint64_t v13 = csrPEM;
  id v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CFStringRef v7 = [[SDAppleIDServerTask alloc] initWithType:0 appleID:self->_appleID info:v6];
  certificateCreateTask = self->_certificateCreateTask;
  self->_certificateCreateTask = v7;

  [(SDAppleIDServerTask *)self->_certificateCreateTask setDispatchQueue:self->_dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10013612C;
  v11[3] = &unk_1008CDF48;
  v11[4] = self;
  [(SDAppleIDServerTask *)self->_certificateCreateTask setResponseHandler:v11];
  [(SDAppleIDServerTask *)self->_certificateCreateTask activate];
LABEL_10:
}

- (void)_responseHandlerWithIdentity:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  CFStringRef v7 = [(SDAppleIDIdentityRequest *)self responseHandler];

  if (v7)
  {
    id v8 = [(SDAppleIDIdentityRequest *)self responseHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);

    [(SDAppleIDIdentityRequest *)self setResponseHandler:0];
  }
}

- (void)_scheduleCreateCertificateTaskWithDelay:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_createDelayTimer)
  {
    if (dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100967F28 <= 30 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    createDelayTimer = self->_createDelayTimer;
    self->_createDelayTimer = v4;

    id v6 = self->_createDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100136374;
    handler[3] = &unk_1008CA4B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    SFDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_createDelayTimer);
  }
}

- (void)_scheduleFetchCertificateTaskWithDelay:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_fetchDelayTimer)
  {
    if (dword_100967F28 <= 60 && (dword_100967F28 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100967F28 <= 30 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    fetchDelayTimer = self->_fetchDelayTimer;
    self->_fetchDelayTimer = v4;

    id v6 = self->_fetchDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100136504;
    handler[3] = &unk_1008CA4B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    SFDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_fetchDelayTimer);
  }
}

- (void)_scheduleCreateRetryWithDelay:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ++self->_createRetryCount;
  if (dword_100967F28 <= 50 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDAppleIDIdentityRequest *)self _scheduleCreateCertificateTaskWithDelay:a3];
}

- (void)_scheduleFetchRetryWithDelay:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ++self->_fetchRetryCount;
  if (dword_100967F28 <= 50 && (dword_100967F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDAppleIDIdentityRequest *)self _scheduleFetchCertificateTaskWithDelay:a3];
}

- (void)_sendCreateCertificateRequest
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_appleID)
  {
    if (self->_certificateCreateTask)
    {
      uint64_t v6 = -6762;
    }
    else
    {
      if (self->_privateKey && self->_publicKey)
      {
        [(SDAppleIDIdentityRequest *)self _handleKeyPairAvailable];
        return;
      }
      int v3 = +[SDStatusMonitor sharedMonitor];
      unsigned int v4 = [v3 deviceWasUnlockedOnce];

      if (v4)
      {
        uint64_t v5 = dispatch_get_global_queue(0, 0);
        SFAppleIDCreateKeyPair();

        return;
      }
      uint64_t v6 = 201226;
    }
  }
  else
  {
    uint64_t v6 = -6705;
  }
  id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
  [(SDAppleIDIdentityRequest *)self _responseHandlerWithIdentity:0 error:v7];
}

- (void)_sendFetchCertificateRequest
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_appleID)
  {
    unsigned int v4 = 0;
    uint64_t v8 = -6705;
    goto LABEL_10;
  }
  certificateToken = self->_certificateToken;
  if (!certificateToken || self->_certificateFetchTask)
  {
    unsigned int v4 = 0;
    goto LABEL_8;
  }
  CFStringRef v11 = @"certificateToken";
  CFStringRef v12 = certificateToken;
  unsigned int v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v5 = [[SDAppleIDServerTask alloc] initWithType:1 appleID:self->_appleID info:v4];
  certificateFetchTask = self->_certificateFetchTask;
  self->_certificateFetchTask = v5;

  id v7 = self->_certificateFetchTask;
  if (!v7)
  {
LABEL_8:
    uint64_t v8 = -6762;
LABEL_10:
    id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v8 userInfo:0];
    [(SDAppleIDIdentityRequest *)self _responseHandlerWithIdentity:0 error:v9];

    goto LABEL_6;
  }
  [(SDAppleIDServerTask *)v7 setDispatchQueue:self->_dispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100136BC0;
  v10[3] = &unk_1008CDF48;
  v10[4] = self;
  [(SDAppleIDServerTask *)self->_certificateFetchTask setResponseHandler:v10];
  [(SDAppleIDServerTask *)self->_certificateFetchTask activate];
LABEL_6:
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136C44;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SDAppleIDIdentityRequest;
  uint64_t v6 = [(SDAppleIDIdentityRequest *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appleID, a3);
    uint64_t v8 = SFMainQueue();
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (SDAppleIDIdentityRequest)initWithAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SDAppleIDIdentityRequest;
  CFStringRef v12 = [(SDAppleIDIdentityRequest *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appleID, a3);
    objc_storeStrong((id *)&v13->_certificateToken, a4);
    objc_storeStrong((id *)&v13->_privateKeyPersistentReference, a5);
    uint64_t v14 = SFMainQueue();
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v14;
  }
  return v13;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136E18;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)certificateTokenHandler
{
  return self->_certificateTokenHandler;
}

- (void)setCertificateTokenHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_certificateTokenHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, 0);
  objc_storeStrong((id *)&self->_intermediateCertificatePEM, 0);
  objc_storeStrong((id *)&self->_fetchDelayTimer, 0);
  objc_storeStrong((id *)&self->_csrPEM, 0);
  objc_storeStrong((id *)&self->_createDelayTimer, 0);
  objc_storeStrong((id *)&self->_certificateToken, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_certificatePEM, 0);
  objc_storeStrong((id *)&self->_certificateFetchTask, 0);
  objc_storeStrong((id *)&self->_certificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_certificateCreateTask, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end