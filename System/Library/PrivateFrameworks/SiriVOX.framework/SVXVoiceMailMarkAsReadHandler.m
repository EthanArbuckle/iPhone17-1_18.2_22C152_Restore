@interface SVXVoiceMailMarkAsReadHandler
- (SVXVoiceMailMarkAsReadHandler)init;
- (SVXVoiceMailMarkAsReadHandler)initWithClientLiteFactory:(id)a3 plistBinaryParser:(id)a4;
- (void)markVoiceMailAsRead:(id)a3 forRemoteDevice:(id)a4;
@end

@implementation SVXVoiceMailMarkAsReadHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistBinaryParser, 0);

  objc_storeStrong((id *)&self->_afClientLiteFactory, 0);
}

- (void)markVoiceMailAsRead:(id)a3 forRemoteDevice:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_t *)MEMORY[0x263F28348];
  v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SVXVoiceMailMarkAsReadHandler markVoiceMailAsRead:forRemoteDevice:]";
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F64B68]);
  v11 = [MEMORY[0x263F08C38] UUID];
  v12 = [v11 UUIDString];
  [v10 setAceId:v12];

  [v10 setIdentifier:v6];
  id v13 = objc_alloc_init(MEMORY[0x263F64770]);
  v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [v14 UUIDString];
  [v13 setAceId:v15];

  [v13 setObject:v10];
  plistBinaryParser = self->_plistBinaryParser;
  v17 = [v13 dictionary];
  id v25 = 0;
  v18 = [(SVXPlistBinaryParser *)plistBinaryParser dataWithPropertyList:v17 format:200 options:0 error:&v25];
  id v19 = v25;

  if (v18)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F648D8]);
    v21 = [MEMORY[0x263F08C38] UUID];
    v22 = [v21 UUIDString];
    [v20 setAceId:v22];

    [v20 setSerializedCommand:v18];
    [v20 setRemoteDevice:v7];
    v23 = [(SVXAFClientLiteFactory *)self->_afClientLiteFactory create];
    [v23 handleCommand:v20 afterCurrentRequest:0 commandHandler:0 completion:&__block_literal_global_3123];
  }
  else
  {
    v24 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[SVXVoiceMailMarkAsReadHandler markVoiceMailAsRead:forRemoteDevice:]";
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_error_impl(&dword_220062000, v24, OS_LOG_TYPE_ERROR, "%s Serialization failed: %@", buf, 0x16u);
    }
  }
}

void __69__SVXVoiceMailMarkAsReadHandler_markVoiceMailAsRead_forRemoteDevice___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[SVXVoiceMailMarkAsReadHandler markVoiceMailAsRead:forRemoteDevice:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s Error marking voicemail as read: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (SVXVoiceMailMarkAsReadHandler)initWithClientLiteFactory:(id)a3 plistBinaryParser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXVoiceMailMarkAsReadHandler;
  id v9 = [(SVXVoiceMailMarkAsReadHandler *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_afClientLiteFactory, a3);
    objc_storeStrong((id *)&v10->_plistBinaryParser, a4);
  }

  return v10;
}

- (SVXVoiceMailMarkAsReadHandler)init
{
  v3 = objc_alloc_init(SVXAFClientLiteFactory);
  id v4 = objc_alloc_init(SVXPlistBinaryParser);
  v5 = [(SVXVoiceMailMarkAsReadHandler *)self initWithClientLiteFactory:v3 plistBinaryParser:v4];

  return v5;
}

@end