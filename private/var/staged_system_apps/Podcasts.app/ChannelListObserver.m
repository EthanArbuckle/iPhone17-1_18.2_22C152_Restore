@interface ChannelListObserver
- (_TtC8Podcasts19ChannelListObserver)init;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
@end

@implementation ChannelListObserver

- (_TtC8Podcasts19ChannelListObserver)init
{
  return (_TtC8Podcasts19ChannelListObserver *)sub_100031F40();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19ChannelListObserver_channelObserver);
  v3 = self;
  [v2 setDelegate:0];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ChannelListObserver();
  [(ChannelListObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19ChannelListObserver_didChange));

  swift_unknownObjectRelease();
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001B55B4();
}

@end