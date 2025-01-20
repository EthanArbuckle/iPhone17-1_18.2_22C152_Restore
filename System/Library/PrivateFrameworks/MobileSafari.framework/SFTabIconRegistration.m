@interface SFTabIconRegistration
- (NSUUID)identifier;
- (SFTabIconRegistration)init;
- (UIImage)content;
- (id)contentObserver;
- (void)setContentObserver:(id)a3;
@end

@implementation SFTabIconRegistration

- (UIImage)content
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped);
  swift_beginAccess();
  return (UIImage *)*(id *)(v2 + 16);
}

- (id)contentObserver
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 32);
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18C525650;
  aBlock[3] = &block_descriptor_7;
  v5 = _Block_copy(aBlock);
  sub_18C6F7B98();
  swift_release();

  return v5;
}

- (void)setContentObserver:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped);
  swift_beginAccess();
  *(void *)(v6 + 24) = sub_18C3789C4;
  *(void *)(v6 + 32) = v5;
  swift_release();
}

- (NSUUID)identifier
{
  uint64_t v3 = sub_18C6F8308();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabIconRegistration_wrapped)
     + OBJC_IVAR____TtC12MobileSafari19TabIconRegistration_id;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_18C6F82C8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v8;
}

- (SFTabIconRegistration)init
{
  result = (SFTabIconRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end