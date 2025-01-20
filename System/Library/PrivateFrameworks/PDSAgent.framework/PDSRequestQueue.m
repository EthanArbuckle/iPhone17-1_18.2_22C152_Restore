@interface PDSRequestQueue
- (BOOL)_isAuthIssue:(int64_t)a3;
- (BOOL)enqueueRequest:(id)a3;
- (FTMessageDelivery)messageDelivery;
- (NSDate)lastReauthAttempt;
- (OS_dispatch_queue)queue;
- (PDSRequest)inflightRequest;
- (PDSRequest)queuedRequest;
- (PDSRequestQueue)initWithMessageDelivery:(id)a3 userTracker:(id)a4 queue:(id)a5 pushTokenBlock:(id)a6 entryStoreBlock:(id)a7;
- (PDSRequestQueueDelegate)delegate;
- (PDSUserTracker)userTracker;
- (id)_deviceInfo;
- (id)_hwVersion;
- (id)_machineID;
- (id)_osVersion;
- (id)entryStoreBlock;
- (id)pushTokenBlock;
- (int64_t)authRetries;
- (int64_t)messageTimeout;
- (void)_cancelPendingRequests;
- (void)_dequeueIfNeeded;
- (void)_flightRequest:(id)a3;
- (void)_logEntries:(id)a3;
- (void)_logProtoUserPushToken:(id)a3;
- (void)_reAuthAndContinueWithRequest:(id)a3 forUser:(id)a4;
- (void)_removeDeadEntriesForUser:(id)a3 withError:(id *)a4;
- (void)setAuthRetries:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEntryStoreBlock:(id)a3;
- (void)setInflightRequest:(id)a3;
- (void)setLastReauthAttempt:(id)a3;
- (void)setMessageDelivery:(id)a3;
- (void)setMessageTimeout:(int64_t)a3;
- (void)setPushTokenBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedRequest:(id)a3;
- (void)setUserTracker:(id)a3;
@end

@implementation PDSRequestQueue

- (PDSRequestQueue)initWithMessageDelivery:(id)a3 userTracker:(id)a4 queue:(id)a5 pushTokenBlock:(id)a6 entryStoreBlock:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PDSRequestQueue.m", 51, @"Invalid parameter not satisfying: %@", @"messageDelivery" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PDSRequestQueue.m", 52, @"Invalid parameter not satisfying: %@", @"userTracker" object file lineNumber description];

  if (v17)
  {
LABEL_4:
    if (v16) {
      goto LABEL_5;
    }
LABEL_12:
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PDSRequestQueue.m", 54, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v18) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"PDSRequestQueue.m", 53, @"Invalid parameter not satisfying: %@", @"pushTokenBlock" object file lineNumber description];

  if (!v16) {
    goto LABEL_12;
  }
LABEL_5:
  if (v18) {
    goto LABEL_6;
  }
LABEL_13:
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"PDSRequestQueue.m", 55, @"Invalid parameter not satisfying: %@", @"entryStoreBlock" object file lineNumber description];

LABEL_6:
  v31.receiver = self;
  v31.super_class = (Class)PDSRequestQueue;
  v19 = [(PDSRequestQueue *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageDelivery, a3);
    objc_storeStrong((id *)&v20->_userTracker, a4);
    uint64_t v21 = MEMORY[0x223C8A560](v17);
    id pushTokenBlock = v20->_pushTokenBlock;
    v20->_id pushTokenBlock = (id)v21;

    v20->_authRetries = 0;
    objc_storeStrong((id *)&v20->_queue, a5);
    uint64_t v23 = MEMORY[0x223C8A560](v18);
    id entryStoreBlock = v20->_entryStoreBlock;
    v20->_id entryStoreBlock = (id)v23;

    v20->_messageTimeout = 36000;
  }

  return v20;
}

- (BOOL)enqueueRequest:(id)a3
{
  id v4 = a3;
  v5 = [(PDSRequestQueue *)self delegate];

  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [(PDSRequestQueue *)self inflightRequest];
  if (!v6) {
    goto LABEL_5;
  }
  v7 = (void *)v6;
  v8 = [(PDSRequestQueue *)self inflightRequest];
  v9 = [v8 entries];
  v10 = [v4 entries];
  char v11 = [v9 isEqualToSet:v10];

  if (v11)
  {
LABEL_4:
    BOOL v12 = 0;
  }
  else
  {
LABEL_5:
    [(PDSRequestQueue *)self setQueuedRequest:v4];
    [(PDSRequestQueue *)self _dequeueIfNeeded];
    BOOL v12 = 1;
  }

  return v12;
}

- (void)_dequeueIfNeeded
{
  v3 = [(PDSRequestQueue *)self inflightRequest];

  if (!v3)
  {
    id v4 = [(PDSRequestQueue *)self queuedRequest];
    if (v4)
    {
      [(PDSRequestQueue *)self setQueuedRequest:0];
      [(PDSRequestQueue *)self _flightRequest:v4];
    }
  }
}

- (id)_deviceInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(PDSRequestQueue *)self _machineID];
  v5 = objc_alloc_init(PDSProtoMapEntry);
  [(PDSProtoMapEntry *)v5 setKey:@"mid"];
  [(PDSProtoMapEntry *)v5 setValue:v4];
  uint64_t v6 = objc_alloc_init(PDSProtoMapEntry);
  [(PDSProtoMapEntry *)v6 setKey:@"hwv"];
  v7 = [(PDSRequestQueue *)self _hwVersion];
  [(PDSProtoMapEntry *)v6 setValue:v7];

  v8 = objc_alloc_init(PDSProtoMapEntry);
  [(PDSProtoMapEntry *)v8 setKey:@"osv"];
  v9 = [(PDSRequestQueue *)self _osVersion];
  [(PDSProtoMapEntry *)v8 setValue:v9];

  [v3 addObject:v5];
  [v3 addObject:v6];
  [v3 addObject:v8];

  return v3;
}

- (id)_machineID
{
  if (_machineID_onceToken != -1) {
    dispatch_once(&_machineID_onceToken, &__block_literal_global_1);
  }
  id v7 = 0;
  v2 = [(id)_machineID_anisetteProvisioningController anisetteDataWithError:&v7];
  id v3 = v7;
  id v4 = v3;
  if (v3) {
    NSLog(&cfstr_Anisettedatawi.isa, v3);
  }
  v5 = [v2 machineID];
  if (![(__CFString *)v5 length])
  {

    v5 = @"Unknown";
  }

  return v5;
}

uint64_t __29__PDSRequestQueue__machineID__block_invoke()
{
  _machineID___AKAnisetteProvisioningControllerClass = MEMORY[0x223C8A1B0](@"AKAnisetteProvisioningController", @"AuthKit");
  _machineID_anisetteProvisioningController = (uint64_t)objc_alloc_init((Class)_machineID___AKAnisetteProvisioningControllerClass);
  return MEMORY[0x270F9A758]();
}

- (id)_osVersion
{
  v2 = NSString;
  id v3 = [MEMORY[0x263F4A818] sharedInstance];
  id v4 = [v3 productName];
  v5 = [MEMORY[0x263F4A818] sharedInstance];
  uint64_t v6 = [v5 productVersion];
  id v7 = [MEMORY[0x263F4A818] sharedInstance];
  v8 = [v7 productBuildVersion];
  v9 = [v2 stringWithFormat:@"%@,%@,%@", v4, v6, v8];

  return v9;
}

- (id)_hwVersion
{
  v2 = [MEMORY[0x263F4A818] sharedInstance];
  id v3 = [v2 model];

  if (![(__CFString *)v3 length])
  {

    id v3 = @"Unknown";
  }
  return v3;
}

- (void)_flightRequest:(id)a3
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  id v127 = a3;
  id v3 = pds_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221791000, v3, OS_LOG_TYPE_DEFAULT, "PDSRequestQueue: constructing request to flight", buf, 2u);
  }

  id v4 = pds_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v127 entries];
    uint64_t v6 = [v5 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_221791000, v4, OS_LOG_TYPE_DEFAULT, "%lu total entries", buf, 0xCu);
  }
  id v7 = [v127 entries];
  [(PDSRequestQueue *)self _logEntries:v7];

  [(PDSRequestQueue *)self setInflightRequest:v127];
  v123 = objc_alloc_init(PDSProtoBatchRegisterReq);
  id v139 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v130 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v125 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [(PDSRequestQueue *)self delegate];
  uint64_t v121 = [v8 ttlForRequest:v127];

  v122 = [(PDSRequestQueue *)self _deviceInfo];
  long long v151 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v148 = 0u;
  obj = [v127 entries];
  uint64_t v138 = [(PDSRegisterMessage *)obj countByEnumeratingWithState:&v148 objects:v155 count:16];
  if (v138)
  {
    int v126 = 0;
    char v118 = 0;
    char v120 = 0;
    uint64_t v137 = *(void *)v149;
    v119 = (void *)*MEMORY[0x263F280D0];
    v124 = (void *)*MEMORY[0x263F280C8];
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v149 != v137) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v148 + 1) + 8 * v9);
        char v11 = [v10 user];
        BOOL v12 = [v11 userID];
        id v13 = [v139 objectForKeyedSubscript:v12];

        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v14 = [v10 user];
          id v15 = [v14 userID];
          [v139 setObject:v13 forKeyedSubscript:v15];
        }
        id v16 = NSNumber;
        id v17 = [v10 registration];
        id v18 = objc_msgSend(v16, "numberWithChar:", objc_msgSend(v17, "pushEnvironment"));
        v19 = [v13 objectForKeyedSubscript:v18];

        if (v19)
        {
LABEL_13:
          if ([v10 state] != 2)
          {
            v20 = objc_alloc_init(PDSProtoTopic);
            uint64_t v21 = [v10 registration];
            v22 = [v21 topicString];
            if (v22)
            {
              uint64_t v23 = [v10 registration];
              v24 = [v23 qualifierString];
              BOOL v25 = v24 == 0;

              if (!v25)
              {
                v26 = [v10 registration];
                v27 = [v26 topicString];
                [(PDSProtoTopic *)v20 setName:v27];

                v28 = [v10 registration];
                v29 = [v28 qualifierString];
                [(PDSProtoTopic *)v20 setQualifier:v29];

                [(PDSProtoUserPushTokenRegRequest *)v19 addTopic:v20];
                ++v126;
                goto LABEL_32;
              }
            }
            else
            {
            }
            v43 = pds_defaultLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_221791000, v43, OS_LOG_TYPE_DEFAULT, "Missing required info for entry! Not including entry in request", buf, 2u);
            }

LABEL_32:
          }

          goto LABEL_34;
        }
        v30 = [v10 user];
        objc_super v31 = [v30 userID];
        v32 = [v130 objectForKeyedSubscript:v31];
        v33 = NSNumber;
        v34 = [v10 registration];
        v35 = objc_msgSend(v33, "numberWithChar:", objc_msgSend(v34, "pushEnvironment"));
        LODWORD(v33) = [v32 containsObject:v35];

        if (v33)
        {
          pds_defaultLog();
          v20 = (PDSProtoTopic *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v20->super.super, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_221791000, &v20->super.super, OS_LOG_TYPE_DEFAULT, "The user/env for this entry has been omitted from the request. Skipping entry", buf, 2u);
          }
          v19 = 0;
          goto LABEL_32;
        }
        v36 = [(PDSRequestQueue *)self userTracker];
        id v147 = 0;
        v37 = [v10 user];
        id v146 = 0;
        v133 = [v36 tokenAndIdentifier:&v147 forUser:v37 withError:&v146];
        id v135 = v147;
        id v136 = v146;

        if (!v136 && v133 && v135)
        {
          v38 = [v10 user];
          [v125 setObject:v38 forKeyedSubscript:v135];

          v134 = objc_alloc_init(PDSProtoGSTokenAuth);
          [(PDSProtoGSTokenAuth *)v134 setGsAuthToken:v133];
          v39 = objc_alloc_init(PDSProtoUserAuth);
          [(PDSProtoUserAuth *)v39 setUserauthOneof:1];
          [(PDSProtoUserAuth *)v39 setGsAuthToken:v134];
          v40 = [v10 registration];
          int v41 = [v40 pushEnvironment];

          v42 = v124;
          if (v41 == 1) {
            goto LABEL_27;
          }
          if (v41)
          {
            id v128 = 0;
          }
          else
          {
            v42 = v119;
LABEL_27:
            id v128 = v42;
          }
          v66 = [(PDSRequestQueue *)self pushTokenBlock];
          v129 = ((void (**)(void, id))v66)[2](v66, v128);

          v67 = objc_msgSend(v129, "__imHexString");
          BOOL v68 = [v67 length] == 0;

          if (v68)
          {
            v78 = pds_defaultLog();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v128;
              _os_log_impl(&dword_221791000, v78, OS_LOG_TYPE_DEFAULT, "Missing push token for environment %@! Omitting from request", buf, 0xCu);
            }

            v79 = [v10 user];
            v80 = [v79 userID];
            v69 = [v130 objectForKeyedSubscript:v80];

            if (!v69)
            {
              v69 = (PDSProtoUserPushToken *)objc_alloc_init(MEMORY[0x263EFF9C0]);
              v81 = [v10 user];
              v82 = [v81 userID];
              [v130 setObject:v69 forKeyedSubscript:v82];
            }
            v83 = NSNumber;
            v74 = [v10 registration];
            v84 = objc_msgSend(v83, "numberWithChar:", objc_msgSend(v74, "pushEnvironment"));
            [(PDSProtoUserPushToken *)v69 addObject:v84];

            v19 = 0;
            int v58 = 3;
            char v120 = 1;
          }
          else
          {
            v69 = objc_alloc_init(PDSProtoUserPushToken);
            [(PDSProtoUserPushToken *)v69 setUserId:v135];
            v70 = objc_msgSend(v129, "__imHexString");
            [(PDSProtoUserPushToken *)v69 setPushToken:v70];

            [(PDSProtoUserPushToken *)v69 setUserAuth:v39];
            v71 = pds_defaultLog();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_221791000, v71, OS_LOG_TYPE_DEFAULT, "Adding UserPushToken to request:", buf, 2u);
            }

            [(PDSRequestQueue *)self _logProtoUserPushToken:v69];
            v19 = objc_alloc_init(PDSProtoUserPushTokenRegRequest);
            [(PDSProtoUserPushTokenRegRequest *)v19 setUserPushToken:v69];
            [(PDSProtoUserPushTokenRegRequest *)v19 setDeviceInfos:v122];
            [(PDSProtoUserPushTokenRegRequest *)v19 setTtl:v121];
            v72 = NSNumber;
            v73 = [v10 registration];
            v74 = objc_msgSend(v72, "numberWithChar:", objc_msgSend(v73, "pushEnvironment"));

            v75 = [v10 user];
            v76 = [v75 userID];
            v77 = [v139 objectForKeyedSubscript:v76];
            [v77 setObject:v19 forKeyedSubscript:v74];

            [(PDSProtoBatchRegisterReq *)v123 addUserPushTokenRegRequests:v19];
            int v58 = 0;
          }

          goto LABEL_60;
        }
        v44 = pds_defaultLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v136;
          __int16 v153 = 2112;
          id v154 = v135;
          _os_log_impl(&dword_221791000, v44, OS_LOG_TYPE_DEFAULT, "Issue obtaining token. Error: %@ -- DSID: %@", buf, 0x16u);
        }

        v45 = [v136 domain];
        v46 = v45;
        if (v45 != (void *)*MEMORY[0x263F5BA28])
        {

LABEL_48:
          v59 = [v10 user];
          [(PDSRequestQueue *)self _reAuthAndContinueWithRequest:v127 forUser:v59];

          id v60 = objc_alloc(MEMORY[0x263F4A260]);
          v61 = NSNumber;
          v62 = [v127 requestInfo];
          v63 = objc_msgSend(v61, "numberWithUnsignedInteger:", objc_msgSend(v62, "regReason"));
          v64 = [v127 requestInfo];
          v65 = [v64 heartbeatDate];
          v134 = (PDSProtoGSTokenAuth *)[v60 initWithFailureReason:@"Auth issue - potentially recoverable" registrationReason:v63 heartbeatDate:v65];

          v39 = [MEMORY[0x263F4A1F8] defaultLogger];
          [(PDSProtoUserAuth *)v39 logMetric:v134];
          v19 = 0;
          int v58 = 1;
          goto LABEL_60;
        }
        BOOL v47 = [v136 code] == -102;

        if (!v47) {
          goto LABEL_48;
        }
        v48 = pds_defaultLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221791000, v48, OS_LOG_TYPE_DEFAULT, "User is non-existent.  Skipping, removing dead entries for user, and continuing with request", buf, 2u);
        }

        v49 = [v10 user];
        v50 = [v49 userID];
        v134 = [v130 objectForKeyedSubscript:v50];

        if (!v134)
        {
          v134 = (PDSProtoGSTokenAuth *)objc_alloc_init(MEMORY[0x263EFF9C0]);
          v51 = [v10 user];
          v52 = [v51 userID];
          [v130 setObject:v134 forKeyedSubscript:v52];
        }
        v53 = NSNumber;
        v54 = [v10 registration];
        v55 = objc_msgSend(v53, "numberWithChar:", objc_msgSend(v54, "pushEnvironment"));
        [(PDSProtoGSTokenAuth *)v134 addObject:v55];

        v56 = [v10 user];
        id v145 = 0;
        [(PDSRequestQueue *)self _removeDeadEntriesForUser:v56 withError:&v145];
        v39 = (PDSProtoUserAuth *)v145;

        v57 = pds_defaultLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v39;
          _os_log_impl(&dword_221791000, v57, OS_LOG_TYPE_DEFAULT, "Removed entries for user with error: %@", buf, 0xCu);
        }

        v19 = 0;
        int v58 = 3;
        char v118 = 1;
LABEL_60:

        if (!v58) {
          goto LABEL_13;
        }

        if (v58 != 3) {
          goto LABEL_88;
        }
LABEL_34:
        ++v9;
      }
      while (v138 != v9);
      uint64_t v85 = [(PDSRegisterMessage *)obj countByEnumeratingWithState:&v148 objects:v155 count:16];
      uint64_t v138 = v85;
      if (!v85) {
        goto LABEL_66;
      }
    }
  }
  int v126 = 0;
  char v118 = 0;
  char v120 = 0;
LABEL_66:

  v86 = pds_defaultLog();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v126;
    _os_log_impl(&dword_221791000, v86, OS_LOG_TYPE_DEFAULT, "Total active entries to flight: %d", buf, 8u);
  }

  v87 = [(PDSProtoBatchRegisterReq *)v123 userPushTokenRegRequests];
  BOOL v88 = [v87 count] == 0;

  if (v88)
  {
    v99 = pds_defaultLog();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221791000, v99, OS_LOG_TYPE_DEFAULT, "RegRequest is empty! Aborting", buf, 2u);
    }

    [(PDSRequestQueue *)self setInflightRequest:0];
    v100 = @"Missing Token";
    v101 = @"Missing user";
    if (v120) {
      v101 = @"Missing Token & User";
    }
    else {
      v100 = 0;
    }
    if (v118) {
      v102 = v101;
    }
    else {
      v102 = v100;
    }
    id v103 = objc_alloc(MEMORY[0x263F4A260]);
    v104 = NSNumber;
    v105 = [v127 requestInfo];
    v106 = objc_msgSend(v104, "numberWithUnsignedInteger:", objc_msgSend(v105, "regReason"));
    v107 = [v127 requestInfo];
    v108 = [v107 heartbeatDate];
    obj = (PDSRegisterMessage *)[v103 initWithFailureReason:v102 registrationReason:v106 heartbeatDate:v108];

    v95 = [MEMORY[0x263F4A1F8] defaultLogger];
    [v95 logMetric:obj];
  }
  else
  {
    obj = objc_alloc_init(PDSRegisterMessage);
    [(PDSProtoBatchRegisterReq *)v123 setRequestTtl:v121];
    v89 = pds_defaultLog();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v121;
      _os_log_impl(&dword_221791000, v89, OS_LOG_TYPE_DEFAULT, "Using request ttl: %ld", buf, 0xCu);
    }

    [(PDSRegisterMessage *)obj setProtoRequest:v123];
    v90 = [v127 requestInfo];
    -[PDSRegisterMessage setRegReason:](obj, "setRegReason:", [v90 regReason]);

    v91 = pds_defaultLog();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      v92 = [v127 requestInfo];
      uint64_t v93 = [v92 regReason];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v93;
      _os_log_impl(&dword_221791000, v91, OS_LOG_TYPE_DEFAULT, "Setting registration reason: %ld", buf, 0xCu);
    }
    [(IDSBaseMessage *)obj setTimeout:(double)self->_messageTimeout];
    v94 = [(PDSRequestQueue *)self pushTokenBlock];
    v95 = v94[2](v94, *MEMORY[0x263F280D0]);

    v96 = objc_msgSend(v95, "__imHexString");
    BOOL v97 = [v96 length] == 0;

    if (v97)
    {
      v109 = pds_defaultLog();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221791000, v109, OS_LOG_TYPE_DEFAULT, "Missing push token! Failing request", buf, 2u);
      }

      id v110 = objc_alloc(MEMORY[0x263F4A260]);
      v111 = NSNumber;
      v112 = [v127 requestInfo];
      v113 = objc_msgSend(v111, "numberWithUnsignedInteger:", objc_msgSend(v112, "regReason"));
      v114 = [v127 requestInfo];
      v115 = [v114 heartbeatDate];
      v116 = (void *)[v110 initWithFailureReason:@"Could not fetch production push token" registrationReason:v113 heartbeatDate:v115];

      v117 = [MEMORY[0x263F4A1F8] defaultLogger];
      [v117 logMetric:v116];

      [(PDSRequestQueue *)self setInflightRequest:0];
    }
    else
    {
      [(FTIDSMessage *)obj setPushToken:v95];
      IDSAssignPushIdentityToMessage();
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v140[0] = MEMORY[0x263EF8330];
      v140[1] = 3221225472;
      v140[2] = __34__PDSRequestQueue__flightRequest___block_invoke;
      v140[3] = &unk_2645C8DA0;
      objc_copyWeak(&v144, (id *)buf);
      id v141 = v125;
      v142 = self;
      id v143 = v127;
      [(IDSBaseMessage *)obj setCompletionBlock:v140];
      [(PDSRequestQueue *)self _cancelPendingRequests];
      v98 = [(PDSRequestQueue *)self messageDelivery];
      [v98 sendMessage:obj];

      objc_destroyWeak(&v144);
      objc_destroyWeak((id *)buf);
    }
  }

LABEL_88:
}

void __34__PDSRequestQueue__flightRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__PDSRequestQueue__flightRequest___block_invoke_2;
    block[3] = &unk_2645C8D78;
    block[4] = v5;
    id v11 = v3;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v12 = v7;
    uint64_t v13 = v8;
    id v14 = v9;
    dispatch_async(v6, block);
  }
}

void __34__PDSRequestQueue__flightRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setInflightRequest:0];
  [*(id *)(a1 + 32) _dequeueIfNeeded];
  v2 = [*(id *)(a1 + 40) protoResponse];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v26 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v25 = v2;
  id v4 = [v2 userPushTokenRegResponses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(PDSResponse **)(*((void *)&v27 + 1) + 8 * i);
        v10 = [(PDSResponse *)v9 userPushToken];
        id v11 = [v10 userId];

        if (v11)
        {
          id v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
          if (v12)
          {
            uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[PDSResponse status](v9, "status"));
            [v3 setObject:v13 forKeyedSubscript:v12];

            if (objc_msgSend(*(id *)(a1 + 56), "_isAuthIssue:", (int)-[PDSResponse status](v9, "status"))
              && ([v26 containsObject:v12] & 1) == 0)
            {
              id v14 = pds_defaultLog();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                int v15 = [(PDSResponse *)v9 status];
                *(_DWORD *)buf = 67109120;
                LODWORD(v32) = v15;
                _os_log_impl(&dword_221791000, v14, OS_LOG_TYPE_DEFAULT, "Auth issue: %i", buf, 8u);
              }

              [*(id *)(a1 + 32) _reAuthAndContinueWithRequest:*(void *)(a1 + 64) forUser:v12];
              [v26 addObject:v12];
            }
          }
          else
          {
            id v16 = pds_defaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v11;
              _os_log_impl(&dword_221791000, v16, OS_LOG_TYPE_DEFAULT, "A matching user for: %@ not found", buf, 0xCu);
            }
          }
        }
        else
        {
          id v12 = pds_defaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v9;
            _os_log_impl(&dword_221791000, v12, OS_LOG_TYPE_DEFAULT, "alDSID not included in response: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }

  id v17 = [*(id *)(a1 + 32) delegate];
  uint64_t v18 = [v17 ttlForRequest:*(void *)(a1 + 64)];

  if ([v25 hasResponseTtl]) {
    uint64_t v18 = [v25 responseTtl];
  }
  v19 = [PDSResponse alloc];
  uint64_t v20 = (int)[v25 status];
  uint64_t v21 = (void *)[v3 copy];
  v22 = [(PDSResponse *)v19 initWithStatus:v20 statusByUser:v21 ttl:v18];

  uint64_t v23 = pds_oversizedLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v22;
    _os_log_impl(&dword_221791000, v23, OS_LOG_TYPE_DEFAULT, "PDSRequestQueue: response received: %@", buf, 0xCu);
  }

  v24 = [*(id *)(a1 + 32) delegate];
  [v24 requestQueue:*(void *)(a1 + 32) processedRequest:*(void *)(a1 + 64) withResponse:v22];
}

- (BOOL)_isAuthIssue:(int64_t)a3
{
  return ((unint64_t)(a3 - 6004) < 5) & (0x13u >> (a3 - 116));
}

- (void)_reAuthAndContinueWithRequest:(id)a3 forUser:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pds_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = [(PDSRequestQueue *)self authRetries];
    _os_log_impl(&dword_221791000, v8, OS_LOG_TYPE_DEFAULT, "Attempting Reauth - Current reauth attempts: %ld", buf, 0xCu);
  }

  uint64_t v9 = [(PDSRequestQueue *)self lastReauthAttempt];

  if (v9)
  {
    v10 = [MEMORY[0x263EFF910] now];
    id v11 = [(PDSRequestQueue *)self lastReauthAttempt];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    if (v13 > 43200.0) {
      [(PDSRequestQueue *)self setAuthRetries:0];
    }
  }
  if ([(PDSRequestQueue *)self authRetries] > 2)
  {
    uint64_t v18 = pds_defaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221791000, v18, OS_LOG_TYPE_DEFAULT, "No reauth attempts remaining", buf, 2u);
    }
  }
  else
  {
    [(PDSRequestQueue *)self setAuthRetries:[(PDSRequestQueue *)self authRetries] + 1];
    [(PDSRequestQueue *)self setInflightRequest:v6];
    id v14 = [MEMORY[0x263EFF910] now];
    [(PDSRequestQueue *)self setLastReauthAttempt:v14];

    int v15 = pds_defaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221791000, v15, OS_LOG_TYPE_DEFAULT, "We have retries left, attempting reauth", buf, 2u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v16 = dispatch_time(0, 10000000000 * [(PDSRequestQueue *)self authRetries] - 10000000000);
    queue = self->_queue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke;
    v19[3] = &unk_2645C8E18;
    v19[4] = self;
    id v20 = v7;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v6;
    dispatch_after(v16, queue, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userTracker];
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_2;
  v8[3] = &unk_2645C8DF0;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v9 = *(id *)(a1 + 48);
  [v2 refreshCredentialsForUser:v3 withError:&v11 completion:v8];
  id v4 = v11;

  if (v4)
  {
    uint64_t v5 = pds_defaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_cold_1((uint64_t *)(a1 + 40), (uint64_t)v4, v5);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setInflightRequest:0];
  }
  else
  {
    id WeakRetained = pds_defaultLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl(&dword_221791000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Kicked off refresh for user %@", buf, 0xCu);
    }
  }

  objc_destroyWeak(&v10);
}

void __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_3;
    block[3] = &unk_2645C8DC8;
    block[4] = v6;
    id v9 = v4;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
}

uint64_t __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setInflightRequest:0];
  v2 = pds_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_221791000, v2, OS_LOG_TYPE_DEFAULT, "Credential refresh completed: error: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) enqueueRequest:*(void *)(a1 + 48)];
}

- (void)_cancelPendingRequests
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PDSRequestQueue *)self messageDelivery];
  int v4 = [v3 hasQueuedItems];

  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v5 = [(PDSRequestQueue *)self messageDelivery];
    uint64_t v6 = [v5 queuedMessages];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v12 = [(PDSRequestQueue *)self messageDelivery];
            [v12 cancelMessage:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_logEntries:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v19)
  {
    int v3 = 0;
    uint64_t v18 = *(void *)v22;
    int v4 = @"\n";
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        int v20 = v3;
        uint64_t v6 = v4;
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = [v7 registration];
        uint64_t v9 = [v8 qualifierString];
        uint64_t v10 = [v7 registration];
        uint64_t v11 = [v10 topicString];
        [v7 state];
        double v12 = PDSStringForEntryState();
        long long v13 = [v7 user];
        long long v14 = [v13 userID];
        int v4 = [(__CFString *)v6 stringByAppendingFormat:@"\t PDSEntry: Qual:%@ Topic:%@ State:%@ User:%@\n", v9, v11, v12, v14];

        if (v20 < 5)
        {
          int v3 = v20 + 1;
        }
        else
        {
          long long v15 = pds_oversizedLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v4;
            _os_log_impl(&dword_221791000, v15, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

          int v3 = 0;
          int v4 = @"\n";
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v19);
    if (v3 >= 1)
    {
      long long v16 = pds_oversizedLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v4;
        _os_log_impl(&dword_221791000, v16, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
    }
  }
  else
  {
    int v4 = @"\n";
  }
}

- (void)_logProtoUserPushToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = pds_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 userId];
    uint64_t v6 = [v3 pushToken];
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_221791000, v4, OS_LOG_TYPE_DEFAULT, "PDSUserPushTokenRequest: UserID:%@ PushToken:%@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_removeDeadEntriesForUser:(id)a3 withError:(id *)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_221791000, v7, OS_LOG_TYPE_DEFAULT, "Removing all entries with state [remove] for user: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = [(PDSRequestQueue *)self entryStoreBlock];
  __int16 v9 = v8[2]();

  if (v9)
  {
    [v9 deleteEntriesForUser:v6 withState:2 withError:a4];
  }
  else
  {
    uint64_t v10 = pds_defaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_221791000, v10, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", (uint8_t *)&v11, 2u);
    }
  }
}

- (PDSRequestQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDSRequestQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)messageTimeout
{
  return self->_messageTimeout;
}

- (void)setMessageTimeout:(int64_t)a3
{
  self->_messageTimeout = a3;
}

- (PDSRequest)inflightRequest
{
  return self->_inflightRequest;
}

- (void)setInflightRequest:(id)a3
{
}

- (PDSRequest)queuedRequest
{
  return self->_queuedRequest;
}

- (void)setQueuedRequest:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (PDSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
}

- (id)pushTokenBlock
{
  return self->_pushTokenBlock;
}

- (void)setPushTokenBlock:(id)a3
{
}

- (id)entryStoreBlock
{
  return self->_entryStoreBlock;
}

- (void)setEntryStoreBlock:(id)a3
{
}

- (int64_t)authRetries
{
  return self->_authRetries;
}

- (void)setAuthRetries:(int64_t)a3
{
  self->_authRetries = a3;
}

- (NSDate)lastReauthAttempt
{
  return self->_lastReauthAttempt;
}

- (void)setLastReauthAttempt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReauthAttempt, 0);
  objc_storeStrong(&self->_entryStoreBlock, 0);
  objc_storeStrong(&self->_pushTokenBlock, 0);
  objc_storeStrong((id *)&self->_userTracker, 0);
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuedRequest, 0);
  objc_storeStrong((id *)&self->_inflightRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_221791000, log, OS_LOG_TYPE_ERROR, "Credential refresh failed for user: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end