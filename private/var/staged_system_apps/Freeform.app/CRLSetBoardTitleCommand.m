@interface CRLSetBoardTitleCommand
- (NSString)boardTitle;
- (NSString)previousBoardTitle;
- (_TtC8Freeform23CRLSetBoardTitleCommand)init;
- (id)userFacingCommandName;
- (void)setPreviousBoardTitle:(id)a3;
@end

@implementation CRLSetBoardTitleCommand

- (NSString)boardTitle
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)previousBoardTitle
{
  if (*(void *)&self->boardTitle[OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_previousBoardTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setPreviousBoardTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_previousBoardTitle);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (id)userFacingCommandName
{
  v3 = self;
  uint64_t v4 = self;
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

- (_TtC8Freeform23CRLSetBoardTitleCommand)init
{
  result = (_TtC8Freeform23CRLSetBoardTitleCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100DFAB3C((uint64_t)self + OBJC_IVAR____TtC8Freeform23CRLSetBoardTitleCommand_boardIdentifier, type metadata accessor for CRLBoardIdentifier);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end