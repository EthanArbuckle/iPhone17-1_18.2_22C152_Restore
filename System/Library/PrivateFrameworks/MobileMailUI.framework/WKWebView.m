@interface WKWebView
@end

@implementation WKWebView

void __65__WKWebView_MessageContentView__mcv_executeJavaScriptExpression___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F60CF0] + 16))();
  v7 = v9;
  if (v6)
  {
    if (v5)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9);
      v7 = v9;
    }

    v7 = (void *)v8;
  }
  id v10 = v7;
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:");
}

id __78__WKWebView_MessageContentView__mcv_dictionaryFromJavaScriptMethod_arguments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v3 = v2) != 0)
  {
    v4 = v3;
    id v5 = [MEMORY[0x1E4F60D70] futureWithResult:v3];
  }
  else
  {
    int v6 = (void *)MEMORY[0x1E4F60D70];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"An error occured trying to retrieve a dictionary from JS function, please check previous logging for issue!");
    id v5 = [v6 futureWithError:v7];
    v4 = (void *)v7;
  }

  return v5;
}

@end