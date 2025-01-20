@interface CRLBoardUndeleteCommand
- (_TtC8Freeform23CRLBoardUndeleteCommand)init;
- (id)userFacingCommandName;
@end

@implementation CRLBoardUndeleteCommand

- (id)userFacingCommandName
{
  v3 = self;
  v4 = self;
  id v5 = [v3 mainBundle];
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v5 localizedStringForKey:v6 value:v7 table:v8];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC8Freeform23CRLBoardUndeleteCommand)init
{
  result = (_TtC8Freeform23CRLBoardUndeleteCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end