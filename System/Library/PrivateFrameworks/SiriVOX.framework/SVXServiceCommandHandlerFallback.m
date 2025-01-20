@interface SVXServiceCommandHandlerFallback
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerFallback)initWithResult:(id)a3;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation SVXServiceCommandHandlerFallback

- (void).cxx_destruct
{
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, SVXServiceCommandResult *))a6;
  v14 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    v15 = v14;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    int v18 = 136315394;
    v19 = "-[SVXServiceCommandHandlerFallback handleCommand:withContext:taskTracker:completion:]";
    __int16 v20 = 2112;
    v21 = v17;
    _os_log_error_impl(&dword_220062000, v15, OS_LOG_TYPE_ERROR, "%s Service command handler is missing for %@. Please file a radar.", (uint8_t *)&v18, 0x16u);

    if (!v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v13) {
LABEL_3:
  }
    v13[2](v13, self->_result);
LABEL_4:
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.SiriVOXService.service-command.fallback";
}

- (SVXServiceCommandHandlerFallback)initWithResult:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXServiceCommandHandlerFallback;
  v5 = [(SVXServiceCommandHandlerFallback *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = v5->_result;
    v5->_result = (SVXServiceCommandResult *)v6;
  }
  return v5;
}

+ (Class)supportedCommandClass
{
  return 0;
}

@end