@interface BodyWriter
- (OS_dispatch_data)postData;
- (OS_nw_connection)connection;
- (unint64_t)bytesLeftToPost;
- (unsigned)postWriteSize;
- (unsigned)totalExpectedBytes;
- (void)sendBodyDataWithContext:(id)a3;
- (void)setBytesLeftToPost:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setPostData:(id)a3;
- (void)setPostWriteSize:(unsigned int)a3;
- (void)setTotalExpectedBytes:(unsigned int)a3;
@end

@implementation BodyWriter

- (void)sendBodyDataWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__BodyWriter_sendBodyDataWithContext___block_invoke;
  v11[3] = &unk_26439D240;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  v13 = &v14;
  v6 = (void (**)(void, void))MEMORY[0x21D4880C0](v11);
  v7 = [(BodyWriter *)self postData];
  size_t size = dispatch_data_get_size(v7);
  if ([(BodyWriter *)self bytesLeftToPost] < size)
  {
    v9 = [(BodyWriter *)self postData];
    dispatch_data_t subrange = dispatch_data_create_subrange(v9, 0, [(BodyWriter *)self bytesLeftToPost]);

    *((unsigned char *)v15 + 24) = 1;
    v7 = subrange;
  }
  ((void (**)(void, NSObject *))v6)[2](v6, v7);

  _Block_object_dispose(&v14, 8);
}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke(uint64_t a1, dispatch_data_t data, BOOL a3)
{
  size_t size = dispatch_data_get_size(data);
  v7 = *(void **)(a1 + 32);
  v8 = data;
  v9 = [v7 connection];
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 3221225472;
  completion[2] = __38__BodyWriter_sendBodyDataWithContext___block_invoke_2;
  completion[3] = &unk_26439D218;
  completion[4] = *(void *)(a1 + 32);
  size_t v12 = size;
  BOOL v13 = a3;
  long long v11 = *(_OWORD *)(a1 + 40);
  nw_connection_send(v9, v8, (nw_content_context_t)(id)v11, a3, completion);
}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3)
  {
    netqual_log_init();
    id v4 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_2(v4, v3);
    }
    goto LABEL_11;
  }
  if ((unint64_t)[*(id *)(a1 + 32) bytesLeftToPost] >= *(void *)(a1 + 56))
  {
    [*(id *)(a1 + 32) setBytesLeftToPost: *(void *)(a1 + 56) - *(void *)(a1 + 56)];
  }
  else if (!*(unsigned char *)(a1 + 64))
  {
    netqual_log_init();
    id v5 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_1(v5);
    }
    goto LABEL_11;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) sendBodyDataWithContext:*(void *)(a1 + 40)];
  }
LABEL_11:
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_data)postData
{
  return self->_postData;
}

- (void)setPostData:(id)a3
{
}

- (unint64_t)bytesLeftToPost
{
  return self->_bytesLeftToPost;
}

- (void)setBytesLeftToPost:(unint64_t)a3
{
  self->_bytesLeftToPost = a3;
}

- (unsigned)postWriteSize
{
  return self->_postWriteSize;
}

- (void)setPostWriteSize:(unsigned int)a3
{
  self->_postWriteSize = a3;
}

- (unsigned)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void)setTotalExpectedBytes:(unsigned int)a3
{
  self->_totalExpectedBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postData, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[BodyWriter sendBodyDataWithContext:]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 34;
  _os_log_error_impl(&dword_2192FE000, log, OS_LOG_TYPE_ERROR, "%s:%u - Write not complete, but didn't have a full amount to write", (uint8_t *)&v1, 0x12u);
}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  __int16 v3 = a1;
  int v4 = 136315906;
  uint64_t v5 = "-[BodyWriter sendBodyDataWithContext:]_block_invoke_2";
  __int16 v6 = 1024;
  int v7 = 26;
  __int16 v8 = 1024;
  nw_error_domain_t error_domain = nw_error_get_error_domain(a2);
  __int16 v10 = 1024;
  int error_code = nw_error_get_error_code(a2);
  _os_log_error_impl(&dword_2192FE000, v3, OS_LOG_TYPE_ERROR, "%s:%u - Write encountered error: %u:%u\n", (uint8_t *)&v4, 0x1Eu);
}

@end