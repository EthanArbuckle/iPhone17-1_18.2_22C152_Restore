@interface PKCloudResolveContext
- (PKCloudResolveContext)initWithPKCloudPrinter:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (id)description;
- (void)_checkFound:(id)a3;
- (void)_complete:(id)a3;
- (void)_driveResolution;
- (void)dealloc;
- (void)start;
@end

@implementation PKCloudResolveContext

- (PKCloudResolveContext)initWithPKCloudPrinter:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKCloudResolveContext;
  v11 = [(PKCloudResolveContext *)&v24 init];
  if (v11)
  {
    uint64_t v12 = -[PKCloudResolveContext initWithPKCloudPrinter:timeout:completionHandler:]::sTag++;
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"PKCloudResolveContext<%p:%d>", v11, v12);
    tag = v11->_tag;
    v11->_tag = (NSString *)v13;

    v11->_timeout = a4;
    objc_storeStrong((id *)&v11->_icloudPrinter, a3);
    uint64_t v15 = MEMORY[0x230FA9020](v10);
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = (id)v15;

    uint64_t v17 = [MEMORY[0x263EFF910] date];
    startTime = v11->_startTime;
    v11->_startTime = (NSDate *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.printing.reachable", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v19;

    v21 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v11->_tag;
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_impl(&dword_22EA54000, v21, OS_LOG_TYPE_DEFAULT, "ALLOC: %@", buf, 0xCu);
    }
  }
  return v11;
}

- (void)_complete:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF910] date];
  v6 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    tag = self->_tag;
    [v5 timeIntervalSinceDate:self->_startTime];
    uint64_t v9 = v8;
    id v10 = [v4 bonjourDisplayName];
    int v11 = 138413058;
    uint64_t v12 = tag;
    __int16 v13 = 2048;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    id v16 = v4;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_DEFAULT, "%@: FINISH after %.5fs - printer %p { %@ }", (uint8_t *)&v11, 0x2Au);
  }
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  icloudPrinter = self->_icloudPrinter;
  if (icloudPrinter)
  {
    id v4 = [(PKiCloudPrinter *)icloudPrinter printerURLs];
    if ([v4 count])
    {
      v5 = [v4 objectEnumerator];
      enumerator = self->_enumerator;
      self->_enumerator = v5;

      [(PKCloudResolveContext *)self _driveResolution];
    }
    else
    {
      uint64_t v9 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        tag = self->_tag;
        int v11 = 138412290;
        uint64_t v12 = tag;
        _os_log_impl(&dword_22EA54000, v9, OS_LOG_TYPE_DEFAULT, "%@: printer array is nil", (uint8_t *)&v11, 0xCu);
      }

      [(PKCloudResolveContext *)self _complete:0];
    }
  }
  else
  {
    v7 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = self->_tag;
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_22EA54000, v7, OS_LOG_TYPE_ERROR, "%@: _icloudPrinter is nil", (uint8_t *)&v11, 0xCu);
    }

    [(PKCloudResolveContext *)self _complete:0];
  }
}

- (void)_driveResolution
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(NSEnumerator *)self->_enumerator nextObject];
  if (v3)
  {
    id v4 = self->_queue;
    if (([v3 hasPrefix:@"ipp:"] & 1) != 0
      || [v3 hasPrefix:@"ipps:"])
    {
      v5 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        tag = self->_tag;
        *(_DWORD *)buf = 138412547;
        v20 = tag;
        __int16 v21 = 2113;
        v22 = v3;
        _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_DEFAULT, "%@ CALL %{private}@", buf, 0x16u);
      }

      double timeout = self->_timeout;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __41__PKCloudResolveContext__driveResolution__block_invoke;
      v17[3] = &unk_2649EEE28;
      v18[0] = v4;
      v18[1] = self;
      +[PKPrinter printerWithName:v3 discoveryTimeout:v17 completionHandler:timeout];
      uint64_t v8 = (id *)v18;
    }
    else
    {
      int v11 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = self->_tag;
        *(_DWORD *)buf = 138412547;
        v20 = v12;
        __int16 v21 = 2113;
        v22 = v3;
        _os_log_impl(&dword_22EA54000, v11, OS_LOG_TYPE_DEFAULT, "%@ CALL %{private}@", buf, 0x16u);
      }

      uint64_t v13 = [NSURL URLWithString:v3];
      double v14 = self->_timeout;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __41__PKCloudResolveContext__driveResolution__block_invoke_300;
      v15[3] = &unk_2649EEE28;
      v16[0] = v4;
      v16[1] = self;
      +[PKPrinter printerWithURL:v13 discoveryTimeout:v15 completionHandler:v14];

      uint64_t v8 = (id *)v16;
    }
  }
  else
  {
    uint64_t v9 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_tag;
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_22EA54000, v9, OS_LOG_TYPE_DEFAULT, "%@: completed enumeration", buf, 0xCu);
    }

    [(PKCloudResolveContext *)self _complete:0];
  }
}

void __41__PKCloudResolveContext__driveResolution__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__PKCloudResolveContext__driveResolution__block_invoke_2;
  v6[3] = &unk_2649EEE00;
  id v4 = *(NSObject **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __41__PKCloudResolveContext__driveResolution__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkFound:*(void *)(a1 + 40)];
}

void __41__PKCloudResolveContext__driveResolution__block_invoke_300(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__PKCloudResolveContext__driveResolution__block_invoke_2_301;
  v6[3] = &unk_2649EEE00;
  id v4 = *(NSObject **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __41__PKCloudResolveContext__driveResolution__block_invoke_2_301(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkFound:*(void *)(a1 + 40)];
}

- (void)_checkFound:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __37__PKCloudResolveContext__checkFound___block_invoke;
    v9[3] = &unk_2649EEE50;
    v9[4] = self;
    id v10 = v4;
    [v10 pollForPrinterStatusQueue:queue completionHandler:v9];
  }
  else
  {
    id v7 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      tag = self->_tag;
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = tag;
      _os_log_impl(&dword_22EA54000, v7, OS_LOG_TYPE_DEFAULT, "%@ Not found, trying next", buf, 0xCu);
    }

    [(PKCloudResolveContext *)self _driveResolution];
  }
}

void __37__PKCloudResolveContext__checkFound___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3
    && ([v3 objectForKeyedSubscript:@"printer-status-time"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    [*(id *)(a1 + 32) _complete:*(void *)(a1 + 40)];
  }
  else
  {
    v6 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40);
      int v9 = 138412547;
      uint64_t v10 = v8;
      __int16 v11 = 2113;
      uint64_t v12 = v7;
      _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_DEFAULT, "%@ found printer %{private}@ not reachable, trying next", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 32) _driveResolution];
  }
}

- (id)description
{
  id v3 = NSString;
  tag = self->_tag;
  id v5 = [MEMORY[0x263EFF910] now];
  [v5 timeIntervalSinceDate:self->_startTime];
  uint64_t v7 = [v3 stringWithFormat:@"%@ { %.5fs running }", tag, v6];

  return v7;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    tag = self->_tag;
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = tag;
    _os_log_impl(&dword_22EA54000, v3, OS_LOG_TYPE_DEFAULT, "DEALLOC: %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PKCloudResolveContext;
  [(PKCloudResolveContext *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);

  objc_storeStrong((id *)&self->_icloudPrinter, 0);
}

@end