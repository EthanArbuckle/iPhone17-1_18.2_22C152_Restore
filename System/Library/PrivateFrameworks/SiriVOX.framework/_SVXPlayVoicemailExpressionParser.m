@interface _SVXPlayVoicemailExpressionParser
- (void)parsePlayVoicemail:(id)a3 reply:(id)a4;
@end

@implementation _SVXPlayVoicemailExpressionParser

- (void)parsePlayVoicemail:(id)a3 reply:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (os_log_t *)MEMORY[0x263F28348];
    v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Looking for parseable expressions in command %@", buf, 0x16u);
    }
    id v10 = objc_alloc_init(MEMORY[0x263F64F80]);
    id v11 = objc_alloc_init(MEMORY[0x263F64B68]);
    v12 = [v6 voiceMailId];
    [v11 setIdentifier:v12];

    v13 = [MEMORY[0x263F08C38] UUID];
    v14 = [v13 UUIDString];
    [v10 setAceId:v14];

    [v10 setAttachmentExpression:v11];
    [v10 setContext:v11];
    v15 = [v6 targetDevice];
    v16 = [v11 identifier];

    v17 = *v8;
    BOOL v18 = os_log_type_enabled(*v8, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]";
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s Parsing expression with parsing service: %@", buf, 0x16u);
      }
      v19 = [(_SVXExpressionParser *)self parsingService];
      id v24 = v10;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __62___SVXPlayVoicemailExpressionParser_parsePlayVoicemail_reply___block_invoke;
      v21[3] = &unk_264552FB0;
      id v23 = v7;
      id v22 = v10;
      [v19 parseExpressions:v20 targetDevice:v15 reply:v21];
    }
    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]";
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s No expression to parse for PlayVoicemail: %@", buf, 0x16u);
      }
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

@end