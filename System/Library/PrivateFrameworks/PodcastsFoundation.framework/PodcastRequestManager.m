@interface PodcastRequestManager
+ (_TtC18PodcastsFoundation21PodcastRequestManager)sharedInstance;
- (_TtC18PodcastsFoundation21PodcastRequestManager)init;
- (void)updatePodcastWithEpisodeAdamId:(id)a3 completion:(id)a4;
- (void)updatePodcastWithStoreId:(int64_t)a3 completion:(id)a4;
@end

@implementation PodcastRequestManager

+ (_TtC18PodcastsFoundation21PodcastRequestManager)sharedInstance
{
  if (qword_1E99F00C0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E99F4D88;
  return (_TtC18PodcastsFoundation21PodcastRequestManager *)v2;
}

- (void)updatePodcastWithStoreId:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_1ACCB75B8(a3, (uint64_t)sub_1ACCB90CC, v7);

  swift_release();
}

- (void)updatePodcastWithEpisodeAdamId:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1ACCB810C(v8, (uint64_t)sub_1ACCB90C4, v7);

  swift_release();
}

- (_TtC18PodcastsFoundation21PodcastRequestManager)init
{
  uint64_t v3 = OBJC_IVAR____TtC18PodcastsFoundation21PodcastRequestManager_mediaRequestController;
  id v4 = objc_allocWithZone((Class)type metadata accessor for MediaRequestController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for PodcastRequestManager();
  return [(PodcastRequestManager *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation21PodcastRequestManager_mediaRequestController));
}

@end