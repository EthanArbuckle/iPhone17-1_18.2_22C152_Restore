@interface CategoryIngester
- (id)unsafeIngestCategoryWithCategory:(id)a3 feedCategory:(id)a4 ctx:(id)a5;
- (id)unsafeIngestFeedCategory:(id)a3 ctx:(id)a4;
- (id)unsafeIngestNewCategoryWithCtx:(id)a3 feedCategory:(id)a4;
@end

@implementation CategoryIngester

- (id)unsafeIngestNewCategoryWithCtx:(id)a3 feedCategory:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  v8 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  v9 = (void *)sub_100312838(v8, a4, (uint64_t)self, ObjectType);

  swift_unknownObjectRelease();
  swift_release();

  return v9;
}

- (id)unsafeIngestCategoryWithCategory:(id)a3 feedCategory:(id)a4 ctx:(id)a5
{
  swift_getObjectType();
  id v9 = a3;
  swift_unknownObjectRetain();
  v10 = a5;
  swift_retain();
  v11 = (void *)sub_100310F18(v9, a4, v10, (uint64_t)self);

  swift_unknownObjectRelease();
  swift_release();

  return v11;
}

- (id)unsafeIngestFeedCategory:(id)a3 ctx:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  swift_unknownObjectRetain();
  v8 = a4;
  swift_retain();
  id v9 = (void *)sub_10030F690(a3, v8, (uint64_t)self, ObjectType);
  swift_unknownObjectRelease();

  swift_release();

  return v9;
}

@end