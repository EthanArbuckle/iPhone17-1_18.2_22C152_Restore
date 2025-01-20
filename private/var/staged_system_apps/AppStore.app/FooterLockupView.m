@interface FooterLockupView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore16FooterLockupView)init;
- (_TtC8AppStore16FooterLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore16FooterLockupView)initWithEffect:(id)a3;
- (void)clickActionHandlerTrampoline;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FooterLockupView

- (_TtC8AppStore16FooterLockupView)init
{
  return (_TtC8AppStore16FooterLockupView *)sub_10028511C();
}

- (_TtC8AppStore16FooterLockupView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore16FooterLockupView_lockupView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore16FooterLockupView_arcadeLockupView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore16FooterLockupView_tapGestureRecognizer) = 0;
  id v5 = a3;

  result = (_TtC8AppStore16FooterLockupView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)clickActionHandlerTrampoline
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1002863D0(v7);

  return v9 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_100285824(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100285A0C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  id v5 = a3;
  [(FooterLockupView *)&v9 traitCollectionDidChange:v5];
  double v6 = *(void **)&v4[OBJC_IVAR____TtC8AppStore16FooterLockupView_lockupView];
  if (v6)
  {
    id v7 = v6;
    double v8 = [v4 traitCollection];
    sub_1001ADCA8(v8);

    id v5 = v7;
    v4 = v8;
  }
}

- (_TtC8AppStore16FooterLockupView)initWithEffect:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC8AppStore16FooterLockupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16FooterLockupView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16FooterLockupView_arcadeLockupView));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore16FooterLockupView_tapGestureRecognizer);
}

@end