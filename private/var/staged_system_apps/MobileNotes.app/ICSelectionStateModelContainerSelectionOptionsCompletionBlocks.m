@interface ICSelectionStateModelContainerSelectionOptionsCompletionBlocks
- (BOOL)isEqual:(id)a3;
- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)init;
- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)initWithDataIndexedBlock:(id)a3 dataRenderedBlock:(id)a4;
- (id)copyWithZone:(void *)a3;
- (id)dataIndexedBlock;
- (id)dataRenderedBlock;
@end

@implementation ICSelectionStateModelContainerSelectionOptionsCompletionBlocks

- (id)dataIndexedBlock
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock))
  {
    uint64_t v2 = *(void *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100196704;
    v5[3] = &unk_10062F2F0;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)dataRenderedBlock
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock))
  {
    uint64_t v2 = *(void *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100262E2C;
    v5[3] = &unk_10062F2C8;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)initWithDataIndexedBlock:(id)a3 dataRenderedBlock:(id)a4
{
  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = v7;
  if (!v6)
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    v11 = 0;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  v6 = sub_1001A36CC;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  v11 = sub_1001A36C4;
LABEL_6:
  v12 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock);
  void *v12 = v6;
  v12[1] = v9;
  v13 = (uint64_t (**)())((char *)self
                       + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock);
  *v13 = v11;
  v13[1] = (uint64_t (*)())v10;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ICSelectionStateModel.ContainerSelectionCompletionBlocks();
  return [(ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *)&v15 init];
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock);
  uint64_t v4 = *(void *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock];
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock);
  uint64_t v6 = *(void *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock];
  v7 = (objc_class *)type metadata accessor for ICSelectionStateModel.ContainerSelectionCompletionBlocks();
  v8 = (char *)objc_allocWithZone(v7);
  uint64_t v9 = (uint64_t *)&v8[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock];
  *uint64_t v9 = v3;
  v9[1] = v4;
  uint64_t v10 = (uint64_t *)&v8[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock];
  *uint64_t v10 = v5;
  v10[1] = v6;
  sub_10002E71C(v3);
  sub_10002E71C(v5);
  v12.receiver = v8;
  v12.super_class = v7;
  return [(ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *)&v12 init];
}

- (BOOL)isEqual:(id)a3
{
  return sub_100196E34(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))type metadata accessor for ICSelectionStateModel.ContainerSelectionCompletionBlocks);
}

- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)init
{
  result = (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock);

  sub_10002E70C(v3);
}

@end