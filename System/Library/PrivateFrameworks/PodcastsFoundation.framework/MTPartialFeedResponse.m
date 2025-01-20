@interface MTPartialFeedResponse
- (id)itemInSection:(int64_t)a3 row:(int64_t)a4;
- (id)itemsFor:(int64_t)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
@end

@implementation MTPartialFeedResponse

- (id)itemsFor:(int64_t)a3
{
  v3 = self;
  sub_1ACCF8838();
  swift_beginAccess();
  unint64_t v4 = swift_bridgeObjectRetain();
  sub_1ACA4DD8C(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1ACE76558();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  v6 = self;
  v7 = (void *)sub_1ACA7B190(a3, a4);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  unint64_t v4 = self;
  unint64_t v5 = sub_1ACA7B3A8(a3);

  return v5;
}

- (unint64_t)numberOfSections
{
  type metadata accessor for PartialFeedRequest();
  uint64_t v2 = swift_dynamicCastClassUnconditional() + OBJC_IVAR___MTPartialFeedRequest_sections;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  unint64_t v4 = *(uint64_t (**)(unint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x100);
  unint64_t v5 = self;
  uint64_t v6 = v4(a3);
  uint64_t v8 = v7;
  v9 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = (uint64_t (**)())&v10[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *v11 = sub_1ACA58428;
  v11[1] = 0;
  v12 = (uint64_t *)&v10[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  uint64_t *v12 = v6;
  v12[1] = v8;
  v17.receiver = v10;
  v17.super_class = v9;
  v13 = [(BaseFeedResponse *)&v17 init];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v5;
  *(void *)(v14 + 24) = a3;
  v15 = (uint64_t (**)())((char *)v13 + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  *v15 = sub_1ACA7CA40;
  v15[1] = (uint64_t (*)())v14;
  swift_release();
  return v13;
}

@end