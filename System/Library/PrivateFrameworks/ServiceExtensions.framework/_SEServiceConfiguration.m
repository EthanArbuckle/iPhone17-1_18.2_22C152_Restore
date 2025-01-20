@interface _SEServiceConfiguration
- (NSString)serviceIdentifier;
- (_SEServiceConfiguration)init;
- (_SEServiceConfiguration)initWithServiceIdentifier:(id)a3;
- (id)interruptionHandler;
- (void)setInterruptionHandler:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation _SEServiceConfiguration

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

- (_SEServiceConfiguration)initWithServiceIdentifier:(id)a3
{
  uint64_t v4 = sub_25C2219E8();
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  void *v5 = nullsub_1;
  v5[1] = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  uint64_t *v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for _SEServiceConfiguration();
  return [(_SEServiceConfiguration *)&v9 init];
}

- (NSString)serviceIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25C2219D8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setServiceIdentifier:(id)a3
{
  uint64_t v4 = sub_25C2219E8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)interruptionHandler
{
  uint64_t v2 = *(void *)&self->serviceIdentifier[OBJC_IVAR____SEServiceConfiguration_interruptionHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_25C20981C;
  v5[3] = &block_descriptor;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  uint64_t *v6 = sub_25C216158;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (_SEServiceConfiguration)init
{
  result = (_SEServiceConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end