@interface MTGenericDataSourceSection
- (MTGenericDataSourceSection)init;
- (MTGenericDataSourceSection)initWithTitle:(id)a3;
- (id)shouldIncludeSeeAllBlock;
- (void)setShouldIncludeSeeAllBlock:(id)a3;
@end

@implementation MTGenericDataSourceSection

- (id)shouldIncludeSeeAllBlock
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACB597B4;
  aBlock[3] = &block_descriptor_27;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v5;
}

- (void)setShouldIncludeSeeAllBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  *v6 = sub_1ACB59D90;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (MTGenericDataSourceSection)initWithTitle:(id)a3
{
  uint64_t v4 = sub_1ACE761B8();
  uint64_t v5 = (uint64_t (**)())((char *)self + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  void *v5 = sub_1ACA58428;
  v5[1] = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___MTGenericDataSourceSection_storedTitle);
  uint64_t *v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GenericDataSourceSection();
  return [(MTGenericDataSourceSection *)&v9 init];
}

- (MTGenericDataSourceSection)init
{
  result = (MTGenericDataSourceSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end