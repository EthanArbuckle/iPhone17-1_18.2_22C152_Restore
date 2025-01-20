@interface SearchUIOpenCalculationHandler
- (BOOL)supportsCopy;
- (id)itemProvider;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIOpenCalculationHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 shouldOpenCurrencyConversionProvider])
  {
    +[SearchUICalculateUIUtilities currencyConversionProviderURLWithCompletionHandler:&__block_literal_global_12];
  }
  else
  {
    v10 = objc_opt_class();
    v11 = [(SearchUICommandHandler *)self rowModel];
    LODWORD(v10) = [v10 hasCustomViewControllerForRowModel:v11 environment:v9];

    if (v10)
    {
      v22.receiver = self;
      v22.super_class = (Class)SearchUIOpenCalculationHandler;
      [(SearchUICommandHandler *)&v22 performCommand:v8 triggerEvent:a4 environment:v9];
    }
    else
    {
      v12 = objc_opt_new();
      [v12 setScheme:@"calc"];
      v13 = [v8 output];
      v14 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
      v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];
      [v12 setHost:v15];

      v16 = objc_opt_new();
      v17 = [v12 URL];
      if (v17) {
        [v16 addObject:v17];
      }
      v18 = [v8 input];
      v19 = +[SearchUISearchWebHandler webSearchURLForQueryString:v18];

      if (v19) {
        [v16 addObject:v19];
      }
      v20 = objc_opt_new();
      v21 = (void *)[v16 copy];
      [v20 setUrls:v21];

      +[SearchUIUtilities openPunchout:v20];
    }
  }
}

void __74__SearchUIOpenCalculationHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:a2];
    +[SearchUIUtilities openPunchout:v2];
  }
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)itemProvider
{
  id v3 = objc_alloc(MEMORY[0x1E4F28D78]);
  v4 = [(SearchUICommandHandler *)self command];
  v5 = [v4 output];
  v6 = (void *)[v3 initWithObject:v5];

  return v6;
}

@end