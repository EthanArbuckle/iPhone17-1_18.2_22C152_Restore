@interface MessagingError
- (_TtC25keychainsharingmessagingd14MessagingError)initWithCoder:(id)a3;
- (_TtC25keychainsharingmessagingd14MessagingError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation MessagingError

- (_TtC25keychainsharingmessagingd14MessagingError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MessagingError();
  v10 = [(MessagingError *)&v12 initWithDomain:v8 code:a4 userInfo:v9.super.isa];

  return v10;
}

- (_TtC25keychainsharingmessagingd14MessagingError)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MessagingError();
  return [(MessagingError *)&v5 initWithCoder:a3];
}

@end