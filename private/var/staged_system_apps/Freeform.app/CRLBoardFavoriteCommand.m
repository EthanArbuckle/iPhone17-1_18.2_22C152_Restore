@interface CRLBoardFavoriteCommand
- (BOOL)favorite;
- (_TtC8Freeform23CRLBoardFavoriteCommand)init;
- (id)userFacingCommandName;
@end

@implementation CRLBoardFavoriteCommand

- (BOOL)favorite
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLBoardFavoriteCommand_favorite);
}

- (id)userFacingCommandName
{
  v2 = self;
  sub_100DF660C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC8Freeform23CRLBoardFavoriteCommand)init
{
  result = (_TtC8Freeform23CRLBoardFavoriteCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end