@interface OZScript
- (BOOL)alertShown;
- (JSContext)context;
- (NSMutableArray)parameterDescriptors;
- (NSRegularExpression)paramRegex;
- (NSURL)url;
- (OZScript)init;
- (id)objectWithName:(id)a3;
- (id)preprocess:(id)a3;
- (id)process:(id)a3;
- (void)dealloc;
- (void)dispatch:(id)a3;
- (void)exportObject:(id)a3 as:(id)a4;
- (void)loadScriptWithURL:(id)a3;
- (void)setAlertShown:(BOOL)a3;
- (void)setParamRegex:(id)a3;
@end

@implementation OZScript

- (OZScript)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)OZScript;
  v2 = [(OZScript *)&v6 init];
  if (v2)
  {
    v3 = (JSContext *)objc_alloc_init(MEMORY[0x1E4F30920]);
    v2->_context = v3;
    [(JSContext *)v3 setExceptionHandler:&__block_literal_global_84];
    [(JSContext *)v2->_context setObject:&__block_literal_global_4 forKeyedSubscript:@"print"];
    uint64_t v5 = 0;
    v2->_paramRegex = (NSRegularExpression *)(id)[MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\s*EXPORT\\s+(CHANNEL_(?:FLOAT|PERCENT|ANGLE|COLOR|POSITION|PADDING|TEXTURE_2D))\\s+var\\s+([a-zA-Z_][a-zA-Z_0-9]*)(.*)" options:0 error:&v5];
    if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = @"\\s*EXPORT\\s+(CHANNEL_(?:FLOAT|PERCENT|ANGLE|COLOR|POSITION|PADDING|TEXTURE_2D))\\s+var\\s+([a-zA-Z_][a-zA-Z_0-9]*)(.*)";
      _os_log_impl(&dword_1B73F3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[JavaScript] Could not create regex: %@", buf, 0xCu);
    }
    SCNExportJavaScriptModule(v2->_context);
    v2->_parameterDescriptors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_alertShown = 0;
  }
  return v2;
}

void __16__OZScript_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 toString];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1B73F3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[JavaScript] %@", (uint8_t *)&v4, 0xCu);
  }
}

void __16__OZScript_init__block_invoke_1(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    uint64_t v4 = a2;
    _os_log_impl(&dword_1B73F3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZScript;
  [(OZScript *)&v3 dealloc];
}

- (void)exportObject:(id)a3 as:(id)a4
{
}

- (id)objectWithName:(id)a3
{
  return [(JSContext *)self->_context objectForKeyedSubscript:a3];
}

- (void)dispatch:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __21__OZScript_dispatch___block_invoke;
  v3[3] = &unk_1E616D7B0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __21__OZScript_dispatch___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t result = [v1 isUndefined];
  if ((result & 1) == 0)
  {
    return [v1 callWithArguments:0];
  }
  return result;
}

- (void)loadScriptWithURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_url = (NSURL *)[a3 copy];
  v8 = 0;
  uint64_t v5 = [NSString stringWithContentsOfURL:a3 encoding:134217984 error:&v8];
  uint64_t v6 = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1B73F3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error while processing script file: %@", buf, 0xCu);
    }
  }
  else
  {
    [(JSContext *)self->_context evaluateScript:[(OZScript *)self preprocess:v5]];
  }
}

- (id)preprocess:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "newlineCharacterSet"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return &stru_1F119C770;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
  v8 = &stru_1F119C770;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v8 = (__CFString *)[(__CFString *)v8 stringByAppendingFormat:@"%@\n", [(OZScript *)self process:*(void *)(*((void *)&v11 + 1) + 8 * i)]];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v6);
  return v8;
}

- (id)process:(id)a3
{
  id v3 = a3;
  if (![a3 containsString:@"EXPORT"]) {
    return v3;
  }
  uint64_t v5 = -[NSRegularExpression firstMatchInString:options:range:](self->_paramRegex, "firstMatchInString:options:range:", v3, 0, 0, [v3 length]);
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B73F3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Script] Error parsing published parameter", buf, 2u);
    }
    return &stru_1F119C770;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(NSTextCheckingResult *)v5 rangeAtIndex:1];
  uint64_t v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
  uint64_t v10 = [(NSTextCheckingResult *)v6 rangeAtIndex:2];
  uint64_t v12 = objc_msgSend(v3, "substringWithRange:", v10, v11);
  uint64_t v13 = [(NSTextCheckingResult *)v6 rangeAtIndex:3];
  uint64_t v15 = objc_msgSend(v3, "substringWithRange:", v13, v14);
  if ([v9 isEqualToString:@"CHANNEL_FLOAT"])
  {
    uint64_t v16 = 0;
  }
  else if ([v9 isEqualToString:@"CHANNEL_PERCENT"])
  {
    uint64_t v16 = 1;
  }
  else if ([v9 isEqualToString:@"CHANNEL_ANGLE"])
  {
    uint64_t v16 = 4;
  }
  else if ([v9 isEqualToString:@"CHANNEL_COLOR"])
  {
    uint64_t v16 = 2;
  }
  else if ([v9 isEqualToString:@"CHANNEL_POSITION"])
  {
    uint64_t v16 = 3;
  }
  else if ([v9 isEqualToString:@"CHANNEL_PADDING"])
  {
    uint64_t v16 = 5;
  }
  else if ([v9 isEqualToString:@"CHANNEL_TEXTURE_2D"])
  {
    uint64_t v16 = 6;
  }
  else
  {
    uint64_t v16 = 0;
  }
  v18 = [[OZShaderParameter alloc] initWithName:v12 type:v16];
  [(NSMutableArray *)self->_parameterDescriptors addObject:v18];

  return (id)[NSString stringWithFormat:@"var %@%@", v12, v15];
}

- (NSURL)url
{
  return self->_url;
}

- (JSContext)context
{
  return self->_context;
}

- (NSMutableArray)parameterDescriptors
{
  return self->_parameterDescriptors;
}

- (NSRegularExpression)paramRegex
{
  return self->_paramRegex;
}

- (void)setParamRegex:(id)a3
{
}

- (BOOL)alertShown
{
  return self->_alertShown;
}

- (void)setAlertShown:(BOOL)a3
{
  self->_alertShown = a3;
}

@end