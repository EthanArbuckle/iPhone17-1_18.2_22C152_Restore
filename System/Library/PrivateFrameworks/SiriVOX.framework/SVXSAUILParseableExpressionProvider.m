@interface SVXSAUILParseableExpressionProvider
- (id)createWithAceId:(id)a3 context:(id)a4 expressionString:(id)a5;
@end

@implementation SVXSAUILParseableExpressionProvider

- (id)createWithAceId:(id)a3 context:(id)a4 expressionString:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263F64F98];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  [v11 setAceId:v10];

  [v11 setContext:v9];
  [v11 setExpressionString:v8];

  return v11;
}

@end