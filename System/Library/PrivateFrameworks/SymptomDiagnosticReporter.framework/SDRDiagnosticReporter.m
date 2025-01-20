@interface SDRDiagnosticReporter
+ (BOOL)isABCEnabled;
+ (id)newXPCConnection;
+ (void)initialize;
+ (void)isABCEnabled;
- (BOOL)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6;
- (BOOL)addToSession:(id)a3 event:(id)a4 payload:(id)a5 reply:(id)a6;
- (BOOL)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6;
- (BOOL)cancelSession:(id)a3;
- (BOOL)endSession:(id)a3;
- (BOOL)getDiagnosticPayloadsForSignatures:(id)a3 reply:(id)a4;
- (BOOL)groupCaseIdentifierForSignature:(id)a3 reply:(id)a4;
- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8;
- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9;
- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7;
- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8;
- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7;
- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8;
- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7;
- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8;
- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 payload:(id)a5 reply:(id)a6;
- (BOOL)snapshotWithSignature:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5 delay:(double)a6 events:(id)a7 payload:(id)a8 actions:(id)a9 reply:(id)a10;
- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7;
- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8;
- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9;
- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7;
- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8;
- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 payload:(id)a5 reply:(id)a6;
- (BOOL)startSessionWithSignature:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5 duration:(double)a6 events:(id)a7 payload:(id)a8 actions:(id)a9 reply:(id)a10;
- (BOOL)triggerRemoteSessionForSignature:(id)a3 caseGroupID:(id)a4 reply:(id)a5;
- (OS_dispatch_queue)queue;
- (SDRDiagnosticReporter)init;
- (SDRDiagnosticReporter)initWithQueue:(id)a3;
- (SDRDiagnosticReporterDelegate)delegate;
- (id)_payloadAugmentedWithSandboxExtensionTokensDict:(id)a3;
- (id)actionsDictionary:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5;
- (id)buildDiagnosticIncidentEventForCaseSignature:(id)a3 handledResult:(unint64_t)a4 dampeningResult:(unint64_t)a5 closureType:(unint64_t)a6;
- (id)signatureWithDomain:(id)a3 type:(id)a4 subType:(id)a5 detectedProcess:(id)a6 triggerThresholdValues:(id)a7;
- (id)signatureWithDomain:(id)a3 type:(id)a4 subType:(id)a5 subtypeContext:(id)a6 detectedProcess:(id)a7 triggerThresholdValues:(id)a8;
- (int)checkSignatureValidity:(id)a3;
- (void)caseSummariesListCallbackWithResult:(id)a3 service:(id)a4 caseSummaryType:(id)a5 count:(unint64_t)a6 container:(id)a7 reply:(id)a8;
- (void)casesListCallbackWithResult:(id)a3 service:(id)a4 identifier:(id)a5 count:(unint64_t)a6 container:(id)a7 reply:(id)a8;
- (void)commonPreflightChecksForSignature:(id)a3 payload:(id)a4 callback:(id)a5;
- (void)dealloc;
- (void)getAllDiagnosticCasesWithReply:(id)a3;
- (void)getAutoBugCaptureConfiguration:(id)a3;
- (void)getDiagnosticCaseSummariesOfType:(id)a3 reply:(id)a4;
- (void)getDiagnosticCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4;
- (void)parseCaseTriggerResponse:(id)a3;
- (void)purgeAutoBugCaptureFilesWithSubPaths:(id)a3 reply:(id)a4;
- (void)resetAPIRateLimit;
- (void)resetDailyCaseLimit;
- (void)setDelegate:(id)a3;
- (void)setupXPCInterface;
- (void)submitDiagnosticIncidentEventForCaseSignature:(id)a3 handledResult:(unint64_t)a4 dampeningResult:(unint64_t)a5 closureType:(unint64_t)a6;
@end

@implementation SDRDiagnosticReporter

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global);
  }
}

- (id)signatureWithDomain:(id)a3 type:(id)a4 subType:(id)a5 detectedProcess:(id)a6 triggerThresholdValues:(id)a7
{
  return [(SDRDiagnosticReporter *)self signatureWithDomain:a3 type:a4 subType:a5 subtypeContext:0 detectedProcess:a6 triggerThresholdValues:a7];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

BOOL __35__SDRDiagnosticReporter_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.symptomdiagnosticreporter", "framework");
  v1 = (void *)logHandle;
  logHandle = (uint64_t)v0;

  BOOL result = +[SDRDiagnosticReporter isABCEnabled];
  isEnabled = result;
  return result;
}

void __76__SDRDiagnosticReporter_snapshotWithSignature_duration_event_payload_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7
{
  v23[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  if (isEnabled)
  {
    if (v13)
    {
      v23[0] = v13;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    }
    else
    {
      v17 = 0;
    }
    BOOL v19 = [(SDRDiagnosticReporter *)self snapshotWithSignature:v12 delay:v17 events:v14 payload:0 actions:0 wantsRemoteCase:v16 reply:a4];
  }
  else
  {
    if (!v15)
    {
      BOOL v19 = 0;
      goto LABEL_9;
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__SDRDiagnosticReporter_snapshotWithSignature_duration_event_payload_reply___block_invoke;
    block[3] = &unk_264186058;
    id v22 = v15;
    dispatch_async(queue, block);
    BOOL v19 = 0;
    v17 = v22;
  }

LABEL_9:
  return v19;
}

- (SDRDiagnosticReporter)init
{
  v3 = dispatch_get_global_queue(17, 0);
  v4 = [(SDRDiagnosticReporter *)self initWithQueue:v3];

  return v4;
}

- (SDRDiagnosticReporter)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDRDiagnosticReporter;
  v5 = [(SDRDiagnosticReporter *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
    }
    else
    {
      dispatch_get_global_queue(17, 0);
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    queue = v5->_queue;
    v5->_queue = v6;

    +[CaseDampeningExceptions setLoggingHandle:logHandle];
    [(SDRDiagnosticReporter *)v5 setupXPCInterface];
  }

  return v5;
}

- (void)setupXPCInterface
{
  if (isEnabled)
  {
    v3 = +[SDRDiagnosticReporter newXPCConnection];
    connection = self->_connection;
    self->_connection = v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C30BEB8];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v5];

    objc_initWeak(location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke;
    v12[3] = &unk_264186030;
    objc_copyWeak(&v13, location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v12];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    objc_super v9 = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2;
    v10 = &unk_264186030;
    objc_copyWeak(&v11, location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&v7];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_210A0E000, v6, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter is disabled.", (uint8_t *)location, 2u);
    }
  }
}

+ (BOOL)isABCEnabled
{
  _MergedGlobals = os_variant_has_internal_diagnostics();
  id v2 = dlopen("/usr/lib/libMobileGestalt.dylib", 261);
  if (v2)
  {
    v3 = v2;
    id v4 = (uint64_t (*)(__CFString *))dlsym(v2, "MGGetStringAnswer");
    CFStringRef v5 = (const __CFString *)v4(@"ReleaseType");
    if (v5) {
      byte_26AA4C531 = CFEqual(v5, @"Vendor");
    }
    dlclose(v3);
  }
  v6 = logHandle;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    +[SDRDiagnosticReporter isABCEnabled](v6);
  }
  return (_MergedGlobals | byte_26AA4C531) != 0;
}

- (id)signatureWithDomain:(id)a3 type:(id)a4 subType:(id)a5 subtypeContext:(id)a6 detectedProcess:(id)a7 triggerThresholdValues:(id)a8
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", a3, @"domain", a4, @"type", a7, @"detected", 0);
  if ([v13 length]) {
    [v16 setObject:v13 forKey:@"subtype"];
  }
  if ([v14 length]) {
    [v16 setObject:v14 forKey:@"additional"];
  }
  if ([v15 length]) {
    [v16 setObject:v15 forKey:@"threshval"];
  }

  return v16;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SDRDiagnosticReporter;
  [(SDRDiagnosticReporter *)&v5 dealloc];
}

+ (id)newXPCConnection
{
  id v2 = objc_alloc(MEMORY[0x263F08D68]);

  return (id)[v2 initWithMachServiceName:@"com.apple.symptom_diagnostics" options:4096];
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
  {
    __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_cold_1();
    if (!v2) {
      goto LABEL_5;
    }
  }
  else if (!v2)
  {
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
    v3 = [WeakRetained queue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_121;
    v4[3] = &unk_264186008;
    id v5 = v2;
    id v6 = WeakRetained;
    dispatch_async(v3, v4);
  }
LABEL_5:
}

uint64_t __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_121(uint64_t a1)
{
  return [*(id *)(a1 + 32) reporterConnectionInvalidated:*(void *)(a1 + 40)];
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
  {
    __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2_cold_1();
    if (!v2) {
      goto LABEL_5;
    }
  }
  else if (!v2)
  {
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
    v3 = [WeakRetained queue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_124;
    v4[3] = &unk_264186008;
    id v5 = v2;
    id v6 = WeakRetained;
    dispatch_async(v3, v4);
  }
LABEL_5:
}

uint64_t __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_124(uint64_t a1)
{
  return [*(id *)(a1 + 32) reporterConnectionInterrupted:*(void *)(a1 + 40)];
}

- (int)checkSignatureValidity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"domain"];
  id v5 = v4;
  if (!v4 || ![v4 length])
  {
    id v6 = &kSymptomDiagnosticErrorInvalidParameters;
    goto LABEL_6;
  }
  if ((unint64_t)[v5 length] < 0x101)
  {
    objc_super v9 = [v3 objectForKeyedSubscript:@"type"];
    v10 = v9;
    if (v9 && [v9 length])
    {
      if ((unint64_t)[v10 length] < 0x101)
      {
        id v12 = [v3 objectForKeyedSubscript:@"subtype"];
        id v13 = v12;
        if (v12 && (unint64_t)[v12 length] >= 0x101)
        {
          int v7 = 23;
        }
        else
        {
          id v14 = [v3 objectForKeyedSubscript:@"additional"];
          id v15 = v14;
          if (v14 && (unint64_t)[v14 length] >= 0x101)
          {
            int v7 = 23;
          }
          else
          {
            v16 = [v3 objectForKeyedSubscript:@"detected"];
            v17 = v16;
            if (v16 && (unint64_t)[v16 length] > 0x100) {
              v18 = &kSymptomDiagnosticErrorInvalidSignature;
            }
            else {
              v18 = &kSymptomDiagnosticErrorNone;
            }
            int v7 = *v18;
          }
        }

        goto LABEL_14;
      }
      id v11 = &kSymptomDiagnosticErrorInvalidSignature;
    }
    else
    {
      id v11 = &kSymptomDiagnosticErrorInvalidParameters;
    }
    int v7 = *v11;
LABEL_14:

    goto LABEL_7;
  }
  id v6 = &kSymptomDiagnosticErrorInvalidSignature;
LABEL_6:
  int v7 = *v6;
LABEL_7:

  return v7;
}

- (id)actionsDictionary:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [v7 mutableCopy];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v10 = (void *)v9;
  id v11 = [v8 allObjects];
  [v10 setObject:v11 forKey:@"idsdest"];

  double v12 = 3600.0;
  if (a5 >= 1.0) {
    double v12 = a5;
  }
  id v13 = [NSNumber numberWithDouble:v12];
  [v10 setObject:v13 forKey:@"remotewindow"];

  return v10;
}

- (BOOL)groupCaseIdentifierForSignature:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (isEnabled)
  {
    int v9 = [(SDRDiagnosticReporter *)self checkSignatureValidity:v6];
    if (v9)
    {
      if (!v8)
      {
LABEL_13:
        BOOL v15 = v9 == 0;
        goto LABEL_14;
      }
      queue = self->_queue;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_4;
      v20[3] = &unk_2641860F8;
      id v11 = &v21;
      id v21 = v8;
      int v22 = v9;
      dispatch_async(queue, v20);
    }
    else
    {
      connection = self->_connection;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke;
      v25[3] = &unk_264186080;
      id v11 = &v26;
      id v12 = v8;
      v25[4] = self;
      id v26 = v12;
      id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v25];
      if (v13)
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        void v23[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_2;
        v23[3] = &unk_2641860D0;
        v23[4] = self;
        id v24 = v12;
        [v13 requestGroupCaseIdentifierForSignature:v6 reply:v23];
      }
      else
      {
        int v9 = 10;
      }
    }
    goto LABEL_13;
  }
  if (v7)
  {
    id v14 = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_5;
    block[3] = &unk_264186058;
    id v19 = v7;
    dispatch_async(v14, block);
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_127;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_127(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_3;
    v6[3] = &unk_2641860A8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, *(int *)(a1 + 40), 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_payloadAugmentedWithSandboxExtensionTokensDict:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"path"];
    if ([v5 count])
    {
      id v24 = v4;
      id v6 = [MEMORY[0x263EFF9A0] dictionary];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v23 = v5;
      id obj = v5;
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(id *)(*((void *)&v26 + 1) + 8 * i);
            [v11 UTF8String];
            uint64_t v12 = sandbox_extension_issue_file();
            id v13 = logHandle;
            if (v12)
            {
              id v14 = (void *)v12;
              if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                id v31 = v11;
                _os_log_impl(&dword_210A0E000, v13, OS_LOG_TYPE_INFO, "SDRDiagnosticReporter: Granted Read sandbox extension for payload path '%{public}@'.", buf, 0xCu);
              }
              BOOL v15 = objc_msgSend(NSString, "stringWithUTF8String:", v14, v23);
              [v6 setObject:v15 forKeyedSubscript:v11];

              free(v14);
            }
            else if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR))
            {
              v16 = v13;
              v17 = __error();
              v18 = strerror(*v17);
              *(_DWORD *)buf = 138543618;
              id v31 = v11;
              __int16 v32 = 2080;
              v33 = v18;
              _os_log_error_impl(&dword_210A0E000, v16, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: Failed to grant Read sandbox extension for payload path '%{public}@' with error: %s.", buf, 0x16u);
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v8);
      }

      uint64_t v19 = [v6 count];
      if (v19 == [obj count])
      {
        id v4 = v24;
        id v20 = (id)[v24 mutableCopy];
        [v20 setObject:v6 forKeyedSubscript:@"sandbox_ext_token_dict"];
      }
      else
      {
        id v21 = (void *)logHandle;
        if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR)) {
          [(SDRDiagnosticReporter *)v21 _payloadAugmentedWithSandboxExtensionTokensDict:v6];
        }
        id v20 = 0;
        id v4 = v24;
      }
      id v5 = v23;
    }
    else
    {
      id v20 = v4;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)commonPreflightChecksForSignature:(id)a3 payload:(id)a4 callback:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v10)
  {
    if (isEnabled)
    {
      uint64_t v12 = [(SDRDiagnosticReporter *)self checkSignatureValidity:v8];
      if (!v12)
      {
        uint64_t v13 = [(SDRDiagnosticReporter *)self _payloadAugmentedWithSandboxExtensionTokensDict:v9];
        id v14 = (void *)v13;
        if (v9 && !v13)
        {
          BOOL v15 = &kSymptomDiagnosticErrorPayloadSandboxTokenError;
LABEL_29:
          v11[2](v11, *v15, 0);
          goto LABEL_30;
        }
        if (+[CaseDampeningExceptions allowDampeningExceptionFor:v8])
        {
          v17 = logHandle;
          if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_210A0E000, v17, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Signature matches dampening exception, will permit XPC call", (uint8_t *)&v23, 2u);
          }
        }
        else
        {
          v18 = [MEMORY[0x263EFF910] date];
          [v18 timeIntervalSince1970];
          double v20 = v19;

          if (v20 < *(double *)&_dailyCaseLimitActiveUntil)
          {
            id v21 = logHandle;
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v23 = 134217984;
              uint64_t v24 = _dailyCaseLimitActiveUntil;
              _os_log_impl(&dword_210A0E000, v21, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: A daily rate limit is in effect until %.0f. Rejecting case", (uint8_t *)&v23, 0xCu);
            }
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
              -[SDRDiagnosticReporter commonPreflightChecksForSignature:payload:callback:]();
            }
            [(SDRDiagnosticReporter *)self submitDiagnosticIncidentEventForCaseSignature:v8 handledResult:2 dampeningResult:2 closureType:3];
            BOOL v15 = &kSymptomDiagnosticErrorDailyLimitExceeded;
            goto LABEL_29;
          }
          if (*(double *)&_dailyCaseLimitActiveUntil > 0.0) {
            [(SDRDiagnosticReporter *)self resetDailyCaseLimit];
          }
          if (v20 < *(double *)&_apiRateLimitActiveUntil)
          {
            int v22 = logHandle;
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
            {
              int v23 = 134217984;
              uint64_t v24 = _apiRateLimitActiveUntil;
              _os_log_impl(&dword_210A0E000, v22, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: An API rate limit is in effect until %.0f. Rejecting case", (uint8_t *)&v23, 0xCu);
            }
            if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
              -[SDRDiagnosticReporter commonPreflightChecksForSignature:payload:callback:]();
            }
            [(SDRDiagnosticReporter *)self submitDiagnosticIncidentEventForCaseSignature:v8 handledResult:2 dampeningResult:8 closureType:3];
            BOOL v15 = &kSymptomDiagnosticErrorRequestThrottled;
            goto LABEL_29;
          }
          if (*(double *)&_apiRateLimitActiveUntil > 0.0) {
            [(SDRDiagnosticReporter *)self resetAPIRateLimit];
          }
        }
        ((void (**)(void, uint64_t, void *))v11)[2](v11, v12, v14);
LABEL_30:

        goto LABEL_31;
      }
      v16 = logHandle;
      if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138477827;
        uint64_t v24 = (uint64_t)v8;
        _os_log_impl(&dword_210A0E000, v16, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Failed signature validation check for %{private}@", (uint8_t *)&v23, 0xCu);
      }
      v11[2](v11, v12, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
    }
  }
LABEL_31:
}

- (void)parseCaseTriggerResponse:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"success"];
  char v5 = [v4 BOOLValue];

  id v6 = [v3 objectForKeyedSubscript:@"reason"];
  int v7 = [v6 intValue];

  if ((v5 & 1) == 0)
  {
    id v8 = [MEMORY[0x263EFF910] date];
    id v9 = v8;
    if (v7 == 31)
    {
      [v8 timeIntervalSince1970];
      unint64_t v11 = (unint64_t)v10;
      [v9 timeIntervalSince1970];
      *(double *)&_dailyCaseLimitActiveUntil = (double)(v11
                                                      + 86400
                                                      + 86400 * ((unint64_t)v12 / 0x15180)
                                                      - (unint64_t)v12);
      uint64_t v13 = logHandle;
      if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = _dailyCaseLimitActiveUntil;
        _os_log_impl(&dword_210A0E000, v13, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Received 'daily limit exceeded' response. Will reject all cases until %.0f", (uint8_t *)&v19, 0xCu);
      }
    }
    else if (v7 == 41)
    {
      id v14 = [v3 objectForKeyedSubscript:@"expiresIn"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v14 doubleValue];
        double v16 = v15;
        [v9 timeIntervalSince1970];
        *(double *)&_apiRateLimitActiveUntil = v16 + v17;
        v18 = logHandle;
        if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134218240;
          uint64_t v20 = _apiRateLimitActiveUntil;
          __int16 v21 = 2048;
          double v22 = v16;
          _os_log_impl(&dword_210A0E000, v18, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Received 'API rate limit exceeded' response. Will reject all cases until %.0f (in %.0f s)", (uint8_t *)&v19, 0x16u);
        }
      }
    }
  }
}

- (void)resetDailyCaseLimit
{
  if (*(double *)&_dailyCaseLimitActiveUntil > 0.0)
  {
    id v2 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_210A0E000, v2, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Resetting daily case limiter", v3, 2u);
    }
    _dailyCaseLimitActiveUntil = 0;
  }
}

- (void)resetAPIRateLimit
{
  if (*(double *)&_apiRateLimitActiveUntil > 0.0)
  {
    id v2 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_210A0E000, v2, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter: Resetting API rate limiter", v3, 2u);
    }
    _apiRateLimitActiveUntil = 0;
  }
}

- (void)submitDiagnosticIncidentEventForCaseSignature:(id)a3 handledResult:(unint64_t)a4 dampeningResult:(unint64_t)a5 closureType:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v13 = [(SDRDiagnosticReporter *)self buildDiagnosticIncidentEventForCaseSignature:v10 handledResult:a4 dampeningResult:a5 closureType:a6];
  id v11 = v13;
  id v12 = v10;
  AnalyticsSendEventLazy();
}

id __113__SDRDiagnosticReporter_submitDiagnosticIncidentEventForCaseSignature_handledResult_dampeningResult_closureType___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (void *)logHandle;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    char v5 = [v3 objectForKeyedSubscript:@"domain"];
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"type"];
    int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"subtype"];
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"detected"];
    int v11 = 138544130;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2114;
    double v16 = v7;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_210A0E000, v4, OS_LOG_TYPE_INFO, "Submitting analytics for case domain=%{public}@ type=%{public}@ subtype=%{public}@ process=%{public}@ to CoreAnalytics", (uint8_t *)&v11, 0x2Au);
  }
  id v9 = *(void **)(a1 + 40);

  return v9;
}

- (id)buildDiagnosticIncidentEventForCaseSignature:(id)a3 handledResult:(unint64_t)a4 dampeningResult:(unint64_t)a5 closureType:(unint64_t)a6
{
  id v9 = (objc_class *)MEMORY[0x263EFF9A0];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  id v12 = [v10 objectForKeyedSubscript:@"domain"];
  [v11 setObject:v12 forKeyedSubscript:@"caseDomain"];

  __int16 v13 = [v10 objectForKeyedSubscript:@"type"];
  [v11 setObject:v13 forKeyedSubscript:@"caseType"];

  id v14 = [v10 objectForKeyedSubscript:@"subtype"];
  [v11 setObject:v14 forKeyedSubscript:@"caseSubtype"];

  __int16 v15 = [v10 objectForKeyedSubscript:@"additional"];
  [v11 setObject:v15 forKeyedSubscript:@"caseSubtypeContext"];

  double v16 = [v10 objectForKeyedSubscript:@"detected"];

  [v11 setObject:v16 forKeyedSubscript:@"caseDetectedProcess"];
  [v11 setObject:&stru_26C3062D8 forKeyedSubscript:@"caseIdentifier"];
  [v11 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"hasGroupIdentifier"];
  __int16 v17 = [NSNumber numberWithUnsignedInteger:a4];
  [v11 setObject:v17 forKeyedSubscript:@"handledResult"];

  v18 = [NSNumber numberWithUnsignedInteger:a5];
  [v11 setObject:v18 forKeyedSubscript:@"dampeningResult"];

  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a6];
  [v11 setObject:v19 forKeyedSubscript:@"closureType"];

  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    -[SDRDiagnosticReporter buildDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:]();
  }

  return v11;
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7
{
  return [(SDRDiagnosticReporter *)self snapshotWithSignature:a3 delay:a5 events:a6 payload:0 actions:0 wantsRemoteCase:a7 reply:a4];
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8
{
  return [(SDRDiagnosticReporter *)self snapshotWithSignature:a3 delay:a5 events:a6 payload:0 actions:a7 wantsRemoteCase:a8 reply:a4];
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8
{
  return [(SDRDiagnosticReporter *)self snapshotWithSignature:a3 delay:a5 events:a6 payload:a7 actions:0 wantsRemoteCase:a8 reply:a4];
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7
{
  return [(SDRDiagnosticReporter *)self snapshotWithSignature:a3 delay:a5 events:a6 payload:0 actions:0 wantsRemoteCase:a7 reply:a4];
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8
{
  return [(SDRDiagnosticReporter *)self snapshotWithSignature:a3 delay:a5 events:a6 payload:0 actions:a7 wantsRemoteCase:a8 reply:a4];
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8
{
  return [(SDRDiagnosticReporter *)self snapshotWithSignature:a3 delay:a5 events:a6 payload:a7 actions:0 wantsRemoteCase:a8 reply:a4];
}

- (BOOL)snapshotWithSignature:(id)a3 delay:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v26[3] = &unk_264186148;
  v26[4] = self;
  id v31 = &v34;
  id v21 = v20;
  id v30 = v21;
  id v22 = v16;
  id v27 = v22;
  double v32 = a4;
  id v23 = v17;
  id v28 = v23;
  id v24 = v19;
  id v29 = v24;
  BOOL v33 = a8;
  [(SDRDiagnosticReporter *)self commonPreflightChecksForSignature:v22 payload:v18 callback:v26];
  LOBYTE(self) = *((unsigned char *)v35 + 24);

  _Block_object_dispose(&v34, 8);
  return (char)self;
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v6 = logHandle;
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
      __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_3(a1, v6, v7, v8, v9, v10, v11, v12);
    }
    __int16 v13 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    {
      __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_2();
      if (v13) {
        goto LABEL_6;
      }
    }
    else if (v13)
    {
LABEL_6:
      unint64_t v14 = (unint64_t)*(double *)(a1 + 80);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(unsigned __int8 *)(a1 + 88);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_2;
      v27[3] = &unk_2641860D0;
      uint64_t v18 = *(void *)(a1 + 56);
      id v19 = *(id *)(a1 + 64);
      v27[4] = *(void *)(a1 + 32);
      id v28 = v19;
      [v13 snapshotWithSignature:v15 delay:v14 events:v16 payload:v5 actions:v18 wantsRemoteCase:v17 reply:v27];

LABEL_14:
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR)) {
      __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id v22 = *(void **)(a1 + 64);
    if (v22)
    {
      id v23 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_169;
      v29[3] = &unk_264186058;
      id v30 = v22;
      dispatch_async(v23, v29);
      __int16 v13 = v30;
    }
    goto LABEL_14;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  id v20 = *(void **)(a1 + 64);
  if (v20)
  {
    id v21 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_4;
    block[3] = &unk_2641860F8;
    id v25 = v20;
    int v26 = a2;
    dispatch_async(v21, block);
    __int16 v13 = v25;
    goto LABEL_14;
  }
LABEL_15:
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_169(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 10, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_3;
    uint64_t v9 = &unk_2641860A8;
    id v11 = v4;
    id v10 = v3;
    dispatch_async(v5, &v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "parseCaseTriggerResponse:", v3, v6, v7, v8, v9);
}

uint64_t __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, *(int *)(a1 + 40), 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)snapshotWithSignature:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5 delay:(double)a6 events:(id)a7 payload:(id)a8 actions:(id)a9 reply:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = v23;
  if (isEnabled)
  {
    uint64_t v25 = [v19 count];
    if (v25)
    {
      id v26 = [(SDRDiagnosticReporter *)self actionsDictionary:v22 withIDSDestinations:v19 validFor:a5];
    }
    else
    {
      id v26 = v22;
    }
    id v29 = v26;
    BOOL v28 = [(SDRDiagnosticReporter *)self snapshotWithSignature:v18 delay:v20 events:v21 payload:v26 actions:v25 != 0 wantsRemoteCase:v24 reply:a6];
  }
  else
  {
    if (v23)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __111__SDRDiagnosticReporter_snapshotWithSignature_withIDSDestinations_validFor_delay_events_payload_actions_reply___block_invoke;
      block[3] = &unk_264186058;
      id v32 = v23;
      dispatch_async(queue, block);
    }
    BOOL v28 = 0;
  }

  return v28;
}

void __111__SDRDiagnosticReporter_snapshotWithSignature_withIDSDestinations_validFor_delay_events_payload_actions_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 payload:(id)a5 reply:(id)a6
{
  return [(SDRDiagnosticReporter *)self snapshotWithSignature:a3 delay:0 events:a5 payload:0 actions:0 wantsRemoteCase:a6 reply:a4];
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7
{
  v23[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = v15;
  if (isEnabled)
  {
    if (v13)
    {
      v23[0] = v13;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    }
    else
    {
      uint64_t v17 = 0;
    }
    BOOL v19 = [(SDRDiagnosticReporter *)self startSessionWithSignature:v12 duration:v17 events:v14 payload:0 actions:0 wantsRemoteCase:v16 reply:a4];
  }
  else
  {
    if (!v15)
    {
      BOOL v19 = 0;
      goto LABEL_9;
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__SDRDiagnosticReporter_startSessionWithSignature_duration_event_payload_reply___block_invoke;
    block[3] = &unk_264186058;
    id v22 = v15;
    dispatch_async(queue, block);
    BOOL v19 = 0;
    uint64_t v17 = v22;
  }

LABEL_9:
  return v19;
}

void __80__SDRDiagnosticReporter_startSessionWithSignature_duration_event_payload_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 reply:(id)a7
{
  return [(SDRDiagnosticReporter *)self startSessionWithSignature:a3 duration:a5 events:a6 payload:0 actions:0 wantsRemoteCase:a7 reply:a4];
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 wantsRemoteCase:(BOOL)a7 reply:(id)a8
{
  return [(SDRDiagnosticReporter *)self startSessionWithSignature:a3 duration:a5 events:a6 payload:0 actions:a7 wantsRemoteCase:a8 reply:a4];
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 reply:(id)a8
{
  return [(SDRDiagnosticReporter *)self startSessionWithSignature:a3 duration:a5 events:a6 payload:a7 actions:0 wantsRemoteCase:a8 reply:a4];
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v26[3] = &unk_264186170;
  v26[4] = self;
  id v21 = v20;
  id v30 = v21;
  id v31 = &v34;
  id v22 = v16;
  id v27 = v22;
  double v32 = a4;
  id v23 = v17;
  id v28 = v23;
  id v24 = v19;
  id v29 = v24;
  BOOL v33 = a8;
  [(SDRDiagnosticReporter *)self commonPreflightChecksForSignature:v22 payload:v18 callback:v26];
  LOBYTE(self) = *((unsigned char *)v35 + 24);

  _Block_object_dispose(&v34, 8);
  return (char)self;
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2;
    v27[3] = &unk_264186080;
    uint64_t v7 = &v28;
    id v8 = *(id *)(a1 + 64);
    v27[4] = *(void *)(a1 + 32);
    id v28 = v8;
    uint64_t v9 = [v6 remoteObjectProxyWithErrorHandler:v27];
    if (v9)
    {
      unint64_t v10 = (unint64_t)*(double *)(a1 + 80);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(unsigned __int8 *)(a1 + 88);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      void v23[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_173;
      v23[3] = &unk_2641860D0;
      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = *(id *)(a1 + 64);
      v23[4] = *(void *)(a1 + 32);
      id v24 = v15;
      [v9 startSessionWithSignature:v11 duration:v10 events:v12 payload:v5 actions:v14 wantsRemoteCase:v13 reply:v23];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR)) {
        __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v18 = *(void **)(a1 + 64);
      if (v18)
      {
        id v19 = *(NSObject **)(*(void *)(a1 + 32) + 16);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_172;
        v25[3] = &unk_264186058;
        id v26 = v18;
        dispatch_async(v19, v25);

        goto LABEL_11;
      }
    }

LABEL_11:
    goto LABEL_12;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  id v16 = *(void **)(a1 + 64);
  if (v16)
  {
    id v17 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_4;
    block[3] = &unk_2641860F8;
    uint64_t v7 = &v21;
    id v21 = v16;
    int v22 = a2;
    dispatch_async(v17, block);
    goto LABEL_11;
  }
LABEL_12:
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_ERROR)) {
    __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_171;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_171(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_172(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 10, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_173(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_3;
    uint64_t v9 = &unk_2641860A8;
    id v11 = v4;
    id v10 = v3;
    dispatch_async(v5, &v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "parseCaseTriggerResponse:", v3, v6, v7, v8, v9);
}

uint64_t __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, *(int *)(a1 + 40), 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)startSessionWithSignature:(id)a3 withIDSDestinations:(id)a4 validFor:(double)a5 duration:(double)a6 events:(id)a7 payload:(id)a8 actions:(id)a9 reply:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = v23;
  if (isEnabled)
  {
    uint64_t v25 = [v19 count];
    if (v25)
    {
      id v26 = [(SDRDiagnosticReporter *)self actionsDictionary:v22 withIDSDestinations:v19 validFor:a5];
    }
    else
    {
      id v26 = v22;
    }
    id v29 = v26;
    BOOL v28 = [(SDRDiagnosticReporter *)self startSessionWithSignature:v18 duration:v20 events:v21 payload:v26 actions:v25 != 0 wantsRemoteCase:v24 reply:a6];
  }
  else
  {
    if (v23)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __118__SDRDiagnosticReporter_startSessionWithSignature_withIDSDestinations_validFor_duration_events_payload_actions_reply___block_invoke;
      block[3] = &unk_264186058;
      id v32 = v23;
      dispatch_async(queue, block);
    }
    BOOL v28 = 0;
  }

  return v28;
}

void __118__SDRDiagnosticReporter_startSessionWithSignature_withIDSDestinations_validFor_duration_events_payload_actions_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)startSessionWithSignature:(id)a3 duration:(double)a4 payload:(id)a5 reply:(id)a6
{
  return [(SDRDiagnosticReporter *)self startSessionWithSignature:a3 duration:0 events:a5 payload:0 actions:0 wantsRemoteCase:a6 reply:a4];
}

- (BOOL)endSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (isEnabled && [v4 length])
  {
    uint64_t v6 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_175];
    uint64_t v7 = v6;
    BOOL v8 = v6 != 0;
    if (v6) {
      [v6 endSession:v5];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __36__SDRDiagnosticReporter_endSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __36__SDRDiagnosticReporter_endSession___block_invoke_cold_1();
  }
}

- (BOOL)cancelSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (isEnabled && [v4 length])
  {
    uint64_t v6 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_177];
    uint64_t v7 = v6;
    BOOL v8 = v6 != 0;
    if (v6) {
      [v6 cancelSession:v5];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __39__SDRDiagnosticReporter_cancelSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __39__SDRDiagnosticReporter_cancelSession___block_invoke_cold_1();
  }
}

- (BOOL)addToSession:(id)a3 event:(id)a4 payload:(id)a5 reply:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    id v17 = a4;
    uint64_t v13 = (void *)MEMORY[0x263EFF8C0];
    id v14 = a4;
    a4 = [v13 arrayWithObjects:&v17 count:1];
  }
  BOOL v15 = -[SDRDiagnosticReporter addToSession:events:payload:reply:](self, "addToSession:events:payload:reply:", v10, a4, v11, v12, v17, v18);

  return v15;
}

- (BOOL)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  id v14 = v13;
  if (!isEnabled)
  {
    if (v13)
    {
      queue = self->_queue;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      void v23[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_5;
      v23[3] = &unk_264186058;
      id v16 = &v24;
      id v24 = v13;
      id v21 = v23;
      goto LABEL_11;
    }
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  if (v11 | v12 && [v10 length])
  {
    connection = self->_connection;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke;
    v29[3] = &unk_264186080;
    id v16 = &v30;
    id v17 = v14;
    void v29[4] = self;
    id v30 = v17;
    uint64_t v18 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v29];
    BOOL v19 = v18 != 0;
    if (v18)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_2;
      v27[3] = &unk_2641860D0;
      v27[4] = self;
      id v28 = v17;
      [v18 addToSession:v10 events:v11 payload:v12 reply:v27];
    }
    goto LABEL_12;
  }
  if (!v14) {
    goto LABEL_13;
  }
  queue = self->_queue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_4;
  v25[3] = &unk_264186058;
  id v16 = &v26;
  id v26 = v14;
  id v21 = v25;
LABEL_11:
  dispatch_async(queue, v21);
  BOOL v19 = 0;
LABEL_12:

LABEL_14:
  return v19;
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_178;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_178(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_3;
    v6[3] = &unk_2641860A8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 20, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (!isEnabled)
  {
    if (v13)
    {
      queue = self->_queue;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      void v23[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_5;
      v23[3] = &unk_264186058;
      id v16 = &v24;
      id v24 = v13;
      id v21 = v23;
      goto LABEL_12;
    }
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  if ([v11 length] && objc_msgSend(v12, "length") && objc_msgSend(v10, "length"))
  {
    connection = self->_connection;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke;
    v29[3] = &unk_264186080;
    id v16 = &v30;
    id v17 = v14;
    void v29[4] = self;
    id v30 = v17;
    uint64_t v18 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v29];
    BOOL v19 = v18 != 0;
    if (v18)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_2;
      v27[3] = &unk_2641860D0;
      v27[4] = self;
      id v28 = v17;
      [v18 addSignatureContentForSession:v10 key:v11 content:v12 reply:v27];
    }
    goto LABEL_13;
  }
  if (!v14) {
    goto LABEL_14;
  }
  queue = self->_queue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_4;
  v25[3] = &unk_264186058;
  id v16 = &v26;
  id v26 = v14;
  id v21 = v25;
LABEL_12:
  dispatch_async(queue, v21);
  BOOL v19 = 0;
LABEL_13:

LABEL_15:
  return v19;
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_179;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_179(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_3;
    v6[3] = &unk_2641860A8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 20, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)getDiagnosticPayloadsForSignatures:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (isEnabled)
  {
    connection = self->_connection;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke;
    v24[3] = &unk_264186080;
    id v10 = &v25;
    id v11 = v7;
    v24[4] = self;
    id v25 = v11;
    id v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v24];
    BOOL v13 = v12 != 0;
    if (v12)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_2;
      v22[3] = &unk_2641861E0;
      id v14 = &v23;
      v22[4] = self;
      id v23 = v11;
      [v12 getDiagnosticPayloadsForSignatures:v6 reply:v22];
    }
    else
    {
      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_4;
      block[3] = &unk_264186058;
      id v14 = &v21;
      id v21 = v11;
      dispatch_async(queue, block);
    }

    goto LABEL_9;
  }
  if (!v7)
  {
    BOOL v13 = 0;
    goto LABEL_11;
  }
  BOOL v15 = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_5;
  v18[3] = &unk_264186058;
  id v10 = &v19;
  id v19 = v7;
  dispatch_async(v15, v18);
  BOOL v13 = 0;
LABEL_10:

LABEL_11:
  return v13;
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_180;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_180(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:32 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_3;
    block[3] = &unk_2641861B8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:19 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)triggerRemoteSessionForSignature:(id)a3 caseGroupID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  if (!isEnabled)
  {
    if (v10)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_4;
      block[3] = &unk_264186058;
      id v20 = v10;
      dispatch_async(queue, block);
    }
    goto LABEL_11;
  }
  if (![v8 count] || !objc_msgSend(v9, "length"))
  {
    if (v11)
    {
      id v17 = responseDict(0, 20, 0, 0, 0);
      ((void (**)(void, void *))v11)[2](v11, v17);
    }
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  connection = self->_connection;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  void v23[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke;
  v23[3] = &unk_264186080;
  BOOL v13 = v11;
  void v23[4] = self;
  id v24 = v13;
  id v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v23];
  BOOL v15 = v14 != 0;
  if (v14)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_2;
    v21[3] = &unk_2641860D0;
    v21[4] = self;
    id v22 = v13;
    [v14 triggerRemoteSessionForSignature:v8 groupIdentifier:v9 reply:v21];
  }
LABEL_12:

  return v15;
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_183;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_183(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 11, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_3;
    v6[3] = &unk_2641860A8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  responseDict(0, 1, 0, 0, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)casesListCallbackWithResult:(id)a3 service:(id)a4 identifier:(id)a5 count:(unint64_t)a6 container:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ([v14 count])
  {
    [v17 addObjectsFromArray:v14];
    id v19 = [v17 lastObject];
    id v20 = [v19 objectForKeyedSubscript:@"case_identifier"];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke;
    v25[3] = &unk_264186208;
    void v25[4] = self;
    id v26 = v15;
    id v27 = v16;
    unint64_t v30 = a6;
    id v28 = v17;
    id v29 = v18;
    [v26 getCasesListFromIdentifier:v20 count:a6 reply:v25];

LABEL_5:
    goto LABEL_6;
  }
  if (v18)
  {
    queue = self->_queue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke_2;
    v22[3] = &unk_2641860A8;
    id v24 = v18;
    id v23 = v17;
    dispatch_async(queue, v22);

    id v19 = v24;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) casesListCallbackWithResult:a2 service:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) count:*(void *)(a1 + 72) container:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

uint64_t __94__SDRDiagnosticReporter_casesListCallbackWithResult_service_identifier_count_container_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)getAllDiagnosticCasesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (isEnabled)
  {
    connection = self->_connection;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    void v23[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke;
    v23[3] = &unk_264186080;
    id v7 = &v24;
    id v8 = v4;
    void v23[4] = self;
    id v24 = v8;
    id v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v23];
    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_2;
      v18[3] = &unk_264186230;
      void v18[4] = self;
      uint64_t v22 = 10;
      id v19 = v9;
      id v20 = v10;
      id v21 = v8;
      id v11 = v10;
      [v19 getCasesListFromIdentifier:0 count:10 reply:v18];
    }
    else
    {
      if (!v8)
      {
LABEL_9:

        goto LABEL_10;
      }
      queue = self->_queue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_3;
      v16[3] = &unk_264186058;
      id v17 = v8;
      dispatch_async(queue, v16);
      id v11 = v17;
    }

    goto LABEL_9;
  }
  if (v4)
  {
    id v12 = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_4;
    block[3] = &unk_264186058;
    id v7 = &v15;
    id v15 = v4;
    dispatch_async(v12, block);
LABEL_10:
  }
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_185;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_185(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:53 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) casesListCallbackWithResult:a2 service:*(void *)(a1 + 40) identifier:0 count:*(void *)(a1 + 64) container:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:19 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)caseSummariesListCallbackWithResult:(id)a3 service:(id)a4 caseSummaryType:(id)a5 count:(unint64_t)a6 container:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ([v14 count])
  {
    [v17 addObjectsFromArray:v14];
    id v19 = [v14 lastObject];
    id v20 = [v19 objectForKeyedSubscript:@"caseID"];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke;
    v25[3] = &unk_264186208;
    void v25[4] = self;
    id v26 = v15;
    id v27 = v16;
    unint64_t v30 = a6;
    id v28 = v17;
    id v29 = v18;
    [v26 listCaseSummariesOfType:v27 fromIdentifier:v20 count:a6 reply:v25];

LABEL_5:
    goto LABEL_6;
  }
  if (v18)
  {
    queue = self->_queue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke_2;
    v22[3] = &unk_2641860A8;
    id v24 = v18;
    id v23 = v17;
    dispatch_async(queue, v22);

    id v19 = v24;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) caseSummariesListCallbackWithResult:a2 service:*(void *)(a1 + 40) caseSummaryType:*(void *)(a1 + 48) count:*(void *)(a1 + 72) container:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

uint64_t __107__SDRDiagnosticReporter_caseSummariesListCallbackWithResult_service_caseSummaryType_count_container_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)getDiagnosticCaseSummariesOfType:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (isEnabled)
  {
    connection = self->_connection;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke;
    v28[3] = &unk_264186080;
    id v10 = v7;
    v28[4] = self;
    id v29 = v10;
    id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
    if (v11)
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy_;
      v26[4] = __Block_byref_object_dispose_;
      id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_2;
      v20[3] = &unk_264186258;
      void v20[4] = self;
      id v21 = v11;
      id v24 = v26;
      uint64_t v25 = 10;
      id v22 = v6;
      id v23 = v10;
      [v21 listCaseSummariesOfType:v22 fromIdentifier:0 count:10 reply:v20];

      _Block_object_dispose(v26, 8);
      id v12 = v27;
    }
    else
    {
      if (!v10)
      {
LABEL_9:
        id v14 = &v29;

        goto LABEL_10;
      }
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_3;
      block[3] = &unk_264186058;
      id v19 = v10;
      dispatch_async(queue, block);
      id v12 = v19;
    }

    goto LABEL_9;
  }
  if (v7)
  {
    BOOL v13 = self->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_4;
    v16[3] = &unk_264186058;
    id v14 = &v17;
    id v17 = v7;
    dispatch_async(v13, v16);
LABEL_10:
  }
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_190;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_190(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:53 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) caseSummariesListCallbackWithResult:a2 service:*(void *)(a1 + 40) caseSummaryType:*(void *)(a1 + 48) count:*(void *)(a1 + 72) container:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) reply:*(void *)(a1 + 56)];
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:19 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)getDiagnosticCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (isEnabled)
  {
    connection = self->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke;
    v22[3] = &unk_264186080;
    id v10 = &v23;
    id v11 = v7;
    void v22[4] = self;
    id v23 = v11;
    id v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
    if (v12)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_2;
      v20[3] = &unk_264186280;
      BOOL v13 = &v21;
      void v20[4] = self;
      id v21 = v11;
      [v12 listCaseSummariesWithIdentifiers:v6 reply:v20];
    }
    else
    {
      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_4;
      block[3] = &unk_264186058;
      BOOL v13 = &v19;
      id v19 = v11;
      dispatch_async(queue, block);
    }

    goto LABEL_9;
  }
  if (v7)
  {
    id v14 = self->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_5;
    v16[3] = &unk_264186058;
    id v10 = &v17;
    id v17 = v7;
    dispatch_async(v14, v16);
LABEL_10:
  }
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_cold_1();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_191;
    block[3] = &unk_264186058;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_191(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:53 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_3;
    v6[3] = &unk_2641860A8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:19 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)purgeAutoBugCaptureFilesWithSubPaths:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (isEnabled)
  {
    connection = self->_connection;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke;
    v14[3] = &unk_2641862A8;
    id v10 = v7;
    id v15 = v10;
    id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
    if (v11)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_192;
      v12[3] = &unk_2641862D0;
      id v13 = v10;
      [v11 purgeAutoBugCaptureFilesWithSubPaths:v6 reply:v12];

LABEL_9:
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    {
      -[SDRDiagnosticReporter purgeAutoBugCaptureFilesWithSubPaths:reply:]();
      if (!v10) {
        goto LABEL_9;
      }
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    goto LABEL_9;
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_10:
}

void __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_cold_1();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

uint64_t __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_192(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getAutoBugCaptureConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (isEnabled)
  {
    connection = self->_connection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke;
    v11[3] = &unk_2641862A8;
    id v7 = v4;
    id v12 = v7;
    id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
    if (v8)
    {
      if (objc_opt_respondsToSelector())
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_195;
        v9[3] = &unk_2641862F8;
        id v10 = v7;
        [v8 getAutoBugCaptureConfiguration:v9];
      }
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG))
    {
      -[SDRDiagnosticReporter getAutoBugCaptureConfiguration:]();
      if (!v7) {
        goto LABEL_10;
      }
    }
    else if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    goto LABEL_10;
  }
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
LABEL_11:
}

void __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)logHandle, OS_LOG_TYPE_DEBUG)) {
    __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_cold_1();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

uint64_t __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_195(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (SDRDiagnosticReporterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDRDiagnosticReporterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (void)isABCEnabled
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1[0] = 67109632;
  v1[1] = _MergedGlobals;
  __int16 v2 = 1024;
  int v3 = 0;
  __int16 v4 = 1024;
  int v5 = byte_26AA4C531;
  _os_log_debug_impl(&dword_210A0E000, log, OS_LOG_TYPE_DEBUG, "SDRDiagnosticReporter - internal: %d seed: %d vendor: %d", (uint8_t *)v1, 0x14u);
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: Connection invalidated.", v2, v3, v4, v5, v6);
}

void __42__SDRDiagnosticReporter_setupXPCInterface__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: Connection interrupted.", v2, v3, v4, v5, v6);
}

void __63__SDRDiagnosticReporter_groupCaseIdentifierForSignature_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (groupCaseIdentifierForSignature:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

- (void)_payloadAugmentedWithSandboxExtensionTokensDict:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = [a2 count];
  __int16 v8 = 2048;
  uint64_t v9 = [a3 count];
  _os_log_error_impl(&dword_210A0E000, v5, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: Failed to grant sandbox extensions for all payloads (%ld required, %ld granted)", (uint8_t *)&v6, 0x16u);
}

- (void)commonPreflightChecksForSignature:payload:callback:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: Submitting CA event for daily rate limit throttled case", v2, v3, v4, v5, v6);
}

- (void)commonPreflightChecksForSignature:payload:callback:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: Submitting CA event for API rate limit throttled case", v2, v3, v4, v5, v6);
}

- (void)buildDiagnosticIncidentEventForCaseSignature:handledResult:dampeningResult:closureType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: CA event for DiagnosticIncident: %@", v2, v3, v4, v5, v6);
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_210A0E000, v0, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: (snapshotWithSignature:) Unable to get remote object proxy", v1, 2u);
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (snapshotWithSignature:) service %@", v2, v3, v4, v5, v6);
}

void __98__SDRDiagnosticReporter_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_210A0E000, v0, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: (startSessionWithSignature:) Unable to get remote object proxy", v1, 2u);
}

void __105__SDRDiagnosticReporter_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_210A0E000, v0, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter: (startSessionWithSignature:) Remote XPC error %@", v1, 0xCu);
}

void __36__SDRDiagnosticReporter_endSession___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (endSession:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __39__SDRDiagnosticReporter_cancelSession___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (cancelSession:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __59__SDRDiagnosticReporter_addToSession_events_payload_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (sessionIdentifier:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __73__SDRDiagnosticReporter_addSignatureContentForSession_key_content_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (addSignatureContentForSession:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __66__SDRDiagnosticReporter_getDiagnosticPayloadsForSignatures_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (getDiagnosticPayloadsForSignatures:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __76__SDRDiagnosticReporter_triggerRemoteSessionForSignature_caseGroupID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (triggerRemoteSessionForSignature:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __56__SDRDiagnosticReporter_getAllDiagnosticCasesWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (getAllDiagnosticCasesWithReply:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __64__SDRDiagnosticReporter_getDiagnosticCaseSummariesOfType_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (getDiagnosticCaseSummariesOfType:reply:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

void __73__SDRDiagnosticReporter_getDiagnosticCaseSummariesWithIdentifiers_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (getCaseSummariesWithIdentifiers:reply:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

- (void)purgeAutoBugCaptureFilesWithSubPaths:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (purgeAutoBugCaptureFilesWithSubPaths:) remote service not initialized", v2, v3, v4, v5, v6);
}

void __68__SDRDiagnosticReporter_purgeAutoBugCaptureFilesWithSubPaths_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (purgeAutoBugCaptureFilesWithSubPaths:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

- (void)getAutoBugCaptureConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (getAutoBugCaptureConfiguration:) remote service not initialized", v2, v3, v4, v5, v6);
}

void __56__SDRDiagnosticReporter_getAutoBugCaptureConfiguration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter: (getAutoBugCaptureConfiguration:) remote object proxy error %@", v2, v3, v4, v5, v6);
}

@end