@interface VoiceDialRecognitionAction
- (VoiceDialRecognitionAction)initWithPhoneNumber:(id)a3 uid:(int)a4;
- (id)perform;
@end

@implementation VoiceDialRecognitionAction

- (VoiceDialRecognitionAction)initWithPhoneNumber:(id)a3 uid:(int)a4
{
  id v7 = a3;
  v8 = [(VoiceDialRecognitionAction *)self init];
  if (v8)
  {
    if ([v7 length])
    {
      objc_storeStrong((id *)&v8->_phoneNumber, a3);
      v8->_uid = a4;
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (id)perform
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = VoiceDialNumberToDialForNumber(self->_phoneNumber);
  v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int uid = self->_uid;
    *(_DWORD *)buf = 138412546;
    v21 = v3;
    __int16 v22 = 1024;
    LODWORD(v23) = uid;
    _os_log_impl(&dword_22A5EB000, v4, OS_LOG_TYPE_DEFAULT, "Performing voice dial for phone number %@ and address book record ID %d", buf, 0x12u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFEA58]);
  id v7 = [v6 contactFromPersonID:self->_uid keysToFetch:MEMORY[0x263EFFA68]];

  v8 = [v7 identifier];
  id v9 = objc_alloc_init(MEMORY[0x263F7E1B0]);
  id v10 = objc_alloc(MEMORY[0x263F7E230]);
  v11 = [v9 telephonyProvider];
  v12 = (void *)[v10 initWithProvider:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x263F7E248]) initWithType:2 value:v3];
  [v12 setHandle:v13];

  [v12 setContactIdentifier:v8];
  [v12 setOriginatingUIType:42];
  v14 = PHDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v12 URL];
    *(_DWORD *)buf = 138412546;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_22A5EB000, v14, OS_LOG_TYPE_DEFAULT, "Using dial request %@ to set URL %@", buf, 0x16u);
  }
  v16 = [v12 URL];
  [(VSRecognitionURLAction *)self setURL:v16];

  v19.receiver = self;
  v19.super_class = (Class)VoiceDialRecognitionAction;
  v17 = [(VSRecognitionURLAction *)&v19 perform];

  return v17;
}

- (void).cxx_destruct
{
}

@end