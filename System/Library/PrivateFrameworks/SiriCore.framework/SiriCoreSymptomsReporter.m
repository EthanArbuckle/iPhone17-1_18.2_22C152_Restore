@interface SiriCoreSymptomsReporter
+ (id)sharedInstance;
- (NSLock)lock;
- (NSMutableDictionary)keysAcceptedWithTimestamp;
- (NSMutableDictionary)keysRejectedWithTimestamp;
- (id)_processNameForPid:(int)a3;
- (id)_subtypeContextStringFromContext:(id)a3;
- (void)_getTypeForError:(id)a3 completion:(id)a4;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7 triggerForIDSIdentifiers:(id)a8;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6 processIdentifier:(int)a7 walkboutStatus:(BOOL)a8 triggerForIDSIdentifiers:(id)a9;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6 processIdentifier:(int)a7 walkboutStatus:(BOOL)a8 triggerForIDSIdentifiers:(id)a9 withPcap:(BOOL)a10;
- (void)reportIssueForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7;
- (void)reportIssueForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7 withPcap:(BOOL)a8;
- (void)reportIssueWithBackOffTimerForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7;
- (void)setKeysAcceptedWithTimestamp:(id)a3;
- (void)setKeysRejectedWithTimestamp:(id)a3;
- (void)setLock:(id)a3;
@end

@implementation SiriCoreSymptomsReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_keysRejectedWithTimestamp, 0);

  objc_storeStrong((id *)&self->_keysAcceptedWithTimestamp, 0);
}

- (void)setLock:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setKeysRejectedWithTimestamp:(id)a3
{
}

- (NSMutableDictionary)keysRejectedWithTimestamp
{
  return self->_keysRejectedWithTimestamp;
}

- (void)setKeysAcceptedWithTimestamp:(id)a3
{
}

- (NSMutableDictionary)keysAcceptedWithTimestamp
{
  return self->_keysAcceptedWithTimestamp;
}

- (void)reportIssueForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7 withPcap:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  v15 = (__CFString *)a4;
  id v16 = a5;
  if (v14 && [v14 length])
  {
    v17 = [(SiriCoreSymptomsReporter *)self _processNameForPid:v10];
    if (v15) {
      v18 = v15;
    }
    else {
      v18 = &stru_26CD85388;
    }
    if (v9) {
      v19 = @"_Carry";
    }
    else {
      v19 = @"_NonCarry";
    }
    v20 = [(__CFString *)v18 stringByAppendingString:v19];

    v21 = (void *)[objc_alloc(MEMORY[0x263F7C080]) initWithQueue:0];
    v22 = [(SiriCoreSymptomsReporter *)self _subtypeContextStringFromContext:v16];
    v23 = [v21 signatureWithDomain:@"SiriAssistant" type:v14 subType:v20 subtypeContext:v22 detectedProcess:v17 triggerThresholdValues:0];

    v24 = 0;
    if (v8)
    {
      uint64_t v33 = *MEMORY[0x263F7C0A0];
      uint64_t v31 = *MEMORY[0x263F7C098];
      v32 = &unk_26CD90B28;
      v25 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v34 = v25;
      v24 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __105__SiriCoreSymptomsReporter_reportIssueForType_subType_context_processIdentifier_walkboutStatus_withPcap___block_invoke;
    v27[3] = &unk_26443AA58;
    id v28 = v14;
    v15 = v20;
    v29 = v15;
    v30 = self;
    [v21 snapshotWithSignature:v23 duration:0 events:v16 payload:v24 actions:v27 reply:120.0];
  }
  else
  {
    v26 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[SiriCoreSymptomsReporter reportIssueForType:subType:context:processIdentifier:walkboutStatus:withPcap:]";
      _os_log_impl(&dword_21CBF7000, v26, OS_LOG_TYPE_INFO, "%s Type cannot be nil for ABC", buf, 0xCu);
    }
  }
}

void __105__SiriCoreSymptomsReporter_reportIssueForType_subType_context_processIdentifier_walkboutStatus_withPcap___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v17 = [v3 stringByAppendingString:v4];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F7C160]];

  LODWORD(v4) = [v6 BOOLValue];
  v7 = [*(id *)(a1 + 48) lock];
  [v7 lock];

  uint64_t v8 = *(void *)(a1 + 48);
  if (v4)
  {
    if (*(void *)(v8 + 8))
    {
      uint64_t v9 = 8;
      goto LABEL_9;
    }
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = *(void *)(a1 + 48);
    v12 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = v10;
    uint64_t v9 = 8;
  }
  else
  {
    if (*(void *)(v8 + 16))
    {
      uint64_t v9 = 16;
      goto LABEL_9;
    }
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = *(void *)(a1 + 48);
    v12 = *(void **)(v14 + 16);
    *(void *)(v14 + 16) = v13;
    uint64_t v9 = 16;
  }

LABEL_9:
  v15 = [MEMORY[0x263EFF910] date];
  [*(id *)(*(void *)(a1 + 48) + v9) setObject:v15 forKeyedSubscript:v17];

  id v16 = [*(id *)(a1 + 48) lock];
  [v16 unlock];
}

- (void)reportIssueWithBackOffTimerForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  uint64_t v13 = (__CFString *)a4;
  id v14 = a5;
  if (v12 && [v12 length])
  {
    if (v13) {
      v15 = v13;
    }
    else {
      v15 = &stru_26CD85388;
    }
    id v16 = [v12 stringByAppendingString:v15];
    id v17 = v16;
    if (v7) {
      v18 = @"_Carry";
    }
    else {
      v18 = @"_NonCarry";
    }
    v19 = [v16 stringByAppendingString:v18];

    v20 = [(SiriCoreSymptomsReporter *)self lock];
    [v20 lock];

    keysRejectedWithTimestamp = self->_keysRejectedWithTimestamp;
    if (keysRejectedWithTimestamp)
    {
      v22 = [(NSMutableDictionary *)keysRejectedWithTimestamp objectForKeyedSubscript:v19];
      if (objc_msgSend(v22, "siriCore_isWithin1HourInterval"))
      {
        v23 = *MEMORY[0x263F28338];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v30 = 136315394;
          *(void *)&v30[4] = "-[SiriCoreSymptomsReporter reportIssueWithBackOffTimerForType:subType:context:processIden"
                               "tifier:walkboutStatus:]";
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v19;
          v24 = "%s %@ key was rejected less than an hour ago. Will skip reporting.";
LABEL_20:
          _os_log_impl(&dword_21CBF7000, v23, OS_LOG_TYPE_INFO, v24, v30, 0x16u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
    keysAcceptedWithTimestamp = self->_keysAcceptedWithTimestamp;
    if (keysAcceptedWithTimestamp)
    {
      v22 = [(NSMutableDictionary *)keysAcceptedWithTimestamp objectForKeyedSubscript:v19];
      if (objc_msgSend(v22, "siriCore_isWithin24HourInterval"))
      {
        v23 = *MEMORY[0x263F28338];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v30 = 136315394;
          *(void *)&v30[4] = "-[SiriCoreSymptomsReporter reportIssueWithBackOffTimerForType:subType:context:processIden"
                               "tifier:walkboutStatus:]";
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v19;
          v24 = "%s %@ key was already accepted today. Will skip reporting.";
          goto LABEL_20;
        }
LABEL_21:
        v27 = [(SiriCoreSymptomsReporter *)self lock];
        [v27 unlock];

LABEL_26:
        goto LABEL_27;
      }
    }
    id v28 = [(SiriCoreSymptomsReporter *)self lock];
    [v28 unlock];

    v29 = *MEMORY[0x263F28338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v30 = 136315394;
      *(void *)&v30[4] = "-[SiriCoreSymptomsReporter reportIssueWithBackOffTimerForType:subType:context:processIdentifi"
                           "er:walkboutStatus:]";
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v19;
      _os_log_impl(&dword_21CBF7000, v29, OS_LOG_TYPE_INFO, "%s reporting issue for type: %@", v30, 0x16u);
    }
    v22 = [MEMORY[0x263F285A0] sharedPreferences];
    -[SiriCoreSymptomsReporter reportIssueForType:subType:context:processIdentifier:walkboutStatus:withPcap:](self, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:withPcap:", v12, v13, v14, v8, v7, [v22 includeProbePacketCaptureForABC]);
    goto LABEL_26;
  }
  v25 = *MEMORY[0x263F28338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v30 = 136315138;
    *(void *)&v30[4] = "-[SiriCoreSymptomsReporter reportIssueWithBackOffTimerForType:subType:context:processIdentifier"
                         ":walkboutStatus:]";
    _os_log_impl(&dword_21CBF7000, v25, OS_LOG_TYPE_INFO, "%s invalid type for ABC", v30, 0xCu);
  }
LABEL_27:
}

- (void)reportIssueForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v12 = (void *)MEMORY[0x263F285A0];
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 sharedPreferences];
  -[SiriCoreSymptomsReporter reportIssueForType:subType:context:processIdentifier:walkboutStatus:withPcap:](self, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:withPcap:", v15, v14, v13, v8, v7, [v16 includeProbePacketCaptureForABC]);
}

- (id)_subtypeContextStringFromContext:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v5 = [v3 allKeys];
    v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_35];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__SiriCoreSymptomsReporter__subtypeContextStringFromContext___block_invoke_2;
    v11[3] = &unk_26443AA30;
    id v12 = v3;
    id v7 = v4;
    id v13 = v7;
    [v6 enumerateObjectsUsingBlock:v11];
    uint64_t v8 = v13;
    uint64_t v9 = (__CFString *)v7;
  }
  else
  {
    uint64_t v9 = &stru_26CD85388;
  }

  return v9;
}

void __61__SiriCoreSymptomsReporter__subtypeContextStringFromContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v11 = [v5 objectForKey:v6];
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v11 description];
  uint64_t v9 = (void *)v8;
  if (a3) {
    uint64_t v10 = @", %@: %@";
  }
  else {
    uint64_t v10 = @"%@: %@";
  }
  objc_msgSend(v7, "appendFormat:", v10, v6, v8);
}

uint64_t __61__SiriCoreSymptomsReporter__subtypeContextStringFromContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:512];
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6 processIdentifier:(int)a7 walkboutStatus:(BOOL)a8 triggerForIDSIdentifiers:(id)a9 withPcap:(BOOL)a10
{
  uint64_t v11 = *(void *)&a7;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v18 = a3;
  v19 = AFAnalyticsEventTypeGetName();
  v20 = [(SiriCoreSymptomsReporter *)self _processNameForPid:v11];
  v21 = (void *)[objc_alloc(MEMORY[0x263F7C080]) initWithQueue:0];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __136__SiriCoreSymptomsReporter_reportIssueForError_type_subtype_context_processIdentifier_walkboutStatus_triggerForIDSIdentifiers_withPcap___block_invoke;
  v28[3] = &unk_26443A9E8;
  BOOL v35 = a8;
  id v29 = v19;
  id v30 = v21;
  id v31 = v15;
  id v32 = v20;
  BOOL v36 = a10;
  id v33 = v17;
  id v34 = v16;
  id v22 = v16;
  id v23 = v17;
  id v24 = v20;
  id v25 = v15;
  id v26 = v21;
  id v27 = v19;
  [(SiriCoreSymptomsReporter *)self _getTypeForError:v18 completion:v28];
}

void __136__SiriCoreSymptomsReporter_reportIssueForError_type_subtype_context_processIdentifier_walkboutStatus_triggerForIDSIdentifiers_withPcap___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "Not ";
    uint64_t v8 = *(void *)(a1 + 32);
    v19 = "-[SiriCoreSymptomsReporter reportIssueForError:type:subtype:context:processIdentifier:walkboutStatus:triggerFo"
          "rIDSIdentifiers:withPcap:]_block_invoke";
    __int16 v20 = 2080;
    *(_DWORD *)buf = 136315906;
    if (a2) {
      id v7 = "";
    }
    v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_DEFAULT, "%s %sReporting error with signature %@ %@", buf, 0x2Au);
  }
  if (a2)
  {
    if ((AFIsHorseman() & 1) != 0 || AFIsNano())
    {
      if (*(unsigned char *)(a1 + 80)) {
        uint64_t v9 = @"_Carry";
      }
      else {
        uint64_t v9 = @"_NonCarry";
      }
      uint64_t v10 = [v5 stringByAppendingString:v9];

      id v5 = (id)v10;
    }
    uint64_t v11 = [*(id *)(a1 + 40) signatureWithDomain:@"SiriAssistant" type:*(void *)(a1 + 32) subType:*(void *)(a1 + 48) subtypeContext:v5 detectedProcess:*(void *)(a1 + 56) triggerThresholdValues:0];
    if (*(unsigned char *)(a1 + 81))
    {
      uint64_t v16 = *MEMORY[0x263F7C0A0];
      uint64_t v14 = *MEMORY[0x263F7C098];
      id v15 = &unk_26CD90B28;
      id v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      id v17 = v12;
      id v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    }
    else
    {
      id v13 = 0;
    }
    [*(id *)(a1 + 40) snapshotWithSignature:v11 withIDSDestinations:*(void *)(a1 + 64) validFor:0 duration:*(void *)(a1 + 72) events:v13 payload:0 actions:600.0 reply:120.0];
  }
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6 processIdentifier:(int)a7 walkboutStatus:(BOOL)a8 triggerForIDSIdentifiers:(id)a9
{
  BOOL v9 = a8;
  uint64_t v10 = *(void *)&a7;
  uint64_t v16 = (void *)MEMORY[0x263F285A0];
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v22 = [v16 sharedPreferences];
  LOBYTE(v21) = [v22 includeProbePacketCaptureForABC];
  [(SiriCoreSymptomsReporter *)self reportIssueForError:v20 type:a4 subtype:v19 context:v18 processIdentifier:v10 walkboutStatus:v9 triggerForIDSIdentifiers:v17 withPcap:v21];
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7 triggerForIDSIdentifiers:(id)a8
{
}

- (id)_processNameForPid:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long buffer = 0u;
  memset(v10, 0, sizeof(v10));
  int v4 = proc_pidinfo(a3, 13, 1uLL, &buffer, 64);
  id v5 = [NSString alloc];
  if (v4 < 1) {
    id v6 = objc_msgSend(v5, "initWithFormat:", @"pid(%ld)", a3, v8);
  }
  else {
    id v6 = objc_msgSend(v5, "initWithFormat:", @"%.*s", 16, v10);
  }

  return v6;
}

- (void)_getTypeForError:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, BOOL, void))a4;
  id v7 = [v5 domain];
  uint64_t v8 = [v5 code];
  BOOL v9 = 0;
  if ([v7 isEqualToString:*MEMORY[0x263F28730]])
  {
    if (v8 > 199)
    {
      if ((unint64_t)(v8 - 200) <= 0x16)
      {
        if (((1 << (v8 + 56)) & 0x700327) != 0) {
          goto LABEL_13;
        }
        if (v8 == 203)
        {
          uint64_t v10 = [v5 userInfo];
          uint64_t v11 = [v10 objectForKey:*MEMORY[0x263F08608]];

          id v12 = [v11 domain];
          int v13 = [v12 isEqualToString:*MEMORY[0x263F283B0]];

          BOOL v9 = 0;
          if (v13)
          {
            uint64_t v14 = [v11 code];
            if (v14 == 1 || v14 == 201 || v14 == 102) {
              BOOL v9 = 1;
            }
          }

          goto LABEL_14;
        }
      }
      if (v8 != 1107 && v8 != 1101) {
        goto LABEL_14;
      }
LABEL_13:
      BOOL v9 = 1;
      goto LABEL_14;
    }
    if ((unint64_t)v8 <= 0x16 && ((1 << v8) & 0x4000B6) != 0) {
      goto LABEL_13;
    }
  }
LABEL_14:
  id v15 = objc_alloc_init(MEMORY[0x263F089D8]);
  AFErrorEnumerate();
  if (v6)
  {
    if ([v15 length]) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    ((void (**)(id, BOOL, id))v6)[2](v6, v9, v16);
  }
}

void __56__SiriCoreSymptomsReporter__getTypeForError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 length];
  id v6 = *(void **)(a1 + 32);
  id v9 = [v4 domain];
  uint64_t v7 = [v4 code];

  if (v5) {
    uint64_t v8 = @"_%@.%ld";
  }
  else {
    uint64_t v8 = @"%@.%ld";
  }
  objc_msgSend(v6, "appendFormat:", v8, v9, v7);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1869 != -1) {
    dispatch_once(&sharedInstance_onceToken_1869, &__block_literal_global_1870);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __42__SiriCoreSymptomsReporter_sharedInstance__block_invoke()
{
  if (AFIsInternalInstall())
  {
    v0 = objc_alloc_init(SiriCoreSymptomsReporter);
    v1 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;

    id v2 = objc_alloc_init(MEMORY[0x263F08958]);
    [(id)sharedInstance_sharedInstance setLock:v2];
  }
}

@end