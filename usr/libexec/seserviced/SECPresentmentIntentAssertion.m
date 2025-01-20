@interface SECPresentmentIntentAssertion
- (_TtC10seserviced29SECPresentmentIntentAssertion)init;
- (void)getAssertionStateWithReply:(id)a3;
- (void)relinquishAssertionWithReply:(id)a3;
@end

@implementation SECPresentmentIntentAssertion

- (void)getAssertionStateWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced29SECPresentmentIntentAssertion_delegate);
  swift_beginAccess();
  uint64_t v6 = v5[3];
  if (v6) {
    BOOL v7 = *(void *)(*sub_100075908(v5, v6) + 16) == 0;
  }
  else {
    BOOL v7 = 1;
  }
  v8 = (void (*)(void *, BOOL))v4[2];
  v9 = self;
  v8(v4, v7);
  _Block_release(v4);
}

- (void)relinquishAssertionWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100299CAC((uint64_t)v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC10seserviced29SECPresentmentIntentAssertion)init
{
  result = (_TtC10seserviced29SECPresentmentIntentAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008E734((uint64_t)self + OBJC_IVAR____TtC10seserviced29SECPresentmentIntentAssertion_delegate, &qword_10045AC80);

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced29SECPresentmentIntentAssertion_identifier;
  uint64_t v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end