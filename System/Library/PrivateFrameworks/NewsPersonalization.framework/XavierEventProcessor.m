@interface XavierEventProcessor
- (_TtC19NewsPersonalization20XavierEventProcessor)init;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
@end

@implementation XavierEventProcessor

- (_TtC19NewsPersonalization20XavierEventProcessor)init
{
  result = (_TtC19NewsPersonalization20XavierEventProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization20XavierEventProcessor_personalizer));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  uint64_t v6 = sub_1DE7AECA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  v12 = (char *)&v15 - v11;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = self;
  id v14 = objc_msgSend(a4, sel_personalizationTreatment);
  sub_1DE571544();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  swift_retain();
  sub_1DE7B0450();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end