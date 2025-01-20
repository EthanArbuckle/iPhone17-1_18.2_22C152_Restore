@interface BaseFeedResponse
- (_TtC18PodcastsFoundation16BaseFeedResponse)init;
- (id)itemInSection:(int64_t)a3 row:(int64_t)a4;
- (id)itemsFor:(int64_t)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
@end

@implementation BaseFeedResponse

- (id)itemsFor:(int64_t)a3
{
  v3 = (void *)sub_1ACE76558();
  return v3;
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  id v5 = objc_allocWithZone(MEMORY[0x1E4FBA8A8]);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_init);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return 0;
}

- (unint64_t)numberOfSections
{
  return 0;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  id v4 = objc_allocWithZone(MEMORY[0x1E4FBA8A8]);
  id v5 = self;
  id v6 = objc_msgSend(v4, sel_init);

  return v6;
}

- (_TtC18PodcastsFoundation16BaseFeedResponse)init
{
  result = (_TtC18PodcastsFoundation16BaseFeedResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1ACA39598((uint64_t)self + OBJC_IVAR____TtC18PodcastsFoundation16BaseFeedResponse_params);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end