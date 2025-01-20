@interface TUIAnalytics
- (NSDate)timeConversationUIDisplayed;
- (TUIAnalytics)init;
- (void)ktConversationNoMatch:(BOOL)a3;
- (void)ktInteraction:(id)a3;
- (void)ktMarkAsVerified:(BOOL)a3 sasCodeGenerated:(BOOL)a4 publicKeyVisible:(BOOL)a5;
- (void)setTimeConversationUIDisplayed:(id)a3;
@end

@implementation TUIAnalytics

- (TUIAnalytics)init
{
  timeConversationUIDisplayed = self->_timeConversationUIDisplayed;
  self->_timeConversationUIDisplayed = 0;

  return self;
}

- (void)ktConversationNoMatch:(BOOL)a3
{
  timeConversationUIDisplayed = self->_timeConversationUIDisplayed;
  if (timeConversationUIDisplayed) {
    [(NSDate *)timeConversationUIDisplayed timeIntervalSinceNow];
  }
  AnalyticsSendEventLazy();
}

id __38__TUIAnalytics_ktConversationNoMatch___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"reportToApple";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = @"timeToNoMatch";
  v7[0] = v2;
  v3 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)ktMarkAsVerified:(BOOL)a3 sasCodeGenerated:(BOOL)a4 publicKeyVisible:(BOOL)a5
{
  timeConversationUIDisplayed = self->_timeConversationUIDisplayed;
  if (timeConversationUIDisplayed) {
    [(NSDate *)timeConversationUIDisplayed timeIntervalSinceNow];
  }
  AnalyticsSendEventLazy();
}

id __67__TUIAnalytics_ktMarkAsVerified_sasCodeGenerated_publicKeyVisible___block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"timeToVerified";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v9[0] = v2;
  v8[1] = @"sasCodeGenerated";
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v9[1] = v3;
  v8[2] = @"publicKeyVisible";
  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v9[2] = v4;
  v8[3] = @"success";
  v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
  v9[3] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)ktInteraction:(id)a3
{
  id v4 = a3;
  if ([@"conversationUIDisplayed" isEqualToString:v4])
  {
    v5 = [MEMORY[0x263EFF910] now];
    [(TUIAnalytics *)self setTimeConversationUIDisplayed:v5];
  }
  v7 = v4;
  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __30__TUIAnalytics_ktInteraction___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"kind";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (NSDate)timeConversationUIDisplayed
{
  return self->_timeConversationUIDisplayed;
}

- (void)setTimeConversationUIDisplayed:(id)a3
{
}

- (void).cxx_destruct
{
}

@end