@interface SFTabSnapshotRegistration
- (NSUUID)identifier;
- (SFTabSnapshotContent)content;
- (SFTabSnapshotRegistration)init;
- (SFTabSnapshotVisibility)visibility;
- (id)contentObserver;
- (void)setContentObserver:(id)a3;
- (void)setVisibility:(id)a3;
@end

@implementation SFTabSnapshotRegistration

- (SFTabSnapshotContent)content
{
  v2 = self;
  id v3 = sub_18C6EBDA4();

  return (SFTabSnapshotContent *)v3;
}

- (id)contentObserver
{
  uint64_t v2 = *(void *)&self->wrapped[OBJC_IVAR___SFTabSnapshotRegistration_contentObserver];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotRegistration_contentObserver);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C525650;
  v5[3] = &block_descriptor_48;
  id v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (void)setContentObserver:(id)a3
{
}

- (NSUUID)identifier
{
  uint64_t v2 = (void *)sub_18C6F82C8();

  return (NSUUID *)v2;
}

- (SFTabSnapshotVisibility)visibility
{
  uint64_t v2 = (uint64_t *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotRegistration_wrapped)
                 + OBJC_IVAR____TtC12MobileSafari23TabSnapshotRegistration_visibility);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  v5 = (char *)objc_allocWithZone((Class)SFTabSnapshotVisibility);
  v6 = &v5[OBJC_IVAR___SFTabSnapshotVisibility_wrapped];
  *(void *)v6 = v3;
  *((void *)v6 + 1) = v4;
  v9.receiver = v5;
  v9.super_class = (Class)SFTabSnapshotVisibility;
  v7 = [(SFTabSnapshotRegistration *)&v9 init];

  return (SFTabSnapshotVisibility *)v7;
}

- (void)setVisibility:(id)a3
{
  uint64_t v4 = (char *)a3;
  v5 = self;
  sub_18C6EC184(v4);
}

- (SFTabSnapshotRegistration)init
{
  result = (SFTabSnapshotRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end