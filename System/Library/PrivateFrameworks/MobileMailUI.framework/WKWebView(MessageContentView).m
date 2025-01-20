@interface WKWebView(MessageContentView)
- (id)_mcv_executeJavaScriptMethod:()MessageContentView arguments:;
- (id)mcv_dictionaryFromJavaScriptMethod:()MessageContentView arguments:;
- (id)mcv_executeJavaScriptExpression:()MessageContentView;
- (id)mcv_stringFromJavaScriptMethod:()MessageContentView arguments:;
@end

@implementation WKWebView(MessageContentView)

- (id)_mcv_executeJavaScriptMethod:()MessageContentView arguments:
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
    v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:0];
    v10 = (__CFString *)[[NSString alloc] initWithData:v9 encoding:4];
  }
  else
  {
    v10 = @"[]";
  }
  v11 = [NSString stringWithFormat:@"_try_catch_wrap(%@).apply(null, %@);", v6, v10];
  v12 = objc_msgSend(a1, "mcv_executeJavaScriptExpression:", v11);

  return v12;
}

- (id)mcv_executeJavaScriptExpression:()MessageContentView
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F60E18] promise];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__WKWebView_MessageContentView__mcv_executeJavaScriptExpression___block_invoke;
  v9[3] = &unk_1E6D1B9F8;
  id v6 = v5;
  id v10 = v6;
  [a1 evaluateJavaScript:v4 completionHandler:v9];
  id v7 = [v6 future];

  return v7;
}

- (id)mcv_stringFromJavaScriptMethod:()MessageContentView arguments:
{
  v1 = objc_msgSend(a1, "_mcv_executeJavaScriptMethod:arguments:");
  return v1;
}

- (id)mcv_dictionaryFromJavaScriptMethod:()MessageContentView arguments:
{
  v1 = objc_msgSend(a1, "_mcv_executeJavaScriptMethod:arguments:");
  v2 = [v1 then:&__block_literal_global_14];

  return v2;
}

@end