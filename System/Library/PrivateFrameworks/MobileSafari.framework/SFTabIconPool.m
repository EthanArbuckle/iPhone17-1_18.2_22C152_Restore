@interface SFTabIconPool
- (SFTabIconPool)init;
- (SFTabIconPool)initWithSiteMetadataManager:(id)a3;
- (id)existingIconProvider;
- (id)extensionIconProvider;
- (id)makeRegistrationForIdentifier:(id)a3;
- (id)urlProvider;
- (void)iconDidChangeForIdentifier:(id)a3;
- (void)setExistingIconProvider:(id)a3;
- (void)setExtensionIconProvider:(id)a3;
- (void)setUrlProvider:(id)a3;
@end

@implementation SFTabIconPool

- (SFTabIconPool)initWithSiteMetadataManager:(id)a3
{
  id v3 = a3;
  v4 = (SFTabIconPool *)sub_18C445020(v3);

  return v4;
}

- (void)iconDidChangeForIdentifier:(id)a3
{
  uint64_t v4 = sub_18C6F8308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F82E8();
  v8 = self;
  sub_18C4451E8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setUrlProvider:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  *(void *)(v6 + 48) = sub_18C525988;
  *(void *)(v6 + 56) = v5;

  swift_release();
}

- (void)setExtensionIconProvider:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  *(void *)(v6 + 32) = sub_18C525990;
  *(void *)(v6 + 40) = v5;

  swift_release();
}

- (void)setExistingIconProvider:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  *(void *)(v6 + 16) = sub_18C37411C;
  *(void *)(v6 + 24) = v5;

  swift_release();
}

- (id)existingIconProvider
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  uint64_t v3 = *(void *)(v2 + 24);
  v6[4] = *(void *)(v2 + 16);
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_18C524BE4;
  v6[3] = &block_descriptor_22;
  uint64_t v4 = _Block_copy(v6);
  sub_18C6F7B98();
  swift_release();

  return v4;
}

- (id)extensionIconProvider
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  uint64_t v3 = *(void *)(v2 + 40);
  v6[4] = *(void *)(v2 + 32);
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_18C524DA8;
  v6[3] = &block_descriptor_16;
  uint64_t v4 = _Block_copy(v6);
  sub_18C6F7B98();
  swift_release();

  return v4;
}

- (id)urlProvider
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  uint64_t v3 = *(void *)(v2 + 56);
  v6[4] = *(void *)(v2 + 48);
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_18C525098;
  v6[3] = &block_descriptor_10;
  uint64_t v4 = _Block_copy(v6);
  sub_18C6F7B98();
  swift_release();

  return v4;
}

- (id)makeRegistrationForIdentifier:(id)a3
{
  uint64_t v4 = sub_18C6F8308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F82E8();
  v8 = self;
  sub_18C6F7B98();
  uint64_t v9 = sub_18C5B67D4((uint64_t)v7);
  swift_release();
  v10 = (char *)objc_allocWithZone((Class)SFTabIconRegistration);
  *(void *)&v10[OBJC_IVAR___SFTabIconRegistration_wrapped] = v9;
  v13.receiver = v10;
  v13.super_class = (Class)SFTabIconRegistration;
  v11 = [(SFTabIconPool *)&v13 init];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

- (SFTabIconPool)init
{
  result = (SFTabIconPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end