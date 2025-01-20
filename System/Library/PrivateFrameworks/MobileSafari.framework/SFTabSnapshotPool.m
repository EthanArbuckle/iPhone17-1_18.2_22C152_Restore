@interface SFTabSnapshotPool
- (NSArray)sortedSnapshotIdentifiers;
- (SFTabSnapshotPool)init;
- (id)contentProvider;
- (id)registrationForIdentifier:(id)a3;
- (id)sortedSnapshotIdentifiersDidChangeHandler;
- (void)contentDidChangeForSnapshotsWithIdentifier:(id)a3;
- (void)discardRegistration:(id)a3;
- (void)setContentProvider:(id)a3;
- (void)setSortedSnapshotIdentifiersDidChangeHandler:(id)a3;
@end

@implementation SFTabSnapshotPool

- (void)contentDidChangeForSnapshotsWithIdentifier:(id)a3
{
  uint64_t v4 = sub_18C6F8308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F82E8();
  v8 = self;
  sub_18C6F7B98();
  sub_18C372A1C((uint64_t)v7);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)contentProvider
{
  uint64_t v2 = *(void *)&self->wrapped[OBJC_IVAR___SFTabSnapshotPool_contentProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotPool_contentProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C374010;
  v5[3] = &block_descriptor_28_0;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (SFTabSnapshotPool)init
{
  return (SFTabSnapshotPool *)sub_18C4448DC();
}

- (void)setContentProvider:(id)a3
{
}

- (void)setSortedSnapshotIdentifiersDidChangeHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotPool_wrapped);
  swift_beginAccess();
  *(void *)(v6 + 56) = sub_18C448038;
  *(void *)(v6 + 64) = v5;
  swift_release();
}

- (NSArray)sortedSnapshotIdentifiers
{
  swift_beginAccess();
  sub_18C6F8308();
  sub_18C6F7DE8();
  uint64_t v2 = (void *)sub_18C6F99C8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (id)sortedSnapshotIdentifiersDidChangeHandler
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotPool_wrapped);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 64);
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18C3E9778;
  aBlock[3] = &block_descriptor_19;
  uint64_t v5 = _Block_copy(aBlock);
  sub_18C6F7B98();
  swift_release();

  return v5;
}

- (void)discardRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18C6F7B98();
  uint64_t v6 = sub_18C6F7B98();
  sub_18C5C66CC(v6);

  swift_release();

  swift_release();
}

- (id)registrationForIdentifier:(id)a3
{
  uint64_t v4 = sub_18C6F8308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F82E8();
  v8 = self;
  sub_18C6F7B98();
  uint64_t v9 = sub_18C372DDC((uint64_t)v7);
  swift_release();
  v10 = (char *)objc_allocWithZone((Class)SFTabSnapshotRegistration);
  v11 = &v10[OBJC_IVAR___SFTabSnapshotRegistration_contentObserver];
  *(void *)v11 = CGRectMake;
  *((void *)v11 + 1) = 0;
  *(void *)&v10[OBJC_IVAR___SFTabSnapshotRegistration_wrapped] = v9;
  v14.receiver = v10;
  v14.super_class = (Class)SFTabSnapshotRegistration;
  v12 = [(SFTabSnapshotPool *)&v14 init];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v12;
}

- (void).cxx_destruct
{
}

@end