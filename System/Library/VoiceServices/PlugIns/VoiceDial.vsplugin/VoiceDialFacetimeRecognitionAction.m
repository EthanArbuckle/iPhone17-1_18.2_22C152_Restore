@interface VoiceDialFacetimeRecognitionAction
- (VoiceDialFacetimeRecognitionAction)initWithContactInfo:(id)a3 uid:(int)a4;
- (id)perform;
@end

@implementation VoiceDialFacetimeRecognitionAction

- (VoiceDialFacetimeRecognitionAction)initWithContactInfo:(id)a3 uid:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VoiceDialFacetimeRecognitionAction;
  v8 = [(VoiceDialFacetimeRecognitionAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactInfo, a3);
    v9->_abID = a4;
  }

  return v9;
}

- (id)perform
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [(VSRecognitionURLAction *)self URL];

  if (!v3)
  {
    v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      contactInfo = self->_contactInfo;
      int abID = self->_abID;
      *(_DWORD *)buf = 138412546;
      v22 = contactInfo;
      __int16 v23 = 1024;
      LODWORD(v24) = abID;
      _os_log_impl(&dword_22A5EB000, v4, OS_LOG_TYPE_DEFAULT, "Performing FaceTime voice dial for destination ID %@ and address book record ID %d", buf, 0x12u);
    }

    id v7 = objc_alloc_init(MEMORY[0x263EFEA58]);
    v8 = [v7 contactFromPersonID:self->_abID keysToFetch:MEMORY[0x263EFFA68]];

    v9 = [v8 identifier];
    id v10 = objc_alloc_init(MEMORY[0x263F7E1B0]);
    id v11 = objc_alloc(MEMORY[0x263F7E230]);
    v12 = [v10 faceTimeProvider];
    v13 = (void *)[v11 initWithProvider:v12];

    v14 = [MEMORY[0x263F7E248] handleWithDestinationID:self->_contactInfo];
    [v13 setHandle:v14];

    [v13 setContactIdentifier:v9];
    [v13 setOriginatingUIType:42];
    v15 = PHDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v13 URL];
      *(_DWORD *)buf = 138412546;
      v22 = (NSString *)v13;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_22A5EB000, v15, OS_LOG_TYPE_DEFAULT, "Using dial request %@ to set URL %@", buf, 0x16u);
    }
    v17 = [v13 URL];
    [(VSRecognitionURLAction *)self setURL:v17];
  }
  v20.receiver = self;
  v20.super_class = (Class)VoiceDialFacetimeRecognitionAction;
  v18 = [(VSRecognitionURLAction *)&v20 perform];

  return v18;
}

- (void).cxx_destruct
{
}

@end