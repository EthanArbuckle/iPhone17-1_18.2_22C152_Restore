@interface MapsFindMyLocationHandle
- (NSString)description;
- (_TtC4Maps18SearchFindMyHandle)handle;
- (_TtC4Maps20SearchFindMyLocation)location;
- (_TtC4Maps24MapsFindMyLocationHandle)init;
- (_TtC4Maps24MapsFindMyLocationHandle)initWithHandle:(id)a3 location:(id)a4;
- (id)title;
- (void)setLocation:(id)a3;
@end

@implementation MapsFindMyLocationHandle

- (_TtC4Maps18SearchFindMyHandle)handle
{
  return (_TtC4Maps18SearchFindMyHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_handle));
}

- (_TtC4Maps20SearchFindMyLocation)location
{
  return (_TtC4Maps20SearchFindMyLocation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location));
}

- (void)setLocation:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps24MapsFindMyLocationHandle)initWithHandle:(id)a3 location:(id)a4
{
  uint64_t v6 = OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_handle) = (Class)a3;
  v7 = *(Class *)((char *)&self->super.isa + v6);
  *(Class *)((char *)&self->super.isa + v6) = (Class)a4;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v9;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for MapsFindMyLocationHandle();
  v12 = [(MapsFindMyLocationHandle *)&v14 init];

  return v12;
}

- (NSString)description
{
  return (NSString *)sub_100323C0C(self, (uint64_t)a2, (void (*)(void))sub_10032417C);
}

- (id)title
{
  v2 = self;
  Handle.prettyName.getter();
  if (!v3) {
    Handle.identifier.getter();
  }
  NSString v4 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease();

  return v4;
}

- (_TtC4Maps24MapsFindMyLocationHandle)init
{
  result = (_TtC4Maps24MapsFindMyLocationHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location);
}

@end