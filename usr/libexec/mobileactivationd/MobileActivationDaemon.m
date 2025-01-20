@interface MobileActivationDaemon
- (BOOL)handleSessionResponse:(id)a3 withError:(id *)a4;
- (BOOL)isEntitled:(id)a3;
- (BOOL)isHostConnection;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)validateActivationDataSignature:(id)a3 activationSignature:(id)a4 withError:(id *)a5;
- (DataArk)dark;
- (MobileActivationDaemon)initWithContext:(id)a3 Queue:(id)a4;
- (NSData)sessionHelloMessage;
- (NSString)activationNonce;
- (NSString)activationSessionClientName;
- (NSString)recertNonce;
- (OS_dispatch_queue)creationQueue;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_queue)xpcQueue;
- (PSCSessionInternal_)session;
- (id)callingProcessName;
- (id)copyUCRTVersionInfoWithError:(id *)a3;
- (id)valueForEntitlement:(id)a3;
- (unint64_t)currentSessionDuration;
- (unint64_t)sessionStartTime;
- (void)copyActivationRecordWithCompletionBlock:(id)a3;
- (void)copyAttestationDictionaryWithCompletionBlock:(id)a3 options:(id)a4 completion:(id)a5;
- (void)copyAutomaticTimeEnabledWithCompletion:(id)a3;
- (void)copyDCRTWithCompletionBlock:(id)a3 withCompletion:(id)a4;
- (void)copyLegacyDeviceIdentityWithCompletionBlock:(id)a3;
- (void)copyMonotonicClockWithCompletionBlock:(id)a3;
- (void)copyPCRTTokenWithCompletionBlock:(id)a3;
- (void)copyRTCResetCountWithCompletionBlock:(id)a3;
- (void)copyUCRTVersionInfoWithCompletionBlock:(id)a3;
- (void)copyUCRTWithCompletionBlock:(id)a3;
- (void)createActivationInfoWithCompletionBlock:(id)a3;
- (void)createTunnel1ActivationInfo:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (void)createTunnel1SessionInfoWithCompletionBlock:(id)a3;
- (void)deactivateDeviceWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(id)a3;
- (void)generateSession:(BOOL)a3;
- (void)getActivationBuildWithCompletionBlock:(id)a3;
- (void)getActivationStateWithCompletionBlock:(id)a3;
- (void)getDCRTStateWithCompletionBlock:(id)a3 withCompletion:(id)a4;
- (void)handleActivationInfo:(id)a3 withCompletionBlock:(id)a4;
- (void)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 completionBlock:(id)a5;
- (void)isDeviceBrickedWithCompletionBlock:(id)a3;
- (void)isInFieldCollectedWithCompletionBlock:(id)a3;
- (void)issueClientCertificateLegacy:(id)a3 WithCompletionBlock:(id)a4;
- (void)issueClientCertificateWithReferenceKey:(id)a3 options:(id)a4 completion:(id)a5;
- (void)issueCollection:(id)a3 withCompletionBlock:(id)a4;
- (void)issueDCRT:(id)a3 withCompletionBlock:(id)a4;
- (void)issueUCRT:(id)a3 withCompletionBlock:(id)a4;
- (void)performMigrationWithCompletion:(id)a3 completion:(id)a4;
- (void)recertifyDeviceWithCompletionBlock:(id)a3;
- (void)requestDeviceReactivationWithCompletionBlock:(id)a3;
- (void)setActivationNonce:(id)a3;
- (void)setActivationSessionClientName:(id)a3;
- (void)setDark:(id)a3;
- (void)setRecertNonce:(id)a3;
- (void)ucrtUpgradeRequiredWithCompletionBlock:(id)a3;
- (void)unbrickDeviceWithCompletionBlock:(id)a3;
- (void)updateBasebandTicket:(id)a3 baaCertData:(id)a4 baaIntermediateCert:(id)a5 options:(id)a6 withCompletionBlock:(id)a7;
@end

@implementation MobileActivationDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MobileActivationProtocol];
  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  v7 = [(MobileActivationDaemon *)self xpcQueue];
  [v5 _setQueue:v7];

  [v5 resume];
  return 1;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)getActivationStateWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, NSDictionary *, void))a3;
  id v5 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    CFStringRef v13 = @"ActivationState";
    CFStringRef v14 = @"Unavailable";
    v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    if (!v4) {
      goto LABEL_8;
    }
LABEL_7:
    v4[2](v4, v10, 0);
    goto LABEL_8;
  }
  v7 = [(MobileActivationDaemon *)self dark];
  id v8 = data_ark_copy(v7, 0, @"ActivationState");
  v9 = (__CFString *)isNSString(v8);

  if (!v9) {
    v9 = @"Unactivated";
  }
  CFStringRef v11 = @"ActivationState";
  v12 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  if (v4) {
    goto LABEL_7;
  }
LABEL_8:
}

- (DataArk)dark
{
  return self->_dark;
}

- (MobileActivationDaemon)initWithContext:(id)a3 Queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MobileActivationDaemon;
  v9 = [(MobileActivationDaemon *)&v18 init];
  v10 = v9;
  if (v9)
  {
    if (!v7) {
      goto LABEL_6;
    }
    if (!v8) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_dark, a3);
    objc_storeStrong((id *)&v10->_xpcQueue, a4);
    CFStringRef v11 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mobileactivationd.xpc.create", v11);
    creationQueue = v10->_creationQueue;
    v10->_creationQueue = (OS_dispatch_queue *)v12;

    if (!v10->_creationQueue
      || (CFStringRef v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
          dispatch_queue_t v15 = dispatch_queue_create("com.apple.mobileactivationd.xpc.session", v14),
          sessionQueue = v10->_sessionQueue,
          v10->_sessionQueue = (OS_dispatch_queue *)v15,
          sessionQueue,
          v14,
          !v10->_sessionQueue))
    {
LABEL_6:

      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  session = self->_session;
  if (session) {
    ZyNF2D9((uint64_t)session);
  }
  v4.receiver = self;
  v4.super_class = (Class)MobileActivationDaemon;
  [(MobileActivationDaemon *)&v4 dealloc];
}

- (unint64_t)currentSessionDuration
{
  v3 = [(MobileActivationDaemon *)self sessionQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (self->_sessionStartTime) {
    return (clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_sessionStartTime) / 0x3B9ACA00;
  }
  else {
    return 0;
  }
}

- (void)generateSession:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MobileActivationDaemon *)self sessionQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  uint64_t v12 = 0;
  unsigned int v11 = 0;
  v10 = 0;
  if (self->_session
    && [(MobileActivationDaemon *)self currentSessionDuration] <= 0x12C
    && !v3)
  {
    goto LABEL_6;
  }
  self->_sessionStartTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v6 = TcswZQtsc8hw((uint64_t)&v10, (uint64_t)&v12, (uint64_t)&v11);
  if (v6)
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0, @"Failed to create handshake request message: %d", v6);
LABEL_6:
    id v7 = 0;
    goto LABEL_7;
  }
  id v8 = objc_alloc((Class)NSData);
  id v7 = [v8 initWithBytes:v12 length:v11];
  if (v7)
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0, @"Generated new DRM session.");
    session = self->_session;
    if (session) {
      ZyNF2D9((uint64_t)session);
    }
    self->_session = v10;
    v10 = 0;
    objc_storeStrong((id *)&self->_sessionHelloMessage, v7);
  }
  else
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0, @"Failed to create data.");
  }
LABEL_7:
  if (v12) {
    ewFHQ(v12);
  }
  if (v10) {
    ZyNF2D9((uint64_t)v10);
  }
}

- (PSCSessionInternal_)session
{
  BOOL v3 = [(MobileActivationDaemon *)self sessionQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  [(MobileActivationDaemon *)self generateSession:0];
  return self->_session;
}

- (NSData)sessionHelloMessage
{
  BOOL v3 = [(MobileActivationDaemon *)self sessionQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  [(MobileActivationDaemon *)self generateSession:0];
  sessionHelloMessage = self->_sessionHelloMessage;

  return sessionHelloMessage;
}

- (id)callingProcessName
{
  BOOL v3 = [(MobileActivationDaemon *)self xpcQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_super v4 = [(MobileActivationDaemon *)self dark];
  BOOL v5 = data_ark_exists(v4, 0, @"HostProcessName");

  if (v5)
  {
    uint64_t v6 = [(MobileActivationDaemon *)self dark];
    id v7 = data_ark_copy(v6, 0, @"HostProcessName");
  }
  else
  {
    id v7 = copy_calling_process_name();
  }

  return v7;
}

- (BOOL)isHostConnection
{
  BOOL v3 = [(MobileActivationDaemon *)self xpcQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_super v4 = [(MobileActivationDaemon *)self dark];
  LOBYTE(v3) = data_ark_exists(v4, 0, @"HostProcessName");

  return (char)v3;
}

- (BOOL)isEntitled:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSXPCConnection currentConnection];
  uint64_t v6 = [(MobileActivationDaemon *)self xpcQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  id v7 = 0;
  LOBYTE(v8) = 0;
  if (v4)
  {
    if (v5)
    {
      id v7 = [(NSXPCConnection *)v5 valueForEntitlement:v4];
      id v8 = isNSNumber(v7);

      if (v8) {
        LOBYTE(v8) = [v7 BOOLValue];
      }
    }
  }

  return (char)v8;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSXPCConnection currentConnection];
  uint64_t v6 = [(MobileActivationDaemon *)self xpcQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  id v7 = 0;
  if (v4 && v5) {
    id v7 = [(NSXPCConnection *)v5 valueForEntitlement:v4];
  }

  return v7;
}

- (id)copyUCRTVersionInfoWithError:(id *)a3
{
  id v4 = [(MobileActivationDaemon *)self dark];
  id v10 = 0;
  id v5 = copyUCRTVersionInformation(v4, &v10);
  uint64_t v6 = (NSError *)v10;

  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithError:]", 284, @"com.apple.MobileActivation.ErrorDomain", -1, v6, @"Failed to copy UCRT version info.");

    if (a3)
    {
      uint64_t v6 = v8;
      *a3 = v6;
    }
    else
    {
      uint64_t v6 = v8;
    }
  }

  return v5;
}

- (BOOL)handleSessionResponse:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v65 = 0;
  v66 = (id *)&v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__9;
  v69 = __Block_byref_object_dispose__9;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__9;
  v63 = __Block_byref_object_dispose__9;
  id v64 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__9;
  v57[4] = __Block_byref_object_dispose__9;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  int v56 = 0;
  uint64_t v6 = [(MobileActivationDaemon *)self xpcQueue];
  dispatch_assert_queue_not_V2((dispatch_queue_t)v6);

  if (!v5)
  {
    v28 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 318, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
LABEL_15:
    id v29 = v66[5];
    v66[5] = v28;

    id v18 = 0;
    id v19 = 0;
    id v11 = 0;
    BOOL v27 = 0;
    v9 = 0;
LABEL_16:
    id v17 = 0;
    id v14 = 0;
    goto LABEL_17;
  }
  id v7 = [MACollectionInterface alloc];
  id v8 = [(MobileActivationDaemon *)self dark];
  v9 = [(MACollectionInterface *)v7 initWithContext:v8];

  if (!v9)
  {
    v28 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 324, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create collection interface.");
    goto LABEL_15;
  }
  id v10 = +[GestaltHlpr getSharedInstance];
  id v11 = [v10 copyAnswer:@"BuildVersion"];

  id v12 = isNSString(v11);
  if (!v12)
  {
    v31 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 330, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve %@.", @"BuildVersion");
    id v32 = v66[5];
    v66[5] = v31;

    id v18 = 0;
    id v19 = 0;
    BOOL v27 = 0;
    goto LABEL_16;
  }
  CFStringRef v13 = v66;
  id obj = 0;
  id v14 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&obj];
  objc_storeStrong(v13 + 5, obj);
  id v15 = isNSDictionary(v14);

  if (!v15)
  {
    v33 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 339, @"com.apple.MobileActivation.ErrorDomain", -1, v66[5], @"Failed to decode session data.");
    id v34 = v66[5];
    v66[5] = v33;

    id v18 = 0;
    id v19 = 0;
    BOOL v27 = 0;
    id v17 = 0;
    goto LABEL_17;
  }
  if (is_internal_build())
  {
    id v16 = dictionary_to_xml((uint64_t)v14);
    maLog((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 0, @"Session message:\n%@", v16);
  }
  id v17 = [v14 objectForKeyedSubscript:@"HandshakeResponseMessage"];
  id v18 = [v14 objectForKeyedSubscript:@"serverKP"];
  id v19 = [v14 objectForKeyedSubscript:@"SUInfo"];
  id v20 = [v14 objectForKeyedSubscript:@"FDRBlob"];
  v21 = (void *)v60[5];
  v60[5] = (uint64_t)v20;

  id v22 = isNSData(v17);
  if (!v22) {
    goto LABEL_25;
  }
  id v23 = isNSData(v18);
  if (!v23) {
    goto LABEL_24;
  }
  id v24 = isNSData(v19);
  if (!v24)
  {

LABEL_24:
    goto LABEL_25;
  }
  id v38 = v24;
  id v37 = isNSData((void *)v60[5]);

  if (!v37)
  {
LABEL_25:
    v35 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 353, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid session response.");
    id v36 = v66[5];
    v66[5] = v35;

    goto LABEL_26;
  }
  v25 = [(MobileActivationDaemon *)self xpcQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke;
  block[3] = &__block_descriptor_96_e8_32s40s48s56s64r72r80r88r_e5_v8__0l;
  v50 = v57;
  v51 = &v59;
  v52 = &v65;
  v9 = v9;
  id v46 = v9;
  id v19 = v19;
  id v47 = v19;
  v48 = self;
  v53 = v55;
  id v11 = v11;
  id v49 = v11;
  dispatch_sync((dispatch_queue_t)v25, block);

  if (v66[5])
  {
LABEL_26:
    BOOL v27 = 0;
    goto LABEL_17;
  }
  v26 = [(MobileActivationDaemon *)self sessionQueue];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3254779904;
  v40[2] = __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke_149;
  v40[3] = &__block_descriptor_72_e8_32s40s48s56r64r_e5_v8__0l;
  v40[4] = self;
  v43 = &v65;
  v44 = v55;
  id v17 = v17;
  id v41 = v17;
  id v18 = v18;
  id v42 = v18;
  dispatch_sync((dispatch_queue_t)v26, v40);

  BOOL v27 = v66[5] == 0;
LABEL_17:
  if (a4 && !v27) {
    *a4 = v66[5];
  }

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v27;
}

void __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) base64EncodedStringWithOptions:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v7 + 40);
    unsigned __int8 v8 = [v5 processSUInfo:v6 withError:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    id v9 = [*(id *)(a1 + 48) dark];
    id v10 = v9;
    if (v8)
    {
      data_ark_set(v9, 0, @"PCRTToken", *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), 1);

      id v11 = [*(id *)(a1 + 48) dark];
      data_ark_set(v11, 0, @"CollectionLastPerformed", *(void **)(a1 + 56), 1);
      id v12 = v11;
    }
    else
    {
      data_ark_remove(v9, 0, @"PCRTToken");

      id v16 = [*(id *)(a1 + 48) dark];
      writeSplunkLog(v16, 8, *(int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 371, 0, 0, v17, v21);

      id v18 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 372, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40), @"Failed to process SUInfo.");
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
      id v12 = v20;
    }
  }
  else
  {
    CFStringRef v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 363, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode PCRT receipt (%@).", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

void __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke_149(uint64_t a1)
{
  if (![*(id *)(a1 + 32) session])
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 396, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid session.");
    goto LABEL_9;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = xtiKg((uint64_t)[*(id *)(a1 + 32) session], (uint64_t)[*(id *)(a1 + 40) bytes], (int)[*(id *)(a1 + 40) length], (uint64_t)[*(id *)(a1 + 48) bytes], (int)[*(id *)(a1 + 48) length]);
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v2 != -42901 && v2 != 0)
  {
    id v4 = [*(id *)(a1 + 32) dark];
    writeSplunkLog(v4, 7, *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 407, 0, 0, v5, v10);

    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 408, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to process handshake response message: %d", *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
LABEL_9:
    uint64_t v7 = MobileActivationError;
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (BOOL)validateActivationDataSignature:(id)a3 activationSignature:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  BOOL v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  int v22 = 0;
  if (v8 && v9)
  {
    id v11 = [(MobileActivationDaemon *)self sessionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3254779904;
    block[2] = __88__MobileActivationDaemon_validateActivationDataSignature_activationSignature_withError___block_invoke;
    block[3] = &__block_descriptor_72_e8_32s40s48s56r64r_e5_v8__0l;
    void block[4] = self;
    uint64_t v19 = &v23;
    id v20 = v21;
    id v17 = v8;
    id v18 = v10;
    dispatch_sync((dispatch_queue_t)v11, block);

    BOOL v12 = v24[5] == 0;
    if (!a5) {
      goto LABEL_8;
    }
  }
  else
  {
    CFStringRef v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]", 440, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).");
    uint64_t v14 = (void *)v24[5];
    v24[5] = (uint64_t)v13;

    BOOL v12 = 0;
    if (!a5) {
      goto LABEL_8;
    }
  }
  if (!v12) {
    *a5 = (id) v24[5];
  }
LABEL_8:
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __88__MobileActivationDaemon_validateActivationDataSignature_activationSignature_withError___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) session])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = mbdz5ztWyQD((uint64_t)[*(id *)(a1 + 32) session], (uint64_t)[*(id *)(a1 + 40) bytes], (int)[*(id *)(a1 + 40) length], (uint64_t)[*(id *)(a1 + 48) bytes], (int)[*(id *)(a1 + 48) length]);
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      return;
    }
    id v2 = [*(id *)(a1 + 32) dark];
    writeSplunkLog(v2, 6, *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke", 458, 0, 0, v3, v10);

    id v4 = [*(id *)(a1 + 48) base64EncodedStringWithOptions:0];
    uint64_t v5 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke", 459, @"com.apple.MobileActivation.ErrorDomain", -15, 0, @"Failed to verify message signature (%@): %d", v4, *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke", 447, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid session.");
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(id *)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)performMigrationWithCompletion:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(MobileActivationDaemon *)self callingProcessName];
  uint64_t v7 = copySignpostLoggingHandle();
  BOOL v8 = os_signpost_enabled(v7);

  if (v8)
  {
    os_signpost_id_t v9 = 0xEEEEB0B5B2B2EEEELL;
    if (v5 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v10 = copySignpostLoggingHandle();
      os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v10, v5);
    }
    id v11 = copySignpostLoggingHandle();
    BOOL v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformMigrationXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3254779904;
    v24[2] = __68__MobileActivationDaemon_performMigrationWithCompletion_completion___block_invoke;
    v24[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v25 = v5;
    os_signpost_id_t v26 = v9;
    id v5 = objc_retainBlock(v24);
  }
  if (!data_migration_supported()) {
    goto LABEL_13;
  }
  int v13 = is_erase_installed_build();
  CFStringRef v14 = @"upgrade-install";
  if (v13) {
    CFStringRef v14 = @"erase-install";
  }
  maLog((uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]", 1, @"Data migration requested by %@ (%@)", v6, v14);
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v28 = @"com.apple.mobileactivationd.spi";
    id v29 = &__kCFBooleanTrue;
    id v17 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]", 535, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v17);
    goto LABEL_17;
  }
  id v15 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v16 = preSydroDataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    uint64_t v19 = [(MobileActivationDaemon *)self dark];
    id v23 = 0;
    char v20 = performMigration(v19, &v23);
    id v17 = (NSDictionary *)v23;

    if (v20) {
      goto LABEL_18;
    }
    id v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]", 547, @"com.apple.MobileActivation.ErrorDomain", -1, v17, @"Failed to perform migration.", v22);
LABEL_17:
    uint64_t v21 = v18;

    id v17 = (NSDictionary *)v21;
    goto LABEL_18;
  }
LABEL_13:
  id v17 = 0;
LABEL_18:
  (*((void (**)(id, void, NSDictionary *))v5 + 2))(v5, 0, v17);
}

void __68__MobileActivationDaemon_performMigrationWithCompletion_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  BOOL v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "PerformMigrationXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

- (void)copyAutomaticTimeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MobileActivationDaemon *)self creationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __65__MobileActivationDaemon_copyAutomaticTimeEnabledWithCompletion___block_invoke;
  block[3] = &__block_descriptor_40_e8_32bs_e5_v8__0l;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, block);
}

void __65__MobileActivationDaemon_copyAutomaticTimeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  CFStringRef v5 = @"AutomaticTimeEnabled";
  id v2 = +[NSNumber numberWithBool:isAutomaticTimeEnabled()];
  id v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, NSDictionary *, void))(v4 + 16))(v4, v3, 0);
  }
}

- (void)copyRTCResetCountWithCompletionBlock:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = copyRTCResetSerialQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3254779904;
  v7[2] = __63__MobileActivationDaemon_copyRTCResetCountWithCompletionBlock___block_invoke;
  v7[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__MobileActivationDaemon_copyRTCResetCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  id v3 = data_ark_copy(v2, 0, @"TotalRTCResetCount");

  id v4 = (NSDictionary *)isNSNumber(v3);
  if (v4)
  {
    CFStringRef v7 = @"TotalRTCResetCount";
    id v8 = v3;
    id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    CFStringRef v5 = 0;
  }
  else
  {
    CFStringRef v5 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyRTCResetCountWithCompletionBlock:]_block_invoke", 581, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve RTC reset count.");
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v6 + 16))(v6, v4, v5);
  }
}

- (void)copyMonotonicClockWithCompletionBlock:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MobileActivationDaemon *)self creationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __64__MobileActivationDaemon_copyMonotonicClockWithCompletionBlock___block_invoke;
  block[3] = &__block_descriptor_40_e8_32bs_e5_v8__0l;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, block);
}

void __64__MobileActivationDaemon_copyMonotonicClockWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v7 = 0;
  double v2 = copyMonotonicClockTimeInterval(&v7);
  id v3 = (NSError *)v7;
  if (v2 <= 0.0)
  {
    CFStringRef v5 = 0;
    id v4 = (NSNumber *)v3;
    id v3 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyMonotonicClockWithCompletionBlock:]_block_invoke", 604, @"com.apple.MobileActivation.ErrorDomain", -1, v3, @"Failed to retrieve monotonic clock interval.");
  }
  else
  {
    CFStringRef v8 = @"MonotonicClockNow";
    id v4 = +[NSNumber numberWithDouble:v2];
    os_signpost_id_t v9 = v4;
    CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v6 + 16))(v6, v5, v3);
  }
}

- (void)deactivateDeviceWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void, NSError *))a3;
  id v5 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon deactivateDeviceWithCompletionBlock:]", 1, @"Deactivation requested by %@", v5);

  uint64_t v6 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v7 = dataMigrationCompleted(v6);

  if ((v7 & 1) == 0)
  {
    os_signpost_id_t v9 = createAndLogError((uint64_t)"-[MobileActivationDaemon deactivateDeviceWithCompletionBlock:]", 625, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  CFStringRef v8 = [(MobileActivationDaemon *)self dark];
  handle_deactivate(v8, 1);

  os_signpost_id_t v9 = 0;
  if (v4) {
LABEL_5:
  }
    v4[2](v4, 0, v9);
LABEL_6:
}

- (void)createTunnel1ActivationInfo:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MobileActivationDaemon *)self callingProcessName];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__9;
  v38[4] = __Block_byref_object_dispose__9;
  id v39 = 0;
  BOOL v12 = copySignpostLoggingHandle();
  BOOL v13 = os_signpost_enabled(v12);

  if (v13)
  {
    os_signpost_id_t v14 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v15 = copySignpostLoggingHandle();
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v15, v8);
    }
    unsigned __int8 v16 = copySignpostLoggingHandle();
    id v17 = v16;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CreateActivationInfoXPCV2", " enableTelemetry=YES ", buf, 2u);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3254779904;
    v34[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke;
    v34[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v35 = v10;
    os_signpost_id_t v36 = v14;
    id v10 = objc_retainBlock(v34);
  }
  maLog((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]", 1, @"Tunnel1 Activation info creation requested by %@", v11);
  id v18 = +[NSUUID UUID];
  uint64_t v19 = [(NSUUID *)v18 UUIDString];

  [(MobileActivationDaemon *)self setActivationNonce:v19];
  [(MobileActivationDaemon *)self setActivationSessionClientName:v11];
  char v20 = [(MobileActivationDaemon *)self dark];
  id v21 = copy_activation_record(v20);

  uint64_t v22 = [(MobileActivationDaemon *)self creationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_198;
  block[3] = &__block_descriptor_81_e8_32s40s48s56s64bs72r_e5_v8__0l;
  void block[4] = self;
  id v28 = v9;
  BOOL v33 = v21 != 0;
  id v29 = v19;
  id v30 = v8;
  id v31 = v10;
  id v32 = v38;
  id v23 = v10;
  id v24 = v8;
  id v25 = v19;
  id v26 = v9;
  dispatch_async((dispatch_queue_t)v22, block);

  _Block_object_dispose(v38, 8);
}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateActivationInfoXPCV2", " enableTelemetry=YES ", v11, 2u);
  }
}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_198(uint64_t a1)
{
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  uint64_t v92 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  int v88 = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  int v80 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  int v76 = 0;
  id v2 = [*(id *)(a1 + 32) dark];
  unsigned __int8 v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    id v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 676, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
LABEL_22:
    id v31 = v32;
    id v5 = 0;
    id v6 = 0;
LABEL_28:
    id v25 = 0;
    unsigned __int8 v16 = 0;
    goto LABEL_29;
  }
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = v4;
  if (!v4)
  {
    id v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 682, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.");
    goto LABEL_22;
  }
  if (*(void *)(a1 + 40)) {
    [v4 addEntriesFromDictionary:];
  }
  id v6 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  [v5 setObject:v6 forKeyedSubscript:@"UseCommittedUIK"];
  uint64_t v7 = *(void *)(a1 + 48);
  if (!v7)
  {
    BOOL v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 700, @"com.apple.MobileActivation.ErrorDomain", -1, *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), @"Failed to create activation nonce.");
LABEL_27:
    id v31 = v33;
    goto LABEL_28;
  }
  [v5 setObject:v7 forKeyedSubscript:@"ActivationRandomness"];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v10 + 40);
  unsigned __int8 v11 = [v8 handleSessionResponse:v9 withError:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) == 0)
  {
    BOOL v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 707, @"com.apple.MobileActivation.ErrorDomain", -1, *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), @"Failed to establish session.");
    goto LABEL_27;
  }
  if (![(NSNumber *)v6 BOOLValue])
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    id v73 = *(id *)(v12 + 40);
    char v13 = libaks_system_key_operate(2, 1, (NSError **)&v73);
    objc_storeStrong((id *)(v12 + 40), v73);
    if ((v13 & 1) == 0)
    {
      BOOL v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 713, @"com.apple.MobileActivation.ErrorDomain", -1, *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), @"Failed to bump UIK.");
      goto LABEL_27;
    }
  }
  id v14 = [*(id *)(a1 + 32) dark];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  id v72 = *(id *)(v15 + 40);
  unsigned __int8 v16 = create_activation_info((uint64_t)v14);
  objc_storeStrong((id *)(v15 + 40), v72);

  if (!v16)
  {
    id v34 = [*(id *)(a1 + 32) dark];
    writeSplunkLog(v34, 2, -1, (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 720, 0, @"%@", v35, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));

    BOOL v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 721, @"com.apple.MobileActivation.ErrorDomain", -1, *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), @"Failed to create activation info.");
    goto LABEL_27;
  }
  id v17 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v18 = isNSData(v17);
  if (!v18)
  {
LABEL_41:

    goto LABEL_42;
  }
  id v19 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v20 = isNSData(v19);
  if (!v20)
  {
LABEL_40:

    goto LABEL_41;
  }
  id v60 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v59 = isNSData(v60);
  if (!v59)
  {
LABEL_39:

    goto LABEL_40;
  }
  id v58 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v57 = isNSData(v58);
  if (!v57)
  {

    goto LABEL_39;
  }
  id v21 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v22 = isNSData(v21);
  BOOL v56 = v22 == 0;

  if (v56)
  {
LABEL_42:
    v44 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 730, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid activation record.");
LABEL_43:
    id v31 = v44;
    id v25 = 0;
    goto LABEL_29;
  }
  if (!*(void *)(a1 + 40))
  {
    id v25 = 0;
    goto LABEL_47;
  }
  id v23 = [(NSDictionary *)v16 objectForKeyedSubscript:@"ActivationInfoXML"];
  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
  id v71 = 0;
  id v25 = +[NSPropertyListSerialization propertyListWithData:v23 options:0 format:0 error:&v71];
  objc_storeStrong((id *)(v24 + 40), v71);

  if (!v25)
  {
    v44 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 739, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to convert data to dictionary.");
    goto LABEL_43;
  }
  id v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ActivationLockInfo"];
  id v27 = isNSString(v26);
  if (v27)
  {
    id v28 = [v25 objectForKeyedSubscript:@"ActivationLockInfo"];
    id v29 = isNSString(v28);
    BOOL v30 = v29 == 0;

    if (v30)
    {
      id v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 744, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Missing activation lock data.");
LABEL_29:
      uint64_t v36 = *(void *)(*(void *)(a1 + 72) + 8);
      id v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v31;

      id v38 = 0;
      id v39 = 0;
LABEL_30:
      id v40 = 0;
      goto LABEL_31;
    }
  }
  else
  {
  }
LABEL_47:
  id v61 = [(NSDictionary *)v16 objectForKeyedSubscript:@"ActivationInfoXML"];
  id v45 = objc_alloc((Class)NSMutableDictionary);
  v94[0] = v61;
  v93[0] = @"ActivationInfoXML";
  v93[1] = @"FairPlaySignature";
  id v62 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[1] = v62;
  v93[2] = @"FairPlayCertChain";
  id v46 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[2] = v46;
  v93[3] = @"RKCertification";
  id v47 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[3] = v47;
  v93[4] = @"RKSignature";
  id v48 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[4] = v48;
  id v49 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:5];
  id v40 = [v45 initWithDictionary:v49];

  v50 = [*(id *)(a1 + 32) sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  uint64_t v51 = *(void *)(a1 + 72);
  block[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_2;
  block[3] = &__block_descriptor_96_e8_32s40s48r56r64r72r80r88r_e5_v8__0l;
  void block[4] = *(void *)(a1 + 32);
  uint64_t v65 = v51;
  v66 = v75;
  id v39 = v61;
  id v64 = v39;
  uint64_t v67 = &v89;
  v68 = &v85;
  v69 = &v81;
  id v70 = &v77;
  dispatch_sync(v50, block);

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v38 = v40;
    goto LABEL_30;
  }
  id v52 = objc_alloc((Class)NSData);
  id v53 = [v52 initWithBytes:v82[3] length:*((unsigned int *)v78 + 6)];
  [v40 setObject:v53 forKeyedSubscript:@"serverKP"];

  id v54 = objc_alloc((Class)NSData);
  id v55 = [v54 initWithBytes:v90[3] length:*((unsigned int *)v86 + 6)];
  [v40 setObject:v55 forKeyedSubscript:@"signActRequest"];

  id v38 = dictionary_to_xml((uint64_t)v40);
  maLog((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 0, @"Activation info: \n%@", v38);
LABEL_31:

  uint64_t v41 = v90[3];
  if (v41) {
    ewFHQ(v41);
  }
  uint64_t v42 = v82[3];
  if (v42) {
    ewFHQ(v42);
  }
  uint64_t v43 = *(void *)(a1 + 64);
  if (v43) {
    (*(void (**)(uint64_t, id, void))(v43 + 16))(v43, v40, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }

  _Block_object_dispose(v75, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) session])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = qSCskg((uint64_t)[*(id *)(a1 + 32) session], (uint64_t)[*(id *)(a1 + 40) bytes], (int)[*(id *)(a1 + 40) length], *(void *)(*(void *)(a1 + 64) + 8) + 24, *(void *)(*(void *)(a1 + 72) + 8) + 24, *(void *)(*(void *)(a1 + 80) + 8) + 24, *(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      return;
    }
    id v2 = [*(id *)(a1 + 32) dark];
    writeSplunkLog(v2, 9, *(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2", 777, 0, 0, v3, v8);

    id v4 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2", 778, @"com.apple.MobileActivation.ErrorDomain", -15, 0, @"PSCSign failed: %d", *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  }
  else
  {
    id v4 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2", 764, @"com.apple.MobileActivation.ErrorDomain", -1, *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), @"Invalid session.");
  }
  id v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)createTunnel1SessionInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MobileActivationDaemon *)self callingProcessName];
  uint64_t v6 = copySignpostLoggingHandle();
  BOOL v7 = os_signpost_enabled(v6);

  if (v7)
  {
    os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v9 = copySignpostLoggingHandle();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v9, v4);
    }
    uint64_t v10 = copySignpostLoggingHandle();
    unsigned __int8 v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CreateSessionInfoXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3254779904;
    v16[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke;
    v16[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v17 = v4;
    os_signpost_id_t v18 = v8;
    id v4 = objc_retainBlock(v16);
  }
  maLog((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]", 1, @"Session creation requested by %@", v5);
  uint64_t v12 = [(MobileActivationDaemon *)self creationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_236;
  block[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  void block[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async((dispatch_queue_t)v12, block);
}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  os_signpost_id_t v8 = copySignpostLoggingHandle();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)unsigned __int8 v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateSessionInfoXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_236(uint64_t a1)
{
  uint64_t v36 = 0;
  id v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__9;
  id v40 = __Block_byref_object_dispose__9;
  id v41 = 0;
  id v2 = [*(id *)(a1 + 32) dark];
  unsigned __int8 v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 846, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    id v28 = 0;
LABEL_16:
    id v17 = 0;
    id v19 = 0;
    id v27 = 0;
    id v13 = 0;
    id v11 = 0;
    id v14 = 0;
    unsigned __int8 v16 = 0;
    os_signpost_id_t v8 = 0;
LABEL_17:
    id v22 = 0;
    id v24 = v37[5];
    v37[5] = v23;
LABEL_18:

    goto LABEL_19;
  }
  id v4 = +[GestaltHlpr getSharedInstance];
  id v28 = [v4 copyAnswer:@"UniqueDeviceID"];

  id v5 = isNSString(v28);
  LODWORD(v4) = v5 == 0;

  if (v4)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 852, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve UDID.");
    goto LABEL_16;
  }
  id v6 = [MACollectionInterface alloc];
  id v7 = [*(id *)(a1 + 32) dark];
  os_signpost_id_t v8 = [(MACollectionInterface *)v6 initWithContext:v7];

  if (!v8)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 860, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to initialize collection interface.");
    goto LABEL_16;
  }
  uint64_t v9 = v37 + 5;
  id obj = v37[5];
  id v27 = [(MACollectionInterface *)v8 copyIngestData:&obj];
  objc_storeStrong(v9, obj);
  if (!v27)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 866, @"com.apple.MobileActivation.ErrorDomain", -1, v37[5], @"Failed to copy ingest data.");
    id v17 = 0;
    id v19 = 0;
    id v27 = 0;
LABEL_25:
    id v13 = 0;
    id v11 = 0;
LABEL_26:
    id v14 = 0;
    unsigned __int8 v16 = 0;
    goto LABEL_17;
  }
  os_signpost_id_t v10 = v37 + 5;
  id v34 = v37[5];
  id v11 = [(MACollectionInterface *)v8 signatureForData:v27 error:&v34];
  objc_storeStrong(v10, v34);
  if (!v11)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 874, @"com.apple.MobileActivation.ErrorDomain", -1, v37[5], @"Failed to compute data signature.");
    id v17 = 0;
    id v19 = 0;
    goto LABEL_25;
  }
  uint64_t v12 = v37 + 5;
  id v33 = v37[5];
  id v13 = [(MACollectionInterface *)v8 signingKeyPublicKeyWithError:&v33];
  objc_storeStrong(v12, v33);
  if (!v13)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 882, @"com.apple.MobileActivation.ErrorDomain", -1, v37[5], @"Failed to retrieve signing key public key.");
    id v17 = 0;
    id v19 = 0;
    id v13 = 0;
    goto LABEL_26;
  }
  id v14 = [v11 base64EncodedStringWithOptions:0];
  id v15 = [v13 base64EncodedStringWithOptions:0];
  unsigned __int8 v16 = v15;
  if (!v14 || !v15)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 891, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode data as string.");
    id v17 = 0;
LABEL_30:
    id v19 = 0;
    goto LABEL_17;
  }
  v42[0] = @"X-Apple-Signature";
  v42[1] = @"X-Apple-Sig-Key";
  v43[0] = v14;
  v43[1] = v15;
  v42[2] = @"IngestBody";
  v43[2] = v27;
  id v17 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
  os_signpost_id_t v18 = v37;
  id v32 = 0;
  id v19 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:100 options:0 error:&v32];
  objc_storeStrong(v18 + 5, v32);
  if (!v19)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 904, @"com.apple.MobileActivation.ErrorDomain", -1, v37[5], @"Failed to convert dictionary to data.");
    goto LABEL_30;
  }
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v20)
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 910, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create dictionary.");
    goto LABEL_17;
  }
  queue = [*(id *)(a1 + 32) sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_2;
  block[3] = &__block_descriptor_56_e8_32s40s48r_e5_v8__0l;
  void block[4] = *(void *)(a1 + 32);
  id v31 = &v36;
  id v21 = v20;
  id v30 = v21;
  dispatch_sync(queue, block);

  if (v37[5])
  {
    id v22 = 0;
    goto LABEL_20;
  }
  [v21 setObject:v28 forKeyedSubscript:@"UniqueDeviceID"];
  [v21 setObject:v19 forKeyedSubscript:@"CollectionBlob"];
  id v22 = v21;
  if (is_internal_build())
  {
    id v24 = dictionary_to_xml((uint64_t)v22);
    maLog((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 0, @"Session info: \n%@", v24);
    goto LABEL_18;
  }
LABEL_19:
  id v21 = v22;
LABEL_20:
  uint64_t v25 = *(void *)(a1 + 40);
  if (v25) {
    (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v22, v37[5]);
  }

  _Block_object_dispose(&v36, 8);
}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) currentSessionDuration] >= 0x97)
  {
    maLog((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke_2", 0, @"Forcibly refreshing DRM session as more than half of the existing period (%llu secs of %u secs) has expired.", [*(id *)(a1 + 32) currentSessionDuration], 300);
    [*(id *)(a1 + 32) generateSession:1];
  }
  id v2 = [*(id *)(a1 + 32) sessionHelloMessage];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) sessionHelloMessage];
    id v4 = [v3 copy];
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:@"HandshakeRequestMessage"];
  }
  else
  {
    id v5 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke_2", 926, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid session hello message.");
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void)createActivationInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MobileActivationDaemon *)self callingProcessName];
  uint64_t v6 = copySignpostLoggingHandle();
  BOOL v7 = os_signpost_enabled(v6);

  if (v7)
  {
    os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v9 = copySignpostLoggingHandle();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v9, v4);
    }
    os_signpost_id_t v10 = copySignpostLoggingHandle();
    id v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CreateActivationInfoLegacyXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3254779904;
    v23[2] = __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke;
    v23[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v24 = v4;
    os_signpost_id_t v25 = v8;
    id v4 = objc_retainBlock(v23);
  }
  uint64_t v12 = +[NSUUID UUID];
  id v13 = [(NSUUID *)v12 UUIDString];

  [(MobileActivationDaemon *)self setActivationNonce:v13];
  [(MobileActivationDaemon *)self setActivationSessionClientName:v5];
  id v14 = [(MobileActivationDaemon *)self creationQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3254779904;
  v18[2] = __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke_273;
  v18[3] = &__block_descriptor_64_e8_32s40s48s56bs_e5_v8__0l;
  id v19 = v5;
  id v20 = self;
  id v21 = v13;
  id v22 = v4;
  id v15 = v4;
  unsigned __int8 v16 = v13;
  id v17 = v5;
  dispatch_async((dispatch_queue_t)v14, v18);
}

void __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  os_signpost_id_t v8 = copySignpostLoggingHandle();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateActivationInfoLegacyXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

void __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke_273(uint64_t a1)
{
  maLog((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 1, @"Activation info creation requested by %@", *(void *)(a1 + 32));
  id v2 = [*(id *)(a1 + 40) dark];
  unsigned __int8 v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    os_signpost_id_t v10 = createAndLogError((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 984, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
LABEL_7:
    os_signpost_id_t v8 = v10;
    uint64_t v7 = 0;
    id v5 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (!v4)
  {
    os_signpost_id_t v10 = createAndLogError((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 989, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create activation nonce.");
    goto LABEL_7;
  }
  CFStringRef v15 = @"ActivationRandomness";
  uint64_t v16 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v6 = [*(id *)(a1 + 40) dark];
  uint64_t v7 = create_activation_info_legacy((uint64_t)v6);
  os_signpost_id_t v8 = (NSError *)0;

  if (v7)
  {
    id v9 = dictionary_to_xml((uint64_t)v7);
    maLog((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 0, @"Activation info: \n%@", v9);
  }
  else
  {
    id v12 = [*(id *)(a1 + 40) dark];
    writeSplunkLog(v12, 1, -1, (uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 997, 0, @"%@", v13, (uint64_t)v8);

    id v14 = createAndLogError((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 998, @"com.apple.MobileActivation.ErrorDomain", -1, v8, @"Failed to create activation info.");
    uint64_t v7 = 0;
    os_signpost_id_t v8 = v14;
  }
LABEL_8:
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v11 + 16))(v11, v7, v8);
  }
}

- (void)handleActivationInfo:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MobileActivationDaemon *)self callingProcessName];
  id v9 = copySignpostLoggingHandle();
  BOOL v10 = os_signpost_enabled(v9);

  if (v10)
  {
    os_signpost_id_t v11 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v12 = copySignpostLoggingHandle();
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v12, v7);
    }
    uint64_t v13 = copySignpostLoggingHandle();
    id v14 = v13;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "HandleActivationInfoLegacyXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3254779904;
    v35[2] = __67__MobileActivationDaemon_handleActivationInfo_withCompletionBlock___block_invoke;
    v35[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v36 = v7;
    os_signpost_id_t v37 = v11;
    id v7 = objc_retainBlock(v35);
  }
  maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1, @"Activation (legacy) requested by %@", v8);
  if (!v6)
  {
    id v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1029, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
LABEL_20:
    id v28 = v32;
    id v19 = 0;
LABEL_21:
    id v21 = 0;
LABEL_22:
    id v22 = 0;
    goto LABEL_23;
  }
  CFStringRef v15 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    id v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1034, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    goto LABEL_20;
  }
  id v17 = [(MobileActivationDaemon *)self dark];
  id v18 = data_ark_copy(v17, 0, @"ActivationState");
  id v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    id v19 = @"Unactivated";
  }
  if (([(__CFString *)v19 isEqualToString:@"Unactivated"] & 1) == 0)
  {
    id v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1044, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Device is already activated (%@).", v19);
    goto LABEL_21;
  }
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  id v21 = v20;
  if (!v20)
  {
    id v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1050, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.");
    goto LABEL_22;
  }
  [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseFactoryCertificates"];
  id v22 = [(MobileActivationDaemon *)self activationNonce];
  if (v22)
  {
    [(MobileActivationDaemon *)self setActivationNonce:0];
    id v23 = [(MobileActivationDaemon *)self activationSessionClientName];
    unsigned __int8 v24 = [(NSString *)v23 isEqualToString:v8];

    if (v24)
    {
      [v21 setObject:v22 forKeyedSubscript:@"ActivationRandomness"];
      id v25 = dictionary_to_xml((uint64_t)v6);
      maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 0, @"Activation message:\n%@", v25);

      id v26 = [(MobileActivationDaemon *)self dark];
      id v34 = 0;
      char v27 = handle_activate(v26, v6, v21, (NSError **)&v34);
      id v28 = (NSError *)v34;

      if ((v27 & 1) == 0)
      {
        id v29 = [(MobileActivationDaemon *)self dark];
        writeSplunkLog(v29, 3, -1, (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1081, 0, @"%@", v30, (uint64_t)v28);

        id v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1082, @"com.apple.MobileActivation.ErrorDomain", -2, v28, @"Failed to activate device.");
        id v28 = v31;
      }
    }
    else
    {
      id v33 = [(MobileActivationDaemon *)self activationSessionClientName];
      id v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1072, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid activation session (actual, expected): (%@, %@)", v8, v33);
    }
  }
  else
  {
    id v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1065, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid activation nonce.");
  }
LABEL_23:
  if (v7) {
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0, v28);
  }
}

void __67__MobileActivationDaemon_handleActivationInfo_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "HandleActivationInfoLegacyXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

- (void)copyUCRTWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    id v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyUCRTXPC", "", buf, 2u);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3254779904;
    v24[2] = __54__MobileActivationDaemon_copyUCRTWithCompletionBlock___block_invoke;
    v24[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v25 = v4;
    os_signpost_id_t v26 = v7;
    id v4 = objc_retainBlock(v24);
  }
  if ([(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    os_signpost_id_t v11 = [(MobileActivationDaemon *)self dark];
    unsigned __int8 v12 = dataMigrationCompleted(v11);

    if (v12)
    {
      uint64_t v13 = [(MobileActivationDaemon *)self dark];
      id v23 = 0;
      id v14 = copyUCRT(v13, (NSError **)&v23);
      CFStringRef v15 = (NSError *)v23;

      if (v14)
      {
        CFDataRef v16 = SecCertificateCopyData(v14);
        CFDataRef v17 = v16;
        if (v16)
        {
          CFStringRef v28 = @"UCRTData";
          CFDataRef v29 = v16;
          id v18 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        }
        else
        {
          id v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1124, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy UCRT certificate data.");

          id v18 = 0;
          CFStringRef v15 = v22;
        }
        CFRelease(v14);
      }
      else
      {
        id v21 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1118, @"com.apple.MobileActivation.ErrorDomain", -4, v15, @"Failed to copy UCRT.");

        CFDataRef v17 = 0;
        id v18 = 0;
        CFStringRef v15 = v21;
      }
      goto LABEL_16;
    }
    CFStringRef v15 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1112, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
  }
  else
  {
    id v19 = [(MobileActivationDaemon *)self callingProcessName];
    CFStringRef v30 = @"com.apple.mobileactivationd.spi";
    id v31 = &__kCFBooleanTrue;
    id v20 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    CFStringRef v15 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1107, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"%@ is missing required entitlement: %@", v19, v20);
  }
  CFDataRef v17 = 0;
  id v18 = 0;
LABEL_16:
  if (v4) {
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v18, v15);
  }
}

void __54__MobileActivationDaemon_copyUCRTWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyUCRTXPC", "", v11, 2u);
  }
}

- (void)copyPCRTTokenWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    id v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyPCRTXPC", "", buf, 2u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3254779904;
    v26[2] = __59__MobileActivationDaemon_copyPCRTTokenWithCompletionBlock___block_invoke;
    v26[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v27 = v4;
    os_signpost_id_t v28 = v7;
    id v4 = objc_retainBlock(v26);
  }
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    id v23 = [(MobileActivationDaemon *)self callingProcessName];
    CFStringRef v32 = @"com.apple.mobileactivationd.spi";
    id v33 = &__kCFBooleanTrue;
    unsigned __int8 v24 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1153, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"%@ is missing required entitlement: %@", v23, v24);

LABEL_19:
    id v21 = 0;
    id v14 = 0;
    goto LABEL_23;
  }
  os_signpost_id_t v11 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v12 = dataMigrationCompleted(v11);

  if ((v12 & 1) == 0)
  {
    id v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1158, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    goto LABEL_19;
  }
  uint64_t v13 = [(MobileActivationDaemon *)self dark];
  id v14 = (__CFString *)data_ark_copy(v13, 0, @"ActivationState");

  id v15 = isNSString(v14);
  if (!v15)
  {
    CFDataRef v16 = @"Unactivated";

    id v14 = v16;
  }
  if ([(__CFString *)v14 isEqualToString:@"Activated"])
  {
    CFDataRef v17 = [(MobileActivationDaemon *)self dark];
    BOOL v18 = collectionAlreadyPerformed(v17);

    if (v18)
    {
      id v19 = [(MobileActivationDaemon *)self dark];
      id v20 = data_ark_copy(v19, 0, @"PCRTToken");

      id v21 = (NSDictionary *)isNSString(v20);
      if (v21)
      {
        CFStringRef v30 = @"PCRTToken";
        id v31 = v20;
        id v21 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v22 = 0;
        if (!v4) {
          goto LABEL_25;
        }
      }
      else
      {
        id v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1179, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy PCRT token.");
        if (!v4) {
          goto LABEL_25;
        }
      }
      goto LABEL_24;
    }
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1173, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Collection has not been performed for this build.");
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1168, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated (%@).", v14);
  }
  id v22 = MobileActivationError;
  id v21 = 0;
LABEL_23:
  id v20 = 0;
  if (v4) {
LABEL_24:
  }
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v21, v22);
LABEL_25:
}

void __59__MobileActivationDaemon_copyPCRTTokenWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyPCRTXPC", "", v11, 2u);
  }
}

- (void)isDeviceBrickedWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, NSDictionary *, NSError *))a3;
  id v5 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    os_signpost_id_t v11 = createAndLogError((uint64_t)"-[MobileActivationDaemon isDeviceBrickedWithCompletionBlock:]", 1200, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    id v9 = 0;
    unsigned __int8 v12 = 0;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v7 = [(MobileActivationDaemon *)self dark];
  id v8 = data_ark_copy(v7, 0, @"BrickState");
  id v9 = isNSNumber(v8);

  if (v9) {
    uint64_t v10 = (uint64_t)[v9 BOOLValue];
  }
  else {
    uint64_t v10 = 1;
  }
  CFStringRef v14 = @"BrickState";
  uint64_t v13 = +[NSNumber numberWithBool:v10];
  id v15 = v13;
  unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  os_signpost_id_t v11 = 0;
  if (v4) {
LABEL_8:
  }
    v4[2](v4, v12, v11);
LABEL_9:
}

- (void)getActivationBuildWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, NSDictionary *, NSError *))a3;
  id v5 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    os_signpost_id_t v11 = createAndLogError((uint64_t)"-[MobileActivationDaemon getActivationBuildWithCompletionBlock:]", 1226, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    uint64_t v10 = 0;
    id v9 = 0;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v7 = [(MobileActivationDaemon *)self dark];
  id v8 = data_ark_copy(v7, 0, @"LastActivated");
  id v9 = isNSString(v8);

  if (v9)
  {
    CFStringRef v12 = @"LastActivated";
    id v13 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }
  os_signpost_id_t v11 = 0;
  if (v4) {
LABEL_8:
  }
    v4[2](v4, v10, v11);
LABEL_9:
}

- (void)requestDeviceReactivationWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void, NSError *))a3;
  id v5 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    id v15 = createAndLogError((uint64_t)"-[MobileActivationDaemon requestDeviceReactivationWithCompletionBlock:]", 1247, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    if (!v4) {
      goto LABEL_15;
    }
LABEL_14:
    v4[2](v4, 0, v15);
    goto LABEL_15;
  }
  uint64_t v7 = copySignpostLoggingHandle();
  BOOL v8 = os_signpost_enabled(v7);

  if (v8)
  {
    os_signpost_id_t v9 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (void (**)(id, void, NSError *))0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v10 = copySignpostLoggingHandle();
      os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v10, v4);
    }
    os_signpost_id_t v11 = copySignpostLoggingHandle();
    CFStringRef v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RequestReactivationXPC", "", buf, 2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3254779904;
    v16[2] = __71__MobileActivationDaemon_requestDeviceReactivationWithCompletionBlock___block_invoke;
    v16[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v17 = v4;
    os_signpost_id_t v18 = v9;
    id v4 = objc_retainBlock(v16);
  }
  if (!use_hactivation())
  {
    id v13 = [(MobileActivationDaemon *)self callingProcessName];
    maLog((uint64_t)"-[MobileActivationDaemon requestDeviceReactivationWithCompletionBlock:]", 1, @"Reactivation requested by %@", v13);

    CFStringRef v14 = [(MobileActivationDaemon *)self dark];
    handle_deactivate(v14, 0);
  }
  id v15 = 0;
  if (v4) {
    goto LABEL_14;
  }
LABEL_15:
}

void __71__MobileActivationDaemon_requestDeviceReactivationWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  BOOL v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "RequestReactivationXPC", "", v11, 2u);
  }
}

- (void)copyActivationRecordWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, id, NSError *))a3;
  id v5 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    id v17 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]", 1279, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    id v11 = 0;
    id v12 = 0;
    os_signpost_id_t v9 = 0;
    if (!v4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v7 = [(MobileActivationDaemon *)self dark];
  id v8 = data_ark_copy(v7, 0, @"ActivationState");
  os_signpost_id_t v9 = (__CFString *)isNSString(v8);

  if (!v9) {
    os_signpost_id_t v9 = @"Unactivated";
  }
  if (([(__CFString *)v9 isEqualToString:@"Activated"] & 1) == 0)
  {
    id v17 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]", 1289, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated: %@", v9);
    id v11 = 0;
    goto LABEL_19;
  }
  os_signpost_id_t v10 = [(MobileActivationDaemon *)self dark];
  id v11 = copy_activation_record(v10);

  if (!v11)
  {
    id v17 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]", 1295, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy activation record.");
LABEL_19:
    id v12 = 0;
    if (!v4) {
      goto LABEL_14;
    }
LABEL_13:
    v4[2](v4, v12, v17);
    goto LABEL_14;
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = [v11 objectForKeyedSubscript:@"DeviceConfigurationFlags"];

  if (v13)
  {
    id v14 = [v11 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
    [v12 setObject:v14 forKeyedSubscript:@"DeviceConfigurationFlags"];
  }
  id v15 = [v11 objectForKeyedSubscript:@"SoftwareUpdate"];

  if (v15)
  {
    id v16 = [v11 objectForKeyedSubscript:@"SoftwareUpdate"];
    [v12 setObject:v16 forKeyedSubscript:@"SoftwareUpdate"];
  }
  id v17 = 0;
  if (v4) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)unbrickDeviceWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    os_signpost_id_t v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UnbrickDeviceXPC", "", buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3254779904;
    v22[2] = __59__MobileActivationDaemon_unbrickDeviceWithCompletionBlock___block_invoke;
    v22[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v23 = v4;
    os_signpost_id_t v24 = v7;
    id v4 = objc_retainBlock(v22);
  }
  id v11 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]", 1, @"Unbrick requested by %@", v11);

  id v12 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v13 = dataMigrationCompleted(v12);

  if (v13)
  {
    id v14 = [(MobileActivationDaemon *)self dark];
    id v15 = data_ark_copy(v14, 0, @"ActivationState");
    id v16 = (__CFString *)isNSString(v15);

    if (!v16) {
      id v16 = @"Unactivated";
    }
    if (![(__CFString *)v16 isEqualToString:@"Unactivated"])
    {
      id v19 = 0;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    id v17 = [(MobileActivationDaemon *)self dark];
    id v21 = 0;
    char v18 = handle_unbrick(v17, &v21);
    id v19 = (NSError *)v21;

    if ((v18 & 1) == 0)
    {
      id v20 = createAndLogError((uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]", 1341, @"com.apple.MobileActivation.ErrorDomain", -1, v19, @"Unbrick failed.");

      id v19 = v20;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else
  {
    id v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]", 1330, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    id v16 = 0;
  }
  if (v4) {
LABEL_17:
  }
    (*((void (**)(id, void, NSError *))v4 + 2))(v4, 0, v19);
LABEL_18:
}

void __59__MobileActivationDaemon_unbrickDeviceWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "UnbrickDeviceXPC", "", v11, 2u);
  }
}

- (void)recertifyDeviceWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__9;
  id v39 = __Block_byref_object_dispose__9;
  id v40 = 0;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    os_signpost_id_t v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RecerityDeviceXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3254779904;
    v31[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke;
    v31[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v32 = v4;
    os_signpost_id_t v33 = v7;
    id v4 = objc_retainBlock(v31);
  }
  id v11 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1, @"Recertification (SB) requested by %@", v11);

  id v12 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v13 = dataMigrationCompleted(v12);

  if (v13)
  {
    id v14 = [(MobileActivationDaemon *)self dark];
    id v15 = data_ark_copy(v14, 0, @"ActivationState");
    id v16 = (__CFString *)isNSString(v15);

    if (!v16) {
      id v16 = @"Unactivated";
    }
    if ([(__CFString *)v16 isEqualToString:@"Activated"])
    {
      id v17 = [MobileRecertifyEngine alloc];
      char v18 = [(MobileActivationDaemon *)self xpcQueue];
      id v19 = [(MobileActivationDaemon *)self dark];
      id v20 = [(MobileRecertifyEngine *)v17 initWithQueue:v18 dark:v19];

      if (v20)
      {
        id v21 = [(MobileActivationDaemon *)self creationQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3254779904;
        block[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_335;
        block[3] = &__block_descriptor_64_e8_32s40s48bs56r_e5_v8__0l;
        id v22 = v20;
        id v27 = v22;
        os_signpost_id_t v28 = self;
        CFStringRef v30 = &v35;
        id v29 = v4;
        dispatch_async((dispatch_queue_t)v21, block);

        goto LABEL_22;
      }
      os_signpost_id_t v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1385, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Failed to allocate recert engine.");
    }
    else
    {
      os_signpost_id_t v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1379, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated: %@", v16);
    }
    id v23 = v24;
  }
  else
  {
    id v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1369, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    id v16 = 0;
  }
  id v25 = (void *)v36[5];
  v36[5] = (uint64_t)v23;

  if (v4) {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0, v36[5]);
  }
  id v22 = 0;
LABEL_22:

  _Block_object_dispose(&v35, 8);
}

void __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "RecerityDeviceXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

void __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_335(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3254779904;
  v4[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_2;
  v4[3] = &__block_descriptor_56_e8_32s40bs48r_e17_v16__0__NSError_8l;
  v1 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 48);
  id v2 = (id)v3;
  *(_OWORD *)id v5 = v3;
  [v1 recertifyDevice:v4];
}

uint64_t __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_2(void *a1, id a2)
{
  if (a2)
  {
    long long v3 = (void *)a1[4];
    id v4 = a2;
    id v5 = [v3 dark];
    writeSplunkLog(v5, 12, -1, (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]_block_invoke_2", 1395, 0, @"%@", v6, (uint64_t)v4);

    uint64_t v7 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]_block_invoke_2", 1396, @"com.apple.MobileActivation.ErrorDomain", -1, v4, @"Recertification failed.");
    uint64_t v8 = *(void *)(a1[6] + 8);
    os_signpost_id_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  os_signpost_id_t v10 = *(uint64_t (**)(void))(a1[5] + 16);

  return v10();
}

- (void)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MobileActivationDaemon *)self callingProcessName];
  id v12 = copySignpostLoggingHandle();
  BOOL v13 = os_signpost_enabled(v12);

  if (v13)
  {
    os_signpost_id_t v14 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v15 = copySignpostLoggingHandle();
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v15, v8);
    }
    id v16 = copySignpostLoggingHandle();
    id v17 = v16;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "HandleActivationInfoXPCV2", " enableTelemetry=YES ", buf, 2u);
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3254779904;
    v53[2] = __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke;
    v53[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v54 = v10;
    os_signpost_id_t v55 = v14;
    id v10 = objc_retainBlock(v53);
  }
  maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1, @"Activation (session) requested by %@", v11);
  id v49 = v9;
  if (!v8)
  {
    uint64_t v38 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1430, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
LABEL_24:
    id v36 = v38;
    id v26 = 0;
    id v22 = 0;
LABEL_29:
    id v32 = 0;
    os_signpost_id_t v28 = 0;
LABEL_30:
    id v34 = 0;
    goto LABEL_31;
  }
  char v18 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v19 = dataMigrationCompleted(v18);

  if ((v19 & 1) == 0)
  {
    uint64_t v38 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1435, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    goto LABEL_24;
  }
  id v20 = [(MobileActivationDaemon *)self dark];
  id v21 = data_ark_copy(v20, 0, @"ActivationState");
  id v22 = (__CFString *)isNSString(v21);

  if (!v22) {
    id v22 = @"Unactivated";
  }
  if (([(__CFString *)v22 isEqualToString:@"Unactivated"] & 1) == 0)
  {
    id v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1445, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Device is already activated (%@).", v22);
LABEL_28:
    id v26 = 0;
    goto LABEL_29;
  }
  if (!v9)
  {
    id v25 = 0;
    goto LABEL_27;
  }
  id v52 = 0;
  unsigned __int8 v23 = [(MobileActivationDaemon *)self validateActivationDataSignature:v8 activationSignature:v9 withError:&v52];
  id v24 = v52;
  id v25 = v24;
  if ((v23 & 1) == 0)
  {
LABEL_27:
    id v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1450, @"com.apple.MobileActivation.ErrorDomain", -1, v25, @"Invalid activation signature.");

    goto LABEL_28;
  }
  id v51 = v24;
  id v26 = getSessionActivationRecordFromData(v8, &v51);
  id v27 = v51;

  if (!v26)
  {
    id v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1456, @"com.apple.MobileActivation.ErrorDomain", -2, v27, @"Failed to extract activation record.");

    goto LABEL_29;
  }
  os_signpost_id_t v28 = [(MobileActivationDaemon *)self activationNonce];
  if (!v28)
  {
    id v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1462, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid activation nonce.");
    id v39 = (NSString *)v27;
LABEL_37:

    id v32 = 0;
    goto LABEL_30;
  }
  id v47 = v27;
  [(MobileActivationDaemon *)self setActivationNonce:0];
  id v29 = [(MobileActivationDaemon *)self activationSessionClientName];
  unsigned __int8 v30 = [(NSString *)v29 isEqualToString:v11];

  if ((v30 & 1) == 0)
  {
    id v40 = [(MobileActivationDaemon *)self activationSessionClientName];
    id v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1469, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid activation session (actual, expected): (%@, %@)", v11, v40);

    id v39 = v40;
    goto LABEL_37;
  }
  CFStringRef v59 = @"ActivationRandomness";
  id v60 = v28;
  id v31 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  id v32 = [(NSDictionary *)v31 mutableCopy];

  id v46 = [(MobileActivationDaemon *)self dark];
  id v33 = copy_activation_record(v46);
  id v34 = +[NSNumber numberWithInt:v33 != 0];

  [v32 setObject:v34 forKeyedSubscript:@"UseCommittedUIK"];
  id v35 = dictionary_to_xml((uint64_t)v26);
  maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 0, @"Activation message:\n%@", v35);

  id v45 = [(MobileActivationDaemon *)self dark];
  CFStringRef v57 = @"ActivationRecord";
  id v58 = v26;
  v44 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  id v50 = v47;
  LOBYTE(v46) = handle_activate(v45, v44, v32, (NSError **)&v50);
  id v36 = (NSError *)v50;

  if ((v46 & 1) == 0)
  {
    id v41 = [(MobileActivationDaemon *)self dark];
    writeSplunkLog(v41, 4, -1, (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1487, 0, @"%@", v42, (uint64_t)v36);

    uint64_t v43 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1488, @"com.apple.MobileActivation.ErrorDomain", -1, v36, @"Failed to activate device.");
    id v36 = v43;
    if (!v10) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (device_supports_dcrt_oob())
  {
    id v48 = [(MobileActivationDaemon *)self dark];
    scheduleXPCActivity(v48, (const char *)[@"com.apple.mobileactivationd.DCRT.OOB" UTF8String], 5u, 1, 0x4000u, 0x1000u, &__block_literal_global_9);

    uint64_t v37 = [(MobileActivationDaemon *)self dark];
    scheduleXPCActivity(v37, (const char *)[@"com.apple.mobileactivationd.SDCRT.OOB" UTF8String], 5u, 1, 0x4000u, 0x1000u, &__block_literal_global_353);

    if (!v10) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_31:
  if (v10) {
LABEL_32:
  }
    (*((void (**)(id, void, NSError *))v10 + 2))(v10, 0, v36);
LABEL_33:
}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "HandleActivationInfoXPCV2", " enableTelemetry=YES ", v11, 2u);
  }
}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke_350(id a1, DataArk *a2)
{
}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke_2(id a1, DataArk *a2)
{
}

- (void)issueClientCertificateLegacy:(id)a3 WithCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__9;
  v40[4] = __Block_byref_object_dispose__9;
  id v41 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__9;
  uint64_t v38 = __Block_byref_object_dispose__9;
  id v39 = 0;
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v6 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v6);
    }
    id v12 = copySignpostLoggingHandle();
    BOOL v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueClientCertificateLegacyXPC", "", buf, 2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3254779904;
    v30[2] = __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke;
    v30[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v31 = v7;
    os_signpost_id_t v32 = v10;
    id v7 = objc_retainBlock(v30);
  }
  id v14 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1, @"Client certification (legacy) requested by %@", v14);
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v42 = @"com.apple.mobileactivationd.spi";
    uint64_t v43 = &__kCFBooleanTrue;
    id v21 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v22 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1530, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v21);
    unsigned __int8 v23 = (void *)v35[5];
    v35[5] = (uint64_t)v22;

    unsigned __int8 v19 = 0;
    goto LABEL_20;
  }
  if (v6)
  {
    id v15 = [(MobileActivationDaemon *)self dark];
    unsigned __int8 v16 = dataMigrationCompleted(v15);

    if (v16)
    {
      id v17 = [(MobileActivationDaemon *)self dark];
      id v18 = data_ark_copy(v17, 0, @"ActivationState");
      unsigned __int8 v19 = (__CFString *)isNSString(v18);

      if (!v19) {
        unsigned __int8 v19 = @"Unactivated";
      }
      if ([(__CFString *)v19 isEqualToString:@"Activated"])
      {
        id v20 = [(MobileActivationDaemon *)self creationQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3254779904;
        block[2] = __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke_357;
        block[3] = &__block_descriptor_64_e8_32s40bs48r56r_e5_v8__0l;
        os_signpost_id_t v28 = &v34;
        id v26 = v6;
        id v29 = v40;
        id v27 = v7;
        dispatch_async((dispatch_queue_t)v20, block);

        goto LABEL_22;
      }
      id v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1550, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated: %@", v19);
      goto LABEL_19;
    }
    id v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1540, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
  }
  else
  {
    id v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1535, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
  }
  unsigned __int8 v19 = 0;
LABEL_19:
  id v21 = (NSDictionary *)v35[5];
  v35[5] = (uint64_t)v24;
LABEL_20:

  if (v7) {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v35[5]);
  }
LABEL_22:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);
}

void __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueClientCertificateLegacyXPC", "", v11, 2u);
  }
}

void __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke_357(void *a1)
{
  CFErrorRef error = 0;
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (v2)
  {
    SecAccessControlRef v3 = v2;
    v24[0] = kSecAttrIsPermanent;
    v24[1] = kSecAttrTokenID;
    v25[0] = &__kCFBooleanFalse;
    v25[1] = kSecAttrTokenIDAppleKeyStore;
    uint64_t v4 = a1[4];
    v24[2] = kSecAttrTokenOID;
    v24[3] = kSecAttrAccessControl;
    v25[2] = v4;
    v25[3] = v2;
    id v5 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
    SecKeyRef v6 = SecKeyCreateWithData((CFDataRef)+[NSData data], (CFDictionaryRef)v5, &error);
    if (v6)
    {
      SecKeyRef v7 = v6;
      uint64_t v8 = *(void *)(a1[6] + 8);
      id obj = *(id *)(v8 + 40);
      id v9 = security_create_system_key_attestation((uint64_t)v6, 2, 0, &obj);
      objc_storeStrong((id *)(v8 + 40), obj);
      if (v9)
      {
        CFStringRef v22 = @"RKCertification";
        id v23 = v9;
        os_signpost_id_t v10 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        uint64_t v11 = a1[7];
      }
      else
      {
        os_signpost_id_t v10 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke", 1583, @"com.apple.MobileActivation.ErrorDomain", -1, *(id *)(*(void *)(a1[6] + 8) + 40), @"Failed to create reference key attestation.");
        uint64_t v11 = a1[6];
      }
      uint64_t v17 = *(void *)(v11 + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v10;

      CFRelease(v7);
    }
    else
    {
      id v14 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke", 1577, @"com.apple.MobileActivation.ErrorDomain", -2, error, @"Failed to convert legacy RK.");
      uint64_t v15 = *(void *)(a1[6] + 8);
      unsigned __int8 v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      id v9 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    id v12 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke", 1566, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to create access control.");
    id v9 = 0;
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v5 = *(NSDictionary **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  uint64_t v19 = a1[5];
  if (v19) {
    (*(void (**)(uint64_t, void, void))(v19 + 16))(v19, *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
}

- (void)issueClientCertificateWithReferenceKey:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = copySignpostLoggingHandle();
  BOOL v12 = os_signpost_enabled(v11);

  if (v12)
  {
    os_signpost_id_t v13 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v14 = copySignpostLoggingHandle();
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v14, v8);
    }
    uint64_t v15 = copySignpostLoggingHandle();
    unsigned __int8 v16 = v15;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "IssueClientCertificateXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3254779904;
    v34[2] = __84__MobileActivationDaemon_issueClientCertificateWithReferenceKey_options_completion___block_invoke;
    v34[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v35 = v10;
    os_signpost_id_t v36 = v13;
    id v10 = objc_retainBlock(v34);
  }
  id v17 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1, @"Client certification requested by %@", v17);
  id v33 = 0;
  char v18 = isSupportedDeviceIdentityClient(1, (NSError **)&v33);
  uint64_t v19 = (NSDictionary *)v33;
  if ((v18 & 1) == 0)
  {
    os_signpost_id_t v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1625, @"com.apple.MobileActivation.ErrorDomain", -25, v19, @"Client is not supported.");
LABEL_23:
    id v29 = v28;
    goto LABEL_24;
  }
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v40 = @"com.apple.mobileactivationd.spi";
    id v41 = &__kCFBooleanTrue;
    id v26 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1630, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v26);
    goto LABEL_21;
  }
  id v20 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v21 = dataMigrationCompleted(v20);

  if ((v21 & 1) == 0)
  {
    os_signpost_id_t v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1635, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    goto LABEL_23;
  }
  if (!v9) {
    goto LABEL_29;
  }
  id v22 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  id v23 = isNSArray(v22);

  if (!v23) {
    goto LABEL_29;
  }
  id v24 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  if ([v24 containsObject:@"1.2.840.113635.100.10.1"]) {
    goto LABEL_16;
  }
  id v25 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  if ([v25 containsObject:@"1.2.840.113635.100.8.1"])
  {

LABEL_16:
    goto LABEL_17;
  }
  id v30 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  unsigned __int8 v31 = [v30 containsObject:@"1.2.840.113635.100.8.3"];

  if ((v31 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_17:
  if ([(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.device-identifiers"])
  {
LABEL_29:
    os_signpost_id_t v32 = [(MobileActivationDaemon *)self dark];
    issueClientCertificateWithReferenceKey(v32, v17, v8, 0, v9, v10);

    goto LABEL_27;
  }
  CFStringRef v38 = @"com.apple.mobileactivationd.device-identifiers";
  id v39 = &__kCFBooleanTrue;
  id v26 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1645, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v26);
LABEL_21:
  id v29 = v27;

  uint64_t v19 = v26;
LABEL_24:

  if (v10) {
    (*((void (**)(id, void, NSError *))v10 + 2))(v10, 0, v29);
  }
  uint64_t v19 = (NSDictionary *)v29;
LABEL_27:
}

void __84__MobileActivationDaemon_issueClientCertificateWithReferenceKey_options_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueClientCertificateXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

- (void)copyAttestationDictionaryWithCompletionBlock:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__9;
  v69 = __Block_byref_object_dispose__9;
  id v70 = 0;
  uint64_t v11 = copySignpostLoggingHandle();
  BOOL v12 = os_signpost_enabled(v11);

  if (v12)
  {
    os_signpost_id_t v13 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v14 = copySignpostLoggingHandle();
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v14, v8);
    }
    uint64_t v15 = copySignpostLoggingHandle();
    unsigned __int8 v16 = v15;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CopyAttestationDictionaryXPC", "", buf, 2u);
    }

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3254779904;
    v61[2] = __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke;
    v61[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v62 = v10;
    os_signpost_id_t v63 = v13;
    id v10 = objc_retainBlock(v61);
  }
  id v17 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1, @"Client attestation requested by %@", v17);
  if (!v8 || !v17)
  {
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1685, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid input(s).");
LABEL_21:
    os_signpost_id_t v28 = 0;
LABEL_22:
    id v29 = 0;
    id v30 = 0;
LABEL_23:
    id v24 = (NSDictionary *)v66[5];
    v66[5] = (uint64_t)v27;
    goto LABEL_26;
  }
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v73 = @"com.apple.mobileactivationd.spi";
    v74 = &__kCFBooleanTrue;
    id v24 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    unsigned __int8 v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1690, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v24);
    os_signpost_id_t v32 = (void *)v66[5];
    v66[5] = (uint64_t)v31;

    goto LABEL_25;
  }
  char v18 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v19 = dataMigrationCompleted(v18);

  if ((v19 & 1) == 0)
  {
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1695, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    goto LABEL_21;
  }
  if (!v9) {
    goto LABEL_33;
  }
  id v20 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  id v21 = isNSArray(v20);

  if (v21)
  {
    id v22 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
    if (([v22 containsObject:@"1.2.840.113635.100.10.1"] & 1) == 0)
    {
      id v23 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
      if (![v23 containsObject:@"1.2.840.113635.100.8.1"])
      {
        id v33 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
        unsigned __int8 v34 = [v33 containsObject:@"1.2.840.113635.100.8.3"];

        if ((v34 & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_18;
      }
    }
LABEL_18:
    if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.device-identifiers"])
    {
      CFStringRef v71 = @"com.apple.mobileactivationd.device-identifiers";
      id v72 = &__kCFBooleanTrue;
      id v24 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      id v25 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1705, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v24);
      id v26 = (void *)v66[5];
      v66[5] = (uint64_t)v25;

LABEL_25:
      os_signpost_id_t v28 = 0;
      id v29 = 0;
      id v30 = 0;
LABEL_26:

      if (v10) {
        (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, v66[5]);
      }
      goto LABEL_28;
    }
  }
LABEL_31:
  id v35 = [v9 objectForKeyedSubscript:@"scrtAttestation"];
  id v36 = isNSNumber(v35);

  if (v36)
  {
    id v37 = [v9 objectForKeyedSubscript:@"scrtAttestation"];
    unsigned __int8 v38 = [v37 BOOLValue];

    goto LABEL_34;
  }
LABEL_33:
  unsigned __int8 v38 = 0;
LABEL_34:
  id v39 = [(MobileActivationDaemon *)self dark];
  id v40 = data_ark_copy(v39, 0, @"ActivationState");
  os_signpost_id_t v28 = (__CFString *)isNSString(v40);

  if (v28)
  {
    if (v38)
    {
LABEL_36:
      id v29 = 0;
      id v30 = 0;
      SecCertificateRef cf = 0;
      goto LABEL_37;
    }
  }
  else
  {
    os_signpost_id_t v28 = @"Unactivated";
    if (v38) {
      goto LABEL_36;
    }
  }
  if (([(__CFString *)v28 isEqualToString:@"Activated"] & 1) == 0)
  {
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1723, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated: %@", v28);
    goto LABEL_22;
  }
  CFStringRef v42 = [(MobileActivationDaemon *)self dark];
  id v29 = data_ark_copy(v42, 0, @"UCRTHealingRequired");

  id v43 = isNSNumber(v29);
  LODWORD(v42) = v43 == 0;

  if (v42)
  {

    id v29 = &__kCFBooleanFalse;
  }
  v44 = [(MobileActivationDaemon *)self dark];
  id v30 = data_ark_copy(v44, 0, @"UCRTOOBForbidden");

  id v45 = isNSNumber(v30);
  LODWORD(v44) = v45 == 0;

  if (v44)
  {

    id v30 = &__kCFBooleanFalse;
  }
  if ([v29 BOOLValue])
  {
    id v46 = (id *)(v66 + 5);
    id obj = (id)v66[5];
    char v47 = ucrtHealingSupported(&obj);
    objc_storeStrong(v46, obj);
    id v48 = (void *)v66[5];
    if (v48)
    {
      id v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1743, @"com.apple.MobileActivation.ErrorDomain", -1, v48, @"Failed to query UCRT healing support.");
    }
    else if (v47)
    {
      if ([v30 BOOLValue]) {
        id v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1753, @"com.apple.MobileActivation.ErrorDomain", -16, 0, @"UCRT healing required but not supported (max failure retries attempted).");
      }
      else {
        id v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1757, @"com.apple.MobileActivation.ErrorDomain", -16, 0, @"UCRT healing required but not performed yet (try again later).");
      }
    }
    else
    {
      id v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1748, @"com.apple.MobileActivation.ErrorDomain", -16, 0, @"UCRT healing required but not supported (user signed into non-HSA2 iCloud account).");
    }
    goto LABEL_23;
  }
  id v49 = [(MobileActivationDaemon *)self dark];
  id v50 = (id *)(v66 + 5);
  id v59 = (id)v66[5];
  id v51 = v49;
  SecCertificateRef cf = copyUCRT(v49, (NSError **)&v59);
  objc_storeStrong(v50, v59);

  if (!cf)
  {
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1763, @"com.apple.MobileActivation.ErrorDomain", -1, (id)v66[5], @"Failed to copy UCRT.");
    goto LABEL_23;
  }
LABEL_37:
  id v41 = [(MobileActivationDaemon *)self creationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke_388;
  block[3] = &__block_descriptor_72_e8_32s40s48s56bs64r_e5_v8__0l;
  id v58 = &v65;
  id v54 = v17;
  id v55 = v9;
  id v56 = v8;
  id v57 = v10;
  dispatch_async((dispatch_queue_t)v41, block);

  if (cf) {
    CFRelease(cf);
  }
LABEL_28:
  _Block_object_dispose(&v65, 8);
}

void __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyAttestationDictionaryXPC", "", v11, 2u);
  }
}

void __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke_388(uint64_t a1)
{
  CFErrorRef error = 0;
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  SecAccessControlRef v3 = v2;
  if (!v2)
  {
    os_signpost_id_t v13 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1785, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.");
LABEL_14:
    id v24 = v13;
    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    id v23 = 0;
    id v22 = 0;
    id v17 = 0;
    goto LABEL_19;
  }
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"clientName"];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SigningKeyAttributes"];
  id v5 = isNSDictionary(v4);
  if (!v5)
  {
    id v12 = 0;
    goto LABEL_7;
  }
  id v6 = v5;
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SigningKeyAttributes"];
  uint64_t v8 = kSecUseSystemKeychain;
  id v9 = [v7 objectForKeyedSubscript:kSecUseSystemKeychain];
  id v10 = isNSNumber(v9);

  if (v10)
  {
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SigningKeyAttributes"];
    id v11 = [v4 objectForKeyedSubscript:v8];
    id v12 = [v11 BOOLValue];

LABEL_7:
    goto LABEL_9;
  }
  id v12 = 0;
LABEL_9:
  SecAccessControlRef v14 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (!v14)
  {
    os_signpost_id_t v13 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1799, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to create access control.");
    goto LABEL_14;
  }
  SecAccessControlRef v15 = v14;
  v38[0] = kSecAttrIsPermanent;
  v38[1] = kSecAttrTokenID;
  v39[0] = &__kCFBooleanFalse;
  v39[1] = kSecAttrTokenIDAppleKeyStore;
  v38[2] = kSecAttrTokenOID;
  v38[3] = kSecAttrAccessControl;
  v39[2] = *(void *)(a1 + 48);
  v39[3] = v14;
  v38[4] = kSecUseSystemKeychain;
  unsigned __int8 v16 = +[NSNumber numberWithBool:v12];
  v39[4] = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];

  char v18 = SecKeyCreateWithData((CFDataRef)+[NSData data], (CFDictionaryRef)v17, &error);
  if (v18)
  {
    unsigned __int8 v19 = v18;
    id v20 = *(void **)(a1 + 40);
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v21 + 40);
    id v22 = create_baa_info(v18, v20, &obj);
    objc_storeStrong((id *)(v21 + 40), obj);
    if (v22)
    {
      CFStringRef v36 = @"RKCertification";
      id v37 = v22;
      id v23 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    }
    else
    {
      id v30 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1820, @"com.apple.MobileActivation.ErrorDomain", -1, *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), @"Failed to create BAA info.");
      uint64_t v31 = *(void *)(*(void *)(a1 + 64) + 8);
      os_signpost_id_t v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;

      id v23 = 0;
    }
    CFRelease(v19);
  }
  else
  {
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1814, @"com.apple.MobileActivation.ErrorDomain", -2, error, @"Failed to convert RK data blob.");
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    id v23 = 0;
    id v22 = 0;
  }
  CFRelease(v15);
LABEL_19:
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  uint64_t v33 = *(void *)(a1 + 56);
  if (v33) {
    (*(void (**)(uint64_t, NSDictionary *, void))(v33 + 16))(v33, v23, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
}

- (void)isInFieldCollectedWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    id v9 = copySignpostLoggingHandle();
    id v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CollectionPerformedXPC", "", buf, 2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3254779904;
    v20[2] = __64__MobileActivationDaemon_isInFieldCollectedWithCompletionBlock___block_invoke;
    v20[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v21 = v4;
    os_signpost_id_t v22 = v7;
    id v4 = objc_retainBlock(v20);
  }
  if ([(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    id v11 = [(MobileActivationDaemon *)self dark];
    unsigned __int8 v12 = dataMigrationCompleted(v11);

    if (v12)
    {
      os_signpost_id_t v13 = [(MobileActivationDaemon *)self dark];
      BOOL v14 = collectionAlreadyPerformed(v13);

      if (v14)
      {
        CFStringRef v24 = @"CollectionLastPerformed";
        uint64_t v25 = &__kCFBooleanTrue;
        SecAccessControlRef v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        unsigned __int8 v16 = 0;
        if (!v4) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]", 1869, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Collection has not been performed for this build.");
    }
    else
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]", 1864, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    }
    unsigned __int8 v16 = MobileActivationError;
  }
  else
  {
    id v17 = [(MobileActivationDaemon *)self callingProcessName];
    CFStringRef v26 = @"com.apple.mobileactivationd.spi";
    id v27 = &__kCFBooleanTrue;
    char v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    unsigned __int8 v16 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]", 1859, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"%@ is missing required entitlement: %@", v17, v18);
  }
  SecAccessControlRef v15 = 0;
  if (v4) {
LABEL_18:
  }
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v15, v16);
LABEL_19:
}

void __64__MobileActivationDaemon_isInFieldCollectedWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CollectionPerformedXPC", "", v11, 2u);
  }
}

- (void)updateBasebandTicket:(id)a3 baaCertData:(id)a4 baaIntermediateCert:(id)a5 options:(id)a6 withCompletionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(MobileActivationDaemon *)self callingProcessName];
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x3032000000;
  id v64 = __Block_byref_object_copy__9;
  uint64_t v65 = __Block_byref_object_dispose__9;
  id v66 = 0;
  uint64_t v55 = 0;
  id v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__9;
  id v59 = __Block_byref_object_dispose__9;
  id v60 = 0;
  char v18 = copySignpostLoggingHandle();
  BOOL v19 = os_signpost_enabled(v18);

  if (v19)
  {
    os_signpost_id_t v20 = 0xEEEEB0B5B2B2EEEELL;
    if (v12 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v21 = copySignpostLoggingHandle();
      os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v21, v12);
    }
    os_signpost_id_t v22 = copySignpostLoggingHandle();
    id v23 = v22;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v20, "UpdateBasebandTicketXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3254779904;
    v51[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke;
    v51[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v52 = v16;
    os_signpost_id_t v53 = v20;
    id v16 = objc_retainBlock(v51);
  }
  maLog((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1, @"Baseband ticket update requested by %@ (%@)", v17, v15);
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v67 = @"com.apple.mobileactivationd.spi";
    v68 = &__kCFBooleanTrue;
    os_signpost_id_t v32 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    uint64_t v33 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1899, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v32);
    unsigned __int8 v34 = (void *)v62[5];
    v62[5] = (uint64_t)v33;

    id v35 = 0;
    goto LABEL_24;
  }
  if (v12 && v13 && v14)
  {
    CFStringRef v24 = [(MobileActivationDaemon *)self dark];
    unsigned __int8 v25 = dataMigrationCompleted(v24);

    if (v25)
    {
      CFStringRef v26 = [(MobileActivationDaemon *)self dark];
      id v27 = data_ark_copy(v26, 0, @"ActivationState");
      id v28 = isNSString(v27);
      id v29 = v56[5];
      v56[5] = v28;

      id v30 = v56[5];
      if (!v30)
      {
        objc_storeStrong(v56 + 5, @"Unactivated");
        id v30 = v56[5];
      }
      if ([v30 isEqualToString:@"Activated"])
      {
        if (use_hactivation())
        {
          uint64_t v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1924, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"Device is hactivated (not supported).");
        }
        else
        {
          if (is_product_cellular())
          {
            id v36 = [v15 objectForKeyedSubscript:@"NetworkTimeoutInterval"];
            id v37 = isNSNumber(v36);

            if (v37)
            {
              id v35 = [v15 objectForKeyedSubscript:@"NetworkTimeoutInterval"];
              [v35 doubleValue];
              if (v38 <= 0.0)
              {
                uint64_t v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1936, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid network timeout requested: %@", v35);
                goto LABEL_23;
              }
            }
            else
            {
              id v35 = 0;
            }
            id v39 = [(MobileActivationDaemon *)self creationQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3254779904;
            block[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_407;
            block[3] = &__block_descriptor_112_e8_32s40s48s56s64s72s80s88bs96r104r_e5_v8__0l;
            id v49 = &v61;
            id v41 = v17;
            id v42 = v15;
            id v43 = v12;
            id v44 = v13;
            id v45 = v14;
            id v46 = self;
            id v35 = v35;
            id v47 = v35;
            id v50 = &v55;
            id v48 = v16;
            dispatch_async((dispatch_queue_t)v39, block);

            goto LABEL_26;
          }
          uint64_t v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1929, @"com.apple.MobileActivation.ErrorDomain", -3, 0, @"Device doesn't support telephony.");
        }
      }
      else
      {
        uint64_t v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1919, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated: %@", v56[5]);
      }
    }
    else
    {
      uint64_t v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1909, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    }
  }
  else
  {
    uint64_t v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1904, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).");
  }
  id v35 = 0;
LABEL_23:
  os_signpost_id_t v32 = (NSDictionary *)v62[5];
  v62[5] = (uint64_t)v31;
LABEL_24:

  if (v16) {
    (*((void (**)(id, void, uint64_t))v16 + 2))(v16, 0, v62[5]);
  }
LABEL_26:
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "UpdateBasebandTicketXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_407(uint64_t a1)
{
  CFErrorRef error = 0;
  uint64_t v175 = 0;
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v157 = v2;
  if (!v2)
  {
    id v14 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 1972, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate dictionary.");
    uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    v149 = 0;
    v150 = 0;
    v152 = 0;
    id v153 = 0;
    id v155 = 0;
    v156 = 0;
    id v154 = 0;
LABEL_76:
    SecAccessControlRef cf = 0;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
LABEL_80:
    uint64_t v7 = 0;
    goto LABEL_81;
  }
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"clientName"];
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularBootstrapProxy"];
  id v4 = isNSNumber(v3);

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularBootstrapProxy"];
    id v155 = v5;
    if (is_product_cellular() && [v5 BOOLValue])
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 96) + 8);
      v173 = *(NSError **)(v6 + 40);
      uint64_t v7 = (NSDictionary *)copyCellularProxyDictionary(1, &v173);
      objc_storeStrong((id *)(v6 + 40), v173);
      if (!v7)
      {
        uint64_t v8 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 1983, @"com.apple.MobileActivation.ErrorDomain", -2, *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), @"Failed to query cellular network proxy info.");
        uint64_t v9 = *(void *)(*(void *)(a1 + 96) + 8);
        os_signpost_id_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        v149 = 0;
        v150 = 0;
        v152 = 0;
        id v153 = 0;
        v156 = 0;
        id v154 = 0;
        SecAccessControlRef cf = 0;
        id v11 = 0;
        id v12 = 0;
        id v13 = 0;
LABEL_81:
        id v41 = 0;
        id v21 = 0;
        goto LABEL_82;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    id v155 = 0;
  }
  id v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularOTAProxy"];
  id v18 = isNSNumber(v17);

  if (!v18)
  {
    v156 = v7;
    id v154 = 0;
    goto LABEL_17;
  }
  id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularOTAProxy"];
  id v154 = v19;
  if (!is_product_cellular() || ![v19 BOOLValue])
  {
    v156 = v7;
LABEL_17:
    int v22 = 0;
    goto LABEL_18;
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 96) + 8);
  v172 = *(NSError **)(v20 + 40);
  id v21 = (NSDictionary *)copyCellularProxyDictionary(0, &v172);
  objc_storeStrong((id *)(v20 + 40), v172);

  if (!v21)
  {
    double v38 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 1996, @"com.apple.MobileActivation.ErrorDomain", -2, *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), @"Failed to query cellular network proxy info.");
    uint64_t v39 = *(void *)(*(void *)(a1 + 96) + 8);
    id v40 = *(void **)(v39 + 40);
    *(void *)(v39 + 40) = v38;

    v149 = 0;
    v150 = 0;
    v152 = 0;
    id v153 = 0;
    v156 = 0;
    SecAccessControlRef cf = 0;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
    uint64_t v7 = 0;
    id v41 = 0;
LABEL_82:
    id v148 = 0;
    id v81 = 0;
    id v60 = 0;
    goto LABEL_83;
  }
  int v22 = 1;
  v156 = v21;
LABEL_18:
  id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyHost"];
  id v24 = isNSString(v23);
  if (v24)
  {
    unsigned __int8 v25 = v24;
    id v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyPort"];
    id v27 = isNSNumber(v26);

    if (!v27) {
      goto LABEL_22;
    }
    v178[0] = @"SOCKSProxyHost";
    id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyHost"];
    v179[0] = v23;
    v178[1] = @"SOCKSProxyPort";
    id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyPort"];
    v179[1] = v28;
    id v29 = +[NSDictionary dictionaryWithObjects:v179 forKeys:v178 count:2];

    v156 = v29;
  }

LABEL_22:
  if (is_internal_build())
  {
    id v30 = objc_alloc((Class)NSUserDefaults);
    id v31 = [v30 persistentDomainForName:@"com.apple.mobileactivationd"];

    id v32 = [v31 objectForKeyedSubscript:@"UseReverseProxy"];
    id v33 = isNSNumber(v32);
    id v153 = v31;
    if (v33)
    {
      unsigned __int8 v34 = v33;
      id v35 = [v31 objectForKeyedSubscript:@"UseReverseProxy"];
      unsigned int v36 = [v35 BOOLValue];

      if (v36)
      {
        if (v156)
        {
          id v37 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2012, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Cannot set both '%@' override and '%@'/'%@' option.", @"UseReverseProxy", @"UseCellularBootstrapProxy", @"UseCellularOTAProxy");
LABEL_75:
          uint64_t v98 = *(void *)(*(void *)(a1 + 96) + 8);
          v99 = *(void **)(v98 + 40);
          *(void *)(v98 + 40) = v37;

          v149 = 0;
          v150 = 0;
          v152 = 0;
          goto LABEL_76;
        }
        v156 = (NSDictionary *)copyReverseProxyDictionary(0, 0, 0);
      }
    }
    else
    {
    }
  }
  else
  {
    id v153 = 0;
  }
  id v42 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SigningKeyAttributes"];
  id v43 = isNSDictionary(v42);
  if (!v43)
  {
    id v50 = 0;
    goto LABEL_35;
  }
  id v44 = v43;
  id v45 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SigningKeyAttributes"];
  uint64_t v46 = kSecUseSystemKeychain;
  id v47 = [v45 objectForKeyedSubscript:kSecUseSystemKeychain];
  id v48 = isNSNumber(v47);

  if (v48)
  {
    id v42 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SigningKeyAttributes"];
    id v49 = [v42 objectForKeyedSubscript:v46];
    id v50 = [v49 BOOLValue];

LABEL_35:
    goto LABEL_37;
  }
  id v50 = 0;
LABEL_37:
  SecAccessControlRef v51 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (!v51)
  {
    id v37 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2028, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to create access control.");
    goto LABEL_75;
  }
  v176[0] = kSecAttrIsPermanent;
  v176[1] = kSecAttrTokenID;
  v177[0] = &__kCFBooleanFalse;
  v177[1] = kSecAttrTokenIDAppleKeyStore;
  v176[2] = kSecAttrTokenOID;
  v176[3] = kSecAttrAccessControl;
  v177[2] = *(void *)(a1 + 48);
  v177[3] = v51;
  SecAccessControlRef cf = v51;
  v176[4] = kSecUseSystemKeychain;
  id v52 = +[NSNumber numberWithBool:v50];
  v177[4] = v52;
  os_signpost_id_t v53 = +[NSDictionary dictionaryWithObjects:v177 forKeys:v176 count:5];

  id v13 = SecKeyCreateWithData((CFDataRef)+[NSData data], (CFDictionaryRef)v53, &error);
  v152 = v53;
  if (!v13)
  {
    v100 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2043, @"com.apple.MobileActivation.ErrorDomain", -2, error, @"Failed to convert RK data blob.");
    uint64_t v101 = *(void *)(*(void *)(a1 + 96) + 8);
    v102 = *(void **)(v101 + 40);
    *(void *)(v101 + 40) = v100;

    v149 = 0;
    v150 = 0;
    id v11 = 0;
LABEL_79:
    id v12 = 0;
    goto LABEL_80;
  }
  id v11 = SecCertificateCreateWithData(kCFAllocatorDefault, *(CFDataRef *)(a1 + 56));
  if (!v11)
  {
    v103 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2049, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate.");
    uint64_t v104 = *(void *)(*(void *)(a1 + 96) + 8);
    v105 = *(void **)(v104 + 40);
    *(void *)(v104 + 40) = v103;

    v149 = 0;
    v150 = 0;
    goto LABEL_79;
  }
  uint64_t v7 = (NSDictionary *)SecCertificateCreateWithData(kCFAllocatorDefault, *(CFDataRef *)(a1 + 64));
  if (!v7)
  {
    v113 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2055, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate.");
    uint64_t v114 = *(void *)(*(void *)(a1 + 96) + 8);
    v115 = *(void **)(v114 + 40);
    *(void *)(v114 + 40) = v113;

    v149 = 0;
    v150 = 0;
    id v12 = 0;
    goto LABEL_81;
  }
  id v54 = [*(id *)(a1 + 72) dark];
  uint64_t v55 = a1 + 96;
  id v56 = *(void **)(a1 + 40);
  uint64_t v57 = *(void *)(*(void *)(a1 + 96) + 8);
  id v171 = *(id *)(v57 + 40);
  v147 = v7;
  uint64_t v7 = create_baseband_info(v54, v13, v11, (__SecCertificate *)v7, v56, &v171);
  objc_storeStrong((id *)(v57 + 40), v171);

  if (v7)
  {
    id v170 = 0;
    uint64_t v58 = *(void *)(*(void *)v55 + 8);
    id obj = *(id *)(v58 + 40);
    char v59 = createXMLRequest(v7, &v170, (NSError **)&obj);
    id v60 = v170;
    objc_storeStrong((id *)(v58 + 40), obj);
    v150 = v7;
    if (v59)
    {
      uint64_t v61 = +[NSString stringWithFormat:@"%@ - %@", @"iOS Device Activator (MobileActivation-1015.60.1)", *(void *)(a1 + 32)];
      if (v61)
      {
        v146 = (uint64_t *)(a1 + 96);
        v149 = v61;
        [v60 setValue:forHTTPHeaderField:];
        id v62 = +[NSURL URLWithString:@"https://albert.apple.com/deviceservices/baseband"];
        [v60 setURL:v62];

        uint64_t v63 = *(void **)(a1 + 80);
        if (v63)
        {
          [v63 doubleValue];
          [v60 setTimeoutInterval:];
        }
        if (is_internal_build())
        {
          id v64 = [v153 objectForKeyedSubscript:@"BasebandOverrideURL"];
          id v65 = isNSString(v64);

          if (v65)
          {
            id v66 = [v153 objectForKeyedSubscript:@"BasebandOverrideURL"];
            CFStringRef v67 = +[NSURL URLWithString:v66];
            [v60 setURL:v67];
          }
        }
        v68 = formatURLRequest(v60);
        id v69 = copy_log_directory_path();
        id v70 = +[NSString stringWithFormat:@"%@_baseband_request.txt", *(void *)(a1 + 32)];
        id v71 = [v69 stringByAppendingPathComponent:v70];
        [(NSMutableString *)v68 writeToFile:v71 atomically:0 encoding:4 error:0];

        if (is_product_cellular())
        {
          if ([v155 BOOLValue])
          {
            id v72 = +[MATelephonyInfo sharedInstance];
            uint64_t v73 = *(void *)(*v146 + 8);
            id v168 = *(id *)(v73 + 40);
            unsigned __int8 v74 = [(MATelephonyInfo *)v72 setCellularBootstrapAssertion:1 withError:&v168];
            objc_storeStrong((id *)(v73 + 40), v168);

            if ((v74 & 1) == 0)
            {
              v75 = copyLoggingHandle();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_4();
              }
            }
          }
          if ([v154 BOOLValue])
          {
            int v76 = +[MATelephonyInfo sharedInstance];
            uint64_t v77 = *(void *)(*v146 + 8);
            id v167 = *(id *)(v77 + 40);
            unsigned __int8 v78 = [(MATelephonyInfo *)v76 setOTAActivationAssertion:1 withError:&v167];
            objc_storeStrong((id *)(v77 + 40), v167);

            if ((v78 & 1) == 0)
            {
              uint64_t v79 = copyLoggingHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_3();
              }
            }
          }
        }
        uint64_t v80 = *(void *)(*v146 + 8);
        id v165 = *(id *)(v80 + 40);
        id v166 = 0;
        id v81 = talkToServerWithError(v60, 0, v22, v156, &v166, &v175, &v165);
        id v82 = v166;
        objc_storeStrong((id *)(v80 + 40), v165);
        if (is_product_cellular())
        {
          if ([v155 BOOLValue])
          {
            uint64_t v83 = +[MATelephonyInfo sharedInstance];
            uint64_t v84 = *(void *)(*v146 + 8);
            id v164 = *(id *)(v84 + 40);
            unsigned __int8 v85 = [(MATelephonyInfo *)v83 setCellularBootstrapAssertion:0 withError:&v164];
            objc_storeStrong((id *)(v84 + 40), v164);

            if ((v85 & 1) == 0)
            {
              v86 = copyLoggingHandle();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_2();
              }
            }
          }
          if ([v154 BOOLValue])
          {
            uint64_t v87 = +[MATelephonyInfo sharedInstance];
            uint64_t v88 = *(void *)(*v146 + 8);
            id v163 = *(id *)(v88 + 40);
            unsigned __int8 v89 = [(MATelephonyInfo *)v87 setOTAActivationAssertion:0 withError:&v163];
            objc_storeStrong((id *)(v88 + 40), v163);

            if ((v89 & 1) == 0)
            {
              v90 = copyLoggingHandle();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_1();
              }
            }
          }
        }
        uint64_t v91 = formatURLResponse(v81, v175, v82);
        id v92 = copy_log_directory_path();
        v93 = +[NSString stringWithFormat:@"%@_baseband_response.txt", *(void *)(a1 + 32)];
        id v94 = [v92 stringByAppendingPathComponent:v93];
        [(NSMutableString *)v91 writeToFile:v94 atomically:0 encoding:4 error:0];

        uint64_t v95 = v175;
        id v148 = v82;
        if (v175 != 200)
        {
          if (v175)
          {
            v129 = *(void **)(*(void *)(*v146 + 8) + 40);
            v130 = +[NSHTTPURLResponse localizedStringForStatusCode:v175];
            v131 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2123, @"com.apple.MobileActivation.ServerErrorDomain", v95, v129, @"Server error: %ld (%@)", v95, v130);

            uint64_t v132 = v175;
            v133 = +[NSHTTPURLResponse localizedStringForStatusCode:v175];
            v134 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2123, @"com.apple.MobileActivation.ErrorDomain", -5, v131, @"Server error: %ld (%@)", v132, v133);

            uint64_t v135 = *(void *)(*v146 + 8);
            v136 = *(void **)(v135 + 40);
            *(void *)(v135 + 40) = v134;
LABEL_109:

            uint64_t v7 = 0;
LABEL_110:
            id v41 = 0;
            id v21 = 0;
            goto LABEL_111;
          }
          v96 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2118, @"com.apple.MobileActivation.ErrorDomain", -6, *(void **)(*(void *)(*v146 + 8) + 40), @"Network communication error.");
          uint64_t v97 = *v146;
LABEL_108:
          uint64_t v137 = *(void *)(v97 + 8);
          v138 = *(void **)(v137 + 40);
          *(void *)(v137 + 40) = v96;
          v136 = v138;
          goto LABEL_109;
        }
        v123 = (void **)(*(void *)(*v146 + 8) + 40);
        if (!v81)
        {
          v96 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2128, @"com.apple.MobileActivation.ErrorDomain", -5, *v123, @"Failed to retrieve client certificate.");
          uint64_t v97 = *v146;
          goto LABEL_108;
        }
        id v162 = 0;
        uint64_t v7 = (NSDictionary *)+[NSPropertyListSerialization propertyListWithData:v81 options:0 format:0 error:&v162];
        objc_storeStrong(v123, v162);
        id v124 = isNSDictionary(v7);

        if (!v124)
        {
          v139 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2134, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*v146 + 8) + 40), @"Failed to convert data to XML.");
          uint64_t v140 = *(void *)(*v146 + 8);
          v141 = *(void **)(v140 + 40);
          *(void *)(v140 + 40) = v139;

          goto LABEL_110;
        }
        id v21 = (NSDictionary *)[(NSDictionary *)v7 objectForKeyedSubscript:@"AccountToken"];
        id v41 = isNSData(v21);

        if (v41)
        {
          v125 = (id *)(*(void *)(*v146 + 8) + 40);
          id v161 = 0;
          id v41 = +[NSPropertyListSerialization propertyListWithData:v21 options:0 format:0 error:&v161];
          objc_storeStrong(v125, v161);
          id v126 = isNSDictionary(v41);

          if (v126)
          {
            v127 = [*(id *)(a1 + 72) xpcQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3254779904;
            block[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_2;
            block[3] = &__block_descriptor_64_e8_32s40s48r56r_e5_v8__0l;
            void block[4] = *(void *)(a1 + 72);
            int8x16_t v160 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
            id v41 = v41;
            id v159 = v41;
            dispatch_sync(v127, block);

            v128 = v159;
LABEL_116:

            goto LABEL_111;
          }
          v142 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2146, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*v146 + 8) + 40), @"Failed to convert data to XML.");
          uint64_t v143 = *v146;
        }
        else
        {
          v142 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2140, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid account token.");
          uint64_t v143 = *v146;
        }
        uint64_t v144 = *(void *)(v143 + 8);
        v145 = *(void **)(v144 + 40);
        *(void *)(v144 + 40) = v142;
        v128 = v145;
        goto LABEL_116;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2074, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create user agent string.");
    }
    else
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2068, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)v55 + 8) + 40), @"Failed to create XML request.");
    }
    v120 = MobileActivationError;
    uint64_t v121 = *(void *)(*(void *)v55 + 8);
    v122 = *(void **)(v121 + 40);
    *(void *)(v121 + 40) = v120;

    id v148 = 0;
    v149 = 0;
    uint64_t v7 = 0;
    id v41 = 0;
    id v21 = 0;
    id v81 = 0;
  }
  else
  {
    v116 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2063, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)v55 + 8) + 40), @"Failed to verify baa cert.");
    uint64_t v117 = *(void *)(*(void *)v55 + 8);
    v118 = *(void **)(v117 + 40);
    *(void *)(v117 + 40) = v116;

    v149 = 0;
    v150 = 0;
    id v41 = 0;
    id v21 = 0;
    id v148 = 0;
    id v81 = 0;
    id v60 = 0;
  }
LABEL_111:
  id v12 = v147;
LABEL_83:
  v106 = v60;
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    v107 = v13;
    v108 = v11;
    v109 = v12;
    id v110 = [*(id *)(a1 + 72) dark];
    writeSplunkLog(v110, 27, v175, (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2176, v157, @"%@", v111, *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
    v112 = v110;
    id v12 = v109;
    id v11 = v108;
    id v13 = v107;
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  if (v13) {
    CFRelease(v13);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (error) {
    CFRelease(error);
  }
}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  id v3 = data_ark_copy(v2, 0, @"ActivationState");
  id v4 = isNSString(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  os_signpost_id_t v10 = *(void **)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (!v10)
  {
    objc_storeStrong(v9, @"Unactivated");
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  if ([v8 isEqualToString:@"Activated"])
  {
    id v11 = [*(id *)(a1 + 32) dark];
    id v12 = *(void **)(a1 + 40);
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v14 + 40);
    char v15 = deliver_baseband_ticket((int)v11, v12, v13, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if ((v15 & 1) == 0)
    {
      id v16 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke_2", 2163, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), @"Failed to deliver baseband ticket.");
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
  else
  {
    id v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke_2", 2158, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated: %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

- (void)copyDCRTWithCompletionBlock:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }
    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CopyDCRTXPC", "", buf, 2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3254779904;
    v29[2] = __69__MobileActivationDaemon_copyDCRTWithCompletionBlock_withCompletion___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v30 = v7;
    os_signpost_id_t v31 = v10;
    id v7 = objc_retainBlock(v29);
  }
  uint64_t v14 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v15 = dataMigrationCompleted(v14);

  if ((v15 & 1) == 0)
  {
    id v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2211, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    uint64_t v20 = 0;
    id v18 = 0;
    goto LABEL_15;
  }
  if (platform_supports_activation())
  {
    id v16 = [(MobileActivationDaemon *)self dark];
    id v17 = data_ark_copy(v16, 0, @"ActivationState");
    id v18 = (__CFString *)isNSString(v17);

    if (!v18) {
      id v18 = @"Unactivated";
    }
    if (([(__CFString *)v18 isEqualToString:@"Activated"] & 1) == 0)
    {
      id v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2222, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated (%@).", v18);
      uint64_t v20 = 0;
LABEL_15:
      id v21 = 0;
      int v22 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v23 = objc_alloc_init((Class)NSMutableDictionary);
  int v22 = v23;
  if (v23)
  {
    if (v6) {
      [v23 addEntriesFromDictionary:v6];
    }
    id v24 = [(MobileActivationDaemon *)self callingProcessName];
    unsigned __int8 v25 = +[NSNumber numberWithBool:client_requires_critical_dcrt_oids((uint64_t)v24)];
    [v22 setObject:v25 forKeyedSubscript:@"ValidateCriticalDcrtOIDs"];

    id v26 = [(MobileActivationDaemon *)self dark];
    id v28 = 0;
    id v21 = copyDCRT(v26, 0, 0, v22, &v28);
    id v19 = (NSError *)v28;

    if (v21)
    {
      CFStringRef v33 = @"DCRTData";
      id v34 = v21;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    }
    else
    {
      id v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2241, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy DCRT.");

      uint64_t v20 = 0;
      id v19 = v27;
    }
  }
  else
  {
    id v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2229, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create mutable dictionary.");
    uint64_t v20 = 0;
    id v21 = 0;
  }
LABEL_16:
  if (v7) {
    (*((void (**)(id, NSDictionary *, NSError *))v7 + 2))(v7, v20, v19);
  }
}

void __69__MobileActivationDaemon_copyDCRTWithCompletionBlock_withCompletion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyDCRTXPC", "", v11, 2u);
  }
}

- (void)getDCRTStateWithCompletionBlock:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }
    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CopyDCRTStateXPC", "", buf, 2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3254779904;
    v30[2] = __73__MobileActivationDaemon_getDCRTStateWithCompletionBlock_withCompletion___block_invoke;
    v30[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v31 = v7;
    os_signpost_id_t v32 = v10;
    id v7 = objc_retainBlock(v30);
  }
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v40 = @"com.apple.mobileactivationd.spi";
    id v41 = &__kCFBooleanTrue;
    int v22 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v20 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2269, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v22);

LABEL_17:
    id v19 = 0;
    id v21 = 0;
    id v18 = 0;
    goto LABEL_18;
  }
  uint64_t v14 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v15 = dataMigrationCompleted(v14);

  if ((v15 & 1) == 0)
  {
    uint64_t v20 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2274, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    goto LABEL_17;
  }
  if (platform_supports_activation())
  {
    id v16 = [(MobileActivationDaemon *)self dark];
    id v17 = data_ark_copy(v16, 0, @"ActivationState");
    id v18 = (__CFString *)isNSString(v17);

    if (!v18) {
      id v18 = @"Unactivated";
    }
    if (([(__CFString *)v18 isEqualToString:@"Activated"] & 1) == 0)
    {
      CFStringRef v38 = @"DCRTState";
      CFStringRef v39 = @"DCRTUnavailable";
      id v19 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      uint64_t v20 = 0;
      id v21 = 0;
LABEL_18:
      id v23 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v24 = objc_alloc_init((Class)NSMutableDictionary);
  id v23 = v24;
  if (!v24)
  {
    uint64_t v20 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2292, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create mutable dictionary.");
    id v19 = 0;
LABEL_31:
    id v21 = 0;
    goto LABEL_19;
  }
  if (v6) {
    [v24 addEntriesFromDictionary:v6];
  }
  id v25 = [(MobileActivationDaemon *)self callingProcessName];
  id v26 = +[NSNumber numberWithBool:client_requires_critical_dcrt_oids((uint64_t)v25)];
  [v23 setObject:v26 forKeyedSubscript:@"ValidateCriticalDcrtOIDs"];

  id v27 = [(MobileActivationDaemon *)self dark];
  id v29 = 0;
  id v21 = copyDCRT(v27, 0, 0, v23, &v29);
  uint64_t v20 = (NSError *)v29;

  if (v21)
  {
    CFStringRef v34 = @"DCRTState";
    CFStringRef v35 = @"DCRTAvailable";
    id v19 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    goto LABEL_19;
  }
  if (mobileactivationErrorHasDomainAndErrorCode(v20, @"com.apple.MobileActivation.ErrorDomain", (id)0xFFFFFFFFFFFFFFF6))
  {

    CFStringRef v36 = @"DCRTState";
    CFStringRef v37 = @"DCRTUnavailable";
    id v19 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    uint64_t v20 = 0;
    goto LABEL_31;
  }
  id v28 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2310, @"com.apple.MobileActivation.ErrorDomain", -1, v20, @"Failed to copy DCRT");

  id v19 = 0;
  id v21 = 0;
  uint64_t v20 = v28;
LABEL_19:
  if (v7) {
    (*((void (**)(id, NSDictionary *, NSError *))v7 + 2))(v7, v19, v20);
  }
}

void __73__MobileActivationDaemon_getDCRTStateWithCompletionBlock_withCompletion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyDCRTStateXPC", "", v11, 2u);
  }
}

- (void)issueDCRT:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }
    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueDCRTXPC", "", buf, 2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3254779904;
    v29[2] = __56__MobileActivationDaemon_issueDCRT_withCompletionBlock___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v30 = v7;
    os_signpost_id_t v31 = v10;
    id v7 = objc_retainBlock(v29);
  }
  id v14 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 1, @"DCRT reissue requested by %@ (%@)", v14, v6);
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v33 = @"com.apple.mobileactivationd.spi";
    CFStringRef v34 = &__kCFBooleanTrue;
    id v26 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v25 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2342, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v26);

    goto LABEL_20;
  }
  unsigned __int8 v15 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    id v25 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2347, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
LABEL_20:
    id v19 = 0;
    if (!v7) {
      goto LABEL_22;
    }
LABEL_21:
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0, v25);
    goto LABEL_22;
  }
  id v17 = [(MobileActivationDaemon *)self dark];
  id v18 = data_ark_copy(v17, 0, @"ActivationState");
  id v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    id v19 = @"Unactivated";
  }
  if (platform_supports_activation()
    && ([(__CFString *)v19 isEqualToString:@"Activated"] & 1) == 0)
  {
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2358, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Device is not activated (%@).", v19);
LABEL_25:
    id v25 = v27;
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v20)
  {
    id v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2365, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create mutable dictionary.", v28);
    goto LABEL_25;
  }
  id v21 = v20;
  if (v6) {
    [v20 addEntriesFromDictionary:v6];
  }
  id v22 = [(MobileActivationDaemon *)self callingProcessName];
  id v23 = +[NSNumber numberWithBool:client_requires_critical_dcrt_oids((uint64_t)v22)];
  [v21 setObject:v23 forKeyedSubscript:@"ValidateCriticalDcrtOIDs"];

  id v24 = [(MobileActivationDaemon *)self dark];
  issueDCRT(v24, v14, v21, v7);

  id v25 = 0;
LABEL_22:
}

void __56__MobileActivationDaemon_issueDCRT_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueDCRTXPC", "", v11, 2u);
  }
}

- (void)issueUCRT:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }
    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueUCRTXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3254779904;
    v23[2] = __56__MobileActivationDaemon_issueUCRT_withCompletionBlock___block_invoke;
    v23[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v24 = v7;
    os_signpost_id_t v25 = v10;
    id v7 = objc_retainBlock(v23);
  }
  id v14 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 1, @"UCRT reissue requested by %@ (%@)", v14, v6);
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v27 = @"com.apple.mobileactivationd.spi";
    uint64_t v28 = &__kCFBooleanTrue;
    id v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v21 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 2403, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v22);

    goto LABEL_16;
  }
  unsigned __int8 v15 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    id v21 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 2408, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
LABEL_16:
    id v19 = 0;
    if (!v7) {
      goto LABEL_18;
    }
LABEL_17:
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0, v21);
    goto LABEL_18;
  }
  id v17 = [(MobileActivationDaemon *)self dark];
  id v18 = data_ark_copy(v17, 0, @"ActivationState");
  id v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    id v19 = @"Unactivated";
  }
  if (([(__CFString *)v19 isEqualToString:@"Activated"] & 1) == 0)
  {
    id v21 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 2418, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Device is not activated (%@).", v19);
    if (!v7) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v20 = [(MobileActivationDaemon *)self dark];
  issueUCRT(v20, v14, v6, v7);

  id v21 = 0;
LABEL_18:
}

void __56__MobileActivationDaemon_issueUCRT_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueUCRTXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

- (void)issueCollection:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }
    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueCollectionXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3254779904;
    v42[2] = __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke;
    void v42[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v43 = v7;
    os_signpost_id_t v44 = v10;
    id v7 = objc_retainBlock(v42);
  }
  id v14 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 1, @"Collection requested by %@ (%@)", v14, v6);
  if (![(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    CFStringRef v47 = @"com.apple.mobileactivationd.spi";
    id v48 = &__kCFBooleanTrue;
    CFStringRef v33 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    os_signpost_id_t v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2455, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v33);

LABEL_30:
    id v19 = 0;
LABEL_31:
    id v20 = 0;
    id v24 = 0;
    id v23 = 0;
    goto LABEL_32;
  }
  unsigned __int8 v15 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    os_signpost_id_t v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2460, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    goto LABEL_30;
  }
  id v17 = [(MobileActivationDaemon *)self dark];
  id v18 = data_ark_copy(v17, 0, @"ActivationState");
  id v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    id v19 = @"Unactivated";
  }
  if (([(__CFString *)v19 isEqualToString:@"Activated"] & 1) == 0)
  {
    os_signpost_id_t v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2470, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Device is not activated (%@).", v19);
    goto LABEL_31;
  }
  id v20 = [v6 objectForKeyedSubscript:@"scheduleCollectionForCurrentBuild"];
  id v21 = isNSNumber(v20);

  if (!v21)
  {

    id v20 = &__kCFBooleanFalse;
  }
  if (![v20 BOOLValue])
  {
    CFStringRef v34 = [(MobileActivationDaemon *)self dark];
    CFStringRef v35 = v6;
    CFStringRef v36 = v34;
    issueCollection(v34, v14, v35, v7);
    CFStringRef v37 = v36;
    id v6 = v35;

    os_signpost_id_t v32 = 0;
    id v30 = 0;
    id v28 = 0;
    id v23 = 0;
    id v24 = 0;
    goto LABEL_34;
  }
  id v22 = +[GestaltHlpr getSharedInstance];
  id v23 = [v22 copyAnswer:@"BuildVersion"];

  id v24 = isNSString(v23);
  if (!v24)
  {
    os_signpost_id_t v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2487, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve build version.");
LABEL_32:
    id v28 = 0;
    id v30 = 0;
    if (!v7) {
      goto LABEL_34;
    }
LABEL_33:
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0, v32);
    goto LABEL_34;
  }
  os_signpost_id_t v25 = [(MobileActivationDaemon *)self dark];
  id v24 = data_ark_copy(v25, 0, @"CollectionLastPerformed");

  id v26 = isNSString(v24);
  if (!v26)
  {

    id v24 = 0;
  }
  CFStringRef v27 = [(MobileActivationDaemon *)self dark];
  id v28 = data_ark_copy(v27, 0, @"InFieldCollectionInFlight");

  id v29 = isNSNumber(v28);
  if (!v29)
  {

    id v28 = &__kCFBooleanFalse;
  }
  id v41 = v6;
  id v30 = [v6 objectForKeyedSubscript:@"IgnoreExistingCollection"];
  id v31 = isNSNumber(v30);

  if (!v31)
  {

    id v30 = &__kCFBooleanFalse;
  }
  id v6 = v41;
  if (([v30 BOOLValue] & 1) == 0
    && ([v24 isEqualToString:v23] & 1) != 0
    || ([v28 BOOLValue] & 1) != 0)
  {
    os_signpost_id_t v32 = 0;
    if (!v7) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  CFStringRef v38 = [(MobileActivationDaemon *)self dark];
  data_ark_remove(v38, 0, @"CollectionLastPerformed");

  CFStringRef v39 = copyLoggingHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v14;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Scheduling collection as requested by %@.", buf, 0xCu);
  }

  CFStringRef v40 = [(MobileActivationDaemon *)self dark];
  scheduleXPCActivity(v40, (const char *)[@"com.apple.mobileactivationd.collection" UTF8String], 5u, 1, 0x5000u, 0x1000u, &__block_literal_global_485);

  os_signpost_id_t v32 = 0;
  id v6 = v41;
  if (v7) {
    goto LABEL_33;
  }
LABEL_34:
}

void __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueCollectionXPC", " enableTelemetry=YES ", v11, 2u);
  }
}

void __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke_483(id a1, DataArk *a2)
{
}

- (void)ucrtUpgradeRequiredWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UCRTUpgradeRequiredXPC", "", buf, 2u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3254779904;
    v31[2] = __65__MobileActivationDaemon_ucrtUpgradeRequiredWithCompletionBlock___block_invoke;
    v31[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v32 = v4;
    os_signpost_id_t v33 = v7;
    id v4 = objc_retainBlock(v31);
  }
  id v11 = [(MobileActivationDaemon *)self dark];
  unsigned __int8 v12 = dataMigrationCompleted(v11);

  if ((v12 & 1) == 0)
  {
    id v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]", 2545, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Data Migration not complete.");
    SecCertificateRef v17 = 0;
    unsigned __int8 v15 = 0;
    goto LABEL_24;
  }
  id v13 = [(MobileActivationDaemon *)self dark];
  id v14 = data_ark_copy(v13, 0, @"ActivationState");
  unsigned __int8 v15 = (__CFString *)isNSString(v14);

  if (!v15) {
    unsigned __int8 v15 = @"Unactivated";
  }
  if (([(__CFString *)v15 isEqualToString:@"Activated"] & 1) == 0)
  {
    id v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]", 2555, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Device is not activated (%@).", v15);
    SecCertificateRef v17 = 0;
LABEL_24:
    id v22 = 0;
    id v24 = 0;
    CFStringRef v27 = 0;
    if (!v4) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  unsigned __int8 v16 = [(MobileActivationDaemon *)self dark];
  id v30 = 0;
  SecCertificateRef v17 = copyUCRT(v16, (NSError **)&v30);
  id v18 = (NSError *)v30;

  if (!v17
    && (mobileactivationErrorHasDomainAndErrorCode(v18, @"com.apple.MobileActivation.ErrorDomain", (id)0xFFFFFFFFFFFFFFFCLL) & 1) == 0)
  {
    id v29 = createAndLogError((uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]", 2561, @"com.apple.MobileActivation.ErrorDomain", -1, v18, @"Failed to copy UCRT.");

    SecCertificateRef v17 = 0;
    id v22 = 0;
    id v24 = 0;
    CFStringRef v27 = 0;
    id v18 = v29;
    if (!v4) {
      goto LABEL_29;
    }
LABEL_28:
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v27, v18);
    goto LABEL_29;
  }
  id v19 = [(MobileActivationDaemon *)self dark];
  id v20 = data_ark_copy(v19, 0, @"UCRTHealingRequired");
  id v21 = isNSNumber(v20);

  if (v21) {
    id v22 = v21;
  }
  else {
    id v22 = &__kCFBooleanFalse;
  }
  id v23 = [(MobileActivationDaemon *)self dark];
  id v24 = data_ark_copy(v23, 0, @"UIKUpgradeRequired");

  id v25 = isNSNumber(v24);
  if (!v25)
  {

    id v24 = &__kCFBooleanFalse;
  }
  CFStringRef v35 = @"UCRTUpgradeRequired";
  if (v17 && ([v22 BOOLValue] & 1) == 0) {
    uint64_t v26 = (uint64_t)[v24 BOOLValue];
  }
  else {
    uint64_t v26 = 1;
  }
  id v28 = +[NSNumber numberWithInt:v26];
  CFStringRef v36 = v28;
  CFStringRef v27 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

  if (v4) {
    goto LABEL_28;
  }
LABEL_29:
  if (v17) {
    CFRelease(v17);
  }
}

void __65__MobileActivationDaemon_ucrtUpgradeRequiredWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "UCRTUpgradeRequiredXPC", "", v11, 2u);
  }
}

- (void)copyLegacyDeviceIdentityWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  CFStringRef v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__9;
  id v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyLegacyIdentityXPC", "", buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3254779904;
    v22[2] = __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke;
    v22[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v23 = v4;
    os_signpost_id_t v24 = v7;
    id v4 = objc_retainBlock(v22);
  }
  if ([(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    id v11 = [(MobileActivationDaemon *)self dark];
    id v12 = data_ark_copy(v11, 0, @"ActivationState");
    id v13 = (__CFString *)isNSString(v12);

    if (!v13) {
      id v13 = @"Unactivated";
    }
    if ([(__CFString *)v13 isEqualToString:@"Activated"])
    {
      id v14 = [(MobileActivationDaemon *)self creationQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3254779904;
      block[2] = __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke_486;
      block[3] = &__block_descriptor_48_e8_32bs40r_e5_v8__0l;
      id v21 = &v26;
      id v20 = v4;
      dispatch_async((dispatch_queue_t)v14, block);

      goto LABEL_17;
    }
    id v18 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]", 2609, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated (%@).", v13);
    unsigned __int8 v15 = (NSDictionary *)v27[5];
    v27[5] = (uint64_t)v18;
  }
  else
  {
    CFStringRef v32 = @"com.apple.mobileactivationd.spi";
    os_signpost_id_t v33 = &__kCFBooleanTrue;
    unsigned __int8 v15 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    unsigned __int8 v16 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]", 2599, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v15);
    SecCertificateRef v17 = (void *)v27[5];
    v27[5] = (uint64_t)v16;

    id v13 = 0;
  }

  if (v4) {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0, v27[5]);
  }
LABEL_17:
  _Block_object_dispose(&v26, 8);
}

void __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyLegacyIdentityXPC", "", v11, 2u);
  }
}

void __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke_486(uint64_t a1)
{
  SecKeyRef privateKeyRef = 0;
  SecCertificateRef certificateRef = 0;
  CFErrorRef error = 0;
  SecIdentityRef identityRef = 0;
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v2 + 40);
  copy_keys_and_certs(@"lockdown-identities", @"com.apple.lockdown.identity.activation", 0, 0, 0, &identityRef, (NSError **)&obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  if (!identityRef)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2636, @"com.apple.MobileActivation.ErrorDomain", -1, *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"Failed to copy legacy device identity.");
LABEL_11:
    os_signpost_id_t v10 = MobileActivationError;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    CFDataRef v4 = 0;
LABEL_15:
    CFDataRef v7 = 0;
    goto LABEL_16;
  }
  uint64_t v3 = SecIdentityCopyCertificate(identityRef, &certificateRef);
  if (v3 || !certificateRef)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2642, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode certificate: %d", v3);
    goto LABEL_11;
  }
  CFDataRef v4 = SecCertificateCopyData(certificateRef);
  if (!v4)
  {
    id v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2648, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy certificate data.");
LABEL_14:
    id v14 = v13;
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned __int8 v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    goto LABEL_15;
  }
  uint64_t v5 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
  if (v5 || !privateKeyRef)
  {
    id v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2654, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to decode private key: %d", v5);
    goto LABEL_14;
  }
  CFDataRef v6 = SecKeyCopyExternalRepresentation(privateKeyRef, &error);
  CFDataRef v7 = v6;
  if (v6)
  {
    v26[0] = @"LegacyDeviceIdentityCertificateDataBlob";
    v26[1] = @"LegacyDeviceIdentityPrivateKeyDataBlob";
    v27[0] = v4;
    v27[1] = v6;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    goto LABEL_17;
  }
  id v18 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2660, @"com.apple.MobileActivation.ErrorDomain", -1, error, @"Failed to copy private key data.");
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

LABEL_16:
  uint64_t v8 = 0;
LABEL_17:
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, NSDictionary *, void))(v17 + 16))(v17, v8, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (identityRef) {
    CFRelease(identityRef);
  }
  SecIdentityRef identityRef = 0;
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  SecCertificateRef certificateRef = 0;
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
  SecKeyRef privateKeyRef = 0;
}

- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeleteLegacyIdentityXPC", "", buf, 2u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3254779904;
    v21[2] = __72__MobileActivationDaemon_deleteLegacyDeviceIdentityWithCompletionBlock___block_invoke;
    void v21[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v22 = v4;
    os_signpost_id_t v23 = v7;
    id v4 = objc_retainBlock(v21);
  }
  id v11 = [(MobileActivationDaemon *)self callingProcessName];
  maLog((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 1, @"Legacy Identity (delete) requested by %@", v11);

  if ([(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    id v12 = [(MobileActivationDaemon *)self dark];
    id v13 = data_ark_copy(v12, 0, @"ActivationState");
    id v14 = (__CFString *)isNSString(v13);

    if (!v14) {
      id v14 = @"Unactivated";
    }
    if (([(__CFString *)v14 isEqualToString:@"Activated"] & 1) == 0)
    {
      uint64_t v17 = createAndLogError((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 2718, @"com.apple.MobileActivation.ErrorDomain", -8, 0, @"Device is not activated (%@).", v14);
      uint64_t v15 = 0;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    CFStringRef v25 = @"UseSystemKeychainSharediPadOnly";
    uint64_t v26 = &__kCFBooleanTrue;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v20 = 0;
    char v16 = delete_identity(@"lockdown-identities", @"com.apple.lockdown.identity.activation", v15, (NSError **)&v20);
    uint64_t v17 = (NSError *)v20;
    if ((v16 & 1) == 0)
    {
      id v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 2727, @"com.apple.MobileActivation.ErrorDomain", -1, v17, @"Failed to delete existing identity.");

      uint64_t v17 = v18;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else
  {
    CFStringRef v27 = @"com.apple.mobileactivationd.spi";
    uint64_t v28 = &__kCFBooleanTrue;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v17 = createAndLogError((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 2708, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v19);

    id v14 = 0;
    uint64_t v15 = 0;
  }
  if (v4) {
LABEL_17:
  }
    (*((void (**)(id, void, NSError *))v4 + 2))(v4, 0, v17);
LABEL_18:
}

void __72__MobileActivationDaemon_deleteLegacyDeviceIdentityWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "DeleteLegacyIdentityXPC", "", v11, 2u);
  }
}

- (void)copyUCRTVersionInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }
    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyUCRTVersionInfoXPC", "", buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3254779904;
    v17[2] = __65__MobileActivationDaemon_copyUCRTVersionInfoWithCompletionBlock___block_invoke;
    v17[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v18 = v4;
    os_signpost_id_t v19 = v7;
    id v4 = objc_retainBlock(v17);
  }
  if ([(MobileActivationDaemon *)self isEntitled:@"com.apple.mobileactivationd.spi"])
  {
    id v16 = 0;
    id v11 = [(MobileActivationDaemon *)self copyUCRTVersionInfoWithError:&v16];
    id v12 = (NSError *)v16;
    if (v11)
    {
      CFStringRef v21 = @"UCRTVersionInfo";
      id v22 = v11;
      id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      if (!v4) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v15 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithCompletionBlock:]", 2757, @"com.apple.MobileActivation.ErrorDomain", -1, v12, @"Failed to copy UCRT version info.");

      id v13 = 0;
      id v12 = v15;
      if (!v4) {
        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
  CFStringRef v23 = @"com.apple.mobileactivationd.spi";
  os_signpost_id_t v24 = &__kCFBooleanTrue;
  id v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v12 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithCompletionBlock:]", 2751, @"com.apple.MobileActivation.ErrorDomain", -7, 0, @"Client is missing required entitlement: %@", v14);

  id v13 = 0;
  id v11 = 0;
  if (v4) {
LABEL_13:
  }
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v13, v12);
LABEL_14:
}

void __65__MobileActivationDaemon_copyUCRTVersionInfoWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  uint64_t v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyUCRTVersionInfoXPC", "", v11, 2u);
  }
}

- (void)setDark:(id)a3
{
}

- (unint64_t)sessionStartTime
{
  return self->_sessionStartTime;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (OS_dispatch_queue)creationQueue
{
  return self->_creationQueue;
}

- (NSString)activationNonce
{
  return self->_activationNonce;
}

- (void)setActivationNonce:(id)a3
{
}

- (NSString)activationSessionClientName
{
  return self->_activationSessionClientName;
}

- (void)setActivationSessionClientName:(id)a3
{
}

- (NSString)recertNonce
{
  return self->_recertNonce;
}

- (void)setRecertNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recertNonce, 0);
  objc_storeStrong((id *)&self->_activationSessionClientName, 0);
  objc_storeStrong((id *)&self->_activationNonce, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_dark, 0);

  objc_storeStrong((id *)&self->_sessionHelloMessage, 0);
}

@end