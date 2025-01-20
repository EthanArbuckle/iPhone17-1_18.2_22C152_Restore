@interface MRAVLightweightReconnaissanceSession
+ (id)searchEndpointsForOutputDeviceUIDImplementation;
+ (void)setSearchEndpointsForOutputDeviceUIDImplementation:(id)a3;
- (void)searchEndpointsForCompanionWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)searchEndpointsForGroupUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchEndpointsForLeaderOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchEndpointsForMyGroupLeaderWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchEndpointsForString:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchEndpointsWithPredicate:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchForLogicalOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchForOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)searchForOutputDevices:(id)a3 categories:(id)a4 timeout:(double)a5 reason:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)searchOutputDevices:(id)a3 reason:(id)a4 timeout:(double)a5 queue:(id)a6 completion:(id)a7;
@end

@implementation MRAVLightweightReconnaissanceSession

- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  v14 = [[MRRequestDetails alloc] initWithName:@"searchEndpointsForOutputDeviceUID" requestID:0 reason:@"API"];
  [(MRAVLightweightReconnaissanceSession *)self searchEndpointsForOutputDeviceUID:v13 timeout:v14 details:v12 queue:v11 completion:a4];
}

- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v75 = [MEMORY[0x1E4F28B00] currentHandler];
  [v75 handleFailureInMethod:a2, self, @"MRAVLightweightReconnaissanceSession.m", 46, @"Invalid parameter not satisfying: %@", @"details" object file lineNumber description];

  if (!v13)
  {
LABEL_3:
    id v13 = (id)MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
  }
LABEL_4:
  v16 = [MEMORY[0x1E4F1C9C8] date];
  v17 = [v12 requestID];
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__34;
  v108 = __Block_byref_object_dispose__34;
  id v83 = v11;
  id v109 = v83;
  v18 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchEndpointsForOutputDeviceUID", v17];
  v19 = v18;
  if (v105[5]) {
    [(__CFString *)v18 appendFormat:@" for %@", v105[5]];
  }
  v20 = [v12 reason];

  if (v20)
  {
    v21 = [v12 reason];
    [(__CFString *)v19 appendFormat:@" because %@", v21];
  }
  v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v111 = v19;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (a4 > 60.0)
  {
    v23 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"resolving timeout from %lf -> %lf", *(void *)&a4, 0x404E000000000000);
    v24 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v111 = @"searchEndpointsForOutputDeviceUID";
      __int16 v112 = 2114;
      id v113 = v17;
      __int16 v114 = 2112;
      v115 = v23;
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    a4 = 60.0;
  }
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke;
  v97[3] = &unk_1E57D7B68;
  v103 = &v104;
  v98 = @"searchEndpointsForOutputDeviceUID";
  id v25 = v17;
  id v99 = v25;
  id v80 = v16;
  id v100 = v80;
  id v84 = v13;
  id v101 = v84;
  id v79 = v14;
  id v102 = v79;
  v26 = (void *)MEMORY[0x1997190F0](v97);
  v27 = [MRBlockGuard alloc];
  v28 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"searchEndpointsForOutputDeviceUID", v25];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_2;
  v95[3] = &unk_1E57D0FE8;
  id v29 = v26;
  id v96 = v29;
  v30 = [(MRBlockGuard *)v27 initWithTimeout:v28 reason:v95 handler:a4];

  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_3;
  v92[3] = &unk_1E57D23E0;
  v82 = v30;
  v93 = v82;
  id v81 = v29;
  id v94 = v81;
  v31 = (void (**)(void, void, void))MEMORY[0x1997190F0](v92);
  v32 = +[MRDeviceInfoRequest localDeviceInfo];
  v33 = (void *)v105[5];
  v34 = +[MRAVOutputDevice localDeviceUID];
  if ([v33 compare:v34 options:1]) {
    goto LABEL_19;
  }
  v35 = [v32 deviceUID];
  BOOL v36 = v35 == 0;

  if (!v36)
  {
    id v37 = [NSString alloc];
    v38 = [v32 deviceUID];
    v34 = (__CFString *)[v37 initWithFormat:@"substituting deviceUID <%@> for outputDeviceUID...", v38];

    v39 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v111 = @"searchEndpointsForOutputDeviceUID";
      __int16 v112 = 2114;
      id v113 = v25;
      __int16 v114 = 2112;
      v115 = v34;
      _os_log_impl(&dword_194F3C000, v39, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v40 = [v32 deviceUID];
    v41 = (void *)v105[5];
    v105[5] = v40;

LABEL_19:
  }
  if (!v105[5])
  {
    v42 = [v32 deviceUID];
    BOOL v43 = v42 == 0;

    if (!v43)
    {
      id v44 = [NSString alloc];
      v45 = [v32 deviceUID];
      v46 = (__CFString *)[v44 initWithFormat:@"substituting deviceUID <%@> for outputDeviceUID...", v45];

      v47 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v111 = @"searchEndpointsForOutputDeviceUID";
        __int16 v112 = 2114;
        id v113 = v25;
        __int16 v114 = 2112;
        v115 = v46;
        _os_log_impl(&dword_194F3C000, v47, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      uint64_t v48 = [v32 deviceUID];
      v49 = (void *)v105[5];
      v105[5] = v48;
    }
  }
  if (!v105[5])
  {
    id v50 = [NSString alloc];
    v51 = +[MRAVOutputDevice localDeviceUID];
    v52 = (__CFString *)[v50 initWithFormat:@"substituting deviceUID <%@> for outputDeviceUID...", v51];

    v53 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v111 = @"searchEndpointsForOutputDeviceUID";
      __int16 v112 = 2114;
      id v113 = v25;
      __int16 v114 = 2112;
      v115 = v52;
      _os_log_impl(&dword_194F3C000, v53, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v54 = +[MRAVOutputDevice localDeviceUID];
    v55 = (void *)v105[5];
    v105[5] = v54;

    if (!v105[5])
    {
      v76 = [MEMORY[0x1E4F28B00] currentHandler];
      [v76 handleFailureInMethod:a2, self, @"MRAVLightweightReconnaissanceSession.m", 100, @"Invalid parameter not satisfying: %@", @"outputDeviceUID" object file lineNumber description];
    }
  }
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_48;
  v88[3] = &unk_1E57D7B90;
  v89 = @"searchEndpointsForOutputDeviceUID";
  id v56 = v25;
  id v90 = v56;
  id v57 = v32;
  id v91 = v57;
  v58 = (unsigned int (**)(void))MEMORY[0x1997190F0](v88);
  if (v58[2]())
  {
    v59 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
    v60 = (void *)v105[5];
    v61 = +[MRAVOutputDevice localDeviceUID];
    BOOL v62 = [v60 compare:v61 options:1] == 0;

    if (v62)
    {
      v65 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v111 = @"searchEndpointsForOutputDeviceUID";
        __int16 v112 = 2114;
        id v113 = v56;
        __int16 v114 = 2112;
        v115 = @"searching for local, using localEndpoint...";
        goto LABEL_43;
      }
LABEL_44:

      v31[2](v31, v59, 0);
      goto LABEL_49;
    }
    v63 = [v57 deviceUID];
    int v64 = [v63 isEqualToString:v105[5]];

    if (v64)
    {
      v65 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v111 = @"searchEndpointsForOutputDeviceUID";
        __int16 v112 = 2114;
        id v113 = v56;
        __int16 v114 = 2112;
        v115 = @"searching for localDeviceUID, using localEndpoint...";
LABEL_43:
        _os_log_impl(&dword_194F3C000, v65, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        goto LABEL_44;
      }
      goto LABEL_44;
    }
    v66 = [v57 identifier];
    int v67 = [v66 isEqualToString:v105[5]];

    if (v67)
    {
      v65 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v111 = @"searchEndpointsForOutputDeviceUID";
        __int16 v112 = 2114;
        id v113 = v56;
        __int16 v114 = 2112;
        v115 = @"searching for localIdentifier, using localEndpoint...";
        goto LABEL_43;
      }
      goto LABEL_44;
    }
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_71;
    v87[3] = &unk_1E57D7BB8;
    v87[4] = &v104;
    v68 = [v59 outputDevicesMatchingPredicate:v87];
    BOOL v69 = [v68 count] == 0;

    if (!v69)
    {
      v65 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v111 = @"searchEndpointsForOutputDeviceUID";
        __int16 v112 = 2114;
        id v113 = v56;
        __int16 v114 = 2112;
        v115 = @"found device in localEndpoint, using localEndpoint...";
        goto LABEL_43;
      }
      goto LABEL_44;
    }
  }
  v70 = [(id)objc_opt_class() searchEndpointsForOutputDeviceUIDImplementation];

  if (v70)
  {
    v59 = [(id)objc_opt_class() searchEndpointsForOutputDeviceUIDImplementation];
    ((void (**)(void, uint64_t, id, id, void (**)(void, void, void), double))v59)[2](v59, v105[5], v12, v84, v31, a4);
  }
  else
  {
    MRCreateXPCMessage(0x300000000000030uLL);
    v59 = (void (**)(void, void, void, void, void, double))objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_double(v59, "timeout", a4);
    v71 = [v12 data];
    MRAddDataToXPCMessage(v59, v71, "MRXPC_REQUEST_DETAILS");

    MRAddStringToXPCMessage(v59, (id)v105[5], "outputDeviceID");
    v72 = +[MRMediaRemoteServiceClient sharedServiceClient];
    v73 = [v72 service];
    v74 = [v73 mrXPCConnection];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_80;
    v85[3] = &unk_1E57D1490;
    v86 = v31;
    [v74 sendMessage:v59 queue:v84 reply:v85];
  }
LABEL_49:

  _Block_object_dispose(&v104, 8);
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_48(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = +[MRAVClusterController sharedController];
  uint64_t v3 = [v2 clusterStatus];

  if (v3 == 2)
  {
    v4 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v14 = 138543874;
      uint64_t v15 = v5;
      __int16 v16 = 2114;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      v19 = @"Not short-circuiting because cluster secondary";
LABEL_10:
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else if ([*(id *)(a1 + 48) isGroupLeader])
  {
    if (![*(id *)(a1 + 48) isAirPlayActive])
    {
      id v12 = +[MRUserSettings currentSettings];
      int v13 = [v12 supportMultiplayerHost];

      return v13 ^ 1u;
    }
    v4 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v14 = 138543874;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      v19 = @"Not short-circuiting because secondary";
      goto LABEL_10;
    }
  }
  else
  {
    v4 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v14 = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      v19 = @"Not short-circuiting not group leader";
      goto LABEL_10;
    }
  }

  return 0;
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v15 = [v5 debugName];

    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(void *)(a1 + 40);
        v28 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        int v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138544130;
        uint64_t v48 = v26;
        __int16 v49 = 2114;
        uint64_t v50 = v27;
        __int16 v51 = 2114;
        id v52 = v28;
        __int16 v53 = 2048;
        uint64_t v54 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = *(void *)(a1 + 32);
        uint64_t v37 = *(void *)(a1 + 40);
        int v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138543874;
        uint64_t v48 = v36;
        __int16 v49 = 2114;
        uint64_t v50 = v37;
        __int16 v51 = 2048;
        id v52 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      int v13 = [v5 debugName];
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544386;
      uint64_t v48 = v18;
      __int16 v49 = 2114;
      uint64_t v50 = v19;
      __int16 v51 = 2112;
      id v52 = v13;
      __int16 v53 = 2114;
      uint64_t v54 = v20;
      __int16 v55 = 2048;
      uint64_t v56 = v22;
      v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v24 = v8;
      uint32_t v25 = 52;
    }
    else
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = *(void *)(a1 + 40);
      int v13 = [v5 debugName];
      v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544130;
      uint64_t v48 = v33;
      __int16 v49 = 2114;
      uint64_t v50 = v34;
      __int16 v51 = 2112;
      id v52 = v13;
      __int16 v53 = 2048;
      uint64_t v54 = v35;
      v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v24 = v8;
      uint32_t v25 = 42;
    }
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544386;
      uint64_t v48 = v10;
      __int16 v49 = 2114;
      uint64_t v50 = v11;
      __int16 v51 = 2114;
      id v52 = v6;
      __int16 v53 = 2114;
      uint64_t v54 = v12;
      __int16 v55 = 2048;
      uint64_t v56 = v14;
      _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:
    }
  }
  else if (v9)
  {
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_21:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_35;
  block[3] = &unk_1E57D0EA8;
  v39 = *(NSObject **)(a1 + 56);
  id v40 = *(id *)(a1 + 64);
  id v45 = v6;
  id v46 = v40;
  id v44 = v5;
  id v41 = v6;
  id v42 = v5;
  dispatch_async(v39, block);
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_35(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_71(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  MREndpointFromXPCMessage(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)searchEndpointsForString:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"MRAVLightweightReconnaissanceSession.m", 171, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v17 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v18 = [v17 UUIDString];

  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchEndpointsWithString", v18];
  uint64_t v20 = v19;
  if (v12) {
    [v19 appendFormat:@" for %@", v12];
  }
  if (v13) {
    [v20 appendFormat:@" because %@", v13];
  }
  v21 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v20;
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (a4 > 60.0)
  {
    uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend([NSString alloc], "initWithFormat:", @"resolving timeout from %lf -> %lf", *(void *)&a4, 0x404E000000000000);
    v23 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = @"searchEndpointsWithString";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      id v41 = v22;
      _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    a4 = 60.0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v41 = __Block_byref_object_copy__34;
  id v42 = __Block_byref_object_dispose__34;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke;
  v37[3] = &unk_1E57D7BE0;
  id v38 = v12;
  v39 = buf;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke_2;
  v30[3] = &unk_1E57D7C08;
  id v24 = v38;
  id v31 = v24;
  uint32_t v32 = @"searchEndpointsWithString";
  id v25 = v18;
  id v33 = v25;
  id v26 = v16;
  id v34 = v26;
  id v27 = v15;
  id v35 = v27;
  uint64_t v36 = buf;
  [(MRAVLightweightReconnaissanceSession *)self searchEndpointsWithPredicate:v37 timeout:v13 reason:v14 queue:v30 completion:a4];

  _Block_object_dispose(buf, 8);
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 uniqueIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    goto LABEL_4;
  }
  id v6 = [v3 localizedName];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7
    || ([v3 debugName],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:*(void *)(a1 + 32)],
        v8,
        v9))
  {
LABEL_4:
    uint64_t v10 = [v3 groupLeader];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

LABEL_5:
    uint64_t v13 = 1;
  }
  else
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v15 = [v3 outputDevices];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v68;
      uint64_t v55 = *(void *)v68;
      while (2)
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v68 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v56 = v19;
          uint64_t v20 = *(void **)(*((void *)&v67 + 1) + 8 * v19);
          v21 = [v20 uid];
          int v22 = [v21 isEqualToString:*(void *)(a1 + 32)];

          if (v22) {
            goto LABEL_40;
          }
          v23 = [v20 groupID];
          int v24 = [v23 isEqualToString:*(void *)(a1 + 32)];

          if (v24) {
            goto LABEL_40;
          }
          id v25 = [v20 name];
          int v26 = [v25 isEqualToString:*(void *)(a1 + 32)];

          if (v26
            || ([v20 bluetoothID],
                id v27 = objc_claimAutoreleasedReturnValue(),
                int v28 = [v27 isEqualToString:*(void *)(a1 + 32)],
                v27,
                v28))
          {
LABEL_40:
            uint64_t v52 = *(void *)(*(void *)(a1 + 40) + 8);
            id v53 = v20;
            obuint64_t j = *(id *)(v52 + 40);
            *(void *)(v52 + 40) = v53;
LABEL_41:

            goto LABEL_5;
          }
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          obuint64_t j = [v20 clusterComposition];
          uint64_t v29 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v64;
            uint64_t v57 = v15;
            uint64_t v54 = v17;
            while (2)
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v64 != v31) {
                  objc_enumerationMutation(obj);
                }
                id v33 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                id v34 = [MRAVDistantOutputDevice alloc];
                id v35 = [v33 descriptor];
                uint64_t v36 = [(MRAVDistantOutputDevice *)v34 initWithDescriptor:v35];

                uint64_t v37 = [v33 uid];
                char v38 = [v37 isEqualToString:*(void *)(a1 + 32)];

                if ((v38 & 1) != 0
                  || ([v33 name],
                      v39 = objc_claimAutoreleasedReturnValue(),
                      char v40 = [v39 isEqualToString:*(void *)(a1 + 32)],
                      v39,
                      (v40 & 1) != 0))
                {
                  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v36);

                  id v15 = v57;
                  goto LABEL_41;
                }
              }
              uint64_t v30 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
              id v15 = v57;
              uint64_t v17 = v54;
              if (v30) {
                continue;
              }
              break;
            }
          }

          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          obuint64_t j = [v20 roomOutputDevices];
          uint64_t v41 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v60;
            while (2)
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v60 != v43) {
                  objc_enumerationMutation(obj);
                }
                id v45 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                id v46 = [v45 uid];
                char v47 = [v46 isEqualToString:*(void *)(a1 + 32)];

                if (v47) {
                  goto LABEL_39;
                }
                uint64_t v48 = [v45 name];
                char v49 = [v48 isEqualToString:*(void *)(a1 + 32)];

                if ((v49 & 1) == 0)
                {
                  uint64_t v50 = [v45 roomID];
                  char v51 = [v50 isEqualToString:*(void *)(a1 + 32)];

                  if ((v51 & 1) == 0) {
                    continue;
                  }
                }
LABEL_39:
                objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v45);
                goto LABEL_41;
              }
              uint64_t v42 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }

          uint64_t v18 = v55;
          uint64_t v19 = v56 + 1;
        }
        while (v56 + 1 != v17);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v67 objects:v73 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = 0;
  }

  return v13;
}

void __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v15 = [v5 debugName];

    uint64_t v16 = a1[4];
    uint64_t v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v27 = a1[5];
        uint64_t v26 = a1[6];
        int v28 = (void *)a1[4];
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:a1[7]];
        int v39 = 138544130;
        uint64_t v40 = v27;
        __int16 v41 = 2114;
        uint64_t v42 = v26;
        __int16 v43 = 2114;
        id v44 = v28;
        __int16 v45 = 2048;
        uint64_t v46 = v29;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        uint64_t v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = a1[5];
        uint64_t v37 = a1[6];
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:a1[7]];
        int v39 = 138543874;
        uint64_t v40 = v36;
        __int16 v41 = 2114;
        uint64_t v42 = v37;
        __int16 v43 = 2048;
        id v44 = v38;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        uint64_t v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = a1[5];
      uint64_t v19 = a1[6];
      uint64_t v13 = [v5 debugName];
      uint64_t v20 = a1[4];
      v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:a1[7]];
      int v39 = 138544386;
      uint64_t v40 = v18;
      __int16 v41 = 2114;
      uint64_t v42 = v19;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2114;
      uint64_t v46 = v20;
      __int16 v47 = 2048;
      uint64_t v48 = v22;
      v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      int v24 = v8;
      uint32_t v25 = 52;
    }
    else
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v33 = a1[5];
      uint64_t v34 = a1[6];
      uint64_t v13 = [v5 debugName];
      v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:a1[7]];
      int v39 = 138544130;
      uint64_t v40 = v33;
      __int16 v41 = 2114;
      uint64_t v42 = v34;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2048;
      uint64_t v46 = v35;
      v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      int v24 = v8;
      uint32_t v25 = 42;
    }
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v39, v25);

    goto LABEL_20;
  }
  uint64_t v7 = a1[4];
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      uint64_t v11 = a1[5];
      uint64_t v10 = a1[6];
      uint64_t v12 = a1[4];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[7]];
      int v39 = 138544386;
      uint64_t v40 = v11;
      __int16 v41 = 2114;
      uint64_t v42 = v10;
      __int16 v43 = 2114;
      id v44 = v6;
      __int16 v45 = 2114;
      uint64_t v46 = v12;
      __int16 v47 = 2048;
      uint64_t v48 = v14;
      _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
LABEL_20:
    }
  }
  else if (v9)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v8);
  }
LABEL_21:

  (*(void (**)(void))(a1[8] + 16))();
}

- (void)searchEndpointsWithPredicate:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v13)
  {
    id v13 = (id)MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
  }
  if (a4 > 60.0) {
    a4 = 60.0;
  }
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  __int16 v43 = __Block_byref_object_copy__34;
  id v44 = __Block_byref_object_dispose__34;
  id v45 = 0;
  uint64_t v16 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  [v16 setDiscoveryMode:3];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke;
  v35[3] = &unk_1E57D7C58;
  id v17 = v13;
  id v36 = v17;
  id v18 = v14;
  id v38 = v18;
  id v19 = v16;
  id v37 = v19;
  int v39 = &v40;
  uint64_t v20 = (void *)MEMORY[0x1997190F0](v35);
  v21 = [MRBlockGuard alloc];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_3;
  v33[3] = &unk_1E57D0FE8;
  id v22 = v20;
  id v34 = v22;
  v23 = [(MRBlockGuard *)v21 initWithTimeout:v12 reason:v33 handler:a4];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_4;
  v29[3] = &unk_1E57D7C80;
  id v24 = v11;
  id v31 = v24;
  uint32_t v25 = v23;
  uint64_t v30 = v25;
  id v26 = v22;
  id v32 = v26;
  uint64_t v27 = [v19 addEndpointsChangedCallback:v29];
  int v28 = (void *)v41[5];
  v41[5] = v27;

  _Block_object_dispose(&v40, 8);
}

void __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D7C30;
  id v16 = *(id *)(a1 + 48);
  id v13 = v5;
  id v14 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  id v15 = v8;
  uint64_t v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t result = [*(id *)(a1 + 48) setDiscoveryMode:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v4 = *(void **)(a1 + 48);
    return objc_msgSend(v4, "removeEndpointsChangedCallback:");
  }
  return result;
}

uint64_t __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40)))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "disarm", (void)v8)) {
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          }
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)searchEndpointsForGroupUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v59 = a5;
  id v12 = a6;
  id v13 = a7;
  if (!v12)
  {
    id v12 = (id)MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
  }
  uint64_t v90 = 0;
  id v91 = &v90;
  uint64_t v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__34;
  id v94 = __Block_byref_object_dispose__34;
  id v57 = v11;
  id v95 = v57;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__34;
  v88 = __Block_byref_object_dispose__34;
  id v89 = 0;
  uint64_t v78 = 0;
  id v79 = &v78;
  uint64_t v80 = 0x3032000000;
  id v81 = __Block_byref_object_copy__34;
  v82 = __Block_byref_object_dispose__34;
  id v83 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  [(id)v79[5] setDiscoveryMode:2];
  id v15 = [MEMORY[0x1E4F1C9C8] date];
  id v16 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v17 = [v16 UUIDString];

  id v18 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchEndpointsForGroupUID", v17];
  id v19 = v18;
  if (v91[5]) {
    [(__CFString *)v18 appendFormat:@" for %@", v91[5]];
  }
  if (v59) {
    [(__CFString *)v19 appendFormat:@" because %@", v59];
  }
  uint64_t v20 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v97 = v19;
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke;
  v68[3] = &unk_1E57D7CD0;
  v75 = &v90;
  long long v69 = @"searchEndpointsForGroupUID";
  id v21 = v17;
  id v70 = v21;
  id v22 = v15;
  id v71 = v22;
  id v56 = v12;
  id v72 = v56;
  id v23 = v13;
  v73 = self;
  id v74 = v23;
  v76 = &v78;
  v77 = &v84;
  id v24 = (void *)MEMORY[0x1997190F0](v68);
  uint32_t v25 = [MRBlockGuard alloc];
  id v26 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"searchEndpointsForGroupUID", v21];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_2;
  v66[3] = &unk_1E57D0FE8;
  id v27 = v24;
  id v67 = v27;
  int v28 = [(MRBlockGuard *)v25 initWithTimeout:v26 reason:v66 handler:a4];

  uint64_t v29 = +[MROrigin localOrigin];
  uint64_t v30 = +[MRDeviceInfoRequest deviceInfoForOrigin:v29];

  if (!v91[5])
  {
    id v31 = [v30 groupUID];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      id v33 = [NSString alloc];
      id v34 = [v30 groupUID];
      uint64_t v35 = (void *)[v33 initWithFormat:@"substituting groupID <%@> for nil...", v34];

      id v36 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v97 = @"searchEndpointsForGroupUID";
        __int16 v98 = 2114;
        id v99 = v21;
        __int16 v100 = 2112;
        id v101 = v35;
        _os_log_impl(&dword_194F3C000, v36, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      uint64_t v37 = [v30 groupUID];
      id v38 = (void *)v91[5];
      v91[5] = v37;
    }
  }
  int v39 = [v30 groupUID];
  if (v39)
  {
    uint64_t v40 = (void *)v91[5];
    __int16 v41 = +[MRAVOutputDevice localDeviceUID];
    LODWORD(v40) = [v40 compare:v41 options:1] == 0;

    if (v40)
    {
      id v42 = [NSString alloc];
      __int16 v43 = [v30 groupUID];
      id v44 = +[MRAVOutputDevice localDeviceUID];
      id v45 = (void *)[v42 initWithFormat:@"substituting group <%@> for %@...", v43, v44];

      uint64_t v46 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v97 = @"searchEndpointsForGroupUID";
        __int16 v98 = 2114;
        id v99 = v21;
        __int16 v100 = 2112;
        id v101 = v45;
        _os_log_impl(&dword_194F3C000, v46, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      uint64_t v47 = [v30 groupUID];
      uint64_t v48 = (void *)v91[5];
      v91[5] = v47;
    }
  }
  uint64_t v49 = self;
  objc_sync_enter(v49);
  uint64_t v50 = (void *)v79[5];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_104;
  v60[3] = &unk_1E57D7CF8;
  long long v65 = &v90;
  char v51 = v28;
  long long v61 = v51;
  long long v62 = @"searchEndpointsForGroupUID";
  id v52 = v21;
  id v63 = v52;
  id v53 = v27;
  id v64 = v53;
  uint64_t v54 = [v50 addEndpointsChangedCallback:v60];
  uint64_t v55 = (void *)v85[5];
  v85[5] = v54;

  objc_sync_exit(v49);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);
}

void __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v15 = [v5 debugName];

    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    long long v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(void *)(a1 + 40);
        int v28 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138544130;
        uint64_t v50 = v26;
        __int16 v51 = 2114;
        uint64_t v52 = v27;
        __int16 v53 = 2114;
        id v54 = v28;
        __int16 v55 = 2048;
        uint64_t v56 = v29;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = *(void *)(a1 + 32);
        uint64_t v37 = *(void *)(a1 + 40);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = v36;
        __int16 v51 = 2114;
        uint64_t v52 = v37;
        __int16 v53 = 2048;
        id v54 = v38;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      id v13 = [v5 debugName];
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544386;
      uint64_t v50 = v18;
      __int16 v51 = 2114;
      uint64_t v52 = v19;
      __int16 v53 = 2112;
      id v54 = v13;
      __int16 v55 = 2114;
      uint64_t v56 = v20;
      __int16 v57 = 2048;
      uint64_t v58 = v22;
      id v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v24 = v8;
      uint32_t v25 = 52;
    }
    else
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = *(void *)(a1 + 40);
      id v13 = [v5 debugName];
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544130;
      uint64_t v50 = v33;
      __int16 v51 = 2114;
      uint64_t v52 = v34;
      __int16 v53 = 2112;
      id v54 = v13;
      __int16 v55 = 2048;
      uint64_t v56 = v35;
      id v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      id v24 = v8;
      uint32_t v25 = 42;
    }
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  long long v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544386;
      uint64_t v50 = v10;
      __int16 v51 = 2114;
      uint64_t v52 = v11;
      __int16 v53 = 2114;
      id v54 = v6;
      __int16 v55 = 2114;
      uint64_t v56 = v12;
      __int16 v57 = 2048;
      uint64_t v58 = v14;
      _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:
    }
  }
  else if (v9)
  {
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_21:

  int v39 = *(NSObject **)(a1 + 56);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_96;
  v43[3] = &unk_1E57D7CA8;
  id v40 = *(id *)(a1 + 72);
  id v44 = v5;
  id v45 = v6;
  uint64_t v46 = *(void *)(a1 + 64);
  id v47 = v40;
  long long v48 = *(_OWORD *)(a1 + 88);
  id v41 = v6;
  id v42 = v5;
  dispatch_async(v39, v43);
}

void __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_96(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  obuint64_t j = *(id *)(a1 + 48);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDiscoveryMode:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "removeEndpointsChangedCallback:");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  objc_sync_exit(obj);
}

uint64_t __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "outputDevices", (void)v15);
        BOOL v9 = [v8 firstObject];
        uint64_t v10 = [v9 groupID];
        int v11 = [v10 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

        if (v11)
        {
          if ([*(id *)(a1 + 32) disarm])
          {
            uint64_t v12 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = *(void *)(a1 + 40);
              uint64_t v14 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              uint64_t v20 = v13;
              __int16 v21 = 2114;
              uint64_t v22 = v14;
              __int16 v23 = 2112;
              id v24 = @"found device in discovery";
              _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)searchEndpointsForCompanionWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!v10)
  {
    id v10 = (id)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
  }
  uint64_t v50 = 0;
  __int16 v51 = &v50;
  uint64_t v52 = 0x3032000000;
  __int16 v53 = __Block_byref_object_copy__34;
  id v54 = __Block_byref_object_dispose__34;
  id v55 = 0;
  uint64_t v13 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  [v13 setDiscoveryMode:2];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  long long v15 = [MEMORY[0x1E4F29128] UUID];
  long long v16 = [v15 UUIDString];

  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchEndpointsForCompanion", v16];
  long long v18 = v17;
  if (v9) {
    [v17 appendFormat:@" because %@", v9];
  }
  uint64_t v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v57 = v18;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke;
  v42[3] = &unk_1E57D7D20;
  __int16 v43 = @"searchEndpointsForCompanion";
  id v20 = v16;
  id v44 = v20;
  id v21 = v14;
  id v45 = v21;
  id v22 = v10;
  id v46 = v22;
  id v23 = v11;
  id v48 = v23;
  id v24 = v13;
  id v47 = v24;
  uint64_t v49 = &v50;
  uint32_t v25 = (void *)MEMORY[0x1997190F0](v42);
  uint64_t v26 = [MRBlockGuard alloc];
  uint64_t v27 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"searchEndpointsForCompanion", v20];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_2;
  v40[3] = &unk_1E57D0FE8;
  id v28 = v25;
  id v41 = v28;
  uint64_t v29 = [(MRBlockGuard *)v26 initWithTimeout:v27 reason:v40 handler:a3];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_3;
  v35[3] = &unk_1E57D54F0;
  uint64_t v30 = v29;
  uint64_t v36 = v30;
  uint64_t v37 = @"searchEndpointsForCompanion";
  id v31 = v20;
  id v38 = v31;
  id v32 = v28;
  id v39 = v32;
  uint64_t v33 = [v24 addEndpointsChangedCallback:v35];
  uint64_t v34 = (void *)v51[5];
  v51[5] = v33;

  _Block_object_dispose(&v50, 8);
}

void __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    long long v8 = [v5 debugName];

    uint64_t v7 = _MRLogForCategory(0xAuLL);
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v9) {
        goto LABEL_10;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [v5 debugName];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544130;
      uint64_t v30 = v10;
      __int16 v31 = 2114;
      uint64_t v32 = v11;
      __int16 v33 = 2112;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v14;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);
    }
    else
    {
      if (!v9) {
        goto LABEL_10;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      __int16 v33 = 2048;
      uint64_t v34 = v17;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    }

    goto LABEL_10;
  }
  uint64_t v7 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v7);
  }
LABEL_10:

  long long v18 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_111;
  block[3] = &unk_1E57D7C30;
  id v27 = *(id *)(a1 + 72);
  id v24 = v5;
  id v25 = v6;
  id v19 = *(id *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 80);
  id v26 = v19;
  uint64_t v28 = v20;
  id v21 = v6;
  id v22 = v5;
  dispatch_async(v18, block);
}

uint64_t __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_111(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t result = [*(id *)(a1 + 48) setDiscoveryMode:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v4 = *(void **)(a1 + 48);
    return objc_msgSend(v4, "removeEndpointsChangedCallback:");
  }
  return result;
}

uint64_t __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isCompanionEndpoint", (void)v11))
        {
          if ([*(id *)(a1 + 32) disarm])
          {
            long long v8 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v9 = *(void *)(a1 + 40);
              uint64_t v10 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              uint64_t v16 = v9;
              __int16 v17 = 2114;
              uint64_t v18 = v10;
              __int16 v19 = 2112;
              uint64_t v20 = @"found device in discovery";
              _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)searchEndpointsForLeaderOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v41 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v13)
  {
    id v13 = (id)MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
  }
  uint64_t v66 = 0;
  id v67 = &v66;
  uint64_t v68 = 0x3032000000;
  long long v69 = __Block_byref_object_copy__34;
  id v70 = __Block_byref_object_dispose__34;
  id v71 = 0;
  uint64_t v60 = 0;
  long long v61 = &v60;
  uint64_t v62 = 0x3032000000;
  id v63 = __Block_byref_object_copy__34;
  id v64 = __Block_byref_object_dispose__34;
  id v65 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  [(id)v61[5] setDiscoveryMode:3];
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v17 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v18 = [v17 UUIDString];

  __int16 v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchEndpointsForLeaderOutputDeviceUID", v18];
  uint64_t v20 = v19;
  if (v12) {
    [v19 appendFormat:@" for %@", v12];
  }
  if (v41) {
    [v20 appendFormat:@" because %@", v41];
  }
  id v21 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v73 = v20;
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke;
  v50[3] = &unk_1E57D7D48;
  id v22 = v12;
  id v51 = v22;
  uint64_t v52 = @"searchEndpointsForLeaderOutputDeviceUID";
  id v23 = v18;
  id v53 = v23;
  id v40 = v16;
  id v54 = v40;
  id v38 = v13;
  id v55 = v38;
  id v39 = v14;
  uint64_t v56 = self;
  id v57 = v39;
  uint64_t v58 = &v60;
  uint64_t v59 = &v66;
  id v24 = (void *)MEMORY[0x1997190F0](v50);
  id v25 = [MRBlockGuard alloc];
  id v26 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"searchEndpointsForLeaderOutputDeviceUID", v23];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2;
  v48[3] = &unk_1E57D0FE8;
  id v27 = v24;
  id v49 = v27;
  uint64_t v28 = [(MRBlockGuard *)v25 initWithTimeout:v26 reason:v48 handler:a4];

  uint64_t v29 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
  if (!v12) {
    (*((void (**)(id, void *, void))v27 + 2))(v27, v29, 0);
  }
  uint64_t v30 = self;
  objc_sync_enter(v30);
  __int16 v31 = (void *)v61[5];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3;
  v42[3] = &unk_1E57D5518;
  id v32 = v22;
  id v43 = v32;
  __int16 v33 = v28;
  id v44 = v33;
  id v45 = @"searchEndpointsForLeaderOutputDeviceUID";
  id v34 = v23;
  id v46 = v34;
  id v35 = v27;
  id v47 = v35;
  uint64_t v36 = [v31 addEndpointsChangedCallback:v42];
  uint64_t v37 = (void *)v67[5];
  v67[5] = v36;

  objc_sync_exit(v30);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
}

void __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v15 = [v5 debugName];

    uint64_t v16 = *(void *)(a1 + 32);
    long long v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v27 = *(void *)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 48);
        uint64_t v28 = *(void **)(a1 + 32);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v50 = v27;
        __int16 v51 = 2114;
        uint64_t v52 = v26;
        __int16 v53 = 2114;
        id v54 = v28;
        __int16 v55 = 2048;
        uint64_t v56 = v29;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        __int16 v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = *(void *)(a1 + 40);
        uint64_t v37 = *(void *)(a1 + 48);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = v36;
        __int16 v51 = 2114;
        uint64_t v52 = v37;
        __int16 v53 = 2048;
        id v54 = v38;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        __int16 v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      id v13 = [v5 debugName];
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v50 = v18;
      __int16 v51 = 2114;
      uint64_t v52 = v19;
      __int16 v53 = 2112;
      id v54 = v13;
      __int16 v55 = 2114;
      uint64_t v56 = v20;
      __int16 v57 = 2048;
      uint64_t v58 = v22;
      id v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v24 = v8;
      uint32_t v25 = 52;
    }
    else
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v33 = *(void *)(a1 + 40);
      uint64_t v34 = *(void *)(a1 + 48);
      id v13 = [v5 debugName];
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v50 = v33;
      __int16 v51 = 2114;
      uint64_t v52 = v34;
      __int16 v53 = 2112;
      id v54 = v13;
      __int16 v55 = 2048;
      uint64_t v56 = v35;
      id v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      id v24 = v8;
      uint32_t v25 = 42;
    }
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v50 = v11;
      __int16 v51 = 2114;
      uint64_t v52 = v10;
      __int16 v53 = 2114;
      id v54 = v6;
      __int16 v55 = 2114;
      uint64_t v56 = v12;
      __int16 v57 = 2048;
      uint64_t v58 = v14;
      _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:
    }
  }
  else if (v9)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v8);
  }
LABEL_21:

  id v39 = *(NSObject **)(a1 + 64);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_115;
  v43[3] = &unk_1E57D7CA8;
  id v40 = *(id *)(a1 + 80);
  id v44 = v5;
  id v45 = v6;
  uint64_t v46 = *(void *)(a1 + 72);
  id v47 = v40;
  long long v48 = *(_OWORD *)(a1 + 88);
  id v41 = v6;
  id v42 = v5;
  dispatch_async(v39, v43);
}

void __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_115(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  obuint64_t j = *(id *)(a1 + 48);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDiscoveryMode:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "removeEndpointsChangedCallback:");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  objc_sync_exit(obj);
}

uint64_t __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v5 = 138543874;
    long long v22 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "designatedGroupLeader", v22);
        int v11 = [v10 supportsMultiplayer];

        if (v11)
        {
          uint64_t v12 = [v9 outputDevices];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_4;
          v23[3] = &unk_1E57D07B8;
          v23[4] = v9;
          id v13 = objc_msgSend(v12, "msv_firstWhere:", v23);

          if ([v13 containsUID:*(void *)(a1 + 32)]
            && [*(id *)(a1 + 40) disarm])
          {
            uint64_t v14 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = *(void *)(a1 + 48);
              uint64_t v16 = *(void *)(a1 + 56);
              *(_DWORD *)buf = v22;
              uint64_t v29 = v15;
              __int16 v30 = 2114;
              uint64_t v31 = v16;
              __int16 v32 = 2112;
              uint64_t v33 = @"found multiplayer device in discovery";
              _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
        }
        else
        {
          BOOL v17 = [v9 designatedGroupLeader];
          int v18 = [v17 containsUID:*(void *)(a1 + 32)];

          if (v18)
          {
            if ([*(id *)(a1 + 40) disarm])
            {
              uint64_t v19 = _MRLogForCategory(0xAuLL);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = *(void *)(a1 + 48);
                uint64_t v21 = *(void *)(a1 + 56);
                *(_DWORD *)buf = v22;
                uint64_t v29 = v20;
                __int16 v30 = 2114;
                uint64_t v31 = v21;
                __int16 v32 = 2112;
                uint64_t v33 = @"found device in discovery";
                _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
            }
            goto LABEL_21;
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

uint64_t __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 designatedGroupLeader];
  long long v5 = [v4 uid];
  uint64_t v6 = [v3 containsUID:v5];

  return v6;
}

- (void)searchForOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v54 = a5;
  id v12 = a6;
  id v13 = a7;
  if (!v12)
  {
    id v12 = (id)MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
  }
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  id v89 = __Block_byref_object_copy__34;
  uint64_t v90 = __Block_byref_object_dispose__34;
  id v51 = v11;
  id v91 = v51;
  uint64_t v80 = 0;
  id v81 = &v80;
  uint64_t v82 = 0x3032000000;
  id v83 = __Block_byref_object_copy__34;
  uint64_t v84 = __Block_byref_object_dispose__34;
  id v85 = 0;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__34;
  uint64_t v78 = __Block_byref_object_dispose__34;
  id v79 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:1];
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  BOOL v17 = [v16 UUIDString];

  int v18 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchForOutputDeviceUID", v17];
  uint64_t v19 = v18;
  if (v87[5]) {
    [(__CFString *)v18 appendFormat:@" for %@", v87[5]];
  }
  if (v54) {
    [(__CFString *)v19 appendFormat:@" because %@", v54];
  }
  uint64_t v20 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v93 = v19;
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (a4 > 60.0)
  {
    uint64_t v21 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"resolving timeout from %lf -> %lf", *(void *)&a4, 0x404E000000000000);
    long long v22 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v93 = @"searchForOutputDeviceUID";
      __int16 v94 = 2114;
      id v95 = v17;
      __int16 v96 = 2112;
      v97 = v21;
      _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    a4 = 60.0;
  }
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke;
  v64[3] = &unk_1E57D7D70;
  id v71 = &v86;
  id v65 = @"searchForOutputDeviceUID";
  id v23 = v17;
  id v66 = v23;
  id v24 = v15;
  id v67 = v24;
  uint64_t v68 = self;
  id v72 = &v74;
  v73 = &v80;
  id v25 = v13;
  id v70 = v25;
  id v26 = v12;
  id v69 = v26;
  long long v27 = (void *)MEMORY[0x1997190F0](v64);
  uint64_t v28 = [MRBlockGuard alloc];
  uint64_t v29 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"searchForOutputDeviceUID", v23];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2;
  v62[3] = &unk_1E57D0FE8;
  id v30 = v27;
  id v63 = v30;
  __int16 v53 = [(MRBlockGuard *)v28 initWithTimeout:v29 reason:v62 handler:a4];

  uint64_t v31 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
  __int16 v32 = +[MROrigin localOrigin];
  uint64_t v33 = +[MRDeviceInfoRequest deviceInfoForOrigin:v32];

  if (!v87[5])
  {
    uint64_t v34 = [v33 deviceUID];
    BOOL v35 = v34 == 0;

    if (!v35)
    {
      id v36 = [NSString alloc];
      uint64_t v37 = [v33 deviceUID];
      id v38 = (__CFString *)[v36 initWithFormat:@"substituting deviceUID <%@> for outputDeviceUID...", v37];

      id v39 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v93 = @"searchForOutputDeviceUID";
        __int16 v94 = 2114;
        id v95 = v23;
        __int16 v96 = 2112;
        v97 = v38;
        _os_log_impl(&dword_194F3C000, v39, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      uint64_t v40 = [v33 deviceUID];
      id v41 = (void *)v87[5];
      void v87[5] = v40;
    }
  }
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_124;
  v61[3] = &unk_1E57D7BB8;
  v61[4] = &v86;
  id v42 = [v31 outputDevicesMatchingPredicate:v61];
  if (![v42 count])
  {
    id v45 = v24;
    id v46 = v25;
    id v47 = v26;
    id v44 = self;
    objc_sync_enter(v44);
    [(id)v75[5] setDiscoveryMode:3];
    long long v48 = (void *)v75[5];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_128;
    v55[3] = &unk_1E57D7CF8;
    uint64_t v60 = &v86;
    uint64_t v56 = v53;
    __int16 v57 = @"searchForOutputDeviceUID";
    id v58 = v23;
    id v59 = v30;
    uint64_t v49 = [v48 addOutputDevicesChangedCallback:v55];
    uint64_t v50 = (void *)v81[5];
    v81[5] = v49;

    id v26 = v47;
    id v25 = v46;
    id v24 = v45;

    objc_sync_exit(v44);
LABEL_24:

    goto LABEL_25;
  }
  if ([(MSVBlockGuard *)v53 disarm])
  {
    id v43 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v93 = @"searchForOutputDeviceUID";
      __int16 v94 = 2114;
      id v95 = v23;
      __int16 v96 = 2112;
      v97 = @"found device in localEndpoint...";
      _os_log_impl(&dword_194F3C000, v43, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    id v44 = [v42 firstObject];
    (*((void (**)(id, MRAVLightweightReconnaissanceSession *, void))v30 + 2))(v30, v44, 0);
    goto LABEL_24;
  }
LABEL_25:

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);

  _Block_object_dispose(&v86, 8);
}

void __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) == 0;
    long long v8 = _MRLogForCategory(0xAuLL);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9) {
        __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_cold_1(a1, v6, v8);
      }
    }
    else if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544386;
      uint64_t v49 = v11;
      __int16 v50 = 2114;
      uint64_t v51 = v10;
      __int16 v52 = 2114;
      id v53 = v6;
      __int16 v54 = 2114;
      uint64_t v55 = v12;
      __int16 v56 = 2048;
      uint64_t v57 = v14;
      _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
    }
  }
  else
  {
    uint64_t v15 = [v5 debugName];
    BOOL v16 = v15 == 0;

    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    long long v8 = _MRLogForCategory(0xAuLL);
    BOOL v18 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v17)
      {
        if (v18)
        {
          uint64_t v26 = *(void *)(a1 + 32);
          uint64_t v25 = *(void *)(a1 + 40);
          long long v27 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
          [v28 timeIntervalSinceDate:*(void *)(a1 + 48)];
          *(_DWORD *)buf = 138544130;
          uint64_t v49 = v26;
          __int16 v50 = 2114;
          uint64_t v51 = v25;
          __int16 v52 = 2114;
          id v53 = v27;
          __int16 v54 = 2048;
          uint64_t v55 = v29;
          _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);
        }
      }
      else if (v18)
      {
        uint64_t v36 = *(void *)(a1 + 32);
        uint64_t v35 = *(void *)(a1 + 40);
        uint64_t v37 = [MEMORY[0x1E4F1C9C8] date];
        [v37 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138543874;
        uint64_t v49 = v36;
        __int16 v50 = 2114;
        uint64_t v51 = v35;
        __int16 v52 = 2048;
        id v53 = v38;
        _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
      }
    }
    else if (v17)
    {
      if (v18)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v19 = *(void *)(a1 + 40);
        uint64_t v21 = [v5 debugName];
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        id v23 = [MEMORY[0x1E4F1C9C8] date];
        [v23 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138544386;
        uint64_t v49 = v20;
        __int16 v50 = 2114;
        uint64_t v51 = v19;
        __int16 v52 = 2112;
        id v53 = v21;
        __int16 v54 = 2114;
        uint64_t v55 = v22;
        __int16 v56 = 2048;
        uint64_t v57 = v24;
        _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      }
    }
    else if (v18)
    {
      uint64_t v31 = *(void *)(a1 + 32);
      uint64_t v30 = *(void *)(a1 + 40);
      __int16 v32 = [v5 debugName];
      uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
      [v33 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544130;
      uint64_t v49 = v31;
      __int16 v50 = 2114;
      uint64_t v51 = v30;
      __int16 v52 = 2112;
      id v53 = v32;
      __int16 v54 = 2048;
      uint64_t v55 = v34;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);
    }
  }

  id v39 = *(id *)(a1 + 56);
  objc_sync_enter(v39);
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setDiscoveryMode:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "removeOutputDevicesChangedCallback:");
  }
  uint64_t v40 = *(void *)(*(void *)(a1 + 88) + 8);
  id v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = 0;

  objc_sync_exit(v39);
  id v42 = *(void **)(a1 + 72);
  if (v42)
  {
    id v43 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_122;
    block[3] = &unk_1E57D0EA8;
    id v47 = v42;
    id v45 = v5;
    id v46 = v6;
    dispatch_async(v43, block);
  }
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_122(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_124(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "containsUID:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), (void)v11))
        {
          if ([*(id *)(a1 + 32) disarm])
          {
            long long v8 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v9 = *(void *)(a1 + 40);
              uint64_t v10 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              uint64_t v16 = v9;
              __int16 v17 = 2114;
              uint64_t v18 = v10;
              __int16 v19 = 2112;
              uint64_t v20 = @"found device in discovery";
              _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)searchForLogicalOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v41 = a5;
  id v12 = a6;
  id v13 = a7;
  if (!v12)
  {
    id v12 = (id)MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
  }
  uint64_t v60 = 0;
  long long v61 = &v60;
  uint64_t v62 = 0x3032000000;
  id v63 = __Block_byref_object_copy__34;
  id v64 = __Block_byref_object_dispose__34;
  id v65 = 0;
  uint64_t v15 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:1];
  [v15 setDiscoveryMode:3];
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v17 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v18 = [v17 UUIDString];

  __int16 v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchForLogicalOutputDeviceUID", v18];
  uint64_t v20 = v19;
  if (v11) {
    [v19 appendFormat:@" for %@", v11];
  }
  if (v41) {
    [v20 appendFormat:@" because %@", v41];
  }
  uint64_t v21 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v67 = v20;
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke;
  v51[3] = &unk_1E57D7D98;
  id v22 = v11;
  id v52 = v22;
  id v53 = @"searchForLogicalOutputDeviceUID";
  id v23 = v18;
  id v54 = v23;
  id v24 = v16;
  id v55 = v24;
  id v25 = v15;
  id v56 = v25;
  id v59 = &v60;
  id v40 = v13;
  id v58 = v40;
  id v26 = v12;
  id v57 = v26;
  long long v27 = (void *)MEMORY[0x1997190F0](v51);
  uint64_t v28 = [MRBlockGuard alloc];
  uint64_t v29 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"searchForLogicalOutputDeviceUID", v23];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2;
  v49[3] = &unk_1E57D0FE8;
  id v30 = v27;
  id v50 = v30;
  uint64_t v31 = [(MRBlockGuard *)v28 initWithTimeout:v29 reason:v49 handler:a4];

  __int16 v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3;
  v42[3] = &unk_1E57D7DC0;
  id v33 = v22;
  id v43 = v33;
  id v34 = v32;
  id v44 = v34;
  id v45 = @"searchForLogicalOutputDeviceUID";
  id v35 = v23;
  id v46 = v35;
  uint64_t v36 = v31;
  id v47 = v36;
  id v37 = v30;
  id v48 = v37;
  uint64_t v38 = [v25 addOutputDevicesChangedCallback:v42];
  id v39 = (void *)v61[5];
  void v61[5] = v38;

  _Block_object_dispose(&v60, 8);
}

void __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v15 = MRAVOutputDeviceArrayDescription(v5);

    uint64_t v16 = *(void *)(a1 + 32);
    long long v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 48);
        id v13 = MRAVOutputDeviceArrayDescription(v5);
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v46 = v18;
        __int16 v47 = 2114;
        uint64_t v48 = v19;
        __int16 v49 = 2112;
        id v50 = v13;
        __int16 v51 = 2114;
        uint64_t v52 = v20;
        __int16 v53 = 2048;
        uint64_t v54 = v22;
        id v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v24 = v8;
        uint32_t v25 = 52;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v33 = *(void *)(a1 + 40);
        uint64_t v34 = *(void *)(a1 + 48);
        id v13 = MRAVOutputDeviceArrayDescription(v5);
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v46 = v33;
        __int16 v47 = 2114;
        uint64_t v48 = v34;
        __int16 v49 = 2112;
        id v50 = v13;
        __int16 v51 = 2048;
        uint64_t v52 = v35;
        id v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v24 = v8;
        uint32_t v25 = 42;
      }
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
    else
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v27 = *(void *)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 48);
        uint64_t v28 = *(void **)(a1 + 32);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v46 = v27;
        __int16 v47 = 2114;
        uint64_t v48 = v26;
        __int16 v49 = 2114;
        id v50 = v28;
        __int16 v51 = 2048;
        uint64_t v52 = v29;
        id v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        uint64_t v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = *(void *)(a1 + 40);
        uint64_t v37 = *(void *)(a1 + 48);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v36;
        __int16 v47 = 2114;
        uint64_t v48 = v37;
        __int16 v49 = 2048;
        id v50 = v38;
        id v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        uint64_t v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    }
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    uint64_t v46 = v11;
    __int16 v47 = 2114;
    uint64_t v48 = v10;
    __int16 v49 = 2114;
    id v50 = v6;
    __int16 v51 = 2114;
    uint64_t v52 = v12;
    __int16 v53 = 2048;
    uint64_t v54 = v14;
    _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v8);
  }
LABEL_21:

  [*(id *)(a1 + 64) setDiscoveryMode:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)) {
    objc_msgSend(*(id *)(a1 + 64), "removeOutputDevicesChangedCallback:");
  }
  id v39 = *(void **)(a1 + 80);
  if (v39)
  {
    id v40 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_132;
    block[3] = &unk_1E57D0EA8;
    id v44 = v39;
    id v42 = v5;
    id v43 = v6;
    dispatch_async(v40, block);
  }
}

uint64_t __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_132(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        BOOL v9 = [v8 logicalDeviceID];
        int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

        if (v10)
        {
          uint64_t v11 = *(void **)(a1 + 40);
          uint64_t v12 = [v8 uid];
          id v13 = [v11 objectForKeyedSubscript:v12];

          if (!v13)
          {
            id v14 = [NSString alloc];
            uint64_t v15 = [v8 debugName];
            uint64_t v16 = (void *)[v14 initWithFormat:@"found outputDevice %@", v15];

            BOOL v17 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = *(void *)(a1 + 48);
              uint64_t v19 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138543874;
              uint64_t v29 = v18;
              __int16 v30 = 2114;
              uint64_t v31 = v19;
              __int16 v32 = 2112;
              uint64_t v33 = v16;
              _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            uint64_t v20 = *(void **)(a1 + 40);
            uint64_t v21 = [v8 uid];
            [v20 setObject:v8 forKeyedSubscript:v21];
          }
        }
        if ([*(id *)(a1 + 40) count] == 2 && objc_msgSend(*(id *)(a1 + 64), "disarm"))
        {
          uint64_t v22 = *(void *)(a1 + 72);
          id v23 = [*(id *)(a1 + 40) allValues];
          (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v5);
  }
}

- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  uint64_t v16 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:v14];

  [(MRAVLightweightReconnaissanceSession *)self searchEndpointsForRoutingContextUID:v15 timeout:v16 details:v13 queue:v12 completion:a4];
}

- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = (MRRequestDetails *)a5;
  id v44 = a6;
  id v15 = a7;
  if (!v13)
  {
    id v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"MRAVLightweightReconnaissanceSession.m", 579, @"Invalid parameter not satisfying: %@", @"routingContextUID" object file lineNumber description];
  }
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  if (!v14) {
    id v14 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:@"API"];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v18 = [(MRRequestDetails *)v14 requestID];
  uint64_t v19 = (void *)[v17 initWithFormat:@"%@<%@>", @"searchEndpointsForRoutingContextUID", v18];

  if (v13) {
    [v19 appendFormat:@" for %@", v13];
  }
  uint64_t v20 = [(MRRequestDetails *)v14 label];

  if (v20)
  {
    uint64_t v21 = [(MRRequestDetails *)v14 label];
    [v19 appendFormat:@" because %@", v21];
  }
  uint64_t v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v59 = v19;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke;
  v52[3] = &unk_1E57D7DE8;
  id v53 = v13;
  uint64_t v54 = @"searchEndpointsForRoutingContextUID";
  uint64_t v55 = v14;
  id v56 = v16;
  id v57 = v15;
  id v43 = v15;
  id v42 = v16;
  id v23 = v14;
  id v24 = v13;
  long long v25 = (void *)MEMORY[0x1997190F0](v52);
  long long v26 = [MRBlockGuard alloc];
  id v27 = [NSString alloc];
  uint64_t v28 = [(MRRequestDetails *)v23 requestID];
  uint64_t v29 = (void *)[v27 initWithFormat:@"%@<%@>", @"searchEndpointsForRoutingContextUID", v28];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke_144;
  v50[3] = &unk_1E57D0FE8;
  id v30 = v25;
  id v51 = v30;
  uint64_t v31 = [(MRBlockGuard *)v26 initWithTimeout:v29 reason:v50 handler:a4];

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke_2;
  v47[3] = &unk_1E57D23E0;
  uint64_t v48 = v31;
  id v49 = v30;
  id v32 = v30;
  uint64_t v33 = v31;
  uint64_t v34 = (void *)MEMORY[0x1997190F0](v47);
  uint64_t v35 = MRCreateXPCMessage(0x300000000000033uLL);
  xpc_dictionary_set_double(v35, "timeout", a4);
  uint64_t v36 = [(MRRequestDetails *)v23 data];
  MRAddDataToXPCMessage(v35, v36, "MRXPC_REQUEST_DETAILS");

  MRAddStringToXPCMessage(v35, v24, "routingContextID");
  uint64_t v37 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v38 = [v37 service];
  id v39 = [v38 mrXPCConnection];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke_3;
  v45[3] = &unk_1E57D1490;
  id v46 = v34;
  id v40 = v34;
  [v39 sendMessage:v35 queue:v44 reply:v45];
}

void __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v15 = [v5 debugName];

    uint64_t v16 = *(void *)(a1 + 32);
    long long v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v11 = [*(id *)(a1 + 48) requestID];
        id v13 = [v5 debugName];
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v36 = 138544386;
        uint64_t v37 = v18;
        __int16 v38 = 2114;
        id v39 = v11;
        __int16 v40 = 2112;
        id v41 = v13;
        __int16 v42 = 2114;
        uint64_t v43 = v19;
        __int16 v44 = 2048;
        uint64_t v45 = v21;
        uint64_t v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v23 = v8;
        uint32_t v24 = 52;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v31 = *(void *)(a1 + 40);
        uint64_t v11 = [*(id *)(a1 + 48) requestID];
        id v13 = [v5 debugName];
        uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v36 = 138544130;
        uint64_t v37 = v31;
        __int16 v38 = 2114;
        id v39 = v11;
        __int16 v40 = 2112;
        id v41 = v13;
        __int16 v42 = 2048;
        uint64_t v43 = v32;
        uint64_t v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v23 = v8;
        uint32_t v24 = 42;
      }
      _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v36, v24);
    }
    else
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v25 = *(void *)(a1 + 40);
        uint64_t v11 = [*(id *)(a1 + 48) requestID];
        long long v26 = *(void **)(a1 + 32);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v36 = 138544130;
        uint64_t v37 = v25;
        __int16 v38 = 2114;
        id v39 = v11;
        __int16 v40 = 2114;
        id v41 = v26;
        __int16 v42 = 2048;
        uint64_t v43 = v27;
        uint64_t v28 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        uint64_t v29 = v8;
        uint32_t v30 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v33 = *(void *)(a1 + 40);
        uint64_t v11 = [*(id *)(a1 + 48) requestID];
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v36 = 138543874;
        uint64_t v37 = v33;
        __int16 v38 = 2114;
        id v39 = v11;
        __int16 v40 = 2048;
        id v41 = v34;
        uint64_t v28 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        uint64_t v29 = v8;
        uint32_t v30 = 32;
      }
      _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v36, v30);
    }
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 48) requestID];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v36 = 138544386;
    uint64_t v37 = v10;
    __int16 v38 = 2114;
    id v39 = v11;
    __int16 v40 = 2114;
    id v41 = v6;
    __int16 v42 = 2114;
    uint64_t v43 = v12;
    __int16 v44 = 2048;
    uint64_t v45 = v14;
    _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v36, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9) {
    __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_21:

  uint64_t v35 = *(void *)(a1 + 64);
  if (v35) {
    (*(void (**)(uint64_t, id, id))(v35 + 16))(v35, v5, v6);
  }
}

uint64_t __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke_144(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __109__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_details_queue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  MREndpointFromXPCMessage(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)searchEndpointsForMyGroupLeaderWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a6;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke;
  v26[3] = &unk_1E57D7E10;
  uint64_t v27 = @"searchEndpointsForMyGroupLeader";
  id v13 = v12;
  id v28 = v13;
  id v14 = v10;
  id v29 = v14;
  id v15 = v9;
  id v31 = v15;
  id v16 = v8;
  id v30 = v16;
  BOOL v17 = (void (**)(void, void, void))MEMORY[0x1997190F0](v26);
  uint64_t v18 = (void *)MRMediaRemoteCopyDeviceUID();
  if (v18)
  {
    uint64_t v19 = [MRAVReconnaissanceSession alloc];
    v32[0] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    uint64_t v21 = [(MRAVReconnaissanceSession *)v19 initWithOutputDeviceUIDs:v20 outputDeviceGroupID:0 features:8];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_2;
    v23[3] = &unk_1E57D7E38;
    uint32_t v24 = v21;
    uint64_t v25 = v17;
    uint64_t v22 = v21;
    [(MRAVReconnaissanceSession *)v22 beginSearchWithTimeout:v23 completion:a3];
  }
  else
  {
    uint64_t v22 = (MRAVReconnaissanceSession *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:33];
    ((void (**)(void, void, MRAVReconnaissanceSession *))v17)[2](v17, 0, v22);
  }
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _MRLogForCategory(0xAuLL);
  id v8 = v7;
  if (v5 && !v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:a1[6]];
    *(_DWORD *)buf = 138544130;
    uint64_t v26 = v9;
    __int16 v27 = 2114;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    id v30 = v5;
    __int16 v31 = 2048;
    uint64_t v32 = v12;
    id v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v14 = v8;
    uint32_t v15 = 42;
LABEL_10:
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);

    goto LABEL_11;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v16 = a1[4];
    uint64_t v17 = a1[5];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:a1[6]];
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v16;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    __int16 v29 = 2048;
    id v30 = v18;
    id v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v14 = v8;
    uint32_t v15 = 32;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_11:

  uint64_t v19 = (void *)a1[8];
  if (v19)
  {
    uint64_t v20 = a1[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_149;
    block[3] = &unk_1E57D0EA8;
    id v24 = v19;
    id v22 = v5;
    id v23 = v6;
    dispatch_async(v20, block);
  }
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_149(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  id v8 = *(id *)(a1 + 32);
  v7(v6, a3, a4);
}

- (void)searchOutputDevices:(id)a3 reason:(id)a4 timeout:(double)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = a3;
  uint64_t v16 = [v14 date];
  uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v18 = [v17 UUIDString];

  uint64_t v19 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchOutputDevices", v18];
  uint64_t v20 = v19;
  if (v11) {
    [(__CFString *)v19 appendFormat:@" for %@", v11];
  }
  uint64_t v21 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v59 = v20;
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (a5 > 60.0)
  {
    id v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"resolving timeout from %lf -> %lf", *(void *)&a5, 0x404E000000000000);
    id v23 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v59 = @"searchOutputDevices";
      __int16 v60 = 2114;
      long long v61 = v18;
      __int16 v62 = 2112;
      id v63 = v22;
      _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    a5 = 60.0;
  }
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke;
  v51[3] = &unk_1E57D7E60;
  id v52 = v11;
  id v53 = @"searchOutputDevices";
  id v54 = v18;
  id v55 = v16;
  id v56 = v12;
  id v57 = v13;
  id v40 = v12;
  id v39 = v13;
  id v24 = v16;
  id v25 = v18;
  id v26 = v11;
  __int16 v27 = (void *)MEMORY[0x1997190F0](v51);
  uint64_t v28 = [MRBlockGuard alloc];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_2;
  v49[3] = &unk_1E57D0FE8;
  id v29 = v27;
  id v50 = v29;
  id v30 = [(MRBlockGuard *)v28 initWithTimeout:v26 reason:v49 handler:a5];
  __int16 v31 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:v15 outputDeviceGroupID:0 features:8];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_3;
  v45[3] = &unk_1E57D7E88;
  uint64_t v46 = v31;
  uint64_t v32 = v30;
  __int16 v47 = v32;
  id v33 = v29;
  id v48 = v33;
  uint64_t v34 = v31;
  [(MRAVReconnaissanceSession *)v34 beginSearchWithTimeout:v45 endpointsCompletion:a5];
  uint64_t v35 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:v15 outputDeviceGroupID:0 features:1];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_4;
  v41[3] = &unk_1E57D7E88;
  __int16 v42 = v35;
  uint64_t v43 = v32;
  id v44 = v33;
  id v36 = v33;
  uint64_t v37 = v32;
  __int16 v38 = v35;
  [(MRAVReconnaissanceSession *)v38 beginSearchWithTimeout:v41 endpointsCompletion:a5];
}

void __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[4];
  id v11 = _MRLogForCategory(0xAuLL);
  id v12 = v11;
  if (v7 && !v9)
  {
    BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v13) {
        goto LABEL_22;
      }
      uint64_t v15 = a1[5];
      uint64_t v14 = a1[6];
      uint64_t v16 = a1[4];
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138544386;
      uint64_t v46 = v15;
      __int16 v47 = 2114;
      uint64_t v48 = v14;
      __int16 v49 = 2112;
      id v50 = v7;
      __int16 v51 = 2114;
      uint64_t v52 = v16;
      __int16 v53 = 2048;
      uint64_t v54 = v18;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      uint64_t v20 = v12;
      uint32_t v21 = 52;
      goto LABEL_16;
    }
    if (!v13) {
      goto LABEL_22;
    }
    uint64_t v32 = a1[5];
    uint64_t v33 = a1[6];
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    [v17 timeIntervalSinceDate:a1[7]];
    *(_DWORD *)buf = 138544130;
    uint64_t v46 = v32;
    __int16 v47 = 2114;
    uint64_t v48 = v33;
    __int16 v49 = 2112;
    id v50 = v7;
    __int16 v51 = 2048;
    uint64_t v52 = v34;
    uint64_t v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (v9)
  {
    BOOL v22 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (!v22) {
        goto LABEL_22;
      }
      uint64_t v24 = a1[5];
      uint64_t v23 = a1[6];
      uint64_t v25 = a1[4];
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138544386;
      uint64_t v46 = v24;
      __int16 v47 = 2114;
      uint64_t v48 = v23;
      __int16 v49 = 2114;
      id v50 = v9;
      __int16 v51 = 2114;
      uint64_t v52 = v25;
      __int16 v53 = 2048;
      uint64_t v54 = v26;
      _os_log_error_impl(&dword_194F3C000, v12, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_17;
    }
    if (v22) {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v9, v12);
    }
  }
  else
  {
    BOOL v27 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v27) {
        goto LABEL_22;
      }
      uint64_t v29 = a1[5];
      uint64_t v28 = a1[6];
      id v30 = (void *)a1[4];
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138544130;
      uint64_t v46 = v29;
      __int16 v47 = 2114;
      uint64_t v48 = v28;
      __int16 v49 = 2114;
      id v50 = v30;
      __int16 v51 = 2048;
      uint64_t v52 = v31;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      uint64_t v20 = v12;
      uint32_t v21 = 42;
LABEL_16:
      _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_17:

      goto LABEL_22;
    }
    if (v27)
    {
      uint64_t v35 = a1[5];
      uint64_t v36 = a1[6];
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v35;
      __int16 v47 = 2114;
      uint64_t v48 = v36;
      __int16 v49 = 2048;
      id v50 = v37;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v20 = v12;
      uint32_t v21 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  __int16 v38 = (void *)a1[9];
  if (v38)
  {
    id v39 = a1[8];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_157;
    v40[3] = &unk_1E57D2A00;
    id v44 = v38;
    id v41 = v7;
    id v42 = v8;
    id v43 = v9;
    dispatch_async(v39, v40);
  }
}

uint64_t __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_157(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v12 = a2;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  if ([v10 disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = a4;
  id v8 = a5;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = objc_msgSend(a2, "msv_filter:", &__block_literal_global_86);
  if ([v10 count] && objc_msgSend(*(id *)(a1 + 40), "disarm")) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

BOOL __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 deviceType] == 1 && !objc_msgSend(v2, "supportsBufferedAirPlay")
    || [v2 deviceSubtype] == 18;

  return v3;
}

- (void)searchForOutputDevices:(id)a3 categories:(id)a4 timeout:(double)a5 reason:(id)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v19)
  {
    if (v18) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
  [v52 handleFailureInMethod:a2, self, @"MRAVLightweightReconnaissanceSession.m", 692, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

  if (!v18)
  {
LABEL_3:
    id v18 = (id)MEMORY[0x1E4F14428];
    id v20 = MEMORY[0x1E4F14428];
  }
LABEL_4:
  uint32_t v21 = (void *)[[NSString alloc] initWithFormat:@"%@ - %@", v15, v16];
  BOOL v22 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v23 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v24 = [v23 UUIDString];

  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"searchForOutputDevicesWithCategories", v24];
  uint64_t v26 = v25;
  if (v21) {
    [v25 appendFormat:@" for %@", v21];
  }
  if (v17) {
    [v26 appendFormat:@" because %@", v17];
  }
  BOOL v27 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v86 = v26;
    _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (a5 > 60.0) {
    a5 = 60.0;
  }
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke;
  v79[3] = &unk_1E57D7EB0;
  id v28 = v24;
  id v80 = v28;
  id v60 = v22;
  id v81 = v60;
  id v29 = v18;
  id v82 = v29;
  id v59 = v19;
  id v83 = v59;
  id v30 = (void *)MEMORY[0x1997190F0](v79);
  if (![v16 count])
  {

    id v16 = &unk_1EE66F420;
  }
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2;
  v76[3] = &unk_1E57D7ED8;
  id v31 = v28;
  id v77 = v31;
  id v32 = v15;
  id v78 = v32;
  uint64_t v33 = objc_msgSend(v16, "msv_compactMap:", v76);
  uint64_t v34 = [MRBlockGuard alloc];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_181;
  v73[3] = &unk_1E57D0DE0;
  id v35 = v30;
  id v75 = v35;
  id v36 = v33;
  id v74 = v36;
  uint64_t v37 = [(MRBlockGuard *)v34 initWithTimeout:v17 reason:v73 handler:a5];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2_182;
  v69[3] = &unk_1E57D7F00;
  id v58 = v37;
  id v70 = v58;
  id v38 = v35;
  id v72 = v38;
  id v39 = v36;
  id v71 = v39;
  id v40 = (void (**)(void, void, void, void))MEMORY[0x1997190F0](v69);
  if ([v39 count])
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = v39;
    uint64_t v41 = [obj countByEnumeratingWithState:&v65 objects:v84 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      id v53 = v39;
      id v54 = v31;
      id v55 = v32;
      id v56 = v29;
      id v57 = v16;
      uint64_t v43 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v66 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          uint64_t v46 = [v45 first];
          __int16 v47 = [v45 second];
          uint64_t v48 = [v47 category];
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_3;
          v62[3] = &unk_1E57D6110;
          __int16 v49 = v40;
          id v63 = v48;
          id v64 = v49;
          id v50 = v48;
          [v46 beginSearchWithTimeout:v62 completion:7.0];
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v65 objects:v84 count:16];
      }
      while (v42);
      id v16 = v57;
      id v29 = v56;
      id v31 = v54;
      id v32 = v55;
      id v39 = v53;
    }
    __int16 v51 = obj;
  }
  else
  {
    __int16 v51 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39 description:@"Could not resolve the input categories to anything"];
    ((void (**)(void, void, void, void *))v40)[2](v40, 0, 0, v51);
  }
}

void __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = @"activeCategory";
  if (v10) {
    BOOL v13 = v10;
  }
  uint64_t v14 = v13;
  id v15 = _MRLogForCategory(0xAuLL);
  id v16 = v15;
  if (!v9 || v12)
  {
    if (v12)
    {
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      uint64_t v23 = *(void *)(a1 + 32);
      id v18 = [MEMORY[0x1E4F1C9C8] date];
      [v18 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138544386;
      __int16 v47 = @"searchForOutputDevicesWithCategories";
      __int16 v48 = 2114;
      uint64_t v49 = v23;
      __int16 v50 = 2114;
      __int16 v51 = v12;
      __int16 v52 = 2114;
      id v53 = v14;
      __int16 v54 = 2048;
      uint64_t v55 = v24;
      _os_log_error_impl(&dword_194F3C000, v16, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_13;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    id v18 = [MEMORY[0x1E4F1C9C8] date];
    [v18 timeIntervalSinceDate:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138544130;
    __int16 v47 = @"searchForOutputDevicesWithCategories";
    __int16 v48 = 2114;
    uint64_t v49 = v25;
    __int16 v50 = 2114;
    __int16 v51 = v14;
    __int16 v52 = 2048;
    id v53 = v26;
    id v20 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    uint32_t v21 = v16;
    uint32_t v22 = 42;
  }
  else
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = [MEMORY[0x1E4F1C9C8] date];
    [v18 timeIntervalSinceDate:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138544386;
    __int16 v47 = @"searchForOutputDevicesWithCategories";
    __int16 v48 = 2114;
    uint64_t v49 = v17;
    __int16 v50 = 2112;
    __int16 v51 = v9;
    __int16 v52 = 2114;
    id v53 = v14;
    __int16 v54 = 2048;
    uint64_t v55 = v19;
    id v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
    uint32_t v21 = v16;
    uint32_t v22 = 52;
  }
  _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_13:

LABEL_14:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v27 = v11;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = [*(id *)(*((void *)&v41 + 1) + 8 * i) first];
        [v32 cancelSearch];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v29);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_171;
  block[3] = &unk_1E57D0EA8;
  uint64_t v33 = *(NSObject **)(a1 + 48);
  id v34 = *(id *)(a1 + 56);
  id v39 = v12;
  id v40 = v34;
  id v38 = v9;
  id v35 = v12;
  id v36 = v9;
  dispatch_async(v33, block);
}

uint64_t __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_171(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

id __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MRRequestDetails alloc];
  id v5 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", v3, *(void *)(a1 + 32)];
  uint64_t v6 = [(MRRequestDetails *)v4 initWithName:@"searchForOutputDevicesWithCategories" requestID:0 reason:v5];

  id v7 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:*(void *)(a1 + 40) outputDeviceGroupID:0 features:1 details:v6];
  if (![v3 length])
  {
    id v8 = 0;
    goto LABEL_5;
  }
  id v8 = [(Class)getAVAudioSessionClass_2[0]() auxiliarySession];
  id v18 = 0;
  char v9 = [v8 setCategory:v3 error:&v18];
  id v10 = v18;
  if (v9)
  {
    uint64_t v11 = [v8 opaqueSessionID];
    id v12 = [(MRAVReconnaissanceSession *)v7 discoverySession];
    [v12 setTargetAudioSessionID:v11];

LABEL_5:
    BOOL v13 = (void *)[objc_alloc(MEMORY[0x1E4F779D8]) initWithFirst:v7 second:v8];
    goto LABEL_9;
  }
  uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"Failed to set %@ category on aux content %@", v3, v10];
  id v15 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    id v20 = @"searchForOutputDevicesWithCategories";
    __int16 v21 = 2114;
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  BOOL v13 = 0;
LABEL_9:

  return v13;
}

uint64_t __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_181(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32), a2);
}

void __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2_182(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(result + 40) + 16))(*(void *)(result + 40), a2, *(void *)(result + 32));
  }
  return result;
}

+ (void)setSearchEndpointsForOutputDeviceUIDImplementation:(id)a3
{
  __searchEndpointsForOutputDeviceUIDImplementation = MEMORY[0x1997190F0](a3, a2);

  MEMORY[0x1F41817F8]();
}

+ (id)searchEndpointsForOutputDeviceUIDImplementation
{
  id v2 = (void *)MEMORY[0x1997190F0](__searchEndpointsForOutputDeviceUIDImplementation, a2);

  return v2;
}

@end