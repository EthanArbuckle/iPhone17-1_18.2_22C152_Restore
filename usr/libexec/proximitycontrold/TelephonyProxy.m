@interface TelephonyProxy
- (NSString)description;
- (_TtC17proximitycontrold14TelephonyProxy)init;
- (void)conversationManager:(id)a3 presentationContextChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
@end

@implementation TelephonyProxy

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  [*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC17proximitycontrold14TelephonyProxy_conversationManager) removeDelegate:v4];
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for TelephonyProxy();
  [(TelephonyProxy *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC17proximitycontrold14TelephonyProxy)init
{
  result = (_TtC17proximitycontrold14TelephonyProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversationManager:(id)a3 presentationContextChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001CA894(v7, 0xD000000000000044, 0x80000001002C39B0, 0);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001CA894(v7, 0xD000000000000036, 0x80000001002C3970, 0);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001CA894(v7, 0xD000000000000040, 0x80000001002C38E0, 1);
}

- (NSString)description
{
  v2 = self;
  sub_1001C7DE4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end