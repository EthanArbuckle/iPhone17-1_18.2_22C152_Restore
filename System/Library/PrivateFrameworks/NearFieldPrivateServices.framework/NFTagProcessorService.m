@interface NFTagProcessorService
- (BOOL)canRun;
- (id)serviceName;
- (void)processURL:(id)a3 forNDEFTag:(id)a4 completionHandler:(id)a5;
@end

@implementation NFTagProcessorService

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return @"com.apple.stockholm.services.NFTagProcessorService";
}

- (void)processURL:(id)a3 forNDEFTag:(id)a4 completionHandler:(id)a5
{
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16[0] = @"URL";
  id v9 = a4;
  v10 = [a3 absoluteString];
  v16[1] = @"TAG";
  v17[0] = v10;
  v17[1] = v9;
  v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__NFTagProcessorService_processURL_forNDEFTag_completionHandler___block_invoke;
  v14[3] = &unk_265429608;
  id v15 = v8;
  v13.receiver = self;
  v13.super_class = (Class)NFTagProcessorService;
  id v12 = v8;
  [(NFPrivateService *)&v13 runService:v11 withCompletion:v14];
}

void __65__NFTagProcessorService_processURL_forNDEFTag_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"Error"];
  v4 = [v3 objectForKeyedSubscript:@"Actionable"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 BOOLValue];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end