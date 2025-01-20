@interface BiometricKitXPCServerPearl
+ (BOOL)platformProvidesPSD3;
+ (BOOL)platformProvidesPlCl;
+ (id)getSHA384FromData:(id)a3;
+ (unsigned)getBoardID;
+ (unsigned)getChipID;
+ (unsigned)getDeviceTreeProperty:(id)a3 fromPath:(id)a4;
+ (unsigned)getSkipBane;
+ (void)reportPearlHardwarePass:(BOOL)a3 fallbackAction:(id)a4;
+ (void)reportPearlInterlock:(BOOL)a3;
+ (void)reportPearlIssue;
- ($1AB5FA073B851C12C2339EC22442E995)deviceGravity;
- ($1AB5FA073B851C12C2339EC22442E995)deviceRotationRate;
- ($1AB5FA073B851C12C2339EC22442E995)deviceUserAcceleration;
- (BOOL)hasFDREntitlement;
- (BOOL)hasManifestEntitlement:(unsigned int)a3;
- (BiometricKitXPCServerPearl)init;
- (id)classStringForEnum:(unsigned __int16)a3;
- (id)createEnrollOperation;
- (id)createMatchOperation;
- (id)createPresenceDetectOperation;
- (id)detailsForFaceDetectInfo:(id *)a3;
- (id)deviceAttitude;
- (id)filenameForSavageCertType:(id)a3;
- (id)getDisplayTrustStatusAttempt;
- (id)getFDRClassFromFDR:(unsigned __int16)a3;
- (id)getFDRClassFromFDR:(unsigned __int16)a3 withOptions:(id)a4 withError:(id *)a5;
- (id)getFDRClassFromFile:(id)a3;
- (id)getProjectorSerialNumberIOReg;
- (id)getProjectorSerialNumberIORegAttempt;
- (id)getRomeoSerialNumberFDR;
- (id)pathForAlternateFDRClass:(id)a3;
- (int)cancelWithClient:(id)a3;
- (int)completeEnrollmentWithClient:(id)a3;
- (int)enableMatchAutoRetry:(BOOL)a3 withClient:(id)a4;
- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5;
- (int)getCommProtocolVersion;
- (int)getPeriocularMatchStateForUser:(unsigned int)a3 state:(int64_t *)a4 withClient:(id)a5;
- (int)getSPRLInfo:(id *)a3;
- (int)initAutoBugCapture;
- (int)initEnrollOperation:(id)a3 biometricType:(int)a4 userID:(unsigned int)a5 options:(id)a6 client:(id)a7;
- (int)initMatchOperation:(id)a3 filter:(id)a4 options:(id)a5 client:(id)a6;
- (int)initPresenceDetectOperation:(id)a3 options:(id)a4 client:(id)a5;
- (int)initSecureFaceDetect;
- (int)initializeEngineWithOptions:(unsigned __int16)a3;
- (int)isPeriocularEnrollmentSupported:(BOOL *)a3 withClient:(id)a4;
- (int)loadCatacombForComponent:(id)a3;
- (int)loadDCNKernels;
- (int)loadFDRCalibrationData:(BOOL)a3;
- (int)loadFDRClass:(unsigned __int16)a3 alternative:(BOOL)a4;
- (int)loadFDRClassCommand:(int)a3 withClass:(unsigned __int16)a4 withData:(id)a5 isAlternative:(BOOL)a6;
- (int)loadPCECalibrationOverride:(id)a3;
- (int)loadSavageFWCertificate;
- (int)pauseFaceDetectTimer:(BOOL)a3 withClient:(id)a4;
- (int)performCancelCommand;
- (int)performCommand:(unsigned __int16)a3 inValue:(unsigned __int16)a4 inData:(const void *)a5 inSize:(unint64_t)a6 outData:(char *)a7 outSize:(unint64_t *)a8;
- (int)performCommand:(unsigned __int16)a3 version:(unsigned __int16)a4 inValue:(unsigned __int16)a5 inData:(const void *)a6 inSize:(unint64_t)a7 outData:(char *)a8 outSize:(unint64_t *)a9;
- (int)performCompleteSaveCatacombCommand:(id)a3 outBuffer:(id)a4;
- (int)performConfirmSaveCatacombCommand:(id)a3;
- (int)performDisplayStatusChangedCommand:(BOOL)a3;
- (int)performDropUnlockTokenCommand;
- (int)performEnrollCommand:(id)a3;
- (int)performForceBioLockoutCommand:(unsigned int)a3;
- (int)performGetBiometrickitdInfoCommand:(id *)a3;
- (int)performGetCatacombHashCommand:(unsigned int)a3 outHash:(id *)a4;
- (int)performGetCatacombStateCommand:(id)a3;
- (int)performGetCatacombUUIDCommand:(unsigned int)a3 outUUID:(id *)a4;
- (int)performGetDeviceHardwareStateCommand:(unsigned int *)a3;
- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 outCount:(unsigned int *)a4;
- (int)performGetIdentitiesListCommand:(unsigned int)a3 outBuffer:(id)a4;
- (int)performGetLastMatchEventCommand:(id *)a3;
- (int)performGetProtectedConfigCommand:(unsigned int)a3 outSetCfg:(id *)a4 outEffectiveCfg:(id *)a5;
- (int)performGetSKSLockStateCommand:(unsigned int)a3 outState:(unsigned int *)a4;
- (int)performGetSystemProtectedConfigCommand:(id *)a3;
- (int)performGetTemplatesValidityCommand:(unsigned int)a3 isValid:(BOOL *)a4;
- (int)performLoadCatacombCommand:(id)a3 inData:(id)a4;
- (int)performMatchCommand:(id)a3;
- (int)performNoCatacombCommand:(unsigned int)a3;
- (int)performPrepareSaveCatacombCommand:(id)a3 outDataSize:(unsigned int *)a4;
- (int)performPresenceDetectCommand:(id)a3;
- (int)performPresenceDetectCommand:(id)a3 restart:(BOOL)a4;
- (int)performRemoveIdentityCommand:(id *)a3;
- (int)performRemoveUserDataCommand:(unsigned int)a3;
- (int)performRequestMaxIdentityCountCommand:(unsigned int *)a3;
- (int)performRequestMessageDataCommand:(unint64_t)a3 size:(unint64_t)a4 outData:(id *)a5;
- (int)performSetProtectedConfigCommand:(unsigned int)a3 cfg:(id)a4 authData:(id *)a5;
- (int)performSetSystemProtectedConfigCommand:(id)a3 authData:(id *)a4;
- (int)queryGuadalupeSerialNumberFDR:(id *)a3;
- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5 withClient:(id)a6;
- (int)queryPeriocularMigrationState:(BOOL *)a3 clear:(BOOL)a4;
- (int)removeIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)removePeriocularTemplatesWithOptions:(id)a3 withClient:(id)a4;
- (int)restoreAndSyncTemplates;
- (int)saveTemplateListAfterTemplateUpdate;
- (int)sendDCNKernelsCheckResult:(int)a3;
- (int)sendDisplayCheckResult:(int)a3;
- (int)sendFDRDataCheckResult:(int)a3;
- (int)sendRomeoSNCheckResult:(int)a3;
- (int)sendSelfCheckResult:(id *)a3;
- (int)serviceStatus:(unsigned int)a3 version:(unsigned int)a4 ordinal:(unint64_t)a5 data:(id)a6 timestamp:(unint64_t)a7;
- (int)setSecureFaceDetectState:(int)a3 sessionID:(unsigned int)a4;
- (int)setTemplate:(id)a3 forIdentity:(id)a4 withClient:(id)a5;
- (int)startNewMatchAttemptWithClient:(id)a3;
- (int)startSecureFaceDetect;
- (int)suspendEnrollment:(BOOL)a3 withClient:(id)a4;
- (int)unwrapBrunorEncryptionKey;
- (int)updateIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)updatePropertiesOfIdentities;
- (int)verifyDisplayTrust;
- (int)verifyGuadalupeSerialNumberAgainstFDR;
- (int)verifyProjectorSerialNumber;
- (int)verifyRomeoSerialNumberAgainstFDR;
- (int64_t)getDeviceStateWithClient:(id)a3;
- (unint64_t)deviceOrientation;
- (unsigned)serviceConnect;
- (void)analyticsKernelMessage:(id)a3;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)checkBioLogConsent;
- (void)clearSecureFaceDetectContext;
- (void)dealloc;
- (void)deinitSecureFaceDetect;
- (void)donateBiomeEvent:(id)a3;
- (void)enrollFeedback:(id)a3 withTimestamp:(unint64_t)a4;
- (void)enrollResult:(id)a3 withTimestamp:(unint64_t)a4;
- (void)enrollUpdate:(id)a3 withTimestamp:(unint64_t)a4;
- (void)faceDetectMessage:(unsigned int)a3 info:(id *)a4 fromSecureFD:(BOOL)a5;
- (void)firstUnlockCallback;
- (void)handleSharedMemoryTransfer:(unsigned int)a3 withHeader:(id)a4 data:(id)a5;
- (void)initializeSprl;
- (void)loadCalibrationData;
- (void)logKernelMessage:(id)a3;
- (void)logRemoveIdentity:(id)a3 withClient:(id)a4;
- (void)logSequenceDebugWithContext:(id *)a3;
- (void)matchEventMessage:(id *)a3;
- (void)matchResult:(id)a3 withTimestamp:(unint64_t)a4;
- (void)motionDetectMessage:(unsigned int)a3 info:(id *)a4 state:(int)a5;
- (void)processMetadataObjects:(id)a3;
- (void)registerForLiftToWakeNotifications:(BOOL)a3;
- (void)secureFaceDetectRequestMessage:(id *)a3;
- (void)serviceMatch:(unsigned int)a3;
- (void)statusMessage:(unsigned int)a3 withData:(id)a4 timestamp:(unint64_t)a5;
- (void)stopSecureFaceDetect;
- (void)updateAutoRetryMode;
- (void)updateCoachingHintsEnabled;
- (void)updateCombinedSequenceMode;
- (void)updateEntitlementOverrideFlags;
- (void)updateLoggingState;
- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4;
@end

@implementation BiometricKitXPCServerPearl

- (int)performGetProtectedConfigCommand:(unsigned int)a3 outSetCfg:(id *)a4 outEffectiveCfg:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v9 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = a3;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = a4;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "performGetProtectedConfigCommand: %d %p %p\n", buf, 0x1Cu);
  }
  long long v38 = 0u;
  memset(buf, 0, sizeof(buf));
  uint64_t v25 = 48;
  unsigned int v26 = a3;
  int v11 = [(BiometricKitXPCServerPearl *)self performCommand:26 inValue:0 inData:&v26 inSize:4 outData:buf outSize:&v25];
  if (v11)
  {
    int v19 = v11;
    if (__osLog) {
      v21 = __osLog;
    }
    else {
      v21 = v9;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 136316162;
      v28 = "err == 0 ";
      __int16 v29 = 2048;
      uint64_t v30 = v19;
      __int16 v31 = 2080;
      v32 = &unk_222DFB9BF;
      __int16 v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v35 = 1024;
      int v36 = 3415;
      _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
    }
    goto LABEL_43;
  }
  if (v25 != 48)
  {
    if (__osLog) {
      v22 = __osLog;
    }
    else {
      v22 = v9;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 136316162;
      v28 = "size == sizeof(outData)";
      __int16 v29 = 2048;
      uint64_t v30 = 0;
      __int16 v31 = 2080;
      v32 = &unk_222DFB9BF;
      __int16 v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v35 = 1024;
      int v36 = 3416;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
    }
    goto LABEL_14;
  }
  if (!a4) {
    goto LABEL_11;
  }
  id v12 = objc_alloc_init(MEMORY[0x263F2AAE0]);
  if (v12)
  {
    v13 = v12;
    [v12 setUnlockEnabled:*(unsigned int *)buf];
    [v13 setIdentificationEnabled:*(unsigned int *)&buf[4]];
    [v13 setLoginEnabled:*(unsigned int *)&buf[8]];
    [v13 setApplePayEnabled:*(unsigned int *)&buf[12]];
    [v13 setAttentionDetectionEnabled:*(unsigned int *)&buf[16]];
    [v13 setPeriocularMatchEnabled:*(unsigned int *)&buf[20]];
    id v14 = v13;
    *a4 = v14;

LABEL_11:
    if (!a5)
    {
LABEL_14:
      if (__osLogTrace) {
        v18 = __osLogTrace;
      }
      else {
        v18 = v9;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v27 = 67109120;
        LODWORD(v28) = 0;
        _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_DEBUG, "performGetProtectedConfigCommand -> %d\n", v27, 8u);
      }
      return 0;
    }
    id v15 = objc_alloc_init(MEMORY[0x263F2AAE0]);
    if (v15)
    {
      v16 = v15;
      [v15 setUnlockEnabled:*(unsigned int *)&buf[24]];
      [v16 setIdentificationEnabled:*(unsigned int *)&buf[28]];
      [v16 setLoginEnabled:v38];
      [v16 setApplePayEnabled:DWORD1(v38)];
      [v16 setAttentionDetectionEnabled:DWORD2(v38)];
      [v16 setPeriocularMatchEnabled:HIDWORD(v38)];
      id v17 = v16;
      *a5 = v17;

      goto LABEL_14;
    }
    if (__osLog) {
      v23 = __osLog;
    }
    else {
      v23 = v9;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_DWORD *)v27 = 136316162;
    v28 = "effectiveCfg";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    v32 = &unk_222DFB9BF;
    __int16 v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v35 = 1024;
    int v36 = 3436;
    goto LABEL_41;
  }
  if (__osLog) {
    v23 = __osLog;
  }
  else {
    v23 = v9;
  }
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    goto LABEL_42;
  }
  *(_DWORD *)v27 = 136316162;
  v28 = "setCfg";
  __int16 v29 = 2048;
  uint64_t v30 = 0;
  __int16 v31 = 2080;
  v32 = &unk_222DFB9BF;
  __int16 v33 = 2080;
  v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
  __int16 v35 = 1024;
  int v36 = 3420;
LABEL_41:
  _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
LABEL_42:
  int v19 = 261;
LABEL_43:
  if (__osLogTrace) {
    v24 = __osLogTrace;
  }
  else {
    v24 = v9;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v27 = 67109120;
    LODWORD(v28) = v19;
    _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "performGetProtectedConfigCommand -> %d\n", v27, 8u);
  }
  return v19;
}

- (int)performCommand:(unsigned __int16)a3 inValue:(unsigned __int16)a4 inData:(const void *)a5 inSize:(unint64_t)a6 outData:(char *)a7 outSize:(unint64_t *)a8
{
  uint64_t v12 = a4;
  uint64_t v13 = a3;
  if (__osLog) {
    id v15 = __osLog;
  }
  else {
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_DEBUG, "performCommand:inValue:inData:inSize:outData:outSize: --> performCommand:version:inValue:inData:inSize:outData:outSize:\n", buf, 2u);
  }
  return [(BiometricKitXPCServerPearl *)self performCommand:v13 version:1 inValue:v12 inData:a5 inSize:a6 outData:a7 outSize:a8];
}

- (int)performCommand:(unsigned __int16)a3 version:(unsigned __int16)a4 inValue:(unsigned __int16)a5 inData:(const void *)a6 inSize:(unint64_t)a7 outData:(char *)a8 outSize:(unint64_t *)a9
{
  kern_return_t v20;
  id v21;
  NSObject *v22;
  NSObject *v24;
  NSObject *v25;
  int v26;
  void *v27;
  int v28;
  size_t outputStructCnt;
  uint8_t buf[4];
  unsigned char v32[10];
  uint64_t v33;
  unsigned char v34[10];
  unsigned char v35[10];
  char *v36;
  __int16 v37;
  unint64_t *v38;
  uint64_t v39;

  v28 = a5;
  int v11 = a4;
  int v12 = a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (__osLog) {
    id v14 = __osLog;
  }
  else {
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)v32 = v12;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v11;
    LOWORD(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 2) = v28;
    HIWORD(v33) = 2048;
    *(void *)v34 = a6;
    *(_WORD *)&v34[8] = 2048;
    *(void *)__int16 v35 = a7;
    *(_WORD *)&v35[8] = 2048;
    int v36 = a8;
    v37 = 2048;
    long long v38 = a9;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_DEBUG, "performCommand:version:inValue:inData:inSize:outData:outSize: %u %u %u %p %lu %p %p\n", buf, 0x3Cu);
  }
  v27 = (void *)os_transaction_create();
  outputStructCnt = 0;
  size_t v15 = a7 + 8;
  if (a7 < 0xFFFFFFFFFFFFFFF8)
  {
    id v16 = *(id *)&self->_coachingHintsEnabled;
    objc_sync_enter(v16);
    if (v15 > [*(id *)&self->_coachingHintsEnabled length] || LOBYTE(self->_performCommandBufferData))
    {
      unsigned int v26 = 0;
      id v17 = 0;
    }
    else
    {
      unsigned int v26 = 1;
      LOBYTE(self->_performCommandBufferData) = 1;
      id v17 = (_WORD *)[*(id *)&self->_coachingHintsEnabled mutableBytes];
    }
    objc_sync_exit(v16);

    if (v17)
    {
      id v18 = 0;
    }
    else
    {
      id v18 = [MEMORY[0x263EFF990] dataWithLength:a7 + 8];
      id v17 = (_WORD *)[v18 mutableBytes];
      if (!v17)
      {
        if (__osLog) {
          uint64_t v25 = __osLog;
        }
        else {
          uint64_t v25 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v32 = "cmd";
          *(_WORD *)&v32[8] = 2048;
          __int16 v33 = 0;
          *(_WORD *)v34 = 2080;
          *(void *)&v34[2] = &unk_222DFB9BF;
          *(_WORD *)__int16 v35 = 2080;
          *(void *)&v35[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          LOWORD(v36) = 1024;
          *(_DWORD *)((char *)&v36 + 2) = 2590;
          _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v20 = 12;
        goto LABEL_21;
      }
    }
    *id v17 = 21072;
    v17[1] = v12;
    v17[2] = v11;
    v17[3] = v28;
    if (a6 && a7) {
      memcpy(v17 + 4, a6, a7);
    }
    if (a9) {
      size_t v19 = *a9;
    }
    else {
      size_t v19 = 0;
    }
    outputStructCnt = v19;
    v20 = IOConnectCallStructMethod(HIDWORD(self->_driverNotifyQueue), 0, v17, v15, a8, &outputStructCnt);
    if (!a9)
    {
      if (!v26) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    *a9 = outputStructCnt;
LABEL_21:
    if ((v26 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_24:
    v21 = *(id *)&self->_coachingHintsEnabled;
    objc_sync_enter(v21);
    LOBYTE(self->_performCommandBufferData) = 0;
    objc_sync_exit(v21);

    goto LABEL_25;
  }
  if (__osLog) {
    v24 = __osLog;
  }
  else {
    v24 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)v32 = "err == 0 ";
    *(_WORD *)&v32[8] = 2048;
    __int16 v33 = a7 >= 0xFFFFFFFFFFFFFFF8;
    *(_WORD *)v34 = 2080;
    *(void *)&v34[2] = &unk_222DFB9BF;
    *(_WORD *)__int16 v35 = 2080;
    *(void *)&v35[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    LOWORD(v36) = 1024;
    *(_DWORD *)((char *)&v36 + 2) = 2576;
    _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  id v18 = 0;
  v20 = 1;
LABEL_25:
  if (__osLog) {
    v22 = __osLog;
  }
  else {
    v22 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v32 = v20;
    _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_DEBUG, "performCommand:version:inValue:inData:inSize:outData:outSize: -> %{errno}d\n", buf, 8u);
  }

  return v20;
}

- (BiometricKitXPCServerPearl)init
{
  kern_return_t v54;
  void *v55;
  objc_class *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void block[4];
  BiometricKitXPCServerPearl *v73;
  objc_super v74;
  mach_msg_type_number_t task_info_outCnt[2];
  mach_msg_type_number_t *v76;
  uint64_t v77;
  uint64_t v78;
  void v79[19];
  void v80[19];
  unsigned char buf[24];
  void *v82;
  unsigned char v83[10];
  __int16 v84;
  int v85;
  uint64_t v86;

  v86 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    v3 = __osLogTrace;
  }
  else {
    v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEFAULT, "init\n", buf, 2u);
  }
  v74.receiver = self;
  v74.super_class = (Class)BiometricKitXPCServerPearl;
  v4 = [(BiometricKitXPCServer *)&v74 init];
  if (!v4)
  {
    if (__osLog) {
      v61 = __osLog;
    }
    else {
      v61 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "self";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v82 = &unk_222DFB9BF;
    *(_WORD *)v83 = 2080;
    *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    v84 = 1024;
    v85 = 372;
    goto LABEL_88;
  }
  isInternalBuild();
  BOOL v5 = (isInternalBuild() & 1) != 0 || LOBYTE(v4->_log) != 0;
  BYTE1(v4->_log) = MGGetBoolAnswer();
  v69 = [MEMORY[0x263F2AAB8] sharedInstance];
  v79[0] = @"autoRetryMode";
  v79[1] = @"combinedSequenceMode";
  v80[0] = &unk_26D5C1098;
  v80[1] = &unk_26D5C10B0;
  v79[2] = @"entitlementOverrideFlags";
  v79[3] = @"coachingHintsEnabled";
  uint64_t v6 = MEMORY[0x263EFFA88];
  v80[2] = &unk_26D5C10C8;
  v80[3] = MEMORY[0x263EFFA88];
  v79[4] = @"loggingDisabled";
  v71 = [NSNumber numberWithBool:LOBYTE(v4->_log)];
  v80[4] = v71;
  uint64_t v7 = MEMORY[0x263EFFA80];
  v79[5] = @"analyticsDisabled";
  v79[6] = @"fakeNonInternal";
  v80[5] = MEMORY[0x263EFFA80];
  v80[6] = MEMORY[0x263EFFA80];
  v80[7] = MEMORY[0x263EFFA80];
  v79[7] = @"customerLoggingEnabled";
  v79[8] = @"dataLoggingEnabled";
  v70 = [NSNumber numberWithBool:v5];
  v80[8] = v70;
  v79[9] = @"framesLoggingEnabled";
  v8 = [NSNumber numberWithBool:v5];
  v80[9] = v8;
  v80[10] = v6;
  v79[10] = @"framesRawLoggingDisabled";
  v79[11] = @"framesDebugLoggingEnabled";
  v9 = [NSNumber numberWithBool:v5];
  v80[11] = v9;
  v79[12] = @"faceDetectFailureLoggingEnabled";
  v10 = [NSNumber numberWithBool:v5];
  v80[12] = v10;
  v79[13] = @"faceDetectSequencesLoggingEnabled";
  v79[14] = @"faceDetectNoFaceLoggingEnabled";
  v80[13] = v7;
  v80[14] = v7;
  v79[15] = @"faceDetectDepthLoggingEnabled";
  int v11 = [NSNumber numberWithBool:v5];
  v80[15] = v11;
  v79[16] = @"sequenceInfoLoggingEnabled";
  int v12 = [NSNumber numberWithBool:v5];
  v80[16] = v12;
  v79[17] = @"sequenceDebugLoggingEnabled";
  uint64_t v13 = [NSNumber numberWithBool:v5];
  v80[17] = v13;
  v79[18] = @"SuppressPearlIssuePopup";
  v80[18] = v7;
  id v14 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:19];
  [v69 registerDefaults:v14];

  uint64_t v15 = [MEMORY[0x263EFF990] dataWithLength:*MEMORY[0x263EF8AF8]];
  id v16 = *(void **)&v4->_coachingHintsEnabled;
  *(void *)&v4->_coachingHintsEnabled = v15;

  if (!*(void *)&v4->_coachingHintsEnabled)
  {
    if (__osLog) {
      v61 = __osLog;
    }
    else {
      v61 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "_performCommandBufferData";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v82 = &unk_222DFB9BF;
    *(_WORD *)v83 = 2080;
    *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    v84 = 1024;
    v85 = 410;
    goto LABEL_88;
  }
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.pearld.smt", 0);
  id v18 = *(void **)&v4->_loggingOnRelease;
  *(void *)&v4->_loggingOnRelease = v17;

  if (!*(void *)&v4->_loggingOnRelease)
  {
    v62 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "_sharedMemoryTransferQueue";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v82 = &unk_222DFB9BF;
      *(_WORD *)v83 = 2080;
      *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      v84 = 1024;
      v85 = 415;
      _os_log_impl(&dword_222D7E000, v62, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  dispatch_queue_t v19 = dispatch_queue_create("com.apple.pearld.motion", 0);
  motionManager = v4->_motionManager;
  v4->_motionManager = (CMMotionManager *)v19;

  if (!v4->_motionManager)
  {
    v63 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "_motionDispatchQueue";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v82 = &unk_222DFB9BF;
      *(_WORD *)v83 = 2080;
      *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      v84 = 1024;
      v85 = 420;
      _os_log_impl(&dword_222D7E000, v63, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  dispatch_queue_t v21 = dispatch_queue_create("com.apple.pearld.logging", 0);
  sharedMemoryTransferQueue = v4->_sharedMemoryTransferQueue;
  v4->_sharedMemoryTransferQueue = (OS_dispatch_queue *)v21;

  if (!v4->_sharedMemoryTransferQueue)
  {
    v64 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "_loggingDispatchQueue";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v82 = &unk_222DFB9BF;
      *(_WORD *)v83 = 2080;
      *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      v84 = 1024;
      v85 = 424;
      _os_log_impl(&dword_222D7E000, v64, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  dispatch_queue_t v23 = dispatch_queue_create("com.apple.pearld.analytics", 0);
  analytics = v4->_analytics;
  v4->_analytics = (PearlCoreAnalytics *)v23;

  if (!v4->_analytics)
  {
    v65 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "_analyticsDispatchQueue";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v82 = &unk_222DFB9BF;
      *(_WORD *)v83 = 2080;
      *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      v84 = 1024;
      v85 = 428;
      _os_log_impl(&dword_222D7E000, v65, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  uint64_t v25 = (OS_dispatch_queue *)objc_alloc_init(MEMORY[0x263F08AE0]);
  avcQueue = v4->_avcQueue;
  v4->_avcQueue = v25;

  if (!v4->_avcQueue)
  {
    if (__osLog) {
      v61 = __osLog;
    }
    else {
      v61 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "_avcLock";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v82 = &unk_222DFB9BF;
    *(_WORD *)v83 = 2080;
    *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    v84 = 1024;
    v85 = 432;
    goto LABEL_88;
  }
  int v27 = MGGetSInt32Answer();
  *(double *)&v4->_secureFaceDetectLastFeedback = (double)v27;
  if (v27 && v27 != 180)
  {
    v28 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)&v4->_secureFaceDetectLastFeedback;
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v29;
      _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "Unexpected value of kMGQFrontCameraRotationForISP: %f\n", buf, 0xCu);
    }
  }
  uint64_t v30 = [MEMORY[0x263EFF980] array];
  collectedMetadataObjectsTimestamp = (void *)v4->_collectedMetadataObjectsTimestamp;
  v4->_collectedMetadataObjectsTimestamp = v30;

  LOWORD(v4->_connect) = 1;
  *(void *)&v4->_peakPowerPressureLevelNtfToken = 1011;
  LOBYTE(v4->_commProtocolVersion) = notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)&v4->_status, MEMORY[0x263EF83A0], &__block_literal_global) == 0;
  pearlDeviceState = (void *)v4->_pearlDeviceState;
  v4->_pearlDeviceState = 0;

  __int16 v33 = objc_alloc_init(PearlCoreAnalytics);
  v34 = *(void **)&v4->_logSequenceDebug;
  *(void *)&v4->_logSequenceDebug = v33;

  __int16 v35 = *(void **)&v4->_logSequenceDebug;
  int v36 = [(BiometricKitXPCServer *)v4 biometricABC];
  [v35 setPearlAbc:v36];

  v37 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__BiometricKitXPCServerPearl_init__block_invoke_213;
  block[3] = &unk_26466F610;
  long long v38 = v4;
  v73 = v38;
  dispatch_async(v37, block);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v38, (CFNotificationCallback)__LoggingStateNotificationCallback, @"com.apple.ManagedConfiguration.profileListChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v40 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v40, v38, (CFNotificationCallback)__LoggingStateNotificationCallback, @"com.apple.biometrickitd.loggingStateChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v41 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v41, v38, (CFNotificationCallback)__AutoRetryModeNotificationCallback, @"com.apple.biometrickitd.autoRetryModeChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v42 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v42, v38, (CFNotificationCallback)__CombinedSequenceModeNotificationCallback, @"com.apple.biometrickitd.combinedSequenceModeChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v43 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v43, v38, (CFNotificationCallback)__CoachingHintsEnabledNotificationCallback, @"com.apple.biometrickitd.coachingHintsEnabledChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v44 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v44, v38, (CFNotificationCallback)__EntitlementOverrideFlagsNotificationCallback, @"com.apple.biometrickitd.entitlementOverrideFlagsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v45 = dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, MEMORY[0x263EF83A0]);
  double z = v38->_lastGravity.z;
  *(void *)&v38->_lastGravity.double z = v45;

  dispatch_source_set_event_handler(*(dispatch_source_t *)&v38->_lastGravity.z, &__block_literal_global_234);
  dispatch_resume(*(dispatch_object_t *)&v38->_lastGravity.z);
  v47 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v48 = dispatch_queue_attr_make_with_qos_class(v47, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v49 = dispatch_queue_create("com.apple.biometrickitd.driverNotify", v48);
  driverNotifyPort = v38->_driverNotifyPort;
  v38->_driverNotifyPort = (IONotificationPort *)v49;

  if (!v38->_driverNotifyPort)
  {
    if (__osLog) {
      v61 = __osLog;
    }
    else {
      v61 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "_driverNotifyQueue";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v82 = &unk_222DFB9BF;
    *(_WORD *)v83 = 2080;
    *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    v84 = 1024;
    v85 = 488;
    goto LABEL_88;
  }
  v51 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  v38->super._reporter = v51;
  if (!v51)
  {
    if (__osLog) {
      v61 = __osLog;
    }
    else {
      v61 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "_driverNotifyPort";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v82 = &unk_222DFB9BF;
    *(_WORD *)v83 = 2080;
    *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    v84 = 1024;
    v85 = 491;
    goto LABEL_88;
  }
  IONotificationPortSetDispatchQueue(v51, (dispatch_queue_t)v38->_driverNotifyPort);
  reporter = v38->super._reporter;
  CFDictionaryRef v53 = IOServiceMatching("ApplePearlSEPDriver");
  v54 = IOServiceAddMatchingNotification(reporter, "IOServiceFirstMatch", v53, (IOServiceMatchingCallback)__serviceMatch, v38, (io_iterator_t *)&v38->_driverNotifyQueue);
  if (v54)
  {
    if (__osLog) {
      v61 = __osLog;
    }
    else {
      v61 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "kernErr == 0 ";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v54;
    *(_WORD *)&buf[22] = 2080;
    v82 = &unk_222DFB9BF;
    *(_WORD *)v83 = 2080;
    *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    v84 = 1024;
    v85 = 500;
LABEL_88:
    _os_log_impl(&dword_222D7E000, v61, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_89:

    long long v38 = 0;
    goto LABEL_32;
  }
  __serviceMatch(v38, LODWORD(v38->_driverNotifyQueue));
  if (_os_feature_enabled_impl())
  {
    *(void *)task_info_outCnt = 0;
    v76 = task_info_outCnt;
    v77 = 0x2050000000;
    v55 = (void *)getSTMediaStatusDomainPublisherClass_softClass;
    v78 = getSTMediaStatusDomainPublisherClass_softClass;
    if (!getSTMediaStatusDomainPublisherClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getSTMediaStatusDomainPublisherClass_block_invoke;
      v82 = &unk_26466F888;
      *(void *)v83 = task_info_outCnt;
      __getSTMediaStatusDomainPublisherClass_block_invoke((uint64_t)buf);
      v55 = (void *)*((void *)v76 + 3);
    }
    v56 = v55;
    _Block_object_dispose(task_info_outCnt, 8);
    v57 = [[v56 alloc] init];
    v58 = *(void **)&v38->_localToken.val[7];
    *(void *)&v38->_localToken.val[7] = v57;

    if (*(void *)&v38->_localToken.val[7]) {
      goto LABEL_30;
    }
    if (__osLog) {
      v66 = __osLog;
    }
    else {
      v66 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "_mediaStatusDomainPublisher";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v82 = &unk_222DFB9BF;
      *(_WORD *)v83 = 2080;
      *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      v84 = 1024;
      v85 = 505;
      _os_log_impl(&dword_222D7E000, v66, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (*(void *)&v38->_localToken.val[7])
    {
LABEL_30:
      task_info_outCnt[0] = 8;
      if (task_info(*MEMORY[0x263EF8960], 0xFu, (task_info_t)&v38->_performCommandBufferData + 1, task_info_outCnt))
      {
        if (__osLog) {
          v67 = __osLog;
        }
        else {
          v67 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "result == 0";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 2080;
          v82 = &unk_222DFB9BF;
          *(_WORD *)v83 = 2080;
          *(void *)&v83[2] = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          v84 = 1024;
          v85 = 509;
          _os_log_impl(&dword_222D7E000, v67, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v68 = *(void **)&v38->_localToken.val[7];
        *(void *)&v38->_localToken.val[7] = 0;
      }
    }
  }
  [(BiometricKitXPCServerPearl *)v38 checkBioLogConsent];
LABEL_32:
  if (__osLogTrace) {
    v59 = __osLogTrace;
  }
  else {
    v59 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v38;
    _os_log_impl(&dword_222D7E000, v59, OS_LOG_TYPE_DEFAULT, "init -> %@\n", buf, 0xCu);
  }
  return v38;
}

void __34__BiometricKitXPCServerPearl_init__block_invoke(int a1, int token)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  if (!notify_get_state(token, &state64))
  {
    if (__osLog) {
      v2 = __osLog;
    }
    else {
      v2 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v5 = state64;
      _os_log_impl(&dword_222D7E000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: New PeakPowerPressureLevel: %llu\n", buf, 0xCu);
    }
  }
}

uint64_t __34__BiometricKitXPCServerPearl_init__block_invoke_213(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerForLiftToWakeNotifications:1];
}

void __34__BiometricKitXPCServerPearl_init__block_invoke_2()
{
  if (__osLog) {
    v0 = __osLog;
  }
  else {
    v0 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_222D7E000, v0, OS_LOG_TYPE_DEFAULT, "SIGTERM received\n", v1, 2u);
  }
  exit(0);
}

- (int)initAutoBugCapture
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [PearlAutoBugCapture alloc];
  v4 = [(BiometricKitXPCServer *)self biometricABCDispatchQueue];
  uint64_t v5 = [(BiometricAutoBugCapture *)v3 initWithDomain:@"FaceID" process:@"biometrickitd" dispatchQueue:v4];
  [(BiometricKitXPCServer *)self setBiometricABC:v5];

  uint64_t v6 = [(BiometricKitXPCServer *)self biometricABC];

  if (v6) {
    return 0;
  }
  if (__osLog) {
    v8 = __osLog;
  }
  else {
    v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136316162;
    v10 = "self.biometricABC";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    id v14 = &unk_222DFB9BF;
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v17 = 1024;
    int v18 = 539;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
  }
  return 263;
}

- (void)dealloc
{
  [(BiometricKitXPCServerPearl *)self registerForLiftToWakeNotifications:0];
  io_object_t driverNotifyQueue = (io_object_t)self->_driverNotifyQueue;
  if (driverNotifyQueue) {
    IOObjectRelease(driverNotifyQueue);
  }
  io_connect_t driverNotifyQueue_high = HIDWORD(self->_driverNotifyQueue);
  if (driverNotifyQueue_high) {
    IOServiceClose(driverNotifyQueue_high);
  }
  io_object_t services = self->_services;
  if (services) {
    IOObjectRelease(services);
  }
  io_object_t v6 = HIDWORD(self->_driverNotifyQueue);
  if (v6) {
    IOObjectRelease(v6);
  }
  if (LOBYTE(self->_commProtocolVersion)) {
    notify_cancel(self->_status);
  }
  reporter = self->super._reporter;
  if (reporter) {
    IONotificationPortDestroy(reporter);
  }
  [*(id *)&self->_logSequenceDebug setAnalyticsPerformCommandBlock:0];
  analytics = self->_analytics;
  self->_analytics = 0;

  int v9 = *(void **)&self->_logSequenceDebug;
  *(void *)&self->_logSequenceDebug = 0;

  v10.receiver = self;
  v10.super_class = (Class)BiometricKitXPCServerPearl;
  [(BiometricKitXPCServer *)&v10 dealloc];
}

- (void)serviceMatch:(unsigned int)a3
{
  kern_return_t v9;
  kern_return_t v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  long long v26;
  void *v27;
  void *context;
  void v29[4];
  id v30;
  void block[5];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x263EF8340];
  int v27 = (void *)os_transaction_create();
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v33) = a3;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEFAULT, "serviceMatch: %u\n", buf, 8u);
  }
  context = (void *)MEMORY[0x223CA8CA0]();
  io_service_t v6 = IOIteratorNext(a3);
  if (v6)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    *(void *)&long long v7 = 136316162;
    unsigned int v26 = v7;
    do
    {
      int v9 = IOServiceOpen(v6, *MEMORY[0x263EF8960], 0, (io_connect_t *)&self->_driverNotifyQueue + 1);
      if (v9)
      {
        uint64_t v19 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          __int16 v33 = "err == 0 ";
          v34 = 2048;
          __int16 v35 = v9;
          int v36 = 2080;
          v37 = &unk_222DFB9BF;
          long long v38 = 2080;
          uint64_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          v40 = 1024;
          v41 = 588;
          _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      self->_io_object_t services = 0;
      objc_super v10 = IOServiceAddInterestNotification(self->super._reporter, v6, "IOGeneralInterest", (IOServiceInterestCallback)__serviceStatus, self, &self->_services);
      if (v10)
      {
        v20 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          __int16 v33 = "err == 0 ";
          v34 = 2048;
          __int16 v35 = v10;
          int v36 = 2080;
          v37 = &unk_222DFB9BF;
          long long v38 = 2080;
          uint64_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          v40 = 1024;
          v41 = 597;
          _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      IOObjectRelease(v6);
      [(BiometricKitXPCServerPearl *)self getCommProtocolVersion];
      __int16 v11 = [(BiometricKitXPCServerPearl *)self initializeEngineWithOptions:BYTE1(self->_log)];
      if (v11)
      {
        dispatch_queue_t v21 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          __int16 v33 = "[self initializeEngineWithOptions:(_inDiagnosticMode ? kInitEngineOptionSkipMemoryAllocation : kInitEngi"
                "neOptionNone)] == 0 ";
          v34 = 2048;
          __int16 v35 = v11;
          int v36 = 2080;
          v37 = &unk_222DFB9BF;
          long long v38 = 2080;
          uint64_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          v40 = 1024;
          v41 = 604;
          _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      [(BiometricKitXPCServer *)self cacheCatacombInfo];
      uint64_t v12 = dispatch_get_global_queue(0, 0);
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __43__BiometricKitXPCServerPearl_serviceMatch___block_invoke;
      block[3] = &unk_26466F610;
      block[4] = self;
      dispatch_async(v12, block);

      [(BiometricKitXPCServerPearl *)self performCancelCommand];
      if (BYTE1(self->_log))
      {
        [(BiometricKitXPCServerPearl *)self performNoCatacombCommand:0xFFFFFFFFLL];
        [(BiometricKitXPCServer *)self setCatacombFileAccessed:0];
      }
      else if (isEphemeralMultiUser())
      {
        [(BiometricKitXPCServer *)self syncTemplateListForUser:0xFFFFFFFFLL];
        [(BiometricKitXPCServer *)self setCatacombFileAccessed:1];
      }
      else
      {
        if ([(BiometricKitXPCServer *)self isClassCFileAccessible])
        {
          [(BiometricKitXPCServer *)self setCatacombFileAccessed:1];
          __int16 v13 = [(BiometricKitXPCServerPearl *)self restoreAndSyncTemplates];
          if (!v13) {
            goto LABEL_23;
          }
          id v14 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = v26;
          __int16 v33 = "err == 0 ";
          v34 = 2048;
          __int16 v35 = v13;
          int v36 = 2080;
          v37 = &unk_222DFB9BF;
          long long v38 = 2080;
          uint64_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          v40 = 1024;
          v41 = 634;
          __int16 v15 = v14;
        }
        else
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__firstUnlockCallback, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
          [(BiometricKitXPCServer *)self setTemplatesAtBoot:[(BiometricKitXPCServer *)self templatesExistAtBoot]];
          __int16 v17 = [(BiometricKitXPCServerPearl *)self performCommand:23 inValue:[(BiometricKitXPCServer *)self templatesAtBoot] inData:0 inSize:0 outData:0 outSize:0];
          if (!v17) {
            goto LABEL_23;
          }
          v22 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = v26;
          __int16 v33 = "err == 0 ";
          v34 = 2048;
          __int16 v35 = v17;
          int v36 = 2080;
          v37 = &unk_222DFB9BF;
          long long v38 = 2080;
          uint64_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          v40 = 1024;
          v41 = 646;
          __int16 v15 = v22;
        }
        _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_23:
      [(BiometricKitXPCServer *)self displayStateChanged:[(BiometricKitXPCServer *)self isDisplayOn]];
      [(BiometricKitXPCServer *)self postGeneralLockoutStateNotification];
      [(BiometricKitXPCServer *)self updateEnrollmentChangedNotification:1];
      if (__osLog) {
        int v18 = __osLog;
      }
      else {
        int v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_DEFAULT, "serviceMatch: initialized\n", buf, 2u);
      }
      io_service_t v6 = IOIteratorNext(a3);
    }
    while (v6);
  }
  dispatch_queue_t v23 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v23 synchronize];

  [(BiometricKitXPCServerPearl *)self updateLoggingState];
  [(BiometricKitXPCServerPearl *)self updateAutoRetryMode];
  [(BiometricKitXPCServerPearl *)self updateCombinedSequenceMode];
  [(BiometricKitXPCServerPearl *)self updateCoachingHintsEnabled];
  [(BiometricKitXPCServerPearl *)self updateEntitlementOverrideFlags];
  objc_initWeak((id *)buf, self);
  v24 = *(void **)&self->_logSequenceDebug;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __43__BiometricKitXPCServerPearl_serviceMatch___block_invoke_254;
  v29[3] = &unk_26466F658;
  objc_copyWeak(&v30, (id *)buf);
  [v24 setAnalyticsPerformCommandBlock:v29];
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
  if (__osLogTrace) {
    uint64_t v25 = __osLogTrace;
  }
  else {
    uint64_t v25 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_DEFAULT, "serviceMatch: -> void\n", buf, 2u);
  }
}

uint64_t __43__BiometricKitXPCServerPearl_serviceMatch___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[321])
  {
    [v2 initializeSprl];
    v2 = *(unsigned char **)(a1 + 32);
  }
  if ([v2 identitiesCount]) {
    [*(id *)(a1 + 32) syncTemplateListForUser:0xFFFFFFFFLL];
  }
  v3 = *(void **)(a1 + 32);

  return [v3 verifyDisplayTrust];
}

uint64_t __43__BiometricKitXPCServerPearl_serviceMatch___block_invoke_254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v14 = [WeakRetained performCommand:a2 inValue:a3 inData:a4 inSize:a5 outData:a6 outSize:a7];

  return v14;
}

- (void)firstUnlockCallback
{
  v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    v4 = __osLogTrace;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "firstUnlockCallback\n", buf, 2u);
  }
  [(BiometricKitXPCServer *)self setTemplatesAtBoot:0];
  [(BiometricKitXPCServerPearl *)self restoreAndSyncTemplates];
  [(BiometricKitXPCServer *)self updateEnrollmentChangedNotification:0];
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = v3;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)io_service_t v6 = 0;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEBUG, "firstUnlockCallback -> void\n", v6, 2u);
  }
}

- (int)serviceStatus:(unsigned int)a3 version:(unsigned int)a4 ordinal:(unint64_t)a5 data:(id)a6 timestamp:(unint64_t)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v12 = a6;
  __int16 v13 = MEMORY[0x263EF8438];
  if (__osLog) {
    uint64_t v14 = __osLog;
  }
  else {
    uint64_t v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v9;
    *(_WORD *)v66 = 2048;
    *(void *)&v66[2] = a5;
    *(_WORD *)v67 = 2112;
    *(void *)&v67[2] = v12;
    *(_WORD *)v68 = 2048;
    *(void *)&v68[2] = a7;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_DEBUG, "serviceStatus:version:ordinal:data:timestamp: 0x%x 0x%x 0x%llx %@ %llu\n", buf, 0x2Cu);
  }
  switch(v10)
  {
    case 0xE3FF8002:
      if (v9 == 1)
      {
        [(BiometricKitXPCServerPearl *)self matchResult:v12 withTimestamp:a7];
        goto LABEL_78;
      }
      if (__osLog) {
        v56 = __osLog;
      }
      else {
        v56 = v13;
      }
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        goto LABEL_174;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "msgVersion == 1";
      *(_WORD *)&buf[12] = 2048;
      *(void *)v66 = 0;
      *(_WORD *)&v66[8] = 2080;
      *(void *)v67 = &unk_222DFB9BF;
      *(_WORD *)&v67[8] = 2080;
      *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      *(_WORD *)&v68[8] = 1024;
      int v69 = 748;
      goto LABEL_173;
    case 0xE3FF8003:
      if (v9 == 1)
      {
        [(BiometricKitXPCServerPearl *)self enrollResult:v12 withTimestamp:a7];
        goto LABEL_78;
      }
      if (__osLog) {
        v56 = __osLog;
      }
      else {
        v56 = v13;
      }
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        goto LABEL_174;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "msgVersion == 1";
      *(_WORD *)&buf[12] = 2048;
      *(void *)v66 = 0;
      *(_WORD *)&v66[8] = 2080;
      *(void *)v67 = &unk_222DFB9BF;
      *(_WORD *)&v67[8] = 2080;
      *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      *(_WORD *)&v68[8] = 1024;
      int v69 = 754;
      goto LABEL_173;
    case 0xE3FF8004:
      if (v9 == 1)
      {
        [(BiometricKitXPCServerPearl *)self enrollUpdate:v12 withTimestamp:a7];
        goto LABEL_78;
      }
      if (__osLog) {
        v56 = __osLog;
      }
      else {
        v56 = v13;
      }
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        goto LABEL_174;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "msgVersion == 1";
      *(_WORD *)&buf[12] = 2048;
      *(void *)v66 = 0;
      *(_WORD *)&v66[8] = 2080;
      *(void *)v67 = &unk_222DFB9BF;
      *(_WORD *)&v67[8] = 2080;
      *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      *(_WORD *)&v68[8] = 1024;
      int v69 = 760;
      goto LABEL_173;
    case 0xE3FF8005:
      if (v9 == 1)
      {
        [(BiometricKitXPCServerPearl *)self enrollFeedback:v12 withTimestamp:a7];
        goto LABEL_78;
      }
      if (__osLog) {
        v56 = __osLog;
      }
      else {
        v56 = v13;
      }
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        goto LABEL_174;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "msgVersion == 1";
      *(_WORD *)&buf[12] = 2048;
      *(void *)v66 = 0;
      *(_WORD *)&v66[8] = 2080;
      *(void *)v67 = &unk_222DFB9BF;
      *(_WORD *)&v67[8] = 2080;
      *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      *(_WORD *)&v68[8] = 1024;
      int v69 = 765;
      goto LABEL_173;
    case 0xE3FF8006:
      unsigned int v63 = 0;
      if (v9 == 1)
      {
        if (v12)
        {
          [v12 getBytes:&v63 length:4];
          if (v63 > 0x3E7)
          {
            p_super = &self->_analytics->super;
            v59[0] = MEMORY[0x263EF8330];
            v59[1] = 3221225472;
            v59[2] = __75__BiometricKitXPCServerPearl_serviceStatus_version_ordinal_data_timestamp___block_invoke_2;
            v59[3] = &unk_26466F680;
            v59[4] = self;
            v22 = &v60;
            id v60 = v12;
            dispatch_queue_t v23 = v59;
          }
          else
          {
            p_super = self->_sharedMemoryTransferQueue;
            v61[0] = MEMORY[0x263EF8330];
            v61[1] = 3221225472;
            v61[2] = __75__BiometricKitXPCServerPearl_serviceStatus_version_ordinal_data_timestamp___block_invoke_258;
            v61[3] = &unk_26466F680;
            v61[4] = self;
            v22 = &v62;
            id v62 = v12;
            dispatch_queue_t v23 = v61;
          }
          dispatch_async(p_super, v23);

          goto LABEL_78;
        }
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "msgData";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 784;
          goto LABEL_173;
        }
      }
      else
      {
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "msgVersion == 1";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 783;
          goto LABEL_173;
        }
      }
      goto LABEL_174;
    case 0xE3FF8007:
      if (v9 == 1)
      {
        if ((unint64_t)[v12 length] > 5)
        {
          v24 = (unsigned int *)[v12 bytes];
          uint64_t v25 = v24;
          if ((v24[1] & 0x80) != 0) {
            [(BiometricKitXPCServer *)self syncTemplateListForUser:*v24];
          }
          [(BiometricKitXPCServer *)self postGeneralLockoutStateNotification];
          [(BiometricKitXPCServer *)self updateLockoutStateNotification:*((unsigned __int16 *)v25 + 2)];
          if ((v25[1] & 0x21) == 0x20)
          {
            if (BYTE1(self->_mediaStatusDomainPublisher) && !BYTE2(self->_mediaStatusDomainPublisher))
            {
              ++LOBYTE(self->_mediaStatusDomainPublisher);
              if (__osLog) {
                unsigned int v26 = __osLog;
              }
              else {
                unsigned int v26 = v13;
              }
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                int mediaStatusDomainPublisher_low = LOBYTE(self->_mediaStatusDomainPublisher);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = mediaStatusDomainPublisher_low;
                _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_DEFAULT, "Glasses banner check: failCount:%u\n", buf, 8u);
              }
              if (LOBYTE(self->_mediaStatusDomainPublisher) >= 3u)
              {
                if ([MEMORY[0x263F2AAD0] displayPearlGlassesBannerNotification]) {
                  +[PearlCoreAnalytics sendDisplayPearlGlassesBannerNotificationEvent];
                }
                BYTE2(self->_mediaStatusDomainPublisher) = 1;
              }
            }
            BYTE1(self->_mediaStatusDomainPublisher) = 0;
          }
          v28 = [MEMORY[0x263F089D8] string];
          uint64_t v29 = v28;
          __int16 v30 = *((_WORD *)v25 + 2);
          if (v30)
          {
            uint64_t v38 = [v28 length];
            uint64_t v39 = ",";
            if (!v38) {
              uint64_t v39 = (const char *)&unk_222DFB9BF;
            }
            [v29 appendFormat:@"%sDeviceLocked", v39];
            __int16 v30 = *((_WORD *)v25 + 2);
            if ((v30 & 2) == 0)
            {
LABEL_51:
              if ((v30 & 4) == 0) {
                goto LABEL_52;
              }
              goto LABEL_91;
            }
          }
          else if ((v30 & 2) == 0)
          {
            goto LABEL_51;
          }
          uint64_t v40 = [v29 length];
          v41 = ",";
          if (!v40) {
            v41 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sPasscodeLockout"];
          __int16 v30 = *((_WORD *)v25 + 2);
          if ((v30 & 4) == 0)
          {
LABEL_52:
            if ((v30 & 8) == 0) {
              goto LABEL_53;
            }
            goto LABEL_94;
          }
LABEL_91:
          uint64_t v42 = [v29 length];
          v43 = ",";
          if (!v42) {
            v43 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sBioLockout", v43];
          __int16 v30 = *((_WORD *)v25 + 2);
          if ((v30 & 8) == 0)
          {
LABEL_53:
            if ((v30 & 0x200) == 0) {
              goto LABEL_54;
            }
            goto LABEL_97;
          }
LABEL_94:
          uint64_t v44 = [v29 length];
          dispatch_source_t v45 = ",";
          if (!v44) {
            dispatch_source_t v45 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sUnlockTokenPresent", v45];
          __int16 v30 = *((_WORD *)v25 + 2);
          if ((v30 & 0x200) == 0)
          {
LABEL_54:
            if ((v30 & 0x10) == 0) {
              goto LABEL_55;
            }
            goto LABEL_100;
          }
LABEL_97:
          uint64_t v46 = [v29 length];
          v47 = ",";
          if (!v46) {
            v47 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sApplePayTokenPresent", v47];
          __int16 v30 = *((_WORD *)v25 + 2);
          if ((v30 & 0x10) == 0)
          {
LABEL_55:
            if ((v30 & 0x20) == 0) {
              goto LABEL_56;
            }
            goto LABEL_103;
          }
LABEL_100:
          uint64_t v48 = [v29 length];
          dispatch_queue_t v49 = ",";
          if (!v48) {
            dispatch_queue_t v49 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sBeforeFirstUnlock", v49];
          __int16 v30 = *((_WORD *)v25 + 2);
          if ((v30 & 0x20) == 0)
          {
LABEL_56:
            if ((v30 & 0x40) == 0) {
              goto LABEL_57;
            }
            goto LABEL_106;
          }
LABEL_103:
          uint64_t v50 = [v29 length];
          v51 = ",";
          if (!v50) {
            v51 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sPasscodeValidated", v51];
          __int16 v30 = *((_WORD *)v25 + 2);
          if ((v30 & 0x40) == 0)
          {
LABEL_57:
            if ((v30 & 0x80) == 0) {
              goto LABEL_58;
            }
            goto LABEL_109;
          }
LABEL_106:
          uint64_t v52 = [v29 length];
          CFDictionaryRef v53 = ",";
          if (!v52) {
            CFDictionaryRef v53 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sIdentificationLockout", v53];
          __int16 v30 = *((_WORD *)v25 + 2);
          if ((v30 & 0x80) == 0)
          {
LABEL_58:
            if ((v30 & 0x400) == 0)
            {
LABEL_62:
              if (__osLog) {
                __int16 v33 = __osLog;
              }
              else {
                __int16 v33 = v13;
              }
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v34 = *v25;
                int v35 = *((unsigned __int16 *)v25 + 2);
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&uint8_t buf[4] = v34;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v35;
                *(_WORD *)v66 = 2112;
                *(void *)&v66[2] = v29;
                _os_log_impl(&dword_222D7E000, v33, OS_LOG_TYPE_DEFAULT, "SKS state: %u: 0x%x (%@)\n", buf, 0x18u);
              }
              if ((v25[1] & 0x20) != 0) {
                [self->_pearlDeviceState logPasscodeValidatedWithUserID:*v25];
              }

              goto LABEL_78;
            }
LABEL_59:
            uint64_t v31 = [v29 length];
            v32 = ",";
            if (!v31) {
              v32 = (const char *)&unk_222DFB9BF;
            }
            [v29 appendFormat:@"%sRemoteUnlocked", v32];
            goto LABEL_62;
          }
LABEL_109:
          uint64_t v54 = [v29 length];
          v55 = ",";
          if (!v54) {
            v55 = (const char *)&unk_222DFB9BF;
          }
          [v29 appendFormat:@"%sCatacombCorrupted", v55];
          if ((v25[1] & 0x400) == 0) {
            goto LABEL_62;
          }
          goto LABEL_59;
        }
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "[msgData length] >= sizeof(message_sks_state_v1_t)";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 815;
          goto LABEL_173;
        }
      }
      else
      {
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "msgVersion == 1";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 814;
          goto LABEL_173;
        }
      }
      goto LABEL_174;
    case 0xE3FF8008:
    case 0xE3FF8009:
      goto LABEL_16;
    case 0xE3FF800A:
      if (v9 == 1)
      {
        if ((unint64_t)[v12 length] > 0x1C)
        {
          -[BiometricKitXPCServerPearl matchEventMessage:](self, "matchEventMessage:", [v12 bytes]);
          goto LABEL_78;
        }
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "[msgData length] >= sizeof(message_match_event_v1_t)";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 876;
          goto LABEL_173;
        }
      }
      else
      {
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "msgVersion == 1";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 875;
          goto LABEL_173;
        }
      }
      goto LABEL_174;
    case 0xE3FF800B:
      if (v9 == 1)
      {
        if ((unint64_t)[v12 length] > 0x16)
        {
          -[BiometricKitXPCServerPearl secureFaceDetectRequestMessage:](self, "secureFaceDetectRequestMessage:", [v12 bytes]);
          goto LABEL_78;
        }
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "[msgData length] >= sizeof(message_secure_fd_request_v1_t)";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 882;
          goto LABEL_173;
        }
      }
      else
      {
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = v13;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "msgVersion == 1";
          *(_WORD *)&buf[12] = 2048;
          *(void *)v66 = 0;
          *(_WORD *)&v66[8] = 2080;
          *(void *)v67 = &unk_222DFB9BF;
          *(_WORD *)&v67[8] = 2080;
          *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          *(_WORD *)&v68[8] = 1024;
          int v69 = 881;
LABEL_173:
          _os_log_impl(&dword_222D7E000, v56, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
LABEL_174:
      int v19 = 263;
      goto LABEL_175;
    default:
      if (v10 == -469793792)
      {
        if (__osLog) {
          __int16 v15 = __osLog;
        }
        else {
          __int16 v15 = v13;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = *(void *)&self->_loggingOnRelease;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_INFO, "kAppleBiometricSharedMemoryTransfer: dispatching %@\n", buf, 0xCu);
        }
        __int16 v17 = *(NSObject **)&self->_loggingOnRelease;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __75__BiometricKitXPCServerPearl_serviceStatus_version_ordinal_data_timestamp___block_invoke;
        block[3] = &unk_26466F610;
        block[4] = self;
        dispatch_async(v17, block);
        goto LABEL_78;
      }
LABEL_16:
      v58.receiver = self;
      v58.super_class = (Class)BiometricKitXPCServerPearl;
      unsigned int v18 = [(BiometricKitXPCServer *)&v58 serviceStatus:v10 version:v9 ordinal:a5 data:v12 timestamp:a7];
      if (!v18)
      {
LABEL_78:
        if (__osLogTrace) {
          int v36 = __osLogTrace;
        }
        else {
          int v36 = v13;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(void *)buf = 67109120;
          _os_log_impl(&dword_222D7E000, v36, OS_LOG_TYPE_DEBUG, "serviceStatus:type:inValue: -> 0x%x\n", buf, 8u);
        }
        int v19 = 0;
        goto LABEL_84;
      }
      int v19 = v18;
      if (__osLog) {
        v20 = __osLog;
      }
      else {
        v20 = v13;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = "err == 0 ";
        *(_WORD *)&buf[12] = 2048;
        *(void *)v66 = v19;
        *(_WORD *)&v66[8] = 2080;
        *(void *)v67 = &unk_222DFB9BF;
        *(_WORD *)&v67[8] = 2080;
        *(void *)v68 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        *(_WORD *)&v68[8] = 1024;
        int v69 = 889;
        _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_175:
      if (__osLogTrace) {
        v57 = __osLogTrace;
      }
      else {
        v57 = v13;
      }
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_222D7E000, v57, OS_LOG_TYPE_ERROR, "serviceStatus:type:inValue: -> 0x%x\n", buf, 8u);
      }
LABEL_84:

      return v19;
  }
}

uint64_t __75__BiometricKitXPCServerPearl_serviceStatus_version_ordinal_data_timestamp___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doSharedMemoryTransfers];
}

void __75__BiometricKitXPCServerPearl_serviceStatus_version_ordinal_data_timestamp___block_invoke_258(uint64_t a1)
{
  id v3 = (id)os_transaction_create();
  v2 = (void *)MEMORY[0x223CA8CA0]();
  [*(id *)(a1 + 32) logKernelMessage:*(void *)(a1 + 40)];
}

void __75__BiometricKitXPCServerPearl_serviceStatus_version_ordinal_data_timestamp___block_invoke_2(uint64_t a1)
{
  id v3 = (id)os_transaction_create();
  v2 = (void *)MEMORY[0x223CA8CA0]();
  [*(id *)(a1 + 32) analyticsKernelMessage:*(void *)(a1 + 40)];
}

- (void)updateAutoRetryMode
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    v4 = __osLogTrace;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "updateAutoRetryMode\n", (uint8_t *)&v11, 2u);
  }
  if (isInternalBuild())
  {
    uint64_t v5 = [MEMORY[0x263F2AAB8] sharedInstance];
    unsigned __int16 v6 = [v5 intForKey:@"autoRetryMode"];

    int v7 = [(BiometricKitXPCServerPearl *)self performCommand:62 inValue:v6 inData:0 inSize:0 outData:0 outSize:0];
    if (v7)
    {
      int v9 = v7;
      uint64_t v10 = (__osLog ? __osLog : v3);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136316162;
        id v12 = "err == 0 ";
        __int16 v13 = 2048;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        uint64_t v16 = &unk_222DFB9BF;
        __int16 v17 = 2080;
        unsigned int v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v19 = 1024;
        int v20 = 943;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = v3;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "updateAutoRetryMode -> void\n", (uint8_t *)&v11, 2u);
  }
}

- (void)updateCombinedSequenceMode
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    v4 = __osLogTrace;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "updateCombinedSequenceMode\n", buf, 2u);
  }
  if (isInternalBuild())
  {
    uint64_t v5 = [MEMORY[0x263F2AAB8] sharedInstance];
    char v6 = [v5 integerForKey:@"combinedSequenceMode"];

    char v11 = v6;
    int v7 = [(BiometricKitXPCServerPearl *)self performCommand:60 inValue:0 inData:&v11 inSize:1 outData:0 outSize:0];
    if (v7)
    {
      int v9 = v7;
      uint64_t v10 = (__osLog ? __osLog : v3);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v13 = "err == 0 ";
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        __int16 v17 = &unk_222DFB9BF;
        __int16 v18 = 2080;
        __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v20 = 1024;
        int v21 = 976;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = v3;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "updateCombinedSequenceMode -> void\n", buf, 2u);
  }
}

- (void)updateEntitlementOverrideFlags
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    v4 = __osLogTrace;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "updateEntitlementOverrideFlags\n", buf, 2u);
  }
  if (isInternalBuild())
  {
    uint64_t v5 = [MEMORY[0x263F2AAB8] sharedInstance];
    int v6 = [v5 unsignedIntForKey:@"entitlementOverrideFlags"];

    int v11 = v6;
    int v7 = [(BiometricKitXPCServerPearl *)self performCommand:64 inValue:0 inData:&v11 inSize:4 outData:0 outSize:0];
    if (v7)
    {
      int v9 = v7;
      uint64_t v10 = (__osLog ? __osLog : v3);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v13 = "err == 0 ";
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        __int16 v17 = &unk_222DFB9BF;
        __int16 v18 = 2080;
        __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v20 = 1024;
        int v21 = 1007;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = v3;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "updateEntitlementOverrideFlags -> void\n", buf, 2u);
  }
}

- (void)updateCoachingHintsEnabled
{
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    v4 = __osLogTrace;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "updateCoachingHintsEnabled\n", buf, 2u);
  }
  uint64_t v5 = [MEMORY[0x263F2AAB8] sharedInstance];
  LOBYTE(self->_sigTERMDispatchSource) = [v5 BOOLForKey:@"coachingHintsEnabled"];

  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = v3;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "updateCoachingHintsEnabled -> void\n", v7, 2u);
  }
}

- (void)updateLoggingState
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    v4 = __osLogTrace;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "updateLoggingState\n", buf, 2u);
  }
  uint64_t v5 = [MEMORY[0x263F2AAB8] sharedInstance];
  char v6 = [v5 BOOLForKey:@"loggingDisabled"];

  int v7 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v8 = [v7 BOOLForKey:@"analyticsDisabled"];

  if (v8) {
    unsigned __int16 v9 = 0;
  }
  else {
    unsigned __int16 v9 = 0x8000;
  }
  if ((isInternalBuild() & 1) == 0 && !LOBYTE(self->_log)
    || ([MEMORY[0x263F2AAB8] sharedInstance],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 BOOLForKey:@"fakeNonInternal"],
        v10,
        v9 |= v11,
        v11))
  {
    if (!isInternalBuild()
      || ([MEMORY[0x263F2AAB8] sharedInstance],
          id v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 BOOLForKey:@"customerLoggingEnabled"],
          v12,
          !v13))
    {
      if ([(BiometricKitXPCServer *)self isClassCFileAccessible]) {
        +[BioLog scheduleDiagnosticLogsRemoval];
      }
      pearlDeviceState = (void *)self->_pearlDeviceState;
      self->_pearlDeviceState = 0;

      goto LABEL_21;
    }
    __int16 v14 = (void *)self->_pearlDeviceState;
    if (v14 && ![v14 isInternal]
      || (id v15 = [[BioLog alloc] initForInternalLogging:0],
          __int16 v16 = (void *)self->_pearlDeviceState,
          self->_pearlDeviceState = (int64_t)v15,
          v16,
          self->_pearlDeviceState))
    {
      v9 |= 0x204u;
LABEL_21:
      __int16 v71 = -1;
      goto LABEL_23;
    }
    uint64_t v59 = v3;
    if (__osLog) {
      id v60 = __osLog;
    }
    else {
      id v60 = v3;
    }
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
LABEL_101:
      uint64_t v3 = v59;
      goto LABEL_64;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v73 = "_log";
    *(_WORD *)&v73[8] = 2048;
    uint64_t v74 = 0;
    __int16 v75 = 2080;
    v76 = &unk_222DFB9BF;
    __int16 v77 = 2080;
    v78 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v79 = 1024;
    int v80 = 1087;
LABEL_100:
    _os_log_impl(&dword_222D7E000, v60, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_101;
  }
  __int16 v71 = -1;
  if (v6)
  {
LABEL_23:
    if (__osLog) {
      __int16 v18 = __osLog;
    }
    else {
      __int16 v18 = v3;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v73 = v9;
      _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_DEFAULT, "updateLoggingState OFF (0x%x)\n", buf, 8u);
    }
    goto LABEL_64;
  }
  if (!self->_pearlDeviceState)
  {
    id v19 = [[BioLog alloc] initForInternalLogging:1];
    __int16 v20 = (void *)self->_pearlDeviceState;
    self->_pearlDeviceState = (int64_t)v19;

    if (!self->_pearlDeviceState)
    {
      uint64_t v59 = v3;
      if (__osLog) {
        id v60 = __osLog;
      }
      else {
        id v60 = v3;
      }
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        goto LABEL_101;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)v73 = "_log";
      *(_WORD *)&v73[8] = 2048;
      uint64_t v74 = 0;
      __int16 v75 = 2080;
      v76 = &unk_222DFB9BF;
      __int16 v77 = 2080;
      v78 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v79 = 1024;
      int v80 = 1113;
      goto LABEL_100;
    }
  }
  int v21 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v69 = [v21 BOOLForKey:@"dataLoggingEnabled"];

  uint64_t v22 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v68 = [v22 BOOLForKey:@"framesLoggingEnabled"];

  dispatch_queue_t v23 = [MEMORY[0x263F2AAB8] sharedInstance];
  unsigned int v67 = [v23 BOOLForKey:@"framesRawLoggingDisabled"];

  v24 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v66 = [v24 BOOLForKey:@"framesDebugLoggingEnabled"];

  uint64_t v25 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v65 = [v25 BOOLForKey:@"faceDetectFailureLoggingEnabled"];

  unsigned int v26 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v64 = [v26 BOOLForKey:@"faceDetectSequencesLoggingEnabled"];

  int v27 = [MEMORY[0x263F2AAB8] sharedInstance];
  HIDWORD(v61) = [v27 BOOLForKey:@"faceDetectNoFaceLoggingEnabled"];

  v28 = [MEMORY[0x263F2AAB8] sharedInstance];
  LODWORD(v61) = [v28 BOOLForKey:@"faceDetectDepthLoggingEnabled"];

  uint64_t v29 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v30 = [v29 BOOLForKey:@"sequenceInfoLoggingEnabled"];

  uint64_t v31 = [MEMORY[0x263F2AAB8] sharedInstance];
  int v32 = [v31 BOOLForKey:@"sequenceDebugLoggingEnabled"];

  __int16 v33 = [MEMORY[0x263F2AAB8] sharedInstance];
  unsigned int v34 = [v33 numberForKey:@"enrollFaceDetectLoggingSkip"];

  int v35 = v3;
  if (v34)
  {
    int v36 = [v34 unsignedCharValue];
    LOBYTE(v71) = v36;
  }
  else
  {
    int v36 = 255;
  }
  v37 = [MEMORY[0x263F2AAB8] sharedInstance:v61];
  uint64_t v38 = [v37 numberForKey:@"faceDetectLoggingSkip"];

  if (v38)
  {
    int v39 = [v38 unsignedCharValue];
    HIBYTE(v71) = v39;
  }
  else
  {
    int v39 = 255;
  }
  unsigned __int16 v40 = v9 | 2;
  if (!v69) {
    unsigned __int16 v40 = v9;
  }
  __int16 v41 = v40 | 4;
  if (v67) {
    __int16 v41 = v40;
  }
  unsigned __int16 v42 = v41 | 8;
  if (v68) {
    unsigned __int16 v43 = v42;
  }
  else {
    unsigned __int16 v43 = v40;
  }
  [self->_pearlDeviceState setRetentionPolicyLow:v68 ^ 1 | v67];
  unsigned __int16 v44 = v43 | 0x10;
  if (!v66) {
    unsigned __int16 v44 = v43;
  }
  if (v65) {
    v44 |= 0x20u;
  }
  if (v64) {
    v44 |= 0x40u;
  }
  if (v63) {
    v44 |= 0x80u;
  }
  if (v62) {
    v44 |= 0x100u;
  }
  if (v30) {
    v44 |= 0x200u;
  }
  if (v32) {
    unsigned __int16 v9 = v44 | 0x400;
  }
  else {
    unsigned __int16 v9 = v44;
  }
  LOBYTE(self->_loggingDispatchQueue) = v32;
  BYTE1(self->_loggingDispatchQueue) = v30;
  if (__osLog) {
    dispatch_source_t v45 = __osLog;
  }
  else {
    dispatch_source_t v45 = v35;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v73 = v9;
    *(_WORD *)&v73[4] = 1024;
    *(_DWORD *)&v73[6] = v36;
    LOWORD(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 2) = v39;
    _os_log_impl(&dword_222D7E000, v45, OS_LOG_TYPE_DEFAULT, "updateLoggingState 0x%x (EFDSkipCount %d, FDSkipCount %d)\n", buf, 0x14u);
  }

  uint64_t v3 = (uint64_t)v35;
LABEL_64:
  wakeGestureManager = self->_wakeGestureManager;
  if ((v9 & 0x8200) == 0)
  {
    [(CMWakeGestureManager *)wakeGestureManager stopDeviceOrientationUpdates];
    uint64_t v52 = self->_wakeGestureManager;
    self->_wakeGestureManager = 0;

LABEL_73:
    p_orientationManager = (id *)&self->_orientationManager;
    [(CMDeviceOrientationManager *)self->_orientationManager stopDeviceMotionUpdates];
LABEL_74:
    id v53 = *p_orientationManager;
    id *p_orientationManager = 0;

    goto LABEL_75;
  }
  if (!wakeGestureManager && [MEMORY[0x263F01738] isAvailable])
  {
    v47 = (CMWakeGestureManager *)objc_alloc_init(MEMORY[0x263F01738]);
    uint64_t v48 = self->_wakeGestureManager;
    self->_wakeGestureManager = v47;
  }
  if ((v9 & 0x200) == 0) {
    goto LABEL_73;
  }
  p_orientationManager = (id *)&self->_orientationManager;
  if (!self->_orientationManager)
  {
    id v50 = objc_alloc_init(MEMORY[0x263F01788]);
    id v51 = *p_orientationManager;
    id *p_orientationManager = v50;

    if (([*p_orientationManager isDeviceMotionAvailable] & 1) == 0) {
      goto LABEL_74;
    }
  }
LABEL_75:
  if (self->_wakeGestureManager || self->_orientationManager)
  {
    uint64_t v54 = [(BiometricKitXPCServer *)self ongoingBiometricOperation];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __48__BiometricKitXPCServerPearl_updateLoggingState__block_invoke;
    v70[3] = &unk_26466F6A8;
    v70[4] = self;
    [v54 setActivityUpdateBlock:v70];
  }
  int v55 = [(BiometricKitXPCServerPearl *)self performCommand:31 inValue:v9 inData:&v71 inSize:2 outData:0 outSize:0];
  if (v55)
  {
    int v57 = v55;
    objc_super v58 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v73 = "[self performCommand:kSetLoggingStateCommand inValue:state inData:&inData inSize:sizeof(inData) o"
                       "utData:((void *)0) outSize:((void *)0)] == 0 ";
      *(_WORD *)&v73[8] = 2048;
      uint64_t v74 = v57;
      __int16 v75 = 2080;
      v76 = &unk_222DFB9BF;
      __int16 v77 = 2080;
      v78 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v79 = 1024;
      int v80 = 1221;
      _os_log_impl(&dword_222D7E000, v58, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace) {
    v56 = __osLogTrace;
  }
  else {
    v56 = v3;
  }
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v56, OS_LOG_TYPE_DEBUG, "updateLoggingState -> void\n", buf, 2u);
  }
}

void __48__BiometricKitXPCServerPearl_updateLoggingState__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 392);
  if (a2)
  {
    v4 = v7;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v5 = __48__BiometricKitXPCServerPearl_updateLoggingState__block_invoke_2;
  }
  else
  {
    v4 = v6;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    uint64_t v5 = __48__BiometricKitXPCServerPearl_updateLoggingState__block_invoke_3;
  }
  v4[2] = v5;
  v4[3] = &unk_26466F610;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

void __48__BiometricKitXPCServerPearl_updateLoggingState__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 376) startDeviceOrientationUpdatesToQueue:0 withHandler:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 400) = 1;
  uint64_t v2 = [*(id *)(a1 + 32) bioOpsQueue];
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) runningBioOp];
  int v4 = [v3 type];

  objc_sync_exit(v2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4 == 2)
  {
    char v6 = *(void **)(v5 + 384);
    [v6 startDeviceMotionUpdates];
  }
  else
  {
    int v7 = *(void **)(v5 + 416);
    *(void *)(v5 + 416) = 0;

    int v8 = (void *)(*(void *)(a1 + 32) + 424);
    v8[1] = 0;
    v8[2] = 0;
    void *v8 = 0;
    unsigned __int16 v9 = (void *)(*(void *)(a1 + 32) + 448);
    v9[1] = 0;
    v9[2] = 0;
    void *v9 = 0;
    uint64_t v10 = (void *)(*(void *)(a1 + 32) + 472);
    v10[1] = 0;
    v10[2] = 0;
    void *v10 = 0;
  }
}

uint64_t __48__BiometricKitXPCServerPearl_updateLoggingState__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 376) deviceOrientationBlocking];
  *(void *)(*(void *)(a1 + 32) + 408) = [v2 orientation];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 384) deviceMotion];
  uint64_t v4 = [v3 attitude];
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = (void *)(v7 + 424);
  unsigned __int16 v9 = [*(id *)(v7 + 384) deviceMotion];
  [v9 rotationRate];
  void *v8 = v10;
  v8[1] = v11;
  v8[2] = v12;

  uint64_t v13 = *(void *)(a1 + 32);
  __int16 v14 = (void *)(v13 + 448);
  id v15 = [*(id *)(v13 + 384) deviceMotion];
  [v15 userAcceleration];
  *__int16 v14 = v16;
  v14[1] = v17;
  v14[2] = v18;

  uint64_t v19 = *(void *)(a1 + 32);
  __int16 v20 = (void *)(v19 + 472);
  int v21 = [*(id *)(v19 + 384) deviceMotion];
  [v21 gravity];
  void *v20 = v22;
  v20[1] = v23;
  v20[2] = v24;

  *(unsigned char *)(*(void *)(a1 + 32) + 400) = 0;
  [*(id *)(*(void *)(a1 + 32) + 376) stopDeviceOrientationUpdates];
  uint64_t v25 = *(void **)(*(void *)(a1 + 32) + 384);

  return [v25 stopDeviceMotionUpdates];
}

- (unsigned)serviceConnect
{
  return HIDWORD(self->_driverNotifyQueue);
}

- (void)handleSharedMemoryTransfer:(unsigned int)a3 withHeader:(id)a4 data:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  unsigned __int16 v9 = v8;
  if (a3 == 2)
  {
    pearlDeviceState = (void *)self->_pearlDeviceState;
    uint64_t v11 = [v8 firstObject];
    [pearlDeviceState logFrameDebug:v12 withBuffer:v11];
  }
  else if (a3 == 1)
  {
    [self->_pearlDeviceState logCameraFrame:v12 withBuffers:v8];
  }
}

- (void)logSequenceDebugWithContext:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    char v6 = __osLogTrace;
  }
  else {
    char v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "logSequenceDebugWithContext:\n", (uint8_t *)&v16, 2u);
  }
  if (logSequenceDebugWithContext__debugData)
  {
    if (!LOBYTE(self->_loggingDispatchQueue))
    {
      int v7 = MEMORY[0x223CA8540](HIDWORD(self->_driverNotifyQueue), 2, *MEMORY[0x263EF8960], logSequenceDebugWithContext__address);
      if (v7)
      {
        int v14 = v7;
        id v15 = (__osLog ? __osLog : v5);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136316162;
          uint64_t v17 = "IOConnectUnmapMemory(_connect, kApplePearlLoggingSequenceDebugMemory, mach_task_self_, (mach_vm_address_"
                "t)address) == 0 ";
          __int16 v18 = 2048;
          uint64_t v19 = v14;
          __int16 v20 = 2080;
          int v21 = &unk_222DFB9BF;
          __int16 v22 = 2080;
          uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v24 = 1024;
          int v25 = 1273;
          _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
        }
      }
    }
  }
  if (LOBYTE(self->_loggingDispatchQueue) && a3->var1)
  {
    if (logSequenceDebugWithContext__debugData)
    {
LABEL_14:
      [self->_pearlDeviceState logSequenceDebug:withContext:];
      goto LABEL_15;
    }
    int v8 = MEMORY[0x223CA8530](HIDWORD(self->_driverNotifyQueue), 2, *MEMORY[0x263EF8960], &logSequenceDebugWithContext__address, &logSequenceDebugWithContext__size, 4097);
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:logSequenceDebugWithContext__address length:logSequenceDebugWithContext__size freeWhenDone:0];
      uint64_t v10 = (void *)logSequenceDebugWithContext__debugData;
      logSequenceDebugWithContext__debugData = v9;

      goto LABEL_14;
    }
    int v12 = v8;
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      uint64_t v17 = "err == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      int v21 = &unk_222DFB9BF;
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v24 = 1024;
      int v25 = 1283;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
  }
LABEL_15:
  if (__osLogTrace) {
    uint64_t v11 = __osLogTrace;
  }
  else {
    uint64_t v11 = v5;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEBUG, "logSequenceDebugWithContext: -> void\n", (uint8_t *)&v16, 2u);
  }
}

- (unint64_t)deviceOrientation
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  motionManager = self->_motionManager;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__BiometricKitXPCServerPearl_deviceOrientation__block_invoke;
  v5[3] = &unk_26466F6D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(&motionManager->super, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__BiometricKitXPCServerPearl_deviceOrientation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 400))
  {
    id v3 = [*(id *)(v2 + 376) deviceOrientationBlocking];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 orientation];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(v2 + 408);
  }
}

- (id)deviceAttitude
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  motionManager = self->_motionManager;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__BiometricKitXPCServerPearl_deviceAttitude__block_invoke;
  v5[3] = &unk_26466F6D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(&motionManager->super, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __44__BiometricKitXPCServerPearl_deviceAttitude__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 384) isDeviceMotionActive];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(v3 + 384) deviceMotion];
    uint64_t v4 = [(id)objc_claimAutoreleasedReturnValue() attitude];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v7 + 40) = *(id *)(v3 + 416);
  }

  return MEMORY[0x270F9A758]();
}

- ($1AB5FA073B851C12C2339EC22442E995)deviceRotationRate
{
  uint64_t v10 = 0;
  id v11 = (double *)&v10;
  uint64_t v12 = 0x3810000000;
  uint64_t v13 = "";
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  motionManager = self->_motionManager;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BiometricKitXPCServerPearl_deviceRotationRate__block_invoke;
  block[3] = &unk_26466F6D0;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(&motionManager->super, block);
  double v3 = v11[4];
  double v4 = v11[5];
  double v5 = v11[6];
  _Block_object_dispose(&v10, 8);
  double v6 = v3;
  double v7 = v4;
  double v8 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

__n128 __48__BiometricKitXPCServerPearl_deviceRotationRate__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 384) isDeviceMotionActive])
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 384) deviceMotion];
    [v10 rotationRate];
    int v2 = *(void **)(*(void *)(a1 + 40) + 8);
    v2[4] = v3;
    v2[5] = v4;
    v2[6] = v5;
  }
  else
  {
    double v7 = *(__n128 **)(*(void *)(a1 + 40) + 8);
    double v8 = (__n128 *)(*(void *)(a1 + 32) + 424);
    unint64_t v9 = *(void *)(*(void *)(a1 + 32) + 440);
    __n128 result = *v8;
    v7[2] = *v8;
    v7[3].n128_u64[0] = v9;
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)deviceUserAcceleration
{
  uint64_t v10 = 0;
  id v11 = (double *)&v10;
  uint64_t v12 = 0x3810000000;
  uint64_t v13 = "";
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  motionManager = self->_motionManager;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BiometricKitXPCServerPearl_deviceUserAcceleration__block_invoke;
  block[3] = &unk_26466F6D0;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(&motionManager->super, block);
  double v3 = v11[4];
  double v4 = v11[5];
  double v5 = v11[6];
  _Block_object_dispose(&v10, 8);
  double v6 = v3;
  double v7 = v4;
  double v8 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

__n128 __52__BiometricKitXPCServerPearl_deviceUserAcceleration__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 384) isDeviceMotionActive])
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 384) deviceMotion];
    [v10 userAcceleration];
    int v2 = *(void **)(*(void *)(a1 + 40) + 8);
    v2[4] = v3;
    v2[5] = v4;
    v2[6] = v5;
  }
  else
  {
    double v7 = *(__n128 **)(*(void *)(a1 + 40) + 8);
    double v8 = (__n128 *)(*(void *)(a1 + 32) + 448);
    unint64_t v9 = *(void *)(*(void *)(a1 + 32) + 464);
    __n128 result = *v8;
    v7[2] = *v8;
    v7[3].n128_u64[0] = v9;
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)deviceGravity
{
  uint64_t v10 = 0;
  id v11 = (double *)&v10;
  uint64_t v12 = 0x3810000000;
  uint64_t v13 = "";
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  motionManager = self->_motionManager;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BiometricKitXPCServerPearl_deviceGravity__block_invoke;
  block[3] = &unk_26466F6D0;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(&motionManager->super, block);
  double v3 = v11[4];
  double v4 = v11[5];
  double v5 = v11[6];
  _Block_object_dispose(&v10, 8);
  double v6 = v3;
  double v7 = v4;
  double v8 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

__n128 __43__BiometricKitXPCServerPearl_deviceGravity__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 384) isDeviceMotionActive])
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 384) deviceMotion];
    [v10 gravity];
    int v2 = *(void **)(*(void *)(a1 + 40) + 8);
    v2[4] = v3;
    v2[5] = v4;
    v2[6] = v5;
  }
  else
  {
    double v7 = *(__n128 **)(*(void *)(a1 + 40) + 8);
    double v8 = (__n128 *)(*(void *)(a1 + 32) + 472);
    unint64_t v9 = *(void *)(*(void *)(a1 + 32) + 488);
    __n128 result = *v8;
    v7[2] = *v8;
    v7[3].n128_u64[0] = v9;
  }
  return result;
}

- (void)logKernelMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLog) {
    double v6 = __osLog;
  }
  else {
    double v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "logKernelMessage: %@\n", buf, 0xCu);
  }
  if ((unint64_t)[v4 length] < 0x23)
  {
    if (__osLog) {
      id v11 = __osLog;
    }
    else {
      id v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "logKernelMessage: NO DATA!\n", buf, 2u);
    }
  }
  else
  {
    double v7 = (unsigned int *)[v4 bytes];
    double v8 = v7;
    switch(*v7)
    {
      case 0u:
        pearlDeviceState = (void *)self->_pearlDeviceState;
        id v10 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)v7 + 35 length:*(unsigned int *)((char *)v7 + 31)];
        [pearlDeviceState logData:v10 withContext:v8 + 1];
        goto LABEL_20;
      case 2u:
        int64_t v12 = self->_pearlDeviceState;
        id v10 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)v7 + 35 length:*(unsigned int *)((char *)v7 + 31)];
        uint64_t v13 = v8 + 1;
        uint64_t v14 = (void *)v12;
        uint64_t v15 = v10;
        uint64_t v16 = 0;
        goto LABEL_19;
      case 3u:
        id v10 = [(BiometricKitXPCServer *)self identities];
        uint64_t v17 = [(BiometricKitXPCServerPearl *)self deviceAttitude];
        [(BiometricKitXPCServerPearl *)self deviceRotationRate];
        uint64_t v19 = v18;
        uint64_t v21 = v20;
        [(BiometricKitXPCServerPearl *)self deviceUserAcceleration];
        uint64_t v23 = v22;
        uint64_t v25 = v24;
        [(BiometricKitXPCServerPearl *)self deviceGravity];
        uint64_t v27 = v26;
        uint64_t v29 = v28;
        *(void *)buf = [(BiometricKitXPCServerPearl *)self deviceOrientation];
        [v17 roll];
        *(void *)&buf[8] = v30;
        [v17 yaw];
        *(void *)&buf[24] = v31;
        [v17 pitch];
        *(void *)&uint8_t buf[16] = v32;
        *(void *)&uint8_t buf[32] = v19;
        *(void *)&buf[40] = v21;
        *(void *)&buf[48] = v21;
        *(void *)&buf[56] = v23;
        *(void *)&buf[64] = v25;
        uint64_t v42 = v25;
        uint64_t v43 = v27;
        uint64_t v44 = v29;
        uint64_t v45 = v29;
        __int16 v33 = (void *)self->_pearlDeviceState;
        unsigned int v34 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)v8 + 35 length:*(unsigned int *)((char *)v8 + 31)];
        int v35 = v8 + 1;
        [v33 logSequenceInfo:v34 withContext:v35 orientation:buf identities:v10];

        [(BiometricKitXPCServerPearl *)self logSequenceDebugWithContext:v35];
        goto LABEL_20;
      case 8u:
        memset(&buf[24], 0, 47);
        *(_OWORD *)&buf[8] = 0u;
        *(void *)buf = *(void *)(v7 + 1);
        *(_WORD *)&buf[8] = *((_WORD *)v7 + 14);
        *(_WORD *)&buf[10] = *((_WORD *)v7 + 6);
        unsigned char buf[14] = *((unsigned char *)v7 + 30);
        buf[15] = *((unsigned char *)v7 + 14);
        uint64_t v36 = *(void *)(v7 + 5);
        *(_DWORD *)&buf[23] = *(unsigned int *)((char *)v7 + 27);
        *(void *)&uint8_t buf[16] = v36;
        v37 = (void *)self->_pearlDeviceState;
        uint64_t v38 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)v7 + 35 length:*(unsigned int *)((char *)v7 + 31)];
        [v37 logCameraFrame:buf sensorRawData:0 metaData:v38];

        break;
      case 0xAu:
        int64_t v39 = self->_pearlDeviceState;
        id v10 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)v7 + 35 length:*(unsigned int *)((char *)v7 + 31)];
        uint64_t v13 = v8 + 1;
        uint64_t v14 = (void *)v39;
        uint64_t v15 = v10;
        uint64_t v16 = 1;
LABEL_19:
        [v14 logTemplateList:v15 withContext:v13 isPO:v16];
LABEL_20:

        break;
      default:
        NSLog(&cfstr_BiologWarningU.isa, *v7, *(unsigned int *)((char *)v7 + 31));
        break;
    }
  }
  if (__osLog) {
    unsigned __int16 v40 = __osLog;
  }
  else {
    unsigned __int16 v40 = v5;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v40, OS_LOG_TYPE_DEBUG, "logKernelMessage: -> void\n", buf, 2u);
  }
}

- (void)analyticsKernelMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLog) {
    double v6 = __osLog;
  }
  else {
    double v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 67109120;
    *(_DWORD *)uint64_t v17 = v4 != 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "analyticsKernelMessage: %d\n", (uint8_t *)&v16, 8u);
  }
  unint64_t v7 = [(BiometricKitXPCServerPearl *)self deviceOrientation];
  if ((unint64_t)[v4 length] <= 0x22)
  {
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      *(void *)uint64_t v17 = "[messageData length] >= sizeof(logging_message_t)";
      *(_WORD *)&v17[8] = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 1482;
      _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
  }
  else
  {
    double v8 = (_DWORD *)[v4 bytes];
    unint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:(char *)v8 + 35 length:*(unsigned int *)((char *)v8 + 31) freeWhenDone:0];
    switch(*v8)
    {
      case 0x3E9:
        id v10 = [(BiometricKitXPCServer *)self identities];
        [*(id *)&self->_logSequenceDebug sendMatchEventAnalytics:v9 orientation:v7 identities:v10];

        break;
      case 0x3EA:
        [*(id *)&self->_logSequenceDebug sendEnrollEventAnalytics:v9 orientation:v7];
        goto LABEL_18;
      case 0x3EB:
        [*(id *)&self->_logSequenceDebug sendFaceDetectEventAnalytics:v9 fromMatch:0 orientation:v7];
        goto LABEL_18;
      case 0x3EC:
        [*(id *)&self->_logSequenceDebug sendPasscodeChallengeEventAnalytics:v9 orientation:v7];
        goto LABEL_18;
      case 0x3ED:
        [*(id *)&self->_logSequenceDebug sendBioLockoutEventAnalytics:v9];
        goto LABEL_18;
      default:
        if (__osLog) {
          id v11 = __osLog;
        }
        else {
          id v11 = v5;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = *v8;
          int v13 = *(_DWORD *)((char *)v8 + 31);
          int v16 = 67109376;
          *(_DWORD *)uint64_t v17 = v12;
          *(_WORD *)&v17[4] = 1024;
          *(_DWORD *)&v17[6] = v13;
          _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "analyticsKernelMessage: Unknown kernel analytics message (%d) received! (Length: %u)\n", (uint8_t *)&v16, 0xEu);
        }
LABEL_18:

        break;
    }
  }
  if (__osLog) {
    uint64_t v14 = __osLog;
  }
  else {
    uint64_t v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_DEBUG, "analyticsKernelMessage: -> void\n", (uint8_t *)&v16, 2u);
  }
}

- (void)registerForLiftToWakeNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    double v6 = __osLogTrace;
  }
  else {
    double v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "registerForLiftToWakeNotifications: %d\n", (uint8_t *)v11, 8u);
  }
  if (v3 && [MEMORY[0x263F017D0] isWakeGestureAvailable])
  {
    unint64_t v7 = [MEMORY[0x263F017D0] sharedManager];
    analyticsDispatchQueue = self->_analyticsDispatchQueue;
    self->_analyticsDispatchQueue = v7;

    [(OS_dispatch_queue *)self->_analyticsDispatchQueue setDelegate:self];
    [(OS_dispatch_queue *)self->_analyticsDispatchQueue startWakeGestureUpdates];
  }
  else
  {
    [(OS_dispatch_queue *)self->_analyticsDispatchQueue stopWakeGestureUpdates];
    [(OS_dispatch_queue *)self->_analyticsDispatchQueue setDelegate:0];
    unint64_t v9 = self->_analyticsDispatchQueue;
    self->_analyticsDispatchQueue = 0;
  }
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = v5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "registerForLiftToWakeNotifications: -> void\n", (uint8_t *)v11, 2u);
  }
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 1)
  {
    unint64_t v7 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
    objc_sync_enter(v7);
    double v8 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
    unint64_t v9 = [v8 firstObject];
    int v10 = [v9 type];

    objc_sync_exit(v7);
    id v11 = MEMORY[0x263EF8438];
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 67109120;
      LODWORD(v17) = v10 == 2;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEBUG, "wakeGestureManager:didUpdateWakeGesture: CMWakeGestureStateDetected, matchRunning = %u\n", (uint8_t *)&v16, 8u);
    }
    if (v10 == 2)
    {
      if (__osLog) {
        int v13 = __osLog;
      }
      else {
        int v13 = v11;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_DEFAULT, "wakeGestureManager:didUpdateWakeGesture: CMWakeGestureStateDetected -> start new match attempt\n", (uint8_t *)&v16, 2u);
      }
      int v14 = [(BiometricKitXPCServerPearl *)self performCommand:33 inValue:0 inData:0 inSize:0 outData:0 outSize:0];
      if (v14)
      {
        if (__osLog) {
          uint64_t v15 = __osLog;
        }
        else {
          uint64_t v15 = v11;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136316162;
          uint64_t v17 = "err == 0 ";
          __int16 v18 = 2048;
          uint64_t v19 = v14;
          __int16 v20 = 2080;
          __int16 v21 = &unk_222DFB9BF;
          __int16 v22 = 2080;
          __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v24 = 1024;
          int v25 = 1560;
          _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
        }
      }
    }
  }
}

- (void)donateBiomeEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "donateBiomeEvent: %@\n", buf, 0xCu);
  }
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BiometricKitXPCServerPearl_donateBiomeEvent___block_invoke;
  block[3] = &unk_26466F610;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

void __47__BiometricKitXPCServerPearl_donateBiomeEvent___block_invoke(uint64_t a1)
{
  id v6 = (id)os_transaction_create();
  int v2 = (void *)MEMORY[0x223CA8CA0]();
  id v3 = [MEMORY[0x263F2A9B8] discoverabilitySignal];
  id v4 = [v3 source];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F2A780]) initWithIdentifier:*(void *)(a1 + 32) bundleID:@"com.apple.biometrickitd" context:0];
  [v4 sendEvent:v5];
}

- (void)statusMessage:(unsigned int)a3 withData:(id)a4 timestamp:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v80 = a4;
  if (__osLogTrace) {
    unint64_t v7 = __osLogTrace;
  }
  else {
    unint64_t v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v92 = v6;
    *(_WORD *)&v92[4] = 2112;
    *(void *)&v92[6] = v80;
    *(_WORD *)&v92[14] = 2048;
    *(void *)&v92[16] = a5;
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEBUG, "statusMessage:withData:timestamp: %d %@ %llu\n", buf, 0x1Cu);
  }
  v83 = [MEMORY[0x263EFF980] array];
  id v8 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v8);
  unint64_t v9 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  id v10 = [v9 firstObject];
  v82 = [v10 client];

  uint64_t v11 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  uint64_t v81 = [v11 firstObject];

  objc_sync_exit(v8);
  if ([v81 type] == 2) {
    BKLogCode();
  }
  int v12 = 0;
  if ((int)v6 > 1000)
  {
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    switch((int)v6)
    {
      case 1001:
      case 1002:
      case 1004:
      case 1005:
      case 1007:
      case 1008:
      case 1010:
      case 1017:
      case 1018:
      case 1019:
      case 1020:
      case 1066:
      case 1070:
        break;
      case 1003:
      case 1006:
      case 1009:
        [(id)objc_opt_class() reportPearlInterlock:0];
        break;
      case 1011:
      case 1012:
      case 1013:
      case 1014:
      case 1015:
        int v12 = 0;
        int v13 = 0;
        int v15 = 0;
        int v16 = 0;
        int v14 = 1;
        goto LABEL_31;
      case 1056:
      case 1057:
      case 1061:
      case 1062:
      case 1064:
      case 1068:
      case 1073:
      case 1074:
      case 1077:
      case 1079:
      case 1081:
        goto LABEL_15;
      case 1059:
      case 1060:
      case 1063:
      case 1065:
      case 1069:
      case 1078:
      case 1080:
      case 1082:
        goto LABEL_30;
      default:
        goto LABEL_31;
    }
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v16 = 0;
    int v15 = 1;
    goto LABEL_31;
  }
  uint64_t v17 = (v6 - 65);
  if (v17 <= 0x22)
  {
    if (((1 << (v6 - 65)) & 0xD) != 0)
    {
LABEL_15:
      if (v82)
      {
        [v82 delegateRegistered];
        [v82 statusMessage:v6];
        [v83 addObject:v82];
      }
      uint64_t v18 = v6 != 66;
      [(BiometricKitXPCServer *)self saveCatacomb];
      if (v6 == 1064)
      {
        [(id)objc_opt_class() reportPearlInterlock:1];
        int v12 = 0;
        uint64_t v6 = 1064;
        int v19 = 1;
        uint64_t v18 = 1;
LABEL_40:
        __int16 v20 = [(BiometricKitXPCServer *)self bioOpsQueue];
        objc_sync_enter(v20);
        __int16 v21 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
        objc_sync_enter(v21);
        if (v12)
        {
          __int16 v22 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
          __int16 v23 = [v22 firstObject];
          __int16 v24 = [v23 client];

          int v25 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
          uint64_t v26 = [v25 firstObject];
          int v27 = [v26 status];

          if (v24 && (v19 | [v24 delegateRegistered]) == 1 && v27 != 3)
          {
            [v24 statusMessage:v6];
            [v83 addObject:v24];
          }
        }
        else
        {
          __int16 v24 = v82;
        }
        [(BiometricKitXPCServer *)self switchToNextBioOperation:v18];
        objc_sync_exit(v21);

        objc_sync_exit(v20);
        v82 = v24;
        goto LABEL_47;
      }
      int v12 = 0;
LABEL_20:
      int v19 = 1;
      goto LABEL_40;
    }
    if (((1 << (v6 - 65)) & 0x400008000) != 0)
    {
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v12 = 1;
      goto LABEL_31;
    }
    if (v17 == 1)
    {
      if (v82) {
        [v82 delegateRegistered];
      }
      [(BiometricKitXPCServer *)self saveCatacomb];
      uint64_t v18 = 0;
      uint64_t v6 = 66;
      int v12 = 1;
      goto LABEL_20;
    }
  }
  if ((v6 - 63) >= 2)
  {
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    if (v6 == 51)
    {
LABEL_30:
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 1;
    }
  }
  else
  {
    int v12 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v13 = 1;
  }
LABEL_31:
  if (v6 == 58 || v6 == 80 || v16)
  {
    if (v82 && ((v12 | [v82 delegateRegistered] ^ 1) & 1) == 0)
    {
      [v82 statusMessage:v6];
      [v83 addObject:v82];
    }
    [(BiometricKitXPCServer *)self saveCatacombIfDirtyWithInterval:900.0 andDelay:1.0];
    uint64_t v18 = (v6 == 58) | v16;
    if (v6 == 1065)
    {
      [(id)objc_opt_class() reportPearlInterlock:1];
      int v19 = 0;
      uint64_t v6 = 1065;
    }
    else
    {
      int v19 = 0;
    }
    goto LABEL_40;
  }
  if (v6 == 99)
  {
    if ([v81 type] == 3)
    {
      uint64_t v6 = [v81 cancelledMessage];
      int v19 = 0;
      uint64_t v18 = 0;
    }
    else
    {
      int v19 = 0;
      uint64_t v18 = 0;
      uint64_t v6 = 99;
    }
    goto LABEL_40;
  }
  if ((v14 | v15) == 1)
  {
    int v79 = v14;
    uint64_t v32 = [(BiometricKitXPCServer *)self allClients];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v87 objects:v105 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v88 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          v37 = [v36 clientInfo];
          uint64_t v38 = [v37 objectForKeyedSubscript:@"BKClientType"];
          if ([v38 integerValue] == 2)
          {
            int v39 = [v36 delegateRegistered];

            if (v39)
            {
              [v36 statusMessage:v6];
              [v83 addObject:v36];
            }
          }
          else
          {
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v87 objects:v105 count:16];
      }
      while (v33);
    }
    if (v79) {
      *(void *)&self->_peakPowerPressureLevelNtfToken = v6;
    }
    if (!_os_feature_enabled_impl() || !*(void *)&self->_localToken.val[7]) {
      goto LABEL_157;
    }
    if (_os_feature_enabled_impl())
    {
      if (v6 == 1001)
      {
        if (__osLog) {
          unsigned __int16 v40 = __osLog;
        }
        else {
          unsigned __int16 v40 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222D7E000, v40, OS_LOG_TYPE_INFO, "FaceIDLight: Turning on camera indicator for auth and attention awareness\n", buf, 2u);
        }
        __int16 v41 = *(void **)&self->_localToken.val[7];
        v86[0] = MEMORY[0x263EF8330];
        v86[1] = 3221225472;
        v86[2] = __63__BiometricKitXPCServerPearl_statusMessage_withData_timestamp___block_invoke;
        v86[3] = &unk_26466F6F8;
        v86[4] = self;
        [v41 updateVolatileDataWithBlock:v86];
        if (__osLog) {
          uint64_t v42 = __osLog;
        }
        else {
          uint64_t v42 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
          goto LABEL_157;
        }
        *(_WORD *)buf = 0;
        uint64_t v43 = "FaceIDLight: Camera indicator ON\n";
      }
      else
      {
        if ((v6 - 1003) > 1) {
          goto LABEL_157;
        }
        if (__osLog) {
          v56 = __osLog;
        }
        else {
          v56 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222D7E000, v56, OS_LOG_TYPE_INFO, "FaceIDLight: Turning off camera indicator for auth and attention awareness\n", buf, 2u);
        }
        [*(id *)&self->_localToken.val[7] updateVolatileDataWithBlock:&__block_literal_global_334];
        uint64_t v42 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
          goto LABEL_157;
        }
        *(_WORD *)buf = 0;
        uint64_t v43 = "FaceIDLight: Camera indicator OFF\n";
      }
    }
    else if (v6 == 1005)
    {
      if (__osLog) {
        uint64_t v52 = __osLog;
      }
      else {
        uint64_t v52 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222D7E000, v52, OS_LOG_TYPE_INFO, "FaceIDLight: Turning on camera indicator for auth\n", buf, 2u);
      }
      id v53 = *(void **)&self->_localToken.val[7];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __63__BiometricKitXPCServerPearl_statusMessage_withData_timestamp___block_invoke_336;
      v85[3] = &unk_26466F6F8;
      v85[4] = self;
      [v53 updateVolatileDataWithBlock:v85];
      if (__osLog) {
        uint64_t v42 = __osLog;
      }
      else {
        uint64_t v42 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
        goto LABEL_157;
      }
      *(_WORD *)buf = 0;
      uint64_t v43 = "FaceIDLight: Camera indicator ON\n";
    }
    else
    {
      if ((v6 & 0xFFFFFFFE) != 0x3EE) {
        goto LABEL_157;
      }
      if (__osLog) {
        int v57 = __osLog;
      }
      else {
        int v57 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222D7E000, v57, OS_LOG_TYPE_INFO, "FaceIDLight: Turning off camera indicator for auth\n", buf, 2u);
      }
      [*(id *)&self->_localToken.val[7] updateVolatileDataWithBlock:&__block_literal_global_339];
      uint64_t v42 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
        goto LABEL_157;
      }
      *(_WORD *)buf = 0;
      uint64_t v43 = "FaceIDLight: Camera indicator OFF\n";
    }
    _os_log_impl(&dword_222D7E000, v42, OS_LOG_TYPE_INFO, v43, buf, 2u);
LABEL_157:

    goto LABEL_47;
  }
  if (v13)
  {
    if (v6 == 63)
    {
      uint64_t v44 = [v82 clientInfo];
      uint64_t v45 = [v44 objectForKeyedSubscript:@"BKClientBundleIdentifier"];
      int v46 = [v45 isEqualToString:@"com.apple.springboard"];

      if (v46)
      {
        analyticsDispatchQueue = self->_analyticsDispatchQueue;
        if (analyticsDispatchQueue)
        {
          [(OS_dispatch_queue *)analyticsDispatchQueue reenableDetectedStateRecognition];
          uint64_t v48 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222D7E000, v48, OS_LOG_TYPE_DEBUG, "wakeGestureManager reenableDetectedStateRecognition\n", buf, 2u);
          }
        }
      }
    }
    if ((unint64_t)[v80 length] >= 0x2A) {
      -[BiometricKitXPCServerPearl faceDetectMessage:info:fromSecureFD:](self, "faceDetectMessage:info:fromSecureFD:", v6, [v80 bytes], 0);
    }
  }
  else
  {
    switch((int)v6)
    {
      case 1067:
        if (LOBYTE(self->_sigTERMDispatchSource) && (unint64_t)[v80 length] >= 4)
        {
          uint64_t v49 = *(unsigned int *)[v80 bytes];
          if (v82
            && [v82 delegateRegistered]
            && ([v82 clientAppIsBackground] & 1) == 0)
          {
            v103 = @"BKStatusDetailFaceDetectFeedback";
            id v50 = [NSNumber numberWithUnsignedInt:v49];
            v104 = v50;
            id v51 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];

            [v82 statusMessage:1067 details:v51];
            [v83 addObject:v82];
          }
          if (v49 == 11) {
            [(BiometricKitXPCServerPearl *)self donateBiomeEvent:@"com.apple.faceid.face-covering.detected"];
          }
        }
        LODWORD(v6) = 1067;
        break;
      case 1068:
      case 1069:
      case 1070:
      case 1073:
      case 1074:
        goto LABEL_130;
      case 1071:
        if ([v80 length])
        {
          int v58 = *(unsigned __int8 *)[v80 bytes];
          if (v82
            && [v82 delegateRegistered]
            && ([v82 clientAppIsBackground] & 1) == 0)
          {
            v101 = @"BKStatusDetailFaceOcclusionState";
            uint64_t v59 = [NSNumber numberWithBool:v58 != 0];
            v102 = v59;
            id v60 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];

            [v82 statusMessage:1071 details:v60];
            [v83 addObject:v82];
          }
          if (v58) {
            [(BiometricKitXPCServerPearl *)self donateBiomeEvent:@"com.apple.faceid.any-face-covering.detected"];
          }
        }
        LODWORD(v6) = 1071;
        break;
      case 1072:
        if ([v80 length])
        {
          uint64_t v61 = (unsigned __int8 *)[v80 bytes];
          if (v82)
          {
            int v62 = *v61;
            if ([v82 delegateRegistered]
              && ([v82 clientAppIsBackground] & 1) == 0)
            {
              v99 = @"BKStatusDetailFaceWUPoseEligible";
              int v63 = [NSNumber numberWithBool:v62 != 0];
              v100 = v63;
              int v64 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];

              [v82 statusMessage:1072 details:v64];
              [v83 addObject:v82];
            }
          }
          else
          {
            v82 = 0;
          }
        }
        LODWORD(v6) = 1072;
        break;
      case 1075:
        if ((unint64_t)[v80 length] >= 4)
        {
          int v65 = (unsigned int *)[v80 bytes];
          if (v82)
          {
            uint64_t v66 = *v65;
            if ([v82 delegateRegistered]
              && ([v82 clientAppIsBackground] & 1) == 0)
            {
              v97 = @"BKStatusDetailPSRequestReason";
              unsigned int v67 = [NSNumber numberWithUnsignedInt:v66];
              v98 = v67;
              int v68 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];

              [v82 statusMessage:1075 details:v68];
              [v83 addObject:v82];
            }
          }
          else
          {
            v82 = 0;
          }
        }
        LODWORD(v6) = 1075;
        break;
      case 1076:
        if ((unint64_t)[v80 length] >= 0x40) {
          -[BiometricKitXPCServerPearl motionDetectMessage:info:state:](self, "motionDetectMessage:info:state:", 1076, [v80 bytes], 0);
        }
        LODWORD(v6) = 1076;
        break;
      default:
        if (v6 == 1016)
        {
          if ((unint64_t)[v80 length] <= 1)
          {
            uint64_t v74 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)v92 = "[statusData length] >= sizeof(initSprlOptionsMask)";
              *(_WORD *)&v92[8] = 2048;
              *(void *)&v92[10] = 0;
              *(_WORD *)&v92[18] = 2080;
              *(void *)&v92[20] = &unk_222DFB9BF;
              __int16 v93 = 2080;
              v94 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
              __int16 v95 = 1024;
              int v96 = 1921;
              _os_log_impl(&dword_222D7E000, v74, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
          }
          if ((unint64_t)[v80 length] < 2)
          {
            LOBYTE(v54) = 0;
          }
          else
          {
            int v54 = *(unsigned __int16 *)[v80 bytes];
            if (__osLog) {
              int v55 = __osLog;
            }
            else {
              int v55 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v92 = v54;
              _os_log_impl(&dword_222D7E000, v55, OS_LOG_TYPE_DEFAULT, "Received kStatusDeviceEventNeedsSprlInitialization with mask: 0x%04x\n", buf, 8u);
            }
          }
          if (BYTE1(self->_log)) {
            goto LABEL_182;
          }
          if (__osLog) {
            __int16 v75 = __osLog;
          }
          else {
            __int16 v75 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)v92 = "_inDiagnosticMode";
            *(_WORD *)&v92[8] = 2048;
            *(void *)&v92[10] = 0;
            *(_WORD *)&v92[18] = 2080;
            *(void *)&v92[20] = &unk_222DFB9BF;
            __int16 v93 = 2080;
            v94 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v95 = 1024;
            int v96 = 1929;
            _os_log_impl(&dword_222D7E000, v75, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          if (BYTE1(self->_log))
          {
LABEL_182:
            if ((v54 & 8) != 0)
            {
              int v72 = [(BiometricKitXPCServerPearl *)self initializeEngineWithOptions:0];
              if (v72)
              {
                __int16 v77 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  *(void *)v92 = "[self initializeEngineWithOptions:kInitEngineOptionNone] == 0 ";
                  *(_WORD *)&v92[8] = 2048;
                  *(void *)&v92[10] = v72;
                  *(_WORD *)&v92[18] = 2080;
                  *(void *)&v92[20] = &unk_222DFB9BF;
                  __int16 v93 = 2080;
                  v94 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v95 = 1024;
                  int v96 = 1933;
                  _os_log_impl(&dword_222D7E000, v77, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
              }
              [(BiometricKitXPCServerPearl *)self initializeSprl];
            }
            else
            {
              if (v54)
              {
                int v69 = [(BiometricKitXPCServerPearl *)self loadSavageFWCertificate];
                if (v69)
                {
                  v78 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    *(void *)v92 = "[self loadSavageFWCertificate] == 0 ";
                    *(_WORD *)&v92[8] = 2048;
                    *(void *)&v92[10] = v69;
                    *(_WORD *)&v92[18] = 2080;
                    *(void *)&v92[20] = &unk_222DFB9BF;
                    __int16 v93 = 2080;
                    v94 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                    __int16 v95 = 1024;
                    int v96 = 1938;
                    _os_log_impl(&dword_222D7E000, v78, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                  }
                }
              }
              if ((v54 & 2) != 0)
              {
                int v70 = [(BiometricKitXPCServerPearl *)self loadFDRClass:16 alternative:0];
                if (v70)
                {
                  __int16 v71 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    *(void *)v92 = "[self loadFDRClass:kPearlFDRClassPSPC alternative:__objc_no] == 0 ";
                    *(_WORD *)&v92[8] = 2048;
                    *(void *)&v92[10] = v70;
                    *(_WORD *)&v92[18] = 2080;
                    *(void *)&v92[20] = &unk_222DFB9BF;
                    __int16 v93 = 2080;
                    v94 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                    __int16 v95 = 1024;
                    int v96 = 1941;
                    _os_log_impl(&dword_222D7E000, v71, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                  }
                }
              }
            }
          }
          int v73 = [(BiometricKitXPCServerPearl *)self performCommand:50 inValue:0 inData:0 inSize:0 outData:0 outSize:0];
          if (v73)
          {
            v76 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)v92 = "err == 0 ";
              *(_WORD *)&v92[8] = 2048;
              *(void *)&v92[10] = v73;
              *(_WORD *)&v92[18] = 2080;
              *(void *)&v92[20] = &unk_222DFB9BF;
              __int16 v93 = 2080;
              v94 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
              __int16 v95 = 1024;
              int v96 = 1947;
              _os_log_impl(&dword_222D7E000, v76, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
          }
          LODWORD(v6) = 1016;
        }
        else
        {
LABEL_130:
          if (v82)
          {
            if ([v82 delegateRegistered]
              && ([v82 clientAppIsBackground] & 1) == 0)
            {
              [v82 statusMessage:v6];
              [v83 addObject:v82];
            }
          }
          else
          {
            v82 = 0;
          }
        }
        break;
    }
  }
LABEL_47:
  if (__osLog) {
    uint64_t v28 = __osLog;
  }
  else {
    uint64_t v28 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = v28;
    uint64_t v30 = [v83 componentsJoinedByString:@","];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v92 = v6;
    *(_WORD *)&v92[4] = 2112;
    *(void *)&v92[6] = v30;
    _os_log_impl(&dword_222D7E000, v29, OS_LOG_TYPE_DEFAULT, "sending status message %u to %@\n", buf, 0x12u);
  }
  if (__osLogTrace) {
    uint64_t v31 = __osLogTrace;
  }
  else {
    uint64_t v31 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v92 = v82;
    _os_log_impl(&dword_222D7E000, v31, OS_LOG_TYPE_DEBUG, "statusMessage:withData:timestamp: -> void (_ %@)\n", buf, 0xCu);
  }
}

void __63__BiometricKitXPCServerPearl_statusMessage_withData_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id STActivityAttributionClass = getSTActivityAttributionClass();
  long long v5 = *(_OWORD *)(*(void *)(a1 + 32) + 540);
  v7[0] = *(_OWORD *)(*(void *)(a1 + 32) + 524);
  v7[1] = v5;
  uint64_t v6 = [STActivityAttributionClass attributionWithAuditToken:v7];
  [v3 addCameraCaptureAttribution:v6];
}

void __63__BiometricKitXPCServerPearl_statusMessage_withData_timestamp___block_invoke_332(uint64_t a1, void *a2)
{
  int v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = a2;
  id v4 = [v2 set];
  [v3 setCameraCaptureAttributions:v4];
}

void __63__BiometricKitXPCServerPearl_statusMessage_withData_timestamp___block_invoke_336(uint64_t a1, void *a2)
{
  id v3 = a2;
  id STActivityAttributionClass = getSTActivityAttributionClass();
  long long v5 = *(_OWORD *)(*(void *)(a1 + 32) + 540);
  v7[0] = *(_OWORD *)(*(void *)(a1 + 32) + 524);
  v7[1] = v5;
  uint64_t v6 = [STActivityAttributionClass attributionWithAuditToken:v7];
  [v3 addCameraCaptureAttribution:v6];
}

void __63__BiometricKitXPCServerPearl_statusMessage_withData_timestamp___block_invoke_337(uint64_t a1, void *a2)
{
  int v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = a2;
  id v4 = [v2 set];
  [v3 setCameraCaptureAttributions:v4];
}

- (void)enrollResult:(id)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)a3;
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 134218498;
    __int16 v22 = v6;
    __int16 v23 = 2112;
    __int16 v24 = v6;
    __int16 v25 = 2048;
    uint64_t v26 = (void *)a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "enrollResult:withTimestamp: %p(%@) %llu\n", (uint8_t *)&v21, 0x20u);
  }
  if ((unint64_t)[v6 length] <= 0x19)
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = v7;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    int v21 = 136316162;
    __int16 v22 = "[msgData length] >= sizeof(message_enroll_node_v1_t)";
    __int16 v23 = 2048;
    __int16 v24 = 0;
    __int16 v25 = 2080;
    uint64_t v26 = &unk_222DFB9BF;
    __int16 v27 = 2080;
    uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v29 = 1024;
    int v30 = 2013;
    goto LABEL_43;
  }
  unint64_t v9 = (unsigned int *)[v6 bytes];
  if (*((unsigned char *)v9 + 24))
  {
    id v10 = [(BiometricKitXPCServer *)self getIdentityObject:v9];
    if (!v10)
    {
      if (__osLog) {
        uint64_t v11 = __osLog;
      }
      else {
        uint64_t v11 = v7;
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      int v21 = 136316162;
      __int16 v22 = "identity";
      __int16 v23 = 2048;
      __int16 v24 = 0;
      __int16 v25 = 2080;
      uint64_t v26 = &unk_222DFB9BF;
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v29 = 1024;
      int v30 = 2018;
LABEL_43:
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
LABEL_44:
      uint64_t v18 = 0;
      id v10 = 0;
      goto LABEL_32;
    }
  }
  else
  {
    id v10 = [MEMORY[0x263F2AAC0] biometricKitIdentity];
    int v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v9 + 1];
    [v10 setUuid:v12];

    [v10 setType:4];
    [v10 setUserID:*v9];
    [v10 setAttribute:0];
    [v10 setEntity:0];
    int v13 = [MEMORY[0x263EFF910] date];
    [v10 setCreationTime:v13];

    [(BiometricKitXPCServer *)self addIdentityObject:v10];
  }
  [v10 setFlags:v9[5]];
  if (*((unsigned char *)v9 + 24)) {
    [(BiometricKitXPCServerPearl *)self updatePropertiesOfIdentities];
  }
  if (*((unsigned char *)v9 + 25)) {
    int v14 = &unk_26D5C1368;
  }
  else {
    int v14 = 0;
  }
  [(BiometricKitXPCServer *)self saveCatacomb];
  if (v10)
  {
    [(BiometricKitXPCServer *)self setGracePeriod:0];
    if (!*((unsigned char *)v9 + 24)) {
      [(BiometricKitXPCServerPearl *)self donateBiomeEvent:@"com.apple.faceid.enrolled"];
    }
  }
  [(BiometricKitXPCServer *)self updateEnrollmentChangedNotification:1];
  int v15 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v15);
  int v16 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  uint64_t v17 = [v16 firstObject];
  uint64_t v18 = [v17 client];

  objc_sync_exit(v15);
  if (v18
    && [v18 delegateRegistered]
    && ([v18 clientAppIsBackground] & 1) == 0)
  {
    [v18 enrollResult:v10 details:v14];
    int v19 = (__osLog ? __osLog : v7);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      __int16 v22 = (const char *)v18;
      _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_DEFAULT, "sending enroll result to %@\n", (uint8_t *)&v21, 0xCu);
    }
  }
  [(BiometricKitXPCServer *)self switchToNextBioOperation:1];
LABEL_32:
  if (__osLogTrace) {
    __int16 v20 = __osLogTrace;
  }
  else {
    __int16 v20 = v7;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 138412290;
    __int16 v22 = (const char *)v18;
    _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_DEBUG, "enrollResult:withTimestamp: -> void (_ %@)\n", (uint8_t *)&v21, 0xCu);
  }
}

- (void)enrollUpdate:(id)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134218498;
    *(void *)__int16 v29 = v6;
    *(_WORD *)&v29[8] = 2112;
    *(void *)&v29[10] = v6;
    __int16 v30 = 2048;
    uint64_t v31 = (void *)a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "enrollUpdate:withTimestamp: %p(%@) %llu\n", (uint8_t *)&v28, 0x20u);
  }
  if (!v6)
  {
    if (__osLog) {
      uint64_t v26 = __osLog;
    }
    else {
      uint64_t v26 = v7;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    int v28 = 136316162;
    *(void *)__int16 v29 = "msgData";
    *(_WORD *)&v29[8] = 2048;
    *(void *)&v29[10] = 0;
    __int16 v30 = 2080;
    uint64_t v31 = &unk_222DFB9BF;
    __int16 v32 = 2080;
    uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v34 = 1024;
    int v35 = 2094;
    goto LABEL_53;
  }
  unint64_t v9 = [v6 length];
  if (v9 <= 0x4F)
  {
    if (__osLog) {
      uint64_t v26 = __osLog;
    }
    else {
      uint64_t v26 = v7;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    int v28 = 136316162;
    *(void *)__int16 v29 = "dataLength >= __builtin_offsetof(enrollment_info_t, poseBinStatus)";
    *(_WORD *)&v29[8] = 2048;
    *(void *)&v29[10] = 0;
    __int16 v30 = 2080;
    uint64_t v31 = &unk_222DFB9BF;
    __int16 v32 = 2080;
    uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v34 = 1024;
    int v35 = 2097;
    goto LABEL_53;
  }
  uint64_t v10 = [v6 bytes];
  uint64_t v11 = v10;
  if (!v10)
  {
    if (__osLog) {
      uint64_t v26 = __osLog;
    }
    else {
      uint64_t v26 = v7;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    int v28 = 136316162;
    *(void *)__int16 v29 = "enrollInfo";
    *(_WORD *)&v29[8] = 2048;
    *(void *)&v29[10] = 0;
    __int16 v30 = 2080;
    uint64_t v31 = &unk_222DFB9BF;
    __int16 v32 = 2080;
    uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v34 = 1024;
    int v35 = 2100;
    goto LABEL_53;
  }
  unint64_t v12 = *(unsigned __int16 *)(v10 + 78) * (unint64_t)*(unsigned __int16 *)(v10 + 76);
  if (v9 < v12 + 80)
  {
    if (__osLog) {
      uint64_t v26 = __osLog;
    }
    else {
      uint64_t v26 = v7;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    int v28 = 136316162;
    *(void *)__int16 v29 = "dataLength >= __builtin_offsetof(enrollment_info_t, poseBinStatus) + enrollInfo->pitchBinsCount * e"
                     "nrollInfo->yawBinsCount";
    *(_WORD *)&v29[8] = 2048;
    *(void *)&v29[10] = 0;
    __int16 v30 = 2080;
    uint64_t v31 = &unk_222DFB9BF;
    __int16 v32 = 2080;
    uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v34 = 1024;
    int v35 = 2101;
    goto LABEL_53;
  }
  unint64_t v13 = v12 + 50;
  int v14 = (char *)malloc_type_malloc(v12 + 50, 0x29AEA777uLL);
  int v15 = (unsigned __int16 *)v14;
  if (!v14)
  {
    if (__osLog) {
      uint64_t v26 = __osLog;
    }
    else {
      uint64_t v26 = v7;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    int v28 = 136316162;
    *(void *)__int16 v29 = "pearlInfo";
    *(_WORD *)&v29[8] = 2048;
    *(void *)&v29[10] = 0;
    __int16 v30 = 2080;
    uint64_t v31 = &unk_222DFB9BF;
    __int16 v32 = 2080;
    uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v34 = 1024;
    int v35 = 2105;
LABEL_53:
    _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v28, 0x30u);
LABEL_54:
    __int16 v22 = 0;
    uint64_t v18 = 0;
    goto LABEL_22;
  }
  *(_WORD *)int v14 = *(_WORD *)v11;
  *((_WORD *)v14 + 1) = *(unsigned __int8 *)(v11 + 2);
  long long v16 = *(_OWORD *)(v11 + 4);
  long long v17 = *(_OWORD *)(v11 + 20);
  *(_OWORD *)(v14 + 30) = *(_OWORD *)(v11 + 30);
  *(_OWORD *)(v14 + 20) = v17;
  *(_OWORD *)(v14 + 4) = v16;
  *((_WORD *)v14 + 23) = *(_WORD *)(v11 + 76);
  *((_WORD *)v14 + 24) = *(_WORD *)(v11 + 78);
  memcpy(v14 + 50, (const void *)(v11 + 80), *(unsigned __int16 *)(v11 + 78) * (unint64_t)*(unsigned __int16 *)(v11 + 76));
  uint64_t v18 = [MEMORY[0x263EFF8F8] dataWithBytes:v15 length:v13];
  if (v18)
  {
    int v19 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
    objc_sync_enter(v19);
    __int16 v20 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
    int v21 = [v20 firstObject];
    __int16 v22 = [v21 client];

    objc_sync_exit(v19);
    if (v22
      && [v22 delegateRegistered]
      && ([v22 clientAppIsBackground] & 1) == 0)
    {
      if (__osLog) {
        __int16 v23 = __osLog;
      }
      else {
        __int16 v23 = v7;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = v15[1];
        int v28 = 67109378;
        *(_DWORD *)__int16 v29 = v24;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v22;
        _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_DEFAULT, "sending enroll update (progress = %d) to %@\n", (uint8_t *)&v28, 0x12u);
      }
      [v22 enrollUpdate:v18];
    }
  }
  else
  {
    if (__osLog) {
      __int16 v27 = __osLog;
    }
    else {
      __int16 v27 = v7;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136316162;
      *(void *)__int16 v29 = "outputData";
      *(_WORD *)&v29[8] = 2048;
      *(void *)&v29[10] = 0;
      __int16 v30 = 2080;
      uint64_t v31 = &unk_222DFB9BF;
      __int16 v32 = 2080;
      uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v34 = 1024;
      int v35 = 2115;
      _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v28, 0x30u);
    }
    __int16 v22 = 0;
  }
  free(v15);
LABEL_22:
  if (__osLogTrace) {
    __int16 v25 = __osLogTrace;
  }
  else {
    __int16 v25 = v7;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 138412290;
    *(void *)__int16 v29 = v22;
    _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_DEBUG, "enrollUpdate:withTimestamp: -> void (_ %@)\n", (uint8_t *)&v28, 0xCu);
  }
}

- (void)enrollFeedback:(id)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218498;
    *(void *)__int16 v20 = v6;
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v6;
    __int16 v21 = 2048;
    __int16 v22 = (void *)a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "enrollFeedback:withTimestamp: %p(%@) %llu\n", (uint8_t *)&v19, 0x20u);
  }
  if (!v6)
  {
    if (__osLog) {
      uint64_t v18 = __osLog;
    }
    else {
      uint64_t v18 = v7;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    int v19 = 136316162;
    *(void *)__int16 v20 = "msgData";
    *(_WORD *)&v20[8] = 2048;
    *(void *)&v20[10] = 0;
    __int16 v21 = 2080;
    __int16 v22 = &unk_222DFB9BF;
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v25 = 1024;
    int v26 = 2149;
    goto LABEL_45;
  }
  if ((unint64_t)[v6 length] <= 0x2B)
  {
    if (__osLog) {
      uint64_t v18 = __osLog;
    }
    else {
      uint64_t v18 = v7;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    int v19 = 136316162;
    *(void *)__int16 v20 = "dataLength >= sizeof(enroll_meta_feedback_t)";
    *(_WORD *)&v20[8] = 2048;
    *(void *)&v20[10] = 0;
    __int16 v21 = 2080;
    __int16 v22 = &unk_222DFB9BF;
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v25 = 1024;
    int v26 = 2152;
    goto LABEL_45;
  }
  uint64_t v9 = [v6 bytes];
  if (!v9)
  {
    if (__osLog) {
      uint64_t v18 = __osLog;
    }
    else {
      uint64_t v18 = v7;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    int v19 = 136316162;
    *(void *)__int16 v20 = "enrollFeedback";
    *(_WORD *)&v20[8] = 2048;
    *(void *)&v20[10] = 0;
    __int16 v21 = 2080;
    __int16 v22 = &unk_222DFB9BF;
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v25 = 1024;
    int v26 = 2155;
    goto LABEL_45;
  }
  uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v9 + 2 length:42];
  if (!v10)
  {
    if (__osLog) {
      uint64_t v18 = __osLog;
    }
    else {
      uint64_t v18 = v7;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    int v19 = 136316162;
    *(void *)__int16 v20 = "outputData";
    *(_WORD *)&v20[8] = 2048;
    *(void *)&v20[10] = 0;
    __int16 v21 = 2080;
    __int16 v22 = &unk_222DFB9BF;
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v25 = 1024;
    int v26 = 2158;
LABEL_45:
    _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
LABEL_46:
    uint64_t v10 = 0;
    int v14 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v11);
  unint64_t v12 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  unint64_t v13 = [v12 firstObject];
  int v14 = [v13 client];

  objc_sync_exit(v11);
  if (v14
    && [v14 delegateRegistered]
    && ([v14 clientAppIsBackground] & 1) == 0)
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *(unsigned __int16 *)(v9 + 3);
      int v19 = 67109378;
      *(_DWORD *)__int16 v20 = v16;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v14;
      _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_DEFAULT, "sending enroll feedback (feedback = %d) to %@\n", (uint8_t *)&v19, 0x12u);
    }
    [v14 enrollFeedback:v10];
  }
LABEL_19:
  if (__osLogTrace) {
    long long v17 = __osLogTrace;
  }
  else {
    long long v17 = v7;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412290;
    *(void *)__int16 v20 = v14;
    _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_DEBUG, "enrollFeedback:withTimestamp: -> void (_ %@)\n", (uint8_t *)&v19, 0xCu);
  }
}

- (void)matchResult:(id)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (__osLogTrace) {
    uint64_t v7 = __osLogTrace;
  }
  else {
    uint64_t v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)uint64_t v59 = v6;
    *(_WORD *)&v59[8] = 2112;
    *(void *)id v60 = v6;
    *(_WORD *)&v60[8] = 2048;
    uint64_t v61 = (void *)a4;
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEBUG, "matchResult:withTimestamp: %p(%@) %llu\n", buf, 0x20u);
  }
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v56 = 0;
  if (!v6)
  {
    if (__osLog) {
      uint64_t v48 = __osLog;
    }
    else {
      uint64_t v48 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_101;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v59 = "msgData";
    *(_WORD *)&v59[8] = 2048;
    *(void *)id v60 = 0;
    *(_WORD *)&v60[8] = 2080;
    uint64_t v61 = &unk_222DFB9BF;
    __int16 v62 = 2080;
    int v63 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v64 = 1024;
    int v65 = 2191;
    goto LABEL_100;
  }
  if ((unint64_t)[v6 length] <= 0x27)
  {
    if (__osLog) {
      uint64_t v48 = __osLog;
    }
    else {
      uint64_t v48 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_101;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v59 = "[msgData length] >= sizeof(message_match_node_v1_t)";
    *(_WORD *)&v59[8] = 2048;
    *(void *)id v60 = 0;
    *(_WORD *)&v60[8] = 2080;
    uint64_t v61 = &unk_222DFB9BF;
    __int16 v62 = 2080;
    int v63 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v64 = 1024;
    int v65 = 2192;
LABEL_100:
    _os_log_impl(&dword_222D7E000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_101:
    id v51 = 0;
    id v14 = 0;
LABEL_83:
    long long v17 = 0;
    goto LABEL_84;
  }
  uint64_t v9 = [v6 bytes];
  if (isInternalBuild()) {
    BKLogCode();
  }
  uint64_t v10 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v10);
  uint64_t v11 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  unint64_t v12 = [v11 firstObject];

  int v13 = [v12 type];
  if (v13 == 2)
  {
    id v14 = v12;
    id v51 = [v14 client];
  }
  else
  {
    if (__osLog) {
      uint64_t v49 = __osLog;
    }
    else {
      uint64_t v49 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v59 = "bioOp.type == kBioOpTypeMatch";
      *(_WORD *)&v59[8] = 2048;
      *(void *)id v60 = 0;
      *(_WORD *)&v60[8] = 2080;
      uint64_t v61 = &unk_222DFB9BF;
      __int16 v62 = 2080;
      int v63 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v64 = 1024;
      int v65 = 2204;
      _os_log_impl(&dword_222D7E000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v51 = 0;
    id v14 = 0;
  }

  objc_sync_exit(v10);
  if (v13 != 2) {
    goto LABEL_83;
  }
  if ((*(unsigned char *)(v9 + 23) & 0x10) != 0)
  {
    int v15 = [NSNumber numberWithBool:1];
    [v8 setObject:v15 forKeyedSubscript:@"BKMatchDetailPreArm"];
  }
  int v16 = (int *)(v9 + 3);
  if (*(_DWORD *)(v9 + 3) == -1) {
    goto LABEL_24;
  }
  long long v17 = [(BiometricKitXPCServer *)self getIdentityObject:v9 + 3];
  if ([v17 userID] != *v16)
  {
    if (__osLog) {
      id v50 = __osLog;
    }
    else {
      id v50 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v59 = "[identity userID] == matchResult->identity.userID";
      *(_WORD *)&v59[8] = 2048;
      *(void *)id v60 = 0;
      *(_WORD *)&v60[8] = 2080;
      uint64_t v61 = &unk_222DFB9BF;
      __int16 v62 = 2080;
      int v63 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v64 = 1024;
      int v65 = 2214;
      _os_log_impl(&dword_222D7E000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_84;
  }
  if (!v17)
  {
LABEL_24:
    __int16 v23 = [(BiometricKitXPCServer *)self identities];
    int v24 = [v23 firstObject];

    if (v24)
    {
      uint64_t v25 = [v24 userID];
      if (v25 != -1)
      {
        [(BiometricKitXPCServerPearl *)self getBioLockoutState:&v56 forUser:v25 withClient:0];
        if ((v56 & 0x40) != 0) {
          unint64_t v56 = v56 & 0xFFFFFFFFFFFFFFBBLL | 4;
        }
      }
    }
    int v26 = [NSNumber numberWithInteger:v56, v25];
    [v8 setObject:v26 forKeyedSubscript:@"BKMatchDetailLockoutState"];

    if (LOBYTE(self->_sigTERMDispatchSource) && *(_DWORD *)(v9 + 35))
    {
      uint64_t v27 = [NSNumber numberWithInteger:];
      [v8 setObject:v27 forKeyedSubscript:@"BKMatchDetailFaceDetectFeedback"];
    }
    int v22 = 0;
    long long v17 = 0;
  }
  else
  {
    -[BiometricKitXPCServerPearl getBioLockoutState:forUser:withClient:](self, "getBioLockoutState:forUser:withClient:", &v56, [v17 userID], 0);
    uint64_t v18 = [NSNumber numberWithInteger:v56];
    [v8 setObject:v18 forKeyedSubscript:@"BKMatchDetailLockoutState"];

    int v19 = *(_DWORD *)(v9 + 23);
    if ((v19 & 0x20) != 0)
    {
      __int16 v20 = [NSNumber numberWithBool:1];
      [v8 setObject:v20 forKeyedSubscript:@"BKMatchDetailUnlocked"];

      int v19 = *(_DWORD *)(v9 + 23);
    }
    if ((v19 & 0x40) != 0)
    {
      __int16 v21 = [NSNumber numberWithBool:1];
      [v8 setObject:v21 forKeyedSubscript:@"BKMatchDetailCredentialAdded"];

      int v19 = *(_DWORD *)(v9 + 23);
    }
    if ((v19 & 0x200) == 0)
    {
      int v22 = 1;
      goto LABEL_34;
    }
    int v24 = [NSNumber numberWithBool:1];
    [v8 setObject:v24 forKeyedSubscript:@"BKMatchDetailResultIgnored"];
    int v22 = 1;
  }

LABEL_34:
  int v28 = [NSNumber numberWithInteger:*(unsigned int *)(v9 + 27)];
  [v8 setObject:v28 forKeyedSubscript:@"BKMatchDetailPOMatchState"];

  int v29 = *(_DWORD *)(v9 + 23);
  if (__osLog) {
    __int16 v30 = __osLog;
  }
  else {
    __int16 v30 = MEMORY[0x263EF8438];
  }
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if ((v29 & 0x100) != 0)
  {
    if (v31)
    {
      int v38 = *v16;
      int v39 = v30;
      unsigned __int16 v40 = [v17 uuid];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v59 = v22;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v38;
      *(_WORD *)id v60 = 2112;
      *(void *)&v60[2] = v40;
      _os_log_impl(&dword_222D7E000, v39, OS_LOG_TYPE_DEFAULT, "Passcode Challenge match result: %d [%d:%@]\n", buf, 0x18u);
    }
  }
  else
  {
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222D7E000, v30, OS_LOG_TYPE_DEFAULT, "about to send match result\n", buf, 2u);
    }
    if (v51
      && [v51 delegateRegistered]
      && ([v51 clientAppIsBackground] & 1) == 0)
    {
      [v51 matchResult:v17 details:v8];
      __int16 v32 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v59 = v17;
        *(_WORD *)&v59[8] = 2112;
        *(void *)id v60 = v51;
        _os_log_impl(&dword_222D7E000, v32, OS_LOG_TYPE_DEFAULT, "sending match result %@ to %@\n", buf, 0x16u);
      }
    }
    if (v22) {
      BYTE1(self->_mediaStatusDomainPublisher) = 0;
    }
    if (!BYTE2(self->_mediaStatusDomainPublisher))
    {
      if (__osLog) {
        uint64_t v33 = __osLog;
      }
      else {
        uint64_t v33 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v34 = v33;
        int v35 = [v14 forUnlock];
        int v36 = *(unsigned __int8 *)(v9 + 31);
        int v37 = *(unsigned __int8 *)(v9 + 39);
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)uint64_t v59 = v35;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = v36;
        *(_WORD *)id v60 = 1024;
        *(_DWORD *)&v60[2] = v37;
        _os_log_impl(&dword_222D7E000, v34, OS_LOG_TYPE_DEFAULT, "Glasses banner check: unlock:%u periocular:%u glassesDetected:%u\n", buf, 0x14u);
      }
      if (!v17)
      {
        if ([v14 forUnlock] && *(unsigned char *)(v9 + 31) && *(unsigned char *)(v9 + 39))
        {
          if ([v14 userID] == -1) {
            [(BiometricKitXPCServer *)self identities];
          }
          else {
            -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", [v14 userID]);
          }
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v57 count:16];
          if (v42)
          {
            uint64_t v43 = *(void *)v53;
            while (2)
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v53 != v43) {
                  objc_enumerationMutation(v41);
                }
                if (([*(id *)(*((void *)&v52 + 1) + 8 * i) flags] & 0x380000) != 0)
                {
                  int v45 = 1;
                  goto LABEL_75;
                }
              }
              uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v57 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }
          int v45 = 0;
LABEL_75:

          if (__osLog) {
            int v46 = __osLog;
          }
          else {
            int v46 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)uint64_t v59 = v45;
            _os_log_impl(&dword_222D7E000, v46, OS_LOG_TYPE_DEFAULT, "Glasses banner check: hasGlassesTemplate:%u\n", buf, 8u);
          }
          if ((v45 & 1) == 0) {
            BYTE1(self->_mediaStatusDomainPublisher) = 1;
          }
        }
        goto LABEL_83;
      }
    }
  }
LABEL_84:
  if (__osLogTrace) {
    v47 = __osLogTrace;
  }
  else {
    v47 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v47, OS_LOG_TYPE_DEBUG, "matchResult:withTimestamp: -> void\n", buf, 2u);
  }
}

- (void)matchEventMessage:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    long long v5 = __osLogTrace;
  }
  else {
    long long v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      int var1 = a3->var1;
      unint64_t var0 = a3->var0;
    }
    else
    {
      int var1 = 0;
      unint64_t var0 = 0;
    }
    *(_DWORD *)buf = 134218496;
    int v26 = a3;
    __int16 v27 = 1024;
    *(_DWORD *)int v28 = var1;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = var0;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEFAULT, "matchEventMessage: %p (r=%u, ts=%llu)\n", buf, 0x1Cu);
  }
  if (a3)
  {
    id v8 = [(BiometricKitXPCServer *)self allClients];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v9) {
      goto LABEL_22;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v13 clientInfo];
        int v15 = [v14 objectForKeyedSubscript:@"BKClientType"];
        if ([v15 integerValue] == 2)
        {
          int v16 = [v13 delegateRegistered];

          if (!v16) {
            continue;
          }
          id v14 = [(BiometricKitXPCServer *)self createMatchEventDictionary:a3];
          [v13 statusMessage:500 details:v14];
        }
        else
        {
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v10)
      {
LABEL_22:

        id v4 = MEMORY[0x263EF8438];
        goto LABEL_23;
      }
    }
  }
  if (__osLog) {
    uint64_t v18 = __osLog;
  }
  else {
    uint64_t v18 = v4;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    int v26 = ($5CBE18E59C39978AA9FC4D24FBF63D73 *)"matchEvent";
    __int16 v27 = 2048;
    *(void *)int v28 = 0;
    *(_WORD *)&v28[8] = 2080;
    *(void *)&v28[10] = &unk_222DFB9BF;
    __int16 v29 = 2080;
    __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v31 = 1024;
    int v32 = 2343;
    _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_23:
  if (__osLogTrace) {
    long long v17 = __osLogTrace;
  }
  else {
    long long v17 = v4;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_DEBUG, "matchEventMessage: -> void\n", buf, 2u);
  }
}

- (id)detailsForFaceDetectInfo:(id *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (__osLog) {
    id v4 = __osLog;
  }
  else {
    id v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unsigned __int16 v40 = a3;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "faceInfo:%p\n", buf, 0xCu);
  }
  if (a3)
  {
    LODWORD(v5) = *(unsigned int *)((char *)&a3->var5 + 1);
    int v7 = *(_DWORD *)((char *)&a3->var6 + 1);
    int v8 = *(_DWORD *)((char *)&a3->var7 + 1);
    LOWORD(v6) = *(unsigned __int16 *)((char *)&a3->var2 + 1);
    float v9 = (float)v6;
    uint64_t v10 = *(unsigned int *)((char *)&a3->var4 + 1);
    uint64_t v11 = *(unsigned __int16 *)((char *)&a3->var3 + 1);
    uint64_t v12 = *(unsigned int *)((char *)&a3->var8 + 1);
    int v13 = *(unsigned int *)((char *)&a3->var9 + 1);
    int v14 = *(_DWORD *)((char *)&a3->var10 + 1);
    BOOL v15 = BYTE1(a3->var11) != 0;
    int v16 = *(_DWORD *)((char *)&a3->var11 + 2);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    BOOL v15 = 0;
    int v7 = 0;
    int v8 = 0;
    float v9 = 0.0;
    int v13 = 0;
    int v14 = 0;
    int v16 = 0;
    double v5 = 0.0;
  }
  v37[0] = @"BKStatusDetailFaceDetectPitch";
  int v36 = [NSNumber numberWithFloat:v5];
  v38[0] = v36;
  v37[1] = @"BKStatusDetailFaceDetectYaw";
  LODWORD(v17) = v7;
  int v35 = [NSNumber numberWithFloat:v17];
  v38[1] = v35;
  v37[2] = @"BKStatusDetailFaceDetectRoll";
  LODWORD(v18) = v8;
  int v19 = [NSNumber numberWithFloat:v18];
  v38[2] = v19;
  v37[3] = @"BKStatusDetailFaceDistance";
  *(float *)&double v20 = v9;
  long long v21 = [NSNumber numberWithFloat:v20];
  v38[3] = v21;
  v37[4] = @"BKStatusDetailEyeReliefStatus";
  long long v22 = [NSNumber numberWithUnsignedInteger:v11];
  v38[4] = v22;
  v37[5] = @"BKStatusDetailFaceDetectOrientation";
  long long v23 = [NSNumber numberWithUnsignedInteger:v10];
  v38[5] = v23;
  v37[6] = @"BKStatusDetailFrameNumber";
  int v24 = [NSNumber numberWithUnsignedInteger:v12];
  v38[6] = v24;
  v37[7] = @"BKStatusDetailAttentionScore";
  LODWORD(v25) = v13;
  int v26 = [NSNumber numberWithFloat:v25];
  v38[7] = v26;
  v37[8] = @"BKStatusDetailFaceDetectionScore";
  LODWORD(v27) = v14;
  int v28 = [NSNumber numberWithFloat:v27];
  v38[8] = v28;
  v37[9] = @"BKStatusDetailFaceOcclusionState";
  __int16 v29 = [NSNumber numberWithBool:v15];
  v38[9] = v29;
  v37[10] = @"BKStatusDetailFaceOcclusionScore";
  LODWORD(v30) = v16;
  __int16 v31 = [NSNumber numberWithFloat:v30];
  v38[10] = v31;
  int v32 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:11];

  if (__osLog) {
    uint64_t v33 = __osLog;
  }
  else {
    uint64_t v33 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int16 v40 = v32;
    _os_log_impl(&dword_222D7E000, v33, OS_LOG_TYPE_DEBUG, "details:%@\n", buf, 0xCu);
  }

  return v32;
}

- (void)faceDetectMessage:(unsigned int)a3 info:(id *)a4 fromSecureFD:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v59 = *MEMORY[0x263EF8340];
  int v7 = [MEMORY[0x263EFF980] array];
  uint64_t v41 = [MEMORY[0x263EFF980] array];
  unsigned __int16 v40 = [MEMORY[0x263EFF980] array];
  obuint64_t j = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(obj);
  id v38 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v38);
  int v8 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  uint64_t v9 = [v8 count];
  BOOL v10 = v9 != 0;

  if (v9)
  {
    uint64_t v11 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
    [v7 addObjectsFromArray:v11];
  }
  uint64_t v12 = [(BiometricKitXPCServer *)self bioOpsQueue];
  [v7 addObjectsFromArray:v12];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v42 = v7;
  uint64_t v13 = [v42 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v50;
    int v15 = !v5;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v42);
        }
        double v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ([v17 type] == 3) {
          int v18 = 1;
        }
        else {
          int v18 = v15;
        }
        if ([v17 type] == 3)
        {
          id v19 = v17;
          double v20 = v19;
          if (a4->var0 && ([v19 continuous] & 1) == 0) {
            v18 &= (a3 == 63) | ~[v20 checked];
          }
          int v21 = [v20 motionDetect];

          v18 &= ~v21;
        }
        if (v10 || (v18 & 1) == 0)
        {
          if ((v18 & 1) == 0) {
            continue;
          }
        }
        else
        {
          if ([v17 type] != 3) {
            goto LABEL_22;
          }
          long long v22 = [v17 client];
          int v23 = [v22 delegateRegistered];

          if (!v23) {
            goto LABEL_22;
          }
        }
        int v24 = [v17 client];
        double v25 = [(BiometricKitXPCServerPearl *)self detailsForFaceDetectInfo:a4];
        [v24 statusMessage:a3 details:v25];

        int v26 = [v17 client];
        [v41 addObject:v26];

LABEL_22:
        if (v18 && [v17 type] == 3)
        {
          id v27 = v17;
          [v27 setChecked:1];
          char v28 = [v27 continuous];
          if (a3 == 63) {
            char v29 = v28;
          }
          else {
            char v29 = 1;
          }
          if ((v29 & 1) == 0) {
            [v27 setFinished:1];
          }
          if (([v27 timeouted] & 1) != 0 || objc_msgSend(v27, "finished")) {
            [v40 insertObject:v27 atIndex:0];
          }
        }
        BOOL v10 = 0;
      }
      uint64_t v13 = [v42 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v13);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v30 = v40;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v30);
        }
        __int16 v34 = [*(id *)(*((void *)&v45 + 1) + 8 * j) client];
        [(BiometricKitXPCServerPearl *)self cancelWithClient:v34];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v31);
  }

  objc_sync_exit(v38);
  objc_sync_exit(obj);

  if (__osLog) {
    int v35 = __osLog;
  }
  else {
    int v35 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = v35;
    int v37 = [v41 componentsJoinedByString:@","];
    *(_DWORD *)buf = 67109378;
    unsigned int v54 = a3;
    __int16 v55 = 2112;
    unint64_t v56 = v37;
    _os_log_impl(&dword_222D7E000, v36, OS_LOG_TYPE_DEFAULT, "sending status message %u to %@\n", buf, 0x12u);
  }
}

- (void)motionDetectMessage:(unsigned int)a3 info:(id *)a4 state:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v69 = *MEMORY[0x263EF8340];
  uint64_t v41 = [MEMORY[0x263EFF980] array];
  uint64_t v44 = [MEMORY[0x263EFF980] array];
  int v8 = [MEMORY[0x263EFF980] array];
  if (!a4)
  {
    __int16 v55 = @"BKStatusDetailMotionDetectState";
    uint64_t v14 = [NSNumber numberWithUnsignedInt:v5];
    unint64_t v56 = v14;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];

    if (v12)
    {
      id v42 = 0;
      goto LABEL_13;
    }
    if (__osLog) {
      int v37 = __osLog;
    }
    else {
      int v37 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
LABEL_53:
      id v42 = 0;
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136316162;
    id v60 = "details";
    __int16 v61 = 2048;
    uint64_t v62 = 0;
    __int16 v63 = 2080;
    __int16 v64 = &unk_222DFB9BF;
    __int16 v65 = 2080;
    uint64_t v66 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v67 = 1024;
    int v68 = 2514;
LABEL_52:
    _os_log_impl(&dword_222D7E000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  id v42 = [MEMORY[0x263EFF980] arrayWithCapacity:16];
  if (!v42)
  {
    if (__osLog) {
      int v37 = __osLog;
    }
    else {
      int v37 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    id v60 = "motionMatrix";
    __int16 v61 = 2048;
    uint64_t v62 = 0;
    __int16 v63 = 2080;
    __int16 v64 = &unk_222DFB9BF;
    __int16 v65 = 2080;
    uint64_t v66 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v67 = 1024;
    int v68 = 2505;
    goto LABEL_52;
  }
  for (uint64_t i = 0; i != 16; ++i)
  {
    *(float *)&double v9 = a4->var0[i];
    uint64_t v11 = [NSNumber numberWithFloat:v9];
    [v42 addObject:v11];
  }
  int v57 = @"BKStatusDetailMotionDetectMatrix";
  int v58 = v42;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  if (!v12)
  {
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v60 = "details";
      __int16 v61 = 2048;
      uint64_t v62 = 0;
      __int16 v63 = 2080;
      __int16 v64 = &unk_222DFB9BF;
      __int16 v65 = 2080;
      uint64_t v66 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v67 = 1024;
      int v68 = 2510;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_36;
  }
LABEL_13:
  obuint64_t j = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(obj);
  id v38 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v38);
  int v15 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  BOOL v16 = [v15 count] == 0;

  if (!v16)
  {
    double v17 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
    [v41 addObjectsFromArray:v17];
  }
  int v18 = [(BiometricKitXPCServer *)self bioOpsQueue];
  [v41 addObjectsFromArray:v18];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v19 = v41;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v50 != v21) {
          objc_enumerationMutation(v19);
        }
        int v23 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        if ([v23 type] == 3)
        {
          id v24 = v23;
          if ([v24 motionDetect])
          {
            [v24 setChecked:1];
            [v24 setFinished:1];
            double v25 = [v24 client];
            int v26 = [v25 delegateRegistered];

            if (v26)
            {
              id v27 = [v24 client];
              [v27 statusMessage:a3 details:v12];

              char v28 = [v24 client];
              [v44 addObject:v28];
            }
            [v8 insertObject:v24 atIndex:0];
          }
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v20);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v29 = v8;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = [*(id *)(*((void *)&v45 + 1) + 8 * k) client];
        [(BiometricKitXPCServerPearl *)self cancelWithClient:v33];
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v30);
  }

  objc_sync_exit(v39);
  objc_sync_exit(obj);

LABEL_36:
  if (__osLog) {
    __int16 v34 = __osLog;
  }
  else {
    __int16 v34 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = v34;
    int v36 = [v44 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412290;
    id v60 = v36;
    _os_log_impl(&dword_222D7E000, v35, OS_LOG_TYPE_DEFAULT, "sending motion detect message to %@\n", buf, 0xCu);
  }
}

- (int)getCommProtocolVersion
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "getCommProtocolVersion\n", buf, 2u);
  }
  uint64_t v11 = 4;
  int v12 = 0;
  int v13 = 1;
  int v5 = [(BiometricKitXPCServerPearl *)self performCommand:1 inValue:0 inData:&v13 inSize:4 outData:&v12 outSize:&v11];
  if (v5)
  {
    int v7 = v5;
    if (__osLog) {
      double v9 = __osLog;
    }
    else {
      double v9 = v3;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v15 = "err == 0 ";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      id v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v22 = 1024;
      int v23 = 2638;
LABEL_25:
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v11 == 4)
    {
      LOWORD(self->_connect) = v12 != 0;
      if (__osLogTrace) {
        unsigned int v6 = __osLogTrace;
      }
      else {
        unsigned int v6 = v3;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v15) = 0;
        _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "getCommProtocolVersion -> %{errno}d\n", buf, 8u);
      }
      return 0;
    }
    int v7 = -536870212;
    if (__osLog) {
      double v9 = __osLog;
    }
    else {
      double v9 = v3;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v15 = "size == sizeof(outData)";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      id v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v22 = 1024;
      int v23 = 2639;
      goto LABEL_25;
    }
  }
  LOWORD(self->_connect) = 1;
  if (__osLogTrace) {
    BOOL v10 = __osLogTrace;
  }
  else {
    BOOL v10 = v3;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v7;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "getCommProtocolVersion -> %{errno}d\n", buf, 8u);
  }
  return v7;
}

- (int)getSPRLInfo:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unsigned int v6 = __osLogTrace;
  }
  else {
    unsigned int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v16 = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "getSPRLInfo: %p\n", buf, 0xCu);
  }
  $14D77461FF5D83CAEC4252578BA76F85 v14 = 0;
  uint64_t v13 = 4;
  if (!a3)
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = v5;
    }
    int v9 = -536870206;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v16 = ($14D77461FF5D83CAEC4252578BA76F85 *)"sprlInfo";
    __int16 v17 = 2048;
    uint64_t v18 = 0;
    __int16 v19 = 2080;
    __int16 v20 = &unk_222DFB9BF;
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v23 = 1024;
    int v24 = 2666;
LABEL_31:
    _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_32;
  }
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:37 inValue:0 inData:0 inSize:0 outData:&v14 outSize:&v13];
  if (v7)
  {
    int v9 = v7;
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = v5;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v16 = ($14D77461FF5D83CAEC4252578BA76F85 *)"err == 0 ";
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    __int16 v20 = &unk_222DFB9BF;
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v23 = 1024;
    int v24 = 2669;
    goto LABEL_31;
  }
  if (v13 == 4)
  {
    *a3 = v14;
    if (__osLogTrace) {
      int v8 = __osLogTrace;
    }
    else {
      int v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "getSPRLInfo: -> %{errno}d\n", buf, 8u);
    }
    return 0;
  }
  int v9 = -536870212;
  if (__osLog) {
    uint64_t v11 = __osLog;
  }
  else {
    uint64_t v11 = v5;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v16 = ($14D77461FF5D83CAEC4252578BA76F85 *)"size == sizeof(outData)";
    __int16 v17 = 2048;
    uint64_t v18 = 0;
    __int16 v19 = 2080;
    __int16 v20 = &unk_222DFB9BF;
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v23 = 1024;
    int v24 = 2670;
    goto LABEL_31;
  }
LABEL_32:
  if (__osLogTrace) {
    int v12 = __osLogTrace;
  }
  else {
    int v12 = v5;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v9;
    _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "getSPRLInfo: -> %{errno}d\n", buf, 8u);
  }
  return v9;
}

- (int)restoreAndSyncTemplates
{
  int v2 = self;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = [(BiometricKitXPCServer *)self catacombLock];
  [v3 lock];

  v47.receiver = v2;
  v47.super_class = (Class)BiometricKitXPCServerPearl;
  signed int v4 = [(BiometricKitXPCServer *)&v47 restoreAndSyncTemplates];
  int v5 = (void *)v4;
  if (!v4)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    unsigned int v6 = [(BiometricKitXPCServer *)v2 catacombStateCache];
    int v7 = [v6 cachedComponents];

    obuint64_t j = v7;
    uint64_t v40 = [v7 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (!v40) {
      goto LABEL_28;
    }
    uint64_t v8 = *(void *)v44;
    uint64_t v9 = *MEMORY[0x263F080A8];
    uint64_t v10 = *MEMORY[0x263F08098];
    uint64_t v37 = *MEMORY[0x263F08098];
    id v38 = v2;
    while (1)
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v13 = [(BiometricKitXPCServer *)v2 catacomb];
        $14D77461FF5D83CAEC4252578BA76F85 v14 = [v13 catacombDir];
        int v15 = [(BiometricKitXPCServer *)v2 catacombFileNameForComponent:v12];
        __int16 v16 = [v14 stringByAppendingPathComponent:v15];

        __int16 v17 = [MEMORY[0x263F08850] defaultManager];
        id v42 = 0;
        uint64_t v18 = [v17 attributesOfItemAtPath:v16 error:&v42];
        id v19 = v42;

        if (v18)
        {
          uint64_t v20 = v8;
          __int16 v21 = [v18 objectForKeyedSubscript:v9];
          char v22 = [v21 isEqual:v10];

          if (v22)
          {
            __int16 v23 = v18;
            uint64_t v8 = v20;
            goto LABEL_26;
          }
          uint64_t v25 = v9;
          uint64_t v48 = v9;
          uint64_t v49 = v10;
          __int16 v23 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];

          int v26 = [MEMORY[0x263F08850] defaultManager];
          id v41 = v19;
          char v27 = [v26 setAttributes:v23 ofItemAtPath:v16 error:&v41];
          id v28 = v41;

          if (__osLog) {
            id v29 = __osLog;
          }
          else {
            id v29 = MEMORY[0x263EF8438];
          }
          if (v27)
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v52 = v16;
              uint64_t v30 = v29;
              os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
              uint64_t v32 = "Successfully updated attributes of %@\n";
              uint32_t v33 = 12;
              goto LABEL_24;
            }
          }
          else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            long long v52 = v16;
            __int16 v53 = 2112;
            id v54 = v28;
            uint64_t v30 = v29;
            os_log_type_t v31 = OS_LOG_TYPE_ERROR;
            uint64_t v32 = "setAttributes:ofItemAtPath:%@ failed, err = %@\n";
            uint32_t v33 = 22;
LABEL_24:
            _os_log_impl(&dword_222D7E000, v30, v31, v32, buf, v33);
          }
          id v19 = v28;
          uint64_t v9 = v25;
          uint64_t v8 = v20;
          uint64_t v10 = v37;
          int v2 = v38;
          goto LABEL_26;
        }
        if (__osLog) {
          int v24 = __osLog;
        }
        else {
          int v24 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          long long v52 = v16;
          __int16 v53 = 2112;
          id v54 = v19;
          _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "attributesOfItemAtPath:%@ failed, err = %@\n", buf, 0x16u);
        }
        __int16 v23 = 0;
LABEL_26:
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (!v40)
      {
LABEL_28:

        LODWORD(v5) = 0;
        goto LABEL_29;
      }
    }
  }
  if (__osLog) {
    int v36 = __osLog;
  }
  else {
    int v36 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    long long v52 = "err == 0 ";
    __int16 v53 = 2048;
    id v54 = v5;
    __int16 v55 = 2080;
    unint64_t v56 = &unk_222DFB9BF;
    __int16 v57 = 2080;
    int v58 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v59 = 1024;
    int v60 = 2691;
    _os_log_impl(&dword_222D7E000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_29:
  __int16 v34 = [(BiometricKitXPCServer *)v2 catacombLock];
  [v34 unlock];

  return (int)v5;
}

- (int)loadCatacombForComponent:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)BiometricKitXPCServerPearl;
    unsigned int v5 = [(BiometricKitXPCServer *)&v13 loadCatacombForComponent:v4];
    if (v5)
    {
      int v7 = v5;
      if (__osLog) {
        uint64_t v10 = __osLog;
      }
      else {
        uint64_t v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v15 = "err == 0 ";
        __int16 v16 = 2048;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        id v19 = &unk_222DFB9BF;
        __int16 v20 = 2080;
        __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v22 = 1024;
        int v23 = 2758;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if ([v4 isUserComponent])
      {
        unsigned int v6 = dispatch_get_global_queue(0, 0);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        _DWORD v11[2] = __55__BiometricKitXPCServerPearl_loadCatacombForComponent___block_invoke;
        v11[3] = &unk_26466F680;
        v11[4] = self;
        id v12 = v4;
        dispatch_async(v6, v11);
      }
      int v7 = 0;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v9 = __osLog;
    }
    else {
      uint64_t v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v15 = "component";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      id v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v22 = 1024;
      int v23 = 2755;
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v7 = 258;
  }

  return v7;
}

void __55__BiometricKitXPCServerPearl_loadCatacombForComponent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) userID];
  id v8 = 0;
  id v9 = 0;
  int v4 = [v2 performGetProtectedConfigCommand:v3 outSetCfg:&v9 outEffectiveCfg:&v8];
  id v5 = v9;
  id v6 = v8;
  if (v4)
  {
    if (__osLog) {
      int v7 = __osLog;
    }
    else {
      int v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v11 = "err == 0 ";
      __int16 v12 = 2048;
      uint64_t v13 = v4;
      __int16 v14 = 2080;
      int v15 = &unk_222DFB9BF;
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v18 = 1024;
      int v19 = 2766;
      _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v5 && [v5 periocularMatchEnabled] == 1)
  {
    [*(id *)(a1 + 32) donateBiomeEvent:@"com.apple.faceid.matching-with-mask.enabled"];
  }
}

- (int)saveTemplateListAfterTemplateUpdate
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "saveTemplateListAfterTemplateUpdate\n", buf, 2u);
  }
  id v5 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v5);
  id v6 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  int v7 = [v6 firstObject];

  objc_sync_exit(v5);
  if (v7 && ([v7 type] == 2 || objc_msgSend(v7, "type") == 1))
  {
    if (__osLog) {
      id v8 = __osLog;
    }
    else {
      id v8 = v3;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      int v10 = [v7 type];
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v10;
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEFAULT, "saveTemplateListAfterTemplateUpdate : save skipped (activeOperation=%u)\n", buf, 8u);
    }
    int v11 = 257;
LABEL_15:
    if (__osLogTrace) {
      __int16 v12 = __osLogTrace;
    }
    else {
      __int16 v12 = v3;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v11;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "saveTemplateListAfterTemplateUpdate -> %d\n", buf, 8u);
    }
    goto LABEL_27;
  }
  v16.receiver = self;
  v16.super_class = (Class)BiometricKitXPCServerPearl;
  int v11 = [(BiometricKitXPCServer *)&v16 saveTemplateListAfterTemplateUpdate];
  if (v11)
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = v3;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = "err == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      __int16 v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 2798;
      _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_15;
  }
  if (__osLogTrace) {
    uint64_t v13 = __osLogTrace;
  }
  else {
    uint64_t v13 = v3;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = 0;
    _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_DEBUG, "saveTemplateListAfterTemplateUpdate -> %d\n", buf, 8u);
  }
  int v11 = 0;
LABEL_27:

  return v11;
}

- (int)updatePropertiesOfIdentities
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "updatePropertiesOfIdentities\n", buf, 2u);
  }
  v24.receiver = self;
  v24.super_class = (Class)BiometricKitXPCServerPearl;
  unsigned int v5 = [(BiometricKitXPCServer *)&v24 updatePropertiesOfIdentities];
  if (!v5)
  {
    unint64_t v6 = [(BiometricKitXPCServer *)self identitiesCount];
    if (v6)
    {
      int v7 = [MEMORY[0x263EFF990] dataWithLength:24 * v6];
      unint64_t v23 = [v7 length];
      id v8 = v7;
      int v9 = -[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 68, 0, 0, 0, [v8 mutableBytes], &v23);
      if (v9)
      {
        int v17 = v9;
        if (__osLog) {
          __int16 v22 = __osLog;
        }
        else {
          __int16 v22 = v3;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          int v26 = "err == 0 ";
          __int16 v27 = 2048;
          uint64_t v28 = v17;
          __int16 v29 = 2080;
          uint64_t v30 = &unk_222DFB9BF;
          __int16 v31 = 2080;
          uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v33 = 1024;
          int v34 = 2835;
          _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_29;
      }
      unint64_t v10 = v23;
      unint64_t v11 = v23 / 0x18;
      if (v23 % 0x18)
      {
        if (__osLog) {
          uint64_t v20 = __osLog;
        }
        else {
          uint64_t v20 = v3;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 136316162;
        int v26 = "size % sizeof(identity_flags_t) == 0";
        __int16 v27 = 2048;
        uint64_t v28 = 0;
        __int16 v29 = 2080;
        uint64_t v30 = &unk_222DFB9BF;
        __int16 v31 = 2080;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v33 = 1024;
        int v34 = 2836;
LABEL_27:
        _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_28:
        int v17 = 261;
LABEL_29:

        goto LABEL_16;
      }
      id v12 = v8;
      uint64_t v13 = [v12 mutableBytes];
      if (v10 >= 0x18)
      {
        uint64_t v14 = v13;
        while (1)
        {
          int v15 = [(BiometricKitXPCServer *)self getIdentityObject:v14];
          if (!v15) {
            break;
          }
          objc_super v16 = v15;
          [v15 setFlags:*(unsigned int *)(v14 + 20)];

          v14 += 24;
          if (!--v11) {
            goto LABEL_14;
          }
        }
        if (__osLog) {
          uint64_t v20 = __osLog;
        }
        else {
          uint64_t v20 = v3;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 136316162;
        int v26 = "identity";
        __int16 v27 = 2048;
        uint64_t v28 = 0;
        __int16 v29 = 2080;
        uint64_t v30 = &unk_222DFB9BF;
        __int16 v31 = 2080;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v33 = 1024;
        int v34 = 2843;
        goto LABEL_27;
      }
LABEL_14:
    }
    int v17 = 0;
    goto LABEL_16;
  }
  int v17 = v5;
  if (__osLog) {
    __int16 v21 = __osLog;
  }
  else {
    __int16 v21 = v3;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    int v26 = "err == 0 ";
    __int16 v27 = 2048;
    uint64_t v28 = v17;
    __int16 v29 = 2080;
    uint64_t v30 = &unk_222DFB9BF;
    __int16 v31 = 2080;
    uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v33 = 1024;
    int v34 = 2827;
    _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_16:
  if (__osLogTrace) {
    __int16 v18 = __osLogTrace;
  }
  else {
    __int16 v18 = v3;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_DEBUG, "updatePropertiesOfIdentities: -> void\n", buf, 2u);
  }
  return v17;
}

- (int)performGetIdentitiesListCommand:(unsigned int)a3 outBuffer:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v6 = (char *)a4;
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v21 = v6;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performGetIdentitiesListCommand: %p\n", buf, 0xCu);
  }
  unsigned int v19 = 0;
  uint64_t v18 = 0;
  if (v6)
  {
    unsigned int v19 = a3;
    uint64_t v18 = [v6 length];
    int v9 = v6;
    int v10 = -[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 20, 0, &v19, 4, [v9 bytes], &v18);
    if (v10)
    {
      int v12 = v10;
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = v7;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v21 = "err == 0 ";
        __int16 v22 = 2048;
        uint64_t v23 = v12;
        __int16 v24 = 2080;
        __int16 v25 = &unk_222DFB9BF;
        __int16 v26 = 2080;
        __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v28 = 1024;
        int v29 = 2875;
        _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v18, 2) < 0xCCCCCCCCCCCCCCDuLL)
      {
        [v9 setLength:];
        if (__osLogTrace) {
          unint64_t v11 = __osLogTrace;
        }
        else {
          unint64_t v11 = v7;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v21) = 0;
          _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEBUG, "performGetIdentitiesListCommand: -> %d\n", buf, 8u);
        }
        int v12 = 0;
        goto LABEL_15;
      }
      if (__osLog) {
        objc_super v16 = __osLog;
      }
      else {
        objc_super v16 = v7;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v21 = "(size % sizeof(identity_v1_t)) == 0";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        __int16 v25 = &unk_222DFB9BF;
        __int16 v26 = 2080;
        __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v28 = 1024;
        int v29 = 2876;
        _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v12 = 261;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v21 = "outBuffer";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      __int16 v25 = &unk_222DFB9BF;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v28 = 1024;
      int v29 = 2870;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v12 = 258;
  }
  if (__osLogTrace) {
    int v17 = __osLogTrace;
  }
  else {
    int v17 = v7;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v12;
    _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "performGetIdentitiesListCommand: -> %d\n", buf, 8u);
  }
LABEL_15:

  return v12;
}

- (int)performGetCatacombStateCommand:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v4 = (char *)a3;
  unsigned int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v4;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performGetCatacombStateCommand: %p\n", buf, 0xCu);
  }
  uint64_t v16 = 0;
  if (v4)
  {
    uint64_t v16 = [v4 length];
    int v7 = v4;
    int v8 = -[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 14, 0, 0, 0, [v7 bytes], &v16);
    if (v8)
    {
      int v10 = v8;
      if (__osLog) {
        uint64_t v13 = __osLog;
      }
      else {
        uint64_t v13 = v5;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = "err == 0 ";
        __int16 v19 = 2048;
        uint64_t v20 = v10;
        __int16 v21 = 2080;
        __int16 v22 = &unk_222DFB9BF;
        __int16 v23 = 2080;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v25 = 1024;
        int v26 = 2903;
        _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if ((v16 & 7) == 0)
      {
        [v7 setLength:];
        if (__osLogTrace) {
          int v9 = __osLogTrace;
        }
        else {
          int v9 = v5;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v18) = 0;
          _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "performGetCatacombStateCommand: -> %d\n", buf, 8u);
        }
        int v10 = 0;
        goto LABEL_15;
      }
      if (__osLog) {
        uint64_t v14 = __osLog;
      }
      else {
        uint64_t v14 = v5;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = "(size % sizeof(catacomb_state_v1_t)) == 0";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = &unk_222DFB9BF;
        __int16 v23 = 2080;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v25 = 1024;
        int v26 = 2904;
        _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v10 = 261;
    }
  }
  else
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "outBuffer";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 2899;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v10 = 258;
  }
  if (__osLogTrace) {
    int v15 = __osLogTrace;
  }
  else {
    int v15 = v5;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v10;
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "performGetCatacombStateCommand: -> %d\n", buf, 8u);
  }
LABEL_15:

  return v10;
}

- (int)performGetTemplatesValidityCommand:(unsigned int)a3 isValid:(BOOL *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v8 = __osLogTrace;
  }
  else {
    int v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)__int16 v21 = a3;
    *(_WORD *)&v21[4] = 2048;
    *(void *)&v21[6] = a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performGetTemplatesValidityCommand: %d %p\n", buf, 0x12u);
  }
  char v18 = 0;
  uint64_t v17 = 1;
  unsigned int v19 = a3;
  int v9 = [(BiometricKitXPCServerPearl *)self performCommand:66 inValue:0 inData:&v19 inSize:4 outData:&v18 outSize:&v17];
  if (v9)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = v9;
      __int16 v22 = 2080;
      __int16 v23 = &unk_222DFB9BF;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v26 = 1024;
      int v27 = 2931;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      int v15 = __osLogTrace;
    }
    else {
      int v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v21 = v9;
      unint64_t v11 = v15;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (v17 == 1)
    {
      if (a4) {
        *a4 = v18 != 0;
      }
    }
    else
    {
      if (__osLog) {
        uint64_t v16 = __osLog;
      }
      else {
        uint64_t v16 = v7;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v21 = "size == sizeof(outData)";
        *(_WORD *)&v21[8] = 2048;
        *(void *)&v21[10] = 0;
        __int16 v22 = 2080;
        __int16 v23 = &unk_222DFB9BF;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v26 = 1024;
        int v27 = 2932;
        _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    if (__osLogTrace) {
      int v10 = __osLogTrace;
    }
    else {
      int v10 = v7;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v21 = 0;
      unint64_t v11 = v10;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_15:
      _os_log_impl(&dword_222D7E000, v11, v12, "performGetTemplatesValidityCommand: -> %d\n", buf, 8u);
    }
  }
  return v9;
}

- (int)performRemoveIdentityCommand:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134217984;
    uint64_t v16 = (const char *)a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performRemoveIdentityCommand: %p\n", (uint8_t *)&v15, 0xCu);
  }
  long long v25 = 0uLL;
  int v26 = 0;
  if (!a3)
  {
    if (__osLog) {
      os_log_type_t v12 = __osLog;
    }
    else {
      os_log_type_t v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "identity";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 2956;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int v10 = 258;
    goto LABEL_33;
  }
  long long v25 = *(_OWORD *)&a3->var0;
  int v26 = *(_DWORD *)&a3->var1[12];
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:21 inValue:0 inData:&v25 inSize:20 outData:0 outSize:0];
  if (v7)
  {
    int v10 = v7;
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 2960;
LABEL_32:
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
  }
  else
  {
    int v8 = [(BiometricKitXPCServerPearl *)self updatePropertiesOfIdentities];
    if (!v8)
    {
      if (__osLogTrace) {
        int v9 = __osLogTrace;
      }
      else {
        int v9 = v5;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 67109120;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "performRemoveIdentityCommand: -> %d\n", (uint8_t *)&v15, 8u);
      }
      return 0;
    }
    int v10 = v8;
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 2964;
      goto LABEL_32;
    }
  }
LABEL_33:
  if (__osLogTrace) {
    uint64_t v14 = __osLogTrace;
  }
  else {
    uint64_t v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = 67109120;
    LODWORD(v16) = v10;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "performRemoveIdentityCommand: -> %d\n", (uint8_t *)&v15, 8u);
  }
  return v10;
}

- (int)performGetBiometrickitdInfoCommand:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = (const char *)a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performGetBiometrickitdInfoCommand: %p\n", buf, 0xCu);
  }
  memset(v16, 0, sizeof(v16));
  uint64_t v15 = 23;
  if (a3)
  {
    int v7 = [(BiometricKitXPCServerPearl *)self performCommand:13 inValue:0 inData:0 inSize:0 outData:v16 outSize:&v15];
    if (v7)
    {
      int v9 = v7;
      if (__osLog) {
        os_log_type_t v12 = __osLog;
      }
      else {
        os_log_type_t v12 = v5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = "err == 0 ";
        __int16 v19 = 2048;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        __int16 v22 = &unk_222DFB9BF;
        __int16 v23 = 2080;
        int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v25 = 1024;
        int v26 = 2988;
        _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (v15 == 23)
      {
        *(_OWORD *)&a3->unint64_t var0 = *(_OWORD *)v16;
        *(void *)((char *)&a3->var2 + 7) = *(void *)&v16[15];
        if (__osLogTrace) {
          int v8 = __osLogTrace;
        }
        else {
          int v8 = v5;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v18) = 0;
          _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performGetBiometrickitdInfoCommand: -> %d\n", buf, 8u);
        }
        return 0;
      }
      if (__osLog) {
        uint64_t v13 = __osLog;
      }
      else {
        uint64_t v13 = v5;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = "size == sizeof(outData)";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = &unk_222DFB9BF;
        __int16 v23 = 2080;
        int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v25 = 1024;
        int v26 = 2989;
        _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v9 = 261;
    }
  }
  else
  {
    if (__osLog) {
      unint64_t v11 = __osLog;
    }
    else {
      unint64_t v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "info";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 2985;
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v9 = 258;
  }
  if (__osLogTrace) {
    uint64_t v14 = __osLogTrace;
  }
  else {
    uint64_t v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v9;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "performGetBiometrickitdInfoCommand: -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)performRemoveUserDataCommand:(unsigned int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unsigned int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performRemoveUserDataCommand: %d\n", buf, 8u);
  }
  unsigned int v14 = a3;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:22 inValue:0 inData:&v14 inSize:4 outData:0 outSize:0];
  if (v7)
  {
    if (__osLog) {
      os_log_type_t v12 = __osLog;
    }
    else {
      os_log_type_t v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3013;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      uint64_t v13 = __osLogTrace;
    }
    else {
      uint64_t v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v7;
      int v9 = v13;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      int v8 = __osLogTrace;
    }
    else {
      int v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      int v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_222D7E000, v9, v10, "performRemoveUserDataCommand: -> %d\n", buf, 8u);
    }
  }
  return v7;
}

- (int)performPrepareSaveCatacombCommand:(id)a3 outDataSize:(unsigned int *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v6 = (char *)a3;
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v8 = __osLogTrace;
  }
  else {
    int v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v6;
    __int16 v21 = 2048;
    __int16 v22 = a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performPrepareSaveCatacombCommand:outDataSize: %@, %p\n", buf, 0x16u);
  }
  uint64_t v17 = 4;
  uint64_t v18 = 0;
  if (v6)
  {
    HIDWORD(v18) = [v6 userID];
    int v9 = [(BiometricKitXPCServerPearl *)self performCommand:15 inValue:0 inData:(char *)&v18 + 4 inSize:4 outData:&v18 outSize:&v17];
    if (v9)
    {
      int v11 = v9;
      if (__osLog) {
        unsigned int v14 = __osLog;
      }
      else {
        unsigned int v14 = v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = "err == 0 ";
        __int16 v21 = 2048;
        __int16 v22 = (unsigned int *)v11;
        __int16 v23 = 2080;
        int v24 = &unk_222DFB9BF;
        __int16 v25 = 2080;
        int v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v27 = 1024;
        int v28 = 3039;
        _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (v17 == 4)
      {
        if (a4) {
          *a4 = v18;
        }
        if (__osLogTrace) {
          os_log_type_t v10 = __osLogTrace;
        }
        else {
          os_log_type_t v10 = v7;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v20) = 0;
          _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "performPrepareSaveCatacombCommand:outDataSize: -> %d\n", buf, 8u);
        }
        int v11 = 0;
        goto LABEL_17;
      }
      if (__osLog) {
        uint64_t v15 = __osLog;
      }
      else {
        uint64_t v15 = v7;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = "size == sizeof(outData)";
        __int16 v21 = 2048;
        __int16 v22 = 0;
        __int16 v23 = 2080;
        int v24 = &unk_222DFB9BF;
        __int16 v25 = 2080;
        int v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v27 = 1024;
        int v28 = 3040;
        _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v11 = 261;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v7;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = "component";
      __int16 v21 = 2048;
      __int16 v22 = 0;
      __int16 v23 = 2080;
      int v24 = &unk_222DFB9BF;
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v27 = 1024;
      int v28 = 3035;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v11 = 258;
  }
  if (__osLogTrace) {
    uint64_t v16 = __osLogTrace;
  }
  else {
    uint64_t v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = v11;
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "performPrepareSaveCatacombCommand:outDataSize: -> %d\n", buf, 8u);
  }
LABEL_17:

  return v11;
}

- (int)performCompleteSaveCatacombCommand:(id)a3 outBuffer:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v6 = (char *)a3;
  id v7 = a4;
  int v8 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v9 = __osLogTrace;
  }
  else {
    int v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v21 = v6;
    __int16 v22 = 2048;
    id v23 = v7;
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "performCompleteSaveCatacombCommand:outBuffer: %@, %p\n", buf, 0x16u);
  }
  int v19 = 0;
  uint64_t v18 = 0;
  if (!v6)
  {
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = v8;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v21 = "component";
    __int16 v22 = 2048;
    id v23 = 0;
    __int16 v24 = 2080;
    __int16 v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 3065;
    goto LABEL_26;
  }
  if (!v7)
  {
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = v8;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v21 = "outBuffer";
    __int16 v22 = 2048;
    id v23 = 0;
    __int16 v24 = 2080;
    __int16 v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 3066;
LABEL_26:
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_27:
    int v13 = 258;
    goto LABEL_28;
  }
  int v19 = [v6 userID:v18];
  uint64_t v18 = [v7 length];
  id v10 = v7;
  int v11 = -[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 16, 0, &v19, 4, [v10 bytes], &v18);
  if (!v11)
  {
    [v10 setLength:v18];
    if (__osLogTrace) {
      os_log_type_t v12 = __osLogTrace;
    }
    else {
      os_log_type_t v12 = v8;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 0;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEBUG, "performCompleteSaveCatacombCommand:outBuffer: -> %d\n", buf, 8u);
    }
    int v13 = 0;
    goto LABEL_15;
  }
  int v13 = v11;
  if (__osLog) {
    uint64_t v17 = __osLog;
  }
  else {
    uint64_t v17 = v8;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v21 = "err == 0 ";
    __int16 v22 = 2048;
    id v23 = (id)v13;
    __int16 v24 = 2080;
    __int16 v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 3071;
    _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_28:
  if (__osLogTrace) {
    uint64_t v16 = __osLogTrace;
  }
  else {
    uint64_t v16 = v8;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v13;
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "performCompleteSaveCatacombCommand:outBuffer: -> %d\n", buf, 8u);
  }
LABEL_15:

  return v13;
}

- (int)performConfirmSaveCatacombCommand:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v4 = (char *)a3;
  unsigned int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v4;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performConfirmSaveCatacombCommand: %@\n", buf, 0xCu);
  }
  int v14 = 0;
  if (v4)
  {
    int v14 = [v4 userID];
    int v7 = [(BiometricKitXPCServerPearl *)self performCommand:17 inValue:0 inData:&v14 inSize:4 outData:0 outSize:0];
    if (!v7)
    {
      if (__osLogTrace) {
        int v8 = __osLogTrace;
      }
      else {
        int v8 = v5;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performConfirmSaveCatacombCommand: -> %d\n", buf, 8u);
      }
      int v9 = 0;
      goto LABEL_14;
    }
    int v9 = v7;
    if (__osLog) {
      os_log_type_t v12 = __osLog;
    }
    else {
      os_log_type_t v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3098;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = "component";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3094;
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v9 = 258;
  }
  if (__osLogTrace) {
    int v13 = __osLogTrace;
  }
  else {
    int v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v9;
    _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "performConfirmSaveCatacombCommand: -> %d\n", buf, 8u);
  }
LABEL_14:

  return v9;
}

- (int)performNoCatacombCommand:(unsigned int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unsigned int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performNoCatacombCommand: %d\n", buf, 8u);
  }
  unsigned int v14 = a3;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:19 inValue:0 inData:&v14 inSize:4 outData:0 outSize:0];
  if (v7)
  {
    if (__osLog) {
      os_log_type_t v12 = __osLog;
    }
    else {
      os_log_type_t v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3120;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      int v13 = __osLogTrace;
    }
    else {
      int v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v7;
      int v9 = v13;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      int v8 = __osLogTrace;
    }
    else {
      int v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      int v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_222D7E000, v9, v10, "performNoCatacombCommand: -> %d\n", buf, 8u);
    }
  }
  return v7;
}

- (int)performLoadCatacombCommand:(id)a3 inData:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v6 = (char *)a3;
  id v7 = a4;
  int v8 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v9 = __osLogTrace;
  }
  else {
    int v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v10 = v9;
    int v22 = 138412802;
    __int16 v23 = v6;
    __int16 v24 = 2048;
    id v25 = v7;
    __int16 v26 = 2048;
    __int16 v27 = (void *)[v7 length];
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "performLoadCatacombCommand:inData: %@, %p[%lu]\n", (uint8_t *)&v22, 0x20u);
  }
  if (v6)
  {
    id v11 = v7;
    int v12 = [-[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 18, 0, [v11 bytes], [v11 length], 0, 0);
    int v13 = 0;
    if (v12)
    {
      int v20 = v12;
      if (__osLog) {
        __int16 v21 = __osLog;
      }
      else {
        __int16 v21 = v8;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136316162;
        __int16 v23 = "err == 0 ";
        __int16 v24 = 2048;
        id v25 = (id)v20;
        __int16 v26 = 2080;
        __int16 v27 = &unk_222DFB9BF;
        __int16 v28 = 2080;
        int v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v30 = 1024;
        int v31 = 3142;
        _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v22, 0x30u);
      }
      int v13 = v20;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v19 = __osLog;
    }
    else {
      __int16 v19 = v8;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136316162;
      __int16 v23 = "component";
      __int16 v24 = 2048;
      id v25 = 0;
      __int16 v26 = 2080;
      __int16 v27 = &unk_222DFB9BF;
      __int16 v28 = 2080;
      int v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v30 = 1024;
      int v31 = 3139;
      _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v22, 0x30u);
    }
    int v13 = 258;
  }
  if ((v13 - 28673) >= 3) {
    int v14 = v13;
  }
  else {
    int v14 = 269;
  }
  if (__osLogTrace) {
    uint64_t v15 = __osLogTrace;
  }
  else {
    uint64_t v15 = v8;
  }
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v22 = 67109120;
      LODWORD(v23) = v14;
      uint64_t v16 = v15;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_19:
      _os_log_impl(&dword_222D7E000, v16, v17, "performLoadCatacombCommand:inData: -> %d\n", (uint8_t *)&v22, 8u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 67109120;
    LODWORD(v23) = 0;
    uint64_t v16 = v15;
    os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
    goto LABEL_19;
  }

  return v14;
}

- (int)performRequestMaxIdentityCountCommand:(unsigned int *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unsigned int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    os_log_type_t v17 = (const char *)a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performRequestMaxIdentityCountCommand: %p\n", buf, 0xCu);
  }
  unsigned int v15 = 0;
  uint64_t v14 = 4;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:38 inValue:0 inData:0 inSize:0 outData:&v15 outSize:&v14];
  if (v7)
  {
    int v9 = v7;
    if (__osLog) {
      id v11 = __osLog;
    }
    else {
      id v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      os_log_type_t v17 = "err == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      __int16 v21 = &unk_222DFB9BF;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v24 = 1024;
      int v25 = 3169;
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v14 == 4)
    {
      if (a3) {
        *a3 = v15;
      }
      if (__osLogTrace) {
        int v8 = __osLogTrace;
      }
      else {
        int v8 = v5;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = 0;
        _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performRequestMaxIdentityCountCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      os_log_type_t v17 = "size == sizeof(outData)";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      __int16 v21 = &unk_222DFB9BF;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v24 = 1024;
      int v25 = 3170;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v9 = 261;
  }
  if (__osLogTrace) {
    int v13 = __osLogTrace;
  }
  else {
    int v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v9;
    _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "performRequestMaxIdentityCountCommand -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 outCount:(unsigned int *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v8 = __osLogTrace;
  }
  else {
    int v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)__int16 v21 = a3;
    *(_WORD *)&v21[4] = 2048;
    *(void *)&v21[6] = a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performRequestMaxIdentityCountCommand: %d, %p\n", buf, 0x12u);
  }
  unsigned int v18 = 0;
  unsigned int v19 = a3;
  uint64_t v17 = 4;
  int v9 = [(BiometricKitXPCServerPearl *)self performCommand:12 inValue:0 inData:&v19 inSize:4 outData:&v18 outSize:&v17];
  if (v9)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = v9;
      __int16 v22 = 2080;
      __int16 v23 = &unk_222DFB9BF;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v26 = 1024;
      int v27 = 3198;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      unsigned int v15 = __osLogTrace;
    }
    else {
      unsigned int v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v21 = v9;
      id v11 = v15;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (v17 == 4)
    {
      if (a4) {
        *a4 = v18;
      }
    }
    else
    {
      if (__osLog) {
        uint64_t v16 = __osLog;
      }
      else {
        uint64_t v16 = v7;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v21 = "size == sizeof(outData)";
        *(_WORD *)&v21[8] = 2048;
        *(void *)&v21[10] = 0;
        __int16 v22 = 2080;
        __int16 v23 = &unk_222DFB9BF;
        __int16 v24 = 2080;
        int v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v26 = 1024;
        int v27 = 3199;
        _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      unsigned int v18 = 0;
    }
    if (__osLogTrace) {
      os_log_type_t v10 = __osLogTrace;
    }
    else {
      os_log_type_t v10 = v7;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v21 = 0;
      id v11 = v10;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_15:
      _os_log_impl(&dword_222D7E000, v11, v12, "performRequestMaxIdentityCountCommand -> %d\n", buf, 8u);
    }
  }
  return v9;
}

- (int)performGetCatacombUUIDCommand:(unsigned int)a3 outUUID:(id *)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v8 = __osLogTrace;
  }
  else {
    int v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)unsigned int v18 = a3;
    *(_WORD *)&v18[4] = 2048;
    *(void *)&v18[6] = a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performGetCatacombUUIDCommand: %d, %p\n", buf, 0x12u);
  }
  v25[0] = 0;
  v25[1] = 0;
  uint64_t v15 = 16;
  unsigned int v16 = a3;
  int v9 = [(BiometricKitXPCServerPearl *)self performCommand:24 inValue:0 inData:&v16 inSize:4 outData:v25 outSize:&v15];
  if (v9)
  {
    int v11 = v9;
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v7;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)unsigned int v18 = "err == 0 ";
      *(_WORD *)&v18[8] = 2048;
      *(void *)&v18[10] = v11;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3227;
LABEL_27:
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v15 == 16)
    {
      if (a4) {
        *a4 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v25];
      }
      if (__osLogTrace) {
        os_log_type_t v10 = __osLogTrace;
      }
      else {
        os_log_type_t v10 = v7;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)unsigned int v18 = 0;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "performGetCatacombUUIDCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    int v11 = -536870212;
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v7;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)unsigned int v18 = "size == sizeof(outData)";
      *(_WORD *)&v18[8] = 2048;
      *(void *)&v18[10] = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3228;
      goto LABEL_27;
    }
  }
  if (__osLogTrace) {
    uint64_t v14 = __osLogTrace;
  }
  else {
    uint64_t v14 = v7;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)unsigned int v18 = v11;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "performGetCatacombUUIDCommand -> %d\n", buf, 8u);
  }
  return v11;
}

- (int)performGetCatacombHashCommand:(unsigned int)a3 outHash:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v8 = __osLogTrace;
  }
  else {
    int v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)__int16 v19 = a3;
    *(_WORD *)&v19[4] = 2048;
    *(void *)&v19[6] = a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performGetCatacombHashCommand: %d, %p\n", buf, 0x12u);
  }
  char v27 = 0;
  memset(v26, 0, sizeof(v26));
  uint64_t v16 = 33;
  unsigned int v17 = a3;
  int v9 = [(BiometricKitXPCServerPearl *)self performCommand:25 inValue:0 inData:&v17 inSize:4 outData:v26 outSize:&v16];
  if (v9)
  {
    int v12 = v9;
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(void *)&v19[10] = v12;
      __int16 v20 = 2080;
      __int16 v21 = &unk_222DFB9BF;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v24 = 1024;
      int v25 = 3256;
LABEL_30:
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v16 == 33)
    {
      if (a4)
      {
        if (LOBYTE(v26[0]))
        {
          id v10 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)v26 + 1 length:32];
        }
        else
        {
          id v10 = 0;
        }
        *a4 = v10;
      }
      if (__osLogTrace) {
        int v11 = __osLogTrace;
      }
      else {
        int v11 = v7;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v19 = 0;
        _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEBUG, "performGetCatacombHashCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    int v12 = -536870212;
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v19 = "size == sizeof(outData)";
      *(_WORD *)&v19[8] = 2048;
      *(void *)&v19[10] = 0;
      __int16 v20 = 2080;
      __int16 v21 = &unk_222DFB9BF;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v24 = 1024;
      int v25 = 3257;
      goto LABEL_30;
    }
  }
  if (__osLogTrace) {
    uint64_t v15 = __osLogTrace;
  }
  else {
    uint64_t v15 = v7;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v19 = v12;
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "performGetCatacombHashCommand -> %d\n", buf, 8u);
  }
  return v12;
}

- (int)performDropUnlockTokenCommand
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "performDropUnlockTokenCommand:\n", (uint8_t *)&v12, 2u);
  }
  int v5 = [(BiometricKitXPCServerPearl *)self performCommand:39 inValue:0 inData:0 inSize:0 outData:0 outSize:0];
  if (v5)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = v3;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      int v13 = "err == 0 ";
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      unsigned int v17 = &unk_222DFB9BF;
      __int16 v18 = 2080;
      __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v20 = 1024;
      int v21 = 3286;
      _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    if (__osLogTrace) {
      int v11 = __osLogTrace;
    }
    else {
      int v11 = v3;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 67109120;
      LODWORD(v13) = v5;
      int v7 = v11;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      unint64_t v6 = __osLogTrace;
    }
    else {
      unint64_t v6 = v3;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 67109120;
      LODWORD(v13) = 0;
      int v7 = v6;
      os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_222D7E000, v7, v8, "performDropUnlockTokenCommand -> %d\n", (uint8_t *)&v12, 8u);
    }
  }
  return v5;
}

- (int)performForceBioLockoutCommand:(unsigned int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performForceBioLockoutCommand: %d\n", buf, 8u);
  }
  unsigned int v14 = a3;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:40 inValue:0 inData:&v14 inSize:4 outData:0 outSize:0];
  if (v7)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3308;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      int v13 = __osLogTrace;
    }
    else {
      int v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v7;
      int v9 = v13;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      os_log_type_t v8 = __osLogTrace;
    }
    else {
      os_log_type_t v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      int v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_222D7E000, v9, v10, "performForceBioLockoutCommand -> %d\n", buf, 8u);
    }
  }
  return v7;
}

- (int)performGetSKSLockStateCommand:(unsigned int)a3 outState:(unsigned int *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    os_log_type_t v8 = __osLogTrace;
  }
  else {
    os_log_type_t v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = a3;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performGetSKSLockStateCommand: %d\n", buf, 8u);
  }
  unsigned int v17 = 0;
  unsigned int v18 = a3;
  uint64_t v16 = 4;
  int v9 = [(BiometricKitXPCServerPearl *)self performCommand:41 inValue:0 inData:&v18 inSize:4 outData:&v17 outSize:&v16];
  if (v9)
  {
    int v11 = v9;
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v7;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v20 = "err == 0 ";
      __int16 v21 = 2048;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      int v24 = &unk_222DFB9BF;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v27 = 1024;
      int v28 = 3332;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v16 == 4)
    {
      if (a4) {
        *a4 = v17;
      }
      if (__osLogTrace) {
        os_log_type_t v10 = __osLogTrace;
      }
      else {
        os_log_type_t v10 = v7;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = 0;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "performGetSKSLockStateCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog) {
      unsigned int v14 = __osLog;
    }
    else {
      unsigned int v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v20 = "size == sizeof(outData)";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      int v24 = &unk_222DFB9BF;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v27 = 1024;
      int v28 = 3333;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v11 = 261;
  }
  if (__osLogTrace) {
    uint64_t v15 = __osLogTrace;
  }
  else {
    uint64_t v15 = v7;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = v11;
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "performGetSKSLockStateCommand -> %d\n", buf, 8u);
  }
  return v11;
}

- (int)performGetLastMatchEventCommand:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = (const char *)a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performGetLastMatchEventCommand: %p\n", buf, 0xCu);
  }
  *(_OWORD *)__int16 v25 = 0uLL;
  *(void *)&v25[21] = 0;
  *(void *)&v25[16] = 0;
  uint64_t v14 = 29;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:65 inValue:0 inData:0 inSize:0 outData:v25 outSize:&v14];
  if (v7)
  {
    int v9 = v7;
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3359;
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v14 == 29)
    {
      if (a3)
      {
        *(_OWORD *)&a3->unint64_t var0 = *(_OWORD *)v25;
        *(_OWORD *)((char *)&a3->var2.var0 + 1) = *(_OWORD *)&v25[13];
      }
      if (__osLogTrace) {
        os_log_type_t v8 = __osLogTrace;
      }
      else {
        os_log_type_t v8 = v5;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performGetLastMatchEventCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = "size == sizeof(outData)";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3360;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v9 = 261;
  }
  if (__osLogTrace) {
    int v13 = __osLogTrace;
  }
  else {
    int v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v9;
    _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "performGetLastMatchEventCommand -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)performGetDeviceHardwareStateCommand:(unsigned int *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = (const char *)a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performGetDeviceHardwareStateCommand: %p\n", buf, 0xCu);
  }
  uint64_t v15 = 8;
  uint64_t v16 = 0;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:58 inValue:0 inData:0 inSize:0 outData:&v16 outSize:&v15];
  if (v7)
  {
    int v10 = v7;
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "err == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      uint64_t v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 3386;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v15 == 8)
    {
      if (a3)
      {
        if (v16) {
          unsigned int v8 = 1;
        }
        else {
          unsigned int v8 = 2;
        }
        *a3 = v8;
      }
      if (__osLogTrace) {
        int v9 = __osLogTrace;
      }
      else {
        int v9 = v5;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = 0;
        _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "performGetDeviceHardwareStateCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "size == sizeof(outData)";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      uint64_t v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 3387;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v10 = 261;
  }
  if (__osLogTrace) {
    uint64_t v14 = __osLogTrace;
  }
  else {
    uint64_t v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v10;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "performGetDeviceHardwareStateCommand -> %d\n", buf, 8u);
  }
  return v10;
}

- (int)performGetSystemProtectedConfigCommand:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v23 = (const char *)a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "performGetSystemProtectedConfigCommand: %p\n", buf, 0xCu);
  }
  unsigned int v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v18 = 36;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:28 inValue:0 inData:0 inSize:0 outData:&v19 outSize:&v18];
  if (v7)
  {
    int v12 = v7;
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v5;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v23 = "err == 0 ";
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      __int16 v26 = 2080;
      uint64_t v27 = &unk_222DFB9BF;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v30 = 1024;
      int v31 = 3470;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v18 != 36)
    {
      if (__osLog) {
        uint64_t v15 = __osLog;
      }
      else {
        uint64_t v15 = v5;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v23 = "size == sizeof(outData)";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2080;
        uint64_t v27 = &unk_222DFB9BF;
        __int16 v28 = 2080;
        uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v30 = 1024;
        int v31 = 3471;
        _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_11;
    }
    if (!a3)
    {
LABEL_11:
      if (__osLogTrace) {
        int v11 = __osLogTrace;
      }
      else {
        int v11 = v5;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = 0;
        _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEBUG, "performGetSystemProtectedConfigCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    id v8 = objc_alloc_init(MEMORY[0x263F2AAD8]);
    if (v8)
    {
      int v9 = v8;
      [v8 setBiometryEnabled:DWORD2(v19)];
      [v9 setUnlockEnabled:HIDWORD(v19)];
      [v9 setIdentificationEnabled:v20];
      [v9 setLoginEnabled:DWORD1(v20)];
      [v9 setUnlockTokenMaxLifetime:v19];
      [v9 setBioMatchLifespan:HIDWORD(v20)];
      [v9 setPasscodeInputLifespan:v21];
      [v9 setPeriocularMatchEnabled:DWORD2(v20)];
      id v10 = v9;
      *a3 = v10;

      goto LABEL_11;
    }
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v23 = "cfg";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      uint64_t v27 = &unk_222DFB9BF;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v30 = 1024;
      int v31 = 3475;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v12 = 261;
  }
  if (__osLogTrace) {
    __int16 v17 = __osLogTrace;
  }
  else {
    __int16 v17 = v5;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v12;
    _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "performGetSystemProtectedConfigCommand -> %d\n", buf, 8u);
  }
  return v12;
}

- (int)performSetProtectedConfigCommand:(unsigned int)a3 cfg:(id)a4 authData:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a4;
  int v9 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    LODWORD(v30) = a3;
    WORD2(v30) = 2048;
    *(void *)((char *)&v30 + 6) = v8;
    HIWORD(v30) = 2048;
    uint64_t v31 = (uint64_t)a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "performSetProtectedConfigCommand: %d %p %p\n", buf, 0x1Cu);
  }
  uint64_t v34 = 0;
  long long v33 = 0u;
  long long v32 = 0u;
  *(_DWORD *)buf = a3;
  *(void *)&long long v30 = -1;
  *((void *)&v30 + 1) = -1;
  uint64_t v31 = -1;
  if (v8)
  {
    LODWORD(v30) = [v8 unlockEnabled];
    DWORD1(v30) = [v8 identificationEnabled];
    DWORD2(v30) = [v8 loginEnabled];
    HIDWORD(v30) = [v8 applePayEnabled];
    LODWORD(v31) = [v8 attentionDetectionEnabled];
    HIDWORD(v31) = [v8 periocularMatchEnabled];
  }
  if (a5)
  {
    long long v11 = *(_OWORD *)&a5->var2[8];
    long long v32 = *(_OWORD *)&a5->var0;
    long long v33 = v11;
    uint64_t v34 = *(void *)&a5->var2[24];
  }
  int v12 = [(BiometricKitXPCServerPearl *)self performCommand:27 inValue:0 inData:buf inSize:68 outData:0 outSize:0];
  if (v12)
  {
    if (__osLog) {
      __int16 v17 = __osLog;
    }
    else {
      __int16 v17 = v9;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      long long v20 = "err == 0 ";
      __int16 v21 = 2048;
      uint64_t v22 = v12;
      __int16 v23 = 2080;
      __int16 v24 = &unk_222DFB9BF;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v27 = 1024;
      int v28 = 3528;
      _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    if (__osLogTrace) {
      uint64_t v18 = __osLogTrace;
    }
    else {
      uint64_t v18 = v9;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 67109120;
      LODWORD(v20) = v12;
      uint64_t v14 = v18;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_19;
    }
  }
  else
  {
    if (v8 && [v8 periocularMatchEnabled] == 1) {
      [(BiometricKitXPCServerPearl *)self donateBiomeEvent:@"com.apple.faceid.matching-with-mask.enabled"];
    }
    if (__osLogTrace) {
      int v13 = __osLogTrace;
    }
    else {
      int v13 = v9;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 67109120;
      LODWORD(v20) = 0;
      uint64_t v14 = v13;
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
LABEL_19:
      _os_log_impl(&dword_222D7E000, v14, v15, "performSetProtectedConfigCommand -> %d\n", (uint8_t *)&v19, 8u);
    }
  }

  return v12;
}

- (int)performSetSystemProtectedConfigCommand:(id)a3 authData:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&unsigned char buf[14] = a4;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "performSetSystemProtectedConfigCommand: %p %p\n", buf, 0x16u);
  }
  uint64_t v32 = 0;
  long long v31 = 0u;
  long long v30 = 0u;
  *(void *)&long long v9 = -1;
  *((void *)&v9 + 1) = -1;
  *(_OWORD *)buf = v9;
  *(_OWORD *)&uint8_t buf[16] = v9;
  int v29 = -1;
  if (v6)
  {
    *(_DWORD *)&buf[8] = [v6 biometryEnabled];
    *(_DWORD *)&buf[12] = [v6 unlockEnabled];
    *(_DWORD *)&uint8_t buf[16] = [v6 identificationEnabled];
    *(_DWORD *)&buf[20] = [v6 loginEnabled];
    *(_DWORD *)buf = [v6 unlockTokenMaxLifetime];
    *(_DWORD *)&buf[28] = [v6 bioMatchLifespan];
    int v29 = [v6 passcodeInputLifespan];
    *(_DWORD *)&buf[24] = [v6 periocularMatchEnabled];
  }
  if (a4)
  {
    long long v10 = *(_OWORD *)&a4->var2[8];
    long long v30 = *(_OWORD *)&a4->var0;
    long long v31 = v10;
    uint64_t v32 = *(void *)&a4->var2[24];
  }
  int v11 = [(BiometricKitXPCServerPearl *)self performCommand:29 inValue:0 inData:buf inSize:76 outData:0 outSize:0];
  if (v11)
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      int v19 = "err == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      __int16 v23 = &unk_222DFB9BF;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v26 = 1024;
      int v27 = 3572;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    if (__osLogTrace) {
      __int16 v17 = __osLogTrace;
    }
    else {
      __int16 v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v11;
      int v13 = v17;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (__osLogTrace) {
      int v12 = __osLogTrace;
    }
    else {
      int v12 = v7;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 67109120;
      LODWORD(v19) = 0;
      int v13 = v12;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
LABEL_16:
      _os_log_impl(&dword_222D7E000, v13, v14, "performSetSystemProtectedConfigCommand -> %d\n", (uint8_t *)&v18, 8u);
    }
  }

  return v11;
}

- (int)performRequestMessageDataCommand:(unint64_t)a3 size:(unint64_t)a4 outData:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v9 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    long long v10 = __osLogTrace;
  }
  else {
    long long v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    __int16 v25 = (const char *)a3;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2048;
    int v29 = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "performRequestMessageDataCommand:size:outData: 0x%llx %zu %p\n", buf, 0x20u);
  }
  int v11 = [MEMORY[0x263EFF990] dataWithLength:a4, a4, a3];
  int v12 = v11;
  if (v11)
  {
    id v13 = v11;
    int v14 = -[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 7, 0, &v23, 8, [v13 mutableBytes], &v22);
    if (v14)
    {
      int v16 = v14;
      if (__osLog) {
        int v19 = __osLog;
      }
      else {
        int v19 = v9;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v25 = "err == 0 ";
        __int16 v26 = 2048;
        unint64_t v27 = v16;
        __int16 v28 = 2080;
        int v29 = (id *)&unk_222DFB9BF;
        __int16 v30 = 2080;
        long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v32 = 1024;
        int v33 = 3598;
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (v22 == a4)
      {
        *a5 = v13;
        if (__osLogTrace) {
          os_log_type_t v15 = __osLogTrace;
        }
        else {
          os_log_type_t v15 = v9;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v25) = 0;
          _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_DEBUG, "performRequestMessageDataCommand -> %d\n", buf, 8u);
        }
        int v16 = 0;
        goto LABEL_15;
      }
      if (__osLog) {
        __int16 v20 = __osLog;
      }
      else {
        __int16 v20 = v9;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v25 = "messageDataSize == size";
        __int16 v26 = 2048;
        unint64_t v27 = 0;
        __int16 v28 = 2080;
        int v29 = (id *)&unk_222DFB9BF;
        __int16 v30 = 2080;
        long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v32 = 1024;
        int v33 = 3599;
        _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v16 = 258;
    }
  }
  else
  {
    if (__osLog) {
      int v18 = __osLog;
    }
    else {
      int v18 = v9;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v25 = "messageData";
      __int16 v26 = 2048;
      unint64_t v27 = 0;
      __int16 v28 = 2080;
      int v29 = (id *)&unk_222DFB9BF;
      __int16 v30 = 2080;
      long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v32 = 1024;
      int v33 = 3595;
      _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v16 = 263;
  }
  if (__osLogTrace) {
    uint64_t v21 = __osLogTrace;
  }
  else {
    uint64_t v21 = v9;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v16;
    _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "performRequestMessageDataCommand -> %d\n", buf, 8u);
  }
LABEL_15:

  return v16;
}

- (int)initializeEngineWithOptions:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "initializeEngineWithOptions:0x%04x\n", buf, 8u);
  }
  __int16 v14 = v3;
  int v7 = [(BiometricKitXPCServerPearl *)self performCommand:8 inValue:0 inData:&v14 inSize:2 outData:0 outSize:0];
  if (v7)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 3621;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      id v13 = __osLogTrace;
    }
    else {
      id v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v7;
      long long v9 = v13;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v8 = __osLogTrace;
    }
    else {
      id v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      long long v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_222D7E000, v9, v10, "initializeEngineWithOptions -> %{errno}d\n", buf, 8u);
    }
  }
  return v7;
}

+ (void)reportPearlHardwarePass:(BOOL)a3 fallbackAction:(id)a4
{
  int v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (reportPearlHardwarePass_fallbackAction__alreadyReported != 1
    || reportPearlHardwarePass_fallbackAction__lastHardwarePass != v4)
  {
    if (__osLog) {
      int v7 = __osLog;
    }
    else {
      int v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v4;
      _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEFAULT, "reportPearlHardwarePass: %d\n", buf, 8u);
    }
    reportPearlHardwarePass_fallbackAction__alreadyReported = 1;
    reportPearlHardwarePass_fallbackAction__lastHardwarePass = v4;
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__BiometricKitXPCServerPearl_reportPearlHardwarePass_fallbackAction___block_invoke;
    v9[3] = &unk_26466F768;
    char v11 = v4;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

void __69__BiometricKitXPCServerPearl_reportPearlHardwarePass_fallbackAction___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263F2AAB8] sharedInstance];
  char v3 = [v2 BOOLForKey:@"SuppressPearlIssuePopup"];

  if ((v3 & 1) == 0 && objc_opt_class())
  {
    id v4 = objc_alloc_init(MEMORY[0x263F8BD98]);
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __69__BiometricKitXPCServerPearl_reportPearlHardwarePass_fallbackAction___block_invoke_2;
    v6[3] = &unk_26466F740;
    id v7 = *(id *)(a1 + 32);
    [v4 postComponentStatusEventFor:9 status:v5 withReply:v6];
  }
}

void __69__BiometricKitXPCServerPearl_reportPearlHardwarePass_fallbackAction___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (__osLog) {
      id v6 = __osLog;
    }
    else {
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      id v8 = "success";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      int v12 = &unk_222DFB9BF;
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v15 = 1024;
      int v16 = 3656;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)reportPearlInterlock:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    id v5 = __osLogTrace;
  }
  else {
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v9 = v3;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEBUG, "reportPearlInterlock: %d\n", buf, 8u);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__BiometricKitXPCServerPearl_reportPearlInterlock___block_invoke;
  v6[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v7 = v3;
  [a1 reportPearlHardwarePass:!v3 fallbackAction:v6];
  if (!v3) {
    [MEMORY[0x263F2AAD0] displayPearlInterlockIssueNotification:0];
  }
}

uint64_t __51__BiometricKitXPCServerPearl_reportPearlInterlock___block_invoke(uint64_t a1)
{
  return [MEMORY[0x263F2AAD0] displayPearlInterlockIssueNotification:*(unsigned __int8 *)(a1 + 32)];
}

+ (void)reportPearlIssue
{
  if (__osLogTrace) {
    BOOL v3 = __osLogTrace;
  }
  else {
    BOOL v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "reportPearlIssue\n", v4, 2u);
  }
  [a1 reportPearlHardwarePass:0 fallbackAction:&__block_literal_global_486];
}

uint64_t __46__BiometricKitXPCServerPearl_reportPearlIssue__block_invoke()
{
  return [MEMORY[0x263F2AAD0] displayPearlIssueNotification];
}

+ (unsigned)getChipID
{
  return [a1 getDeviceTreeProperty:@"chip-id" fromPath:@":/chosen"];
}

+ (unsigned)getBoardID
{
  return [a1 getDeviceTreeProperty:@"board-id" fromPath:@":/chosen"];
}

+ (unsigned)getSkipBane
{
  return [a1 getDeviceTreeProperty:@"skip-bane-verification" fromPath:@":/product/camera"];
}

+ (unsigned)getDeviceTreeProperty:(id)a3 fromPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = (__CFString *)a3;
  mach_port_t v6 = *MEMORY[0x263F0EC90];
  [NSString stringWithFormat:@"%s%s", "IODeviceTree", [a4 UTF8String]];
  id v7 = objc_claimAutoreleasedReturnValue();
  io_registry_entry_t v8 = IORegistryEntryFromPath(v6, (const char *)[v7 UTF8String]);

  if (!v8)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v15 = "root";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      __int16 v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v22 = 1024;
      int v23 = 3738;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_9;
  }
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v8, v5, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
LABEL_9:
    unsigned int v11 = 0;
    goto LABEL_10;
  }
  CFDataRef v10 = CFProperty;
  unsigned int v11 = *(_DWORD *)CFDataGetBytePtr(CFProperty);
  CFRelease(v10);
LABEL_10:

  return v11;
}

+ (id)getSHA384FromData:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    ccsha384_di();
    [v3 length];
    [v3 bytes];
    ccdigest();
    id v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:48];
  }
  else
  {
    if (__osLog) {
      mach_port_t v6 = __osLog;
    }
    else {
      mach_port_t v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      BOOL v9 = "data";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      __int16 v13 = &unk_222DFB9BF;
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v16 = 1024;
      int v17 = 3759;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)platformProvidesPlCl
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__BiometricKitXPCServerPearl_platformProvidesPlCl__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (platformProvidesPlCl_onceToken != -1) {
    dispatch_once(&platformProvidesPlCl_onceToken, block);
  }
  return platformProvidesPlCl_providesPlCl;
}

void __50__BiometricKitXPCServerPearl_platformProvidesPlCl__block_invoke()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v0 = [(id)objc_opt_class() getChipID];
  int v1 = [(id)objc_opt_class() getBoardID];
  int v2 = v1;
  if (v0) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    mach_port_t v6 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      io_registry_entry_t v8 = "chipID && boardID";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      __int16 v12 = &unk_222DFB9BF;
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v15 = 1024;
      int v16 = 3782;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  if (v0 <= 33073)
  {
    if (v0 == 33056)
    {
      if ((v2 & 0xFFFFFFFC) != 8) {
        return;
      }
    }
    else if (v0 != 33072 || (v2 & 0xFFFFFFFC) != 4)
    {
      return;
    }
LABEL_18:
    platformProvidesPlCl_providesPlCl = 1;
    return;
  }
  if (v0 == 33074 || v0 == 33088) {
    goto LABEL_18;
  }
}

+ (BOOL)platformProvidesPSD3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__BiometricKitXPCServerPearl_platformProvidesPSD3__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (platformProvidesPSD3_onceToken != -1) {
    dispatch_once(&platformProvidesPSD3_onceToken, block);
  }
  return platformProvidesPSD3_providesPSD3;
}

void __50__BiometricKitXPCServerPearl_platformProvidesPSD3__block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v0 = [(id)objc_opt_class() getChipID];
  if (v0 == 33088)
  {
    platformProvidesPSD3_providesPSD3 = 1;
  }
  else if (!v0)
  {
    if (__osLog) {
      int v1 = __osLog;
    }
    else {
      int v1 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v2 = 136316162;
      BOOL v3 = "chipID";
      __int16 v4 = 2048;
      uint64_t v5 = 0;
      __int16 v6 = 2080;
      int v7 = &unk_222DFB9BF;
      __int16 v8 = 2080;
      __int16 v9 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v10 = 1024;
      int v11 = 3843;
      _os_log_impl(&dword_222D7E000, v1, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v2, 0x30u);
    }
  }
}

- (int)loadDCNKernels
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    __int16 v4 = __osLogTrace;
  }
  else {
    __int16 v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "loadDCNKernels\n", buf, 2u);
  }
  uint64_t v5 = (void *)os_transaction_create();
  int v30 = 0;
  __int16 v6 = (void *)MEMORY[0x223CA8CA0]();
  int v7 = [(BiometricKitXPCServerPearl *)self getSPRLInfo:&v30];
  if (!v7)
  {
    if (BYTE2(v30))
    {
      int v8 = 0;
      goto LABEL_48;
    }
    int v9 = [(id)objc_opt_class() getChipID];
    int v10 = [(id)objc_opt_class() getBoardID];
    if (v9 > 33041)
    {
      if (v9 <= 33071)
      {
        if (v9 == 33042)
        {
          int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H14_iPad.bin";
          goto LABEL_35;
        }
        if (v9 == 33056)
        {
          int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H15_iPhone.bin";
          goto LABEL_35;
        }
      }
      else
      {
        switch(v9)
        {
          case 33072:
            int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H16_iPhone.bin";
            goto LABEL_35;
          case 33074:
            int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H16_iPad.bin";
            goto LABEL_35;
          case 33088:
            int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H17_iPhone.bin";
            goto LABEL_35;
        }
      }
    }
    else if (v9 <= 32815)
    {
      if (v9 == 32800)
      {
        if ((v10 & 0xFFFFFFFE) == 0xC) {
          int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernelsb_H11_iPhone.bin";
        }
        else {
          int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernelsa_H11_iPhone.bin";
        }
        goto LABEL_35;
      }
      if (v9 == 32807)
      {
        int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H11_iPad.bin";
        goto LABEL_35;
      }
    }
    else
    {
      switch(v9)
      {
        case 32816:
          int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H12_iPhone.bin";
          goto LABEL_35;
        case 33025:
          int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H13_iPhone.bin";
          goto LABEL_35;
        case 33027:
          int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H13_iPad.bin";
          goto LABEL_35;
      }
    }
    int v11 = @"/System/Library/Pearl/DCNKernels/DCNKernels_H14_iPhone.bin";
LABEL_35:
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = v3;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v32 = (const char *)v11;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEFAULT, "DCNKernels not loaded yet, loading from %@\n", buf, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v11];
    __int16 v14 = (void *)v13;
    if (__osLog) {
      __int16 v15 = __osLog;
    }
    else {
      __int16 v15 = v3;
    }
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = v15;
        uint64_t v17 = [v14 length];
        uint64_t v18 = [(id)objc_opt_class() getSHA384FromData:v14];
        *(_DWORD *)buf = 134218242;
        __int16 v32 = (const char *)v17;
        __int16 v33 = 2112;
        uint64_t v34 = v18;
        _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_DEFAULT, "DCNKernels: Size: %lu SHA384: %@\n", buf, 0x16u);
      }
      id v19 = v14;
      int v8 = [-[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 35, 0, [v19 bytes], [v19 length], 0, 0);
      if (!v8)
      {

        goto LABEL_48;
      }
      if (__osLog) {
        int v29 = __osLog;
      }
      else {
        int v29 = v3;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v32 = "err == 0 ";
        __int16 v33 = 2048;
        uint64_t v34 = (void *)v8;
        __int16 v35 = 2080;
        int v36 = &unk_222DFB9BF;
        __int16 v37 = 2080;
        id v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v39 = 1024;
        int v40 = 3967;
        _os_log_impl(&dword_222D7E000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v32 = "dcnKernels";
        __int16 v33 = 2048;
        uint64_t v34 = 0;
        __int16 v35 = 2080;
        int v36 = &unk_222DFB9BF;
        __int16 v37 = 2080;
        id v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v39 = 1024;
        int v40 = 3962;
        _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v8 = 259;
    }

    goto LABEL_48;
  }
  int v8 = v7;
  if (__osLog) {
    __int16 v26 = __osLog;
  }
  else {
    __int16 v26 = v3;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v32 = "err == 0 ";
    __int16 v33 = 2048;
    uint64_t v34 = (void *)v8;
    __int16 v35 = 2080;
    int v36 = &unk_222DFB9BF;
    __int16 v37 = 2080;
    id v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v39 = 1024;
    int v40 = 3879;
    _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_48:
  int v20 = [(BiometricKitXPCServerPearl *)self sendDCNKernelsCheckResult:v8 == 0];
  if (v20)
  {
    int v27 = v20;
    __int16 v28 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v32 = "[self sendDCNKernelsCheckResult:(err == 0)] == 0 ";
      __int16 v33 = 2048;
      uint64_t v34 = (void *)v27;
      __int16 v35 = 2080;
      int v36 = &unk_222DFB9BF;
      __int16 v37 = 2080;
      id v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v39 = 1024;
      int v40 = 3974;
      _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (v8)
  {
    [(id)objc_opt_class() reportPearlIssue];
    if (__osLogTrace) {
      __int16 v21 = __osLogTrace;
    }
    else {
      __int16 v21 = v3;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v8;
      __int16 v22 = v21;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
LABEL_60:
      _os_log_impl(&dword_222D7E000, v22, v23, "loadDCNKernels -> %{errno}d\n", buf, 8u);
    }
  }
  else
  {
    if (__osLogTrace) {
      uint64_t v24 = __osLogTrace;
    }
    else {
      uint64_t v24 = v3;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = 0;
      __int16 v22 = v24;
      os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
      goto LABEL_60;
    }
  }

  return v8;
}

- (id)getProjectorSerialNumberIORegAttempt
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH10CamIn");
  if (!v2)
  {
    if (__osLog) {
      int v9 = __osLog;
    }
    else {
      int v9 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    int v10 = 136316162;
    int v11 = "matchingDict";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = &unk_222DFB9BF;
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v18 = 1024;
    int v19 = 4080;
    goto LABEL_31;
  }
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v2);
  if (MatchingService) {
    goto LABEL_7;
  }
  CFDictionaryRef v5 = IOServiceNameMatching("AppleH13CamIn");
  if (!v5)
  {
    if (__osLog) {
      int v9 = __osLog;
    }
    else {
      int v9 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    int v10 = 136316162;
    int v11 = "matchingDict";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = &unk_222DFB9BF;
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v18 = 1024;
    int v19 = 4087;
    goto LABEL_31;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v5);
  if (MatchingService)
  {
LABEL_7:
    CFDataRef CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"FrontIRStructuredLightProjectorSerialNumString", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    IOObjectRelease(MatchingService);
    goto LABEL_8;
  }
  CFDictionaryRef v6 = IOServiceNameMatching("AppleH16CamIn");
  if (!v6)
  {
    if (__osLog) {
      int v9 = __osLog;
    }
    else {
      int v9 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    int v10 = 136316162;
    int v11 = "matchingDict";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = &unk_222DFB9BF;
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v18 = 1024;
    int v19 = 4095;
    goto LABEL_31;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v6);
  if (MatchingService) {
    goto LABEL_7;
  }
  if (__osLog) {
    int v9 = __osLog;
  }
  else {
    int v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136316162;
    int v11 = "service";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = &unk_222DFB9BF;
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v18 = 1024;
    int v19 = 4100;
LABEL_31:
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
  }
LABEL_32:
  CFDataRef CFProperty = 0;
LABEL_8:

  return CFProperty;
}

- (id)getProjectorSerialNumberIOReg
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  mach_port_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    __int16 v4 = __osLogTrace;
  }
  else {
    __int16 v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "getProjectorSerialNumberIOReg\n", (uint8_t *)&v9, 2u);
  }
  mach_absolute_time();
  CFDictionaryRef v5 = [(BiometricKitXPCServerPearl *)self getProjectorSerialNumberIORegAttempt];
  if (!v5)
  {
    while (1)
    {
      mach_absolute_time();
      if ((unint64_t)absoluteToMiliseconds() > 0x36EE80) {
        break;
      }
      sleep(1u);
      uint64_t v6 = [(BiometricKitXPCServerPearl *)self getProjectorSerialNumberIORegAttempt];
      if (v6)
      {
        CFDictionaryRef v5 = (void *)v6;
        goto LABEL_11;
      }
    }
    CFDictionaryRef v5 = 0;
  }
LABEL_11:
  if (__osLogTrace) {
    int v7 = __osLogTrace;
  }
  else {
    int v7 = v3;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v5;
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEBUG, "getProjectorSerialNumberIOReg -> %@\n", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (id)getRomeoSerialNumberFDR
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  mach_port_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    __int16 v4 = __osLogTrace;
  }
  else {
    __int16 v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "getRomeoSerialNumberFDR\n", buf, 2u);
  }
  CFDictionaryRef v5 = [MEMORY[0x263EFF9A0] dictionary];
  if (isInternalBuild()) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"APTicketAllowUntrusted"];
  }
  id v23 = 0;
  uint64_t v6 = [(BiometricKitXPCServerPearl *)self getFDRClassFromFDR:13 withOptions:v5 withError:&v23];
  id v7 = v23;
  if (!v6)
  {
    if (__osLog) {
      int v19 = __osLog;
    }
    else {
      int v19 = v3;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v25 = "pwclData";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    int v29 = &unk_222DFB9BF;
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v32 = 1024;
    int v33 = 4173;
LABEL_44:
    uint64_t v20 = v19;
    goto LABEL_47;
  }
  if ((unint64_t)[v6 length] <= 0xB9)
  {
    if (__osLog) {
      int v19 = __osLog;
    }
    else {
      int v19 = v3;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v25 = "pwclData.length >= sizeof(pwclSN_pearl)";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    int v29 = &unk_222DFB9BF;
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v32 = 1024;
    int v33 = 4174;
    goto LABEL_44;
  }
  if (v7)
  {
    if (__osLog) {
      int v19 = __osLog;
    }
    else {
      int v19 = v3;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v25 = "!error";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    int v29 = &unk_222DFB9BF;
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v32 = 1024;
    int v33 = 4176;
    goto LABEL_44;
  }
  uint64_t v8 = [v6 bytes];
  int v9 = (char *)malloc_type_malloc(0x12uLL, 0x8F54DAD1uLL);
  if (__osLog) {
    int v10 = __osLog;
  }
  else {
    int v10 = v3;
  }
  if (!v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_48:
      __int16 v15 = 0;
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v25 = "serialDecoded";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    int v29 = &unk_222DFB9BF;
    __int16 v30 = 2080;
    long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v32 = 1024;
    int v33 = 4182;
    uint64_t v20 = v10;
LABEL_47:
    _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_48;
  }
  uint64_t v11 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *(unsigned __int8 *)(v8 + 129);
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v12;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEFAULT, "OTP Version: %d\n", buf, 8u);
  }
  if (*(unsigned __int8 *)(v8 + 129) <= 4u) {
    uint64_t v13 = v8 + 101;
  }
  else {
    uint64_t v13 = v8 + 175;
  }
  int SensorSerialNumStringUT = getSensorSerialNumStringUT(v11, 0x12uLL, v13);
  if (SensorSerialNumStringUT)
  {
    int v21 = SensorSerialNumStringUT;
    if (__osLog) {
      __int16 v22 = __osLog;
    }
    else {
      __int16 v22 = v3;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = "err == 0 ";
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      __int16 v28 = 2080;
      int v29 = &unk_222DFB9BF;
      __int16 v30 = 2080;
      long long v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v32 = 1024;
      int v33 = 4196;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v15 = 0;
  }
  else
  {
    __int16 v15 = [NSString stringWithUTF8String:v11];
  }
  free(v11);
LABEL_23:
  if (__osLogTrace) {
    __int16 v16 = __osLogTrace;
  }
  else {
    __int16 v16 = v3;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v15;
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_DEBUG, "getRomeoSerialNumberFDR -> %@\n", buf, 0xCu);
  }
  uint64_t v17 = v15;

  return v17;
}

- (int)verifyRomeoSerialNumberAgainstFDR
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  mach_port_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    __int16 v4 = __osLogTrace;
  }
  else {
    __int16 v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "verifyRomeoSerialNumberAgainstFDR\n", (uint8_t *)&v11, 2u);
  }
  CFDictionaryRef v5 = [(BiometricKitXPCServerPearl *)self getRomeoSerialNumberFDR];
  uint64_t v6 = [(BiometricKitXPCServerPearl *)self getProjectorSerialNumberIOReg];
  if (!v5)
  {
    if (__osLog) {
      id v7 = __osLog;
    }
    else {
      id v7 = v3;
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    int v11 = 136316162;
    int v12 = "fdrSerial";
    __int16 v13 = 2048;
    __int16 v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = &unk_222DFB9BF;
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v19 = 1024;
    int v20 = 4223;
    goto LABEL_33;
  }
  if (__osLog) {
    id v7 = __osLog;
  }
  else {
    id v7 = v3;
  }
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      int v12 = v5;
      __int16 v13 = 2112;
      __int16 v14 = v6;
      _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEFAULT, "Romeo serial: FDR: %@, IOReg: %@\n", (uint8_t *)&v11, 0x16u);
    }
    if ([v5 isEqualToString:v6])
    {
      if (__osLogTrace) {
        uint64_t v8 = __osLogTrace;
      }
      else {
        uint64_t v8 = v3;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 67109120;
        LODWORD(v12) = 0;
        _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "verifyRomeoSerialNumberAgainstFDR -> 0x%x\n", (uint8_t *)&v11, 8u);
      }
      int v9 = 0;
      goto LABEL_20;
    }
    if (__osLog) {
      id v7 = __osLog;
    }
    else {
      id v7 = v3;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136316162;
      int v12 = "[fdrSerial isEqualToString:ioRegSerial]";
      __int16 v13 = 2048;
      __int16 v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = &unk_222DFB9BF;
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v19 = 1024;
      int v20 = 4228;
      goto LABEL_33;
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136316162;
    int v12 = "ioRegSerial";
    __int16 v13 = 2048;
    __int16 v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = &unk_222DFB9BF;
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v19 = 1024;
    int v20 = 4224;
LABEL_33:
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
  }
LABEL_34:
  if (__osLogTrace) {
    mach_port_t v3 = __osLogTrace;
  }
  int v9 = 261;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v11 = 67109120;
    LODWORD(v12) = 261;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_ERROR, "verifyRomeoSerialNumberAgainstFDR -> 0x%x\n", (uint8_t *)&v11, 8u);
  }
LABEL_20:

  return v9;
}

- (int)queryGuadalupeSerialNumberFDR:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  CFDictionaryRef v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "queryGuadalupeSerialNumberFDR\n", buf, 2u);
  }
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  if (isInternalBuild()) {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"APTicketAllowUntrusted"];
  }
  id v21 = 0;
  uint64_t v8 = [(BiometricKitXPCServerPearl *)self getFDRClassFromFDR:13 withOptions:v7 withError:&v21];
  id v9 = v21;
  if (!v8)
  {
    if (__osLog) {
      __int16 v19 = __osLog;
    }
    else {
      __int16 v19 = v5;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v23 = "pwclData";
    *(_WORD *)&v23[8] = 2048;
    *(void *)&v23[10] = 0;
    __int16 v24 = 2080;
    uint64_t v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 4264;
    goto LABEL_53;
  }
  if (![v8 length])
  {
    if (__osLog) {
      __int16 v19 = __osLog;
    }
    else {
      __int16 v19 = v5;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v23 = "pwclData.length >= sizeof(pwclHeader->version)";
    *(_WORD *)&v23[8] = 2048;
    *(void *)&v23[10] = 0;
    __int16 v24 = 2080;
    uint64_t v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 4265;
    goto LABEL_53;
  }
  if (v9)
  {
    if (__osLog) {
      __int16 v19 = __osLog;
    }
    else {
      __int16 v19 = v5;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v23 = "!error";
    *(_WORD *)&v23[8] = 2048;
    *(void *)&v23[10] = 0;
    __int16 v24 = 2080;
    uint64_t v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 4267;
    goto LABEL_53;
  }
  id v10 = v8;
  int v11 = (unsigned __int8 *)[v10 bytes];
  if (__osLog) {
    int v12 = __osLog;
  }
  else {
    int v12 = v5;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)id v23 = v13;
    _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEFAULT, "pwcl version: %d\n", buf, 8u);
  }
  if (*v11 < 3u)
  {
    id v15 = 0;
    goto LABEL_21;
  }
  if ((unint64_t)[v10 length] <= 0x15)
  {
    if (__osLog) {
      __int16 v19 = __osLog;
    }
    else {
      __int16 v19 = v5;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v23 = "pwclData.length >= sizeof(*pwclHeader)";
    *(_WORD *)&v23[8] = 2048;
    *(void *)&v23[10] = 0;
    __int16 v24 = 2080;
    uint64_t v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 4275;
    goto LABEL_53;
  }
  __int16 v14 = [NSString stringWithUTF8String:v11 + 4];
  if (v14)
  {
    id v15 = v14;
    *a3 = v15;
LABEL_21:
    if (__osLogTrace) {
      __int16 v16 = __osLogTrace;
    }
    else {
      __int16 v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v23 = 0;
      *(_WORD *)&v23[4] = 2112;
      *(void *)&v23[6] = v15;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_DEBUG, "queryGuadalupeSerialNumberFDR -> 0x%x (%@)\n", buf, 0x12u);
    }
    int v17 = 0;
    goto LABEL_27;
  }
  if (__osLog) {
    __int16 v19 = __osLog;
  }
  else {
    __int16 v19 = v5;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)id v23 = "sn";
    *(_WORD *)&v23[8] = 2048;
    *(void *)&v23[10] = 0;
    __int16 v24 = 2080;
    uint64_t v25 = &unk_222DFB9BF;
    __int16 v26 = 2080;
    uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v28 = 1024;
    int v29 = 4278;
LABEL_53:
    _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_54:
  if (__osLogTrace) {
    int v20 = __osLogTrace;
  }
  else {
    int v20 = v5;
  }
  int v17 = 261;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v23 = 261;
    *(_WORD *)&v23[4] = 2112;
    *(void *)&v23[6] = 0;
    _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "queryGuadalupeSerialNumberFDR -> 0x%x (%@)\n", buf, 0x12u);
  }
  id v15 = 0;
LABEL_27:

  return v17;
}

- (int)verifyGuadalupeSerialNumberAgainstFDR
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  mach_port_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    __int16 v4 = __osLogTrace;
  }
  else {
    __int16 v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "verifyGuadalupeSerialNumberAgainstFDR\n", buf, 2u);
  }
  id v16 = 0;
  int v5 = [(BiometricKitXPCServerPearl *)self queryGuadalupeSerialNumberFDR:&v16];
  uint64_t v6 = (char *)v16;
  id v7 = v6;
  if (v5)
  {
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v3;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = "err == 0 ";
      __int16 v19 = 2048;
      int v20 = (void *)v5;
      __int16 v21 = 2080;
      __int16 v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 4302;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (!v6)
    {
LABEL_16:
      if (__osLogTrace) {
        int v11 = __osLogTrace;
      }
      else {
        int v11 = v3;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = 0;
        _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEBUG, "verifyGuadalupeSerialNumberAgainstFDR -> 0x%x\n", buf, 8u);
      }
      int v5 = 0;
      goto LABEL_22;
    }
    uint64_t v8 = [(BiometricKitXPCServerPearl *)self getProjectorSerialNumberIOReg];
    id v9 = (void *)v8;
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = v3;
    }
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v18 = v7;
        __int16 v19 = 2112;
        int v20 = v9;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEFAULT, "Guadalupe serial: FDR: %@, IOReg: %@\n", buf, 0x16u);
      }
      if ([v7 isEqualToString:v9])
      {

        goto LABEL_16;
      }
      if (__osLog) {
        __int16 v14 = __osLog;
      }
      else {
        __int16 v14 = v3;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v18 = "[fdrSerial isEqualToString:ioRegSerial]";
        __int16 v19 = 2048;
        int v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = &unk_222DFB9BF;
        __int16 v23 = 2080;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v25 = 1024;
        int v26 = 4310;
        _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v5 = 257;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v18 = "ioRegSerial";
        __int16 v19 = 2048;
        int v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = &unk_222DFB9BF;
        __int16 v23 = 2080;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v25 = 1024;
        int v26 = 4306;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v5 = 259;
    }
  }
  if (__osLogTrace) {
    id v15 = __osLogTrace;
  }
  else {
    id v15 = v3;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v5;
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "verifyGuadalupeSerialNumberAgainstFDR -> 0x%x\n", buf, 8u);
  }
LABEL_22:

  return v5;
}

- (int)verifyProjectorSerialNumber
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    __int16 v4 = __osLogTrace;
  }
  else {
    __int16 v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "verifyProjectorSerialNumber\n", buf, 2u);
  }
  memset(v27, 0, 23);
  int v5 = [(BiometricKitXPCServerPearl *)self performGetBiometrickitdInfoCommand:v27];
  if (v5)
  {
    int v7 = v5;
    if (__osLog) {
      __int16 v23 = __osLog;
    }
    else {
      __int16 v23 = v3;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v29 = "err == 0 ";
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      __int16 v32 = 2080;
      int v33 = &unk_222DFB9BF;
      __int16 v34 = 2080;
      __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v36 = 1024;
      int v37 = 4332;
      _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_33;
  }
  if (BYTE6(v27[2]))
  {
    if (__osLog) {
      uint64_t v6 = __osLog;
    }
    else {
      uint64_t v6 = v3;
    }
    int v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "Projector SN already checked\n";
LABEL_13:
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
LABEL_32:
      int v7 = 0;
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  if ((isInternalBuild() & 1) == 0)
  {
    isInternalBuild();
LABEL_28:
    unsigned int v16 = [(id)objc_opt_class() getChipID] - 33040;
    if (v16 <= 0x30 && ((1 << v16) & 0x1000500010001) != 0)
    {
      if (![(BiometricKitXPCServerPearl *)self verifyGuadalupeSerialNumberAgainstFDR])goto LABEL_32; {
    }
      }
    else if (![(BiometricKitXPCServerPearl *)self verifyRomeoSerialNumberAgainstFDR])
    {
      goto LABEL_32;
    }
    if ([(BiometricKitXPCServerPearl *)self hasFDREntitlement]) {
      goto LABEL_32;
    }
    if (__osLog) {
      int v26 = __osLog;
    }
    else {
      int v26 = v3;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v29 = "[self hasFDREntitlement]";
      __int16 v30 = 2048;
      uint64_t v31 = 0;
      __int16 v32 = 2080;
      int v33 = &unk_222DFB9BF;
      __int16 v34 = 2080;
      __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v36 = 1024;
      int v37 = 4371;
      _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v7 = 261;
    goto LABEL_33;
  }
  id v9 = getBootArgs();
  id v10 = v9;
  if (v9
    && (uint64_t v11 = [v9 rangeOfString:@"pearl-skip-projector-checks"], v12)
    && (unint64_t v13 = v12 + v11 + 1, v13 < [v10 length]))
  {
    __int16 v14 = [v10 substringWithRange:v13];
    char v15 = [v14 BOOLValue];
  }
  else
  {
    char v15 = 0;
  }

  if (!isInternalBuild() || (v15 & 1) == 0) {
    goto LABEL_28;
  }
  if (__osLog) {
    uint64_t v6 = __osLog;
  }
  else {
    uint64_t v6 = v3;
  }
  int v7 = 0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v8 = "Skipping projector SN check\n";
    goto LABEL_13;
  }
LABEL_33:
  int v17 = [(BiometricKitXPCServerPearl *)self sendRomeoSNCheckResult:v7 == 0];
  if (v17)
  {
    int v24 = v17;
    __int16 v25 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v29 = "[self sendRomeoSNCheckResult:(err == kPearlErrorSuccess)] == 0 ";
      __int16 v30 = 2048;
      uint64_t v31 = v24;
      __int16 v32 = 2080;
      int v33 = &unk_222DFB9BF;
      __int16 v34 = 2080;
      __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v36 = 1024;
      int v37 = 4386;
      _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (v7)
  {
    [(id)objc_opt_class() reportPearlIssue];
    if (__osLogTrace) {
      __int16 v18 = __osLogTrace;
    }
    else {
      __int16 v18 = v3;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v7;
      __int16 v19 = v18;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_45:
      _os_log_impl(&dword_222D7E000, v19, v20, "verifyProjectorSerialNumber -> 0x%x\n", buf, 8u);
    }
  }
  else
  {
    if (__osLogTrace) {
      __int16 v21 = __osLogTrace;
    }
    else {
      __int16 v21 = v3;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = 0;
      __int16 v19 = v21;
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      goto LABEL_45;
    }
  }
  return v7;
}

- (BOOL)hasFDREntitlement
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v2 = [(BiometricKitXPCServerPearl *)self hasManifestEntitlement:1717663091];
  if (__osLog) {
    uint64_t v3 = __osLog;
  }
  else {
    uint64_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v4 = "false";
    if (v2) {
      __int16 v4 = "true";
    }
    int v6 = 136315138;
    int v7 = v4;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEFAULT, "hasFDREntitlement: 'faus':%s\n", (uint8_t *)&v6, 0xCu);
  }
  return v2;
}

- (BOOL)hasManifestEntitlement:(unsigned int)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v5 = __osLogTrace;
  }
  else {
    int v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEBUG, "hasManifestEntitlement: 0x%x\n", buf, 8u);
  }
  BOOL v32 = 0;
  uint64_t v71 = 0;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  *(_OWORD *)buf = 0u;
  int v6 = [MEMORY[0x263F53618] sharedDataAccessor];
  int v7 = (void *)[v6 copyPathForPersonalizedData:2 error:0];

  if (!v7)
  {
    if (__osLog) {
      __int16 v22 = __osLog;
    }
    else {
      __int16 v22 = v4;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    int __s1 = 136316162;
    int v73 = "apTicketPath";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    __int16 v77 = &unk_222DFB9BF;
    __int16 v78 = 2080;
    int v79 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v80 = 1024;
    int v81 = 4431;
    goto LABEL_31;
  }
  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v7];
  if (!v8)
  {
    if (__osLog) {
      __int16 v22 = __osLog;
    }
    else {
      __int16 v22 = v4;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    int __s1 = 136316162;
    int v73 = "apTicket";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    __int16 v77 = &unk_222DFB9BF;
    __int16 v78 = 2080;
    int v79 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v80 = 1024;
    int v81 = 4434;
LABEL_31:
    _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&__s1, 0x30u);
LABEL_32:
    unint64_t v13 = 0;
    id v9 = 0;
LABEL_39:
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  id v9 = (id)v8;
  uint64_t v10 = MGCopyAnswer();
  if (!v10)
  {
    if (__osLog) {
      __int16 v23 = __osLog;
    }
    else {
      __int16 v23 = v4;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int __s1 = 136316162;
      int v73 = "bootManifestHash";
      __int16 v74 = 2048;
      uint64_t v75 = 0;
      __int16 v76 = 2080;
      __int16 v77 = &unk_222DFB9BF;
      __int16 v78 = 2080;
      int v79 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v80 = 1024;
      int v81 = 4437;
      _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&__s1, 0x30u);
    }
    unint64_t v13 = 0;
    goto LABEL_39;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = (void *)MGCopyAnswer();
  if (v12)
  {
    unint64_t v13 = v12;
    int v14 = [v12 isEqualToString:@"sha2-384"];
    if (v14)
    {
      [v9 length];
      id v9 = v9;
      [v9 bytes];
      ccdigest();
      if ((isInternalBuild() & 1) == 0
        && (id v15 = v11,
            (int v16 = memcmp(&__s1, (const void *)[v15 bytes], 0x30uLL)) != 0))
      {
        int v30 = v16;
        if (__osLog) {
          uint64_t v31 = __osLog;
        }
        else {
          uint64_t v31 = v4;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v33 = 136316162;
          __int16 v34 = "err == 0 ";
          __int16 v35 = 2048;
          uint64_t v36 = v30;
          __int16 v37 = 2080;
          uint64_t v38 = &unk_222DFB9BF;
          __int16 v39 = 2080;
          int v40 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v41 = 1024;
          int v42 = 4452;
          _os_log_impl(&dword_222D7E000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v33, 0x30u);
        }
        uint64_t v11 = v15;
      }
      else
      {
        id v9 = v9;
        int inited = Img4DecodeInitManifest([v9 bytes], [v9 length], (uint64_t)buf);
        if (inited)
        {
          int v28 = inited;
          if (__osLog) {
            int v26 = __osLog;
          }
          else {
            int v26 = v4;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int v33 = 136316162;
            __int16 v34 = "err == 0 ";
            __int16 v35 = 2048;
            uint64_t v36 = v28;
            __int16 v37 = 2080;
            uint64_t v38 = &unk_222DFB9BF;
            __int16 v39 = 2080;
            int v40 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v41 = 1024;
            int v42 = 4457;
LABEL_61:
            p_s1 = v33;
            goto LABEL_62;
          }
        }
        else
        {
          int BooleanFromSection = Img4DecodeGetBooleanFromSection((uint64_t)buf, 0, a3, &v32);
          if (BooleanFromSection)
          {
            int v29 = BooleanFromSection;
            int v26 = (__osLog ? __osLog : v4);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int v33 = 136316162;
              __int16 v34 = "err == 0 ";
              __int16 v35 = 2048;
              uint64_t v36 = v29;
              __int16 v37 = 2080;
              uint64_t v38 = &unk_222DFB9BF;
              __int16 v39 = 2080;
              int v40 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
              __int16 v41 = 1024;
              int v42 = 4460;
              goto LABEL_61;
            }
          }
        }
      }
    }
    else
    {
      int v25 = v14;
      if (__osLog) {
        int v26 = __osLog;
      }
      else {
        int v26 = v4;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int __s1 = 136316162;
        int v73 = "err == 0 ";
        __int16 v74 = 2048;
        uint64_t v75 = v25 ^ 1u;
        __int16 v76 = 2080;
        __int16 v77 = &unk_222DFB9BF;
        __int16 v78 = 2080;
        int v79 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v80 = 1024;
        int v81 = 4443;
        p_s1 = (uint8_t *)&__s1;
LABEL_62:
        _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", p_s1, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog) {
      int v24 = __osLog;
    }
    else {
      int v24 = v4;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int __s1 = 136316162;
      int v73 = "cryptoHashMethod";
      __int16 v74 = 2048;
      uint64_t v75 = 0;
      __int16 v76 = 2080;
      __int16 v77 = &unk_222DFB9BF;
      __int16 v78 = 2080;
      int v79 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v80 = 1024;
      int v81 = 4440;
      _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&__s1, 0x30u);
    }
    unint64_t v13 = 0;
  }
LABEL_15:
  if (__osLogTrace) {
    __int16 v19 = __osLogTrace;
  }
  else {
    __int16 v19 = v4;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int v33 = 67109120;
    LODWORD(v34) = v32;
    _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_DEBUG, "hasManifestEntitlement -> %d\n", v33, 8u);
  }
  BOOL v20 = v32;

  return v20;
}

- (id)getDisplayTrustStatusAttempt
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  BOOL v2 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    uint64_t v3 = __osLogTrace;
  }
  else {
    uint64_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "getDisplayTrustStatusAttempt\n", buf, 2u);
  }
  uint64_t v27 = 0;
  int InternalComponents = cpGetInternalComponents(&v27);
  if (InternalComponents)
  {
    int v21 = InternalComponents;
    if (__osLog) {
      __int16 v22 = __osLog;
    }
    else {
      __int16 v22 = v2;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v30 = "err == 0 ";
      __int16 v31 = 2048;
      uint64_t v32 = v21;
      __int16 v33 = 2080;
      __int16 v34 = &unk_222DFB9BF;
      __int16 v35 = 2080;
      uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v37 = 1024;
      int v38 = 4482;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v14 = 0;
    id v7 = 0;
    int v16 = 0;
  }
  else
  {
    int v5 = v27;
    int v6 = (void *)[(__CFArray *)v27 copy];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unint64_t v13 = [v12 objectForKey:@"ComponentName"];
          if ([v13 isEqualToString:@"TouchController"])
          {
            id v14 = v12;

            goto LABEL_18;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      id v14 = 0;
    }
    else
    {
      id v14 = 0;
    }
LABEL_18:

    uint64_t v15 = [v14 objectForKey:@"isTrustedForUI"];
    if (v15)
    {
      int v16 = (char *)v15;
    }
    else
    {
      int v17 = [v14 objectForKey:@"isTrusted"];
      if ([v17 BOOLValue]) {
        int v16 = v17;
      }
      else {
        int v16 = 0;
      }
    }
  }
  if (__osLogTrace) {
    __int16 v18 = __osLogTrace;
  }
  else {
    __int16 v18 = v2;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v30 = v16;
    _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_DEBUG, "getDisplayTrustStatusAttempt -> %@\n", buf, 0xCu);
  }
  __int16 v19 = v16;

  return v19;
}

- (int)verifyDisplayTrust
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "verifyDisplayTrust\n", (uint8_t *)&v10, 2u);
  }
  int v5 = [(BiometricKitXPCServerPearl *)self sendDisplayCheckResult:1];
  if (v5)
  {
    int v8 = v5;
    uint64_t v9 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      uint64_t v11 = "[self sendDisplayCheckResult:trusted] == 0 ";
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = &unk_222DFB9BF;
      __int16 v16 = 2080;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v18 = 1024;
      int v19 = 4558;
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
  }
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = v3;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 67109120;
    LODWORD(v11) = 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "verifyDisplayTrust -> 0x%x\n", (uint8_t *)&v10, 8u);
  }
  return 0;
}

- (int)sendSelfCheckResult:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [(BiometricKitXPCServerPearl *)self performCommand:44 inValue:0 inData:a3 inSize:24 outData:0 outSize:0];
  uint64_t v4 = v3;
  if (v3)
  {
    if (__osLog) {
      int v6 = __osLog;
    }
    else {
      int v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      int v8 = "err == 0 ";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = &unk_222DFB9BF;
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v15 = 1024;
      int v16 = 4577;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  return v4;
}

- (int)sendFDRDataCheckResult:(int)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "sendFDRDataCheckResult, passed: %d\n", buf, 8u);
  }
  uint64_t v12 = -1;
  uint64_t v13 = -1;
  v11[0] = -1;
  v11[1] = a3;
  int v7 = [(BiometricKitXPCServerPearl *)self sendSelfCheckResult:v11];
  uint64_t v8 = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v10 = __osLog;
    }
    else {
      uint64_t v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v15 = "err == 0 ";
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      int v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v22 = 1024;
      int v23 = 4597;
      _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v8;
}

- (int)sendRomeoSNCheckResult:(int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "sendRomeoSNCheckResult, passed: %d\n", buf, 8u);
  }
  int v13 = -1;
  uint64_t v14 = -1;
  uint64_t v11 = -1;
  int v12 = a3;
  int v7 = [(BiometricKitXPCServerPearl *)self sendSelfCheckResult:&v11];
  uint64_t v8 = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v10 = __osLog;
    }
    else {
      uint64_t v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 4617;
      _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v8;
}

- (int)sendDCNKernelsCheckResult:(int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "sendDCNKernelsCheckResult, passed: %d\n", buf, 8u);
  }
  int v12 = -1;
  uint64_t v14 = -1;
  uint64_t v11 = -1;
  int v13 = a3;
  int v7 = [(BiometricKitXPCServerPearl *)self sendSelfCheckResult:&v11];
  uint64_t v8 = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v10 = __osLog;
    }
    else {
      uint64_t v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 4637;
      _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v8;
}

- (int)sendDisplayCheckResult:(int)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = a3;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "sendDisplayCheckResult, passed: %d\n", buf, 8u);
  }
  v11[1] = -1;
  int v13 = -1;
  v11[0] = -1;
  int v12 = a3;
  int v7 = [(BiometricKitXPCServerPearl *)self sendSelfCheckResult:v11];
  uint64_t v8 = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v10 = __osLog;
    }
    else {
      uint64_t v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v15 = "err == 0 ";
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      __int16 v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v22 = 1024;
      int v23 = 4657;
      _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v8;
}

- (id)classStringForEnum:(unsigned __int16)a3
{
  if (a3 > 0x12u) {
    return 0;
  }
  else {
    return off_26466F8C0[(__int16)a3];
  }
}

- (int)loadFDRClassCommand:(int)a3 withClass:(unsigned __int16)a4 withData:(id)a5 isAlternative:(BOOL)a6
{
  __int16 v8 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a5;
  size_t v11 = [v10 length] + 9;
  int v12 = (char *)malloc_type_malloc(v11, 0xF0F9842AuLL);
  if (v12)
  {
    int v13 = v12;
    *(_WORD *)int v12 = v8;
    *((_WORD *)v12 + 1) = a4;
    v12[4] = a6;
    *(_DWORD *)(v12 + 5) = [v10 length];
    id v14 = v10;
    memcpy(v13 + 9, (const void *)[v14 bytes], [v14 length]);
    int v15 = [(BiometricKitXPCServerPearl *)self performCommand:36 inValue:0 inData:v13 inSize:v11 outData:0 outSize:0];
    if (v15)
    {
      if (__osLog) {
        __int16 v18 = __osLog;
      }
      else {
        __int16 v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316162;
        __int16 v20 = "err == 0 ";
        __int16 v21 = 2048;
        uint64_t v22 = v15;
        __int16 v23 = 2080;
        uint64_t v24 = &unk_222DFB9BF;
        __int16 v25 = 2080;
        long long v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v27 = 1024;
        int v28 = 4722;
        _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
      }
    }
    free(v13);
  }
  else
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      __int16 v20 = "input";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      uint64_t v24 = &unk_222DFB9BF;
      __int16 v25 = 2080;
      long long v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v27 = 1024;
      int v28 = 4713;
      _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    int v15 = 260;
  }

  return v15;
}

- (id)pathForAlternateFDRClass:(id)a3
{
  return (id)[NSString stringWithFormat:@"%s/%@.%s", "/var/mobile/Documents/Pearl", a3, "bin"];
}

- (id)getFDRClassFromFile:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v3 = [(BiometricKitXPCServerPearl *)self pathForAlternateFDRClass:a3];
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  int v5 = (void *)v4;
  if (__osLog) {
    int v6 = __osLog;
  }
  else {
    int v6 = MEMORY[0x263EF8438];
  }
  if (v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v12 = 138412290;
    int v13 = v3;
    int v7 = "Loaded FDR data from file: %@\n";
    __int16 v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136316162;
    int v13 = "returnData";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    uint64_t v17 = &unk_222DFB9BF;
    __int16 v18 = 2080;
    int v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v20 = 1024;
    int v21 = 4751;
    int v7 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
    __int16 v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 48;
LABEL_7:
    _os_log_impl(&dword_222D7E000, v8, v9, v7, (uint8_t *)&v12, v10);
  }
LABEL_8:

  return v5;
}

- (id)getFDRClassFromFDR:(unsigned __int16)a3 withOptions:(id)a4 withError:(id *)a5
{
  uint64_t v6 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  os_log_type_t v9 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    uint32_t v10 = __osLogTrace;
  }
  else {
    uint32_t v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v27 = v6;
    *(_WORD *)&uint8_t v27[4] = 2112;
    *(void *)&v27[6] = v8;
    *(_WORD *)&v27[14] = 2048;
    *(void *)&v27[16] = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "getFDRClassFromFDR:withOptions:withError: %d %@ %p\n", buf, 0x1Cu);
  }
  int v11 = [(id)objc_opt_class() platformProvidesPlCl];
  int v12 = 0;
  if (v6 <= 0xF && ((1 << v6) & 0xA0E5) != 0)
  {
    if (v11)
    {
      [(BiometricKitXPCServerPearl *)self classStringForEnum:18];
      uint64_t v13 = AMFDRSealingMapCopyLocalDictForClass();
      if (!v13)
      {
        if (__osLog) {
          __int16 v25 = __osLog;
        }
        else {
          __int16 v25 = v9;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)__int16 v27 = "fdrDictionary";
          *(_WORD *)&v27[8] = 2048;
          *(void *)&v27[10] = 0;
          *(_WORD *)&v27[18] = 2080;
          *(void *)&v27[20] = &unk_222DFB9BF;
          __int16 v28 = 2080;
          uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v30 = 1024;
          int v31 = 4791;
          _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        int v12 = 0;
        goto LABEL_56;
      }
      int v12 = (void *)v13;
    }
    else
    {
      int v12 = 0;
    }
  }
  uint64_t v14 = [(BiometricKitXPCServerPearl *)self classStringForEnum:v6];
  if (!v14)
  {
    if (__osLog) {
      __int16 v23 = __osLog;
    }
    else {
      __int16 v23 = v9;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v27 = "classString";
      *(_WORD *)&v27[8] = 2048;
      *(void *)&v27[10] = 0;
      *(_WORD *)&v27[18] = 2080;
      *(void *)&v27[20] = &unk_222DFB9BF;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v30 = 1024;
      int v31 = 4801;
      _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_56:
    uint64_t v15 = 0;
LABEL_57:
    id v18 = 0;
    __int16 v16 = 0;
    *a5 = v18;
LABEL_18:
    if (__osLogTrace) {
      int v19 = __osLogTrace;
    }
    else {
      int v19 = v9;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)__int16 v27 = v16;
      *(_WORD *)&v27[8] = 2112;
      *(void *)&v27[10] = v18;
      _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "getFDRClassFromFDR:withOptions:withError: -> %p (%@)\n", buf, 0x16u);
    }
    goto LABEL_35;
  }
  uint64_t v15 = (void *)v14;
  if (v12)
  {
    __int16 v16 = [v12 objectForKeyedSubscript:v14];
    if (v16) {
      goto LABEL_15;
    }
LABEL_24:
    if (__osLog) {
      __int16 v20 = __osLog;
    }
    else {
      __int16 v20 = v9;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v27 = "fdrData";
      *(_WORD *)&v27[8] = 2048;
      *(void *)&v27[10] = 0;
      *(_WORD *)&v27[18] = 2080;
      *(void *)&v27[20] = &unk_222DFB9BF;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v30 = 1024;
      int v31 = 4815;
      _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_57;
  }
  __int16 v16 = (void *)AMFDRSealingMapCopyLocalDataForClass();

  if (!v16) {
    goto LABEL_24;
  }
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = v9;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v27 = "[fdrData isKindOfClass:[NSData class]]";
      *(_WORD *)&v27[8] = 2048;
      *(void *)&v27[10] = 0;
      *(_WORD *)&v27[18] = 2080;
      *(void *)&v27[20] = &unk_222DFB9BF;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v30 = 1024;
      int v31 = 4816;
      _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    goto LABEL_57;
  }
  id v17 = 0;
  *a5 = v17;
  if (v17)
  {
    id v18 = v17;
    goto LABEL_18;
  }
  if (__osLogTrace) {
    int v21 = __osLogTrace;
  }
  else {
    int v21 = v9;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)__int16 v27 = v16;
    *(_WORD *)&v27[8] = 2112;
    *(void *)&v27[10] = 0;
    _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_DEBUG, "getFDRClassFromFDR:withOptions:withError: -> %p (%@)\n", buf, 0x16u);
  }
  id v18 = 0;
LABEL_35:

  return v16;
}

- (id)getFDRClassFromFDR:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v29[2] = *MEMORY[0x263EF8340];
  int v5 = (void *)MEMORY[0x263EFF9A0];
  v28[0] = @"GetCombined";
  v28[1] = @"StripImg4";
  v29[0] = MEMORY[0x263EFFA88];
  v29[1] = MEMORY[0x263EFFA80];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  int v7 = [v5 dictionaryWithDictionary:v6];

  if (isInternalBuild()) {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"APTicketAllowUntrusted"];
  }
  id v17 = 0;
  id v8 = [(BiometricKitXPCServerPearl *)self getFDRClassFromFDR:v3 withOptions:v7 withError:&v17];
  id v9 = v17;
  uint32_t v10 = MEMORY[0x263EF8438];
  if (__osLog) {
    int v11 = __osLog;
  }
  else {
    int v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = v11;
    uint64_t v13 = [(BiometricKitXPCServerPearl *)self classStringForEnum:v3];
    *(_DWORD *)buf = 138412546;
    int v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEFAULT, "Loading FDR: Class: %@ -> %@\n", buf, 0x16u);
  }
  if (!v8)
  {
    if (__osLog) {
      __int16 v16 = __osLog;
    }
    else {
      __int16 v16 = v10;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136316162;
    int v19 = "tmpData";
    __int16 v20 = 2048;
    id v21 = 0;
    __int16 v22 = 2080;
    __int16 v23 = &unk_222DFB9BF;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v26 = 1024;
    int v27 = 4847;
    goto LABEL_25;
  }
  if (!v9 || [(BiometricKitXPCServerPearl *)self hasFDREntitlement])
  {
    id v14 = v8;
    goto LABEL_12;
  }
  if (__osLog) {
    __int16 v16 = __osLog;
  }
  else {
    __int16 v16 = v10;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    int v19 = "[self hasFDREntitlement]";
    __int16 v20 = 2048;
    id v21 = 0;
    __int16 v22 = 2080;
    __int16 v23 = &unk_222DFB9BF;
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v26 = 1024;
    int v27 = 4852;
LABEL_25:
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_26:
  id v14 = 0;
LABEL_12:

  return v14;
}

- (int)loadFDRClass:(unsigned __int16)a3 alternative:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v7 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
  id v8 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v9 = __osLogTrace;
  }
  else {
    id v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 67109376;
    *(_DWORD *)int v27 = v5;
    *(_WORD *)&uint8_t v27[4] = 1024;
    *(_DWORD *)&v27[6] = v4;
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "loadFDRClass:alternative: %d %d\n", (uint8_t *)&v26, 0xEu);
  }
  uint32_t v10 = [&unk_26D5C0FC0 arrayByAddingObject:&unk_26D5C11B8];
  if (v5 >= 0x13)
  {
    if (__osLog) {
      __int16 v23 = __osLog;
    }
    else {
      __int16 v23 = v8;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136316162;
      *(void *)int v27 = "class >= kPearlFDRClassStart && class < kPearlFDRClassCount";
      *(_WORD *)&v27[8] = 2048;
      *(void *)__int16 v28 = 0;
      *(_WORD *)&v28[8] = 2080;
      uint64_t v29 = &unk_222DFB9BF;
      __int16 v30 = 2080;
      int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v32 = 1024;
      int v33 = 4880;
      _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
    }
    id v14 = 0;
    uint64_t v13 = 0;
    int v19 = 258;
    goto LABEL_54;
  }
  uint64_t v11 = [(BiometricKitXPCServerPearl *)self classStringForEnum:v5];
  if (__osLog) {
    int v12 = __osLog;
  }
  else {
    int v12 = v8;
  }
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136316162;
      *(void *)int v27 = "classString";
      *(_WORD *)&v27[8] = 2048;
      *(void *)__int16 v28 = 0;
      *(_WORD *)&v28[8] = 2080;
      uint64_t v29 = &unk_222DFB9BF;
      __int16 v30 = 2080;
      int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v32 = 1024;
      int v33 = 4883;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
    }
    id v14 = 0;
    uint64_t v13 = 0;
    goto LABEL_53;
  }
  uint64_t v13 = (void *)v11;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412802;
    *(void *)int v27 = v13;
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)__int16 v28 = v5;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = v4;
    _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEFAULT, "Trying to load %@ (%d) FDR Class, Alternative = %d\n", (uint8_t *)&v26, 0x18u);
  }
  if (v4) {
    [(BiometricKitXPCServerPearl *)self getFDRClassFromFile:v13];
  }
  else {
  id v14 = [(BiometricKitXPCServerPearl *)self getFDRClassFromFDR:v5];
  }
  if (!v14)
  {
    if ([(BiometricKitXPCServerPearl *)self hasFDREntitlement]) {
      goto LABEL_31;
    }
    if (__osLog) {
      __int16 v24 = __osLog;
    }
    else {
      __int16 v24 = v8;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136316162;
      *(void *)int v27 = "[self hasFDREntitlement]";
      *(_WORD *)&v27[8] = 2048;
      *(void *)__int16 v28 = 0;
      *(_WORD *)&v28[8] = 2080;
      uint64_t v29 = &unk_222DFB9BF;
      __int16 v30 = 2080;
      int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v32 = 1024;
      int v33 = 4900;
      _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
    }
    id v14 = 0;
LABEL_53:
    int v19 = 261;
LABEL_54:
    if (v7[8].superclass) {
      superclass = v7[8].superclass;
    }
    else {
      superclass = v8;
    }
    if (os_log_type_enabled(superclass, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109120;
      *(_DWORD *)int v27 = v19;
      _os_log_impl(&dword_222D7E000, superclass, OS_LOG_TYPE_ERROR, "loadFDRClass -> %{errno}d\n", (uint8_t *)&v26, 8u);
    }
    goto LABEL_37;
  }
  uint64_t v15 = [NSNumber numberWithUnsignedShort:v5];
  int v16 = [v10 containsObject:v15];

  if (v16)
  {
    if (__osLog) {
      id v17 = __osLog;
    }
    else {
      id v17 = v8;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412546;
      *(void *)int v27 = v13;
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)__int16 v28 = v5;
      _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_DEFAULT, "Sending class %@ (%d) to SPRL\n", (uint8_t *)&v26, 0x12u);
    }
    int v18 = [(BiometricKitXPCServerPearl *)self loadFDRClassCommand:3 withClass:v5 withData:v14 isAlternative:v4];
    if (v18)
    {
      int v19 = v18;
      if (__osLog) {
        __int16 v20 = __osLog;
      }
      else {
        __int16 v20 = v8;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136316162;
        *(void *)int v27 = "err == 0 ";
        *(_WORD *)&v27[8] = 2048;
        *(void *)__int16 v28 = v19;
        *(_WORD *)&v28[8] = 2080;
        uint64_t v29 = &unk_222DFB9BF;
        __int16 v30 = 2080;
        int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v32 = 1024;
        int v33 = 4908;
        _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
      }
      int v7 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
      goto LABEL_54;
    }
  }
LABEL_31:
  if (__osLogTrace) {
    id v21 = __osLogTrace;
  }
  else {
    id v21 = v8;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 67109120;
    *(_DWORD *)int v27 = 0;
    _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_DEBUG, "loadFDRClass -> %{errno}d\n", (uint8_t *)&v26, 8u);
  }
  int v19 = 0;
LABEL_37:

  return v19;
}

- (int)loadFDRCalibrationData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v5 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
  uint64_t v6 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v7 = __osLogTrace;
  }
  else {
    int v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEBUG, "loadFDRCalibrationData\n", buf, 2u);
  }
  int v57 = 0;
  memset(v56, 0, 23);
  id v8 = (void *)MEMORY[0x223CA8CA0]();
  int v9 = [(BiometricKitXPCServerPearl *)self getSPRLInfo:&v57];
  if (v9)
  {
    int v12 = v9;
    if (__osLog) {
      int v31 = __osLog;
    }
    else {
      int v31 = v6;
    }
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    uint64_t v61 = v12;
    __int16 v62 = 2080;
    long long v63 = &unk_222DFB9BF;
    __int16 v64 = 2080;
    long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v66 = 1024;
    int v67 = 4933;
    goto LABEL_115;
  }
  int v10 = [(BiometricKitXPCServerPearl *)self performGetBiometrickitdInfoCommand:v56];
  if (v10)
  {
    int v12 = v10;
    if (__osLog) {
      int v31 = __osLog;
    }
    else {
      int v31 = v6;
    }
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    uint64_t v61 = v12;
    __int16 v62 = 2080;
    long long v63 = &unk_222DFB9BF;
    __int16 v64 = 2080;
    long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v66 = 1024;
    int v67 = 4936;
    goto LABEL_115;
  }
  if ((_BYTE)v57 && BYTE6(v56[2]))
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = v6;
    }
    int v12 = 0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEFAULT, "FDR Data already loaded.\n", buf, 2u);
      int v12 = 0;
    }
    goto LABEL_68;
  }
  int v13 = [(id)objc_opt_class() getChipID];
  int v14 = [(id)objc_opt_class() getBoardID];
  if (!v13 || !v14)
  {
    if (__osLog) {
      long long v45 = __osLog;
    }
    else {
      long long v45 = v6;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      long long v59 = "chipID && boardID";
      __int16 v60 = 2048;
      uint64_t v61 = 0;
      __int16 v62 = 2080;
      long long v63 = &unk_222DFB9BF;
      __int16 v64 = 2080;
      long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v66 = 1024;
      int v67 = 4943;
      _os_log_impl(&dword_222D7E000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v12 = 261;
    goto LABEL_68;
  }
  int v15 = [(id)objc_opt_class() platformProvidesPlCl];
  int v16 = [(BiometricKitXPCServerPearl *)self loadFDRClassCommand:1 withClass:0 withData:0 isAlternative:0];
  if (v16)
  {
    int v12 = v16;
    if (__osLog) {
      int v31 = __osLog;
    }
    else {
      int v31 = v6;
    }
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    uint64_t v61 = v12;
    __int16 v62 = 2080;
    long long v63 = &unk_222DFB9BF;
    __int16 v64 = 2080;
    long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v66 = 1024;
    int v67 = 4949;
    goto LABEL_115;
  }
  long long v55 = v8;
  int v17 = 0;
  unsigned int v18 = v13 - 32800;
  while (2)
  {
    switch(v17)
    {
      case 0:
      case 2:
      case 5:
      case 6:
      case 7:
      case 13:
      case 15:
        if (!v15) {
          goto LABEL_37;
        }
        if (__osLog) {
          int v19 = __osLog;
        }
        else {
          int v19 = v6;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v20 = v19;
          id v21 = [(BiometricKitXPCServerPearl *)self classStringForEnum:(unsigned __int16)v17];
          *(_DWORD *)buf = 138412546;
          long long v59 = v21;
          __int16 v60 = 1024;
          LODWORD(v61) = v17;
          _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_DEFAULT, "Skipping legacy FDR Class: %@ (%d)\n", buf, 0x12u);

          uint64_t v6 = MEMORY[0x263EF8438];
        }
        goto LABEL_38;
      case 1:
      case 3:
      case 4:
      case 17:
        goto LABEL_38;
      case 8:
      case 10:
      case 11:
        if (v18 > 0x10 || ((1 << v18) & 0x10081) == 0) {
          goto LABEL_38;
        }
        goto LABEL_37;
      case 12:
        if ([(id)objc_opt_class() platformProvidesPSD3]) {
          goto LABEL_38;
        }
        goto LABEL_37;
      case 14:
        if ((v13 - 32800) <= 0x10 && ((1 << (v13 - 32)) & 0x10081) != 0
          || v13 == 33025 && ![(id)objc_opt_class() getSkipBane])
        {
          goto LABEL_37;
        }
        goto LABEL_38;
      case 18:
        if (v15) {
          goto LABEL_37;
        }
        goto LABEL_39;
      default:
LABEL_37:
        int v22 = [(BiometricKitXPCServerPearl *)self loadFDRClass:(unsigned __int16)v17 alternative:v3];
        if (!v22)
        {
LABEL_38:
          if (++v17 == 19)
          {
LABEL_39:
            uint64_t v5 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
            id v8 = v55;
            if (![(id)objc_opt_class() platformProvidesPSD3]) {
              goto LABEL_62;
            }
            if (v3)
            {
              __int16 v23 = [(BiometricKitXPCServerPearl *)self classStringForEnum:17];
              __int16 v24 = [(BiometricKitXPCServerPearl *)self pathForAlternateFDRClass:v23];

              __int16 v25 = [NSURL fileURLWithPath:v24];
              int v26 = [v25 checkResourceIsReachableAndReturnError:0];

              if (v26)
              {
                int v27 = [(BiometricKitXPCServerPearl *)self loadFDRClass:17 alternative:1];
                if (v27)
                {
                  int v12 = v27;
                  if (__osLog) {
                    __int16 v28 = __osLog;
                  }
                  else {
                    __int16 v28 = v6;
                  }
                  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_148;
                  }
                  *(_DWORD *)buf = 136316162;
                  long long v59 = "err == 0 ";
                  __int16 v60 = 2048;
                  uint64_t v61 = v12;
                  __int16 v62 = 2080;
                  long long v63 = &unk_222DFB9BF;
                  __int16 v64 = 2080;
                  long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v66 = 1024;
                  int v67 = 5050;
LABEL_147:
                  _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_148:

LABEL_149:
                  uint64_t v6 = MEMORY[0x263EF8438];
                  goto LABEL_88;
                }
              }
              else
              {
                if (__osLog) {
                  __int16 v32 = __osLog;
                }
                else {
                  __int16 v32 = v6;
                }
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_222D7E000, v32, OS_LOG_TYPE_DEFAULT, "Alternative PSD3 not found, trying fallback solution - PSD2\n", buf, 2u);
                }
                int v33 = [(BiometricKitXPCServerPearl *)self loadFDRClass:12 alternative:1];
                if (v33)
                {
                  int v12 = v33;
                  if (__osLog) {
                    __int16 v28 = __osLog;
                  }
                  else {
                    __int16 v28 = v6;
                  }
                  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_148;
                  }
                  *(_DWORD *)buf = 136316162;
                  long long v59 = "err == 0 ";
                  __int16 v60 = 2048;
                  uint64_t v61 = v12;
                  __int16 v62 = 2080;
                  long long v63 = &unk_222DFB9BF;
                  __int16 v64 = 2080;
                  long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v66 = 1024;
                  int v67 = 5055;
                  goto LABEL_147;
                }
              }

LABEL_62:
              if (__osLog) {
                uint64_t v34 = __osLog;
              }
              else {
                uint64_t v34 = v6;
              }
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_222D7E000, v34, OS_LOG_TYPE_DEFAULT, "All FDR Classes verified\n", buf, 2u);
              }
              int v35 = [(BiometricKitXPCServerPearl *)self loadFDRClassCommand:2 withClass:0 withData:0 isAlternative:0];
              int v12 = 0;
              if (v35)
              {
                int v46 = v35;
                if (__osLog) {
                  long long v47 = __osLog;
                }
                else {
                  long long v47 = v6;
                }
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  long long v59 = "err == 0 ";
                  __int16 v60 = 2048;
                  uint64_t v61 = v46;
                  __int16 v62 = 2080;
                  long long v63 = &unk_222DFB9BF;
                  __int16 v64 = 2080;
                  long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v66 = 1024;
                  int v67 = 5064;
                  _os_log_impl(&dword_222D7E000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
                int v12 = v46;
              }
              goto LABEL_68;
            }
            int v29 = [(BiometricKitXPCServerPearl *)self unwrapBrunorEncryptionKey];
            if (v29)
            {
              int v12 = v29;
              uint64_t v48 = v29;
              if (__osLog) {
                long long v49 = __osLog;
              }
              else {
                long long v49 = v6;
              }
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                long long v59 = "err == 0 ";
                __int16 v60 = 2048;
                uint64_t v61 = v48;
                __int16 v62 = 2080;
                long long v63 = &unk_222DFB9BF;
                __int16 v64 = 2080;
                long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                __int16 v66 = 1024;
                int v67 = 5033;
                _os_log_impl(&dword_222D7E000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              if (v12 != 266 && v12 != 259)
              {
                if (__osLog) {
                  long long v54 = __osLog;
                }
                else {
                  long long v54 = MEMORY[0x263EF8438];
                }
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  long long v59 = "err == 0 ";
                  __int16 v60 = 2048;
                  uint64_t v61 = v48;
                  __int16 v62 = 2080;
                  long long v63 = &unk_222DFB9BF;
                  __int16 v64 = 2080;
                  long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v66 = 1024;
                  int v67 = 5044;
                  _os_log_impl(&dword_222D7E000, v54, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
                goto LABEL_149;
              }
              if (__osLog) {
                long long v50 = __osLog;
              }
              else {
                long long v50 = MEMORY[0x263EF8438];
              }
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                long long v51 = "PSD3 not found";
                if (v12 == 266) {
                  long long v51 = "Unsupported PSD3";
                }
                *(_DWORD *)buf = 136315138;
                long long v59 = v51;
                _os_log_impl(&dword_222D7E000, v50, OS_LOG_TYPE_DEFAULT, "%s, trying fallback solution - PSD2\n", buf, 0xCu);
              }
              int v52 = [(BiometricKitXPCServerPearl *)self loadFDRClass:12 alternative:0];
              uint64_t v6 = MEMORY[0x263EF8438];
              id v8 = v55;
              if (v52)
              {
                int v12 = v52;
                if (__osLog) {
                  long long v53 = __osLog;
                }
                else {
                  long long v53 = MEMORY[0x263EF8438];
                }
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  long long v59 = "err == 0 ";
                  __int16 v60 = 2048;
                  uint64_t v61 = v12;
                  __int16 v62 = 2080;
                  long long v63 = &unk_222DFB9BF;
                  __int16 v64 = 2080;
                  long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v66 = 1024;
                  int v67 = 5042;
                  _os_log_impl(&dword_222D7E000, v53, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
                goto LABEL_88;
              }
              goto LABEL_62;
            }
            int v30 = [(BiometricKitXPCServerPearl *)self loadFDRClass:17 alternative:0];
            if (!v30) {
              goto LABEL_62;
            }
            int v12 = v30;
            if (__osLog) {
              int v31 = __osLog;
            }
            else {
              int v31 = v6;
            }
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              goto LABEL_68;
            }
            *(_DWORD *)buf = 136316162;
            long long v59 = "err == 0 ";
            __int16 v60 = 2048;
            uint64_t v61 = v12;
            __int16 v62 = 2080;
            long long v63 = &unk_222DFB9BF;
            __int16 v64 = 2080;
            long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v66 = 1024;
            int v67 = 5036;
LABEL_115:
            _os_log_impl(&dword_222D7E000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            goto LABEL_68;
          }
          continue;
        }
        int v12 = v22;
        if (__osLog) {
          int v42 = __osLog;
        }
        else {
          int v42 = v6;
        }
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          long long v59 = "err == 0 ";
          __int16 v60 = 2048;
          uint64_t v61 = v12;
          __int16 v62 = 2080;
          long long v63 = &unk_222DFB9BF;
          __int16 v64 = 2080;
          long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v66 = 1024;
          int v67 = 5023;
          _os_log_impl(&dword_222D7E000, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v5 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
LABEL_88:
        id v8 = v55;
LABEL_68:
        int v36 = [(BiometricKitXPCServerPearl *)self sendFDRDataCheckResult:v12 == 0];
        if (v36)
        {
          int v43 = v36;
          long long v44 = (__osLog ? __osLog : v6);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            long long v59 = "[self sendFDRDataCheckResult:(err == kPearlErrorSuccess)] == 0 ";
            __int16 v60 = 2048;
            uint64_t v61 = v43;
            __int16 v62 = 2080;
            long long v63 = &unk_222DFB9BF;
            __int16 v64 = 2080;
            long long v65 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v66 = 1024;
            int v67 = 5075;
            _os_log_impl(&dword_222D7E000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        if (v12)
        {
          [(id)objc_opt_class() reportPearlIssue];
          if (v5[8].superclass) {
            superclass = v5[8].superclass;
          }
          else {
            superclass = v6;
          }
          if (os_log_type_enabled(superclass, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v59) = v12;
            int v38 = superclass;
            os_log_type_t v39 = OS_LOG_TYPE_ERROR;
            goto LABEL_80;
          }
        }
        else
        {
          if (v5[8].superclass) {
            int v40 = v5[8].superclass;
          }
          else {
            int v40 = v6;
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v59) = 0;
            int v38 = v40;
            os_log_type_t v39 = OS_LOG_TYPE_DEBUG;
LABEL_80:
            _os_log_impl(&dword_222D7E000, v38, v39, "loadFDRCalibrationData -> 0x%x\n", buf, 8u);
          }
        }
        return v12;
    }
  }
}

- (int)loadPCECalibrationOverride:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "loadPCECalibrationOverride\n", (uint8_t *)&v15, 2u);
  }
  if (v4)
  {
    id v7 = v4;
    int v8 = [-[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 34, 0, [v7 bytes], [v7 length], 0, 0);
    if (!v8)
    {
      if (__osLogTrace) {
        int v9 = __osLogTrace;
      }
      else {
        int v9 = v5;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 67109120;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "loadPCECalibrationOverride -> %{errno}d\n", (uint8_t *)&v15, 8u);
      }
      int v10 = 0;
      goto LABEL_14;
    }
    int v10 = v8;
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 5099;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "data";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 5096;
      _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int v10 = 258;
  }
  if (__osLogTrace) {
    int v14 = __osLogTrace;
  }
  else {
    int v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = 67109120;
    LODWORD(v16) = v10;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "loadPCECalibrationOverride -> %{errno}d\n", (uint8_t *)&v15, 8u);
  }
LABEL_14:

  return v10;
}

- (int)unwrapBrunorEncryptionKey
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    BOOL v3 = __osLogTrace;
  }
  else {
    BOOL v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "unwrapBrunorEncryptionKey\n", buf, 2u);
  }
  id v26 = 0;
  id v4 = [(BiometricKitXPCServerPearl *)self getFDRClassFromFDR:17 withOptions:0 withError:&v26];
  id v5 = v26;
  if (!v4)
  {
    if (__osLog) {
      __int16 v21 = __osLog;
    }
    else {
      __int16 v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v28 = "psd3Data";
      __int16 v29 = 2048;
      *(void *)int v30 = 0;
      *(_WORD *)&v30[8] = 2080;
      *(void *)&v30[10] = &unk_222DFB9BF;
      __int16 v31 = 2080;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v33 = 1024;
      int v34 = 5123;
      _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v12 = 259;
    goto LABEL_37;
  }
  if ((unint64_t)[v4 length] <= 0x5B)
  {
    if (__osLog) {
      int v22 = __osLog;
    }
    else {
      int v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v28 = "psd3Data.length >= sizeof(*psd3)";
      __int16 v29 = 2048;
      *(void *)int v30 = 0;
      *(_WORD *)&v30[8] = 2080;
      *(void *)&v30[10] = &unk_222DFB9BF;
      __int16 v31 = 2080;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v33 = 1024;
      int v34 = 5124;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v12 = 258;
    goto LABEL_37;
  }
  if (v5)
  {
    if (__osLog) {
      __int16 v23 = __osLog;
    }
    else {
      __int16 v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v28 = "!error";
      __int16 v29 = 2048;
      *(void *)int v30 = 0;
      *(_WORD *)&v30[8] = 2080;
      *(void *)&v30[10] = &unk_222DFB9BF;
      __int16 v31 = 2080;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v33 = 1024;
      int v34 = 5125;
      _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v12 = 261;
    goto LABEL_37;
  }
  int v24 = 0;
  uint64_t v25 = v4;
  useconds_t v6 = 1000000;
  uint64_t v7 = [v4 bytes];
  int v8 = 0;
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  int v12 = 263;
  while (1)
  {
    if (v11 || v10 || v9)
    {
      if (__osLog) {
        int v13 = __osLog;
      }
      else {
        int v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = "unknown reason";
        if (v8) {
          int v14 = v8;
        }
        *(_DWORD *)buf = 136315650;
        __int16 v28 = v14;
        __int16 v29 = 1024;
        *(_DWORD *)int v30 = v12;
        *(_WORD *)&v30[4] = 2048;
        *(double *)&v30[6] = (double)v6 / 1000000.0;
        _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_DEFAULT, "FDR encryption key unwrapping failed due to %s (%d). Retrying after %.2fs.\n", buf, 0x1Cu);
      }
      usleep(v6);
    }
    int v15 = -[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 81, 0, v7, 92, 0, 0, v24);
    int v12 = v15;
    if (v15 != 264) {
      break;
    }
    ++v9;
    useconds_t v6 = 1000000;
    int v8 = "camera response timeout";
LABEL_27:
    if (v11 > 0x78 || v10 > 0x3C || v9 >= 6)
    {
      uint64_t v16 = v15;
      goto LABEL_31;
    }
  }
  if (v15 == 17)
  {
    ++v10;
    useconds_t v6 = 1000000;
    int v8 = "camera error";
    goto LABEL_27;
  }
  if (v15 == 16)
  {
    ++v11;
    useconds_t v6 = 500000;
    int v8 = "camera being busy";
    goto LABEL_27;
  }
  id v5 = v24;
  id v4 = v25;
  if (!v15) {
    goto LABEL_43;
  }
  uint64_t v16 = v15;
LABEL_31:
  if (__osLog) {
    __int16 v17 = __osLog;
  }
  else {
    __int16 v17 = MEMORY[0x263EF8438];
  }
  id v5 = v24;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v28 = "err == 0 ";
    __int16 v29 = 2048;
    *(void *)int v30 = v16;
    *(_WORD *)&v30[8] = 2080;
    *(void *)&v30[10] = &unk_222DFB9BF;
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v33 = 1024;
    int v34 = 5162;
    _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  id v4 = v25;
  if (!v12)
  {
LABEL_43:
    if (__osLogTrace) {
      __int16 v19 = __osLogTrace;
    }
    else {
      __int16 v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = 0;
      _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_DEBUG, "unwrapBrunorEncryptionKey -> 0x%x\n", buf, 8u);
    }
    int v12 = 0;
    goto LABEL_49;
  }
LABEL_37:
  if (__osLogTrace) {
    uint64_t v18 = __osLogTrace;
  }
  else {
    uint64_t v18 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v12;
    _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "unwrapBrunorEncryptionKey -> 0x%x\n", buf, 8u);
  }
LABEL_49:

  return v12;
}

- (void)loadCalibrationData
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  BOOL v3 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
  uint64_t v4 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v5 = __osLogTrace;
  }
  else {
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEBUG, "loadCalibrationData\n", buf, 2u);
  }
  useconds_t v6 = (void *)os_transaction_create();
  uint64_t v7 = getBootArgs();
  int v8 = v7;
  if (!v7) {
    goto LABEL_28;
  }
  unint64_t v9 = [v7 componentsSeparatedByString:@" "];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (!v10)
  {

    goto LABEL_28;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v45;
  uint64_t v13 = 1;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v45 != v12) {
        objc_enumerationMutation(v9);
      }
      int v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      [v15 rangeOfString:@"pearl-use-fdr"];
      if (v16)
      {
        __int16 v17 = [v15 substringFromIndex:[v15 length] - 1];
        uint64_t v13 = [v17 integerValue];
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v58 count:16];
  }
  while (v11);

  BOOL v3 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
  uint64_t v4 = MEMORY[0x263EF8438];
  if (v13)
  {
LABEL_28:
    int v24 = [(BiometricKitXPCServerPearl *)self classStringForEnum:12];
    uint64_t v18 = [(BiometricKitXPCServerPearl *)self pathForAlternateFDRClass:v24];

    uint64_t v25 = [NSURL fileURLWithPath:v18];
    char v26 = [v25 checkResourceIsReachableAndReturnError:0];

    int v27 = [(BiometricKitXPCServerPearl *)self classStringForEnum:17];
    __int16 v28 = [(BiometricKitXPCServerPearl *)self pathForAlternateFDRClass:v27];

    if (v26)
    {
      char v29 = 0;
    }
    else
    {
      int v30 = [NSURL fileURLWithPath:v28];
      char v31 = [v30 checkResourceIsReachableAndReturnError:0];

      char v29 = v31 ^ 1;
    }
    if (!isInternalBuild() || (v29 & 1) != 0)
    {
      int v35 = [(BiometricKitXPCServerPearl *)self loadFDRCalibrationData:0];
      if (!v35) {
        goto LABEL_40;
      }
      int v40 = v35;
      int v34 = (__osLog ? __osLog : v4);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136316162;
      long long v49 = "[self loadFDRCalibrationData:0] == 0 ";
      __int16 v50 = 2048;
      uint64_t v51 = v40;
      __int16 v52 = 2080;
      long long v53 = &unk_222DFB9BF;
      __int16 v54 = 2080;
      long long v55 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v56 = 1024;
      int v57 = 5241;
    }
    else
    {
      int v32 = [(BiometricKitXPCServerPearl *)self loadFDRCalibrationData:1];
      if (!v32) {
        goto LABEL_40;
      }
      int v33 = v32;
      int v34 = (__osLog ? __osLog : v4);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 136316162;
      long long v49 = "[self loadFDRCalibrationData:1] == 0 ";
      __int16 v50 = 2048;
      uint64_t v51 = v33;
      __int16 v52 = 2080;
      long long v53 = &unk_222DFB9BF;
      __int16 v54 = 2080;
      long long v55 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v56 = 1024;
      int v57 = 5236;
    }
    _os_log_impl(&dword_222D7E000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_40:
    int v36 = [(BiometricKitXPCServerPearl *)self verifyProjectorSerialNumber];
    if (v36)
    {
      int v38 = v36;
      os_log_type_t v39 = (__osLog ? __osLog : v4);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        long long v49 = "[self verifyProjectorSerialNumber] == 0 ";
        __int16 v50 = 2048;
        uint64_t v51 = v38;
        __int16 v52 = 2080;
        long long v53 = &unk_222DFB9BF;
        __int16 v54 = 2080;
        long long v55 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v56 = 1024;
        int v57 = 5245;
        _os_log_impl(&dword_222D7E000, v39, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }

    goto LABEL_42;
  }
  if (!isInternalBuild()) {
    goto LABEL_43;
  }
  uint64_t v18 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:@"/var/mobile/Library/ISP/Pearl/PCECalib.bin"];
  if (v18)
  {
    int v19 = [(BiometricKitXPCServerPearl *)self loadPCECalibrationOverride:v18];
    if (v19)
    {
      int v41 = v19;
      if (__osLog) {
        __int16 v23 = __osLog;
      }
      else {
        __int16 v23 = v4;
      }
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      *(_DWORD *)buf = 136316162;
      long long v49 = "err == 0 ";
      __int16 v50 = 2048;
      uint64_t v51 = v41;
      __int16 v52 = 2080;
      long long v53 = &unk_222DFB9BF;
      __int16 v54 = 2080;
      long long v55 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v56 = 1024;
      int v57 = 5211;
    }
    else
    {
      int v20 = [(BiometricKitXPCServerPearl *)self sendFDRDataCheckResult:1];
      if (v20)
      {
        int v42 = v20;
        int v43 = (__osLog ? __osLog : v4);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          long long v49 = "[self sendFDRDataCheckResult:kBoolTrue] == 0 ";
          __int16 v50 = 2048;
          uint64_t v51 = v42;
          __int16 v52 = 2080;
          long long v53 = &unk_222DFB9BF;
          __int16 v54 = 2080;
          long long v55 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v56 = 1024;
          int v57 = 5214;
          _os_log_impl(&dword_222D7E000, v43, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      int v21 = [(BiometricKitXPCServerPearl *)self sendRomeoSNCheckResult:1];
      if (!v21) {
        goto LABEL_42;
      }
      int v22 = v21;
      __int16 v23 = (__osLog ? __osLog : v4);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      *(_DWORD *)buf = 136316162;
      long long v49 = "[self sendRomeoSNCheckResult:kBoolTrue] == 0 ";
      __int16 v50 = 2048;
      uint64_t v51 = v22;
      __int16 v52 = 2080;
      long long v53 = &unk_222DFB9BF;
      __int16 v54 = 2080;
      long long v55 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v56 = 1024;
      int v57 = 5215;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v23 = __osLog;
    }
    else {
      __int16 v23 = v4;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_DWORD *)buf = 136316162;
    long long v49 = "override";
    __int16 v50 = 2048;
    uint64_t v51 = 0;
    __int16 v52 = 2080;
    long long v53 = &unk_222DFB9BF;
    __int16 v54 = 2080;
    long long v55 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v56 = 1024;
    int v57 = 5208;
  }
  _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_42:

LABEL_43:
  if (v3[8].superclass) {
    superclass = v3[8].superclass;
  }
  else {
    superclass = v4;
  }
  if (os_log_type_enabled(superclass, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, superclass, OS_LOG_TYPE_DEBUG, "loadCalibrationData -> void\n", buf, 2u);
  }
}

- (id)filenameForSavageCertType:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v3 = [a3 unsignedIntValue] - 1;
  if (v3 >= 4)
  {
    if (__osLog) {
      unint64_t v9 = __osLog;
    }
    else {
      unint64_t v9 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v12 = 136316162;
    uint64_t v13 = "0";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    __int16 v17 = &unk_222DFB9BF;
    __int16 v18 = 2080;
    int v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v20 = 1024;
    int v21 = 5272;
    goto LABEL_10;
  }
  uint64_t v4 = off_26466F958[v3];
  id v5 = [MEMORY[0x263F53618] sharedDataAccessor];
  useconds_t v6 = (void *)[v5 copyPathForPersonalizedData:0 error:0];

  if (!v6)
  {
    if (__osLog) {
      unint64_t v9 = __osLog;
    }
    else {
      unint64_t v9 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v12 = 136316162;
    uint64_t v13 = "path";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    __int16 v17 = &unk_222DFB9BF;
    __int16 v18 = 2080;
    int v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v20 = 1024;
    int v21 = 5277;
LABEL_10:
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
LABEL_11:
    int v8 = 0;
    useconds_t v6 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = [v6 stringByAppendingPathComponent:v4];
  if (v7)
  {
    int v8 = (void *)v7;
  }
  else
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      uint64_t v13 = "filename";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      __int16 v17 = &unk_222DFB9BF;
      __int16 v18 = 2080;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v20 = 1024;
      int v21 = 5280;
      _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    int v8 = 0;
  }
LABEL_12:

  return v8;
}

- (int)loadSavageFWCertificate
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unsigned int v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "loadSavageFWCertificate\n", buf, 2u);
  }
  int v31 = 0;
  int v5 = [(BiometricKitXPCServerPearl *)self getSPRLInfo:&v31];
  if (v5)
  {
    int v7 = v5;
    if (__osLog) {
      char v26 = __osLog;
    }
    else {
      char v26 = v3;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "err == 0 ";
      __int16 v34 = 2048;
      uint64_t v35 = v7;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5298;
      _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_52:
    if (__osLogTrace) {
      uint64_t v25 = __osLogTrace;
    }
    else {
      uint64_t v25 = v3;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "loadSavageFWCertificate -> %{errno}d\n", buf, 8u);
    }
    return v7;
  }
  if (HIBYTE(v31)) {
    goto LABEL_8;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [&unk_26D5C0FD8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(&unk_26D5C0FD8);
      }
      uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      __int16 v14 = [(BiometricKitXPCServerPearl *)self filenameForSavageCertType:v13];
      if (!v14)
      {
        unsigned int v3 = MEMORY[0x263EF8438];
        if (__osLog) {
          int v21 = __osLog;
        }
        else {
          int v21 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "filename";
          __int16 v34 = 2048;
          uint64_t v35 = 0;
          __int16 v36 = 2080;
          __int16 v37 = &unk_222DFB9BF;
          __int16 v38 = 2080;
          os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v40 = 1024;
          int v41 = 5310;
          _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        int v7 = 261;
        goto LABEL_51;
      }
      uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v14];
      if (!v15)
      {
        unsigned int v3 = MEMORY[0x263EF8438];
        if (__osLog) {
          uint64_t v22 = __osLog;
        }
        else {
          uint64_t v22 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "data";
          __int16 v34 = 2048;
          uint64_t v35 = 0;
          __int16 v36 = 2080;
          __int16 v37 = &unk_222DFB9BF;
          __int16 v38 = 2080;
          os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v40 = 1024;
          int v41 = 5313;
          _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        int v7 = 268;
        goto LABEL_51;
      }
      __int16 v16 = v15;
      size_t v17 = [v15 length] + 8;
      __int16 v18 = malloc_type_malloc(v17, 0xF02872DDuLL);
      if (!v18)
      {
        unsigned int v3 = MEMORY[0x263EF8438];
        if (__osLog) {
          __int16 v23 = __osLog;
        }
        else {
          __int16 v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "inData";
          __int16 v34 = 2048;
          uint64_t v35 = 0;
          __int16 v36 = 2080;
          __int16 v37 = &unk_222DFB9BF;
          __int16 v38 = 2080;
          os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v40 = 1024;
          int v41 = 5317;
          _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        int v7 = 260;
        goto LABEL_51;
      }
      int v19 = v18;
      _DWORD *v18 = [v13 unsignedIntValue];
      v19[1] = [v16 length];
      id v20 = v16;
      memcpy(v19 + 2, (const void *)[v20 bytes], [v20 length]);
      int v7 = [(BiometricKitXPCServerPearl *)self performCommand:47 inValue:0 inData:v19 inSize:v17 outData:0 outSize:0];
      free(v19);
      if (v7)
      {
        unsigned int v3 = MEMORY[0x263EF8438];
        if (__osLog) {
          int v24 = __osLog;
        }
        else {
          int v24 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "err == 0 ";
          __int16 v34 = 2048;
          uint64_t v35 = v7;
          __int16 v36 = 2080;
          __int16 v37 = &unk_222DFB9BF;
          __int16 v38 = 2080;
          os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v40 = 1024;
          int v41 = 5326;
          _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

LABEL_51:
        goto LABEL_52;
      }
    }
    uint64_t v10 = [&unk_26D5C0FD8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_8:
  if (__osLogTrace) {
    useconds_t v6 = __osLogTrace;
  }
  else {
    useconds_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 67109120;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "loadSavageFWCertificate -> %{errno}d\n", buf, 8u);
  }
  return 0;
}

- (void)initializeSprl
{
  [(BiometricKitXPCServerPearl *)self loadSavageFWCertificate];
  [(BiometricKitXPCServerPearl *)self loadCalibrationData];

  [(BiometricKitXPCServerPearl *)self loadDCNKernels];
}

- (id)createEnrollOperation
{
  BOOL v2 = objc_alloc_init(BiometricEnrollOperationPearl);

  return v2;
}

- (int)initEnrollOperation:(id)a3 biometricType:(int)a4 userID:(unsigned int)a5 options:(id)a6 client:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v31 = 0;
  unsigned __int8 v30 = 0;
  if (v12)
  {
    v29.receiver = self;
    v29.super_class = (Class)BiometricKitXPCServerPearl;
    unsigned int v15 = [(BiometricKitXPCServer *)&v29 initEnrollOperation:v12 biometricType:v10 userID:v9 options:v13 client:v14];
    if (v15)
    {
      int v23 = v15;
      if (__osLog) {
        char v26 = __osLog;
      }
      else {
        char v26 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      int v33 = "err == 0 ";
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5373;
    }
    else
    {
      if (!v13)
      {
        uint64_t v22 = 0;
        goto LABEL_12;
      }
      int Integer = dictionaryGetInteger();
      if (!Integer)
      {
        size_t v17 = [v13 objectForKeyedSubscript:@"BKOptionEnrollAugmentedIdentity"];
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (__osLog) {
              long long v28 = __osLog;
            }
            else {
              long long v28 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              int v33 = "[augmentedIdentity isKindOfClass:[BiometricKitIdentity class]]";
              __int16 v34 = 2048;
              uint64_t v35 = 0;
              __int16 v36 = 2080;
              __int16 v37 = &unk_222DFB9BF;
              __int16 v38 = 2080;
              os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
              __int16 v40 = 1024;
              int v41 = 5381;
              _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            int v23 = 258;
            goto LABEL_50;
          }
          int v18 = [v17 userID];
          *(_DWORD *)[v12 augmentedIdentity] = v18;
          int v19 = [v17 uuid];
          [v19 getUUIDBytes:[v12 augmentedIdentity] + 4];
        }
        int Bool = dictionaryGetBool();
        if (Bool)
        {
          int v23 = Bool;
          if (__osLog) {
            long long v27 = __osLog;
          }
          else {
            long long v27 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
          *(_DWORD *)buf = 136316162;
          int v33 = "err == 0 ";
          __int16 v34 = 2048;
          uint64_t v35 = v23;
          __int16 v36 = 2080;
          __int16 v37 = &unk_222DFB9BF;
          __int16 v38 = 2080;
          os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v40 = 1024;
          int v41 = 5387;
        }
        else
        {
          int v21 = dictionaryGetInteger();
          if (!v21)
          {
            [v12 setPeriocularGlassesRequirement:0];

            uint64_t v22 = v31;
LABEL_12:
            [v12 setEnrollmentType:v22];
            [v12 setClientToComplete:v30];
            if (v30) {
              [v12 setProcessedFlags:[v12 processedFlags] | 2];
            }
            int v23 = 0;
            goto LABEL_15;
          }
          int v23 = v21;
          if (__osLog) {
            long long v27 = __osLog;
          }
          else {
            long long v27 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
LABEL_50:

            goto LABEL_15;
          }
          *(_DWORD *)buf = 136316162;
          int v33 = "err == 0 ";
          __int16 v34 = 2048;
          uint64_t v35 = v23;
          __int16 v36 = 2080;
          __int16 v37 = &unk_222DFB9BF;
          __int16 v38 = 2080;
          os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v40 = 1024;
          int v41 = 5392;
        }
        _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        goto LABEL_50;
      }
      int v23 = Integer;
      if (__osLog) {
        char v26 = __osLog;
      }
      else {
        char v26 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      int v33 = "err == 0 ";
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5377;
    }
    _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_15;
  }
  if (__osLog) {
    uint64_t v25 = __osLog;
  }
  else {
    uint64_t v25 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    int v33 = "operation";
    __int16 v34 = 2048;
    uint64_t v35 = 0;
    __int16 v36 = 2080;
    __int16 v37 = &unk_222DFB9BF;
    __int16 v38 = 2080;
    os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v40 = 1024;
    int v41 = 5370;
    _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  int v23 = 258;
LABEL_15:

  return v23;
}

- (int)performEnrollCommand:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  int v32 = 0;
  if (v4)
  {
    v26[0] = [v4 processedFlags];
    v26[1] = [v5 userID];
    _OWORD v26[2] = [v5 enrollmentType];
    uint64_t v6 = [v5 augmentedIdentity];
    int v7 = *(_DWORD *)(v6 + 16);
    long long v27 = *(_OWORD *)v6;
    int v28 = v7;
    uint64_t v8 = [v5 authData];
    uint64_t v9 = *(void *)(v8 + 32);
    long long v10 = *(_OWORD *)(v8 + 16);
    long long v29 = *(_OWORD *)v8;
    long long v30 = v10;
    uint64_t v31 = v9;
    LOBYTE(v32) = [v5 periocularGlassesRequirement];
    int v11 = [(BiometricKitXPCServerPearl *)self performCommand:3 inValue:0 inData:v26 inSize:76 outData:0 outSize:0];
    if (v11)
    {
      int v12 = v11;
      if (__osLog) {
        unsigned int v15 = __osLog;
      }
      else {
        unsigned int v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316162;
        size_t v17 = "err == 0 ";
        __int16 v18 = 2048;
        uint64_t v19 = v12;
        __int16 v20 = 2080;
        int v21 = &unk_222DFB9BF;
        __int16 v22 = 2080;
        int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v24 = 1024;
        int v25 = 5431;
        _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
      }
    }
    else
    {
      if ([MEMORY[0x263F2AAD0] didDisplayPearlGlassesBannerNotificationRecently:180.0]) {
        +[PearlCoreAnalytics sendEnrollPearlGlassesBannerNotificationEvent];
      }
      [(BiometricKitXPCServerPearl *)self checkBioLogConsent];
      int v12 = 0;
    }
  }
  else
  {
    if (__osLog) {
      id v14 = __osLog;
    }
    else {
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      size_t v17 = "operation";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      int v21 = &unk_222DFB9BF;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v24 = 1024;
      int v25 = 5419;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    int v12 = 258;
  }

  return v12;
}

- (id)createMatchOperation
{
  BOOL v2 = objc_alloc_init(BiometricMatchOperationPearl);

  return v2;
}

- (int)initMatchOperation:(id)a3 filter:(id)a4 options:(id)a5 client:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v31 = 0;
  __int16 v30 = 0;
  uint64_t v29 = 0;
  if (!v10)
  {
    if (__osLog) {
      int v25 = __osLog;
    }
    else {
      int v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "operation";
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5467;
      _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_66;
  }
  v28.receiver = self;
  v28.super_class = (Class)BiometricKitXPCServerPearl;
  unsigned int v14 = [(BiometricKitXPCServer *)&v28 initMatchOperation:v10 filter:v11 options:v12 client:v13];
  if (v14)
  {
    int v23 = v14;
    if (__osLog) {
      char v26 = __osLog;
    }
    else {
      char v26 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v33 = "err == 0 ";
    __int16 v34 = 2048;
    uint64_t v35 = v23;
    __int16 v36 = 2080;
    __int16 v37 = &unk_222DFB9BF;
    __int16 v38 = 2080;
    os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v40 = 1024;
    int v41 = 5470;
    goto LABEL_59;
  }
  if (v12)
  {
    int Bool = dictionaryGetBool();
    if (Bool)
    {
      int v23 = Bool;
      if (__osLog) {
        char v26 = __osLog;
      }
      else {
        char v26 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "err == 0 ";
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5474;
      goto LABEL_59;
    }
    int v16 = dictionaryGetBool();
    if (v16)
    {
      int v23 = v16;
      if (__osLog) {
        char v26 = __osLog;
      }
      else {
        char v26 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "err == 0 ";
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5477;
      goto LABEL_59;
    }
    int v17 = dictionaryGetBool();
    if (v17)
    {
      int v23 = v17;
      if (__osLog) {
        char v26 = __osLog;
      }
      else {
        char v26 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "err == 0 ";
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5480;
      goto LABEL_59;
    }
    if (!HIBYTE(v30)) {
      goto LABEL_12;
    }
    __int16 v18 = [v12 objectForKeyedSubscript:@"BKOptionMatchPreAugmentationCheckIdentity"];
    if (!v18)
    {
LABEL_11:

LABEL_12:
      int v21 = dictionaryGetBool();
      if (v21)
      {
        int v23 = v21;
        if (__osLog) {
          char v26 = __osLog;
        }
        else {
          char v26 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v33 = "err == 0 ";
        __int16 v34 = 2048;
        uint64_t v35 = v23;
        __int16 v36 = 2080;
        __int16 v37 = &unk_222DFB9BF;
        __int16 v38 = 2080;
        os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v40 = 1024;
        int v41 = 5493;
      }
      else
      {
        int Integer = dictionaryGetInteger();
        if (!Integer) {
          goto LABEL_14;
        }
        int v23 = Integer;
        if (__osLog) {
          char v26 = __osLog;
        }
        else {
          char v26 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v33 = "err == 0 ";
        __int16 v34 = 2048;
        uint64_t v35 = v23;
        __int16 v36 = 2080;
        __int16 v37 = &unk_222DFB9BF;
        __int16 v38 = 2080;
        os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v40 = 1024;
        int v41 = 5497;
      }
LABEL_59:
      _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v19 = [v18 userID];
      *(_DWORD *)[v10 preAugmentationCheckIdentity] = v19;
      __int16 v20 = [v18 uuid];
      [v20 getUUIDBytes:objc_msgSend(v10, "preAugmentationCheckIdentity") + 4];

      goto LABEL_11;
    }
    if (__osLog) {
      long long v27 = __osLog;
    }
    else {
      long long v27 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "[preAugmentationCheckIdentity isKindOfClass:[BiometricKitIdentity class]]";
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2080;
      __int16 v37 = &unk_222DFB9BF;
      __int16 v38 = 2080;
      os_log_type_t v39 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v40 = 1024;
      int v41 = 5485;
      _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_66:
    int v23 = 258;
    goto LABEL_23;
  }
LABEL_14:
  [v10 setLongTimeout:HIBYTE(v31)];
  [v10 setAutoRetry:v31];
  [v10 setPreAugmentationCheck:HIBYTE(v30)];
  [v10 setFullFaceOnly:v30];
  [v10 setTrigger:v29];
  if (HIBYTE(v31)) {
    [v10 setProcessedFlags:[v10 processedFlags] | 0x800];
  }
  if ((_BYTE)v31) {
    [v10 setProcessedFlags:[v10 processedFlags] | 0x1000];
  }
  if (HIBYTE(v30)) {
    [v10 setProcessedFlags:[v10 processedFlags] | 0x8000];
  }
  if ((_BYTE)v30) {
    [v10 setProcessedFlags:[v10 processedFlags] | 0x10000];
  }
  int v23 = 0;
LABEL_23:

  return v23;
}

- (int)setSecureFaceDetectState:(int)a3 sessionID:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  kdebug_trace();
  LODWORD(v9) = self->_secureFaceDetectRequestFlags;
  WORD2(v9) = *(_WORD *)&self->_lastProcessedNoMetadataObjects;
  [self->_pearlDeviceState logSecureFaceDetectState:v5 :__PAIR64__(v5, a4) :v9];
  return [(BiometricKitXPCServerPearl *)self performCommand:83 inValue:0 inData:&v8 inSize:14 outData:0 outSize:0];
}

- (void)processMetadataObjects:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__osLog) {
    uint64_t v5 = __osLog;
  }
  else {
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v71 = v4;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEFAULT, "processMetadataObjects:%@\n", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  memset(v69, 0, 42);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (!v8)
  {

    LOBYTE(v69[0]) = 1;
    uint64_t v52 = 64;
    goto LABEL_82;
  }
  uint64_t v9 = v8;
  long long v55 = v6;
  int v63 = 0;
  uint64_t v10 = *(void *)v66;
  id v11 = (void *)*MEMORY[0x263EF9F08];
  id v12 = (void *)*MEMORY[0x263EF9F00];
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v66 != v10) {
        objc_enumerationMutation(v7);
      }
      unsigned int v14 = *(void **)(*((void *)&v65 + 1) + 8 * v13);
      unsigned int v15 = [v14 type];

      if (v15 == v11)
      {
        id v21 = v14;
        double v22 = 0.0;
        if ([v21 hasRollAngle])
        {
          [v21 rollAngle];
          double v22 = v23 - *(double *)&self->_secureFaceDetectLastFeedback;
        }
        int avcLock_high = HIDWORD(self->_avcLock);
        if (avcLock_high == 2)
        {
          if ([v21 hasPayingAttention]) {
            v63 |= [v21 payingAttention];
          }
          if ([v21 hasPitchAngle])
          {
            [v21 pitchAngle];
            *(float *)&double v34 = v34;
            *(_DWORD *)((char *)v69 + 13) = LODWORD(v34);
          }
          if ([v21 hasYawAngle])
          {
            [v21 yawAngle];
            *(float *)&double v35 = v35;
            *(_DWORD *)((char *)&v69[1] + 1) = LODWORD(v35);
          }
          if ([v21 hasRollAngle])
          {
            float v36 = v22;
            *(float *)((char *)&v69[1] + 5) = v36;
          }
          if ([v21 hasDistance])
          {
            [v21 distance];
            *(_WORD *)((char *)v69 + 3) = (int)v37;
          }
          if ([v21 hasOrientation])
          {
            uint64_t v38 = [v21 orientation];
            if ((unint64_t)(v38 - 1) < 4) {
              int v39 = v38;
            }
            else {
              int v39 = 0;
            }
            *(_DWORD *)((char *)v69 + 9) = v39;
          }
          if ([v21 hasConfidence])
          {
            [v21 confidence];
            *(float *)&double v40 = v40 * 100.0;
            *(_DWORD *)((char *)&v69[2] + 1) = LODWORD(v40);
          }
          if ([v21 hasPayingAttentionConfidence])
          {
            [v21 payingAttentionConfidence];
            *(float *)&double v41 = v41 * 1000.0;
            *(_DWORD *)((char *)&v69[1] + 13) = LODWORD(v41);
          }
        }
        else if (avcLock_high == 1 {
               && !BYTE1(self->_secureFaceDetectRequest)
        }
               && [v21 hasPitchAngle]
               && [v21 hasYawAngle]
               && [v21 hasRollAngle]
               && [v21 hasDistance])
        {
          BOOL v64 = 0;
          [v21 pitchAngle];
          if (v25 >= -55.0)
          {
            [v21 pitchAngle];
            if (v26 <= 5.0)
            {
              [v21 yawAngle];
              if (v27 >= -25.0)
              {
                [v21 yawAngle];
                if (v42 <= 25.0 && v22 >= -15.0 && v22 <= 15.0)
                {
                  [v21 distance];
                  if (v43 >= 200.0)
                  {
                    [v21 distance];
                    if (v44 <= 490.0)
                    {
                      [v21 bounds];
                      if (v45 >= 165.0)
                      {
                        [v21 bounds];
                        if (v46 <= 550.0)
                        {
                          [v21 bounds];
                          if (v47 >= 165.0)
                          {
                            [v21 bounds];
                            if (v48 <= 550.0) {
                              BOOL v64 = 1;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          if (__osLog) {
            objc_super v28 = __osLog;
          }
          else {
            objc_super v28 = MEMORY[0x263EF8438];
          }
          os_log_t log = v28;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            loga = log;
            [v21 pitchAngle];
            int v59 = (int)v29;
            [v21 yawAngle];
            int v58 = (int)v30;
            [v21 distance];
            int v57 = (int)v31;
            [v21 bounds];
            int v56 = (int)v32;
            [v21 bounds];
            *(_DWORD *)buf = 67110656;
            *(_DWORD *)uint64_t v71 = v59;
            *(_WORD *)&v71[4] = 1024;
            *(_DWORD *)&v71[6] = v58;
            LOWORD(v72) = 1024;
            *(_DWORD *)((char *)&v72 + 2) = (int)v22;
            HIWORD(v72) = 1024;
            *(_DWORD *)int v73 = v57;
            *(_WORD *)&v73[4] = 1024;
            *(_DWORD *)&v73[6] = v56;
            __int16 v74 = 1024;
            *(_DWORD *)uint64_t v75 = (int)v33;
            *(_WORD *)&v75[4] = 1024;
            *(_DWORD *)&v75[6] = v64;
            _os_log_impl(&dword_222D7E000, loga, OS_LOG_TYPE_DEFAULT, "pitch=%d, yaw=%d, roll=%d, distance=%d, faceRectW=%d, faceRectH=%d --> wuPoseEligible: %u\n", buf, 0x2Cu);
          }
          if (v64 != self->_secureFaceDetectPreCheckDone)
          {
            os_log_t logb = [MEMORY[0x263EFF8F8] dataWithBytes:&v64 length:1];
            [(BiometricKitXPCServerPearl *)self statusMessage:1072 withData:logb timestamp:0];

            self->_secureFaceDetectPreCheckDone = v64;
          }
        }
      }
      else
      {
        int v16 = [v14 type];

        if (v16 != v12) {
          goto LABEL_57;
        }
        id v17 = v14;
        uint64_t v18 = [v17 eyeReliefStatus];
        if ((unint64_t)(v18 - 1) < 5) {
          __int16 v19 = v18;
        }
        else {
          __int16 v19 = 0;
        }
        *(_WORD *)((char *)v69 + 7) = v19;
        if ([v17 hasDistance])
        {
          [v17 distance];
          *(_WORD *)((char *)v69 + 5) = (int)v20;
        }
      }

LABEL_57:
      ++v13;
    }
    while (v9 != v13);
    uint64_t v49 = [v7 countByEnumeratingWithState:&v65 objects:v77 count:16];
    uint64_t v9 = v49;
  }
  while (v49);

  if (HIDWORD(self->_avcLock) != 1 || (v63 & 1) == 0) {
    goto LABEL_77;
  }
  if (__osLog) {
    __int16 v50 = __osLog;
  }
  else {
    __int16 v50 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v50, OS_LOG_TYPE_DEFAULT, "Secure face detect succeeded\n", buf, 2u);
  }
  BYTE1(self->_secureFaceDetectRequest) = 1;
  int v51 = [(BiometricKitXPCServerPearl *)self setSecureFaceDetectState:1 sessionID:LODWORD(self->_avcLock)];
  if (v51)
  {
    int v53 = v51;
    if (__osLog) {
      __int16 v54 = __osLog;
    }
    else {
      __int16 v54 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v71 = "err == 0 ";
      *(_WORD *)&v71[8] = 2048;
      uint64_t v72 = v53;
      *(_WORD *)int v73 = 2080;
      *(void *)&v73[2] = &unk_222DFB9BF;
      __int16 v74 = 2080;
      *(void *)uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      *(_WORD *)&v75[8] = 1024;
      int v76 = 5709;
      _os_log_impl(&dword_222D7E000, v54, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    LOBYTE(v69[0]) = 1;
LABEL_78:
    uint64_t v52 = 63;
  }
  else
  {
LABEL_77:
    LOBYTE(v69[0]) = 1;
    if (v63) {
      goto LABEL_78;
    }
    uint64_t v52 = 64;
  }
  uint64_t v6 = v55;
LABEL_82:
  [(BiometricKitXPCServerPearl *)self faceDetectMessage:v52 info:v69 fromSecureFD:1];
  LOBYTE(self->_secureFaceDetectRequest) = [v7 count] == 0;
  [self->_pearlDeviceState logSecureFrameMeta:v7 timestamp:v6];
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  if (__osLog) {
    id v11 = __osLog;
  }
  else {
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEFAULT, "AVC delegate: captureOutput:%@ didOutputMetadataObjects:%@ fromConnection:%@\n", buf, 0x20u);
  }
  [(OS_dispatch_queue *)self->_avcQueue lock];
  if (LOBYTE(self->_frontCameraRotationForISP))
  {
    if ([v9 count])
    {
      id v20 = v10;
      id v21 = v8;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      obuint64_t j = v9;
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(obj);
            }
            int v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v17 = *(void *)&self->_synchronizeMetadataObjects;
            if (v17 != -1)
            {
              if (v16)
              {
                [*(id *)(*((void *)&v25 + 1) + 8 * i) time];
                uint64_t v18 = v24;
                uint64_t v17 = *(void *)&self->_synchronizeMetadataObjects;
              }
              else
              {
                uint64_t v18 = 0;
                uint64_t v24 = 0;
              }
              if (v18 != v17 && [self->_collectedMetadataObjectsTimestamp count])
              {
                [(BiometricKitXPCServerPearl *)self processMetadataObjects:self->_collectedMetadataObjectsTimestamp];
                [self->_collectedMetadataObjectsTimestamp removeAllObjects];
              }
            }
            [self->_collectedMetadataObjectsTimestamp addObject:v16];
            if (v16)
            {
              [v16 time];
              uint64_t v19 = v23;
            }
            else
            {
              uint64_t v19 = 0;
              uint64_t v23 = 0;
            }
            *(void *)&self->_synchronizeMetadataObjects = v19;
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }

      id v8 = v21;
      id v10 = v20;
    }
    else
    {
      [(BiometricKitXPCServerPearl *)self processMetadataObjects:self->_collectedMetadataObjectsTimestamp];
      [self->_collectedMetadataObjectsTimestamp removeAllObjects];
    }
  }
  else
  {
    [(BiometricKitXPCServerPearl *)self processMetadataObjects:v9];
  }
  [(OS_dispatch_queue *)self->_avcQueue unlock];
}

- (int)initSecureFaceDetect
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  kdebug_trace();
  if (__osLogTrace) {
    unsigned int v3 = __osLogTrace;
  }
  else {
    unsigned int v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "initSecureFaceDetect\n", buf, 2u);
  }
  [(OS_dispatch_queue *)self->_avcQueue lock];
  if (BYTE3(self->_mediaStatusDomainPublisher))
  {
    if (__osLog) {
      double v40 = __osLog;
    }
    else {
      double v40 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      double v48 = "!_avcSessionInitialized";
      __int16 v49 = 2048;
      uint64_t v50 = 0;
      __int16 v51 = 2080;
      uint64_t v52 = &unk_222DFB9BF;
      __int16 v53 = 2080;
      __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v55 = 1024;
      int v56 = 5787;
      _os_log_impl(&dword_222D7E000, v40, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v38 = 267;
    goto LABEL_80;
  }
  uint64_t v4 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9630] mediaType:*MEMORY[0x263EF9D10] position:2];
  uint64_t v5 = *(void **)&self->_unlockWithGlassesFailCount;
  *(void *)&self->_unlockWithGlassesFailCount = v4;

  if (*(void *)&self->_unlockWithGlassesFailCount)
  {
    uint64_t v6 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x263EFA638]);
    avcOutput = self->_avcOutput;
    self->_avcOutput = v6;

    id v8 = self->_avcOutput;
    if (v8)
    {
      [(AVCaptureMetadataOutput *)v8 beginConfiguration];
      id v9 = (AVCaptureDevice *)[objc_alloc(MEMORY[0x263EFA5B8]) initWithDevice:*(void *)&self->_unlockWithGlassesFailCount error:0];
      avcDevice = self->_avcDevice;
      self->_avcDevice = v9;

      if (self->_avcDevice)
      {
        if (-[AVCaptureMetadataOutput canAddInput:](self->_avcOutput, "canAddInput:"))
        {
          [(AVCaptureMetadataOutput *)self->_avcOutput addInput:self->_avcDevice];
          id v11 = (AVCaptureDeviceInput *)objc_alloc_init(MEMORY[0x263EFA5F0]);
          avcInput = self->_avcInput;
          self->_avcInput = v11;

          uint64_t v13 = self->_avcInput;
          if (v13)
          {
            if (!self->_avcObservers)
            {
              uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
              unsigned int v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
              int v16 = (NSMutableArray *)dispatch_queue_create("com.apple.pearld.avc", v15);
              avcObservers = self->_avcObservers;
              self->_avcObservers = v16;

              if (!self->_avcObservers)
              {
                if (__osLog) {
                  double v41 = __osLog;
                }
                else {
                  double v41 = MEMORY[0x263EF8438];
                }
                if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_79;
                }
                *(_DWORD *)buf = 136316162;
                double v48 = "_avcQueue";
                __int16 v49 = 2048;
                uint64_t v50 = 0;
                __int16 v51 = 2080;
                uint64_t v52 = &unk_222DFB9BF;
                __int16 v53 = 2080;
                __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                __int16 v55 = 1024;
                int v56 = 5808;
                goto LABEL_78;
              }
              uint64_t v13 = self->_avcInput;
            }
            -[AVCaptureDeviceInput setMetadataObjectsDelegate:queue:](v13, "setMetadataObjectsDelegate:queue:", self);
            if ([(AVCaptureMetadataOutput *)self->_avcOutput canAddOutput:self->_avcInput])
            {
              [(AVCaptureMetadataOutput *)self->_avcOutput addOutput:self->_avcInput];
              [(AVCaptureDeviceInput *)self->_avcInput setAttentionDetectionEnabled:1];
              if (HIDWORD(self->_avcLock) == 2)
              {
                if ((self->_secureFaceDetectSessionID & 4) != 0)
                {
                  uint64_t v19 = *MEMORY[0x263EF9F00];
                  v46[0] = *MEMORY[0x263EF9F08];
                  v46[1] = v19;
                  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
                }
                else
                {
                  uint64_t v45 = *MEMORY[0x263EF9F08];
                  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
                }
                id v20 = (void *)v18;
                [(AVCaptureDeviceInput *)self->_avcInput setMetadataObjectTypes:v18];
              }
              id v21 = [(AVCaptureDeviceInput *)self->_avcInput metadataObjectTypes];
              BOOL v22 = (unint64_t)[v21 count] > 1;

              if (v22)
              {
                LOBYTE(self->_frontCameraRotationForISP) = 1;
                [self->_collectedMetadataObjectsTimestamp removeAllObjects];
                *(void *)&self->_synchronizeMetadataObjects = -1;
              }
              else
              {
                LOBYTE(self->_frontCameraRotationForISP) = 0;
              }
              [(AVCaptureMetadataOutput *)self->_avcOutput commitConfiguration];
              uint64_t v23 = [MEMORY[0x263EFF980] array];
              avcSession = self->_avcSession;
              self->_avcSession = v23;

              if (self->_avcSession)
              {
                objc_initWeak((id *)buf, self);
                long long v25 = [MEMORY[0x263F08A00] defaultCenter];
                long long v26 = self->_avcOutput;
                v43[0] = MEMORY[0x263EF8330];
                v43[1] = 3221225472;
                v43[2] = __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke;
                v43[3] = &unk_26466F7F8;
                objc_copyWeak(&v44, (id *)buf);
                uint64_t v27 = *MEMORY[0x263EF9798];
                v43[4] = self;
                long long v28 = [v25 addObserverForName:v27 object:v26 queue:0 usingBlock:v43];

                [(AVCaptureSession *)self->_avcSession addObject:v28];
                double v29 = [MEMORY[0x263F08A00] defaultCenter];
                double v30 = [v29 addObserverForName:*MEMORY[0x263EF9700] object:self->_avcOutput queue:0 usingBlock:&__block_literal_global_818];

                [(AVCaptureSession *)self->_avcSession addObject:v30];
                id v31 = [MEMORY[0x263F08A00] defaultCenter];
                __int16 v32 = [v31 addObserverForName:*MEMORY[0x263EF9708] object:self->_avcOutput queue:0 usingBlock:&__block_literal_global_821];

                [(AVCaptureSession *)self->_avcSession addObject:v32];
                id v33 = [MEMORY[0x263F08A00] defaultCenter];
                __int16 v34 = [v33 addObserverForName:*MEMORY[0x263EF97A0] object:self->_avcOutput queue:0 usingBlock:&__block_literal_global_824];

                [(AVCaptureSession *)self->_avcSession addObject:v34];
                id v35 = [MEMORY[0x263F08A00] defaultCenter];
                uint64_t v36 = [v35 addObserverForName:*MEMORY[0x263EF9718] object:self->_avcOutput queue:0 usingBlock:&__block_literal_global_827];

                [(AVCaptureSession *)self->_avcSession addObject:v36];
                objc_destroyWeak(&v44);

                objc_destroyWeak((id *)buf);
                [(BiometricKitXPCServerPearl *)self clearSecureFaceDetectContext];
                BYTE3(self->_mediaStatusDomainPublisher) = 1;
                [(OS_dispatch_queue *)self->_avcQueue unlock];
                if (__osLogTrace) {
                  double v37 = __osLogTrace;
                }
                else {
                  double v37 = MEMORY[0x263EF8438];
                }
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v48) = 0;
                  _os_log_impl(&dword_222D7E000, v37, OS_LOG_TYPE_DEBUG, "initSecureFaceDetect: -> %d\n", buf, 8u);
                }
                int v38 = 0;
                goto LABEL_31;
              }
              if (__osLog) {
                double v41 = __osLog;
              }
              else {
                double v41 = MEMORY[0x263EF8438];
              }
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                goto LABEL_79;
              }
              *(_DWORD *)buf = 136316162;
              double v48 = "_avcObservers";
              __int16 v49 = 2048;
              uint64_t v50 = 0;
              __int16 v51 = 2080;
              uint64_t v52 = &unk_222DFB9BF;
              __int16 v53 = 2080;
              __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
              __int16 v55 = 1024;
              int v56 = 5855;
            }
            else
            {
              if (__osLog) {
                double v41 = __osLog;
              }
              else {
                double v41 = MEMORY[0x263EF8438];
              }
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                goto LABEL_79;
              }
              *(_DWORD *)buf = 136316162;
              double v48 = "[_avcSession canAddOutput:_avcOutput]";
              __int16 v49 = 2048;
              uint64_t v50 = 0;
              __int16 v51 = 2080;
              uint64_t v52 = &unk_222DFB9BF;
              __int16 v53 = 2080;
              __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
              __int16 v55 = 1024;
              int v56 = 5813;
            }
          }
          else
          {
            if (__osLog) {
              double v41 = __osLog;
            }
            else {
              double v41 = MEMORY[0x263EF8438];
            }
            if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              goto LABEL_79;
            }
            *(_DWORD *)buf = 136316162;
            double v48 = "_avcOutput";
            __int16 v49 = 2048;
            uint64_t v50 = 0;
            __int16 v51 = 2080;
            uint64_t v52 = &unk_222DFB9BF;
            __int16 v53 = 2080;
            __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v55 = 1024;
            int v56 = 5804;
          }
        }
        else
        {
          if (__osLog) {
            double v41 = __osLog;
          }
          else {
            double v41 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            goto LABEL_79;
          }
          *(_DWORD *)buf = 136316162;
          double v48 = "[_avcSession canAddInput:_avcInput]";
          __int16 v49 = 2048;
          uint64_t v50 = 0;
          __int16 v51 = 2080;
          uint64_t v52 = &unk_222DFB9BF;
          __int16 v53 = 2080;
          __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v55 = 1024;
          int v56 = 5800;
        }
      }
      else
      {
        if (__osLog) {
          double v41 = __osLog;
        }
        else {
          double v41 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          goto LABEL_79;
        }
        *(_DWORD *)buf = 136316162;
        double v48 = "_avcInput";
        __int16 v49 = 2048;
        uint64_t v50 = 0;
        __int16 v51 = 2080;
        uint64_t v52 = &unk_222DFB9BF;
        __int16 v53 = 2080;
        __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v55 = 1024;
        int v56 = 5798;
      }
    }
    else
    {
      if (__osLog) {
        double v41 = __osLog;
      }
      else {
        double v41 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136316162;
      double v48 = "_avcSession";
      __int16 v49 = 2048;
      uint64_t v50 = 0;
      __int16 v51 = 2080;
      uint64_t v52 = &unk_222DFB9BF;
      __int16 v53 = 2080;
      __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v55 = 1024;
      int v56 = 5793;
    }
  }
  else
  {
    if (__osLog) {
      double v41 = __osLog;
    }
    else {
      double v41 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    double v48 = "_avcDevice";
    __int16 v49 = 2048;
    uint64_t v50 = 0;
    __int16 v51 = 2080;
    uint64_t v52 = &unk_222DFB9BF;
    __int16 v53 = 2080;
    __int16 v54 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v55 = 1024;
    int v56 = 5790;
  }
LABEL_78:
  _os_log_impl(&dword_222D7E000, v41, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_79:
  int v38 = 261;
LABEL_80:
  [(BiometricKitXPCServerPearl *)self deinitSecureFaceDetect];
  [(OS_dispatch_queue *)self->_avcQueue unlock];
  if (__osLogTrace) {
    double v42 = __osLogTrace;
  }
  else {
    double v42 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v48) = v38;
    _os_log_impl(&dword_222D7E000, v42, OS_LOG_TYPE_ERROR, "initSecureFaceDetect: -> %d\n", buf, 8u);
  }
LABEL_31:
  kdebug_trace();
  return v38;
}

void __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  if (__osLog) {
    uint64_t v4 = __osLog;
  }
  else {
    uint64_t v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEFAULT, "AVF notification: AVCaptureSessionRuntimeErrorNotification\n", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained[77];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke_813;
  block[3] = &unk_26466F7D0;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
}

void __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke_813(id *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  [WeakRetained[78] lock];
  id v3 = [a1[4] object];
  id v4 = WeakRetained[75];

  if (v3 == v4)
  {
    int v8 = [WeakRetained setSecureFaceDetectState:2 sessionID:*((unsigned int *)WeakRetained + 158)];
    if (v8)
    {
      int v9 = v8;
      id v10 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136316162;
        id v12 = "err == 0 ";
        __int16 v13 = 2048;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        int v16 = &unk_222DFB9BF;
        __int16 v17 = 2080;
        uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v19 = 1024;
        int v20 = 5869;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
      }
    }
    [a1[5] stopSecureFaceDetect];
  }
  else
  {
    id v5 = [a1[4] object];
    id v6 = WeakRetained[75];

    if (v5 != v6)
    {
      if (__osLog) {
        uint64_t v7 = __osLog;
      }
      else {
        uint64_t v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136316162;
        id v12 = "note.object == strongSelf->_avcSession";
        __int16 v13 = 2048;
        uint64_t v14 = 0;
        __int16 v15 = 2080;
        int v16 = &unk_222DFB9BF;
        __int16 v17 = 2080;
        uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v19 = 1024;
        int v20 = 5873;
        _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  [WeakRetained[78] unlock];
}

void __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke_816()
{
  if (__osLog) {
    int v0 = __osLog;
  }
  else {
    int v0 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_222D7E000, v0, OS_LOG_TYPE_DEFAULT, "AVF notification: AVCaptureSessionDidStartRunningNotification\n", v1, 2u);
  }
}

void __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke_819()
{
  if (__osLog) {
    int v0 = __osLog;
  }
  else {
    int v0 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_222D7E000, v0, OS_LOG_TYPE_DEFAULT, "AVF notification: AVCaptureSessionDidStopRunningNotification\n", v1, 2u);
  }
}

void __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke_822()
{
  if (__osLog) {
    int v0 = __osLog;
  }
  else {
    int v0 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_222D7E000, v0, OS_LOG_TYPE_DEFAULT, "AVF notification: AVCaptureSessionWasInterruptedNotification\n", v1, 2u);
  }
}

void __50__BiometricKitXPCServerPearl_initSecureFaceDetect__block_invoke_825()
{
  if (__osLog) {
    int v0 = __osLog;
  }
  else {
    int v0 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_222D7E000, v0, OS_LOG_TYPE_DEFAULT, "AVF notification: AVCaptureSessionInterruptionEndedNotification\n", v1, 2u);
  }
}

- (void)deinitSecureFaceDetect
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    id v3 = __osLogTrace;
  }
  else {
    id v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "deinitSecureFaceDetect\n", buf, 2u);
  }
  [(OS_dispatch_queue *)self->_avcQueue lock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_avcSession;
  uint64_t v5 = [(AVCaptureSession *)v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [MEMORY[0x263F08A00] defaultCenter];
        [v10 removeObserver:v9];
      }
      uint64_t v6 = [(AVCaptureSession *)v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }

  avcSession = self->_avcSession;
  self->_avcSession = 0;

  avcOutput = self->_avcOutput;
  self->_avcOutput = 0;

  avcInput = self->_avcInput;
  self->_avcInput = 0;

  avcDevice = self->_avcDevice;
  self->_avcDevice = 0;

  __int16 v15 = *(void **)&self->_unlockWithGlassesFailCount;
  *(void *)&self->_unlockWithGlassesFailCount = 0;

  BYTE3(self->_mediaStatusDomainPublisher) = 0;
  LODWORD(self->_avcLock) = 0;
  HIDWORD(self->_avcLock) = 0;
  self->_secureFaceDetectSessionID = 0;
  LOBYTE(self->_secureFaceDetectRequest) = 0;
  [(BiometricKitXPCServerPearl *)self clearSecureFaceDetectContext];
  [(OS_dispatch_queue *)self->_avcQueue unlock];
  if (__osLogTrace) {
    int v16 = __osLogTrace;
  }
  else {
    int v16 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_DEBUG, "deinitSecureFaceDetect: -> void\n", buf, 2u);
  }
}

- (void)clearSecureFaceDetectContext
{
  BYTE1(self->_secureFaceDetectRequest) = 0;
  self->_secureFaceDetectRequestFlags = 1;
  self->_lastProcessedNoMetadataObjects = 0;
  self->_secureFaceDetectPreCheckDone = 0;
}

- (void)stopSecureFaceDetect
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEFAULT, "stopSecureFaceDetect\n", (uint8_t *)&v10, 2u);
  }
  [(OS_dispatch_queue *)self->_avcQueue lock];
  if (BYTE3(self->_mediaStatusDomainPublisher))
  {
    if ([(AVCaptureMetadataOutput *)self->_avcOutput isRunning])
    {
      uint64_t v5 = [MEMORY[0x263EFF910] date];
      kdebug_trace();
      [(AVCaptureMetadataOutput *)self->_avcOutput stopRunning];
      kdebug_trace();
      if (__osLog) {
        uint64_t v6 = __osLog;
      }
      else {
        uint64_t v6 = v3;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = v6;
        [v5 timeIntervalSinceNow];
        int v10 = 134217984;
        double v11 = v8 * -1000.0;
        _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEFAULT, "stopSecureFaceDetect: stopRunning (dt = %f ms)\n", (uint8_t *)&v10, 0xCu);
      }
      [self->_pearlDeviceState logSecureFaceDetectStop];
    }
    [(BiometricKitXPCServerPearl *)self deinitSecureFaceDetect];
  }
  [(OS_dispatch_queue *)self->_avcQueue unlock];
  if (__osLogTrace) {
    uint64_t v9 = __osLogTrace;
  }
  else {
    uint64_t v9 = v3;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEFAULT, "stopSecureFaceDetect: -> void\n", (uint8_t *)&v10, 2u);
  }
}

- (int)startSecureFaceDetect
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEFAULT, "startSecureFaceDetect\n", (uint8_t *)&v18, 2u);
  }
  [(OS_dispatch_queue *)self->_avcQueue lock];
  int v5 = [(BiometricKitXPCServerPearl *)self initSecureFaceDetect];
  if (v5)
  {
    int v13 = v5;
    if (__osLog) {
      int v16 = __osLog;
    }
    else {
      int v16 = v3;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      long long v19 = "err == 0 ";
      __int16 v20 = 2048;
      *(void *)uint64_t v21 = v13;
      *(_WORD *)&v21[8] = 2080;
      BOOL v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 6004;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
  }
  else
  {
    if ([(AVCaptureMetadataOutput *)self->_avcOutput isRunning])
    {
LABEL_15:
      int v13 = 0;
      goto LABEL_16;
    }
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    kdebug_trace();
    [(AVCaptureMetadataOutput *)self->_avcOutput startRunning];
    kdebug_trace();
    if (__osLog) {
      uint64_t v7 = __osLog;
    }
    else {
      uint64_t v7 = v3;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = v7;
      [v6 timeIntervalSinceNow];
      double v10 = v9 * -1000.0;
      int v11 = [(AVCaptureMetadataOutput *)self->_avcOutput isRunning];
      int v12 = [(AVCaptureMetadataOutput *)self->_avcOutput isInterrupted];
      int v18 = 134218496;
      long long v19 = *(const char **)&v10;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = v11;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v12;
      _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEFAULT, "startSecureFaceDetect: startRunning (dt = %f ms), running:%u, interrupted:%u\n", (uint8_t *)&v18, 0x18u);
    }
    if ([(AVCaptureMetadataOutput *)self->_avcOutput isRunning])
    {

      goto LABEL_15;
    }
    if (__osLog) {
      long long v17 = __osLog;
    }
    else {
      long long v17 = v3;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      long long v19 = "_avcSession.running";
      __int16 v20 = 2048;
      *(void *)uint64_t v21 = 0;
      *(_WORD *)&v21[8] = 2080;
      BOOL v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 6012;
      _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }

    int v13 = 261;
  }
  [(BiometricKitXPCServerPearl *)self stopSecureFaceDetect];
LABEL_16:
  [(OS_dispatch_queue *)self->_avcQueue unlock];
  if (__osLogTrace) {
    uint64_t v14 = __osLogTrace;
  }
  else {
    uint64_t v14 = v3;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 67109120;
    LODWORD(v19) = v13;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_DEFAULT, "startSecureFaceDetect: -> %d\n", (uint8_t *)&v18, 8u);
  }
  return v13;
}

- (void)secureFaceDetectRequestMessage:(id *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3->var2)
    {
      kdebug_trace();
      int v5 = MEMORY[0x263EF8438];
      if (__osLog) {
        uint64_t v6 = __osLog;
      }
      else {
        uint64_t v6 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int var0 = a3->var0;
        unsigned int var1 = a3->var1;
        unsigned int var2 = a3->var2;
        *(_DWORD *)__int16 v25 = 67109632;
        *(_DWORD *)&v25[4] = var0;
        *(_WORD *)&v25[8] = 1024;
        *(_DWORD *)&v25[10] = var1;
        *(_WORD *)&v25[14] = 1024;
        *(_DWORD *)&v25[16] = var2;
        _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEFAULT, "secureFaceDetectRequestMessage: request=%u, flags:0x%x, sessionID=%u\n", v25, 0x14u);
      }
      [(OS_dispatch_queue *)self->_avcQueue lock];
      if (a3->var0)
      {
        unsigned int v10 = a3->var2;
        if (v10 != LODWORD(self->_avcLock))
        {
          if (BYTE3(self->_mediaStatusDomainPublisher))
          {
            if (a3->var0 == 2 && HIDWORD(self->_avcLock) == 2)
            {
              unsigned int v11 = a3->var1;
              unsigned int secureFaceDetectSessionID = self->_secureFaceDetectSessionID;
              if (((secureFaceDetectSessionID ^ v11) & 0xFFFFFFFB) == 0
                && ((v11 & 4) == 0 || (secureFaceDetectSessionID & 4) != 0))
              {
                if (__osLog) {
                  __int16 v20 = __osLog;
                }
                else {
                  __int16 v20 = v5;
                }
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  int avcLock_high = HIDWORD(self->_avcLock);
                  unsigned int v22 = self->_secureFaceDetectSessionID;
                  *(_DWORD *)__int16 v25 = 67109376;
                  *(_DWORD *)&v25[4] = avcLock_high;
                  *(_WORD *)&v25[8] = 1024;
                  *(_DWORD *)&v25[10] = v22;
                  _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_DEFAULT, "currentRequest:%u currentFlags:0x%x -> can reuse current AVC session\n", v25, 0xEu);
                }
                LODWORD(self->_avcLock) = a3->var2;
                pearlDeviceState = (void *)self->_pearlDeviceState;
                *(_OWORD *)__int16 v25 = *(_OWORD *)&a3->var0;
                *(void *)&v25[15] = *(void *)((char *)&a3->var2 + 7);
                [pearlDeviceState logSecureFaceDetectStart:v25];
                if (LOBYTE(self->_secureFaceDetectRequest)) {
                  [(BiometricKitXPCServerPearl *)self processMetadataObjects:0];
                }
                goto LABEL_31;
              }
            }
            [(BiometricKitXPCServerPearl *)self stopSecureFaceDetect];
            unsigned int v10 = a3->var2;
          }
          LODWORD(self->_avcLock) = v10;
          HIDWORD(self->_avcLock) = a3->var0;
          self->_unsigned int secureFaceDetectSessionID = a3->var1;
        }
        int v13 = (void *)self->_pearlDeviceState;
        *(_OWORD *)__int16 v25 = *(_OWORD *)&a3->var0;
        *(void *)&v25[15] = *(void *)((char *)&a3->var2 + 7);
        [v13 logSecureFaceDetectStart:v25];
        int v14 = [(BiometricKitXPCServerPearl *)self startSecureFaceDetect];
        if (v14)
        {
          int v15 = v14;
          if (__osLog) {
            int v16 = __osLog;
          }
          else {
            int v16 = v5;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int16 v25 = 136316162;
            *(void *)&v25[4] = "err == 0 ";
            *(_WORD *)&v25[12] = 2048;
            *(void *)&v25[14] = v15;
            *(_WORD *)&v25[22] = 2080;
            int v26 = &unk_222DFB9BF;
            __int16 v27 = 2080;
            long long v28 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v29 = 1024;
            int v30 = 6081;
            _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v25, 0x30u);
          }
          int v17 = [(BiometricKitXPCServerPearl *)self setSecureFaceDetectState:2 sessionID:a3->var2];
          if (v17)
          {
            int v18 = v17;
            if (__osLog) {
              long long v19 = __osLog;
            }
            else {
              long long v19 = v5;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int16 v25 = 136316162;
              *(void *)&v25[4] = "err == 0 ";
              *(_WORD *)&v25[12] = 2048;
              *(void *)&v25[14] = v18;
              *(_WORD *)&v25[22] = 2080;
              int v26 = &unk_222DFB9BF;
              __int16 v27 = 2080;
              long long v28 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
              __int16 v29 = 1024;
              int v30 = 6084;
              _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v25, 0x30u);
            }
          }
        }
      }
      else
      {
        [(BiometricKitXPCServerPearl *)self stopSecureFaceDetect];
      }
LABEL_31:
      [(OS_dispatch_queue *)self->_avcQueue unlock];
      return;
    }
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v25 = 136316162;
      *(void *)&v25[4] = "message->sessionID != 0";
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = 0;
      *(_WORD *)&v25[22] = 2080;
      int v26 = &unk_222DFB9BF;
      __int16 v27 = 2080;
      long long v28 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v29 = 1024;
      int v30 = 6042;
      goto LABEL_50;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v25 = 136316162;
      *(void *)&v25[4] = "message";
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = 0;
      *(_WORD *)&v25[22] = 2080;
      int v26 = &unk_222DFB9BF;
      __int16 v27 = 2080;
      long long v28 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v29 = 1024;
      int v30 = 6041;
LABEL_50:
      _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v25, 0x30u);
    }
  }
}

- (int)performMatchCommand:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [MEMORY[0x263EFF990] dataWithLength:75];
  uint64_t v6 = v5;
  if (!v4)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    int v28 = 136316162;
    __int16 v29 = "operation";
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2080;
    id v33 = &unk_222DFB9BF;
    __int16 v34 = 2080;
    id v35 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v36 = 1024;
    int v37 = 6108;
    goto LABEL_36;
  }
  id v7 = v5;
  double v8 = (_DWORD *)[v7 mutableBytes];
  if (v8)
  {
    double v9 = v8;
    _DWORD *v8 = [v4 processedFlags];
    v9[1] = [v4 userID];
    *((unsigned char *)v9 + 8) = [v4 trigger];
    if (![v4 forCredentialSet])
    {
      if ([v4 noBioLockout])
      {
        *(_DWORD *)((char *)v9 + 31) = [v4 noBioLockoutUserID];
        uint64_t v15 = [v4 noBioLockoutAuthData];
        uint64_t v16 = *(void *)(v15 + 32);
        long long v17 = *(_OWORD *)(v15 + 16);
        *(_OWORD *)((char *)v9 + 35) = *(_OWORD *)v15;
        *(_OWORD *)((char *)v9 + 51) = v17;
        *(void *)((char *)v9 + 67) = v16;
      }
      goto LABEL_8;
    }
    unsigned int v10 = [v4 acmContext];
    unint64_t v11 = [v10 length];

    if (v11 < 0x21)
    {
      int v12 = [v4 acmContext];
      *(_DWORD *)((char *)v9 + 31) = [v12 length];

      int v13 = [v4 acmContext];
      int v14 = [v4 acmContext];
      [v13 getBytes:(char *)v9 + 35 length:[v14 length]];

LABEL_8:
      if ([v4 preAugmentationCheck])
      {
        uint64_t v18 = [v4 preAugmentationCheckIdentity];
        int v19 = *(_DWORD *)(v18 + 16);
        *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)v18;
        *(_DWORD *)((char *)v9 + 25) = v19;
      }
      __int16 v20 = [v4 selectedIdentitiesBlob];

      if (v20)
      {
        uint64_t v21 = [v4 selectedIdentitiesBlob];
        [v7 appendData:v21];
      }
      id v22 = v7;
      int v23 = [-[BiometricKitXPCServerPearl performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 4, 0, [v22 bytes], objc_msgSend(v22, "length"), 0, 0);
      if (v23)
      {
        if (__osLog) {
          __int16 v27 = __osLog;
        }
        else {
          __int16 v27 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v28 = 136316162;
          __int16 v29 = "err == 0 ";
          __int16 v30 = 2048;
          uint64_t v31 = v23;
          __int16 v32 = 2080;
          id v33 = &unk_222DFB9BF;
          __int16 v34 = 2080;
          id v35 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v36 = 1024;
          int v37 = 6136;
          _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v28, 0x30u);
        }
      }
      else
      {
        [(BiometricKitXPCServerPearl *)self checkBioLogConsent];
      }
      goto LABEL_14;
    }
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_37:
      int v23 = 258;
      goto LABEL_14;
    }
    int v28 = 136316162;
    __int16 v29 = "operation.acmContext.length <= sizeof(inData->matchInitData.data.acmContext.data)";
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2080;
    id v33 = &unk_222DFB9BF;
    __int16 v34 = 2080;
    id v35 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v36 = 1024;
    int v37 = 6118;
LABEL_36:
    _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v28, 0x30u);
    goto LABEL_37;
  }
  if (__osLog) {
    int v26 = __osLog;
  }
  else {
    int v26 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v28 = 136316162;
    __int16 v29 = "inData";
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2080;
    id v33 = &unk_222DFB9BF;
    __int16 v34 = 2080;
    id v35 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v36 = 1024;
    int v37 = 6111;
    _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v28, 0x30u);
  }
  int v23 = 260;
LABEL_14:

  return v23;
}

- (void)checkBioLogConsent
{
  if (isInternalBuild())
  {
    id v3 = [MEMORY[0x263F2AAB8] sharedInstance];
    if (([v3 BOOLForKey:@"oldBioLogPurgedAfterUpdate"] & 1) == 0)
    {
      id v4 = MEMORY[0x263EF8438];
      if (__osLog) {
        int v5 = __osLog;
      }
      else {
        int v5 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEFAULT, "Removing old BioLogs due to missing oldBioLogPurgedAfterUpdate key\n", buf, 2u);
      }
      +[BioLog removeBioLogAsync];
      [v3 setBool:1 forKey:@"framesRawLoggingDisabled"];
      [v3 setBool:1 forKey:@"oldBioLogPurgedAfterUpdate"];
      [v3 setBool:1 forKey:@"bioLogMatchFailureSettingsPrompt"];
      [v3 synchronize];
      [(BiometricKitXPCServerPearl *)self updateLoggingState];
      if (__osLog) {
        uint64_t v6 = __osLog;
      }
      else {
        uint64_t v6 = v4;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEFAULT, "Removing old BioLogs done\n", v7, 2u);
      }
    }
  }
}

- (id)createPresenceDetectOperation
{
  BOOL v2 = objc_alloc_init(BiometricPresenceDetectOperationPearl);

  return v2;
}

- (int)initPresenceDetectOperation:(id)a3 options:(id)a4 client:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v38 = 0.0;
  __int16 v37 = 0;
  unsigned __int8 v36 = 0;
  uint64_t v35 = 0;
  uint64_t v11 = mach_continuous_time();
  if (!v8)
  {
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_80;
    }
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "operation";
    __int16 v40 = 2048;
    uint64_t v41 = 0;
    __int16 v42 = 2080;
    double v43 = &unk_222DFB9BF;
    __int16 v44 = 2080;
    uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v46 = 1024;
    int v47 = 6192;
    goto LABEL_79;
  }
  uint64_t v12 = v11;
  v34.receiver = self;
  v34.super_class = (Class)BiometricKitXPCServerPearl;
  int Double = [(BiometricKitXPCServer *)&v34 initPresenceDetectOperation:v8 options:v9 client:v10];
  if (Double)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "err == 0 ";
    __int16 v40 = 2048;
    uint64_t v41 = Double;
    __int16 v42 = 2080;
    double v43 = &unk_222DFB9BF;
    __int16 v44 = 2080;
    uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v46 = 1024;
    int v47 = 6195;
LABEL_62:
    _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", location, 0x30u);
    goto LABEL_26;
  }
  if (!v9) {
    goto LABEL_17;
  }
  int Double = dictionaryGetDouble();
  if (Double)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "err == 0 ";
    __int16 v40 = 2048;
    uint64_t v41 = Double;
    __int16 v42 = 2080;
    double v43 = &unk_222DFB9BF;
    __int16 v44 = 2080;
    uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v46 = 1024;
    int v47 = 6199;
    goto LABEL_62;
  }
  int Double = dictionaryGetBool();
  if (Double)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "err == 0 ";
    __int16 v40 = 2048;
    uint64_t v41 = Double;
    __int16 v42 = 2080;
    double v43 = &unk_222DFB9BF;
    __int16 v44 = 2080;
    uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v46 = 1024;
    int v47 = 6202;
    goto LABEL_62;
  }
  int Double = dictionaryGetBool();
  if (Double)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "err == 0 ";
    __int16 v40 = 2048;
    uint64_t v41 = Double;
    __int16 v42 = 2080;
    double v43 = &unk_222DFB9BF;
    __int16 v44 = 2080;
    uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v46 = 1024;
    int v47 = 6206;
    goto LABEL_62;
  }
  int Double = dictionaryGetBool();
  if (Double)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "err == 0 ";
    __int16 v40 = 2048;
    uint64_t v41 = Double;
    __int16 v42 = 2080;
    double v43 = &unk_222DFB9BF;
    __int16 v44 = 2080;
    uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v46 = 1024;
    int v47 = 6211;
    goto LABEL_62;
  }
  if (!v36) {
    goto LABEL_14;
  }
  if ((_BYTE)v37)
  {
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_80;
    }
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "!eyeRelief";
    __int16 v40 = 2048;
    uint64_t v41 = 0;
    __int16 v42 = 2080;
    double v43 = &unk_222DFB9BF;
    __int16 v44 = 2080;
    uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v46 = 1024;
    int v47 = 6213;
    goto LABEL_79;
  }
  if (initPresenceDetectOperation_options_client__checked)
  {
    int v14 = initPresenceDetectOperation_options_client__motionDetectSupported;
  }
  else
  {
    int v14 = MGGetBoolAnswer();
    initPresenceDetectOperation_options_client__motionDetectSupported = v14;
    initPresenceDetectOperation_options_client__checked = 1;
  }
  if (!v14)
  {
    if (__osLog) {
      int v26 = __osLog;
    }
    else {
      int v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "motionDetectSupported";
      __int16 v40 = 2048;
      uint64_t v41 = 0;
      __int16 v42 = 2080;
      double v43 = &unk_222DFB9BF;
      __int16 v44 = 2080;
      uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v46 = 1024;
      int v47 = 6222;
      _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", location, 0x30u);
    }
    int Double = 266;
  }
  else
  {
LABEL_14:
    int Double = dictionaryGetInteger();
    if (!Double)
    {
      if (v35 != 1 || !v36)
      {
LABEL_17:
        double v15 = v38;
        if (v38 >= 0.0) {
          unint64_t v16 = nanosecondsToAbsolute() + v12;
        }
        else {
          unint64_t v16 = -1;
        }
        if (v16 < v12) {
          uint64_t v17 = -1;
        }
        else {
          uint64_t v17 = v16;
        }
        [v8 setPriority:0x8000000000000000, v15];
        [v8 setContinuous:v35 == 1];
        [v8 setEndTime:v17];
        [v8 setHighPriority:HIBYTE(v37)];
        [v8 setEyeRelief:v37];
        [v8 setMotionDetect:v36];
        if (v38 >= 0.0)
        {
          objc_initWeak((id *)location, self);
          objc_initWeak(&from, v8);
          uint64_t v18 = (void *)MEMORY[0x263EFFA20];
          double v19 = v38;
          uint64_t v27 = MEMORY[0x263EF8330];
          uint64_t v28 = 3221225472;
          __int16 v29 = __73__BiometricKitXPCServerPearl_initPresenceDetectOperation_options_client___block_invoke;
          __int16 v30 = &unk_26466F840;
          objc_copyWeak(&v31, (id *)location);
          objc_copyWeak(&v32, &from);
          __int16 v20 = [v18 timerWithTimeInterval:0 repeats:&v27 block:v19];
          [v8 setTimer:v20, v27, v28, v29, v30];

          uint64_t v21 = [MEMORY[0x263EFF9F0] mainRunLoop];
          id v22 = [v8 timer];
          [v21 addTimer:v22 forMode:*MEMORY[0x263EFF478]];

          objc_destroyWeak(&v32);
          objc_destroyWeak(&v31);
          objc_destroyWeak(&from);
          objc_destroyWeak((id *)location);
        }
        int Double = 0;
        goto LABEL_26;
      }
      if (__osLog) {
        uint64_t v24 = __osLog;
      }
      else {
        uint64_t v24 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_80:
        int Double = 258;
        goto LABEL_26;
      }
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "!motionDetect";
      __int16 v40 = 2048;
      uint64_t v41 = 0;
      __int16 v42 = 2080;
      double v43 = &unk_222DFB9BF;
      __int16 v44 = 2080;
      uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v46 = 1024;
      int v47 = 6230;
LABEL_79:
      _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", location, 0x30u);
      goto LABEL_80;
    }
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "err == 0 ";
      __int16 v40 = 2048;
      uint64_t v41 = Double;
      __int16 v42 = 2080;
      double v43 = &unk_222DFB9BF;
      __int16 v44 = 2080;
      uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v46 = 1024;
      int v47 = 6227;
      goto LABEL_62;
    }
  }
LABEL_26:

  return Double;
}

void __73__BiometricKitXPCServerPearl_initPresenceDetectOperation_options_client___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = [v4 isValid];

  id v7 = 0;
  if (v6 && v5)
  {
    [v5 setTimeouted:1];
    if ([v5 checked])
    {
      id v7 = [v5 client];
      if (v7 && WeakRetained) {
        [WeakRetained cancelWithClient:v7];
      }
    }
    else
    {
      id v7 = 0;
    }
  }
}

- (int)performPresenceDetectCommand:(id)a3
{
  return [(BiometricKitXPCServerPearl *)self performPresenceDetectCommand:a3 restart:0];
}

- (int)performPresenceDetectCommand:(id)a3 restart:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v43 = 0;
  uint64_t v42 = 0;
  uint64_t v7 = mach_continuous_time();
  obuint64_t j = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(obj);
  id v36 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v36);
  id v8 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  id v9 = [(BiometricKitXPCServer *)self bioOpsQueue];
  id v10 = [v8 arrayByAddingObjectsFromArray:v9];
  uint64_t v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_868];
  uint64_t v12 = [v10 filteredArrayUsingPredicate:v11];

  int v13 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_870];
  int v14 = [v12 filteredArrayUsingPredicate:v13];

  if ([v14 count])
  {
    id v15 = v14;

    uint64_t v12 = v15;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v54 count:16];
  id v32 = v14;
  BOOL v33 = v4;
  objc_super v34 = self;
  uint64_t v35 = v6;
  if (!v17)
  {
    unint64_t v22 = -1;
    goto LABEL_30;
  }
  int v18 = 0;
  int v19 = 0;
  int v20 = 0;
  uint64_t v21 = *(void *)v39;
  unint64_t v22 = -1;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v39 != v21) {
        objc_enumerationMutation(v16);
      }
      uint64_t v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      unint64_t v25 = [v24 endTime];
      if (v22 >= v25) {
        unint64_t v22 = v25;
      }
      if (v20) {
        goto LABEL_13;
      }
      if ([v24 highPriority])
      {
        int v20 = 1;
        BYTE4(v42) = 1;
LABEL_13:
        if (v19) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      int v20 = 0;
      if (v19)
      {
LABEL_18:
        if (v18) {
          goto LABEL_24;
        }
        goto LABEL_19;
      }
LABEL_14:
      if ([v24 continuous])
      {
        int v19 = 1;
        BYTE5(v42) = 1;
        if (v18) {
          goto LABEL_24;
        }
      }
      else
      {
        int v19 = 0;
        if (v18) {
          goto LABEL_24;
        }
      }
LABEL_19:
      if ([v24 eyeRelief])
      {
        int v18 = 1;
        BYTE6(v42) = 1;
      }
      else
      {
        int v18 = 0;
      }
LABEL_24:
      if ([v24 motionDetect]) {
        HIBYTE(v42) = 1;
      }
    }
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v54 count:16];
  }
  while (v17);
LABEL_30:

  objc_sync_exit(v36);
  objc_sync_exit(obj);

  if (v22 <= v7)
  {
    int v27 = 0;
  }
  else
  {
    unint64_t v26 = absoluteToMiliseconds();
    int v27 = -1;
    if (v26 < 0xFFFFFFFF) {
      int v27 = v26;
    }
  }
  LODWORD(v42) = v27;
  if (v33) {
    char v43 = 1;
  }
  int v28 = [(BiometricKitXPCServerPearl *)v34 performCommand:5 inValue:0 inData:&v42 inSize:9 outData:0 outSize:0];
  uint64_t v29 = v28;
  if (v28)
  {
    if (__osLog) {
      id v31 = __osLog;
    }
    else {
      id v31 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v45 = "err == 0 ";
      __int16 v46 = 2048;
      uint64_t v47 = v29;
      __int16 v48 = 2080;
      __int16 v49 = &unk_222DFB9BF;
      __int16 v50 = 2080;
      __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v52 = 1024;
      int v53 = 6363;
      _os_log_impl(&dword_222D7E000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }

  return v29;
}

uint64_t __67__BiometricKitXPCServerPearl_performPresenceDetectCommand_restart___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] != 3 || objc_msgSend(v2, "status") == 4) {
    goto LABEL_3;
  }
  if (![v2 checked])
  {
    uint64_t v3 = 1;
    goto LABEL_4;
  }
  if ([v2 finished]) {
LABEL_3:
  }
    uint64_t v3 = 0;
  else {
    uint64_t v3 = [v2 timeouted] ^ 1;
  }
LABEL_4:

  return v3;
}

uint64_t __67__BiometricKitXPCServerPearl_performPresenceDetectCommand_restart___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 motionDetect] ^ 1;
}

- (int)cancelWithClient:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(v5);
  id v6 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
  objc_sync_enter(v6);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [(BiometricKitXPCServer *)self bioOpsQueue];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 client];
        if (v12 == v4)
        {
          BOOL v13 = [v11 type] == 3;

          if (v13)
          {
            LODWORD(v8) = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  v26.receiver = self;
  v26.super_class = (Class)BiometricKitXPCServerPearl;
  int v14 = [(BiometricKitXPCServer *)&v26 cancelWithClient:v4];
  if (v14)
  {
    if (__osLog) {
      unint64_t v22 = __osLog;
    }
    else {
      unint64_t v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v32 = "err == 0 ";
      __int16 v33 = 2048;
      uint64_t v34 = v14;
      __int16 v35 = 2080;
      id v36 = &unk_222DFB9BF;
      __int16 v37 = 2080;
      long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v39 = 1024;
      int v40 = 6392;
      _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v8)
  {
    id v15 = [(BiometricKitXPCServer *)self runningBioOp];
    if ([v15 type] != 3)
    {
LABEL_22:

      goto LABEL_25;
    }
    id v16 = [(BiometricKitXPCServer *)self runningBioOp];
    if ([v16 status] != 2)
    {

      goto LABEL_25;
    }
    uint64_t v17 = [(BiometricKitXPCServer *)self activeBioOpsQueue];
    BOOL v18 = [v17 count] == 1;

    if (v18)
    {
      id v15 = [(BiometricKitXPCServer *)self runningBioOp];
      if (![v15 checked]
        || ([v15 finished] & 1) == 0 && (objc_msgSend(v15, "timeouted") & 1) == 0)
      {
        int v19 = [(BiometricKitXPCServer *)self runningBioOp];
        int v20 = [(BiometricKitXPCServerPearl *)self performPresenceDetectCommand:v19 restart:1];

        if (v20)
        {
          if (__osLog) {
            int v23 = __osLog;
          }
          else {
            int v23 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            id v32 = "fdetOpErr == 0 ";
            __int16 v33 = 2048;
            uint64_t v34 = v20;
            __int16 v35 = 2080;
            id v36 = &unk_222DFB9BF;
            __int16 v37 = 2080;
            long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v39 = 1024;
            int v40 = 6400;
            _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          uint64_t v24 = [(BiometricKitXPCServer *)self runningBioOp];
          unint64_t v25 = [v24 client];
          [(BiometricKitXPCServerPearl *)self cancelWithClient:v25];
        }
      }
      goto LABEL_22;
    }
  }
LABEL_25:
  objc_sync_exit(v6);

  objc_sync_exit(v5);
  return v14;
}

- (int)updateIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 type] == 4)
  {
    v15.receiver = self;
    v15.super_class = (Class)BiometricKitXPCServerPearl;
    int v11 = [(BiometricKitXPCServer *)&v15 updateIdentity:v8 withOptions:v9 withClient:v10];
    if (v11)
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = "err == 0 ";
        __int16 v18 = 2048;
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        uint64_t v21 = &unk_222DFB9BF;
        __int16 v22 = 2080;
        int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v24 = 1024;
        int v25 = 6424;
        _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog) {
      BOOL v13 = __osLog;
    }
    else {
      BOOL v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "identity.type == kBiometricKitIdentityTypeFace";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      uint64_t v21 = &unk_222DFB9BF;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v24 = 1024;
      int v25 = 6421;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v11 = 258;
  }

  return v11;
}

- (void)logRemoveIdentity:(id)a3 withClient:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (BYTE1(self->_loggingDispatchQueue))
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v28 = 8;
    id v6 = a4;
    id v7 = a3;
    int v8 = [(BiometricKitXPCServerPearl *)self performCommand:61 inValue:1 inData:0 inSize:0 outData:&v29 outSize:&v28];
    if (v8)
    {
      int v20 = v8;
      if (__osLog) {
        uint64_t v21 = __osLog;
      }
      else {
        uint64_t v21 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136316162;
      id v32 = "err == 0 ";
      __int16 v33 = 2048;
      uint64_t v34 = v20;
      __int16 v35 = 2080;
      id v36 = &unk_222DFB9BF;
      __int16 v37 = 2080;
      long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v39 = 1024;
      int v40 = 6453;
    }
    else
    {
      if (v28 == 8)
      {
        unsigned int v9 = HIDWORD(v29);
        uint64_t v30 = v29;
        if (!v29)
        {
          BOOL v13 = 0;
LABEL_10:
          uint64_t v29 = 0;
          int v14 = [(BiometricKitXPCServerPearl *)self performCommand:61 inValue:9 inData:0 inSize:0 outData:&v29 outSize:&v28];
          if (v14)
          {
            int v22 = v14;
            if (__osLog) {
              int v23 = __osLog;
            }
            else {
              int v23 = MEMORY[0x263EF8438];
            }
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            *(_DWORD *)buf = 136316162;
            id v32 = "err == 0 ";
            __int16 v33 = 2048;
            uint64_t v34 = v22;
            __int16 v35 = 2080;
            id v36 = &unk_222DFB9BF;
            __int16 v37 = 2080;
            long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v39 = 1024;
            int v40 = 6474;
          }
          else
          {
            if (v28 == 8)
            {
              unsigned int v15 = HIDWORD(v29);
              uint64_t v30 = v29;
              if (v29)
              {
                if (HIDWORD(v29) > v29)
                {
                  if (__osLog) {
                    uint64_t v26 = __osLog;
                  }
                  else {
                    uint64_t v26 = MEMORY[0x263EF8438];
                  }
                  if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_75;
                  }
                  *(_DWORD *)buf = 136316162;
                  id v32 = "templatePOSize <= bufferSize";
                  __int16 v33 = 2048;
                  uint64_t v34 = 0;
                  __int16 v35 = 2080;
                  id v36 = &unk_222DFB9BF;
                  __int16 v37 = 2080;
                  long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v39 = 1024;
                  int v40 = 6482;
                  goto LABEL_74;
                }
                id v16 = malloc_type_malloc(v29, 0x195ECEE0uLL);
                if (!v16)
                {
                  if (__osLog) {
                    uint64_t v26 = __osLog;
                  }
                  else {
                    uint64_t v26 = MEMORY[0x263EF8438];
                  }
                  if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_75;
                  }
                  *(_DWORD *)buf = 136316162;
                  id v32 = "buffer";
                  __int16 v33 = 2048;
                  uint64_t v34 = 0;
                  __int16 v35 = 2080;
                  id v36 = &unk_222DFB9BF;
                  __int16 v37 = 2080;
                  long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v39 = 1024;
                  int v40 = 6485;
                  goto LABEL_74;
                }
                uint64_t v17 = v16;
                int v18 = [(BiometricKitXPCServerPearl *)self performCommand:61 inValue:10 inData:0 inSize:0 outData:v16 outSize:&v30];
                if (!v18)
                {
                  uint64_t v19 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v17 length:v30 freeWhenDone:1];
LABEL_76:
                  [self->_pearlDeviceState logRemoveIdentity:v7 withTemplateListData:v13 templateSize:v9 client:v6 isPO:0];
                  [self->_pearlDeviceState logRemoveIdentity:v7 withTemplateListData:v19 templateSize:v15 client:v6 isPO:1];

                  return;
                }
                int v27 = v18;
                if (__osLog) {
                  uint64_t v26 = __osLog;
                }
                else {
                  uint64_t v26 = MEMORY[0x263EF8438];
                }
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  id v32 = "err == 0 ";
                  __int16 v33 = 2048;
                  uint64_t v34 = v27;
                  __int16 v35 = 2080;
                  id v36 = &unk_222DFB9BF;
                  __int16 v37 = 2080;
                  long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
                  __int16 v39 = 1024;
                  int v40 = 6487;
LABEL_74:
                  _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
              }
LABEL_75:
              uint64_t v19 = 0;
              goto LABEL_76;
            }
            if (__osLog) {
              int v23 = __osLog;
            }
            else {
              int v23 = MEMORY[0x263EF8438];
            }
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
LABEL_40:
              unsigned int v15 = 0;
              goto LABEL_75;
            }
            *(_DWORD *)buf = 136316162;
            id v32 = "size == sizeof(outData)";
            __int16 v33 = 2048;
            uint64_t v34 = 0;
            __int16 v35 = 2080;
            id v36 = &unk_222DFB9BF;
            __int16 v37 = 2080;
            long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v39 = 1024;
            int v40 = 6475;
          }
          _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_40;
        }
        if (HIDWORD(v29) > v29)
        {
          if (__osLog) {
            __int16 v24 = __osLog;
          }
          else {
            __int16 v24 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
          *(_DWORD *)buf = 136316162;
          id v32 = "templateSize <= bufferSize";
          __int16 v33 = 2048;
          uint64_t v34 = 0;
          __int16 v35 = 2080;
          id v36 = &unk_222DFB9BF;
          __int16 v37 = 2080;
          long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v39 = 1024;
          int v40 = 6461;
        }
        else
        {
          id v10 = malloc_type_malloc(v29, 0x86DE4299uLL);
          if (v10)
          {
            int v11 = v10;
            int v12 = [(BiometricKitXPCServerPearl *)self performCommand:61 inValue:2 inData:0 inSize:0 outData:v10 outSize:&v30];
            if (!v12)
            {
              BOOL v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v11 length:v30 freeWhenDone:1];
              goto LABEL_10;
            }
            int v25 = v12;
            if (__osLog) {
              __int16 v24 = __osLog;
            }
            else {
              __int16 v24 = MEMORY[0x263EF8438];
            }
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              goto LABEL_57;
            }
            *(_DWORD *)buf = 136316162;
            id v32 = "err == 0 ";
            __int16 v33 = 2048;
            uint64_t v34 = v25;
            __int16 v35 = 2080;
            id v36 = &unk_222DFB9BF;
            __int16 v37 = 2080;
            long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v39 = 1024;
            int v40 = 6466;
          }
          else
          {
            if (__osLog) {
              __int16 v24 = __osLog;
            }
            else {
              __int16 v24 = MEMORY[0x263EF8438];
            }
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              goto LABEL_57;
            }
            *(_DWORD *)buf = 136316162;
            id v32 = "buffer";
            __int16 v33 = 2048;
            uint64_t v34 = 0;
            __int16 v35 = 2080;
            id v36 = &unk_222DFB9BF;
            __int16 v37 = 2080;
            long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
            __int16 v39 = 1024;
            int v40 = 6464;
          }
        }
        _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_57:
        unsigned int v15 = 0;
        uint64_t v19 = 0;
        goto LABEL_58;
      }
      if (__osLog) {
        uint64_t v21 = __osLog;
      }
      else {
        uint64_t v21 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_28:
        unsigned int v15 = 0;
        uint64_t v19 = 0;
        unsigned int v9 = 0;
LABEL_58:
        BOOL v13 = 0;
        goto LABEL_76;
      }
      *(_DWORD *)buf = 136316162;
      id v32 = "size == sizeof(outData)";
      __int16 v33 = 2048;
      uint64_t v34 = 0;
      __int16 v35 = 2080;
      id v36 = &unk_222DFB9BF;
      __int16 v37 = 2080;
      long long v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v39 = 1024;
      int v40 = 6454;
    }
    _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_28;
  }
}

- (int)removeIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BiometricKitXPCServerPearl;
  signed int v10 = [(BiometricKitXPCServer *)&v14 removeIdentity:v8 withOptions:a4 withClient:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    if (__osLog) {
      BOOL v13 = __osLog;
    }
    else {
      BOOL v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      int v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 6509;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    [(BiometricKitXPCServerPearl *)self logRemoveIdentity:v8 withClient:v9];
  }

  return v11;
}

- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)BiometricKitXPCServerPearl;
  signed int v6 = [(BiometricKitXPCServer *)&v10 getBioLockoutState:a3 forUser:*(void *)&a4 withClient:a5];
  uint64_t v7 = v6;
  if (v6)
  {
    if (__osLog) {
      id v9 = __osLog;
    }
    else {
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v12 = "err == 0 ";
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      id v16 = &unk_222DFB9BF;
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v19 = 1024;
      int v20 = 6528;
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (a3 && (*((unsigned char *)a3 + 1) & 1) != 0)
  {
    [(id)objc_opt_class() reportPearlInterlock:1];
  }
  return v7;
}

- (int64_t)getDeviceStateWithClient:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    signed int v6 = __osLogTrace;
  }
  else {
    signed int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    int64_t v11 = (int64_t)v4;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "getDeviceStateWithClient: %@\n", (uint8_t *)&v10, 0xCu);
  }
  int64_t v7 = *(void *)&self->_peakPowerPressureLevelNtfToken;
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = v5;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    int64_t v11 = v7;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "getDeviceStateWithClient: -> %lu\n", (uint8_t *)&v10, 0xCu);
  }

  return v7;
}

- (int)startNewMatchAttemptWithClient:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    signed int v6 = __osLogTrace;
  }
  else {
    signed int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138412290;
    __int16 v19 = v4;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "startNewMatchAttemptWithClient: %@\n", (uint8_t *)&v18, 0xCu);
  }
  int64_t v7 = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(v7);
  id v8 = [(BiometricKitXPCServer *)self runningBioOp];
  id v9 = [v8 client];
  BOOL v10 = v9 == v4;

  if (v10)
  {
    int v11 = [(BiometricKitXPCServerPearl *)self performCommand:33 inValue:0 inData:0 inSize:0 outData:0 outSize:0];
    if (v11)
    {
      __int16 v17 = (__osLog ? __osLog : v5);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316162;
        __int16 v19 = "err == 0 ";
        __int16 v20 = 2048;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        __int16 v23 = &unk_222DFB9BF;
        __int16 v24 = 2080;
        uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v26 = 1024;
        int v27 = 6573;
        _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      __int16 v19 = "client == [self.runningBioOp client]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      __int16 v23 = &unk_222DFB9BF;
      __int16 v24 = 2080;
      uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v26 = 1024;
      int v27 = 6570;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    int v11 = 257;
  }
  objc_sync_exit(v7);

  if (__osLogTrace) {
    uint64_t v12 = __osLogTrace;
  }
  else {
    uint64_t v12 = v5;
  }
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v11;
      __int16 v13 = v12;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_16:
      _os_log_impl(&dword_222D7E000, v13, v14, "startNewMatchAttemptWithClient: -> (%{errno}d)\n", (uint8_t *)&v18, 8u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 67109120;
    LODWORD(v19) = 0;
    __int16 v13 = v12;
    os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
    goto LABEL_16;
  }

  return 0;
}

- (int)completeEnrollmentWithClient:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    signed int v6 = __osLogTrace;
  }
  else {
    signed int v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    int v18 = v4;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "completeEnrollmentWithClient: %@\n", (uint8_t *)&v17, 0xCu);
  }
  int64_t v7 = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(v7);
  id v8 = [(BiometricKitXPCServer *)self runningBioOp];
  id v9 = [v8 client];
  BOOL v10 = v9 == v4;

  if (v10)
  {
    int v11 = [(BiometricKitXPCServerPearl *)self performCommand:42 inValue:0 inData:0 inSize:0 outData:0 outSize:0];
    if (!v11)
    {
      objc_sync_exit(v7);

      if (__osLogTrace) {
        uint64_t v12 = __osLogTrace;
      }
      else {
        uint64_t v12 = v5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 67109120;
        LODWORD(v18) = 0;
        _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEBUG, "completeEnrollmentWithClient: -> (%{errno}d)\n", (uint8_t *)&v17, 8u);
      }
      int v11 = 0;
      goto LABEL_14;
    }
    if (__osLog) {
      __int16 v15 = __osLog;
    }
    else {
      __int16 v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      int v18 = "err == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      __int16 v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 6598;
      _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      os_log_type_t v14 = __osLog;
    }
    else {
      os_log_type_t v14 = v5;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      int v18 = "client == [self.runningBioOp client]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = &unk_222DFB9BF;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v25 = 1024;
      int v26 = 6595;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    int v11 = 257;
  }
  objc_sync_exit(v7);

  if (__osLogTrace) {
    id v16 = __osLogTrace;
  }
  else {
    id v16 = v5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v17 = 67109120;
    LODWORD(v18) = v11;
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "completeEnrollmentWithClient: -> (%{errno}d)\n", (uint8_t *)&v17, 8u);
  }
LABEL_14:

  return v11;
}

- (int)setTemplate:(id)a3 forIdentity:(id)a4 withClient:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    uint64_t v12 = __osLogTrace;
  }
  else {
    uint64_t v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = v12;
    int v30 = 134218498;
    id v31 = (const char *)[v8 length];
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    __int16 v35 = v10;
    _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_DEBUG, "setTemplate: [%ld] %@ %@\n", (uint8_t *)&v30, 0x20u);
  }
  if (!v8)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = v11;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v30 = 136316162;
    id v31 = "template";
    __int16 v32 = 2048;
    id v33 = 0;
    __int16 v34 = 2080;
    __int16 v35 = &unk_222DFB9BF;
    __int16 v36 = 2080;
    __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v38 = 1024;
    int v39 = 6622;
    goto LABEL_28;
  }
  if (!v9)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = v11;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v30 = 136316162;
    id v31 = "identity";
    __int16 v32 = 2048;
    id v33 = 0;
    __int16 v34 = 2080;
    __int16 v35 = &unk_222DFB9BF;
    __int16 v36 = 2080;
    __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v38 = 1024;
    int v39 = 6623;
LABEL_28:
    _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
LABEL_29:
    int v23 = 258;
    goto LABEL_47;
  }
  int v14 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", [v9 userID]);
  if (v14)
  {
    int v23 = v14;
    if (__osLog) {
      int v26 = __osLog;
    }
    else {
      int v26 = v11;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136316162;
      id v31 = "err == 0 ";
      __int16 v32 = 2048;
      id v33 = (id)v23;
      __int16 v34 = 2080;
      __int16 v35 = &unk_222DFB9BF;
      __int16 v36 = 2080;
      __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v38 = 1024;
      int v39 = 6632;
      _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
    }
  }
  else
  {
    unsigned int v15 = [v8 length];
    size_t v16 = v15 + 24;
    int v17 = malloc_type_malloc(v16, 0xD4DCD540uLL);
    if (v17)
    {
      int v18 = v17;
      __int16 v19 = v11;
      *int v17 = [v9 userID];
      uint64_t v20 = [v9 uuid];
      [v20 getUUIDBytes:v18 + 1];

      v18[5] = v15;
      memcpy(v18 + 6, (const void *)[v8 bytes], v15);
      int v21 = [(BiometricKitXPCServerPearl *)self performCommand:49 inValue:0 inData:v18 inSize:v16 outData:0 outSize:0];
      if (!v21)
      {
        [(BiometricKitXPCServer *)self saveCatacomb];
        free(v18);
        if (__osLogTrace) {
          __int16 v22 = __osLogTrace;
        }
        else {
          __int16 v22 = v19;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          int v30 = 67109120;
          LODWORD(v31) = 0;
          _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_DEBUG, "setTemplate: -> (%{errno}d)\n", (uint8_t *)&v30, 8u);
        }
        int v23 = 0;
        goto LABEL_17;
      }
      int v23 = v21;
      int v11 = v19;
      if (__osLog) {
        uint64_t v28 = __osLog;
      }
      else {
        uint64_t v28 = v19;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        id v31 = "err == 0 ";
        __int16 v32 = 2048;
        id v33 = (id)v23;
        __int16 v34 = 2080;
        __int16 v35 = &unk_222DFB9BF;
        __int16 v36 = 2080;
        __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v38 = 1024;
        int v39 = 6647;
        _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
      }
      free(v18);
    }
    else
    {
      if (__osLog) {
        uint64_t v27 = __osLog;
      }
      else {
        uint64_t v27 = v11;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        id v31 = "inData";
        __int16 v32 = 2048;
        id v33 = 0;
        __int16 v34 = 2080;
        __int16 v35 = &unk_222DFB9BF;
        __int16 v36 = 2080;
        __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v38 = 1024;
        int v39 = 6638;
        _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
      }
      int v23 = 260;
    }
  }
LABEL_47:
  if (__osLogTrace) {
    uint64_t v29 = __osLogTrace;
  }
  else {
    uint64_t v29 = v11;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    int v30 = 67109120;
    LODWORD(v31) = v23;
    _os_log_impl(&dword_222D7E000, v29, OS_LOG_TYPE_ERROR, "setTemplate: -> (%{errno}d)\n", (uint8_t *)&v30, 8u);
  }
LABEL_17:

  return v23;
}

- (int)isPeriocularEnrollmentSupported:(BOOL *)a3 withClient:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int64_t v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v20 = v6;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "isPeriocularEnrollmentSupported: %@\n", buf, 0xCu);
  }
  unsigned __int8 v18 = 0;
  uint64_t v17 = 1;
  if (a3)
  {
    int v9 = [(BiometricKitXPCServerPearl *)self performCommand:67 inValue:0 inData:0 inSize:0 outData:&v18 outSize:&v17];
    if (!v9)
    {
      if (v17 == 1)
      {
        *a3 = v18 != 0;
      }
      else
      {
        if (__osLog) {
          size_t v16 = __osLog;
        }
        else {
          size_t v16 = v7;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)uint64_t v20 = "size == sizeof(outData)";
          *(_WORD *)&v20[8] = 2048;
          uint64_t v21 = 0;
          __int16 v22 = 2080;
          int v23 = &unk_222DFB9BF;
          __int16 v24 = 2080;
          __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v26 = 1024;
          int v27 = 6681;
          _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      if (__osLogTrace) {
        id v10 = __osLogTrace;
      }
      else {
        id v10 = v7;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v20 = 0;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v18;
        _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "isPeriocularEnrollmentSupported: -> (%{errno}d), isSupported=%u\n", buf, 0xEu);
      }
      int v11 = 0;
      goto LABEL_16;
    }
    int v11 = v9;
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      int v23 = &unk_222DFB9BF;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v26 = 1024;
      int v27 = 6680;
      _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = v7;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v20 = "supported";
      *(_WORD *)&v20[8] = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      int v23 = &unk_222DFB9BF;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v26 = 1024;
      int v27 = 6677;
      _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v11 = 258;
  }
  if (__osLogTrace) {
    unsigned int v15 = __osLogTrace;
  }
  else {
    unsigned int v15 = v7;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v20 = v11;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v18;
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "isPeriocularEnrollmentSupported: -> (%{errno}d), isSupported=%u\n", buf, 0xEu);
  }
LABEL_16:

  return v11;
}

- (int)getPeriocularMatchStateForUser:(unsigned int)a3 state:(int64_t *)a4 withClient:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a5;
  int v9 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)int v23 = a3;
    *(_WORD *)&v23[4] = 2112;
    *(void *)&v23[6] = v8;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "getPeriocularMatchStateForUser: %u %@\n", buf, 0x12u);
  }
  unsigned int v20 = 0;
  unsigned int v21 = a3;
  uint64_t v19 = 4;
  if (a4)
  {
    int v11 = [(BiometricKitXPCServerPearl *)self performCommand:69 inValue:0 inData:&v21 inSize:4 outData:&v20 outSize:&v19];
    if (!v11)
    {
      if (v19 == 4)
      {
        *a4 = v20;
      }
      else
      {
        if (__osLog) {
          unsigned __int8 v18 = __osLog;
        }
        else {
          unsigned __int8 v18 = v9;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)int v23 = "size == sizeof(outData)";
          *(_WORD *)&v23[8] = 2048;
          *(void *)&v23[10] = 0;
          __int16 v24 = 2080;
          __int16 v25 = &unk_222DFB9BF;
          __int16 v26 = 2080;
          int v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
          __int16 v28 = 1024;
          int v29 = 6710;
          _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      if (__osLogTrace) {
        uint64_t v12 = __osLogTrace;
      }
      else {
        uint64_t v12 = v9;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v23 = 0;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v20;
        _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEBUG, "getPeriocularMatchStateForUser: -> (%{errno}d), state=0x%x\n", buf, 0xEu);
      }
      int v13 = 0;
      goto LABEL_16;
    }
    int v13 = v11;
    if (__osLog) {
      size_t v16 = __osLog;
    }
    else {
      size_t v16 = v9;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)int v23 = "err == 0 ";
      *(_WORD *)&v23[8] = 2048;
      *(void *)&v23[10] = v13;
      __int16 v24 = 2080;
      __int16 v25 = &unk_222DFB9BF;
      __int16 v26 = 2080;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v28 = 1024;
      int v29 = 6709;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      unsigned int v15 = __osLog;
    }
    else {
      unsigned int v15 = v9;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)int v23 = "state";
      *(_WORD *)&v23[8] = 2048;
      *(void *)&v23[10] = 0;
      __int16 v24 = 2080;
      __int16 v25 = &unk_222DFB9BF;
      __int16 v26 = 2080;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v28 = 1024;
      int v29 = 6706;
      _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v13 = 258;
  }
  if (__osLogTrace) {
    uint64_t v17 = __osLogTrace;
  }
  else {
    uint64_t v17 = v9;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)int v23 = v13;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v20;
    _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "getPeriocularMatchStateForUser: -> (%{errno}d), state=0x%x\n", buf, 0xEu);
  }
LABEL_16:

  return v13;
}

- (int)removePeriocularTemplatesWithOptions:(id)a3 withClient:(id)a4
{
  v40[3] = *MEMORY[0x263EF8340];
  id v6 = (char *)a3;
  id v7 = a4;
  id v8 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    int v9 = __osLogTrace;
  }
  else {
    int v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v30 = 138412546;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "removePeriocularTemplatesWithOptions: %@ %@\n", (uint8_t *)&v30, 0x16u);
  }
  memset(v40, 0, 22);
  if (!v6)
  {
    if (__osLog) {
      __int16 v24 = __osLog;
    }
    else {
      __int16 v24 = v8;
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    int v30 = 136316162;
    id v31 = "options";
    __int16 v32 = 2048;
    id v33 = 0;
    __int16 v34 = 2080;
    __int16 v35 = &unk_222DFB9BF;
    __int16 v36 = 2080;
    __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v38 = 1024;
    int v39 = 6737;
    goto LABEL_42;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"BKRemovePOTemplatesIdentityUserID"];
  if (!v10)
  {
    if (__osLog) {
      __int16 v24 = __osLog;
    }
    else {
      __int16 v24 = v8;
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    int v30 = 136316162;
    id v31 = "value";
    __int16 v32 = 2048;
    id v33 = 0;
    __int16 v34 = 2080;
    __int16 v35 = &unk_222DFB9BF;
    __int16 v36 = 2080;
    __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v38 = 1024;
    int v39 = 6746;
LABEL_42:
    _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
LABEL_43:
    __int16 v22 = 0;
    int v11 = 0;
LABEL_56:
    int v21 = 258;
    goto LABEL_86;
  }
  int v11 = (void *)v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = v8;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    int v30 = 136316162;
    id v31 = "[value isKindOfClass:[NSNumber class]]";
    __int16 v32 = 2048;
    id v33 = 0;
    __int16 v34 = 2080;
    __int16 v35 = &unk_222DFB9BF;
    __int16 v36 = 2080;
    __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v38 = 1024;
    int v39 = 6747;
    goto LABEL_54;
  }
  int v12 = [v11 unsignedIntValue];
  if (v12 == -1)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = v8;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    int v30 = 136316162;
    id v31 = "userID != 4294967295U";
    __int16 v32 = 2048;
    id v33 = 0;
    __int16 v34 = 2080;
    __int16 v35 = &unk_222DFB9BF;
    __int16 v36 = 2080;
    __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v38 = 1024;
    int v39 = 6749;
LABEL_54:
    _os_log_impl(&dword_222D7E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
LABEL_55:
    __int16 v22 = 0;
    goto LABEL_56;
  }
  int v13 = v12;
  int v14 = [v6 objectForKeyedSubscript:@"BKRemovePOTemplatesIdentityUUID"];

  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        int v27 = __osLog;
      }
      else {
        int v27 = v8;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        id v31 = "[value isKindOfClass:[NSUUID class]]";
        __int16 v32 = 2048;
        id v33 = 0;
        __int16 v34 = 2080;
        __int16 v35 = &unk_222DFB9BF;
        __int16 v36 = 2080;
        __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v38 = 1024;
        int v39 = 6753;
        _os_log_impl(&dword_222D7E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
      }
      __int16 v22 = 0;
      int v21 = 258;
      int v11 = v14;
      goto LABEL_86;
    }
    id v15 = v14;
  }
  int v11 = [v6 objectForKeyedSubscript:@"BKRemovePOTemplatesRemoveAll"];

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        __int16 v28 = __osLog;
      }
      else {
        __int16 v28 = v8;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        id v31 = "[value isKindOfClass:[NSNumber class]]";
        __int16 v32 = 2048;
        id v33 = 0;
        __int16 v34 = 2080;
        __int16 v35 = &unk_222DFB9BF;
        __int16 v36 = 2080;
        __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v38 = 1024;
        int v39 = 6759;
        _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
      }
      int v21 = 258;
      goto LABEL_85;
    }
    int v16 = [v11 BOOLValue];
  }
  else
  {
    int v16 = 0;
  }
  LODWORD(v40[0]) = v13;
  if (v14)
  {
    [v14 getUUIDBytes:(char *)v40 + 4];
    if (!v16) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  BYTE4(v40[2]) = 1;
  if (v16) {
LABEL_19:
  }
    BYTE5(v40[2]) = 1;
LABEL_20:
  int v17 = [(BiometricKitXPCServerPearl *)self performCommand:71 inValue:0 inData:v40 inSize:22 outData:0 outSize:0];
  if (v17)
  {
    int v21 = v17;
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = v8;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_85;
    }
    int v30 = 136316162;
    id v31 = "err == 0 ";
    __int16 v32 = 2048;
    id v33 = (id)v21;
    __int16 v34 = 2080;
    __int16 v35 = &unk_222DFB9BF;
    __int16 v36 = 2080;
    __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v38 = 1024;
    int v39 = 6778;
  }
  else
  {
    int v18 = [(BiometricKitXPCServerPearl *)self updatePropertiesOfIdentities];
    if (v18)
    {
      int v21 = v18;
      if (__osLog) {
        __int16 v26 = __osLog;
      }
      else {
        __int16 v26 = v8;
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      int v30 = 136316162;
      id v31 = "err == 0 ";
      __int16 v32 = 2048;
      id v33 = (id)v21;
      __int16 v34 = 2080;
      __int16 v35 = &unk_222DFB9BF;
      __int16 v36 = 2080;
      __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v38 = 1024;
      int v39 = 6782;
    }
    else
    {
      int v19 = [(BiometricKitXPCServer *)self saveCatacomb];
      if (!v19)
      {
        if (__osLogTrace) {
          unsigned int v20 = __osLogTrace;
        }
        else {
          unsigned int v20 = v8;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v30 = 67109120;
          LODWORD(v31) = 0;
          _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_DEBUG, "removePeriocularTemplatesWithOptions: -> %d\n", (uint8_t *)&v30, 8u);
        }
        int v21 = 0;
        __int16 v22 = v14;
        goto LABEL_29;
      }
      int v21 = v19;
      if (__osLog) {
        __int16 v26 = __osLog;
      }
      else {
        __int16 v26 = v8;
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      int v30 = 136316162;
      id v31 = "err == 0 ";
      __int16 v32 = 2048;
      id v33 = (id)v21;
      __int16 v34 = 2080;
      __int16 v35 = &unk_222DFB9BF;
      __int16 v36 = 2080;
      __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v38 = 1024;
      int v39 = 6786;
    }
  }
  _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v30, 0x30u);
LABEL_85:
  __int16 v22 = v14;
LABEL_86:
  if (__osLogTrace) {
    int v29 = __osLogTrace;
  }
  else {
    int v29 = v8;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    int v30 = 67109120;
    LODWORD(v31) = v21;
    _os_log_impl(&dword_222D7E000, v29, OS_LOG_TYPE_ERROR, "removePeriocularTemplatesWithOptions: -> %d\n", (uint8_t *)&v30, 8u);
  }
LABEL_29:

  return v21;
}

- (int)queryPeriocularMigrationState:(BOOL *)a3 clear:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v13 = 0;
  char v11 = 0;
  uint64_t v10 = 1;
  char v12 = 1;
  BOOL v14 = a4;
  int v5 = [(BiometricKitXPCServerPearl *)self performCommand:57 inValue:0 inData:&v12 inSize:6 outData:&v11 outSize:&v10];
  if (v5)
  {
    int v6 = v5;
    if (__osLog) {
      id v8 = __osLog;
    }
    else {
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v16 = "err == 0 ";
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      __int16 v19 = 2080;
      unsigned int v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 6811;
      _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v10 == 1)
  {
    int v6 = 0;
    if (a3) {
      *a3 = v11 != 0;
    }
  }
  else
  {
    if (__osLog) {
      int v9 = __osLog;
    }
    else {
      int v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v16 = "size == sizeof(outData)";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      unsigned int v20 = &unk_222DFB9BF;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v23 = 1024;
      int v24 = 6812;
      _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 261;
  }
  return v6;
}

- (int)suspendEnrollment:(BOOL)a3 withClient:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)__int16 v22 = v4;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = v6;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "suspendEnrollment: %u %@\n", buf, 0x12u);
  }
  BOOL v20 = 0;
  int v9 = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(v9);
  uint64_t v10 = [(BiometricKitXPCServer *)self runningBioOp];
  id v11 = [v10 client];
  BOOL v12 = v11 == v6;

  if (v12)
  {
    BOOL v20 = v4;
    int v13 = [(BiometricKitXPCServerPearl *)self performCommand:48 inValue:0 inData:&v20 inSize:1 outData:0 outSize:0];
    if (v13)
    {
      __int16 v19 = (__osLog ? __osLog : v7);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v22 = "err == 0 ";
        *(_WORD *)&v22[8] = 2048;
        *(void *)&v22[10] = v13;
        __int16 v23 = 2080;
        int v24 = &unk_222DFB9BF;
        __int16 v25 = 2080;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v27 = 1024;
        int v28 = 6844;
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v18 = __osLog;
    }
    else {
      uint64_t v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v22 = "client == [self.runningBioOp client]";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = 0;
      __int16 v23 = 2080;
      int v24 = &unk_222DFB9BF;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v27 = 1024;
      int v28 = 6840;
      _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v13 = 257;
  }
  objc_sync_exit(v9);

  if (__osLogTrace) {
    BOOL v14 = __osLogTrace;
  }
  else {
    BOOL v14 = v7;
  }
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v22 = v13;
      id v15 = v14;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_16:
      _os_log_impl(&dword_222D7E000, v15, v16, "suspendEnrollment: -> (%{errno}d)\n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v22 = 0;
    id v15 = v14;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    goto LABEL_16;
  }

  return v13;
}

- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5 withClient:(id)a6
{
  BOOL v6 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    BOOL v12 = __osLogTrace;
  }
  else {
    BOOL v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)__int16 v25 = a3;
    *(_WORD *)&v25[4] = 2048;
    *(void *)&v25[6] = a4;
    *(_WORD *)&v25[14] = 1024;
    *(_DWORD *)&v25[16] = v6;
    *(_WORD *)__int16 v26 = 2112;
    *(void *)&_OWORD v26[2] = v10;
    _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEBUG, "queryIdentityMigrationFailureForUser: %u %p %u %@\n", buf, 0x22u);
  }
  memset(v23, 0, 6);
  char v22 = 0;
  uint64_t v21 = 1;
  if ([(BiometricKitXPCServer *)self isClassCFileAccessible])
  {
    *(_DWORD *)((char *)v23 + 1) = a3;
    BYTE1(v23[1]) = v6;
    int v13 = [(BiometricKitXPCServerPearl *)self performCommand:57 inValue:0 inData:v23 inSize:6 outData:&v22 outSize:&v21];
    if (v13)
    {
      int v15 = v13;
      if (__osLog) {
        uint64_t v18 = __osLog;
      }
      else {
        uint64_t v18 = v11;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v25 = "err == 0 ";
        *(_WORD *)&v25[8] = 2048;
        *(void *)&v25[10] = v15;
        *(_WORD *)&v25[18] = 2080;
        *(void *)__int16 v26 = &unk_222DFB9BF;
        *(_WORD *)&v26[8] = 2080;
        __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v28 = 1024;
        int v29 = 6872;
        _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (v21 == 1)
      {
        if (v6) {
          [(BiometricKitXPCServer *)self saveCatacomb];
        }
        if (a4) {
          *a4 = v22 != 0;
        }
        if (__osLogTrace) {
          BOOL v14 = __osLogTrace;
        }
        else {
          BOOL v14 = v11;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)__int16 v25 = 0;
          _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_DEBUG, "queryIdentityMigrationFailureForUser: -> (%{errno}d)\n", buf, 8u);
        }
        int v15 = 0;
        goto LABEL_19;
      }
      if (__osLog) {
        __int16 v19 = __osLog;
      }
      else {
        __int16 v19 = v11;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v25 = "size == sizeof(outData)";
        *(_WORD *)&v25[8] = 2048;
        *(void *)&v25[10] = 0;
        *(_WORD *)&v25[18] = 2080;
        *(void *)__int16 v26 = &unk_222DFB9BF;
        *(_WORD *)&v26[8] = 2080;
        __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v28 = 1024;
        int v29 = 6873;
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v15 = 261;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v17 = __osLog;
    }
    else {
      __int16 v17 = v11;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v25 = "[self isClassCFileAccessible]";
      *(_WORD *)&v25[8] = 2048;
      *(void *)&v25[10] = 0;
      *(_WORD *)&v25[18] = 2080;
      *(void *)__int16 v26 = &unk_222DFB9BF;
      *(_WORD *)&v26[8] = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v28 = 1024;
      int v29 = 6866;
      _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v15 = 257;
  }
  if (__osLogTrace) {
    BOOL v20 = __osLogTrace;
  }
  else {
    BOOL v20 = v11;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v25 = v15;
    _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_ERROR, "queryIdentityMigrationFailureForUser: -> (%{errno}d)\n", buf, 8u);
  }
LABEL_19:

  return v15;
}

- (int)enableMatchAutoRetry:(BOOL)a3 withClient:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)char v22 = v4;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = v6;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "enableMatchAutoRetry: %u %@\n", buf, 0x12u);
  }
  BOOL v20 = v4;
  int v9 = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(v9);
  id v10 = [(BiometricKitXPCServer *)self runningBioOp];
  id v11 = [v10 client];
  BOOL v12 = v11 == v6;

  if (v12)
  {
    int v13 = [(BiometricKitXPCServerPearl *)self performCommand:32 inValue:0 inData:&v20 inSize:1 outData:0 outSize:0];
    if (v13)
    {
      if (__osLog) {
        __int16 v19 = __osLog;
      }
      else {
        __int16 v19 = v7;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)char v22 = "err == 0 ";
        *(_WORD *)&v22[8] = 2048;
        *(void *)&v22[10] = v13;
        __int16 v23 = 2080;
        int v24 = &unk_222DFB9BF;
        __int16 v25 = 2080;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v27 = 1024;
        int v28 = 6908;
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      char v14 = 0;
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v18 = __osLog;
    }
    else {
      uint64_t v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)char v22 = "client == [self.runningBioOp client]";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = 0;
      __int16 v23 = 2080;
      int v24 = &unk_222DFB9BF;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v27 = 1024;
      int v28 = 6905;
      _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    char v14 = 0;
    int v13 = 257;
  }
  objc_sync_exit(v9);

  if (v13) {
    char v15 = v14;
  }
  else {
    char v15 = 1;
  }
  if (__osLogTrace) {
    os_log_type_t v16 = __osLogTrace;
  }
  else {
    os_log_type_t v16 = v7;
  }
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)char v22 = 0;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_DEBUG, "enableMatchAutoRetry: -> (%{errno}d)\n", buf, 8u);
    }
    int v13 = 0;
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)char v22 = v13;
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "enableMatchAutoRetry: -> (%{errno}d)\n", buf, 8u);
  }

  return v13;
}

- (int)pauseFaceDetectTimer:(BOOL)a3 withClient:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 67109378;
    *(_DWORD *)uint64_t v21 = v4;
    *(_WORD *)&v21[4] = 2112;
    *(void *)&v21[6] = v6;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "pauseFaceDetectTimer: %u %@\n", (uint8_t *)&v20, 0x12u);
  }
  int v9 = [(BiometricKitXPCServer *)self bioOpsQueue];
  objc_sync_enter(v9);
  id v10 = [(BiometricKitXPCServer *)self runningBioOp];
  id v11 = [v10 client];
  BOOL v12 = v11 == v6;

  if (v12)
  {
    int v13 = [(BiometricKitXPCServerPearl *)self performCommand:63 inValue:v4 inData:0 inSize:0 outData:0 outSize:0];
    if (v13)
    {
      if (__osLog) {
        __int16 v19 = __osLog;
      }
      else {
        __int16 v19 = v7;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316162;
        *(void *)uint64_t v21 = "err == 0 ";
        *(_WORD *)&v21[8] = 2048;
        *(void *)&unsigned char v21[10] = v13;
        __int16 v22 = 2080;
        __int16 v23 = &unk_222DFB9BF;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
        __int16 v26 = 1024;
        int v27 = 6934;
        _os_log_impl(&dword_222D7E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      char v14 = 0;
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v18 = __osLog;
    }
    else {
      uint64_t v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      *(void *)uint64_t v21 = "client == [self.runningBioOp client]";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = 0;
      __int16 v22 = 2080;
      __int16 v23 = &unk_222DFB9BF;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v26 = 1024;
      int v27 = 6931;
      _os_log_impl(&dword_222D7E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    char v14 = 0;
    int v13 = 257;
  }
  objc_sync_exit(v9);

  if (v13) {
    char v15 = v14;
  }
  else {
    char v15 = 1;
  }
  if (__osLogTrace) {
    os_log_type_t v16 = __osLogTrace;
  }
  else {
    os_log_type_t v16 = v7;
  }
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 67109120;
      *(_DWORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_DEBUG, "pauseFaceDetectTimer: -> (%{errno}d)\n", (uint8_t *)&v20, 8u);
    }
    int v13 = 0;
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v20 = 67109120;
    *(_DWORD *)uint64_t v21 = v13;
    _os_log_impl(&dword_222D7E000, v16, OS_LOG_TYPE_ERROR, "pauseFaceDetectTimer: -> (%{errno}d)\n", (uint8_t *)&v20, 8u);
  }

  return v13;
}

- (int)performCancelCommand
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = [(BiometricKitXPCServerPearl *)self performCommand:6 inValue:0 inData:0 inSize:0 outData:0 outSize:0];
  uint64_t v3 = v2;
  if (v2)
  {
    if (__osLog) {
      int v5 = __osLog;
    }
    else {
      int v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136316162;
      uint64_t v7 = "err == 0 ";
      __int16 v8 = 2048;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      id v11 = &unk_222DFB9BF;
      __int16 v12 = 2080;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v14 = 1024;
      int v15 = 6953;
      _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
  }
  return v3;
}

- (int)performDisplayStatusChangedCommand:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [(BiometricKitXPCServerPearl *)self performCommand:52 inValue:a3 inData:0 inSize:0 outData:0 outSize:0];
  uint64_t v4 = v3;
  if (v3)
  {
    if (__osLog) {
      int v6 = __osLog;
    }
    else {
      int v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      __int16 v8 = "err == 0 ";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = &unk_222DFB9BF;
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v15 = 1024;
      int v16 = 6970;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedMetadataObjectsTimestamp, 0);
  objc_storeStrong((id *)&self->_avcQueue, 0);
  objc_storeStrong((id *)&self->_avcObservers, 0);
  objc_storeStrong((id *)&self->_avcSession, 0);
  objc_storeStrong((id *)&self->_avcOutput, 0);
  objc_storeStrong((id *)&self->_avcInput, 0);
  objc_storeStrong((id *)&self->_avcDevice, 0);
  objc_storeStrong((id *)&self->_unlockWithGlassesFailCount, 0);
  objc_storeStrong((id *)&self->_localToken.val[7], 0);
  objc_storeStrong((id *)&self->_coachingHintsEnabled, 0);
  objc_storeStrong((id *)&self->_lastGravity.z, 0);
  objc_storeStrong((id *)&self->_lastDeviceOrientation, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_wakeGestureManager, 0);
  objc_storeStrong((id *)&self->_analyticsDispatchQueue, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_logSequenceDebug, 0);
  objc_storeStrong((id *)&self->_sharedMemoryTransferQueue, 0);
  objc_storeStrong((id *)&self->_loggingOnRelease, 0);
  objc_storeStrong((id *)&self->_pearlDeviceState, 0);

  objc_storeStrong((id *)&self->_driverNotifyPort, 0);
}

@end