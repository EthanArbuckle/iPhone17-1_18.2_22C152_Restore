@interface VFXRemotePreviewEndpoint
- (NSString)name;
- (VFXWorld)world;
- (_TtC3VFX24VFXRemotePreviewEndpoint)init;
- (_TtC3VFX24VFXRemotePreviewEndpoint)initWithName:(id)a3;
- (void)setName:(id)a3;
- (void)setWorld:(id)a3;
@end

@implementation VFXRemotePreviewEndpoint

- (VFXWorld)world
{
  v2 = (void *)MEMORY[0x1BA9B8670]((char *)self + OBJC_IVAR____TtC3VFX24VFXRemotePreviewEndpoint_world, a2);

  return (VFXWorld *)v2;
}

- (void)setWorld:(id)a3
{
}

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B6E31768();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC3VFX24VFXRemotePreviewEndpoint_name);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC3VFX24VFXRemotePreviewEndpoint)initWithName:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC3VFX24VFXRemotePreviewEndpoint_name);
  uint64_t *v7 = v4;
  v7[1] = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VFXRemotePreviewEndpoint();
  return [(VFXRemotePreviewEndpoint *)&v9 init];
}

- (_TtC3VFX24VFXRemotePreviewEndpoint)init
{
  result = (_TtC3VFX24VFXRemotePreviewEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end