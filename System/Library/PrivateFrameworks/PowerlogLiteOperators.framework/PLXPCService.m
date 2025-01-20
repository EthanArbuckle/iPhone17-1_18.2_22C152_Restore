@interface PLXPCService
+ (id)defaults;
+ (id)entryAggregateDefinitionXPCEvent;
+ (id)entryAggregateDefinitions;
+ (id)entryEventIntervalDefinitionResponderEvent;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventPointDefinitionClientLogging;
+ (id)entryEventPointDefinitionClientLoggingDrops;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSArray)clientIDs;
- (NSDictionary)clientNames;
- (NSDictionary)permissionCache;
- (NSMutableDictionary)registeredListeners;
- (NSMutableDictionary)registeredResponders;
- (OS_xpc_object)xpcConnection;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLNSNotificationOperatorComposition)registrationNotification;
- (PLSemaphore)satelliteProcessSemaphore;
- (PLTimer)resetPermissionsForClientsTimer;
- (PLXPCService)init;
- (id)registeredOperatorFromDictionary:(id)a3 forMessage:(id)a4;
- (signed)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withProcessName:(id)a6;
- (unsigned)responderWaitTime;
- (void)dailyTasks;
- (void)handlePeer:(id)a3 forEvent:(id)a4;
- (void)handlePeerListenerEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8;
- (void)handlePeerResponderEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8;
- (void)handlePeerShouldLogEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7;
- (void)handleSingleMessage:(id)a3 fromPeer:(id)a4 forEvent:(id)a5;
- (void)initOperatorDependancies;
- (void)initSatelliteProcessSemaphore;
- (void)logMessage:(id)a3 withPayload:(id)a4;
- (void)resetPermissionsForClients;
- (void)respondToEvent:(id)a3 withResponse:(id)a4;
- (void)setClientIDs:(id)a3;
- (void)setClientNames:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setPermissionCache:(id)a3;
- (void)setRegisteredListeners:(id)a3;
- (void)setRegisteredResponders:(id)a3;
- (void)setRegistrationNotification:(id)a3;
- (void)setResetPermissionsForClientsTimer:(id)a3;
- (void)setResponderWaitTime:(unsigned int)a3;
- (void)setSatelliteProcessExit;
- (void)setSatelliteProcessExitWithTime:(double)a3;
- (void)setSatelliteProcessSemaphore:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)stopPowerlogHelperd:(id)a3;
@end

@implementation PLXPCService

- (void)handlePeer:(id)a3 forEvent:(id)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1D942AE70]();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5AFD0 != -1) {
      dispatch_once(&qword_1EBD5AFD0, block);
    }
    if (byte_1EBD5AF0B)
    {
      v10 = [NSString stringWithFormat:@"!!! %s/%d: type=%@, event=%@", "-[PLXPCService handlePeer:forEvent:]", 487, v8, v7];
      v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:487];

      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v8 == MEMORY[0x1E4F145A8])
  {
    if (v7 == (id)MEMORY[0x1E4F14528])
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_68;
      }
      uint64_t v50 = objc_opt_class();
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_686;
      v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v96[4] = v50;
      if (qword_1EBD5AFD8 != -1) {
        dispatch_once(&qword_1EBD5AFD8, v96);
      }
      if (!byte_1EBD5AF0C) {
        goto LABEL_68;
      }
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"peer(%d) received XPC_ERROR_CONNECTION_INVALID", xpc_connection_get_pid(v6));
      v51 = (void *)MEMORY[0x1E4F929B8];
      v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v53 = [v52 lastPathComponent];
      v54 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
      [v51 logMessage:v44 fromFile:v53 fromFunction:v54 fromLineNumber:492];

      v49 = PLLogCommon();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_67;
      }
      *(_DWORD *)buf = 138412290;
      v100 = v44;
    }
    else if (v7 == (id)MEMORY[0x1E4F14520])
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_68;
      }
      uint64_t v61 = objc_opt_class();
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_692;
      v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v95[4] = v61;
      if (qword_1EBD5AFE0 != -1) {
        dispatch_once(&qword_1EBD5AFE0, v95);
      }
      if (!byte_1EBD5AF0D) {
        goto LABEL_68;
      }
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", xpc_connection_get_pid(v6));
      v62 = (void *)MEMORY[0x1E4F929B8];
      v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v64 = [v63 lastPathComponent];
      v65 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
      [v62 logMessage:v44 fromFile:v64 fromFunction:v65 fromLineNumber:496];

      v49 = PLLogCommon();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_67;
      }
      *(_DWORD *)buf = 138412290;
      v100 = v44;
    }
    else
    {
      id v41 = (id)MEMORY[0x1E4F14550];
      int v42 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v7 == v41)
      {
        if (!v42) {
          goto LABEL_68;
        }
        uint64_t v66 = objc_opt_class();
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_698;
        v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v94[4] = v66;
        if (qword_1EBD5AFE8 != -1) {
          dispatch_once(&qword_1EBD5AFE8, v94);
        }
        if (!byte_1EBD5AF0E) {
          goto LABEL_68;
        }
        v44 = objc_msgSend(NSString, "stringWithFormat:", @"peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", xpc_connection_get_pid(v6));
        v67 = (void *)MEMORY[0x1E4F929B8];
        v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v69 = [v68 lastPathComponent];
        v70 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
        [v67 logMessage:v44 fromFile:v69 fromFunction:v70 fromLineNumber:500];

        v49 = PLLogCommon();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_67;
        }
        *(_DWORD *)buf = 138412290;
        v100 = v44;
      }
      else
      {
        if (!v42) {
          goto LABEL_68;
        }
        uint64_t v43 = objc_opt_class();
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_704;
        v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v93[4] = v43;
        if (qword_1EBD5AFF0 != -1) {
          dispatch_once(&qword_1EBD5AFF0, v93);
        }
        if (!byte_1EBD5AF0F) {
          goto LABEL_68;
        }
        v44 = [NSString stringWithFormat:@"peer(%d) received Unidentified error:%@", xpc_connection_get_pid(v6), v7];
        v45 = (void *)MEMORY[0x1E4F929B8];
        v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v47 = [v46 lastPathComponent];
        v48 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
        [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:505];

        v49 = PLLogCommon();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
LABEL_67:

LABEL_68:
          xpc_connection_cancel(v6);
          goto LABEL_84;
        }
        *(_DWORD *)buf = 138412290;
        v100 = v44;
      }
    }
    _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_67;
  }
  if (v8 == MEMORY[0x1E4F14590])
  {
    v16 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    v17 = [v16 objectForKeyedSubscript:@"content"];
    if (!v16)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        v55 = [NSString stringWithFormat:@"no message"];
        v56 = (void *)MEMORY[0x1E4F929B8];
        v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v58 = [v57 lastPathComponent];
        v59 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
        [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:549];

        v60 = PLLogCommon();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v55;
          _os_log_debug_impl(&dword_1D2690000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
      if ([MEMORY[0x1E4F92A88] isPowerlogHelperd]) {
        [(PLXPCService *)self setSatelliteProcessExitWithTime:10.0];
      }
      goto LABEL_83;
    }
    v18 = [v16 objectForKeyedSubscript:@"clientID"];
    int v19 = [v18 shortValue];

    if (v19 == 110)
    {
      v71 = [v17 objectForKey:@"PLXPCBatchedMessage"];

      if (v71)
      {
        id v29 = [v17 objectForKeyedSubscript:@"PLXPCBatchedMessage"];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_727;
        v84[3] = &unk_1E69312A8;
        v84[4] = self;
        v85 = v6;
        id v86 = v7;
        [v29 enumerateKeysAndObjectsUsingBlock:v84];

LABEL_82:
        goto LABEL_83;
      }
    }
    else if ((unsigned __int16)v19 == 51)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v20 = objc_opt_class();
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_713;
        v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v92[4] = v20;
        if (qword_1EBD5AFF8 != -1) {
          dispatch_once(&qword_1EBD5AFF8, v92);
        }
        if (byte_1EBD5AF10)
        {
          v21 = [NSString stringWithFormat:@"Got a batched message %@", v16];
          v22 = (void *)MEMORY[0x1E4F929B8];
          v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v24 = [v23 lastPathComponent];
          v25 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:517];

          v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v100 = v21;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v27 = [v17 objectForKeyedSubscript:@"PLXPCBatchedMessage"];
      v28 = [v17 objectForKeyedSubscript:@"PLXPCBatchedMessageDropCounts"];
      int v82 = [v28 intValue];

      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v29 = v27;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v88 objects:v98 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v89 != v32) {
              objc_enumerationMutation(v29);
            }
            [(PLXPCService *)self handleSingleMessage:*(void *)(*((void *)&v88 + 1) + 8 * i) fromPeer:v6 forEvent:v7];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v88 objects:v98 count:16];
        }
        while (v31);
      }

      v34 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ClientLoggingDrops"];
      v35 = (void *)MEMORY[0x1E4F929E0];
      v36 = [(PLOperator *)self className];
      LODWORD(v35) = [v35 isEntryKeySetup:v34 forOperatorName:v36];

      if (v35) {
        BOOL v37 = v82 < 1;
      }
      else {
        BOOL v37 = 1;
      }
      if (!v37)
      {
        if ([v29 count])
        {
          v38 = [v29 objectAtIndexedSubscript:0];
          v39 = [v38 objectForKeyedSubscript:@"clientID"];
          uint64_t v40 = [v39 shortValue];
        }
        else
        {
          uint64_t v40 = 0;
        }
        v81 = v34;
        v72 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v34];
        v73 = [NSNumber numberWithInt:v82];
        [v72 setObject:v73 forKeyedSubscript:@"PLXPCBatchedMessageDropCounts"];

        v74 = [NSNumber numberWithShort:v40];
        [v72 setObject:v74 forKeyedSubscript:@"clientID"];

        [(PLOperator *)self logEntry:v72];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v75 = objc_opt_class();
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_723;
          v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v87[4] = v75;
          if (qword_1EBD5B000 != -1) {
            dispatch_once(&qword_1EBD5B000, v87);
          }
          if (byte_1EBD5AF11)
          {
            v83 = [NSString stringWithFormat:@"Dropped messages %@", v72];
            v76 = (void *)MEMORY[0x1E4F929B8];
            v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
            v78 = [v77 lastPathComponent];
            v79 = [NSString stringWithUTF8String:"-[PLXPCService handlePeer:forEvent:]"];
            [v76 logMessage:v83 fromFile:v78 fromFunction:v79 fromLineNumber:534];

            v80 = PLLogCommon();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v100 = v83;
              _os_log_debug_impl(&dword_1D2690000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }

        v34 = v81;
      }

      goto LABEL_82;
    }
    [(PLXPCService *)self handleSingleMessage:v16 fromPeer:v6 forEvent:v7];
LABEL_83:
  }
LABEL_84:
}

- (void)handleSingleMessage:(id)a3 fromPeer:(id)a4 forEvent:(id)a5
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  v11 = [v8 objectForKeyedSubscript:@"clientID"];
  uint64_t v12 = [v11 shortValue];

  v13 = [v8 objectForKeyedSubscript:@"process-name"];
  v14 = [v8 objectForKeyedSubscript:@"event"];
  unint64_t v15 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    if (v12 != 48)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v30 = objc_opt_class();
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke;
        v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v127[4] = v30;
        if (qword_1EBD5B008 != -1) {
          dispatch_once(&qword_1EBD5B008, v127);
        }
        if (byte_1EBD5AF12)
        {
          unsigned int v103 = v12;
          v108 = self;
          id v31 = v10;
          uint64_t v32 = v9;
          v33 = [NSString stringWithFormat:@"!!! %s/%d: message=%@", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 571, v8];
          v34 = (void *)MEMORY[0x1E4F929B8];
          v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v36 = [v35 lastPathComponent];
          BOOL v37 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:571];

          v38 = PLLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v129 = v33;
            _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v9 = v32;
          id v10 = v31;
          self = v108;
          uint64_t v12 = v103;
          unint64_t v15 = 0x1E4F92000uLL;
        }
      }
      double v29 = 30.0;
      goto LABEL_20;
    }
    v16 = [v8 objectForKeyedSubscript:@"content"];
    v17 = [v16 objectForKeyedSubscript:@"battery_gauge_event"];
    int v18 = [v17 intValue];

    int v19 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v18 == 1)
    {
      unint64_t v15 = 0x1E4F92000;
      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        v126[0] = MEMORY[0x1E4F143A8];
        v126[1] = 3221225472;
        v126[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_740;
        v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v126[4] = v20;
        if (qword_1EBD5B010 != -1) {
          dispatch_once(&qword_1EBD5B010, v126);
        }
        if (byte_1EBD5AF13)
        {
          v107 = self;
          id v21 = v10;
          v22 = v9;
          v23 = [NSString stringWithFormat:@"!!! %s/%d: message=%@", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 577, v8];
          v24 = (void *)MEMORY[0x1E4F929B8];
          v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v26 = [v25 lastPathComponent];
          v27 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:577];

          v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v129 = v23;
            _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v9 = v22;
          id v10 = v21;
          self = v107;
          uint64_t v12 = 48;
          unint64_t v15 = 0x1E4F92000;
        }
      }
      double v29 = 100.0;
LABEL_20:
      [(PLXPCService *)self setSatelliteProcessExitWithTime:v29];
      goto LABEL_21;
    }
    unint64_t v15 = 0x1E4F92000;
    if (v19)
    {
      uint64_t v74 = objc_opt_class();
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_743;
      v125[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v125[4] = v74;
      if (qword_1EBD5B018 != -1) {
        dispatch_once(&qword_1EBD5B018, v125);
      }
      if (byte_1EBD5AF14)
      {
        v112 = self;
        id v75 = v10;
        v76 = v9;
        v77 = [NSString stringWithFormat:@"!!! %s/%d: message=%@", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 582, v8];
        v78 = (void *)MEMORY[0x1E4F929B8];
        v79 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v80 = [v79 lastPathComponent];
        v81 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
        [v78 logMessage:v77 fromFile:v80 fromFunction:v81 fromLineNumber:582];

        int v82 = PLLogCommon();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v77;
          _os_log_debug_impl(&dword_1D2690000, v82, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v9 = v76;
        id v10 = v75;
        self = v112;
        uint64_t v12 = 48;
        unint64_t v15 = 0x1E4F92000;
      }
    }
  }
LABEL_21:
  v39 = [v8 objectForKey:@"shouldLog"];

  if (v39)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v40 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_749;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v40;
      if (qword_1EBD5B020 != -1) {
        dispatch_once(&qword_1EBD5B020, block);
      }
      if (byte_1EBD5AF15)
      {
        unsigned int v104 = v12;
        v109 = self;
        id v41 = v10;
        int v42 = v9;
        uint64_t v43 = [NSString stringWithFormat:@"Should log request(%d): %@", xpc_connection_get_pid(v9), v8];
        v44 = (void *)MEMORY[0x1E4F929B8];
        v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v46 = [v45 lastPathComponent];
        v47 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
        [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:588];

        v48 = PLLogCommon();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v129 = v43;
          _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v9 = v42;
        id v10 = v41;
        self = v109;
        uint64_t v12 = v104;
      }
    }
    [(PLXPCService *)self handlePeerShouldLogEvent:v10 withMessage:v8 withClientID:v12 withProcessName:v13 withKey:v14];
    v49 = @"shouldLog";
  }
  else
  {
    uint64_t v50 = [v8 objectForKeyedSubscript:@"content"];
    v51 = [v8 objectForKey:@"Query"];

    if (v51)
    {
      if (![*(id *)(v15 + 2696) allowQueryFromPeer:v9])
      {
LABEL_71:

        goto LABEL_72;
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v52 = objc_opt_class();
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_755;
        v123[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v123[4] = v52;
        if (qword_1EBD5B028 != -1) {
          dispatch_once(&qword_1EBD5B028, v123);
        }
        if (byte_1EBD5AF16)
        {
          v117 = v50;
          unsigned int v105 = v12;
          v110 = self;
          v53 = v14;
          id v54 = v10;
          v55 = v9;
          v56 = [NSString stringWithFormat:@"Response request(%d): %@", xpc_connection_get_pid(v9), v8];
          v57 = (void *)MEMORY[0x1E4F929B8];
          v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v59 = [v58 lastPathComponent];
          v60 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v57 logMessage:v56 fromFile:v59 fromFunction:v60 fromLineNumber:599];

          uint64_t v61 = PLLogCommon();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v129 = v56;
            _os_log_debug_impl(&dword_1D2690000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v9 = v55;
          id v10 = v54;
          self = v110;
          v14 = v53;
          uint64_t v12 = v105;
          uint64_t v50 = v117;
        }
      }
      [(PLXPCService *)self handlePeerResponderEvent:v10 withMessage:v8 withClientID:v12 withProcessName:v13 withKey:v14 withPayload:v50];
      v49 = @"Query";
    }
    else
    {
      v62 = [v8 objectForKey:@"Post"];

      int v63 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v62)
      {
        if (v63)
        {
          uint64_t v64 = objc_opt_class();
          v122[0] = MEMORY[0x1E4F143A8];
          v122[1] = 3221225472;
          v122[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_761;
          v122[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v122[4] = v64;
          if (qword_1EBD5B030 != -1) {
            dispatch_once(&qword_1EBD5B030, v122);
          }
          if (byte_1EBD5AF17)
          {
            v118 = v50;
            unsigned int v106 = v12;
            v111 = self;
            v65 = v14;
            id v66 = v10;
            v67 = v9;
            v68 = [NSString stringWithFormat:@"Data posted(%d): %@", xpc_connection_get_pid(v9), v8];
            v69 = (void *)MEMORY[0x1E4F929B8];
            v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
            v71 = [v70 lastPathComponent];
            v72 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
            [v69 logMessage:v68 fromFile:v71 fromFunction:v72 fromLineNumber:604];

            v73 = PLLogCommon();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v129 = v68;
              _os_log_debug_impl(&dword_1D2690000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v9 = v67;
            id v10 = v66;
            self = v111;
            v14 = v65;
            uint64_t v12 = v106;
            uint64_t v50 = v118;
          }
        }
        [(PLXPCService *)self handlePeerListenerEvent:v10 withMessage:v8 withClientID:v12 withProcessName:v13 withKey:v14 withPayload:v50];
        v49 = @"Post";
      }
      else if (v63)
      {
        uint64_t v83 = objc_opt_class();
        v121[0] = MEMORY[0x1E4F143A8];
        v121[1] = 3221225472;
        v121[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_767;
        v121[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v121[4] = v83;
        v119 = v50;
        if (qword_1EBD5B038 != -1) {
          dispatch_once(&qword_1EBD5B038, v121);
        }
        if (byte_1EBD5AF18)
        {
          v113 = self;
          v115 = v9;
          v84 = [NSString stringWithFormat:@"Message with no direction: %@", v8];
          v85 = (void *)MEMORY[0x1E4F929B8];
          id v86 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v87 = [v86 lastPathComponent];
          long long v88 = [NSString stringWithUTF8String:"-[PLXPCService handleSingleMessage:fromPeer:forEvent:]"];
          [v85 logMessage:v84 fromFile:v87 fromFunction:v88 fromLineNumber:608];

          long long v89 = PLLogCommon();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v129 = v84;
            _os_log_debug_impl(&dword_1D2690000, v89, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v49 = 0;
          self = v113;
          uint64_t v9 = v115;
        }
        else
        {
          v49 = 0;
        }
        uint64_t v50 = v119;
      }
      else
      {
        v49 = 0;
      }
    }
  }
  if ([(PLOperator *)self isDebugEnabledForKey:@"LogAggregateXPC"])
  {
    id v114 = v10;
    v116 = v13;
    long long v90 = self;
    v120 = v14;
    long long v91 = v9;
    uint64_t v92 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"XPCEvent"];
    v93 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v92];
    v94 = [v8 objectForKeyedSubscript:@"event"];
    [v93 setObject:v94 forKeyedSubscript:@"event"];

    v95 = [v8 objectForKeyedSubscript:@"clientID"];
    [v93 setObject:v95 forKeyedSubscript:@"clientID"];

    v96 = [v8 objectForKeyedSubscript:@"process-name"];
    [v93 setObject:v96 forKeyedSubscript:@"process-name"];

    if (v49) {
      [v93 setObject:v49 forKeyedSubscript:@"type"];
    }
    [v93 setObject:&unk_1F29E86B0 forKeyedSubscript:@"count"];
    [(PLOperator *)v90 logEntry:v93];
    v97 = NSString;
    v98 = [v93 objectForKeyedSubscript:@"type"];
    v99 = [v93 objectForKeyedSubscript:@"clientID"];
    v100 = [v93 objectForKeyedSubscript:@"process-name"];
    uint64_t v101 = [v93 objectForKeyedSubscript:@"event"];
    v102 = [v97 stringWithFormat:@"com.apple.power.xpc.%@.%@.%@.%@", v98, v99, v100, v101];

    MEMORY[0x1D94294C0](v102, 1);
    uint64_t v9 = v91;
    v13 = v116;
    v14 = v120;
    uint64_t v50 = (void *)v92;
    id v10 = v114;
    goto LABEL_71;
  }
LABEL_72:
}

- (void)handlePeerListenerEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8
{
  uint64_t v11 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if ([(PLXPCService *)self permissionForClientID:v11 withKey:v15 withType:@"Post" withProcessName:v14])
  {
    v17 = [(PLXPCService *)self registeredListeners];
    int v18 = [(PLXPCService *)self registeredOperatorFromDictionary:v17 forMessage:v13];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_860;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v19;
      if (qword_1EBD5B098 != -1) {
        dispatch_once(&qword_1EBD5B098, block);
      }
      if (byte_1EBD5AF24)
      {
        id v34 = v13;
        id v35 = v16;
        uint64_t v20 = NSString;
        id v21 = [(PLXPCService *)self registeredListeners];
        v22 = [v20 stringWithFormat:@"!!! %s/%d: [self registeredListeners]=%@, listener=%@", "-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 774, v21, v18];

        v23 = (void *)MEMORY[0x1E4F929B8];
        v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        v25 = [v24 lastPathComponent];
        v26 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:774];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v22;
          _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        id v13 = v34;
        id v16 = v35;
      }
    }
    if (v18) {
      [v18 messageRecievedForClientID:v11 withProcessName:v14 withKey:v15 withPayload:v16];
    }
    else {
      [(PLXPCService *)self logMessage:v13 withPayload:v16];
    }
LABEL_19:

    goto LABEL_20;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v28;
    if (qword_1EBD5B090 != -1) {
      dispatch_once(&qword_1EBD5B090, v37);
    }
    if (byte_1EBD5AF23)
    {
      int v18 = [NSString stringWithFormat:@"no permission to log!"];
      double v29 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v31 = [v30 lastPathComponent];
      uint64_t v32 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
      [v29 logMessage:v18 fromFile:v31 fromFunction:v32 fromLineNumber:766];

      v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v18;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_19;
    }
  }
LABEL_20:
}

- (id)registeredOperatorFromDictionary:(id)a3 forMessage:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [&unk_1F29F01A8 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(&unk_1F29F01A8);
        }
        uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];
        [v7 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [&unk_1F29F01A8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v8);
  }
  id v13 = v5;
  objc_sync_enter(v13);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v14 = [&unk_1F29F01A8 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
LABEL_10:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(&unk_1F29F01A8);
      }
      uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * v16);
      int v18 = [v13 objectForKeyedSubscript:v7];
      if (v18) {
        break;
      }
      [v7 removeObjectForKey:v17];
      if (v14 == ++v16)
      {
        uint64_t v14 = [&unk_1F29F01A8 countByEnumeratingWithState:&v29 objects:v40 count:16];
        if (v14) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v19 = [&unk_1F29F01A8 countByEnumeratingWithState:&v25 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
LABEL_18:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(&unk_1F29F01A8);
        }
        uint64_t v37 = *(void *)(*((void *)&v25 + 1) + 8 * v21);
        v22 = objc_msgSend(v6, "objectForKeyedSubscript:");
        v38 = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        int v18 = [v13 objectForKeyedSubscript:v23];

        if (v18) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [&unk_1F29F01A8 countByEnumeratingWithState:&v25 objects:v39 count:16];
          int v18 = 0;
          if (v19) {
            goto LABEL_18;
          }
          break;
        }
      }
    }
    else
    {
      int v18 = 0;
    }
  }
  objc_sync_exit(v13);

  return v18;
}

- (signed)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withProcessName:(id)a6
{
  int v8 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (__CFString *)a6;
  id v13 = [(PLXPCService *)self clientIDs];
  unint64_t v14 = [v13 count];

  if (v14 <= v8)
  {
    uint64_t v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v47 = v8;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v10;
      __int16 v48 = 2112;
      id v49 = v11;
      __int16 v50 = 2112;
      v51 = v12;
      _os_log_fault_impl(&dword_1D2690000, v16, OS_LOG_TYPE_FAULT, "Invalid client ID %d request for key : %@, type : %@, processName %@", buf, 0x26u);
    }
    signed __int16 v24 = 0;
  }
  else
  {
    uint64_t v15 = [(PLXPCService *)self clientIDs];
    uint64_t v16 = [v15 objectAtIndexedSubscript:v8];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      uint64_t v43 = __71__PLXPCService_permissionForClientID_withKey_withType_withProcessName___block_invoke;
      v44 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v45 = v17;
      if (qword_1EBD5AFB0 != -1) {
        dispatch_once(&qword_1EBD5AFB0, &block);
      }
      if (byte_1EBD5AF07)
      {
        int v18 = objc_msgSend(NSString, "stringWithFormat:", @"PLXPCService: permissionForClientID:%hd", v8, block, v42, v43, v44, v45);
        uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLXPCService permissionForClientID:withKey:withType:withProcessName:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:439];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v47 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
    {
      signed __int16 v24 = 1;
    }
    else
    {
      long long v25 = [(PLXPCService *)self permissionCache];
      long long v26 = [v25 objectForKeyedSubscript:v11];
      long long v27 = [v26 objectForKeyedSubscript:v16];
      long long v28 = [v27 objectForKeyedSubscript:@"__PL__Global"];

      long long v29 = [(PLXPCService *)self permissionCache];
      long long v30 = [v29 objectForKeyedSubscript:v11];
      long long v31 = [v30 objectForKeyedSubscript:v16];
      long long v32 = v31;
      if (v28)
      {
        long long v33 = [v31 objectForKeyedSubscript:@"__PL__Global"];
        signed __int16 v24 = [v33 BOOLValue];
      }
      else
      {
        long long v34 = [v31 objectForKeyedSubscript:v10];
        long long v35 = [v34 objectForKeyedSubscript:@"__PL__Global"];

        long long v29 = [(PLXPCService *)self permissionCache];
        long long v30 = [v29 objectForKeyedSubscript:v11];
        long long v32 = [v30 objectForKeyedSubscript:v16];
        long long v36 = [v32 objectForKeyedSubscript:v10];
        long long v33 = v36;
        if (v35)
        {
          uint64_t v37 = @"__PL__Global";
        }
        else
        {
          v38 = [v36 objectForKeyedSubscript:v12];

          if (!v38)
          {
            signed __int16 v24 = [MEMORY[0x1E4F929C0] fullMode];
            goto LABEL_22;
          }
          long long v29 = [(PLXPCService *)self permissionCache];
          long long v30 = [v29 objectForKeyedSubscript:v11];
          long long v32 = [v30 objectForKeyedSubscript:v16];
          long long v36 = [v32 objectForKeyedSubscript:v10];
          long long v33 = v36;
          uint64_t v37 = v12;
        }
        v39 = [v36 objectForKeyedSubscript:v37];
        signed __int16 v24 = [v39 BOOLValue];
      }
    }
  }
LABEL_22:

  return v24;
}

- (NSDictionary)permissionCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)clientIDs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableDictionary)registeredListeners
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

void __36__PLXPCService_handlePeer_forEvent___block_invoke_727(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) handleSingleMessage:*(void *)(*((void *)&v9 + 1) + 8 * v8++) fromPeer:*(void *)(a1 + 40) forEvent:*(void *)(a1 + 48)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __20__PLXPCService_init__block_invoke_585(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F929C0];
  id v4 = a2;
  if ([v3 debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __20__PLXPCService_init__block_invoke_2_586;
    int v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v5;
    if (qword_1EBD5AF58 != -1) {
      dispatch_once(&qword_1EBD5AF58, &block);
    }
    if (byte_1EBD5AEFE)
    {
      uint64_t v6 = NSString;
      uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
      uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", @"peer(%d) connected", pid, block, v16, v17, v18, v19);
      long long v9 = (void *)MEMORY[0x1E4F929B8];
      long long v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      long long v11 = [v10 lastPathComponent];
      long long v12 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:288];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v14 = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
  [v14 handlePeer:*(void *)(a1 + 40) forEvent:v4];
}

- (void)logMessage:(id)a3 withPayload:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __39__PLXPCService_logMessage_withPayload___block_invoke;
      v37[3] = &unk_1E692A830;
      v38 = @"Listener";
      uint64_t v39 = v8;
      if (qword_1EBD5AF98 != -1) {
        dispatch_once(&qword_1EBD5AF98, v37);
      }
      int v9 = byte_1EBD5AF04;

      if (v9)
      {
        long long v10 = [NSString stringWithFormat:@"No registered Listener"];
        long long v11 = (void *)MEMORY[0x1E4F929B8];
        long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        id v13 = [v12 lastPathComponent];
        uint64_t v14 = [NSString stringWithUTF8String:"-[PLXPCService logMessage:withPayload:]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:413];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v10;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ClientLogging"];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
    [v17 setObjectsFromRawData:v6];
    [v17 setDynamicObjectsFromRawData:v7];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    long long v33 = __39__PLXPCService_logMessage_withPayload___block_invoke_652;
    long long v34 = &unk_1E692B928;
    long long v35 = @"dynamicClientLogging";
    char v36 = 1;
    if (qword_1EBD5AFA0 != -1) {
      dispatch_once(&qword_1EBD5AFA0, &block);
    }
    int v18 = byte_1EBD5AF05;

    if (v18)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        long long v28 = __39__PLXPCService_logMessage_withPayload___block_invoke_2;
        long long v29 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v30 = v19;
        if (qword_1EBD5AFA8 != -1) {
          dispatch_once(&qword_1EBD5AFA8, &v26);
        }
        if (byte_1EBD5AF06)
        {
          uint64_t v20 = [NSString stringWithFormat:@"entry=%@", v17, v26, v27, v28, v29, v30, block, v32, v33, v34];
          uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
          v23 = [v22 lastPathComponent];
          signed __int16 v24 = [NSString stringWithUTF8String:"-[PLXPCService logMessage:withPayload:]"];
          [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:419];

          long long v25 = PLLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v20;
            _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      [(PLOperator *)self logEntry:v17];
    }
  }
}

- (void)handlePeerShouldLogEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = [v14 objectForKeyedSubscript:@"shouldLog"];
  uint64_t v16 = (void *)[v14 mutableCopy];

  LODWORD(v9) = [(PLXPCService *)self permissionForClientID:v9 withKey:v12 withType:v15 withProcessName:v13];
  uint64_t v17 = [NSNumber numberWithBool:v9 != 0];
  [v16 setObject:v17 forKeyedSubscript:@"shouldLog"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v18;
    if (qword_1EBD5B040 != -1) {
      dispatch_once(&qword_1EBD5B040, block);
    }
    if (byte_1EBD5AF19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"!!! response=%@; %s:%d",
        v16,
        "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
      uint64_t v19 = 638);
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:638];

      signed __int16 v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v19;
        _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke_781;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v25;
    if (qword_1EBD5B048 != -1) {
      dispatch_once(&qword_1EBD5B048, v39);
    }
    if (byte_1EBD5AF1A)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"!!! vlad=%@; %s:%d",
        v16,
        "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
      uint64_t v26 = 639);
      uint64_t v27 = (void *)MEMORY[0x1E4F929B8];
      long long v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      long long v29 = [v28 lastPathComponent];
      uint64_t v30 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]"];
      [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:639];

      long long v31 = PLLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v26;
        _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([(PLOperator *)self isDebugEnabled])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"!!! response=%@; %s:%d",
      v16,
      "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
    uint64_t v32 = 640);
    long long v33 = (void *)MEMORY[0x1E4F929B8];
    long long v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
    long long v35 = [v34 lastPathComponent];
    char v36 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]"];
    [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:640];

    uint64_t v37 = PLLogCommon();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v32;
      _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  [(PLXPCService *)self respondToEvent:v38 withResponse:v16];
}

- (void)respondToEvent:(id)a3 withResponse:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v8;
      if (qword_1EBD5AF80 != -1) {
        dispatch_once(&qword_1EBD5AF80, v44);
      }
      if (byte_1EBD5AF01)
      {
        uint64_t v9 = [NSString stringWithFormat:@"empty response"];
        long long v10 = (void *)MEMORY[0x1E4F929B8];
        long long v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        id v12 = [v11 lastPathComponent];
        id v13 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:378];

        id v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v9;
          _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }
  if ([(PLOperator *)self isDebugEnabled])
  {
    uint64_t v15 = [NSString stringWithFormat:@"adding debug to response"];
    uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
    uint64_t v18 = [v17 lastPathComponent];
    uint64_t v19 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
    [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:383];

    uint64_t v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v15;
      _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    uint64_t v21 = (void *)[v7 mutableCopy];
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[PLOperator isDebugEnabled](self, "isDebugEnabled"));
    [v21 setObject:v22 forKeyedSubscript:@"PLXPCClientDebug"];

    id v7 = v21;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  signed __int16 v24 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  xpc_dictionary_set_value(reply, (const char *)[@"PLXPCConnectionReturnDict" UTF8String], v24);
  xpc_dictionary_get_remote_connection(v6);
  uint64_t v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = v25;
  if (v25)
  {
    xpc_connection_send_message(v25, reply);
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v27 = objc_opt_class();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke_631;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v27;
    if (qword_1EBD5AF88 != -1) {
      dispatch_once(&qword_1EBD5AF88, v43);
    }
    if (byte_1EBD5AF02)
    {
      uint64_t v28 = [NSString stringWithFormat:@"remote connection missing"];
      id v41 = (void *)MEMORY[0x1E4F929B8];
      long long v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v30 = [v29 lastPathComponent];
      long long v31 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
      [v41 logMessage:v28 fromFile:v30 fromFunction:v31 fromLineNumber:397];

      uint64_t v32 = (void *)v28;
      long long v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v32;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke_637;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v34;
    if (qword_1EBD5AF90 != -1) {
      dispatch_once(&qword_1EBD5AF90, block);
    }
    if (byte_1EBD5AF03)
    {
      long long v35 = [NSString stringWithFormat:@"responded to event! event=%@ response=%@ replyMessage=%@", v6, v7, reply];
      char v36 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v38 = [v37 lastPathComponent];
      uint64_t v39 = [NSString stringWithUTF8String:"-[PLXPCService respondToEvent:withResponse:]"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:400];

      uint64_t v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v35;
        _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

void __20__PLXPCService_init__block_invoke_574(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__PLXPCService_init__block_invoke_2_575;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD5AF48 != -1) {
      dispatch_once(&qword_1EBD5AF48, block);
    }
    if (byte_1EBD5AEFC)
    {
      uint64_t v5 = NSString;
      id v6 = [*(id *)(a1 + 32) xpcConnection];
      [v5 stringWithFormat:@"event handler fired peerPID=%d %@", xpc_connection_get_pid(v6), v3];
      id v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      long long v10 = [v9 lastPathComponent];
      long long v11 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:277];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v29 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (MEMORY[0x1D942AE70](v3) != MEMORY[0x1E4F145A8])
  {
    id v13 = (_xpc_connection_s *)v3;
    context = xpc_connection_get_context(*(xpc_connection_t *)(*(void *)(a1 + 32) + 56));
    xpc_connection_set_context(v13, context);
    uint64_t v15 = dispatch_get_global_queue(2, 0);
    xpc_connection_set_target_queue(v13, v15);

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __20__PLXPCService_init__block_invoke_585;
    handler[3] = &unk_1E69325A8;
    signed __int16 v24 = *(id *)(a1 + 32);
    uint64_t v25 = v13;
    uint64_t v16 = v13;
    xpc_connection_set_event_handler(v16, handler);
    xpc_connection_activate(v16);

    uint64_t v17 = v24;
LABEL_10:

    goto LABEL_17;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __20__PLXPCService_init__block_invoke_581;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v18;
    if (qword_1EBD5AF50 != -1) {
      dispatch_once(&qword_1EBD5AF50, v26);
    }
    if (byte_1EBD5AEFD)
    {
      uint64_t v16 = [NSString stringWithFormat:@"XPC error! %@", v3];
      uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke_2"];
      [v19 logMessage:v16 fromFile:v21 fromFunction:v22 fromLineNumber:280];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v29 = v16;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_10;
    }
  }
LABEL_17:
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLXPCService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ClientLogging";
  id v3 = [a1 entryEventPointDefinitionClientLogging];
  v7[1] = @"ClientLoggingDrops";
  v8[0] = v3;
  uint64_t v4 = [a1 entryEventPointDefinitionClientLoggingDrops];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventPointDefinitionClientLoggingDrops
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F1540;
  v14[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"clientID";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"PLXPCBatchedMessageDropCounts";
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionClientLogging
{
  v27[3] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F29F1540;
  v25[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92C28];
  v24[2] = *MEMORY[0x1E4F92C30];
  v24[3] = v3;
  v25[2] = &unk_1F29E8650;
  v25[3] = &unk_1F29E8668;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v17;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"clientID";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v23[0] = v15;
  v22[1] = @"process-name";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v23[1] = v5;
  v22[2] = @"event";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v23[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v27[1] = v8;
  v26[2] = *MEMORY[0x1E4F92C68];
  v20[0] = @"value";
  uint64_t v18 = *MEMORY[0x1E4F92D10];
  uint64_t v19 = &unk_1F29E8680;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"unit";
  v21[0] = v9;
  long long v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v21[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

  return v13;
}

+ (id)entryEventIntervalDefinitions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabled])
  {
    id v6 = @"ResponderEvent";
    uint64_t v3 = [a1 entryEventIntervalDefinitionResponderEvent];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (id)entryEventIntervalDefinitionResponderEvent
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  uint64_t v17 = &unk_1F29F1540;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"timestampEnd";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_DateFormat");
  v15[0] = v3;
  v14[1] = @"clientID";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"process-name";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v15[2] = v7;
  v14[3] = @"event";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[3] = v9;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryAggregateDefinitions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabledForKey:@"LogAggregateXPC"])
  {
    id v6 = @"XPCEvent";
    uint64_t v3 = [a1 entryAggregateDefinitionXPCEvent];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (id)entryAggregateDefinitionXPCEvent
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v29[0] = *MEMORY[0x1E4F92CD0];
  v29[1] = v2;
  v30[0] = &unk_1F29F1540;
  v30[1] = MEMORY[0x1E4F1CC28];
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v32[0] = v20;
  v31[1] = *MEMORY[0x1E4F92CA8];
  v27[0] = @"clientID";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v28[0] = v18;
  v27[1] = @"process-name";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v28[1] = v16;
  v27[2] = @"event";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v28[2] = v3;
  v27[3] = @"type";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v28[3] = v5;
  v27[4] = @"count";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v28[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  v32[1] = v8;
  v31[2] = *MEMORY[0x1E4F92BE0];
  v25[0] = &unk_1F29F1550;
  uint64_t v23 = *MEMORY[0x1E4F92BD8];
  uint64_t v9 = v23;
  signed __int16 v24 = &unk_1F29F1560;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v25[1] = &unk_1F29F1570;
  v26[0] = v10;
  uint64_t v21 = v9;
  uint64_t v22 = &unk_1F29F1550;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v26[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v31[3] = *MEMORY[0x1E4F92BF0];
  v32[2] = v12;
  v32[3] = &unk_1F29F0178;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

  return v13;
}

+ (id)defaults
{
  return &unk_1F29ED5F0;
}

- (PLXPCService)init
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v85.receiver = self;
  v85.super_class = (Class)PLXPCService;
  uint64_t v2 = [(PLOperator *)&v85 init];
  if (!v2)
  {
LABEL_40:
    v65 = v2;
    goto LABEL_41;
  }
  uint64_t v3 = objc_opt_new();
  registeredListeners = v2->_registeredListeners;
  v2->_registeredListeners = (NSMutableDictionary *)v3;

  uint64_t v5 = objc_opt_new();
  registeredResponders = v2->_registeredResponders;
  v2->_registeredResponders = (NSMutableDictionary *)v5;

  clientIDs = v2->_clientIDs;
  v2->_clientIDs = (NSArray *)&unk_1F29F0190;

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = v2->_clientIDs;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __20__PLXPCService_init__block_invoke;
  v83[3] = &unk_1E692DA70;
  id v10 = v8;
  id v84 = v10;
  [(NSArray *)v9 enumerateObjectsUsingBlock:v83];
  objc_storeStrong((id *)&v2->_clientNames, v8);
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd]) {
    int v11 = 200000;
  }
  else {
    int v11 = 1000000;
  }
  v2->_responderWaitTime = v11;
  uint64_t v12 = getClientPermissions();
  permissionCache = v2->_permissionCache;
  v2->_permissionCache = (NSDictionary *)v12;

  id v14 = v2->_permissionCache;
  if ((!v14 || !-[NSDictionary count](v14, "count")) && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = [NSString stringWithFormat:@"**** unable to load ClientPermissions ****"];
    uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
    uint64_t v18 = [v17 lastPathComponent];
    uint64_t v19 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
    [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:229];

    uint64_t v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v87 = v15;
      _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  id v21 = objc_alloc(MEMORY[0x1E4F92A28]);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __20__PLXPCService_init__block_invoke_534;
  v81[3] = &unk_1E692A0F0;
  uint64_t v22 = v2;
  int v82 = v22;
  uint64_t v23 = [v21 initWithOperator:v22 forNotification:@"register.PLXPCService" withBlock:v81];
  registrationNotification = v22->_registrationNotification;
  v22->_registrationNotification = (PLNSNotificationOperatorComposition *)v23;

  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    uint64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v22 selector:sel_stopPowerlogHelperd_ name:@"PLBatteryGaugeService.stopPowerlogHelperd" object:0];
  }
  if ([MEMORY[0x1E4F92A88] isLiteModeDaemon])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __20__PLXPCService_init__block_invoke_555;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v26;
      if (qword_1EBD5AF30 != -1) {
        dispatch_once(&qword_1EBD5AF30, block);
      }
      if (byte_1EBD5AEF9)
      {
        uint64_t v27 = NSString;
        uint64_t v28 = [MEMORY[0x1E4F92A88] liteModeDaemonName];
        long long v29 = [v27 stringWithFormat:@"running in %@ with service %s", v28, "com.apple.powerlog.plxpclogger.xpc"];

        uint64_t v30 = (void *)MEMORY[0x1E4F929B8];
        long long v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v32 = [v31 lastPathComponent];
        long long v33 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
        [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:255];

        uint64_t v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v29;
          _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    long long v35 = [(PLOperator *)v22 workQueue];
    char v36 = "com.apple.powerlog.plxpclogger.xpc";
LABEL_37:
    xpc_connection_t mach_service = xpc_connection_create_mach_service(v36, v35, 1uLL);
    xpcConnection = v22->_xpcConnection;
    v22->_xpcConnection = mach_service;

    xpc_connection_set_context(v22->_xpcConnection, v22);
    id v54 = v22->_xpcConnection;
    v55 = dispatch_get_global_queue(2, 0);
    xpc_connection_set_target_queue(v54, v55);

    v56 = v22->_xpcConnection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __20__PLXPCService_init__block_invoke_574;
    handler[3] = &unk_1E69325D0;
    v57 = v22;
    v77 = v57;
    xpc_connection_set_event_handler(v56, handler);
    xpc_connection_activate(v22->_xpcConnection);
    if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlog.state_changed", 0, 0, 0);
    }
    v59 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
    id v60 = objc_alloc(MEMORY[0x1E4F92A80]);
    uint64_t v61 = [(PLOperator *)v57 workQueue];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __20__PLXPCService_init__block_invoke_596;
    v74[3] = &unk_1E692A200;
    v62 = v57;
    id v75 = v62;
    uint64_t v63 = [v60 initWithFireDate:v59 withInterval:1 withTolerance:0 repeats:v61 withUserInfo:v74 withQueue:3600.0 withBlock:0.0];
    resetPermissionsForClientsTimer = v62->_resetPermissionsForClientsTimer;
    v62->_resetPermissionsForClientsTimer = (PLTimer *)v63;

    goto LABEL_40;
  }
  if ([MEMORY[0x1E4F92A88] isFullModeDaemon])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v37 = objc_opt_class();
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __20__PLXPCService_init__block_invoke_562;
      v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v79[4] = v37;
      if (qword_1EBD5AF38 != -1) {
        dispatch_once(&qword_1EBD5AF38, v79);
      }
      if (byte_1EBD5AEFA)
      {
        id v38 = NSString;
        uint64_t v39 = [MEMORY[0x1E4F92A88] fullModeDaemonName];
        uint64_t v40 = [v38 stringWithFormat:@"running in %@ with service %s", v39, "com.apple.powerlogd.XPCService.xpc"];

        id v41 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v43 = [v42 lastPathComponent];
        v44 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
        [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:259];

        uint64_t v45 = PLLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v40;
          _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    long long v35 = [(PLOperator *)v22 workQueue];
    char v36 = "com.apple.powerlogd.XPCService.xpc";
    goto LABEL_37;
  }
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    [(PLXPCService *)v22 initSatelliteProcessSemaphore];
    if ([(PLOperator *)v22 isDebugEnabled])
    {
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"running in BLDService with service %s", "com.apple.powerlogHelperd.XPCService.xpc");
      uint64_t v47 = (void *)MEMORY[0x1E4F929B8];
      __int16 v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v49 = [v48 lastPathComponent];
      __int16 v50 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
      [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:264];

      v51 = PLLogCommon();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v46;
        _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    long long v35 = [(PLOperator *)v22 workQueue];
    char v36 = "com.apple.powerlogHelperd.XPCService.xpc";
    goto LABEL_37;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v67 = objc_opt_class();
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __20__PLXPCService_init__block_invoke_570;
    v78[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v78[4] = v67;
    if (qword_1EBD5AF40 != -1) {
      dispatch_once(&qword_1EBD5AF40, v78);
    }
    if (byte_1EBD5AEFB)
    {
      v68 = [NSString stringWithFormat:@"Bad processname, no xpc for you"];
      v69 = (void *)MEMORY[0x1E4F929B8];
      v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      v71 = [v70 lastPathComponent];
      v72 = [NSString stringWithUTF8String:"-[PLXPCService init]"];
      [v69 logMessage:v68 fromFile:v71 fromFunction:v72 fromLineNumber:267];

      v73 = PLLogCommon();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v68;
        _os_log_debug_impl(&dword_1D2690000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }

  v65 = 0;
LABEL_41:

  return v65;
}

void __20__PLXPCService_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __20__PLXPCService_init__block_invoke_534(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    long long v29 = __20__PLXPCService_init__block_invoke_2;
    uint64_t v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v10;
    if (qword_1EBD5AF28 != -1) {
      dispatch_once(&qword_1EBD5AF28, &block);
    }
    if (_MergedGlobals_1_68)
    {
      int v11 = NSString;
      uint64_t v12 = [v7 objectForKeyedSubscript:@"type"];
      id v13 = [v7 objectForKeyedSubscript:@"registration"];
      id v14 = [v11 stringWithFormat:@"registration of type %@ of key %@ for %@", v12, v13, v9, block, v28, v29, v30, v31];

      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLXPCService init]_block_invoke"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:233];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v33 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v20 = [v7 objectForKeyedSubscript:@"type"];
  BOOL v21 = [v20 caseInsensitiveCompare:@"Post"] == 0;

  if (v21)
  {
    signed __int16 v24 = [*(id *)(a1 + 32) registeredListeners];
    objc_sync_enter(v24);
    uint64_t v25 = [*(id *)(a1 + 32) registeredListeners];
    uint64_t v26 = [v7 objectForKeyedSubscript:@"registration"];
    [v25 setObject:v9 forKeyedSubscript:v26];
    goto LABEL_12;
  }
  uint64_t v22 = [v7 objectForKeyedSubscript:@"type"];
  BOOL v23 = [v22 caseInsensitiveCompare:@"Query"] == 0;

  if (v23)
  {
    signed __int16 v24 = [*(id *)(a1 + 32) registeredResponders];
    objc_sync_enter(v24);
    uint64_t v25 = [*(id *)(a1 + 32) registeredResponders];
    uint64_t v26 = [v7 objectForKeyedSubscript:@"registration"];
    [v25 setObject:v9 forKeyedSubscript:v26];
LABEL_12:

    objc_sync_exit(v24);
  }
}

uint64_t __20__PLXPCService_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_68 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_555(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AEF9 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_562(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AEFA = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_570(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AEFB = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_2_575(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AEFC = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AEFD = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_2_586(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AEFE = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_596(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetPermissionsForClients];
}

- (void)initOperatorDependancies
{
  if ([(PLOperator *)self isDebugEnabledForKey:@"LogAggregateXPC"])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92A28]);
    uint64_t v4 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
    uint64_t v5 = *MEMORY[0x1E4F1C2E0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __40__PLXPCService_initOperatorDependancies__block_invoke;
    v7[3] = &unk_1E692A0F0;
    v7[4] = self;
    id v6 = (void *)[v3 initWithWorkQueue:v4 forNotification:v5 withBlock:v7];

    [(PLXPCService *)self setDailyTaskNotification:v6];
  }
}

uint64_t __40__PLXPCService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __40__PLXPCService_initOperatorDependancies__block_invoke_2;
    id v14 = &unk_1E692A830;
    uint64_t v15 = @"DailyTasks";
    uint64_t v16 = v2;
    if (qword_1EBD5AF60 != -1) {
      dispatch_once(&qword_1EBD5AF60, &v11);
    }
    int v3 = byte_1EBD5AEFF;

    if (v3)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"DailyTasks notification!", v11, v12, v13, v14);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLXPCService initOperatorDependancies]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:313];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dailyTasks", v11, v12, v13, v14);
}

uint64_t __40__PLXPCService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD5AEFF = result;
  return result;
}

- (void)initSatelliteProcessSemaphore
{
  int v3 = [MEMORY[0x1E4F92A48] sharedSemaphoreForKey:*MEMORY[0x1E4F92D80]];
  satelliteProcessSemaphore = self->_satelliteProcessSemaphore;
  self->_satelliteProcessSemaphore = v3;

  uint64_t v5 = [(PLXPCService *)self satelliteProcessSemaphore];
  [v5 setTimeout:100.0];

  id v6 = [(PLXPCService *)self satelliteProcessSemaphore];
  [v6 signalStartListening];
}

- (void)dailyTasks
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [v3 dateByAddingTimeInterval:-86400.0];
  id v5 = v3;
  [v4 timeIntervalSince1970];
  double v7 = v6;
  [v5 timeIntervalSince1970];
  double v9 = v8;

  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"XPCEvent"];
  uint64_t v11 = [(PLOperator *)self storage];
  uint64_t v12 = objc_msgSend(v11, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v10, 3600.0, v7, v9 - v7);

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __26__PLXPCService_dailyTasks__block_invoke;
  v44[3] = &unk_1E692A250;
  v44[4] = self;
  char v36 = (void *)v10;
  uint64_t v37 = v5;
  if (qword_1EBD5AF68 != -1) {
    dispatch_once(&qword_1EBD5AF68, v44);
  }
  uint64_t v13 = qword_1EBD5AF70;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * v17);
        uint64_t v19 = [v18 objectForKeyedSubscript:@"count"];
        uint64_t v20 = [v19 longValue];

        if (v20 > v13)
        {
          BOOL v21 = NSString;
          uint64_t v22 = [v18 objectForKeyedSubscript:@"type"];
          BOOL v23 = [v18 objectForKeyedSubscript:@"clientID"];
          signed __int16 v24 = [v18 objectForKeyedSubscript:@"process-name"];
          uint64_t v25 = [v18 objectForKeyedSubscript:@"event"];
          uint64_t v26 = [v21 stringWithFormat:@"com.apple.power.xpc.highRatePerHour.%@.%@.%@.%@", v22, v23, v24, v25, v36, v37];

          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v27 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __26__PLXPCService_dailyTasks__block_invoke_2;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v27;
            if (qword_1EBD5AF78 != -1) {
              dispatch_once(&qword_1EBD5AF78, block);
            }
            if (byte_1EBD5AF00)
            {
              uint64_t v28 = NSString;
              long long v29 = [v18 objectForKeyedSubscript:@"count"];
              uint64_t v30 = [v28 stringWithFormat:@"Reporting %@ crossing ratePerHourThreshold with %@", v26, v29];

              uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
              long long v33 = [v32 lastPathComponent];
              uint64_t v34 = [NSString stringWithUTF8String:"-[PLXPCService dailyTasks]"];
              [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:338];

              long long v35 = PLLogCommon();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v30;
                _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
          MEMORY[0x1D94294C0](v26, 1);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v15);
  }
}

uint64_t __26__PLXPCService_dailyTasks__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ratePerHourThreshold"];
  qword_1EBD5AF70 = result;
  return result;
}

uint64_t __26__PLXPCService_dailyTasks__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF00 = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF01 = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke_631(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF02 = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke_637(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF03 = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD5AF04 = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke_652(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  byte_1EBD5AF05 = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF06 = result;
  return result;
}

uint64_t __71__PLXPCService_permissionForClientID_withKey_withType_withProcessName___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF07 = result;
  return result;
}

- (void)resetPermissionsForClients
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AFB8 != -1) {
      dispatch_once(&qword_1EBD5AFB8, block);
    }
    if (byte_1EBD5AF08)
    {
      uint64_t v4 = [NSString stringWithFormat:@"resetPermissionsForClients start!"];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      double v7 = [v6 lastPathComponent];
      double v8 = [NSString stringWithUTF8String:"-[PLXPCService resetPermissionsForClients]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:467];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLXPCService *)self permissionCache];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_667;
  void v19[3] = &unk_1E69324A8;
  v19[4] = self;
  [v10 enumerateKeysAndObjectsUsingBlock:v19];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_677;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v11;
    if (qword_1EBD5AFC8 != -1) {
      dispatch_once(&qword_1EBD5AFC8, v18);
    }
    if (byte_1EBD5AF0A)
    {
      uint64_t v12 = [NSString stringWithFormat:@"resetPermissionsForClients done!"];
      uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLXPCService resetPermissionsForClients]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:478];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF08 = result;
  return result;
}

void __42__PLXPCService_resetPermissionsForClients__block_invoke_667(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 allKeys];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_2;
  v5[3] = &unk_1E692DA70;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __42__PLXPCService_resetPermissionsForClients__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D942A350]();
  id v5 = NSString;
  double v6 = [*(id *)(a1 + 32) clientNames];
  double v7 = [v6 objectForKeyedSubscript:v3];
  double v8 = [v5 stringWithFormat:@"%@.ClientID.%@", @"com.apple.powerlog.state_changed", v7];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 0);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD5AFC0 != -1) {
      dispatch_once(&qword_1EBD5AFC0, block);
    }
    if (byte_1EBD5AF09)
    {
      uint64_t v11 = [NSString stringWithFormat:@"resetPermissionsForClients posted %@", v8];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLXPCService resetPermissionsForClients]_block_invoke_2"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:474];

      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF09 = result;
  return result;
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke_677(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF0A = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF0B = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_686(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF0C = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_692(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF0D = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_698(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF0E = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_704(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF0F = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_713(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF10 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_723(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF11 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF12 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_740(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF13 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_743(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF14 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_749(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF15 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_755(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF16 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_761(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF17 = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_767(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF18 = result;
  return result;
}

uint64_t __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF19 = result;
  return result;
}

uint64_t __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke_781(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF1A = result;
  return result;
}

- (void)handlePeerResponderEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8
{
  int v76 = a5;
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v80 = a4;
  id v13 = a6;
  id v78 = a7;
  id v14 = a8;
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    uint64_t v15 = [(PLXPCService *)self satelliteProcessSemaphore];
    [v15 signalInterestByObject:v80];

    uint64_t v16 = [MEMORY[0x1E4F929F8] sharedManager];
    [v16 signalServiceActive:0];
  }
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__18;
  v129 = __Block_byref_object_dispose__18;
  id v130 = 0;
  if ([(PLOperator *)self isDebugEnabled])
  {
    uint64_t v17 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ResponderEvent"];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v17];
    uint64_t v19 = (void *)v126[5];
    void v126[5] = v18;

    uint64_t v20 = [v80 objectForKeyedSubscript:@"event"];
    [(id)v126[5] setObject:v20 forKeyedSubscript:@"event"];

    BOOL v21 = [v80 objectForKeyedSubscript:@"clientID"];
    [(id)v126[5] setObject:v21 forKeyedSubscript:@"clientID"];

    uint64_t v22 = [v80 objectForKeyedSubscript:@"process-name"];
    [(id)v126[5] setObject:v22 forKeyedSubscript:@"process-name"];

    if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0) {
      [(PLOperator *)self logEntry:v126[5]];
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke;
    v124[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v124[4] = v23;
    if (qword_1EBD5B050 != -1) {
      dispatch_once(&qword_1EBD5B050, v124);
    }
    if (byte_1EBD5AF1B)
    {
      signed __int16 v24 = [NSString stringWithFormat:@"clientID=%i, processName=%@, key=%@, payload=%@", v76, v13, v78, v14];
      uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v27 = [v26 lastPathComponent];
      uint64_t v28 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:666];

      long long v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v133) = 138412290;
        *(void *)((char *)&v133 + 4) = v24;
        _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v133, 0xCu);
      }
    }
  }
  *(void *)&long long v133 = 0;
  *((void *)&v133 + 1) = &v133;
  uint64_t v134 = 0x3032000000;
  v135 = __Block_byref_object_copy__18;
  v136 = __Block_byref_object_dispose__18;
  id v75 = v74;
  id v137 = v75;
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x2020000000;
  __int16 v123 = v76;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__18;
  v118 = __Block_byref_object_dispose__18;
  id v73 = v13;
  id v119 = v73;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__18;
  v112 = __Block_byref_object_dispose__18;
  id v77 = v78;
  id v113 = v77;
  uint64_t v102 = 0;
  unsigned int v103 = &v102;
  uint64_t v104 = 0x3032000000;
  unsigned int v105 = __Block_byref_object_copy__18;
  unsigned int v106 = __Block_byref_object_dispose__18;
  id v79 = v14;
  id v107 = v79;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__18;
  v100 = __Block_byref_object_dispose__18;
  uint64_t v30 = [(PLXPCService *)self registeredResponders];
  id v101 = [(PLXPCService *)self registeredOperatorFromDictionary:v30 forMessage:v80];

  uint64_t v31 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__18;
  v94[4] = __Block_byref_object_dispose__18;
  id v95 = 0;
  while (1)
  {
    uint64_t v32 = [(PLXPCService *)self registeredResponders];
    uint64_t v33 = [(PLXPCService *)self registeredOperatorFromDictionary:v32 forMessage:v80];
    uint64_t v34 = (void *)v97[5];
    v97[5] = v33;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v35 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_791;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v35;
      if (qword_1EBD5B058 != -1) {
        dispatch_once(&qword_1EBD5B058, block);
      }
      if (byte_1EBD5AF1C)
      {
        char v36 = NSString;
        uint64_t v37 = [(PLXPCService *)self registeredResponders];
        id v38 = [v36 stringWithFormat:@"!!! %s/%d: count=%d, [self registeredResponders]=%@, message=%@, responder=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 681, v31, v37, v80, v97[5]];

        uint64_t v39 = (void *)MEMORY[0x1E4F929B8];
        long long v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        long long v41 = [v40 lastPathComponent];
        long long v42 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:681];

        long long v43 = PLLogCommon();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v132 = v38;
          _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v97[5]) {
      break;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v44 = objc_opt_class();
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_850;
      v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v82[4] = v44;
      if (qword_1EBD5B088 != -1) {
        dispatch_once(&qword_1EBD5B088, v82);
      }
      if (byte_1EBD5AF22)
      {
        uint64_t v45 = [NSString stringWithFormat:@"No registered Responder"];
        v46 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v48 = [v47 lastPathComponent];
        id v49 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:731];

        __int16 v50 = PLLogCommon();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v132 = v45;
          _os_log_debug_impl(&dword_1D2690000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v31 > 3) {
      useconds_t v51 = 1000000;
    }
    else {
      useconds_t v51 = [(PLXPCService *)self responderWaitTime];
    }
    usleep(v51);
    uint64_t v31 = (v31 + 1);
    if (v31 == 20) {
      goto LABEL_50;
    }
  }
  id v52 = [v80 objectForKeyedSubscript:@"clientID"];
  if ([v52 integerValue] != 32) {
    goto LABEL_45;
  }
  v53 = [v80 objectForKeyedSubscript:@"event"];
  id v54 = [v53 description];
  int v55 = [v54 isEqualToString:@"SafeLogFile"];

  if (v55)
  {
    v56 = (void *)[v79 mutableCopy];
    [v56 setObject:MEMORY[0x1E4F1CC38] forKey:@"BLDRetail"];
    id v52 = v56;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v57 = objc_opt_class();
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_803;
      v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v92[4] = v57;
      if (qword_1EBD5B060 != -1) {
        dispatch_once(&qword_1EBD5B060, v92);
      }
      if (byte_1EBD5AF1D)
      {
        v58 = [NSString stringWithFormat:@"!!! %s/%d: clientID=%d, event=%@, processName=%@, key=%@, payload=%@, message=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 687, *((__int16 *)v121 + 12), v75, v115[5], v109[5], v103[5], v80];
        v59 = (void *)MEMORY[0x1E4F929B8];
        id v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
        uint64_t v61 = [v60 lastPathComponent];
        v62 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]"];
        [v59 logMessage:v58 fromFile:v61 fromFunction:v62 fromLineNumber:687];

        uint64_t v63 = PLLogCommon();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v132 = v58;
          _os_log_debug_impl(&dword_1D2690000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v64 = dispatch_get_global_queue(0, 0);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_807;
    v91[3] = &unk_1E692EEF0;
    v91[4] = self;
    v91[5] = v94;
    dispatch_sync(v64, v91);

    id v79 = v52;
LABEL_45:
  }
  v65 = [v80 objectForKeyedSubscript:@"event"];
  id v66 = [v65 description];
  int v67 = [v66 isEqualToString:@"Aggregate"];

  if (v67) {
    intptr_t v68 = -32768;
  }
  else {
    intptr_t v68 = 0;
  }
  v69 = dispatch_get_global_queue(v68, 0);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_843;
  v83[3] = &unk_1E69325F8;
  id v86 = &v120;
  v87 = &v114;
  uint64_t v88 = &v108;
  long long v89 = &v102;
  objc_super v85 = &v96;
  void v83[4] = self;
  long long v90 = &v133;
  id v84 = v80;
  dispatch_async(v69, v83);

LABEL_50:
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd] && !v97[5])
  {
    v70 = PLLogCommon();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v132 = v80;
      _os_log_error_impl(&dword_1D2690000, v70, OS_LOG_TYPE_ERROR, "powerlogHelperd received unhandled query: %@", buf, 0xCu);
    }

    v71 = [(PLXPCService *)self satelliteProcessSemaphore];
    [v71 signalDoneByObject:v80];
  }
  uint64_t v72 = v126[5];
  if (v72)
  {
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_854;
    v81[3] = &unk_1E692ACB0;
    void v81[4] = &v125;
    [(PLOperator *)self updateEntry:v72 withBlock:v81];
  }
  _Block_object_dispose(v94, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v102, 8);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(&v120, 8);
  _Block_object_dispose(&v133, 8);

  _Block_object_dispose(&v125, 8);
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF1B = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_791(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF1C = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_803(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF1D = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_807(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  PLTalkToPowerlogHelper();
  uint64_t v2 = PLQueryRegistered();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unint64_t v5 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v6;
    if (qword_1EBD5B068 != -1) {
      dispatch_once(&qword_1EBD5B068, v48);
    }
    if (byte_1EBD5AF1E)
    {
      double v7 = [NSString stringWithFormat:@"%s/%d: buiResults=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke", 693, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      double v8 = (void *)MEMORY[0x1E4F929B8];
      double v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      uint64_t v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:693];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = (uint64_t)v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v5 = 0x1E4F92000uLL;
    }
  }
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v13)
  {
    [v13 objectForKeyedSubscript:@"result"];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = @"EntryKey";
      uint64_t v17 = *(void *)v45;
      uint64_t v39 = *(void *)v45;
      do
      {
        uint64_t v18 = 0;
        uint64_t v40 = v15;
        do
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v44 + 1) + 8 * v18);
          id v20 = objc_alloc(MEMORY[0x1E4F929D0]);
          BOOL v21 = [v19 objectForKeyedSubscript:v16];
          uint64_t v22 = (void *)[v20 initWithEntryKey:v21 withRawData:v19];

          [*(id *)(a1 + 32) logEntry:v22];
          if ([*(id *)(v5 + 2496) debugEnabled])
          {
            uint64_t v23 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_829;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v23;
            if (qword_1EBD5B070 != -1) {
              dispatch_once(&qword_1EBD5B070, block);
            }
            if (byte_1EBD5AF1F)
            {
              uint64_t v24 = a1;
              uint64_t v25 = v16;
              objc_msgSend(NSString, "stringWithFormat:", @"!!! %s/%d: log to database; entry=%@, serializedEntry=%@",
                "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2",
                702,
                v22,
              uint64_t v26 = v19);
              uint64_t v27 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
              long long v29 = [v28 lastPathComponent];
              uint64_t v30 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2"];
              [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:702];

              uint64_t v31 = PLLogCommon();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v51 = (uint64_t)v26;
                _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v5 = 0x1E4F92000;
              uint64_t v16 = v25;
              a1 = v24;
              uint64_t v17 = v39;
              uint64_t v15 = v40;
            }
          }

          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v15);
    }
LABEL_31:

    return;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_836;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v32;
    if (qword_1EBD5B078 != -1) {
      dispatch_once(&qword_1EBD5B078, v42);
    }
    if (byte_1EBD5AF20)
    {
      uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"!!! %s/%d: buiResults is nil", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2", 705);
      uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      char v36 = [v35 lastPathComponent];
      uint64_t v37 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2"];
      id obj = (id)v33;
      [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:705];

      id v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = v33;
        _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_31;
    }
  }
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF1E = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_829(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF1F = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_836(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF20 = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_843(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) respondToRequestForClientID:*(__int16 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) withProcessName:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withKey:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) withPayload:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2_844;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5B080 != -1) {
      dispatch_once(&qword_1EBD5B080, block);
    }
    if (byte_1EBD5AF21)
    {
      uint64_t v4 = [NSString stringWithFormat:@"!!! %s/%d: responder=%@, response=%@", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke", 722, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v2];
      unint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m"];
      double v7 = [v6 lastPathComponent];
      double v8 = [NSString stringWithUTF8String:"-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:722];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) respondToEvent:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) withResponse:v2];
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    uint64_t v10 = [*(id *)(a1 + 32) satelliteProcessSemaphore];
    [v10 signalDoneByObject:*(void *)(a1 + 40)];
  }
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2_844(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF21 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_850(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF22 = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_854(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v2 forKeyedSubscript:@"timestampEnd"];
}

uint64_t __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF23 = result;
  return result;
}

uint64_t __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_860(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AF24 = result;
  return result;
}

- (void)stopPowerlogHelperd:(id)a3
{
  id v5 = [a3 userInfo];
  uint64_t v4 = [v5 objectForKeyedSubscript:@"timeout"];
  -[PLXPCService setSatelliteProcessExitWithTime:](self, "setSatelliteProcessExitWithTime:", (double)(int)[v4 intValue]);
}

- (void)setSatelliteProcessExitWithTime:(double)a3
{
  id v5 = [(PLXPCService *)self satelliteProcessSemaphore];
  [v5 setTimeout:a3];

  [(PLXPCService *)self setSatelliteProcessExit];
}

- (void)setSatelliteProcessExit
{
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke;
    block[3] = &unk_1E692A250;
    block[4] = self;
    if (setSatelliteProcessExit_onceToken != -1) {
      dispatch_once(&setSatelliteProcessExit_onceToken, block);
    }
  }
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke_2;
  block[3] = &unk_1E692A250;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke_2(uint64_t a1)
{
  while (1)
  {
    id v2 = [*(id *)(a1 + 32) satelliteProcessSemaphore];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke_3;
    v3[3] = &unk_1E692A250;
    v3[4] = *(void *)(a1 + 32);
    [v2 waitWithBlockSync:v3];
  }
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  [(id)v2 blockingFlushCachesWithReason:@"SatelliteExit"];

  sleep(0xAu);
  uint64_t v3 = [*(id *)(a1 + 32) satelliteProcessSemaphore];
  LOBYTE(v2) = [v3 isActive];

  if ((v2 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F929F8] sharedManager];
    [v4 signalServiceInactive:0];
  }
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void)setRegisteredListeners:(id)a3
{
}

- (NSMutableDictionary)registeredResponders
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRegisteredResponders:(id)a3
{
}

- (void)setPermissionCache:(id)a3
{
}

- (PLNSNotificationOperatorComposition)registrationNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRegistrationNotification:(id)a3
{
}

- (void)setClientIDs:(id)a3
{
}

- (NSDictionary)clientNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientNames:(id)a3
{
}

- (PLTimer)resetPermissionsForClientsTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setResetPermissionsForClientsTimer:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (PLSemaphore)satelliteProcessSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSatelliteProcessSemaphore:(id)a3
{
}

- (unsigned)responderWaitTime
{
  return self->_responderWaitTime;
}

- (void)setResponderWaitTime:(unsigned int)a3
{
  self->_responderWaitTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteProcessSemaphore, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_resetPermissionsForClientsTimer, 0);
  objc_storeStrong((id *)&self->_clientNames, 0);
  objc_storeStrong((id *)&self->_clientIDs, 0);
  objc_storeStrong((id *)&self->_registrationNotification, 0);
  objc_storeStrong((id *)&self->_permissionCache, 0);
  objc_storeStrong((id *)&self->_registeredResponders, 0);
  objc_storeStrong((id *)&self->_registeredListeners, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end