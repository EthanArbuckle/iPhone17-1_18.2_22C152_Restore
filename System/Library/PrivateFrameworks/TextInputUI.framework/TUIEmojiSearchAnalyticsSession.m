@interface TUIEmojiSearchAnalyticsSession
+ (id)emojiSearchFieldSpecTuples;
+ (void)registerEventSpecIfNecessary;
- (TUIEmojiSearchAnalyticsSession)initWithLocale:(id)a3;
- (void)beginSessionWithInitialSearchQuery:(id)a3;
- (void)clearButtonPressed;
- (void)emojiInserted:(id)a3;
- (void)endSession;
- (void)searchQueryWasChangedTo:(id)a3;
@end

@implementation TUIEmojiSearchAnalyticsSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialInputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_trackedSearchQuery, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)endSession
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(TUIAnalyticsSession *)self isSessionActive])
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = [(id)objc_opt_class() emojiSearchFieldSpecTuples];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v10 = [v9 key];
          v11 = [(TUIEmojiSearchAnalyticsSession *)self valueForKey:v10];

          [v3 addObject:v11];
          v12 = [v9 key];
          [(TUIEmojiSearchAnalyticsSession *)self setValue:&unk_1EDC79908 forKey:v12];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
    v13 = self->_initialInputModeIdentifier;
    v14 = [(id)objc_opt_class() preferredEventName:@"emojiSearchSession"];
    v15 = [MEMORY[0x1E4FAE260] sharedInstance];
    [v15 dispatchEventWithName:v14 values:v3 inputMode:v13];
  }
  v16.receiver = self;
  v16.super_class = (Class)TUIEmojiSearchAnalyticsSession;
  [(TUIAnalyticsSession *)&v16 endSession];
}

- (void)clearButtonPressed
{
}

- (void)searchQueryWasChangedTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  uint64_t v6 = v5 - [(NSString *)self->_trackedSearchQuery length];
  if (v6 >= 1)
  {
    uint64_t v7 = 56;
    v8 = (objc_class *)(self->_numberOfCharactersInserted + v6);
LABEL_3:
    *(Class *)((char *)&self->super.super.isa + v7) = v8;
    goto LABEL_5;
  }
  if (v6 < 0)
  {
    uint64_t v7 = 64;
    v8 = (objc_class *)(self->_numberOfCharactersDeleted - v6);
    goto LABEL_3;
  }
LABEL_5:
  trackedSearchQuery = self->_trackedSearchQuery;
  self->_trackedSearchQuery = (NSString *)v4;
}

- (void)emojiInserted:(id)a3
{
}

- (void)beginSessionWithInitialSearchQuery:(id)a3
{
  id v4 = (NSString *)a3;
  [(id)objc_opt_class() registerEventSpecIfNecessary];
  trackedSearchQuery = self->_trackedSearchQuery;
  self->_trackedSearchQuery = v4;
  uint64_t v6 = v4;

  unint64_t v7 = [(NSString *)v6 length];
  self->_numberOfInitialCharacters = v7;
  [(TUIAnalyticsSession *)self beginSession];
}

- (TUIEmojiSearchAnalyticsSession)initWithLocale:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIEmojiSearchAnalyticsSession;
  uint64_t v6 = [(TUIEmojiSearchAnalyticsSession *)&v11 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    uint64_t v8 = [(id)objc_opt_class() currentInputModeIdentifier];
    initialInputModeIdentifier = v7->_initialInputModeIdentifier;
    v7->_initialInputModeIdentifier = (NSString *)v8;
  }
  return v7;
}

+ (void)registerEventSpecIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__TUIEmojiSearchAnalyticsSession_registerEventSpecIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerEventSpecIfNecessary_onceToken != -1) {
    dispatch_once(&registerEventSpecIfNecessary_onceToken, block);
  }
}

void __62__TUIEmojiSearchAnalyticsSession_registerEventSpecIfNecessary__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) emojiSearchFieldSpecTuples];
  id v7 = [v2 allFieldSpecs];

  v3 = [*(id *)(a1 + 32) preferredEventName:@"emojiSearchSession"];
  uint64_t v4 = [MEMORY[0x1E4FAE248] eventSpecWithName:@"emojiSearchSession" inputModeRequired:1 fieldSpecs:v7];
  id v5 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v5 registerEventSpec:v4];

  uint64_t v6 = (void *)registerEventSpecIfNecessary_eventSpec;
  registerEventSpecIfNecessary_eventSpec = v4;
}

+ (id)emojiSearchFieldSpecTuples
{
  if (emojiSearchFieldSpecTuples_onceToken != -1) {
    dispatch_once(&emojiSearchFieldSpecTuples_onceToken, &__block_literal_global_1367);
  }
  v2 = (void *)emojiSearchFieldSpecTuples_tuples;
  return v2;
}

void __60__TUIEmojiSearchAnalyticsSession_emojiSearchFieldSpecTuples__block_invoke()
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v12 = (void *)MEMORY[0x1E4F1CAA0];
  v13 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiInserted"];
  v0 = +[FieldSpecTuple tupleWithKey:@"numberOfEmojiInserted" eventSpec:v13];
  v14[0] = v0;
  v1 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"initialCharacters"];
  v2 = +[FieldSpecTuple tupleWithKey:@"numberOfInitialCharacters" eventSpec:v1];
  v14[1] = v2;
  v3 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"charactersInserted"];
  uint64_t v4 = +[FieldSpecTuple tupleWithKey:@"numberOfCharactersInserted" eventSpec:v3];
  v14[2] = v4;
  id v5 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"charactersDeleted"];
  uint64_t v6 = +[FieldSpecTuple tupleWithKey:@"numberOfCharactersDeleted" eventSpec:v5];
  v14[3] = v6;
  id v7 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"clearActions"];
  uint64_t v8 = +[FieldSpecTuple tupleWithKey:@"numberOfClearActions" eventSpec:v7];
  v14[4] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
  uint64_t v10 = [v12 orderedSetWithArray:v9];
  objc_super v11 = (void *)emojiSearchFieldSpecTuples_tuples;
  emojiSearchFieldSpecTuples_tuples = v10;
}

@end