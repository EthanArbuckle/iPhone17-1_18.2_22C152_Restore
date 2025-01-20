@interface NewsPersonalizer
- (_TtC19NewsPersonalization16NewsPersonalizer)init;
@end

@implementation NewsPersonalizer

- (_TtC19NewsPersonalization16NewsPersonalizer)init
{
  result = (_TtC19NewsPersonalization16NewsPersonalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19NewsPersonalization16NewsPersonalizer_classicConfiguration;
  uint64_t v4 = sub_1DE7AEDE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19NewsPersonalization16NewsPersonalizer_trainer;
  sub_1DE5E7214();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization16NewsPersonalizer_configurationManager);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19NewsPersonalization16NewsPersonalizer_queue);
}

@end