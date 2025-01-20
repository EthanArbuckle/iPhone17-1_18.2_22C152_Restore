@interface Conversation
- (NSArray)turns;
- (_TtC23SiriInvocationAnalytics12Conversation)init;
- (_TtC23SiriInvocationAnalytics12Conversation)initWithTurns:(id)a3;
- (id)debugString;
@end

@implementation Conversation

- (NSArray)turns
{
  Conversation.turns.getter();
  type metadata accessor for ConversationTurn(0);
  sub_25CA45B48();
  OUTLINED_FUNCTION_22();
  return (NSArray *)self;
}

- (_TtC23SiriInvocationAnalytics12Conversation)initWithTurns:(id)a3
{
  type metadata accessor for ConversationTurn(0);
  uint64_t v3 = sub_25CA45B58();
  return (_TtC23SiriInvocationAnalytics12Conversation *)Conversation.init(turns:)(v3);
}

- (id)debugString
{
  return sub_25C9D4BB0(self, (uint64_t)a2, (void (*)(void))Conversation.debugString());
}

- (_TtC23SiriInvocationAnalytics12Conversation)init
{
}

- (void).cxx_destruct
{
}

@end