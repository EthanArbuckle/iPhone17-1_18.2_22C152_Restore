@interface _SVXRemoteExpressionParsingService
- (SVXAceCommandHandling)aceHandler;
- (_SVXRemoteExpressionParsingService)initWithAceHandler:(id)a3;
- (void)parseExpressions:(id)a3 targetDevice:(id)a4 reply:(id)a5;
- (void)setAceHandler:(id)a3;
@end

@implementation _SVXRemoteExpressionParsingService

- (void).cxx_destruct
{
}

- (void)setAceHandler:(id)a3
{
}

- (SVXAceCommandHandling)aceHandler
{
  return self->_aceHandler;
}

- (void)parseExpressions:(id)a3 targetDevice:(id)a4 reply:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([v8 count])
    {
      id v11 = objc_alloc_init(MEMORY[0x263F64F88]);
      v12 = [MEMORY[0x263F08C38] UUID];
      v13 = [v12 UUIDString];
      [v11 setAceId:v13];

      v14 = (void *)[v8 copy];
      [v11 setExpressions:v14];

      [v11 setTargetDevice:v9];
      aceHandler = self->_aceHandler;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __74___SVXRemoteExpressionParsingService_parseExpressions_targetDevice_reply___block_invoke;
      v17[3] = &unk_264552590;
      id v18 = v10;
      [(SVXAceCommandHandling *)aceHandler handleAceCommand:v11 reply:v17];
    }
    else
    {
      v16 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[_SVXRemoteExpressionParsingService parseExpressions:targetDevice:reply:]";
        _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s No parseable expressions - parsing failed", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (_SVXRemoteExpressionParsingService)initWithAceHandler:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXRemoteExpressionParsingService;
  v6 = [(_SVXRemoteExpressionParsingService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_aceHandler, a3);
  }

  return v7;
}

@end