@interface RecommendationModulesResponse
- (id)itemInSection:(int64_t)a3 row:(int64_t)a4;
- (id)itemsFor:(int64_t)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
@end

@implementation RecommendationModulesResponse

- (id)itemsFor:(int64_t)a3
{
  swift_retain();
  unint64_t v3 = swift_bridgeObjectRetain();
  sub_1ACA4DD8C(v3);
  swift_release();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1ACE76558();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  uint64_t v5 = *((void *)self + 2);
  if ((v5 & 0xC000000000000001) != 0)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    id v7 = (id)MEMORY[0x1AD119490](a4, v5);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  v6 = *(void **)(v5 + 8 * a4 + 32);
  swift_retain();
  id v7 = v6;
LABEL_5:
  swift_release();
  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  unint64_t v3 = *(void *)self->modulesMetadata;
  if (!(v3 >> 62))
  {
    unint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
LABEL_3:
    swift_release();
    return v4;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1ACE77508();
  swift_bridgeObjectRelease();
  if ((v4 & 0x8000000000000000) == 0) {
    goto LABEL_3;
  }
  unint64_t result = sub_1ACE77488();
  __break(1u);
  return result;
}

- (unint64_t)numberOfSections
{
  return 1;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  unint64_t v3 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  unint64_t v4 = (char *)objc_allocWithZone(v3);
  uint64_t v5 = (uint64_t (**)())&v4[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *uint64_t v5 = sub_1ACA58428;
  v5[1] = 0;
  v6 = &v4[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0xE000000000000000;
  v9.receiver = v4;
  v9.super_class = v3;
  swift_retain();
  id v7 = [(RecommendationModulesResponse *)&v9 init];
  swift_release();
  return v7;
}

@end