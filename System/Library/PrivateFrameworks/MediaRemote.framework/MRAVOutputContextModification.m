@interface MRAVOutputContextModification
+ (id)modifyOutputContextImplementation;
+ (void)setModifyOutputContextImplementation:(id)a3;
- (MRAVOutputContextModification)initWithRequest:(id)a3;
- (MRGroupTopologyModificationRequest)request;
- (void)modifyWithOutputContext:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation MRAVOutputContextModification

- (MRAVOutputContextModification)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVOutputContextModification;
  v6 = [(MRAVOutputContextModification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (void)modifyWithOutputContext:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(id)objc_opt_class() modifyOutputContextImplementation];

  if (v11)
  {
    v12 = [(id)objc_opt_class() modifyOutputContextImplementation];
    v13 = [(MRAVOutputContextModification *)self request];
    ((void (**)(void, void *, id, id, id))v12)[2](v12, v13, v8, v10, v9);
  }
  else
  {
    v14 = [MEMORY[0x1E4F1C9C8] date];
    v15 = [(MRGroupTopologyModificationRequest *)self->_request requestDetails];
    v16 = [v15 requestID];

    BOOL v17 = [(MRGroupTopologyModificationRequest *)self->_request shouldModifyPredictedRoutes];
    v18 = @"modifyOutputContext";
    if (v17) {
      v18 = @"modifyPredictedOutputDevices";
    }
    v19 = v18;
    qos_class_t v20 = qos_class_self();
    id v21 = [NSString alloc];
    v22 = [v8 contextID];
    uint64_t v23 = [v21 initWithFormat:@"contextID=%@", v22];

    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v19, v16];
    v25 = v24;
    if (v23) {
      [v24 appendFormat:@" for %@", v23];
    }
    v40 = (void *)v23;
    v26 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v25;
      _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke;
    v43[3] = &unk_1E57D2940;
    qos_class_t v49 = v20;
    v44 = v19;
    id v45 = v16;
    id v27 = v8;
    id v46 = v27;
    id v47 = v14;
    id v48 = v9;
    id v39 = v14;
    id v28 = v16;
    v29 = v19;
    v30 = (void *)MEMORY[0x1997190F0](v43);
    v31 = MRCreateXPCMessage(0x300000000000028uLL);
    v32 = [(MRAVOutputContextModification *)self request];
    v33 = [v32 data];
    MRAddDataToXPCMessage(v31, v33, "MRXPC_CONTEXT_MODIFICATION_DATA_KEY");

    v34 = [v27 uniqueIdentifier];
    MRAddStringToXPCMessage(v31, v34, "MRXPC_ROUTING_CONTEXT_UID_KEY");

    MRAddStringToXPCMessage(v31, v28, "MRXPC_MESSAGE_CUSTOM_ID_KEY");
    v35 = +[MRMediaRemoteServiceClient sharedServiceClient];
    v36 = [v35 service];
    v37 = [v36 mrXPCConnection];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_32;
    v41[3] = &unk_1E57D1490;
    id v42 = v30;
    id v38 = v30;
    [v37 sendMessage:v31 queue:v10 reply:v41];
  }
}

void __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = qos_class_self();
  if (!v3)
  {
    if (*(_DWORD *)(a1 + 72) != v4)
    {
      v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"priority degraded from %u -> %u", *(unsigned int *)(a1 + 72), v4);
      v14 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v15;
        __int16 v28 = 2114;
        uint64_t v29 = v16;
        __int16 v30 = 2112;
        id v31 = v13;
        _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }
    }
    BOOL v17 = [*(id *)(a1 + 48) contextID];

    v6 = _MRLogForCategory(0xAuLL);
    BOOL v18 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (!v18) {
        goto LABEL_18;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v22;
      __int16 v28 = 2114;
      uint64_t v29 = v23;
      __int16 v30 = 2048;
      id v31 = v24;
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
      goto LABEL_17;
    }
    if (!v18) {
      goto LABEL_18;
    }
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 48) contextID];
    v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v19;
    __int16 v28 = 2114;
    uint64_t v29 = v20;
    __int16 v30 = 2114;
    id v31 = v10;
    __int16 v32 = 2048;
    v33 = v21;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);
LABEL_12:

LABEL_17:
    goto LABEL_18;
  }
  id v5 = [*(id *)(a1 + 48) contextID];

  v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 48) contextID];
    v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544386;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    id v31 = v3;
    __int16 v32 = 2114;
    v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
    goto LABEL_12;
  }
  if (v7) {
    __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_cold_1((void *)a1, (uint64_t)v3, v6);
  }
LABEL_18:

  uint64_t v25 = *(void *)(a1 + 64);
  if (v25) {
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v3);
  }
}

void __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (id)MRCreateClientErrorFromXPCMessage(a2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)setModifyOutputContextImplementation:(id)a3
{
  __modifyOutputContextImplementation = MEMORY[0x1997190F0](a3, a2);

  MEMORY[0x1F41817F8]();
}

+ (id)modifyOutputContextImplementation
{
  v2 = (void *)MEMORY[0x1997190F0](__modifyOutputContextImplementation, a2);

  return v2;
}

- (MRGroupTopologyModificationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

void __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:a1[7]];
  int v10 = 138544130;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);
}

@end