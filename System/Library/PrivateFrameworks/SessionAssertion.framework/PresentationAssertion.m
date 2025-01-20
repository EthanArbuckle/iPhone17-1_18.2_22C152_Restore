@interface PresentationAssertion
- (NSString)activityIdentifier;
- (NSString)description;
- (NSString)explanation;
- (NSString)snaSessionIdentifier;
- (_TtC16SessionAssertion21PresentationAssertion)init;
- (_TtC16SessionAssertion21PresentationAssertion)initWithExplanation:(id)a3 activityIdentifier:(id)a4 presentationState:(unint64_t)a5 invalidationHandler:(id)a6;
- (unint64_t)snaInvalidationReason;
- (unint64_t)snaState;
- (void)invalidate;
- (void)setActivityIdentifier:(id)a3;
- (void)setExplanation:(id)a3;
@end

@implementation PresentationAssertion

- (NSString)description
{
  v2 = self;
  sub_1B8F781E0();

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

- (_TtC16SessionAssertion21PresentationAssertion)initWithExplanation:(id)a3 activityIdentifier:(id)a4 presentationState:(unint64_t)a5 invalidationHandler:(id)a6
{
  v7 = _Block_copy(a6);
  uint64_t v8 = sub_1B8F89710();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1B8F89710();
  uint64_t v13 = v12;
  if (v7)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v7;
    v15 = sub_1B8F6F354;
  }
  else
  {
    v15 = 0;
    uint64_t v14 = 0;
  }
  return (_TtC16SessionAssertion21PresentationAssertion *)PresentationAssertion.init(explanation:activityIdentifier:presentationState:invalidationHandler:)(v8, v10, v11, v13, a5, (uint64_t)v15, v14);
}

- (void)invalidate
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion))
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
  unint64_t v3 = sub_1B8F78D24();

  return v3;
}

- (unint64_t)snaState
{
  v2 = self;
  unint64_t v3 = sub_1B8F78E24();

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

- (_TtC16SessionAssertion21PresentationAssertion)init
{
  result = (_TtC16SessionAssertion21PresentationAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B8F6F3B8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_invalidationHandler));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end