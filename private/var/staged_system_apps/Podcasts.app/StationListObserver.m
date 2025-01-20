@interface StationListObserver
- (_TtC8Podcasts19StationListObserver)init;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
@end

@implementation StationListObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19StationListObserver_stationsObserver);
  v3 = self;
  [v2 setDelegate:0];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for StationListObserver();
  [(StationListObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19StationListObserver_didChange));

  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts19StationListObserver_options;
  uint64_t v4 = type metadata accessor for StationListOptions();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003B87A4();
}

- (_TtC8Podcasts19StationListObserver)init
{
  result = (_TtC8Podcasts19StationListObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end