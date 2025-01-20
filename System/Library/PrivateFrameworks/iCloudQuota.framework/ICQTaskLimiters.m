@interface ICQTaskLimiters
- (_TtC11iCloudQuota15ICQTaskLimiters)init;
- (void)performClosureNoParamsWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5;
- (void)performWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5;
@end

@implementation ICQTaskLimiters

- (void)performWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  uint64_t v13 = sub_1D58CCAF0();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v11;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  uint64_t v18 = sub_1D58CCBF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_1D58AC4EC;
  v19[8] = v16;
  v19[9] = sub_1D58AC4F4;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1D58AAC84((uint64_t)v10, (uint64_t)&unk_1EA7233B0, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)performClosureNoParamsWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  uint64_t v13 = sub_1D58CCAF0();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v11;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  uint64_t v18 = sub_1D58CCBF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_1D58AC2E0;
  v19[8] = v16;
  v19[9] = sub_1D58AC320;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1D58ABCC0((uint64_t)v10, (uint64_t)&unk_1EA7233A8, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC11iCloudQuota15ICQTaskLimiters)init
{
  uint64_t v3 = OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters;
  type metadata accessor for TaskLimiters();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1D58AF8B0();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ICQTaskLimiters();
  return [(ICQTaskLimiters *)&v6 init];
}

- (void).cxx_destruct
{
}

@end