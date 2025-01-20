@interface NPTunnelFlowProtocol
- (BOOL)addBufferToFrameArray:(nw_frame_array_s *)a3 bufferSize:(unint64_t)a4;
- (BOOL)connect;
- (BOOL)isClientFlowClosed;
- (BOOL)waitingForOutput;
- (NPTunnelFlowProtocol)initWithTunnel:(id)a3 appRule:(id)a4 inputProtocol:(nw_protocol *)a5 extraProperties:(id)a6;
- (nw_protocol)inputProtocol;
- (unsigned)addInputFramesToArray:(nw_frame_array_s *)a3 limitMinimumBytes:(unsigned int)a4 limitMaximumBytes:(unsigned int)a5 limitMaximumFrames:(unsigned int)a6;
- (unsigned)addOutputFramesToArray:(nw_frame_array_s *)a3 limitMinimumBytes:(unsigned int)a4 limitMaximumBytes:(unsigned int)a5 limitMaximumFrames:(unsigned int)a6;
- (void)closeClientFlowWithError:(int)a3;
- (void)disconnect;
- (void)dropInputProtocol;
- (void)handleAppData:(id)a3;
- (void)handleOutputFrame:(id)a3 send:(BOOL)a4;
- (void)handleTunnelReadyForData;
- (void)notifyClientConnected;
- (void)readDataFromClient;
- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4;
@end

@implementation NPTunnelFlowProtocol

- (NPTunnelFlowProtocol)initWithTunnel:(id)a3 appRule:(id)a4 inputProtocol:(nw_protocol *)a5 extraProperties:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unsigned int v13 = [v12 flowIdentifier];
  if (v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)NPTunnelFlowProtocol;
    v14 = [(NPTunnelFlow *)&v19 initWithTunnel:v10 appRule:v11 hashKey:v13 extraFlowProperties:v12];
    if (v14) {
      v14->_inputProtocol = a5;
    }
    self = v14;
    v15 = self;
  }
  else
  {
    v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_ERROR, "No flow ID available, failed to create a flow", v18, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (void)dropInputProtocol
{
  self->_inputProtocol = 0;
}

- (BOOL)connect
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  inputProtocol = self->_inputProtocol;
  v4 = (*((void (**)(nw_protocol *, SEL))inputProtocol->callbacks + 17))(inputProtocol, a2);
  v5 = (*((void (**)(nw_protocol *))inputProtocol->callbacks + 14))(inputProtocol);
  [(NPTunnelFlow *)self hashKey];
  kdebug_trace();
  v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = [(NPTunnelFlow *)self hashKey];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = nw_endpoint_get_description();
    _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEFAULT, "Flow %llu is connecting with endpoint %s", buf, 0x16u);
  }

  if ([(NPTunnelFlow *)self shouldComposeIntialData])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    v7 = [(NPTunnelFlow *)self extraFlowProperties];
    id v23 = [v7 requestData];

    v8 = *(void **)(*(void *)&buf[8] + 40);
    if (v8)
    {
      v9 = (const void *)[v8 bytes];
      size_t v10 = [*(id *)(*(void *)&buf[8] + 40) length];
      id v11 = dispatch_get_global_queue(0, 0);
      destructor[0] = MEMORY[0x1E4F143A8];
      destructor[1] = 3221225472;
      destructor[2] = __31__NPTunnelFlowProtocol_connect__block_invoke;
      destructor[3] = &unk_1E5A3BEE0;
      destructor[4] = buf;
      id v12 = dispatch_data_create(v9, v10, v11, destructor);
    }
    else
    {
      id v12 = 0;
    }
    _Block_object_dispose(buf, 8);

    self->_connectedOnInitialData = 1;
    if (v12)
    {
      self->_discardFirstData = 1;
      [(NPTunnelFlowProtocol *)self handleAppData:v12];
      goto LABEL_20;
    }
  }
  else
  {
    self->_connectedOnInitialData = 1;
  }
  if (v5
    && ![(NPTunnelFlow *)self shouldComposeIntialData]
    && ((nw_parameters_get_tfo() & 1) != 0 || nw_parameters_has_initial_data_payload()))
  {
    v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = [(NPTunnelFlow *)self hashKey];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v16;
      _os_log_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_DEFAULT, "Flow %llu has initial data or TFO is enabled, waiting for output", buf, 0xCu);
    }

    self->_waitingForOutput = 1;
    v17 = (void (*)(nw_protocol *, uint64_t))*((void *)inputProtocol->callbacks + 5);
    id v12 = [(NPTunnelFlow *)self tunnel];
    v17(inputProtocol, [v12 protocol]);
  }
  else
  {
    unsigned int v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = [(NPTunnelFlow *)self hashKey];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v14;
      _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEFAULT, "Flow %llu has no initial data", buf, 0xCu);
    }

    self->_connectedOnTunnelReadyForData = 1;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    [(NPTunnelFlowProtocol *)self handleAppData:v12];
  }
LABEL_20:

  return 1;
}

void __31__NPTunnelFlowProtocol_connect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)disconnect
{
  [(NPTunnelFlow *)self setDisconnectedByApp:1];
  if (!self->_disconnectedByTunnel)
  {
    [(NPTunnelFlowProtocol *)self handleAppData:0];
  }
}

- (void)closeClientFlowWithError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  inputProtocol = self->_inputProtocol;
  if (![(NPTunnelFlow *)self disconnectedByApp] && inputProtocol)
  {
    if (self->_disconnectedByTunnel)
    {
      if (!v3) {
        return;
      }
      goto LABEL_11;
    }
    self->_disconnectedByTunnel = 1;
    inputBuffer = self->_inputBuffer;
    if (inputBuffer)
    {
      if (!v3)
      {
        if (dispatch_data_get_size(inputBuffer)) {
          return;
        }
        goto LABEL_16;
      }
    }
    else if (!v3)
    {
LABEL_16:
      id v12 = nplog_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 134217984;
        unint64_t v15 = [(NPTunnelFlow *)self hashKey];
        _os_log_debug_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEBUG, "Flow %llu notifying input protocol that input is finished", (uint8_t *)&v14, 0xCu);
      }

      unsigned int v13 = (void (*)(nw_protocol *, uint64_t))*((void *)inputProtocol->callbacks + 23);
      v9 = [(NPTunnelFlow *)self tunnel];
      v13(inputProtocol, [v9 protocol]);
      goto LABEL_14;
    }
LABEL_11:
    v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      unint64_t v15 = [(NPTunnelFlow *)self hashKey];
      __int16 v16 = 2080;
      v17 = strerror(v3);
      _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "Flow %llu notifying input protocol of error: %s", (uint8_t *)&v14, 0x16u);
    }

    v8 = (void (*)(nw_protocol *, uint64_t, uint64_t))*((void *)inputProtocol->callbacks + 7);
    v9 = [(NPTunnelFlow *)self tunnel];
    v8(inputProtocol, [v9 protocol], v3);
LABEL_14:

    size_t v10 = (void (*)(nw_protocol *, uint64_t))*((void *)inputProtocol->callbacks + 6);
    id v11 = [(NPTunnelFlow *)self tunnel];
    v10(inputProtocol, [v11 protocol]);
  }
}

- (BOOL)isClientFlowClosed
{
  return self->_disconnectedByTunnel;
}

- (void)notifyClientConnected
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_connectedOnInitialData = 0;
  self->_connectedOnTunnelReadyForData = 0;
  inputProtocol = self->_inputProtocol;
  if (inputProtocol)
  {
    v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = [(NPTunnelFlow *)self hashKey];
      _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "Flow %llu is now connected", (uint8_t *)&v7, 0xCu);
    }

    [(NPTunnelFlow *)self hashKey];
    kdebug_trace();
    v5 = (void (*)(nw_protocol *, uint64_t))*((void *)inputProtocol->callbacks + 5);
    v6 = [(NPTunnelFlow *)self tunnel];
    v5(inputProtocol, [v6 protocol]);
  }
}

- (void)handleTunnelReadyForData
{
  if (self->_connectedOnTunnelReadyForData)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    [(NPTunnelFlowProtocol *)self sendDataToClient:v3 fromTunnel:1];
  }
}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  BOOL v4 = a4;
  data2 = (dispatch_data_t)a3;
  inputProtocol = self->_inputProtocol;
  if (!inputProtocol
    || [(NPTunnelFlow *)self disconnectedByApp]
    || ![(NPTunnelFlow *)self shouldSendDataToClient:data2 fromTunnel:v4])
  {
    if (!v4) {
      goto LABEL_12;
    }
    id v11 = [(NPTunnelFlow *)self tunnel];
    objc_msgSend(v11, "acknowledgeData:sentToFlow:", -[NSObject length](data2, "length"), self);
    goto LABEL_11;
  }
  if (self->_connectedOnInitialData) {
    [(NPTunnelFlowProtocol *)self notifyClientConnected];
  }
  if ([data2 length])
  {
    p_inputBuffer = &self->_inputBuffer;
    inputBuffer = self->_inputBuffer;
    if (inputBuffer)
    {
      dispatch_data_t concat = dispatch_data_create_concat(inputBuffer, data2);
      id v11 = *p_inputBuffer;
      *p_inputBuffer = (OS_dispatch_data *)concat;
    }
    else
    {
      objc_storeStrong((id *)&self->_inputBuffer, a3);
      kdebug_trace();
      id v12 = [(NPTunnelFlow *)self tunnel];
      uint64_t v13 = [v12 timestamps];
      if (v13 && g_recordTimestamps && !*(void *)(v13 + 104)) {
        *(void *)(v13 + 104) = mach_absolute_time();
      }

      int v14 = (void (*)(nw_protocol *, uint64_t))*((void *)inputProtocol->callbacks + 8);
      id v11 = [(NPTunnelFlow *)self tunnel];
      v14(inputProtocol, [v11 protocol]);
    }
LABEL_11:
  }
LABEL_12:
}

- (void)readDataFromClient
{
  inputProtocol = self->_inputProtocol;
  if (inputProtocol && ![(NPTunnelFlow *)self disconnectedByApp])
  {
    kdebug_trace();
    BOOL v4 = (void (*)(nw_protocol *, uint64_t))*((void *)inputProtocol->callbacks + 9);
    id v5 = [(NPTunnelFlow *)self tunnel];
    v4(inputProtocol, [v5 protocol]);
  }
}

- (unsigned)addInputFramesToArray:(nw_frame_array_s *)a3 limitMinimumBytes:(unsigned int)a4 limitMaximumBytes:(unsigned int)a5 limitMaximumFrames:(unsigned int)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  int v51 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  int v47 = 0;
  inputBuffer = self->_inputBuffer;
  if (inputBuffer) {
    BOOL v11 = dispatch_data_get_size(inputBuffer) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL disconnectedByTunnel = self->_disconnectedByTunnel;
  inputProtocol = self->_inputProtocol;
  nw_frame_array_init();
  if (!a5 || !a6)
  {
    uint64_t v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v34 = [(NPTunnelFlow *)self hashKey];
      *(_DWORD *)buf = 134218496;
      unint64_t v53 = v34;
      __int16 v54 = 1024;
      unsigned int v55 = a6;
      __int16 v56 = 1024;
      unsigned int v57 = a5;
      _os_log_debug_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEBUG, "Flow %llu Maximum frame count (%u) and/or maximum byte count (%u) is 0", buf, 0x18u);
    }
  }
  if (v11)
  {
    int v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v35 = [(NPTunnelFlow *)self hashKey];
      *(_DWORD *)buf = 134217984;
      unint64_t v53 = v35;
      _os_log_debug_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEBUG, "Flow %llu no input data currently available", buf, 0xCu);
    }
    BOOL v15 = disconnectedByTunnel;

    if (inputProtocol) {
      BOOL v16 = v15;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v36 = [(NPTunnelFlow *)self hashKey];
        *(_DWORD *)buf = 134217984;
        unint64_t v53 = v36;
        _os_log_debug_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEBUG, "Flow %llu notifying input protocol that input is finished", buf, 0xCu);
      }

      uint64_t v18 = (void (*)(nw_protocol *, uint64_t))*((void *)inputProtocol->callbacks + 23);
      objc_super v19 = [(NPTunnelFlow *)self tunnel];
      v18(inputProtocol, [v19 protocol]);
    }
LABEL_23:
    unsigned int v23 = 0;
    goto LABEL_39;
  }
  v20 = self->_inputBuffer;
  size_t size = dispatch_data_get_size(v20);
  if (size < a4)
  {
    v22 = nplog_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v53 = size;
      __int16 v54 = 1024;
      unsigned int v55 = a4;
      _os_log_debug_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_DEBUG, "Available input data (%lu bytes) is smaller than minimum bytes requested (%u bytes)", buf, 0x12u);
    }

    goto LABEL_23;
  }
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __101__NPTunnelFlowProtocol_addInputFramesToArray_limitMinimumBytes_limitMaximumBytes_limitMaximumFrames___block_invoke;
  applier[3] = &unk_1E5A3BF58;
  applier[4] = &v48;
  applier[5] = &v44;
  applier[6] = a3;
  unsigned int v42 = a5;
  unsigned int v43 = a6;
  dispatch_data_apply(v20, applier);
  size_t v24 = *((unsigned int *)v45 + 6);
  if (size > v24)
  {
    subrange = (OS_dispatch_data *)dispatch_data_create_subrange((dispatch_data_t)self->_inputBuffer, v24, size - v24);
    v26 = self->_inputBuffer;
    self->_inputBuffer = subrange;
LABEL_29:

    goto LABEL_30;
  }
  v27 = self->_inputBuffer;
  self->_inputBuffer = 0;

  if (self->_disconnectedByTunnel)
  {
    v26 = (*((void (**)(void))self->_inputProtocol->callbacks + 14))();
    if (v26)
    {
      v28 = (void *)nw_parameters_copy_context();
      nw_queue_context_async();
    }
    goto LABEL_29;
  }
LABEL_30:
  if ([(NPTunnelFlow *)self state] == 3)
  {
    v29 = [(NPTunnelFlow *)self tunnel];
    [v29 acknowledgeData:*((unsigned int *)v45 + 6) sentToFlow:self];
  }
  v30 = nplog_obj();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v37 = [(NPTunnelFlow *)self hashKey];
    unsigned int v38 = *((_DWORD *)v45 + 6);
    *(_DWORD *)buf = 134218240;
    unint64_t v53 = v37;
    __int16 v54 = 1024;
    unsigned int v55 = v38;
    _os_log_debug_impl(&dword_1A0FEE000, v30, OS_LOG_TYPE_DEBUG, "Flow %llu app read %u bytes", buf, 0x12u);
  }

  v31 = [(NPTunnelFlow *)self tunnel];
  uint64_t v32 = [v31 timestamps];
  if (v32 && g_recordTimestamps && !*(void *)(v32 + 112)) {
    *(void *)(v32 + 112) = mach_absolute_time();
  }

  unsigned int v23 = *((_DWORD *)v49 + 6);
LABEL_39:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v23;
}

BOOL __101__NPTunnelFlowProtocol_addInputFramesToArray_limitMinimumBytes_limitMaximumBytes_limitMaximumFrames___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  unint64_t v9 = *(unsigned int *)(a1 + 56);
  if (a5 + a3 > v9) {
    LODWORD(a5) = v9 - a3;
  }
  nw_frame_create();
  nw_frame_array_append();
  BOOL result = 0;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a5;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < *(_DWORD *)(a1 + 56)) {
    return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < *(_DWORD *)(a1 + 60);
  }
  return result;
}

void __101__NPTunnelFlowProtocol_addInputFramesToArray_limitMinimumBytes_limitMaximumBytes_limitMaximumFrames___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 168);
  if (v1)
  {
    id v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [*(id *)(a1 + 32) hashKey];
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "Flow %llu notifying input protocol that input is finished after all pending data read", (uint8_t *)&v7, 0xCu);
    }

    BOOL v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v1 + 24) + 184);
    id v5 = [*(id *)(a1 + 32) tunnel];
    v4(v1, [v5 protocol]);
  }
}

- (BOOL)addBufferToFrameArray:(nw_frame_array_s *)a3 bufferSize:(unint64_t)a4
{
  BOOL v4 = malloc_type_malloc(a4, 0x100004077774924uLL);
  if (v4)
  {
    nw_frame_create();
    nw_frame_array_append();
  }
  return v4 != 0;
}

- (unsigned)addOutputFramesToArray:(nw_frame_array_s *)a3 limitMinimumBytes:(unsigned int)a4 limitMaximumBytes:(unsigned int)a5 limitMaximumFrames:(unsigned int)a6
{
  BOOL v11 = [(NPTunnelFlow *)self tunnel];
  unint64_t v12 = [v11 maxDataSendSizeForFlow:self];

  nw_frame_array_init();
  if (!v12) {
    return 0;
  }
  unsigned int v13 = a5;
  unsigned int v14 = a6;
  if (self->super._hasTunnel)
  {
    BOOL v15 = [(NPTunnelFlow *)self window];
    if (v15) {
      unsigned int v13 = v15[3];
    }
    else {
      unsigned int v13 = 0;
    }
    if (v13 % v12) {
      unsigned int v14 = v13 / v12 + 1;
    }
    else {
      unsigned int v14 = v13 / v12;
    }
  }
  unsigned int result = 0;
  if (v14 >= a6) {
    unsigned int v14 = a6;
  }
  if (v13 >= a5) {
    unsigned int v17 = a5;
  }
  else {
    unsigned int v17 = v13;
  }
  if (v17 >= a4) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = 0;
  }
  if (self->_discardFirstData) {
    unint64_t v12 = v18;
  }
  if (v18 && v14)
  {
    unsigned int v19 = 0;
    unsigned int v20 = v14 - 1;
    while (1)
    {
      unint64_t v21 = v12 >= v17 ? v17 : v12;
      if (![(NPTunnelFlowProtocol *)self addBufferToFrameArray:a3 bufferSize:v21])break; {
      unsigned int result = v19 + 1;
      }
      v17 -= v21;
      if (v17) {
        BOOL v22 = v20 == v19;
      }
      else {
        BOOL v22 = 1;
      }
      ++v19;
      if (v22) {
        return result;
      }
    }
    unsigned int v23 = nplog_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)size_t v24 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_ERROR, "Failed to create an output buffer", v24, 2u);
    }

    return v19;
  }
  return result;
}

- (void)handleOutputFrame:(id)a3 send:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = 0;
  id v6 = a3;
  buffer = (void *)nw_frame_get_buffer();
  uint64_t v8 = (const void *)nw_frame_unclaimed_bytes();

  if (buffer && v4 && !self->_discardFirstData)
  {
    self->_waitingForOutput = 0;
    size_t v10 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__NPTunnelFlowProtocol_handleOutputFrame_send___block_invoke;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = buffer;
    dispatch_data_t v11 = dispatch_data_create(v8, v13, v10, v12);

    [(NPTunnelFlowProtocol *)self handleAppData:v11];
  }
  else
  {
    uint64_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v15 = [(NPTunnelFlow *)self hashKey];
      __int16 v16 = 1024;
      unsigned int v17 = v13;
      _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "Flow %llu discarding %u bytes", buf, 0x12u);
    }

    self->_discardFirstData = 0;
    free(buffer);
  }
}

void __47__NPTunnelFlowProtocol_handleOutputFrame_send___block_invoke(uint64_t a1)
{
}

- (void)handleAppData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NPTunnelFlow *)self state] == 1)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [(NPTunnelFlow *)self setFirstTxByteTimestamp:v5];
  }
  id v6 = [(NPTunnelFlow *)self tunnel];
  uint64_t v7 = [v6 timestamps];
  if (v7 && g_recordTimestamps && !*(void *)(v7 + 64)) {
    *(void *)(v7 + 64) = mach_absolute_time();
  }

  v13.receiver = self;
  v13.super_class = (Class)NPTunnelFlowProtocol;
  [(NPTunnelFlow *)&v13 handleAppData:v4];

  if (!v4)
  {
    uint64_t v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = [(NPTunnelFlow *)self hashKey];
      unint64_t v10 = [(NPTunnelFlow *)self identifier];
      *(_DWORD *)buf = 134218240;
      unint64_t v15 = v9;
      __int16 v16 = 2048;
      unint64_t v17 = v10;
      _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) received EOF from the app", buf, 0x16u);
    }

    [(NPTunnelFlow *)self closeFromTunnel];
  }
  if ([(NPTunnelFlow *)self state] == 2)
  {
    dispatch_data_t v11 = [(NPTunnelFlow *)self tunnel];
    int v12 = [v11 isReadyForData];

    if (v12) {
      [(NPTunnelFlowProtocol *)self handleTunnelReadyForData];
    }
  }
}

- (nw_protocol)inputProtocol
{
  return self->_inputProtocol;
}

- (BOOL)waitingForOutput
{
  return self->_waitingForOutput;
}

- (void).cxx_destruct
{
}

@end