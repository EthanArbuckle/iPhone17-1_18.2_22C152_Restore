@interface NPTuscanyLoopbackConnection
- (BOOL)waitingForOutput;
- (NPTuscanyLoopbackConnection)init;
- (nw_protocol)protocol;
- (unint64_t)currentBlobSizeIndex;
- (unsigned)addInputFramesToArray:(nw_frame_array_s *)a3 maximumBytes:(unsigned int)a4 minimumBytes:(unsigned int)a5 maximumFrameCount:(unsigned int)a6;
- (unsigned)addOutputFramesToArray:(nw_frame_array_s *)a3 maximumBytes:(unsigned int)a4 minimumBytes:(unsigned int)a5 maximumFrameCount:(unsigned int)a6;
- (void)dealloc;
- (void)handleOutputFrame:(id)a3;
- (void)notifyInputHandler;
- (void)setCurrentBlobSizeIndex:(unint64_t)a3;
- (void)setWaitingForOutput:(BOOL)a3;
@end

@implementation NPTuscanyLoopbackConnection

- (NPTuscanyLoopbackConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPTuscanyLoopbackConnection;
  v2 = [(NPTuscanyLoopbackConnection *)&v5 init];
  v3 = (NPTuscanyLoopbackConnection *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1A1092BC0;
    *(_OWORD *)(v2 + 24) = xmmword_1A1092BD0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *((void *)v2 + 7) = &xmmword_1EB53BAC8;
    *((void *)v2 + 8) = &xmmword_1EB53BAF0;
    nw_frame_array_init();
  }
  return v3;
}

- (void)dealloc
{
  v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating loopback connection", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NPTuscanyLoopbackConnection;
  [(NPTuscanyLoopbackConnection *)&v4 dealloc];
}

- (nw_protocol)protocol
{
  return &self->_protocol;
}

- (unsigned)addOutputFramesToArray:(nw_frame_array_s *)a3 maximumBytes:(unsigned int)a4 minimumBytes:(unsigned int)a5 maximumFrameCount:(unsigned int)a6
{
  nw_frame_array_init();
  unsigned int result = 0;
  if (a4 && a6)
  {
    unsigned int v10 = 0;
    unsigned int v11 = a6 - 1;
    while (1)
    {
      unint64_t v12 = [(NPTuscanyLoopbackConnection *)self currentBlobSizeIndex];
      size_t v13 = self->_blobSizes[v12] >= a4 ? a4 : self->_blobSizes[v12];
      if (!malloc_type_malloc(v13, 0x100004077774924uLL)) {
        break;
      }
      nw_frame_create();
      nw_frame_array_append();
      [(NPTuscanyLoopbackConnection *)self setCurrentBlobSizeIndex:[(NPTuscanyLoopbackConnection *)self currentBlobSizeIndex] + 1];
      if ([(NPTuscanyLoopbackConnection *)self currentBlobSizeIndex] == 4) {
        [(NPTuscanyLoopbackConnection *)self setCurrentBlobSizeIndex:0];
      }
      a4 -= v13;
      unsigned int result = v10 + 1;
      if (a4) {
        BOOL v14 = v11 == v10;
      }
      else {
        BOOL v14 = 1;
      }
      ++v10;
      if (v14) {
        return result;
      }
    }
    return v10;
  }
  return result;
}

- (unsigned)addInputFramesToArray:(nw_frame_array_s *)a3 maximumBytes:(unsigned int)a4 minimumBytes:(unsigned int)a5 maximumFrameCount:(unsigned int)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  nw_frame_array_init();
  if (!a4 || !a6)
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v23 = a6;
      __int16 v24 = 1024;
      unsigned int v25 = a4;
      unsigned int v10 = "Maximum frame count (%u) and/or maximum byte count (%u) is 0";
      size_t v13 = v9;
      uint32_t v14 = 14;
      goto LABEL_22;
    }
    goto LABEL_7;
  }
  if (nw_frame_array_is_empty())
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      unsigned int v10 = "No input data currently available";
LABEL_13:
      size_t v13 = v9;
      uint32_t v14 = 2;
LABEL_22:
      _os_log_debug_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEBUG, v10, buf, v14);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  nw_frame_array_foreach();
  if (*((_DWORD *)v19 + 6) < a5)
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      unsigned int v10 = "Not enough data available to meet the required minimum";
      goto LABEL_13;
    }
LABEL_7:
    unsigned int v11 = 0;
    goto LABEL_8;
  }
  nw_frame_array_first();
  v15 = unsigned int v11 = 0;
  if (!v15) {
    goto LABEL_9;
  }
  int v16 = 0;
  while (nw_frame_unclaimed_length() + v16 < a4)
  {
    v9 = nw_frame_array_next();
    nw_frame_array_remove();
    nw_frame_array_append();
    int v17 = nw_frame_unclaimed_length();

    ++v11;
    if (v9)
    {
      v16 += v17;
      v15 = v9;
      if (v11 < a6) {
        continue;
      }
    }
    goto LABEL_8;
  }
  v9 = v15;
LABEL_8:

LABEL_9:
  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __97__NPTuscanyLoopbackConnection_addInputFramesToArray_maximumBytes_minimumBytes_maximumFrameCount___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += nw_frame_unclaimed_length();
  return 1;
}

- (void)handleOutputFrame:(id)a3
{
  id v3 = a3;
  nw_frame_get_buffer();
  nw_frame_reset();
  nw_frame_array_append();
}

- (void)notifyInputHandler
{
  v2 = (*((void (**)(nw_protocol *, SEL))self->_protocol.callbacks + 14))(&self->_protocol, a2);
  id v3 = (void *)nw_parameters_copy_context();
  nw_queue_context_async();
}

uint64_t __49__NPTuscanyLoopbackConnection_notifyInputHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)([*(id *)(a1 + 32) protocol] + 48);
  uint64_t result = [*(id *)(a1 + 32) waitingForOutput];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) setWaitingForOutput:0];
    if (!v2) {
      return result;
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 + 24) + 40))(v2, [*(id *)(a1 + 32) protocol]);
  }
  else if (!v2)
  {
    return result;
  }
  objc_super v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 + 24) + 64);
  uint64_t v4 = [*(id *)(a1 + 32) protocol];
  return v5(v2, v4);
}

- (unint64_t)currentBlobSizeIndex
{
  return self->_currentBlobSizeIndex;
}

- (void)setCurrentBlobSizeIndex:(unint64_t)a3
{
  self->_currentBlobSizeIndex = a3;
}

- (BOOL)waitingForOutput
{
  return self->_waitingForOutput;
}

- (void)setWaitingForOutput:(BOOL)a3
{
  self->_waitingForOutput = a3;
}

@end