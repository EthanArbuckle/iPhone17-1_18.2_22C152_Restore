@interface NPAppProxyFlowBridge
- (NPAppProxyFlowBridge)initWithAppProxyFlow:(id)a3 nwContext:(id)a4;
- (uint64_t)closeAllWithError:(uint64_t)a1;
- (void)closeFlowWithError:(uint64_t)a1;
- (void)readDataFromClient;
- (void)readDataFromConnection;
- (void)startConnection;
- (void)writeDataToConnection:(uint64_t)a1;
@end

@implementation NPAppProxyFlowBridge

- (NPAppProxyFlowBridge)initWithAppProxyFlow:(id)a3 nwContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPAppProxyFlowBridge;
  v9 = [(NPAppProxyFlowBridge *)&v18 init];
  if (v9)
  {
    kdebug_trace();
    uint64_t v10 = os_transaction_create();
    networkTransaction = v9->_networkTransaction;
    v9->_networkTransaction = (OS_os_transaction *)v10;

    objc_storeStrong((id *)&v9->_flow, a3);
    dispatch_queue_t v12 = dispatch_queue_create("NPAppProxyFlowBridge queue", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    uint64_t v15 = objc_msgSend(objc_getProperty(v9, v14, 16, 1), "remoteEndpoint");
    remoteEndpoint = v9->_remoteEndpoint;
    v9->_remoteEndpoint = (NWEndpoint *)v15;

    objc_storeStrong((id *)&v9->_nwContext, a4);
    -[NPAppProxyFlowBridge startConnection]((nw_connection_t *)v9);
  }

  return v9;
}

- (void)startConnection
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = nw_parameters_create();
    id v4 = objc_getProperty(a1, v3, 16, 1);
    objc_opt_class();
    objc_opt_isKindOfClass();

    nw_parameters_set_data_mode();
    v6 = objc_msgSend(objc_getProperty(a1, v5, 16, 1), "metaData");
    id v7 = [v6 sourceAppAuditToken];

    if (v7)
    {
      v9 = objc_msgSend(objc_getProperty(a1, v8, 16, 1), "metaData");
      id v10 = [v9 sourceAppAuditToken];
      v11 = (_OWORD *)[v10 bytes];

      long long v12 = v11[1];
      v39[0] = *v11;
      v39[1] = v12;
      v13 = +[NPUtilities machoUUIDFromPID:](NPUtilities, "machoUUIDFromPID:", +[NPUtilities pidFromAuditToken:v39]);
      v39[0] = 0uLL;
      [v13 getUUIDBytes:v39];
      nw_parameters_set_e_proc_uuid();
    }
    nw_parameters_set_account_id();
    nw_parameters_set_indefinite();
    nw_parameters_set_context();
    uint64_t v15 = objc_msgSend(objc_getProperty(a1, v14, 16, 1), "remoteHostname");

    id Property = objc_getProperty(a1, v16, 24, 1);
    if (v15)
    {
      id v18 = Property;
      v20 = objc_msgSend(objc_getProperty(a1, v19, 16, 1), "remoteHostname");
      v21 = (const char *)[v20 UTF8String];
      v22 = [v18 port];

      id v23 = v22;
      host = nw_endpoint_create_host(v21, (const char *)[v23 UTF8String]);
    }
    else
    {
      host = [Property copyCEndpoint];
    }
    nw_connection_t v25 = nw_connection_create(host, v2);
    nw_connection_t v26 = a1[4];
    a1[4] = v25;

    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __39__NPAppProxyFlowBridge_startConnection__block_invoke;
    v37 = &unk_1E5A3B240;
    v38 = a1;
    nw_connection_set_cancel_handler();
    nw_connection_t v27 = a1[4];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __39__NPAppProxyFlowBridge_startConnection__block_invoke_2;
    v32[3] = &unk_1E5A3BF30;
    v32[4] = a1;
    v33 = host;
    v28 = host;
    MEMORY[0x1A622AEF0](v27, v32);
    v29 = a1[4];
    v31 = objc_getProperty(a1, v30, 40, 1);
    nw_connection_set_queue(v29, v31);
    nw_connection_start(a1[4]);
  }
}

void __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    SEL v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) hash];
      *(_DWORD *)buf = 134218242;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "Failed to open flow %lu: %@", buf, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      id Property = objc_getProperty(v7, v6, 40, 1);
      uint64_t v9 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v9 = 0;
      id Property = 0;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke_2;
    v13[3] = &unk_1E5A3BE18;
    v13[4] = v9;
    id v14 = v4;
    dispatch_async(Property, v13);
  }
  else
  {
    id v10 = *(_DWORD **)(a1 + 32);
    if (v10)
    {
      [(NPAppProxyFlowBridge *)v10 readDataFromClient];
      [(NPAppProxyFlowBridge *)v10 readDataFromConnection];
    }
  }
}

uint64_t __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke_2(uint64_t a1)
{
  return -[NPAppProxyFlowBridge closeAllWithError:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)closeAllWithError:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    SEL v5 = *(NSObject **)(a1 + 32);
    id v8 = v4;
    if (v5)
    {
      nw_connection_cancel(v5);
      v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
    -[NPAppProxyFlowBridge closeFlowWithError:](a1, v8);
    id v4 = v8;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)readDataFromClient
{
  if (result)
  {
    v2 = result;
    id Property = objc_getProperty(result, a2, 16, 1);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__NPAppProxyFlowBridge_readDataFromClient__block_invoke;
    v4[3] = &unk_1E5A3BF08;
    v4[4] = v2;
    return (void *)[Property readDataWithCompletionHandler:v4];
  }
  return result;
}

- (void)readDataFromConnection
{
  if (a1 && objc_getProperty(a1, a2, 32, 1) && (a1[3] & 0xFFFFFFFE) != 4)
  {
    id Property = objc_getProperty(a1, v3, 32, 1);
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __46__NPAppProxyFlowBridge_readDataFromConnection__block_invoke;
    completion[3] = &unk_1E5A3BEB8;
    completion[4] = a1;
    nw_connection_receive(Property, 0, 0xFFFFFFFF, completion);
  }
}

- (void)closeFlowWithError:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = *(void **)(a1 + 16);
    if (v3)
    {
      [v3 closeReadWithError:v6];
      [*(id *)(a1 + 16) closeWriteWithError:v6];
      id v4 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
    SEL v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;
  }
}

- (void)writeDataToConnection:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && objc_getProperty((id)a1, v3, 32, 1))
  {
    int v6 = *(_DWORD *)(a1 + 12);
    id Property = objc_getProperty((id)a1, v5, 32, 1);
    id v8 = *MEMORY[0x1E4F38C60];
    if (v6 == 3)
    {
      char v9 = *(unsigned char *)(a1 + 9);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__NPAppProxyFlowBridge_writeDataToConnection___block_invoke;
      v12[3] = &unk_1E5A3BE90;
      v12[4] = a1;
      id v10 = v12;
      v11 = v4;
    }
    else
    {
      id v10 = (void *)*MEMORY[0x1E4F38C50];
      v11 = v4;
      char v9 = 0;
    }
    nw_connection_send(Property, v11, v8, v9, v10);
  }
}

void __46__NPAppProxyFlowBridge_writeDataToConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v6 = v3;
  if (v3)
  {
    CFErrorRef v4 = nw_error_copy_cf_error(v3);
    -[NPAppProxyFlowBridge closeAllWithError:](*(void *)(a1 + 32), v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 9)) {
      -[NPAppProxyFlowBridge closeAllWithError:](v5, 0);
    }
    else {
      -[NPAppProxyFlowBridge readDataFromClient]();
    }
  }
}

uint64_t __56__NPAppProxyFlowBridge_handleDataWriteToFlowCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2) {
    return -[NPAppProxyFlowBridge closeAllWithError:](v1, v2);
  }
  if (*(unsigned char *)(v1 + 8))
  {
    v2 = *(void **)(v1 + 56);
    return -[NPAppProxyFlowBridge closeAllWithError:](v1, v2);
  }
  return -[NPAppProxyFlowBridge readDataFromConnection]();
}

void __40__NPAppProxyFlowBridge_writeDataToFlow___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  if (v2)
  {
    id Property = objc_getProperty(v2, v3, 40, 1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__NPAppProxyFlowBridge_handleDataWriteToFlowCompletion___block_invoke;
    v6[3] = &unk_1E5A3BE18;
    id v7 = v4;
    id v8 = v2;
    dispatch_async(Property, v6);
  }
}

void __46__NPAppProxyFlowBridge_readDataFromConnection__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v22 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v12 = v10;
  if (v10 || a4)
  {
    if (v10) {
      CFErrorRef v13 = nw_error_copy_cf_error(v10);
    }
    else {
      CFErrorRef v13 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v13);
    if (v12) {

    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
  id v14 = *(unsigned char **)(a1 + 32);
  if (v22)
  {
    if (v14)
    {
      id v15 = v22;
      id Property = objc_getProperty(v14, v16, 16, 1);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __40__NPAppProxyFlowBridge_writeDataToFlow___block_invoke;
      v23[3] = &unk_1E5A3BE40;
      v23[4] = v14;
      [Property writeData:v15 withCompletionHandler:v23];
    }
  }
  else if (v14[8])
  {
    id v19 = objc_getProperty(*(id *)(a1 + 32), v11, 16, 1);
    v20 = *(void **)(a1 + 32);
    if (v20) {
      id v21 = objc_getProperty(v20, v18, 56, 1);
    }
    else {
      id v21 = 0;
    }
    objc_msgSend(v19, "closeWriteWithError:", v21, 0);
  }
}

void __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 code] != 10)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    -[NPAppProxyFlowBridge closeAllWithError:](v11, v12);
  }
  else
  {
    id v3 = *(void **)(a1 + 48);
    if (v3 && [v3 length])
    {
      uint64_t v14 = 0;
      id v15 = &v14;
      uint64_t v16 = 0x3032000000;
      __int16 v17 = __Block_byref_object_copy__2;
      id v18 = __Block_byref_object_dispose__2;
      id v19 = *(id *)(a1 + 48);
      id v4 = (const void *)[v19 bytes];
      size_t v6 = [(id)v15[5] length];
      id v7 = *(void **)(a1 + 40);
      if (v7) {
        id Property = objc_getProperty(v7, v5, 40, 1);
      }
      else {
        id Property = 0;
      }
      destructor[0] = MEMORY[0x1E4F143A8];
      destructor[1] = 3221225472;
      destructor[2] = __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke_2;
      destructor[3] = &unk_1E5A3BEE0;
      destructor[4] = &v14;
      dispatch_data_t v9 = dispatch_data_create(v4, v6, Property, destructor);
      -[NPAppProxyFlowBridge writeDataToConnection:](*(void *)(a1 + 40), v9);

      _Block_object_dispose(&v14, 8);
    }
    else
    {
      [*(id *)(*(void *)(a1 + 40) + 16) closeReadWithError:0];
      *(unsigned char *)(*(void *)(a1 + 40) + 9) = 1;
      uint64_t v10 = *(void *)(a1 + 40);
      -[NPAppProxyFlowBridge writeDataToConnection:](v10, 0);
    }
  }
}

void __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __42__NPAppProxyFlowBridge_readDataFromClient__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = a3;
  if (v4)
  {
    id Property = objc_getProperty(v4, v6, 40, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke;
    block[3] = &unk_1E5A3B178;
    id v10 = v7;
    uint64_t v11 = v4;
    id v12 = v5;
    dispatch_async(Property, block);
  }
}

uint64_t __39__NPAppProxyFlowBridge_startConnection__block_invoke(uint64_t a1)
{
  return -[NPAppProxyFlowBridge closeAllWithError:](*(void *)(a1 + 32), 0);
}

void __39__NPAppProxyFlowBridge_startConnection__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    size_t v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v7, 16, 1);
      }
      uint64_t v15 = [Property hash];
      uint64_t v16 = *(void *)(a1 + 40);
      int error_code = nw_error_get_error_code(v5);
      *(_DWORD *)id v18 = 134218498;
      *(void *)&v18[4] = v15;
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v16;
      *(_WORD *)&v18[22] = 2080;
      id v19 = strerror(error_code);
      _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "Bridge %lu: nw_connection with [%@] received error: %s", v18, 0x20u);
    }

    CFErrorRef v8 = nw_error_copy_cf_error(v5);
    -[NPAppProxyFlowBridge closeAllWithError:](*(void *)(a1 + 32), v8);

    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    *(_DWORD *)(v9 + 12) = a2;
  }
  if ((a2 - 4) < 2)
  {
LABEL_9:
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      *(_DWORD *)(v10 + 12) = 5;
      uint64_t v11 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v11 = 0;
    }
    -[NPAppProxyFlowBridge closeFlowWithError:](v11, 0);
    goto LABEL_14;
  }
  if (a2 != 3)
  {
    if (a2) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    CFErrorRef v13 = *(void **)(v12 + 16);
    *(void *)id v18 = MEMORY[0x1E4F143A8];
    *(void *)&v18[8] = 3221225472;
    *(void *)&v18[16] = __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke;
    id v19 = (char *)&unk_1E5A3BE40;
    uint64_t v20 = v12;
    [v13 openWithLocalEndpoint:0 completionHandler:v18];
  }
LABEL_14:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwContext, 0);
  objc_storeStrong((id *)&self->_connectionError, 0);
  objc_storeStrong((id *)&self->_networkTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end