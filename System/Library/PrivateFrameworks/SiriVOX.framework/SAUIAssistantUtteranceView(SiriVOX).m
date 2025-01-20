@interface SAUIAssistantUtteranceView(SiriVOX)
- (id)svx_parseableExpression;
- (void)svx_applyParsedExpression:()SiriVOX;
@end

@implementation SAUIAssistantUtteranceView(SiriVOX)

- (void)svx_applyParsedExpression:()SiriVOX
{
  id v9 = a3;
  v4 = [v9 parseableExpression];
  v5 = [v4 expressionString];
  v6 = [a1 text];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [v9 parsedOutput];
    [a1 setSpeakableText:v8];
  }
}

- (id)svx_parseableExpression
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [a1 context];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [a1 context];
    int v4 = objc_msgSend(v3, "svx_isDeferredExpressionContextObject");

    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F64F98]);
      v6 = [MEMORY[0x263F08C38] UUID];
      int v7 = [v6 UUIDString];
      [v5 setAceId:v7];

      v8 = [a1 context];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 setContext:v8];
      }
      id v9 = [a1 speakableText];
      [v5 setExpressionString:v9];

      goto LABEL_10;
    }
  }
  else
  {
  }
  v10 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = [a1 context];
    int v14 = 136315394;
    v15 = "-[SAUIAssistantUtteranceView(SiriVOX) svx_parseableExpression]";
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s Don't know how to generate a parseable expression for context object: %@", (uint8_t *)&v14, 0x16u);
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

@end