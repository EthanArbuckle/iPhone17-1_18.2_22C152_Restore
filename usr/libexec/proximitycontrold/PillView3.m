@interface PillView3
- (_TtC17proximitycontrold9PillView3)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4;
- (void)dealloc;
@end

@implementation PillView3

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1001F6810();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 ulog:40 message:v4];

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for PillView3();
  [(PillView3 *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC17proximitycontrold9PillView3)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC17proximitycontrold9PillView3 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end