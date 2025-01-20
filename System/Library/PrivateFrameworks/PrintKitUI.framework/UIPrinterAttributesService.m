@interface UIPrinterAttributesService
+ (id)instance;
- (UIPrinterAttributesService)init;
- (void)_updatePolledPrinterState:(id)a3 forPrinter:(id)a4;
- (void)dealloc;
- (void)pollForPrinterWarningStatus;
- (void)startPollForPrinterWarningStatus:(id)a3 completionHandler:(id)a4;
- (void)stopPrinterWarningPolling;
@end

@implementation UIPrinterAttributesService

+ (id)instance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (UIPrinterAttributesService)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrinterAttributesService;
  result = [(UIPrinterAttributesService *)&v3 init];
  if (result) {
    result->_printerWarningPollTime = -1;
  }
  return result;
}

- (void)dealloc
{
  self->_printerWarningPollTime = -1;
  v2.receiver = self;
  v2.super_class = (Class)UIPrinterAttributesService;
  [(UIPrinterAttributesService *)&v2 dealloc];
}

- (void)startPollForPrinterWarningStatus:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!v10) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  if (self->_printerWarningPollTime < 0)
  {
    self->_printerWarningPollTime = 3;
    v8 = (void *)MEMORY[0x1E4E4C3C0](v7);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v8;

    objc_storeStrong((id *)&self->_printer, a3);
    [(UIPrinterAttributesService *)self pollForPrinterWarningStatus];
  }
}

- (void)pollForPrinterWarningStatus
{
  if (self->_printer)
  {
    objc_initWeak(&location, self);
    objc_super v3 = self->_printer;
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__UIPrinterAttributesService_pollForPrinterWarningStatus__block_invoke;
    v7[3] = &unk_1E6DA1E28;
    objc_copyWeak(&v9, &location);
    v6 = v3;
    v8 = v6;
    [(PKPrinter *)v6 pollForPrinterStatusQueue:v4 completionHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __57__UIPrinterAttributesService_pollForPrinterWarningStatus__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _updatePolledPrinterState:v4 forPrinter:*(void *)(a1 + 32)];
}

- (void)_updatePolledPrinterState:(id)a3 forPrinter:(id)a4
{
  id v6 = a3;
  id v7 = (PKPrinter *)a4;
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    printer = self->_printer;
    if (printer == v7)
    {
      if (v6)
      {
        id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F93468]];
        v11 = [v10 componentsJoinedByString:@"\n"];

        (*((void (**)(void))self->_completionHandler + 2))();
        if (self->_printerWarningPollTime >= 1)
        {
          objc_initWeak(&location, self);
          dispatch_time_t v12 = dispatch_time(0, 1000000000 * self->_printerWarningPollTime);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __67__UIPrinterAttributesService__updatePolledPrinterState_forPrinter___block_invoke;
          block[3] = &unk_1E6DA1788;
          objc_copyWeak(&v14, &location);
          dispatch_after(v12, MEMORY[0x1E4F14428], block);
          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        (*((void (**)(id, void, void))completionHandler + 2))(completionHandler, 0, 0);
      }
    }
    else
    {
      NSLog(&cfstr_PolledStateFor_0.isa, v7, printer);
    }
  }
  else
  {
    NSLog(&cfstr_PolledStateFor.isa, v7);
  }
}

void __67__UIPrinterAttributesService__updatePolledPrinterState_forPrinter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pollForPrinterWarningStatus];
}

- (void)stopPrinterWarningPolling
{
  self->_printerWarningPollTime = -1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_printer, 0);
}

@end