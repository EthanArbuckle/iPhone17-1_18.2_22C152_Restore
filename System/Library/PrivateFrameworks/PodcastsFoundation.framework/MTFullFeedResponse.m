@interface MTFullFeedResponse
- (id)itemInSection:(int64_t)a3 row:(int64_t)a4;
- (id)itemsFor:(int64_t)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
@end

@implementation MTFullFeedResponse

- (id)itemsFor:(int64_t)a3
{
  swift_beginAccess();
  v4 = self;
  unint64_t v5 = swift_bridgeObjectRetain();
  sub_1ACA4DD8C(v5);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1ACE76558();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  v6 = self;
  v7 = (void *)sub_1ACA7E1C8(a3, a4);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  v4 = self;
  unint64_t v5 = sub_1ACA7E390(a3);

  return v5;
}

- (unint64_t)numberOfSections
{
  if ((*(unsigned char **)((char *)&self->super.super.isa + OBJC_IVAR___MTFullFeedResponse_fullFeedRequest))[OBJC_IVAR___MTFullFeedRequest_isSerial] != 1) {
    return 1;
  }
  v2 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation16BaseFeedResponse_parsedCache;
  swift_beginAccess();
  return *(void *)(*((void *)v2 + 2) + 16);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v4 = self;
  uint64_t v5 = sub_1ACA7E7DC(a3);
  uint64_t v7 = v6;
  v8 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = (uint64_t (**)())&v9[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *v10 = sub_1ACA58428;
  v10[1] = 0;
  v11 = (uint64_t *)&v9[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  uint64_t *v11 = v5;
  v11[1] = v7;
  v14.receiver = v9;
  v14.super_class = v8;
  v12 = [(BaseFeedResponse *)&v14 init];

  return v12;
}

- (void).cxx_destruct
{
}

@end