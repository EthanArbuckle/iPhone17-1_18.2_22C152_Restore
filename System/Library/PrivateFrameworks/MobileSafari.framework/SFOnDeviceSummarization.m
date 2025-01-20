@interface SFOnDeviceSummarization
+ (BOOL)isRestricted;
+ (void)checkSummarizationAvailabilityWithCompletionHandler:(id)a3;
- (BOOL)isSafe;
- (NSString)summary;
- (SFOnDeviceSummarization)init;
- (SFOnDeviceSummarizationDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)summarizeArticleText:(id)a3;
@end

@implementation SFOnDeviceSummarization

- (SFOnDeviceSummarizationDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___SFOnDeviceSummarization_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192F967B0](v2);

  return (SFOnDeviceSummarizationDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (SFOnDeviceSummarization)init
{
  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFOnDeviceSummarization__summary);
  void *v3 = 0;
  v3[1] = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SFOnDeviceSummarization__isSafe) = 0;
  v5.receiver = self;
  v5.super_class = (Class)SFOnDeviceSummarization;
  return [(SFOnDeviceSummarization *)&v5 init];
}

- (NSString)summary
{
  if (*(void *)&self->delegate[OBJC_IVAR___SFOnDeviceSummarization__summary])
  {
    sub_18C6F7DE8();
    v2 = (void *)sub_18C6F9808();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (BOOL)isSafe
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SFOnDeviceSummarization__isSafe);
}

+ (BOOL)isRestricted
{
  return byte_1E917C418;
}

+ (void)checkSummarizationAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E917BDF0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_18C6F9B88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E917C498;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E917C4A0;
  v12[5] = v11;
  sub_18C6EEB84((uint64_t)v7, (uint64_t)&unk_1E917C4A8, (uint64_t)v12);
  swift_release();
}

- (void)summarizeArticleText:(id)a3
{
  uint64_t v4 = sub_18C6F9848();
  unint64_t v6 = v5;
  v7 = self;
  sub_18C6B44F0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_18C57B508((uint64_t)self + OBJC_IVAR___SFOnDeviceSummarization_delegate);

  swift_bridgeObjectRelease();
}

@end