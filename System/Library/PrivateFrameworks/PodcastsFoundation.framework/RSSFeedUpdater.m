@interface RSSFeedUpdater
- (_TtC18PodcastsFoundation14RSSFeedUpdater)init;
- (id)sessionCompletionHandler;
- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7;
- (void)didRestoreFeedUrlTask:(id)a3;
- (void)performOnFeedProcessingQueue:(id)a3;
- (void)setSessionCompletionHandler:(id)a3;
@end

@implementation RSSFeedUpdater

- (_TtC18PodcastsFoundation14RSSFeedUpdater)init
{
  result = (_TtC18PodcastsFoundation14RSSFeedUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC18PodcastsFoundation14RSSFeedUpdater_ingesterProvider);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation14RSSFeedUpdater_pendingRestorationQueue));
  swift_release();
}

- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7731B0);
  MEMORY[0x1F4188790](v12 - 8);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    id v23 = a5;
    id v24 = a6;
    v25 = self;
    id v26 = a3;
    unint64_t v21 = 0xF000000000000000;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v27 = sub_1ACE74F28();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v14, 1, 1, v27);
    goto LABEL_6;
  }
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  id v19 = a3;
  a4 = (id)sub_1ACE74F88();
  unint64_t v21 = v20;

  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1ACE74E98();

  uint64_t v22 = sub_1ACE74F28();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v14, 0, 1, v22);
LABEL_6:
  _s18PodcastsFoundation14RSSFeedUpdaterC24didDownloadFeedWithError_4data4task12requestedUrl18useBackgroundFetchys0I0_pSg_0B04DataVSgSo16NSURLSessionTaskCSgAK3URLVSgSbtF_0(a3, (uint64_t)a4, v21, a5, (uint64_t)v14);
  sub_1ACAB2EF0((uint64_t)a4, v21);

  sub_1ACA7FA64((uint64_t)v14);
}

- (void)didRestoreFeedUrlTask:(id)a3
{
  uint64_t v4 = sub_1ACE74F28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE74E98();
  v8 = self;
  RSSFeedUpdater.didRestoreFeedUrlTask(_:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)performOnFeedProcessingQueue:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  RSSFeedUpdater.perform(onFeedProcessingQueue:)((uint64_t)sub_1ACD6D908, v5);

  swift_release();
}

- (id)sessionCompletionHandler
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation14RSSFeedUpdater_externalFeedDownloader);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_sessionCompletionHandler);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;

    v9[4] = sub_1ACD6D908;
    v9[5] = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 1107296256;
    v9[2] = sub_1ACA6DA9C;
    v9[3] = &block_descriptor_58_0;
    v7 = _Block_copy(v9);
    swift_release();
  }
  else
  {

    v7 = 0;
  }
  return v7;
}

- (void)setSessionCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    id v4 = sub_1ACD6D908;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = self;
  RSSFeedUpdater.sessionCompletionHandler.setter((uint64_t)v4, v5);
}

@end