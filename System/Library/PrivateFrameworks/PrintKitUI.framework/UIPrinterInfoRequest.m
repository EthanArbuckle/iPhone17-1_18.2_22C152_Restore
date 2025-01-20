@interface UIPrinterInfoRequest
+ (id)requestInfoForPrinter:(id)a3;
- (NSDictionary)printerInfo;
- (id)completionHandler;
- (int)requestState;
- (void)requestPrinterInfo;
- (void)setCompletionHandler:(id)a3;
- (void)setPrinterInfo:(id)a3;
- (void)setRequestState:(int)a3;
@end

@implementation UIPrinterInfoRequest

+ (id)requestInfoForPrinter:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(UIPrinterInfoRequest);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_printer, a3);
    v6->_requestState = 0;
    [(UIPrinterInfoRequest *)v6 requestPrinterInfo];
  }

  return v6;
}

- (void)requestPrinterInfo
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(v3, block);
}

void __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) printInfoSupported];
  [*(id *)(a1 + 32) setPrinterInfo:v2];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke_2;
  block[3] = &unk_1E6DA1408;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) printerInfo];
  if ([v2 count]) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = v3;

  uint64_t result = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(result + 24);
  if (v5)
  {
    uint64_t v6 = *(unsigned int *)(result + 16);
    v7 = [(id)result printerInfo];
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

    v8 = *(void **)(a1 + 32);
    return [v8 setCompletionHandler:0];
  }
  return result;
}

- (int)requestState
{
  return self->_requestState;
}

- (void)setRequestState:(int)a3
{
  self->_requestState = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDictionary)printerInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrinterInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerInfo, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_printer, 0);
}

@end