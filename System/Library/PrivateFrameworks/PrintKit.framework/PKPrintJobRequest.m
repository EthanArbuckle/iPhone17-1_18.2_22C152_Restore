@interface PKPrintJobRequest
- (NSString)fileType;
- (PKPrintJobRequest)initWithPrinterName:(id)a3;
- (PKPrintSettings)printSettings;
- (PKPrinterBonjourEndpoint)printerName;
- (void)_establishedJob:(id)a3 fileHandle:(id)a4;
- (void)finishRequest0:(BOOL)a3 completionHandler:(id)a4;
- (void)finishRequest:(BOOL)a3 completionHandler:(id)a4;
- (void)setFileType:(id)a3;
- (void)setPrintSettings:(id)a3;
- (void)startRequestCompletionHandler:(id)a3;
- (void)writeRequestData:(id)a3 completionHandler:(id)a4;
@end

@implementation PKPrintJobRequest

- (PKPrintJobRequest)initWithPrinterName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPrintJobRequest;
  v6 = [(PKPrintJobRequest *)&v10 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.printing.JobStreamQueue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_printerName, a3);
  }

  return v6;
}

- (void)_establishedJob:(id)a3 fileHandle:(id)a4
{
  v6 = (PKPrinterTool_Client *)a3;
  dispatch_queue_t v7 = (NSFileHandle *)a4;
  job_connection = self->_job_connection;
  self->_job_connection = v6;
  objc_super v10 = v6;

  streamHandle = self->_streamHandle;
  self->_streamHandle = v7;
}

- (void)startRequestCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if (v5)
  {
    v6 = self->_queue;
    dispatch_queue_t v7 = [(PKPrintJobRequest *)self fileType];
    v8 = [(PKPrintJobRequest *)self printSettings];
    [v8 setFileType:v7];

    objc_initWeak(&location, self);
    v9 = [(PKPrintJobRequest *)self printerName];
    objc_super v10 = [(PKPrintJobRequest *)self printSettings];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke;
    v12[3] = &unk_2649EEFD8;
    id v15 = v4;
    v11 = v6;
    v13 = v11;
    objc_copyWeak(&v16, &location);
    id v14 = v5;
    [v14 startStreamingRequest:v9 printSettings:v10 completionHandler:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke_2;
    v5[3] = &unk_2649EEFB0;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    id v6 = *(id *)(a1 + 40);
    id v7 = v3;
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    [v4 _establishedJob:*(void *)(a1 + 32) fileHandle:*(void *)(a1 + 40)];

    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    id v8 = 0;
    [v6 closeAndReturnError:&v8];
    id v7 = v8;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)writeRequestData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_job_connection && (streamHandle = self->_streamHandle) != 0)
  {
    id v9 = streamHandle;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__PKPrintJobRequest_writeRequestData_completionHandler___block_invoke;
    block[3] = &unk_2649EF000;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    v11 = v9;
    dispatch_async(queue, block);
  }
  else
  {
    v12 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22EA54000, v12, OS_LOG_TYPE_ERROR, "no stream to send bytes to", buf, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __56__PKPrintJobRequest_writeRequestData_completionHandler___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  [v2 writeData:v3 error:&v6];
  id v4 = v6;
  if (v4)
  {
    id v5 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_ERROR, "Could not write to job stream %@", buf, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)finishRequest:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PKPrintJobRequest_finishRequest_completionHandler___block_invoke;
  block[3] = &unk_2649EF028;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __53__PKPrintJobRequest_finishRequest_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRequest0:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)finishRequest0:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  streamHandle = self->_streamHandle;
  if (streamHandle)
  {
    uint64_t v14 = 0;
    [(NSFileHandle *)streamHandle closeAndReturnError:&v14];
    id v8 = self->_streamHandle;
    self->_streamHandle = 0;
  }
  uint64_t v9 = self->_job_connection;
  job_connection = self->_job_connection;
  self->_job_connection = 0;

  if (v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__PKPrintJobRequest_finishRequest0_completionHandler___block_invoke;
    v11[3] = &unk_2649EEF38;
    v12 = v9;
    id v13 = v6;
    [(PKPrinterTool_Client *)v12 finishRequestWithCancel:v4 completionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __54__PKPrintJobRequest_finishRequest0_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PKPrinterBonjourEndpoint)printerName
{
  return (PKPrinterBonjourEndpoint *)objc_getProperty(self, a2, 32, 1);
}

- (PKPrintSettings)printSettings
{
  return (PKPrintSettings *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrintSettings:(id)a3
{
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_printSettings, 0);
  objc_storeStrong((id *)&self->_printerName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamHandle, 0);

  objc_storeStrong((id *)&self->_job_connection, 0);
}

@end