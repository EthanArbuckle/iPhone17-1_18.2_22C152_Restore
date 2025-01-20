@interface SSKLegacyDisplayProfileBuilder
- (SSKLegacyDisplayProfileBuilder)init;
- (id)createDisplayProfileConfiguration;
- (void)deriveWithIdentifier:(id)a3;
- (void)setCloningSupported:(BOOL)a3;
- (void)setMainLike:(BOOL)a3;
- (void)setPriorityLevel:(unint64_t)a3 sceneSpecification:(id)a4;
@end

@implementation SSKLegacyDisplayProfileBuilder

- (void)setPriorityLevel:(unint64_t)a3 sceneSpecification:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_25C479114(a3, v6);
}

- (void)deriveWithIdentifier:(id)a3
{
  uint64_t v4 = sub_25C47AA88();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  uint64_t *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)setMainLike:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay) = a3;
}

- (void)setCloningSupported:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning) = a3;
}

- (id)createDisplayProfileConfiguration
{
  v2 = self;
  id v3 = sub_25C479480();

  return v3;
}

- (SSKLegacyDisplayProfileBuilder)init
{
  id v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  *id v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority) = 0;
  uint64_t v4 = OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_25C4712E8(MEMORY[0x263F8EE78]);
  *((unsigned char *)&v5->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay) = 0;
  *((unsigned char *)&v5->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for LegacyDisplayProfileBuilder();
  return [(SSKLegacyDisplayProfileBuilder *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end