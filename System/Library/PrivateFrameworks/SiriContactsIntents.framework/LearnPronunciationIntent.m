@interface LearnPronunciationIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (LearnPronunciationIntent)init;
- (LearnPronunciationIntent)initWithCoder:(id)a3;
- (LearnPronunciationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (LearnPronunciationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation LearnPronunciationIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (LearnPronunciationIntent)init
{
  return (LearnPronunciationIntent *)LearnPronunciationIntent.init()();
}

- (LearnPronunciationIntent)initWithCoder:(id)a3
{
  return (LearnPronunciationIntent *)LearnPronunciationIntent.init(coder:)(a3);
}

- (LearnPronunciationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (LearnPronunciationIntent *)LearnPronunciationIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (LearnPronunciationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (LearnPronunciationIntent *)LearnPronunciationIntent.init(domain:verb:parametersByName:)();
}

@end