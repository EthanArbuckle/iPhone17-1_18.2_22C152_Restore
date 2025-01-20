@interface ConversationTurn
- (_TtC23SiriInvocationAnalytics16ConversationTurn)init;
- (id)debugString;
@end

@implementation ConversationTurn

- (_TtC23SiriInvocationAnalytics16ConversationTurn)init
{
  return (_TtC23SiriInvocationAnalytics16ConversationTurn *)ConversationTurn.init()();
}

- (id)debugString
{
  return sub_25C9D4BB0(self, (uint64_t)a2, (void (*)(void))ConversationTurn.debugString());
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC23SiriInvocationAnalytics16ConversationTurn_turnID;
  sub_25CA454E8();
  OUTLINED_FUNCTION_18_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end