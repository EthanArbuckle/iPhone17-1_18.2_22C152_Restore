@interface NPTunnelFlowTelemetry
- (BOOL)isBestEffort;
- (NPTunnelFlowTelemetry)initWithTunnel:(id)a3 service:(id)a4 postURL:(id)a5;
- (void)reportTelemetry:(id)a3;
@end

@implementation NPTunnelFlowTelemetry

- (NPTunnelFlowTelemetry)initWithTunnel:(id)a3 service:(id)a4 postURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(NPFlowProperties);
  uint64_t v12 = serviceNameToID(v9);

  [(NPFlowProperties *)v11 setServiceID:v12];
  v15.receiver = self;
  v15.super_class = (Class)NPTunnelFlowTelemetry;
  v13 = [(NPTunnelFlowHTTP *)&v15 initWithTunnel:v10 URL:v8 extraFlowProperties:v11];

  return v13;
}

- (void)reportTelemetry:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v14 = 0;
  v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v14];
  id v6 = v14;
  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v7 = [(NPTunnelFlow *)self tunnel];
    id v8 = [v7 parameters];
    id v9 = (void *)nw_parameters_copy_context();
    v13[5] = MEMORY[0x1E4F143A8];
    v13[6] = 3221225472;
    v13[7] = __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke;
    v13[8] = &unk_1E5A3C660;
    v13[9] = self;
    v13[10] = &buf;
    uint64_t source = nw_queue_context_create_source();

    *(void *)(*((void *)&buf + 1) + 24) = source;
    dispatch_time(0, 5000000000);
    nw_queue_set_timer_values();
    nw_queue_resume_source();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke_2;
    v13[3] = &unk_1E5A3C688;
    v13[4] = &buf;
    [(NPTunnelFlowHTTP *)self postData:v5 withCompletionHandler:v13];
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to create telemetry JSON: %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v12 = [(NPTunnelFlow *)self tunnel];
    [v12 closeFlow:self];

    [(NPTunnelFlow *)self closeFromTunnel];
  }
}

uint64_t __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    nw_queue_cancel_source();
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  v2 = [*(id *)(a1 + 32) tunnel];
  [v2 closeFlow:*(void *)(a1 + 32)];

  v3 = *(void **)(a1 + 32);
  return [v3 closeFromTunnel];
}

void __41__NPTunnelFlowTelemetry_reportTelemetry___block_invoke_2(uint64_t a1, char a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    nw_queue_cancel_source();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  if ((a2 & 1) == 0)
  {
    id v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_ERROR, "Failed to post telemetry data", v5, 2u);
    }
  }
}

- (BOOL)isBestEffort
{
  return 1;
}

@end