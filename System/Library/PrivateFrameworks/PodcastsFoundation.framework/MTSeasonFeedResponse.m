@interface MTSeasonFeedResponse
- (id)sectionAtIndex:(unint64_t)a3;
@end

@implementation MTSeasonFeedResponse

- (id)sectionAtIndex:(unint64_t)a3
{
  v4 = self;
  uint64_t v5 = sub_1ACDF9738(a3);
  uint64_t v7 = v6;
  v8 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = (uint64_t (**)())&v9[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *v10 = sub_1ACA58428;
  v10[1] = 0;
  v11 = (uint64_t *)&v9[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  uint64_t *v11 = v5;
  v11[1] = v7;
  v16.receiver = v9;
  v16.super_class = v8;
  v12 = [(BaseFeedResponse *)&v16 init];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v4;
  *(void *)(v13 + 24) = a3;
  v14 = (uint64_t (**)())((char *)v12 + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  *v14 = sub_1ACDF9E20;
  v14[1] = (uint64_t (*)())v13;
  swift_release();
  return v12;
}

@end