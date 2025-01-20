@interface UniversalSearchSession
+ (BOOL)shouldUseSearchFoundation;
+ (id)sharedSession;
- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5;
@end

@implementation UniversalSearchSession

void __39__UniversalSearchSession_sharedSession__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [MEMORY[0x1E4F98C78] sharedPARSession];
  uint64_t v2 = [v1 initWithParsecdSession:v4 skipAutoFillDataUpdates:0];
  v3 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = v2;
}

+ (id)sharedSession
{
  if ([MEMORY[0x1E4F98E40] areSiriSearchSuggestionsEnabled])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__UniversalSearchSession_sharedSession__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedSession_onceToken != -1) {
      dispatch_once(&sharedSession_onceToken, block);
    }
    id v3 = (id)sharedSession_sharedSession;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a3;
  v12 = [v10 dictionaryWithCapacity:2];
  v13 = v12;
  if (v8) {
    [v12 setObject:v8 forKeyedSubscript:@"UniversalSearchBagUserInfoDictionaryKey"];
  }
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"UniversalSearchBagLoadErrorUserInfoDictionaryKey"];
  }
  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"UniversalSearchDidLoadBagNotification" object:self userInfo:v13];

  v15.receiver = self;
  v15.super_class = (Class)UniversalSearchSession;
  [(WBSParsecDSession *)&v15 session:v11 bag:v8 didLoadWithError:v9];
}

+ (BOOL)shouldUseSearchFoundation
{
  return 1;
}

@end