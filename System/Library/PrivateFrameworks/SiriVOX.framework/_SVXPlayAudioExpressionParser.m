@interface _SVXPlayAudioExpressionParser
- (void)parsePlayAudio:(id)a3 reply:(id)a4;
@end

@implementation _SVXPlayAudioExpressionParser

- (void)parsePlayAudio:(id)a3 reply:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (os_log_t *)MEMORY[0x263F28348];
    v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Looking for parseable expressions in command %@", buf, 0x16u);
    }
    id v10 = objc_alloc_init(MEMORY[0x263F64F80]);
    v11 = [v6 message];
    v12 = [MEMORY[0x263F08C38] UUID];
    v13 = [v12 UUIDString];
    [v10 setAceId:v13];

    [v10 setAttachmentExpression:v11];
    [v10 setContext:v11];
    if (v11)
    {
      v14 = [v11 groupIdentifier];
      v15 = +[_SVXSpeakableNamespaceDomainOccurrenceProvider providerForDomain:v14];

      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v15 attachmentURLForExpression:*MEMORY[0x263F65BD8]],
            (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v17 = (void *)v16;
        v18 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
          __int16 v29 = 2112;
          id v30 = v11;
          _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s Expression doesn't require remote parse: %@", buf, 0x16u);
        }
        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      }
      else
      {
        v19 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
          __int16 v29 = 2112;
          id v30 = v10;
          _os_log_impl(&dword_220062000, v19, OS_LOG_TYPE_INFO, "%s Parsing expression with parsing service: %@", buf, 0x16u);
        }
        v20 = [(_SVXExpressionParser *)self parsingService];
        id v26 = v10;
        v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __54___SVXPlayAudioExpressionParser_parsePlayAudio_reply___block_invoke;
        v23[3] = &unk_264552FB0;
        id v25 = v7;
        id v24 = v10;
        [v20 parseExpressions:v21 targetDevice:0 reply:v23];

        v17 = v25;
      }
    }
    else
    {
      v22 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_220062000, v22, OS_LOG_TYPE_INFO, "%s No expression to parse for PlayAudio: %@", buf, 0x16u);
      }
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

@end