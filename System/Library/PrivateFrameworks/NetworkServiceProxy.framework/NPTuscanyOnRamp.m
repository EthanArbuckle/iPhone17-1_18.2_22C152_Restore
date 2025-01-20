@interface NPTuscanyOnRamp
+ (BOOL)supportsSecureCoding;
- (BOOL)dayPassFailed;
- (BOOL)dayPassPending;
- (BOOL)dayPassRefreshAllowed;
- (BOOL)fillTestDaypass;
- (BOOL)isDayPassExpired;
- (BOOL)isDayPassPastExpiry:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTFOEnabled;
- (BOOL)registerAgentWithKey:(id)a3;
- (NPTunnelTuscanyEndpoint)tuscanyEndpoint;
- (NPTuscanyOnRamp)initWithCoder:(id)a3;
- (NPTuscanyOnRamp)initWithEndpoint:(id)a3;
- (NPTuscanyOnRamp)initWithKey:(id)a3;
- (NPWaldo)parentWaldo;
- (NSData)dayPass;
- (NSDate)dayPassCreationDate;
- (NSDate)retryDate;
- (NSDictionary)descriptionDictionary;
- (NSPKeyNetworkAgent)agent;
- (NSString)shortDescription;
- (NSURLSession)dayPassSession;
- (NSUUID)dayPassUUID;
- (NWEndpoint)daypassEndpoint;
- (NWNetworkAgentRegistration)agentRegistration;
- (double)dayPassHardExpiry;
- (id)description;
- (id)getTuscanyEndpoint:(id)a3;
- (int)error;
- (int64_t)TFOStatus;
- (int64_t)currentEdgeType;
- (unint64_t)hash;
- (unint64_t)maxFrameSize;
- (unint64_t)rtt;
- (unsigned)copyValue:(void *)a3 ofSize:(unsigned int)a4 fromOffset:(unsigned int)a5 base:(const char *)a6 totalLength:(unsigned int)a7;
- (unsigned)dayPassSessionCounter;
- (unsigned)getNextSessionCounter;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateDayPass;
- (void)refreshDayPassWithWaldoDelegate:(id)a3 softExpiry:(double)a4 retryInterval:(double)a5 edge:(id)a6 completionHandler:(id)a7;
- (void)resetParentWaldo:(id)a3;
- (void)setAgent:(id)a3;
- (void)setAgentRegistration:(id)a3;
- (void)setDayPass:(id)a3;
- (void)setDayPassCreationDate:(id)a3;
- (void)setDayPassFailed:(BOOL)a3;
- (void)setDayPassHardExpiry:(double)a3;
- (void)setDayPassPending:(BOOL)a3;
- (void)setDayPassSession:(id)a3;
- (void)setDayPassSessionCounter:(unsigned int)a3;
- (void)setDayPassUUID:(id)a3;
- (void)setError:(int)a3;
- (void)setParentWaldo:(id)a3;
- (void)setRetryDate:(id)a3;
- (void)setTFOStatus:(int64_t)a3;
- (void)setTuscanyEndpoint:(id)a3;
- (void)unregisterAgent;
- (void)updateSessionCounterFromKernel;
@end

@implementation NPTuscanyOnRamp

- (NPTuscanyOnRamp)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v6 = [(NPTuscanyOnRamp *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_daypassEndpoint, a3);
  }

  return v7;
}

- (BOOL)registerAgentWithKey:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NPTuscanyOnRamp *)self isDayPassExpired]) {
    goto LABEL_29;
  }
  id v5 = [(NPTuscanyOnRamp *)self agent];
  v6 = [v5 agentUUID];
  v7 = [(NPTuscanyOnRamp *)self dayPassUUID];
  if ([v6 isEqual:v7])
  {
    v8 = [(NPTuscanyOnRamp *)self agentRegistration];
    char v9 = [v8 isRegistered];

    if (v9) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  v10 = objc_alloc_init(NSPKeyNetworkAgent);
  [(NPTuscanyOnRamp *)self setAgent:v10];

  v11 = [(NPTuscanyOnRamp *)self dayPassUUID];
  v12 = [(NPTuscanyOnRamp *)self agent];
  [v12 setAgentUUID:v11];

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__4;
  v70 = __Block_byref_object_dispose__4;
  id v71 = 0;
  v13 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke;
  v65[3] = &unk_1E5A3BC58;
  v65[4] = self;
  v65[5] = &v66;
  [v13 iterateFileHandlesWithBlock:v65];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F38C00]) initWithNetworkAgentClass:objc_opt_class()];
  [(NPTuscanyOnRamp *)self setAgentRegistration:v14];

  uint64_t v15 = v67[5];
  BOOL v16 = v15 == 0;
  v17 = nplog_obj();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v18)
    {
      v33 = [(NPTuscanyOnRamp *)self parentWaldo];
      v34 = [v33 identifier];
      v35 = [(NPTuscanyOnRamp *)self agent];
      v36 = [v35 agentUUID];
      *(_DWORD *)buf = 138412546;
      v73 = v34;
      __int16 v74 = 2112;
      v75 = v36;
      _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEFAULT, "%@: Setting up new key network agent registration for %@", buf, 0x16u);
    }
    v37 = [(NPTuscanyOnRamp *)self agentRegistration];
    v38 = [(NPTuscanyOnRamp *)self agent];
    LODWORD(v24) = [v37 registerNetworkAgent:v38];

    v39 = nplog_obj();
    v29 = v39;
    if (v24)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = [(NPTuscanyOnRamp *)self parentWaldo];
        v41 = [v40 identifier];
        v42 = [(NPTuscanyOnRamp *)self agent];
        v43 = [v42 agentUUID];
        *(_DWORD *)buf = 138412546;
        v73 = v41;
        __int16 v74 = 2112;
        v75 = v43;
        _os_log_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_INFO, "%@: Registered key agent with UUID %@", buf, 0x16u);
      }
      unsigned int v44 = objc_msgSend(v4, "session_counter");
      v45 = [(NPTuscanyOnRamp *)self agentRegistration];
      [v45 setUseCount:v44];

      id v46 = objc_alloc(MEMORY[0x1E4F38D00]);
      v47 = [(NPTuscanyOnRamp *)self agentRegistration];
      v48 = [(NPTuscanyOnRamp *)self parentWaldo];
      v49 = [v48 configurationIdentifier];
      v50 = [(NPTuscanyOnRamp *)self agent];
      v51 = [v50 agentUUID];
      v29 = [v46 initWithNetworkAgentRegistration:v47 sessionType:&unk_1EF43BD90 configurationIdentifier:v49 agentUUID:v51];

      uint64_t v24 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke_59;
      v64[3] = &unk_1E5A3BC80;
      v64[4] = self;
      [(id)v24 setFileHandle:v29 matchingPredicate:v64];
      [(id)v24 commit];
    }
    else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [(NPTuscanyOnRamp *)self parentWaldo];
      v61 = [(id)v24 identifier];
      v62 = [(NPTuscanyOnRamp *)self agent];
      v63 = [v62 agentUUID];
      *(_DWORD *)buf = 138412546;
      v73 = v61;
      __int16 v74 = 2112;
      v75 = v63;
      _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "%@: Failed to register key agent with UUID %@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (v18)
  {
    v19 = [(NPTuscanyOnRamp *)self parentWaldo];
    v20 = [v19 identifier];
    v21 = [(NPTuscanyOnRamp *)self agent];
    v22 = [v21 agentUUID];
    *(_DWORD *)buf = 138412546;
    v73 = v20;
    __int16 v74 = 2112;
    v75 = v22;
    _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEFAULT, "%@: Re-using existing key network agent registration file handle for %@", buf, 0x16u);
  }
  v23 = [(id)v67[5] handle];
  uint64_t v24 = dup([v23 fileDescriptor]);

  if ((v24 & 0x80000000) != 0)
  {
    v29 = nplog_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v53 = [(NPTuscanyOnRamp *)self parentWaldo];
      v54 = [v53 identifier];
      v55 = __error();
      v56 = strerror(*v55);
      *(_DWORD *)buf = 138412546;
      v73 = v54;
      __int16 v74 = 2080;
      v75 = v56;
      _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "%@: Failed to dup the key network agent registration file descriptor: %s", buf, 0x16u);
    }
    LOBYTE(v24) = 0;
    goto LABEL_27;
  }
  v25 = [(NPTuscanyOnRamp *)self agentRegistration];
  v26 = [(NPTuscanyOnRamp *)self agent];
  int v27 = [v25 setRegisteredNetworkAgent:v26 fileDescriptor:v24];

  v28 = nplog_obj();
  v29 = v28;
  if (v27)
  {
    LOBYTE(v24) = 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [(NPTuscanyOnRamp *)self parentWaldo];
      v30 = [(id)v24 identifier];
      v31 = [(NPTuscanyOnRamp *)self agent];
      v32 = [v31 agentUUID];
      *(_DWORD *)buf = 138412546;
      v73 = v30;
      __int16 v74 = 2112;
      v75 = v32;
      _os_log_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_INFO, "%@: Registered key agent with UUID %@", buf, 0x16u);

      LOBYTE(v24) = 1;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v57 = [(NPTuscanyOnRamp *)self parentWaldo];
    v58 = [v57 identifier];
    v59 = [(NPTuscanyOnRamp *)self agent];
    v60 = [v59 agentUUID];
    *(_DWORD *)buf = 138412546;
    v73 = v58;
    __int16 v74 = 2112;
    v75 = v60;
    _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "%@: Failed to register key agent with UUID %@", buf, 0x16u);
  }
  close(v24);
  BOOL v16 = 1;
LABEL_28:
  _Block_object_dispose(&v66, 8);

  if (v16) {
LABEL_29:
  }
    LOBYTE(v24) = 1;

  return v24 & 1;
}

uint64_t __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v4 = [v3 sessionType];
  int v5 = [v4 isEqual:&unk_1EF43BD90];
  if (v5)
  {
    v6 = [v3 agentUUID];
    v7 = [*(id *)(a1 + 32) agent];
    v8 = [v7 agentUUID];
    int v9 = [v6 isEqual:v8];

    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = v3;
      id v4 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v11;
      goto LABEL_5;
    }
LABEL_6:
    uint64_t v12 = 1;
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v12 = v5 ^ 1u;

LABEL_7:
  return v12;
}

uint64_t __40__NPTuscanyOnRamp_registerAgentWithKey___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 sessionType];
    if ([v4 isEqual:&unk_1EF43BD90])
    {
      int v5 = [v3 agentUUID];
      v6 = [*(id *)(a1 + 32) agent];
      v7 = [v6 agentUUID];
      uint64_t v8 = [v5 isEqual:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)unregisterAgent
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NPTuscanyOnRamp *)self updateSessionCounterFromKernel];
  id v3 = [(NPTuscanyOnRamp *)self agentRegistration];
  int v4 = [v3 isRegistered];

  if (v4)
  {
    int v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(NPTuscanyOnRamp *)self parentWaldo];
      v7 = [v6 identifier];
      uint64_t v8 = [(NPTuscanyOnRamp *)self agent];
      int v9 = [v8 agentUUID];
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "%@: Un-registering key agent with UUID %@", buf, 0x16u);
    }
    uint64_t v10 = [(NPTuscanyOnRamp *)self agentRegistration];
    [v10 unregisterNetworkAgent];

    id v11 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__NPTuscanyOnRamp_unregisterAgent__block_invoke;
    v13[3] = &unk_1E5A3BC80;
    v13[4] = self;
    [v11 removeFileHandleMatchingPredicate:v13];

    uint64_t v12 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    [v12 commit];
  }
  [(NPTuscanyOnRamp *)self setAgent:0];
  [(NPTuscanyOnRamp *)self setAgentRegistration:0];
}

uint64_t __34__NPTuscanyOnRamp_unregisterAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 sessionType];
    if ([v4 isEqual:&unk_1EF43BD90])
    {
      int v5 = [v3 agentUUID];
      v6 = [*(id *)(a1 + 32) agent];
      v7 = [v6 agentUUID];
      uint64_t v8 = [v5 isEqual:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)updateSessionCounterFromKernel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(NPTuscanyOnRamp *)self agentRegistration];
  int v4 = [v3 isRegistered];

  if (v4)
  {
    int v5 = [(NPTuscanyOnRamp *)self agentRegistration];
    uint64_t v6 = [v5 useCount];

    v7 = nplog_obj();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = [(NPTuscanyOnRamp *)self parentWaldo];
        uint64_t v10 = [v9 identifier];
        id v11 = [(NPTuscanyOnRamp *)self dayPassUUID];
        int v15 = 138412802;
        __int16 v16 = v10;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        __int16 v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_INFO, "%@: Got session counter %llu for day pass %@ from the kernel", (uint8_t *)&v15, 0x20u);
      }
      [(NPTuscanyOnRamp *)self setDayPassSessionCounter:v6];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [(NPTuscanyOnRamp *)self parentWaldo];
        v13 = [v12 identifier];
        v14 = [(NPTuscanyOnRamp *)self dayPassUUID];
        int v15 = 138412546;
        __int16 v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = (uint64_t)v14;
        _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, "%@: Got session counter 0 for day pass %@ from the kernel", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (id)getTuscanyEndpoint:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v5 = [(NPTuscanyOnRamp *)self tuscanyEndpoint];
  uint64_t v6 = [v5 hosts];

  v7 = (NPTunnelTuscanyEndpoint *)[v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (!v7)
  {
LABEL_14:

    goto LABEL_16;
  }
  uint64_t v8 = *(void *)v17;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v17 != v8) {
      objc_enumerationMutation(v6);
    }
    uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v11 = v10;
    uint64_t v12 = [v11 addressFamily];
    if (v12 == [v4 unsignedIntegerValue]) {
      break;
    }

LABEL_9:
    if (v7 == (NPTunnelTuscanyEndpoint *)++v9)
    {
      v7 = (NPTunnelTuscanyEndpoint *)[v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v7) {
        goto LABEL_3;
      }
      goto LABEL_14;
    }
  }

  if (v11)
  {
    v13 = [NPTunnelTuscanyEndpoint alloc];
    id v20 = v11;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v7 = [(NPTunnelTuscanyEndpoint *)v13 initWithHosts:v14];

    uint64_t v6 = v11;
    goto LABEL_14;
  }
  v7 = 0;
LABEL_16:

  return v7;
}

- (unsigned)copyValue:(void *)a3 ofSize:(unsigned int)a4 fromOffset:(unsigned int)a5 base:(const char *)a6 totalLength:(unsigned int)a7
{
  if (a5 + a4 > a7) {
    return 0;
  }
  unsigned int v7 = a4;
  memcpy(a3, &a6[a5], a4);
  return v7;
}

- (NPTuscanyOnRamp)initWithKey:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NPTuscanyOnRamp;
  int v5 = [(NPTuscanyOnRamp *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 info];
    double v43 = 0.0;
    uint64_t v44 = 0;
    int64_t v41 = 0;
    double v42 = 0.0;
    if ([v6 length])
    {
      id v7 = v6;
      unsigned int v8 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", (char *)&v44 + 4, 4, 0, [v7 bytes], objc_msgSend(v7, "length"));
      if (v8)
      {
        unsigned int v9 = v8;
        unsigned int v10 = HIDWORD(v44) + v8;
        if (v10 <= [v7 length])
        {
          id v13 = v7;
          uint64_t v14 = [v13 bytes] + v9;
          id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          long long v16 = (void *)[v15 initWithBytes:v14 length:HIDWORD(v44)];
          [(NPTuscanyOnRamp *)v5 setDayPass:v16];

          uint64_t v17 = HIDWORD(v44) + v9;
          id v18 = v13;
          unsigned int v19 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v44, 4, v17, [v18 bytes], objc_msgSend(v18, "length"));
          if (v19)
          {
            v5->_maxFrameSize = v44;
            uint64_t v20 = v19 + v17;
            id v21 = v18;
            unsigned int v22 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v41, 8, v20, [v21 bytes], objc_msgSend(v21, "length"));
            if (v22)
            {
              v5->_TFOStatus = v41;
              uint64_t v23 = v22 + v20;
              id v24 = v21;
              unsigned int v25 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v43, 8, v23, [v24 bytes], objc_msgSend(v24, "length"));
              if (v25)
              {
                unsigned int v26 = v25;
                id v27 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                uint64_t v28 = [v27 initWithTimeIntervalSince1970:v43];
                dayPassCreationDate = v5->_dayPassCreationDate;
                v5->_dayPassCreationDate = (NSDate *)v28;

                uint64_t v30 = v26 + v23;
                id v31 = v24;
                unsigned int v32 = -[NPTuscanyOnRamp copyValue:ofSize:fromOffset:base:totalLength:](v5, "copyValue:ofSize:fromOffset:base:totalLength:", &v42, 8, v30, [v31 bytes], objc_msgSend(v31, "length"));
                if (v32)
                {
                  v5->_dayPassHardExpiry = v42;
                  unsigned int v33 = v32 + v30;
                  int v34 = [v31 length];
                  if (v34 != v33)
                  {
                    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", objc_msgSend(v31, "bytes") + v33, v34 - v33);
                    v36 = [[NPTunnelTuscanyEndpoint alloc] initWithEncodedData:v11];
                    [(NPTuscanyOnRamp *)v5 setTuscanyEndpoint:v36];

                    v37 = [(NPTuscanyOnRamp *)v5 tuscanyEndpoint];

                    if (v37)
                    {
                      v38 = [v4 uuid];
                      [(NPTuscanyOnRamp *)v5 setDayPassUUID:v38];

                      v5->_error = [v4 error];
                    }
                    else
                    {
                      v39 = nplog_obj();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)v40 = 0;
                        _os_log_error_impl(&dword_1A0FEE000, v39, OS_LOG_TYPE_ERROR, "Failed to create a tuscany endpoint from endpoint data from key", v40, 2u);
                      }
                    }
                    goto LABEL_27;
                  }
                  id v11 = nplog_obj();
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v40 = 0;
                    uint64_t v12 = "No endpoint data in key";
                    goto LABEL_26;
                  }
                }
                else
                {
                  id v11 = nplog_obj();
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v40 = 0;
                    uint64_t v12 = "Failed to get the hard expiry from the key info";
                    goto LABEL_26;
                  }
                }
              }
              else
              {
                id v11 = nplog_obj();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v40 = 0;
                  uint64_t v12 = "Failed to get the creation date from the key info";
                  goto LABEL_26;
                }
              }
            }
            else
            {
              id v11 = nplog_obj();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v40 = 0;
                uint64_t v12 = "Failed to get the tfostatus from the key info";
                goto LABEL_26;
              }
            }
          }
          else
          {
            id v11 = nplog_obj();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v40 = 0;
              uint64_t v12 = "Failed to get the max frame size from the key info";
              goto LABEL_26;
            }
          }
        }
        else
        {
          id v11 = nplog_obj();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v40 = 0;
            uint64_t v12 = "Failed to get the day pass bytes from the key info";
LABEL_26:
            _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, v12, v40, 2u);
          }
        }
      }
      else
      {
        id v11 = nplog_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v40 = 0;
          uint64_t v12 = "Failed to get the day pass length from the key info";
          goto LABEL_26;
        }
      }
    }
    else
    {
      id v11 = nplog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v40 = 0;
        uint64_t v12 = "No info in key";
        goto LABEL_26;
      }
    }
LABEL_27:
  }
  return v5;
}

- (unsigned)getNextSessionCounter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  id v3 = objc_alloc_init(NSPKeyNetworkAgent);
  id v4 = [(NPTuscanyOnRamp *)self dayPassUUID];
  [(NSPNetworkAgent *)v3 setAgentUUID:v4];

  if (([MEMORY[0x1E4F38C00] useNetworkAgent:v3 returnUseCount:&v9] & 1) == 0)
  {
    [(NPTuscanyOnRamp *)self setError:35];
    +[NPDiagnosticReport logInternalError:@"FailedToGetSessionCounter" context:0];
  }
  int v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v8 = [(NPTuscanyOnRamp *)self dayPassUUID];
    *(_DWORD *)buf = 138412546;
    id v11 = v8;
    __int16 v12 = 1024;
    int v13 = v9;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "%@: Using session counter %u", buf, 0x12u);
  }
  unsigned int v6 = v9;

  return v6;
}

- (void)resetParentWaldo:(id)a3
{
  id v6 = a3;
  id v4 = [(NPTuscanyOnRamp *)self dayPassSession];

  if (v4)
  {
    int v5 = [(NPTuscanyOnRamp *)self dayPassSession];
    [v5 invalidateAndCancel];

    [(NPTuscanyOnRamp *)self setDayPassSession:0];
  }
  [(NPTuscanyOnRamp *)self setParentWaldo:v6];
}

- (BOOL)dayPassRefreshAllowed
{
  id v3 = [(NPTuscanyOnRamp *)self retryDate];
  if (v3)
  {
    id v4 = [(NPTuscanyOnRamp *)self retryDate];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 < 0.0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)fillTestDaypass
{
  id v3 = +[NSPManager sharedManager];
  int v4 = [v3 useTestDaypass];

  if (v4)
  {
    self->_maxFrameSize = 1000;
    self->_rtt = 1;
    self->_dayPassHardExpiry = 8000.0;
    double v5 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    dayPassCreationDate = self->_dayPassCreationDate;
    self->_dayPassCreationDate = v5;

    id v7 = tuscanyClientCreateFakeDayPass();
    [(NPTuscanyOnRamp *)self setDayPass:v7];

    unsigned int v8 = [MEMORY[0x1E4F29128] UUID];
    [(NPTuscanyOnRamp *)self setDayPassUUID:v8];

    uint64_t v9 = +[NPUtilities parseXHost:@"1.1.1.1@5223,11:11:11:11:11:11:11:11@5223"];
    if ([v9 count])
    {
      unsigned int v10 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v9];
      tuscanyEndpoint = self->_tuscanyEndpoint;
      self->_tuscanyEndpoint = v10;
    }
    else
    {
      tuscanyEndpoint = self->_tuscanyEndpoint;
      self->_tuscanyEndpoint = 0;
    }
  }
  return v4;
}

- (void)refreshDayPassWithWaldoDelegate:(id)a3 softExpiry:(double)a4 retryInterval:(double)a5 edge:(id)a6 completionHandler:(id)a7
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v73 = a6;
  __int16 v12 = (void (**)(id, uint64_t, uint64_t, void))a7;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  char v80 = 0;
  int v13 = [(NPTuscanyOnRamp *)self parentWaldo];
  [(NPTuscanyOnRamp *)self setRetryDate:0];
  uint64_t v14 = [(NPTuscanyOnRamp *)self dayPassCreationDate];
  LOBYTE(a7) = v14 == 0;

  if (a7)
  {
    id v71 = 0;
  }
  else
  {
    id v15 = [(NPTuscanyOnRamp *)self dayPassCreationDate];
    id v71 = [v15 dateByAddingTimeInterval:a4];
  }
  long long v16 = [(NPTuscanyOnRamp *)self dayPassSession];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    id v18 = objc_alloc_init(NSURLSessionDelegate);
    unsigned int v19 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    uint64_t v20 = [(NPTuscanyOnRamp *)self parentWaldo];
    id v21 = [v20 dayPassRequestTimeout];
    [v21 doubleValue];
    BOOL v23 = v22 > 0.0;

    if (v23)
    {
      id v24 = [(NPTuscanyOnRamp *)self parentWaldo];
      unsigned int v25 = [v24 dayPassRequestTimeout];
      [v25 doubleValue];
      objc_msgSend(v19, "setTimeoutIntervalForResource:");
    }
    else
    {
      [v19 setTimeoutIntervalForResource:30.0];
    }
    unsigned int v26 = [(NPTuscanyOnRamp *)self parentWaldo];
    id v27 = [v26 dayPassEnableSessionTicket];
    objc_msgSend(v19, "set_allowsTLSSessionTickets:", objc_msgSend(v27, "BOOLValue"));

    uint64_t v28 = [(NPTuscanyOnRamp *)self parentWaldo];
    v29 = [v28 dayPassExtendedValidation];
    -[NSURLSessionDelegate setEnableExtendedValidation:](v18, "setEnableExtendedValidation:", [v29 BOOLValue]);

    uint64_t v30 = [(NPTuscanyOnRamp *)self parentWaldo];
    id v31 = [v30 dayPassLeafOID];
    [(NSURLSessionDelegate *)v18 setLeafOID:v31];

    unsigned int v32 = [(NPTuscanyOnRamp *)self parentWaldo];
    unsigned int v33 = [v32 dayPassRevocationFailClosed];
    -[NSURLSessionDelegate setRevocationFailClosed:](v18, "setRevocationFailClosed:", [v33 BOOLValue]);

    int v34 = [(NPTuscanyOnRamp *)self parentWaldo];
    v35 = [v34 dayPassHostnamePrependLabel];
    LODWORD(v33) = [v35 BOOLValue];

    if (v33)
    {
      id v36 = [NSString alloc];
      v37 = [v73 label];
      v38 = [(NPTuscanyOnRamp *)self parentWaldo];
      v39 = [v38 dayPassHostname];
      v40 = (void *)[v36 initWithFormat:@"%@-%@", v37, v39];
      [(NSURLSessionDelegate *)v18 setValidationHostname:v40];
    }
    else
    {
      v37 = [(NPTuscanyOnRamp *)self parentWaldo];
      v38 = [v37 dayPassHostname];
      [(NSURLSessionDelegate *)v18 setValidationHostname:v38];
    }

    int64_t v41 = nplog_obj();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      double v42 = [(NSURLSessionDelegate *)v18 validationHostname];
      *(_DWORD *)buf = 138412290;
      v82 = v42;
      _os_log_impl(&dword_1A0FEE000, v41, OS_LOG_TYPE_DEFAULT, "Setting SNI to %@", buf, 0xCu);
    }
    uint64_t v87 = *MEMORY[0x1E4F19110];
    uint64_t v85 = *MEMORY[0x1E4F19138];
    double v43 = [(NSURLSessionDelegate *)v18 validationHostname];
    v86 = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    v88[0] = v44;
    objc_super v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:&v87 count:1];

    id v46 = nplog_obj();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v45;
      _os_log_impl(&dword_1A0FEE000, v46, OS_LOG_TYPE_DEFAULT, "Setting stream properties to %@", buf, 0xCu);
    }

    objc_msgSend(v19, "set_socketStreamProperties:", v45);
    objc_msgSend(v19, "set_allowsTCPFastOpen:", 1);
    v47 = (void *)MEMORY[0x1E4F290E0];
    v48 = [MEMORY[0x1E4F28F08] mainQueue];
    v49 = [v47 sessionWithConfiguration:v19 delegate:v18 delegateQueue:v48];
    [(NPTuscanyOnRamp *)self setDayPassSession:v49];

    id v50 = [NSString alloc];
    v51 = [(NPTuscanyOnRamp *)self parentWaldo];
    v52 = [v51 identifier];
    v53 = (void *)[v50 initWithFormat:@"%@ TrustEstablishment", v52];
    v54 = [(NPTuscanyOnRamp *)self dayPassSession];
    [v54 setSessionDescription:v53];
  }
  v55 = [(NPTuscanyOnRamp *)self daypassEndpoint];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  v56 = [v55 hostname];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v57 = v55;
    if ([v57 addressFamily] == 30)
    {
      v58 = NSString;
      v59 = [v57 hostname];
      uint64_t v60 = [v58 stringWithFormat:@"[%@]", v59];

      v56 = (void *)v60;
    }
  }
  if (v56)
  {
    v61 = (void *)MEMORY[0x1E4F1CB10];
    v62 = NSString;
    v63 = [v13 dayPassPort];
    if (v63) {
      [v13 dayPassPort];
    }
    else {
    v65 = [v55 port];
    }
    uint64_t v66 = [v62 stringWithFormat:@"https://%@:%@/tuscany/daypass/2", v56, v65];
    v67 = [v61 URLWithString:v66];

    if ([(NPTuscanyOnRamp *)self fillTestDaypass])
    {
      v12[2](v12, 1, 1, 0);
    }
    else
    {
      uint64_t v68 = [(NPTuscanyOnRamp *)self dayPassSession];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke;
      v78[3] = &unk_1E5A3C048;
      v78[4] = self;
      v78[5] = v79;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke_2;
      v74[3] = &unk_1E5A3C070;
      v74[4] = self;
      double v77 = a5;
      v75 = v12;
      uint64_t v76 = v79;
      [v72 waldo:v13 fetchDayPassForURL:v67 ifExpired:v71 session:v68 dataHandler:v78 completionHandler:v74];
    }
  }
  else
  {
LABEL_24:
    v64 = nplog_obj();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v69 = [v13 identifier];
      v70 = [(NPTuscanyOnRamp *)self daypassEndpoint];
      *(_DWORD *)buf = 138412546;
      v82 = v69;
      __int16 v83 = 2112;
      v84 = v70;
      _os_log_error_impl(&dword_1A0FEE000, v64, OS_LOG_TYPE_ERROR, "%@: Failed to get a hostname from the day pass endpoint %@", buf, 0x16u);
    }
    v12[2](v12, 0, 0, 0);
  }

  _Block_object_dispose(v79, 8);
}

void __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v6)
  {
    if ([v6 length])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v5;
        uint64_t v9 = [v8 allHeaderFields];
        unsigned int v10 = [v9 objectForKeyedSubscript:@"X-Timeout"];
        id v11 = +[NPUtilities stripWhitespace:v10];

        __int16 v12 = [v8 allHeaderFields];
        int v13 = [v12 objectForKeyedSubscript:@"X-MaxFrame"];
        uint64_t v14 = +[NPUtilities stripWhitespace:v13];

        id v15 = [v8 allHeaderFields];
        long long v16 = [v15 objectForKeyedSubscript:@"X-Host"];
        BOOL v17 = +[NPUtilities stripWhitespace:v16];

        uint64_t v30 = v8;
        id v18 = [v8 allHeaderFields];
        unsigned int v19 = [v18 objectForKeyedSubscript:@"X-RTT"];
        uint64_t v20 = +[NPUtilities stripWhitespace:v19];

        uint64_t v31 = 0;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          *(void *)(*(void *)(a1 + 32) + 40) = [v14 integerValue];
        }
        *(void *)(*(void *)(a1 + 32) + 56) = +[NPUtilities parseXRTT:v20];
        +[NPUtilities parseXTimeout:v11 hardTTLInSeconds:&v31];
        *(void *)(*(void *)(a1 + 32) + 96) = v31;
        id v21 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
        uint64_t v22 = *(void *)(a1 + 32);
        BOOL v23 = *(void **)(v22 + 72);
        *(void *)(v22 + 72) = v21;

        id v24 = +[NPUtilities parseXHost:v17];
        if ([v24 count])
        {
          unsigned int v25 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v24];
          uint64_t v26 = *(void *)(a1 + 32);
          id v27 = *(void **)(v26 + 16);
          *(void *)(v26 + 16) = v25;
        }
        else
        {
          uint64_t v28 = *(void *)(a1 + 32);
          id v27 = *(void **)(v28 + 16);
          *(void *)(v28 + 16) = 0;
        }

        if ([v7 length] == 96)
        {
          [*(id *)(a1 + 32) setDayPass:v7];
          v29 = [MEMORY[0x1E4F29128] UUID];
          [*(id *)(a1 + 32) setDayPassUUID:v29];

          [*(id *)(a1 + 32) setAgentRegistration:0];
          [*(id *)(a1 + 32) setAgent:0];
        }
      }
    }
  }
}

void __99__NPTuscanyOnRamp_refreshDayPassWithWaldoDelegate_softExpiry_retryInterval_edge_completionHandler___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) isDayPassExpired] & 1) != 0
    || ([*(id *)(a1 + 32) tuscanyEndpoint],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    [*(id *)(a1 + 32) invalidateDayPass];
  }
  if (v7)
  {
    if ((a3 & 1) == 0)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:*(double *)(a1 + 56)];
      [*(id *)(a1 + 32) setRetryDate:v6];
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = [v7 code];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTuscanyOnRamp)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPTuscanyOnRamp;
  id v5 = [(NPTuscanyOnRamp *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayPassEndpoint"];
    daypassEndpoint = v5->_daypassEndpoint;
    v5->_daypassEndpoint = (NWEndpoint *)v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Endpoint"];
    if (v8)
    {
      uint64_t v9 = [[NPTunnelTuscanyEndpoint alloc] initWithEncodedData:v8];
      tuscanyEndpoint = v5->_tuscanyEndpoint;
      v5->_tuscanyEndpoint = v9;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayPassData"];
    dayPass = v5->_dayPass;
    v5->_dayPass = (NSData *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayPassUUID"];
    dayPassUUID = v5->_dayPassUUID;
    v5->_dayPassUUID = (NSUUID *)v13;

    [v4 decodeDoubleForKey:@"DayPassHardExpiry"];
    v5->_dayPassHardExpiry = v15;
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayPassCreationDate"];
    dayPassCreationDate = v5->_dayPassCreationDate;
    v5->_dayPassCreationDate = (NSDate *)v16;

    v5->_maxFrameSize = [v4 decodeInt64ForKey:@"CurrentOnRampMaxFrameBytes"];
    v5->_rtt = [v4 decodeInt64ForKey:@"CurrentOnRampRTT"];
    v5->_dayPassFailed = [v4 decodeBoolForKey:@"DayPassFailed"];
    v5->_error = [v4 decodeInt32ForKey:@"DayPassError"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(NPTuscanyOnRamp *)self daypassEndpoint];
  [v10 encodeObject:v4 forKey:@"DayPassEndpoint"];

  id v5 = [(NPTuscanyOnRamp *)self tuscanyEndpoint];
  uint64_t v6 = [v5 encodedData];
  [v10 encodeObject:v6 forKey:@"Endpoint"];

  id v7 = [(NPTuscanyOnRamp *)self dayPass];
  [v10 encodeObject:v7 forKey:@"DayPassData"];

  id v8 = [(NPTuscanyOnRamp *)self dayPassUUID];
  [v10 encodeObject:v8 forKey:@"DayPassUUID"];

  [(NPTuscanyOnRamp *)self dayPassHardExpiry];
  objc_msgSend(v10, "encodeDouble:forKey:", @"DayPassHardExpiry");
  uint64_t v9 = [(NPTuscanyOnRamp *)self dayPassCreationDate];
  [v10 encodeObject:v9 forKey:@"DayPassCreationDate"];

  objc_msgSend(v10, "encodeInt64:forKey:", -[NPTuscanyOnRamp maxFrameSize](self, "maxFrameSize"), @"CurrentOnRampMaxFrameBytes");
  objc_msgSend(v10, "encodeInt64:forKey:", -[NPTuscanyOnRamp rtt](self, "rtt"), @"CurrentOnRampRTT");
  objc_msgSend(v10, "encodeBool:forKey:", -[NPTuscanyOnRamp dayPassFailed](self, "dayPassFailed"), @"DayPassFailed");
  objc_msgSend(v10, "encodeInt32:forKey:", -[NPTuscanyOnRamp error](self, "error"), @"DayPassError");
}

- (BOOL)isDayPassPastExpiry:(double)a3
{
  uint64_t v5 = [(NPTuscanyOnRamp *)self dayPass];
  if (!v5) {
    return 1;
  }
  uint64_t v6 = (void *)v5;
  id v7 = [(NPTuscanyOnRamp *)self dayPassCreationDate];

  if (!v7) {
    return 1;
  }
  id v8 = [(NPTuscanyOnRamp *)self dayPassCreationDate];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  return fabs(v10) >= a3;
}

- (BOOL)isDayPassExpired
{
  [(NPTuscanyOnRamp *)self dayPassHardExpiry];
  return -[NPTuscanyOnRamp isDayPassPastExpiry:](self, "isDayPassPastExpiry:");
}

- (id)description
{
  id v3 = [(NPTuscanyOnRamp *)self dayPassCreationDate];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v5 = [(NPTuscanyOnRamp *)self dayPassCreationDate];
    uint64_t v6 = [v4 localizedStringFromDate:v5 dateStyle:1 timeStyle:2];

    id v7 = [NSString alloc];
    id v8 = [(NPTuscanyOnRamp *)self daypassEndpoint];
    double v9 = [v8 description];
    double v10 = +[NPUtilities stripWhitespace:v9];
    uint64_t v11 = [(NPTuscanyOnRamp *)self tuscanyEndpoint];
    unint64_t v12 = [(NPTuscanyOnRamp *)self maxFrameSize];
    unint64_t v13 = [(NPTuscanyOnRamp *)self rtt];
    uint64_t v14 = [(NPTuscanyOnRamp *)self dayPassUUID];
    [(NPTuscanyOnRamp *)self dayPassHardExpiry];
    uint64_t v16 = (void *)[v7 initWithFormat:@"[%@ tuscany: %@ maxframe: %lu rtt: %lu %@ creation: %@ hard: %f tfoStatus: %ld]", v10, v11, v12, v13, v14, v6, v15, -[NPTuscanyOnRamp TFOStatus](self, "TFOStatus")];
  }
  else
  {
    uint64_t v16 = [(NPTuscanyOnRamp *)self shortDescription];
    uint64_t v6 = &stru_1EF4275C8;
  }

  return v16;
}

- (NSString)shortDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = [(NPTuscanyOnRamp *)self daypassEndpoint];
  uint64_t v5 = (void *)[v3 initWithFormat:@"[%@]", v4];

  if ([(NPTuscanyOnRamp *)self dayPassFailed]) {
    [v5 appendFormat:@" (daypass failed, error %d)", -[NPTuscanyOnRamp error](self, "error")];
  }
  return (NSString *)v5;
}

- (NSDictionary)descriptionDictionary
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NPTuscanyOnRamp *)self daypassEndpoint];

  if (v4)
  {
    uint64_t v5 = [(NPTuscanyOnRamp *)self daypassEndpoint];
    uint64_t v6 = [v5 description];
    [v3 setObject:v6 forKeyedSubscript:@"dayPassEndpoint"];
  }
  id v7 = [(NPTuscanyOnRamp *)self dayPassCreationDate];

  if (v7)
  {
    id v8 = [(NPTuscanyOnRamp *)self tuscanyEndpoint];

    if (v8)
    {
      double v9 = [(NPTuscanyOnRamp *)self tuscanyEndpoint];
      double v10 = [v9 description];
      [v3 setObject:v10 forKeyedSubscript:@"tuscanyEndpoint"];
    }
    uint64_t v11 = [(NPTuscanyOnRamp *)self dayPassUUID];

    if (v11)
    {
      unint64_t v12 = NSString;
      unint64_t v13 = [(NPTuscanyOnRamp *)self dayPassUUID];
      uint64_t v14 = [v12 stringWithFormat:@"%@", v13];
      [v3 setObject:v14 forKeyedSubscript:@"dayPassUUID"];
    }
    uint64_t v15 = [(NPTuscanyOnRamp *)self dayPass];
    uint64_t v16 = v15;
    if (v15 && [v15 length] == 96)
    {
      id v17 = v16;
      uint64_t v18 = [v17 bytes];
      if (v18 && *(_WORD *)(v18 + 82))
      {
        memset(v36, 0, 46);
        tuscanyClientGetDayPassOriginAddressString(v17, v36, 0x2Eu);
        objc_super v19 = [NSString stringWithUTF8String:v36];
        [v3 setObject:v19 forKeyedSubscript:@"dayPassOriginAddress"];
      }
      else
      {
        uint64_t v20 = NSNumber;
        uint64_t v21 = [v17 bytes];
        if (v21) {
          uint64_t v22 = *(unsigned __int16 *)(v21 + 80);
        }
        else {
          uint64_t v22 = 0;
        }
        BOOL v23 = [v20 numberWithUnsignedShort:v22];
        [v3 setObject:v23 forKeyedSubscript:@"dayPassHostID"];

        id v24 = [NSNumber numberWithUnsignedShort:0];
        [v3 setObject:v24 forKeyedSubscript:@"dayPassPortID"];
      }
    }
    unsigned int v25 = [(NPTuscanyOnRamp *)self dayPassCreationDate];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
      id v27 = (void *)MEMORY[0x1E4F28C10];
      uint64_t v28 = [(NPTuscanyOnRamp *)self dayPassCreationDate];
      v29 = [v27 localizedStringFromDate:v28 dateStyle:1 timeStyle:2];

      [v3 setObject:v29 forKeyedSubscript:@"dayPassCreation"];
    }
    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NPTuscanyOnRamp maxFrameSize](self, "maxFrameSize"));
    [v3 setObject:v30 forKeyedSubscript:@"maxframe"];

    uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NPTuscanyOnRamp rtt](self, "rtt"));
    [v3 setObject:v31 forKeyedSubscript:@"rtt"];

    unsigned int v32 = NSString;
    [(NPTuscanyOnRamp *)self dayPassHardExpiry];
    int v34 = objc_msgSend(v32, "stringWithFormat:", @"%f", v33);
    [v3 setObject:v34 forKeyedSubscript:@"dayPassHardExpiry"];
  }
  return (NSDictionary *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(NPTuscanyOnRamp *)self daypassEndpoint];
    uint64_t v6 = [v4 daypassEndpoint];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(NPTuscanyOnRamp *)self daypassEndpoint];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)invalidateDayPass
{
  [(NPTuscanyOnRamp *)self unregisterAgent];
  [(NPTuscanyOnRamp *)self setDayPass:0];
  [(NPTuscanyOnRamp *)self setDayPassUUID:0];
  dayPassCreationDate = self->_dayPassCreationDate;
  self->_dayPassCreationDate = 0;

  self->_dayPassHardExpiry = 0.0;
  tuscanyEndpoint = self->_tuscanyEndpoint;
  self->_tuscanyEndpoint = 0;
}

- (void)setDayPassSessionCounter:(unsigned int)a3
{
  uint64_t v5 = [(NPTuscanyOnRamp *)self dayPass];
  uint64_t v6 = [v5 length];

  if (v6 == 96)
  {
    char v7 = [(NPTuscanyOnRamp *)self dayPass];
    id v8 = malloc_type_malloc([v7 length], 0x49B5D704uLL);

    if (v8)
    {
      double v9 = [(NPTuscanyOnRamp *)self dayPass];
      double v10 = [(NPTuscanyOnRamp *)self dayPass];
      objc_msgSend(v9, "getBytes:length:", v8, objc_msgSend(v10, "length"));

      v8[23] = a3;
      id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v13 = [(NPTuscanyOnRamp *)self dayPass];
      unint64_t v12 = objc_msgSend(v11, "initWithBytesNoCopy:length:", v8, objc_msgSend(v13, "length"));
      [(NPTuscanyOnRamp *)self setDayPass:v12];
    }
  }
}

- (unsigned)dayPassSessionCounter
{
  id v2 = [(NPTuscanyOnRamp *)self dayPass];
  uint64_t v3 = [v2 bytes];
  if (v3) {
    unsigned int v4 = *(_DWORD *)(v3 + 92);
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)isTFOEnabled
{
  return [(NPTuscanyOnRamp *)self TFOStatus] == 2;
}

- (NPTunnelTuscanyEndpoint)tuscanyEndpoint
{
  return (NPTunnelTuscanyEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTuscanyEndpoint:(id)a3
{
}

- (NSData)dayPass
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDayPass:(id)a3
{
}

- (NSUUID)dayPassUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDayPassUUID:(id)a3
{
}

- (unint64_t)maxFrameSize
{
  return self->_maxFrameSize;
}

- (int64_t)TFOStatus
{
  return self->_TFOStatus;
}

- (void)setTFOStatus:(int64_t)a3
{
  self->_TFOStatus = a3;
}

- (unint64_t)rtt
{
  return self->_rtt;
}

- (int64_t)currentEdgeType
{
  return self->_currentEdgeType;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSDate)dayPassCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDayPassCreationDate:(id)a3
{
}

- (NWEndpoint)daypassEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)retryDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRetryDate:(id)a3
{
}

- (double)dayPassHardExpiry
{
  return self->_dayPassHardExpiry;
}

- (void)setDayPassHardExpiry:(double)a3
{
  self->_dayPassHardExpiry = a3;
}

- (NWNetworkAgentRegistration)agentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAgentRegistration:(id)a3
{
}

- (NSPKeyNetworkAgent)agent
{
  return (NSPKeyNetworkAgent *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAgent:(id)a3
{
}

- (NPWaldo)parentWaldo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentWaldo);
  return (NPWaldo *)WeakRetained;
}

- (void)setParentWaldo:(id)a3
{
}

- (BOOL)dayPassFailed
{
  return self->_dayPassFailed;
}

- (void)setDayPassFailed:(BOOL)a3
{
  self->_dayPassFailed = a3;
}

- (NSURLSession)dayPassSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDayPassSession:(id)a3
{
}

- (BOOL)dayPassPending
{
  return self->_dayPassPending;
}

- (void)setDayPassPending:(BOOL)a3
{
  self->_dayPassPending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayPassSession, 0);
  objc_destroyWeak((id *)&self->_parentWaldo);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_agentRegistration, 0);
  objc_storeStrong((id *)&self->_retryDate, 0);
  objc_storeStrong((id *)&self->_daypassEndpoint, 0);
  objc_storeStrong((id *)&self->_dayPassCreationDate, 0);
  objc_storeStrong((id *)&self->_dayPassUUID, 0);
  objc_storeStrong((id *)&self->_dayPass, 0);
  objc_storeStrong((id *)&self->_tuscanyEndpoint, 0);
}

@end