@interface MacAddPodcastOrStationController
- (_TtC8Podcasts32MacAddPodcastOrStationController)init;
- (void)presentAddPodcastUIWithUrl:(id)a3;
- (void)presentAddStationUI;
@end

@implementation MacAddPodcastOrStationController

- (void)presentAddPodcastUIWithUrl:(id)a3
{
  sub_100054B78((uint64_t *)&unk_1005F7750);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  v9 = self;
  sub_10030D6F4((uint64_t)v6);

  sub_100222D54((uint64_t)v6);
}

- (void)presentAddStationUI
{
  v2 = self;
  sub_10030E254();
}

- (_TtC8Podcasts32MacAddPodcastOrStationController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MacAddPodcastOrStationController();
  return [(MTAddPodcastOrStationController *)&v3 init];
}

@end