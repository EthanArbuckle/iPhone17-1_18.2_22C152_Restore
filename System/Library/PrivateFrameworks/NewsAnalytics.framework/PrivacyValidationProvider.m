@interface PrivacyValidationProvider
- (_TtC13NewsAnalytics25PrivacyValidationProvider)init;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
@end

@implementation PrivacyValidationProvider

- (_TtC13NewsAnalytics25PrivacyValidationProvider)init
{
  result = (_TtC13NewsAnalytics25PrivacyValidationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  uint64_t v6 = sub_1DE47EE20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  v12 = (uint64_t *)((char *)&v14 - v11);
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain();
  v13 = self;
  sub_1DE191F40(a4, v12);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 16))(v10, v12, v6);
  swift_retain();
  sub_1DE47F700();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v12, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end