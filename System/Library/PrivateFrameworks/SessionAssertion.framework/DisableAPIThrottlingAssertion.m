@interface DisableAPIThrottlingAssertion
- (NSString)activityIdentifier;
- (NSString)description;
- (NSString)explanation;
- (NSString)snaSessionIdentifier;
- (_TtC16SessionAssertion29DisableAPIThrottlingAssertion)init;
- (_TtC16SessionAssertion29DisableAPIThrottlingAssertion)initWithExplanation:(id)a3 activityIdentifier:(id)a4 invalidationHandler:(id)a5;
- (unint64_t)snaInvalidationReason;
- (unint64_t)snaState;
- (void)invalidate;
- (void)setActivityIdentifier:(id)a3;
- (void)setExplanation:(id)a3;
@end

@implementation DisableAPIThrottlingAssertion

- (NSString)description
{
  v2 = self;
  sub_1B8F6E0D4();

  v3 = (void *)sub_1B8F89700();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityIdentifier
{
  return (NSString *)sub_1B8F6E3D0();
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSString)explanation
{
  return (NSString *)sub_1B8F6E3D0();
}

- (void)setExplanation:(id)a3
{
}

- (_TtC16SessionAssertion29DisableAPIThrottlingAssertion)initWithExplanation:(id)a3 activityIdentifier:(id)a4 invalidationHandler:(id)a5
{
  v5 = _Block_copy(a5);
  uint64_t v6 = sub_1B8F89710();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1B8F89710();
  uint64_t v11 = v10;
  if (v5)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v5;
    v13 = sub_1B8F6F354;
  }
  else
  {
    v13 = 0;
    uint64_t v12 = 0;
  }
  return (_TtC16SessionAssertion29DisableAPIThrottlingAssertion *)DisableAPIThrottlingAssertion.init(explanation:activityIdentifier:invalidationHandler:)(v6, v8, v9, v11, (uint64_t)v13, v12);
}

- (void)invalidate
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion))
  {
    v2 = self;
    swift_retain();
    sub_1B8F821F4();

    swift_release();
  }
}

- (unint64_t)snaInvalidationReason
{
  v2 = self;
  unint64_t v3 = sub_1B8F6EB78();

  return v3;
}

- (unint64_t)snaState
{
  v2 = self;
  unint64_t v3 = sub_1B8F6EC78();

  return v3;
}

- (NSString)snaSessionIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B8F89700();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC16SessionAssertion29DisableAPIThrottlingAssertion)init
{
  result = (_TtC16SessionAssertion29DisableAPIThrottlingAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B8F6F3B8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_invalidationHandler));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end