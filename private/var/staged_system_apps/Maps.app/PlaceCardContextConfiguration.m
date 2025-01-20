@interface PlaceCardContextConfiguration
- (_TtC4Maps29PlaceCardContextConfiguration)init;
- (_TtC4Maps29PlaceCardContextConfiguration)initWithPlaceCardItem:(id)a3 shouldInsertInHistory:(BOOL)a4 excludedContent:(int64_t)a5;
@end

@implementation PlaceCardContextConfiguration

- (_TtC4Maps29PlaceCardContextConfiguration)initWithPlaceCardItem:(id)a3 shouldInsertInHistory:(BOOL)a4 excludedContent:(int64_t)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceCardContextConfiguration_placeCardItem) = (Class)a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceCardContextConfiguration_shouldInsertInHistory) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceCardContextConfiguration_excludedContent) = (Class)a5;
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v10 = a3;
  return [(PlaceCardContextConfiguration *)&v12 init];
}

- (_TtC4Maps29PlaceCardContextConfiguration)init
{
  result = (_TtC4Maps29PlaceCardContextConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end