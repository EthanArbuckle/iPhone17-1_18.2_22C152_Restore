@interface WFSaveLogsOperation
- (NSString)comments;
- (WFSaveLogsOperation)initWithComments:(id)a3;
- (void)setComments:(id)a3;
- (void)start;
@end

@implementation WFSaveLogsOperation

- (WFSaveLogsOperation)initWithComments:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSaveLogsOperation;
  v6 = [(WFSaveLogsOperation *)&v10 init];
  p_comments = (void **)&v6->_comments;
  objc_storeStrong((id *)&v6->_comments, a3);
  if (![(NSString *)v6->_comments length])
  {
    v8 = *p_comments;
    *p_comments = @"WiFi Settings";
  }
  return v6;
}

- (void)start
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(WFSaveLogsOperation *)self comments];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v4 = (void *)getW5ClientClass_softClass;
  uint64_t v24 = getW5ClientClass_softClass;
  if (!getW5ClientClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v29 = __getW5ClientClass_block_invoke;
    v30 = &unk_26478E338;
    v31 = &v21;
    __getW5ClientClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v22[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v21, 8);
  id v6 = objc_alloc_init(v5);
  v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  BOOL v10 = (unint64_t)WFCurrentLogLevel() > 2 && v7 != 0;
  if (v6)
  {
    if (v10 && os_log_type_enabled(v7, v8))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_226071000, v7, v8, "WiFi Diagnostics log collection started (comment='%@')", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v11 = (void *)getW5LogItemRequestClass_softClass;
    uint64_t v24 = getW5LogItemRequestClass_softClass;
    if (!getW5LogItemRequestClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v29 = __getW5LogItemRequestClass_block_invoke;
      v30 = &unk_26478E338;
      v31 = &v21;
      __getW5LogItemRequestClass_block_invoke((uint64_t)&buf);
      v11 = (void *)v22[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v21, 8);
    v13 = [v12 requestWithItemID:55 configuration:0];
    v26[0] = @"Reason";
    v26[1] = @"Compress";
    v27[0] = v3;
    v27[1] = MEMORY[0x263EFFA88];
    v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    v25 = v13;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __28__WFSaveLogsOperation_start__block_invoke;
    v18[3] = &unk_26478E310;
    id v19 = v3;
    v20 = self;
    id v16 = (id)[v6 collectLogs:v15 configuration:v14 update:0 reply:v18];
  }
  else
  {
    if (v10 && os_log_type_enabled(v7, v8))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_226071000, v7, v8, "WiFiVelocity not available", (uint8_t *)&buf, 2u);
    }

    v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.wififkit" code:-1 userInfo:0];
    [(WFOperation *)self setError:v17];

    [(WFOperation *)self finish];
  }
}

void __28__WFSaveLogsOperation_start__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  os_log_type_t v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
  {
    BOOL v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v6 code];
      v13 = [v7 path];
      int v14 = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_226071000, v10, v9, "WiFi Diagnostics log collection completed (comment='%@', error=%ld, url=%@)", (uint8_t *)&v14, 0x20u);
    }
  }

  [*(id *)(a1 + 40) setError:v6];
  [*(id *)(a1 + 40) finish];
}

- (NSString)comments
{
  return self->_comments;
}

- (void)setComments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end