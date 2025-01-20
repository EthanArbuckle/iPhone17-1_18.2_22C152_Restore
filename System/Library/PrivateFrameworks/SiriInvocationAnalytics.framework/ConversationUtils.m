@interface ConversationUtils
+ (id)conversationTurnTypeToStringWithTurnType:(int64_t)a3;
+ (int64_t)stringToConversationTurnTypeWithTypeString:(id)a3;
- (_TtC23SiriInvocationAnalytics17ConversationUtils)init;
@end

@implementation ConversationUtils

+ (id)conversationTurnTypeToStringWithTurnType:(int64_t)a3
{
  static ConversationUtils.conversationTurnTypeToString(turnType:)();
  v3 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return v3;
}

+ (int64_t)stringToConversationTurnTypeWithTypeString:(id)a3
{
  uint64_t v3 = sub_25CA459A8();
  int64_t v5 = static ConversationUtils.stringToConversationTurnType(typeString:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC23SiriInvocationAnalytics17ConversationUtils)init
{
  return (_TtC23SiriInvocationAnalytics17ConversationUtils *)ConversationUtils.init()();
}

@end