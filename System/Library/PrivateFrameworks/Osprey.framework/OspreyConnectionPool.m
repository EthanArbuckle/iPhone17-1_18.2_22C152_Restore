@interface OspreyConnectionPool
- (OspreyConnectionPool)init;
- (id)connectionForConfiguration:(id)a3;
@end

@implementation OspreyConnectionPool

- (OspreyConnectionPool)init
{
  v9.receiver = self;
  v9.super_class = (Class)OspreyConnectionPool;
  v2 = [(OspreyConnectionPool *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("OspreyConnectionPool", v3);
    poolQueue = v2->_poolQueue;
    v2->_poolQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = (NSMapTable *)v6;
  }
  return v2;
}

- (id)connectionForConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  OspreyLoggingInit();
  v5 = OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[OspreyConnectionPool connectionForConfiguration:]";
    _os_log_impl(&dword_1BEDB4000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  uint64_t v6 = [[OspreyRPCPromise alloc] initWithFulfillmentQueue:self->_poolQueue];
  v7 = [v4 urlSessionConfiguration];

  if (!v7)
  {
    OspreyLoggingInit();
    v8 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG)) {
      -[OspreyConnectionPool connectionForConfiguration:](v8);
    }
    objc_super v9 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    [v4 setUrlSessionConfiguration:v9];
  }
  OspreyLoggingInit();
  v10 = (void *)OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG)) {
    -[OspreyConnectionPool connectionForConfiguration:](v10, v4);
  }
  poolQueue = self->_poolQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__OspreyConnectionPool_connectionForConfiguration___block_invoke;
  block[3] = &unk_1E63CB9A8;
  block[4] = self;
  id v18 = v4;
  v12 = v6;
  v19 = v12;
  id v13 = v4;
  dispatch_async(poolQueue, block);
  v14 = v19;
  v15 = v12;

  return v15;
}

void __51__OspreyConnectionPool_connectionForConfiguration___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*((id *)a1[4] + 2) objectForKey:a1[5]];
  if (v2)
  {
    OspreyLoggingInit();
    v3 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
      __int16 v19 = 2112;
      v20 = v2;
      _os_log_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_INFO, "%s Reused channel %@ from pool", buf, 0x16u);
    }
  }
  else
  {
    id v4 = [OspreyChannel alloc];
    v5 = [a1[5] connectionUrl];
    uint64_t v6 = [a1[5] urlSessionConfiguration];
    v2 = [(OspreyChannel *)v4 initWithURL:v5 configuration:v6];

    OspreyLoggingInit();
    v7 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
      __int16 v19 = 2112;
      v20 = v2;
      _os_log_impl(&dword_1BEDB4000, v7, OS_LOG_TYPE_INFO, "%s Created channel %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, a1[4]);
    v8 = [OspreyConnectionHandle alloc];
    id v9 = a1[5];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_7;
    v14 = &unk_1E63CC0C0;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = a1[5];
    v10 = [(OspreyConnectionHandle *)v8 initWithConnectionKey:v9 willRelease:&v11];
    -[OspreyChannel ocp_setAssociatedHandle:](v2, "ocp_setAssociatedHandle:", v10, v11, v12, v13, v14);
    [*((id *)a1[4] + 2) setObject:v2 forKey:a1[5]];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  [a1[6] fulfill:v2];
}

void __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_7(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  OspreyLoggingInit();
  v2 = OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
    _os_log_impl(&dword_1BEDB4000, v2, OS_LOG_TYPE_INFO, "%s OspreyChannel deallocated, removing handle from pool", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained[1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_8;
  v6[3] = &unk_1E63CBBC0;
  id v7 = WeakRetained;
  id v8 = *(id *)(a1 + 32);
  v5 = WeakRetained;
  dispatch_async(v4, v6);
}

void __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_8(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  OspreyLoggingInit();
  v2 = (void *)OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 16);
    id v4 = v2;
    int v5 = 136315394;
    uint64_t v6 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
    __int16 v7 = 2048;
    uint64_t v8 = [v3 count];
    _os_log_impl(&dword_1BEDB4000, v4, OS_LOG_TYPE_INFO, "%s Handle removed from pool, current size: %lu", (uint8_t *)&v5, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionMap, 0);

  objc_storeStrong((id *)&self->_poolQueue, 0);
}

- (void)connectionForConfiguration:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = [a2 urlSessionConfiguration];
  int v5 = 136315394;
  uint64_t v6 = "-[OspreyConnectionPool connectionForConfiguration:]";
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_DEBUG, "%s Using NSURLSessionConfiguration: %@", (uint8_t *)&v5, 0x16u);
}

- (void)connectionForConfiguration:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[OspreyConnectionPool connectionForConfiguration:]";
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s No NSURLSessionConfiguration specified, using defaultSessionConfiguration", (uint8_t *)&v1, 0xCu);
}

@end