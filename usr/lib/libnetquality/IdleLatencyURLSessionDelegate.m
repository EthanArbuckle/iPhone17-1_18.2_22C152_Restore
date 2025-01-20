@interface IdleLatencyURLSessionDelegate
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation IdleLatencyURLSessionDelegate

- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void *)MEMORY[0x21D4880C0](a4);
  id completionHandler = self->super._completionHandler;
  self->super._id completionHandler = v8;

  objc_storeStrong((id *)&self->super._request, a3);
  if (self->super._parallel)
  {
    unint64_t v11 = 0;
    *(void *)&long long v10 = 136315906;
    long long v16 = v10;
    do
    {
      v12 = [(NetworkQualityExecutions *)self->super._execution createDefaultNSURLSessionConfiguration];
      v13 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v12 delegate:self delegateQueue:self->super._queue];
      [(NSMutableArray *)self->super._sessions addObject:v13];
      v14 = [v13 dataTaskWithRequest:v7];
      [v14 set_hostOverride:self->super._testEndpoint];
      [(NSMutableArray *)self->super._tasks addObject:v14];
      netqual_log_init();
      v15 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        v18 = "-[IdleLatencyURLSessionDelegate executeTaskWithRequest:completionHandler:]";
        __int16 v19 = 1024;
        int v20 = 325;
        __int16 v21 = 2112;
        v22 = v14;
        __int16 v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_2192FE000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - Created IdleLatencyTask %@ on session %@", buf, 0x26u);
      }
      [v14 resume];

      ++v11;
    }
    while (v11 < self->super._parallel);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = v10;
  if (!v10)
  {
    p_tasks = &self->super._tasks;
    [(NSMutableArray *)self->super._tasks removeObject:v9];
    goto LABEL_7;
  }
  v12 = [v10 domain];
  if ([v12 isEqualToString:*MEMORY[0x263F08570]]) {
    BOOL v13 = [v11 code] == -999;
  }
  else {
    BOOL v13 = 0;
  }

  p_tasks = &self->super._tasks;
  [(NSMutableArray *)self->super._tasks removeObject:v9];
  if (v13)
  {
LABEL_7:
    if (![(NSMutableArray *)*p_tasks count] && !self->super._canceled)
    {
      error = self->super._error;
      id completionHandler = (void (**)(id, NSError *))self->super._completionHandler;
LABEL_14:
      completionHandler[2](completionHandler, error);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    -[IdleLatencyURLSessionDelegate URLSession:task:didCompleteWithError:]();
  }
  if (!self->super._canceled)
  {
    objc_storeStrong((id *)&self->super._error, a5);
    id completionHandler = (void (**)(id, NSError *))self->super._completionHandler;
    error = self->super._error;
    goto LABEL_14;
  }
LABEL_15:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(LatencyURLSessionDelegate *)self didFinishCollectingMetrics:v10 task:v9];
  if (v11 < 0) {
    goto LABEL_56;
  }
  unsigned int v12 = v11;
  BOOL v13 = [(NetworkQualityExecutionsResult *)self->super._results idleLatencyResults];
  id v14 = [v13 valueForKey:self->super._tcpKey];

  if (!v14)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    v15 = [(NetworkQualityExecutionsResult *)self->super._results idleLatencyResults];
    [v15 setObject:v14 forKey:self->super._tcpKey];
  }
  long long v16 = [(NetworkQualityExecutionsResult *)self->super._results idleLatencyResults];
  id v17 = [v16 valueForKey:self->super._tlsKey];

  if (!v17)
  {
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    v18 = [(NetworkQualityExecutionsResult *)self->super._results idleLatencyResults];
    [v18 setObject:v17 forKey:self->super._tlsKey];
  }
  __int16 v19 = [(NetworkQualityExecutionsResult *)self->super._results idleLatencyResults];
  uint64_t v20 = [v19 valueForKey:self->super._reqrespKey];

  v108 = (void *)v20;
  if (!v20)
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    v22 = [(NetworkQualityExecutionsResult *)self->super._results idleLatencyResults];
    v108 = v21;
    [v22 setObject:v21 forKey:self->super._reqrespKey];
  }
  __int16 v23 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
  uint64_t v24 = [v23 valueForKey:@"ecn_values"];

  v106 = (void *)v24;
  if (!v24)
  {
    id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v26 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
    v106 = v25;
    [v26 setObject:v25 forKey:@"ecn_values"];
  }
  v27 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
  uint64_t v28 = [v27 valueForKey:@"l4s_enablement"];

  v105 = (void *)v28;
  if (!v28)
  {
    id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v30 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
    v105 = v29;
    [v30 setObject:v29 forKey:@"l4s_enablement"];
  }
  v31 = [v10 transactionMetrics];
  v32 = [v31 objectAtIndex:v12];

  report = [v32 _establishmentReport];
  if (report)
  {
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x3032000000;
    v132 = __Block_byref_object_copy__0;
    v133 = __Block_byref_object_dispose__0;
    id v134 = 0;
    uint64_t v125 = 0;
    v126 = &v125;
    uint64_t v127 = 0x2020000000;
    uint64_t v128 = 0;
    uint64_t v121 = 0;
    v122 = &v121;
    uint64_t v123 = 0x2020000000;
    char v124 = 0;
    uint64_t v117 = 0;
    v118 = &v117;
    uint64_t v119 = 0x2020000000;
    uint64_t v120 = 0;
    enumerate_block[0] = MEMORY[0x263EF8330];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __76__IdleLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke;
    enumerate_block[3] = &unk_26439D1C8;
    v113 = &v129;
    v114 = &v125;
    id v112 = v10;
    v115 = &v121;
    v116 = &v117;
    nw_establishment_report_enumerate_protocols(report, enumerate_block);
    if (*((unsigned char *)v122 + 24))
    {
      v33 = [NSNumber numberWithUnsignedLongLong:v118[3]];
      [v14 addObject:v33];
    }
    uint64_t v34 = v130[5];
    if (!v34) {
      goto LABEL_20;
    }
    v35 = (void *)MEMORY[0x21D487E20]();
    if (MEMORY[0x21D487E30](v34, v35))
    {
    }
    else
    {
      uint64_t v36 = v130[5];
      v37 = (void *)nw_protocol_copy_quic_connection_definition();
      LODWORD(v36) = MEMORY[0x21D487E30](v36, v37);

      if (!v36)
      {
LABEL_20:
        id v109 = v106;
        id v110 = v105;
        nw_establishment_report_enumerate_protocol_l4s_state();

        _Block_object_dispose(&v117, 8);
        _Block_object_dispose(&v121, 8);
        _Block_object_dispose(&v125, 8);
        _Block_object_dispose(&v129, 8);

        goto LABEL_21;
      }
    }
    v38 = [NSNumber numberWithUnsignedLongLong:v126[3]];
    [v17 addObject:v38];

    goto LABEL_20;
  }
LABEL_21:
  id v104 = v9;
  v39 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
  id v40 = [v39 objectForKey:@"protocols_seen"];

  if (!v40)
  {
    id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v41 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
    [v41 setValue:v40 forKey:@"protocols_seen"];
  }
  v42 = [v32 networkProtocolName];
  uint64_t v43 = [v40 objectForKey:v42];
  if (v43) {
    v44 = (void *)v43;
  }
  else {
    v44 = &unk_26CAB1D68;
  }
  v45 = [NSNumber numberWithInt:[v44 intValue] + 1];

  [v40 setObject:v45 forKey:v42];
  v46 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
  id v47 = [v46 objectForKey:@"proxy_state"];

  if (!v47)
  {
    id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v48 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
    [v48 setValue:v47 forKey:@"proxy_state"];
  }
  v102 = v17;
  v103 = v14;
  int v49 = [v32 isProxyConnection];
  v50 = @"not_proxied";
  if (v49) {
    v50 = @"proxied";
  }
  v51 = v50;
  uint64_t v52 = [v47 objectForKey:v51];
  if (v52) {
    v53 = (void *)v52;
  }
  else {
    v53 = &unk_26CAB1D68;
  }
  v54 = [NSNumber numberWithInt:[v53 intValue] + 1];

  [v47 setObject:v54 forKey:v51];
  v55 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
  id v56 = [v55 objectForKey:@"interface-type"];

  v57 = &unk_26CAB1D68;
  if (!v56)
  {
    id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v58 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
    [v58 setValue:v56 forKey:@"interface-type"];
  }
  id v59 = [v32 _interfaceName];
  [v59 UTF8String];
  v60 = nw_interface_create_with_name();

  v61 = NSString;
  nw_interface_type_t type = nw_interface_get_type(v60);
  v63 = [v61 stringWithUTF8String:nw_interface_type_to_string(type)];
  uint64_t v64 = [v56 objectForKey:v63];
  if (v64) {
    v57 = (void *)v64;
  }
  v65 = [NSNumber numberWithInt:[v57 intValue] + 1];

  [v56 setObject:v65 forKey:v63];
  v66 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
  id v67 = [v66 objectForKey:@"rat"];

  if (!v67)
  {
    id v67 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v68 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
    [v68 setValue:v67 forKey:@"rat"];
  }
  if (nw_interface_get_radio_type())
  {
    v69 = [NSString stringWithUTF8String:nw_interface_radio_type_to_string()];
  }
  else
  {
    v69 = @"unknown";
  }

  uint64_t v70 = [v67 objectForKey:v69];

  if (v70) {
    v71 = (void *)v70;
  }
  else {
    v71 = &unk_26CAB1D68;
  }
  v72 = [NSNumber numberWithInt:[v71 intValue] + 1];

  [v67 setObject:v72 forKey:v69];
  v73 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
  id v74 = [v73 objectForKey:@"multipath"];

  v75 = &unk_26CAB1D68;
  if (!v74)
  {
    id v74 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v76 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
    [v76 setValue:v74 forKey:@"multipath"];
  }
  int v77 = [v32 isMultipath];
  v78 = @"disabled";
  if (v77) {
    v78 = @"enabled";
  }
  v79 = v78;
  uint64_t v80 = [v74 objectForKey:v79];
  if (v80) {
    v75 = (void *)v80;
  }
  v81 = [NSNumber numberWithInt:[v75 intValue] + 1];

  [v74 setObject:v81 forKey:v79];
  v82 = NSNumber;
  v83 = [v32 responseEndDate];
  v84 = [v32 requestStartDate];
  [v83 timeIntervalSinceDate:v84];
  v86 = [v82 numberWithInt:(int)(v85 * 1000.0)];
  [v108 addObject:v86];

  id v87 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v87 addObjectsFromArray:v103];
  [v87 addObjectsFromArray:v102];
  [v87 addObjectsFromArray:v108];
  v88 = NSNumber;
  *(float *)&double v89 = get_average(v87);
  v90 = [v88 numberWithFloat:v89];
  v91 = [(NetworkQualityResult *)self->super._results latency];
  [v91 setValue:v90];

  v92 = [(NetworkQualityResult *)self->super._results latency];
  [v92 updateConfidence:3];

  if ([v103 count])
  {
    v93 = NSNumber;
    *(float *)&double v94 = get_average(v103);
    v95 = [v93 numberWithFloat:v94];
    [(NetworkQualityResult *)self->super._results setTcpLatency:v95];
  }
  id v9 = v104;
  if ([v102 count])
  {
    v96 = NSNumber;
    *(float *)&double v97 = get_average(v102);
    v98 = [v96 numberWithFloat:v97];
    [(NetworkQualityResult *)self->super._results setTlsLatency:v98];
  }
  v99 = NSNumber;
  *(float *)&double v100 = get_average(v108);
  v101 = [v99 numberWithFloat:v100];
  [(NetworkQualityResult *)self->super._results setHttpLatency:v101];

  [(LatencyURLSessionDelegate *)self shareProgress];
LABEL_56:
}

uint64_t __76__IdleLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  if (([*(id *)(a1 + 32) isProxy] & 1) == 0)
  {
    nw_protocol_definition_t v7 = nw_protocol_copy_tcp_definition();
    int v8 = MEMORY[0x21D487E30](v6, v7);

    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
    }
  }

  return 1;
}

uint64_t __76__IdleLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, int a5)
{
  id v8 = a2;
  nw_protocol_definition_t v9 = nw_protocol_copy_tcp_definition();
  if (MEMORY[0x21D487E30](v8, v9))
  {
  }
  else
  {
    id v10 = (void *)nw_protocol_copy_quic_connection_definition();
    int v11 = MEMORY[0x21D487E30](v8, v10);

    if (!v11)
    {
      uint64_t v21 = 1;
      goto LABEL_13;
    }
  }
  unsigned int v12 = [NSString stringWithUTF8String:nw_connection_client_accurate_ecn_state_to_string(a3)];
  uint64_t v13 = [*(id *)(a1 + 32) objectForKey:v12];
  if (v13) {
    id v14 = (void *)v13;
  }
  else {
    id v14 = &unk_26CAB1D68;
  }
  v15 = [NSNumber numberWithInt:[v14 intValue] + 1];

  [*(id *)(a1 + 32) setObject:v15 forKey:v12];
  long long v16 = @"disabled";
  if (a5) {
    long long v16 = @"enabled";
  }
  id v17 = *(void **)(a1 + 40);
  v18 = v16;
  __int16 v19 = [v17 objectForKey:v18];

  if (!v19) {
    __int16 v19 = &unk_26CAB1D68;
  }
  uint64_t v20 = [NSNumber numberWithInt:[v19 intValue] + 1];

  [*(id *)(a1 + 40) setObject:v20 forKey:v18];
  uint64_t v21 = 0;
LABEL_13:

  return v21;
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Load failed with error: %@", v2, v3, v4, v5, 2u);
}

@end