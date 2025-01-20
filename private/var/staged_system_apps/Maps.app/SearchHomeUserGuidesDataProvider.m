@interface SearchHomeUserGuidesDataProvider
- (NSArray)objects;
- (NSString)identifier;
- (NSString)title;
- (_TtC4Maps32SearchHomeUserGuidesDataProvider)init;
- (_TtC4Maps32SearchHomeUserGuidesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6;
- (id)headerAccessibilityIdentifier;
- (int64_t)type;
- (void)deleteEntryAtIndex:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setObjects:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SearchHomeUserGuidesDataProvider

- (NSArray)objects
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setObjects:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_objects);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_type);
}

- (void)setType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_type) = (Class)a3;
}

- (NSString)identifier
{
  return (NSString *)sub_1001287C4();
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_1001287C4();
}

- (void)setTitle:(id)a3
{
}

- (_TtC4Maps32SearchHomeUserGuidesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  v8 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_objects) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_type) = (Class)a4;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_identifier);
  uint64_t *v13 = v9;
  v13[1] = v11;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_title);
  uint64_t *v14 = v12;
  v14[1] = v15;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for SearchHomeUserGuidesDataProvider();
  return [(SearchHomeUserGuidesDataProvider *)&v17 init];
}

- (id)headerAccessibilityIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtC4Maps32SearchHomeUserGuidesDataProvider)init
{
  result = (_TtC4Maps32SearchHomeUserGuidesDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)deleteEntryAtIndex:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_100128A6C(a3);
}

@end