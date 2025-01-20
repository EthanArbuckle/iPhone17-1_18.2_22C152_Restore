@interface LearnPronunciationIntentResponse
- (LearnPronunciationIntentResponse)init;
- (LearnPronunciationIntentResponse)initWithBackingStore:(id)a3;
- (LearnPronunciationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (LearnPronunciationIntentResponse)initWithCoder:(id)a3;
- (LearnPronunciationIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation LearnPronunciationIntentResponse

- (int64_t)code
{
  return LearnPronunciationIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (LearnPronunciationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (LearnPronunciationIntentResponse *)LearnPronunciationIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LearnPronunciationIntentResponse)init
{
  return (LearnPronunciationIntentResponse *)LearnPronunciationIntentResponse.init()();
}

- (LearnPronunciationIntentResponse)initWithCoder:(id)a3
{
  return (LearnPronunciationIntentResponse *)LearnPronunciationIntentResponse.init(coder:)(a3);
}

- (LearnPronunciationIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (LearnPronunciationIntentResponse *)LearnPronunciationIntentResponse.init(backingStore:)(a3);
}

- (LearnPronunciationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (LearnPronunciationIntentResponse *)LearnPronunciationIntentResponse.init(propertiesByName:)(v3);
}

@end