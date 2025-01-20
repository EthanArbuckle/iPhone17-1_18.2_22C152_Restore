@interface SessionRequestAssertion
- (NSArray)sessionIdentifiers;
- (NSString)description;
- (NSString)explanation;
- (SNAAssertionTarget)snaTarget;
- (_TtC16SessionAssertion23SessionRequestAssertion)init;
- (_TtC16SessionAssertion23SessionRequestAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidateOnSessionRequest:(BOOL)a5 invalidationHandler:(id)a6;
- (_TtC16SessionAssertion23SessionRequestAssertion)initWithExplanation:(id)a3 target:(id)a4 options:(id)a5 invalidationHandler:(id)a6;
- (unint64_t)snaInvalidationReason;
- (unint64_t)snaState;
- (void)invalidate;
- (void)setExplanation:(id)a3;
@end

@implementation SessionRequestAssertion

- (NSString)description
{
  v2 = self;
  sub_1B8F7F590();

  v3 = (void *)sub_1B8F89700();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)explanation
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B8F89700();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setExplanation:(id)a3
{
  uint64_t v4 = sub_1B8F89710();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)sessionIdentifiers
{
  v2 = self;
  sub_1B8F7FDDC();

  v3 = (void *)sub_1B8F89810();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC16SessionAssertion23SessionRequestAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidateOnSessionRequest:(BOOL)a5 invalidationHandler:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_1B8F89710();
  uint64_t v11 = v10;
  if (v8)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v8;
    v8 = sub_1B8F81068;
  }
  else
  {
    uint64_t v12 = 0;
  }
  return (_TtC16SessionAssertion23SessionRequestAssertion *)SessionRequestAssertion.init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(v9, v11, a4, a5, (uint64_t)v8, v12);
}

- (_TtC16SessionAssertion23SessionRequestAssertion)initWithExplanation:(id)a3 target:(id)a4 options:(id)a5 invalidationHandler:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_1B8F89710();
  uint64_t v11 = v10;
  if (v8)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v8;
    v8 = sub_1B8F81068;
  }
  else
  {
    uint64_t v12 = 0;
  }
  return (_TtC16SessionAssertion23SessionRequestAssertion *)SessionRequestAssertion.init(explanation:target:options:invalidationHandler:)(v9, v11, a4, (unsigned __int8 *)a5, (uint64_t)v8, v12);
}

- (void)invalidate
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion))
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
  unint64_t v3 = sub_1B8F80688();

  return v3;
}

- (unint64_t)snaState
{
  v2 = self;
  unint64_t v3 = sub_1B8F80788();

  return v3;
}

- (SNAAssertionTarget)snaTarget
{
  swift_beginAccess();
  id v3 = objc_allocWithZone((Class)SNAAssertionTarget);
  uint64_t v4 = self;
  sub_1B8F6CFA4();
  uint64_t v5 = (void *)sub_1B8F89700();
  sub_1B8F6D0A8();
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_, v5);

  return (SNAAssertionTarget *)v6;
}

- (_TtC16SessionAssertion23SessionRequestAssertion)init
{
  result = (_TtC16SessionAssertion23SessionRequestAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B8F6F3B8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_invalidationHandler));
  sub_1B8F6D0A8();

  swift_bridgeObjectRelease();
}

@end