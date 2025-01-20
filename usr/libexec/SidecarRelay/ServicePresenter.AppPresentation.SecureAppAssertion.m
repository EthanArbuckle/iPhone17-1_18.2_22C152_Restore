@interface ServicePresenter.AppPresentation.SecureAppAssertion
- (_TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion)init;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)dealloc;
@end

@implementation ServicePresenter.AppPresentation.SecureAppAssertion

- (void)dealloc
{
  v2 = self;
  sub_100056450();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion_assertion));
  v3 = (char *)self
     + OBJC_IVAR____TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100056B34((uint64_t)a3, a4, a5);
  swift_unknownObjectRelease();
}

- (_TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion)init
{
}

@end