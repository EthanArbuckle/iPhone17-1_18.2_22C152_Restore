@interface MTSchemaMTAppInvocationMetadata(LTTranslationAdditions)
+ (id)lt_initWithTranslateAppContext:()LTTranslationAdditions;
@end

@implementation MTSchemaMTAppInvocationMetadata(LTTranslationAdditions)

+ (id)lt_initWithTranslateAppContext:()LTTranslationAdditions
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F6E380]);
  unint64_t v5 = [v3 displayMode];
  if (v5 <= 3) {
    [v4 setDisplayMode:v5];
  }
  v6 = (void *)MEMORY[0x263F6E408];
  v7 = [v3 localePair];
  v8 = objc_msgSend(v6, "lt_initWithLocalePair:", v7);
  [v4 setLocalePair:v8];

  objc_msgSend(v4, "setIsGenderAlternativeEnabled:", objc_msgSend(v3, "isGenderAlternativeEnabled"));
  unint64_t v9 = [v3 tabName];
  if (v9 <= 4) {
    [v4 setTabName:v9];
  }
  id v10 = objc_alloc(MEMORY[0x263F6EEE0]);
  v11 = [v3 tabSessionId];
  v12 = (void *)[v10 initWithNSUUID:v11];
  [v4 setTabSessionId:v12];

  unint64_t v13 = [v3 conversationTabView];
  if (v13 <= 2) {
    [v4 setConversationTabView:v13];
  }
  objc_msgSend(v4, "setIsPlayTranslationsEnabled:", objc_msgSend(v3, "isPlayTranslationsEnabled"));
  v14 = [v3 autoTranslateSessionId];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F6EEE0]);
    v16 = [v3 autoTranslateSessionId];
    v17 = (void *)[v15 initWithNSUUID:v16];
    [v4 setAutoTranslateSessionId:v17];
  }
  unint64_t v18 = [v3 audioChannel] - 1;
  if (v18 < 5) {
    uint64_t v19 = (v18 + 1);
  }
  else {
    uint64_t v19 = 0;
  }
  [v4 setAudioChannel:v19];

  return v4;
}

@end