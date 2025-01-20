@interface VSUIVoiceShortcutCard
- (INIntent)intent;
- (INIntentResponse)intentResponse;
- (NSArray)sectionCommands;
- (NSString)shortcutIdentifier;
- (VSUIVoiceShortcutCard)initWithCard:(id)a3;
- (id)cardIdentifier;
- (void)_configureWithCard:(id)a3;
- (void)loadCardWithCompletion:(id)a3;
- (void)loadCardWithContent:(id)a3 completion:(id)a4;
@end

@implementation VSUIVoiceShortcutCard

- (VSUIVoiceShortcutCard)initWithCard:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSUIVoiceShortcutCard;
  v5 = [(VSUIAsyncLoadingCard *)&v9 initWithCard:v4];
  v6 = v5;
  if (v5)
  {
    [(VSUIVoiceShortcutCard *)v5 _configureWithCard:v4];
    v7 = v6;
  }

  return v6;
}

- (void)_configureWithCard:(id)a3
{
  id v4 = a3;
  v5 = [v4 interactions];
  id v33 = [v5 anyObject];

  v6 = [v33 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v6;
    v7 = [v32 voiceCommand];
    v8 = [v7 vocabularyIdentifier];
    shortcutIdentifier = self->_shortcutIdentifier;
    self->_shortcutIdentifier = v8;

    v10 = [v33 intentResponse];
    v11 = [v10 underlyingIntent];
    v12 = [v10 underlyingIntentResponse];
    v13 = [v11 typeName];
    v14 = [v11 messageData];
    INIntentCreate();
    v15 = (INIntent *)objc_claimAutoreleasedReturnValue();

    v16 = [v12 typeName];
    v17 = [v12 messageData];
    INIntentResponseCreate();
    v31 = (INIntentResponse *)objc_claimAutoreleasedReturnValue();

    v18 = [v32 _metadata];
    v19 = [(INIntent *)v15 _metadata];
    objc_msgSend(v19, "setExecutionContext:", objc_msgSend(v18, "executionContext"));
    [(INIntent *)v15 _setMetadata:v19];
    intent = self->_intent;
    self->_intent = v15;
    v21 = v15;

    intentResponse = self->_intentResponse;
    self->_intentResponse = v31;
  }
  else
  {
    objc_storeStrong((id *)&self->_intent, v6);
    v23 = [v33 intentResponse];
    v10 = self->_intentResponse;
    self->_intentResponse = v23;
  }

  v24 = [v4 cardSections];

  v25 = [v24 firstObject];

  uint64_t v26 = [v25 commands];
  v27 = (void *)v26;
  v28 = (void *)MEMORY[0x263EFFA68];
  if (v26) {
    v28 = (void *)v26;
  }
  v29 = v28;

  sectionCommands = self->_sectionCommands;
  self->_sectionCommands = v29;
}

- (id)cardIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)loadCardWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = [(VSUIVoiceShortcutCard *)self intent];
  v6 = [(VSUIVoiceShortcutCard *)self intentResponse];
  if (v5)
  {
    v7 = [objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v5 response:v6];
    [(VSUIVoiceShortcutCard *)self loadCardWithContent:v7 completion:v4];
  }
  else
  {
    v7 = os_log_create("com.apple.cards.VoiceShortcutsUICardKitProviderSupport", "VSUIVoiceShortcutCard");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VSUIVoiceShortcutCard loadCardWithCompletion:](self, v7);
    }

    v4[2](v4, 0);
  }
}

- (void)loadCardWithContent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setStyle:0];
  [v8 setShowThumbnailImage:1];
  objc_super v9 = (void *)[objc_alloc(MEMORY[0x263F25178]) initWithCardViewConfig:v8];
  [v9 setFormat:1];
  [v9 setContent:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__VSUIVoiceShortcutCard_loadCardWithContent_completion___block_invoke;
  v11[3] = &unk_2649FC040;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 startWithReply:v11];
}

void __56__VSUIVoiceShortcutCard_loadCardWithContent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 card];
  v3 = [v8 cardSections];
  id v4 = [v3 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 sectionCommands];
    [v6 setCommands:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (NSArray)sectionCommands
{
  return self->_sectionCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionCommands, 0);
  objc_storeStrong((id *)&self->_intentResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
}

- (void)loadCardWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = [a1 shortcutIdentifier];
  v5 = [a1 intentResponse];
  int v6 = 138543618;
  id v7 = v4;
  __int16 v8 = 2114;
  objc_super v9 = v5;
  _os_log_error_impl(&dword_22F0E9000, a2, OS_LOG_TYPE_ERROR, "Nil intent encountered while loading VSUIVoiceShortcutCard: shortcutIdentifier = %{public}@, intentResponse = %{public}@", (uint8_t *)&v6, 0x16u);
}

@end