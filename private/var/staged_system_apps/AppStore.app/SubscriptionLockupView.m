@interface SubscriptionLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)layoutMargins;
- (_TtC8AppStore22SubscriptionLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore22SubscriptionLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation SubscriptionLockupView

- (UIEdgeInsets)layoutMargins
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(SubscriptionLockupView *)&v6 layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  ObjectType = (objc_class *)swift_getObjectType();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = self;
  -[SubscriptionLockupView setLayoutMargins:](&v14, "setLayoutMargins:", top, left, bottom, right);
  v10 = *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView);
  v13.receiver = v9;
  v13.super_class = ObjectType;
  [(SubscriptionLockupView *)&v13 layoutMargins];
  [v10 setLayoutMargins:];
  v11 = *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_appLockupView);
  v12.receiver = v9;
  v12.super_class = ObjectType;
  [(SubscriptionLockupView *)&v12 layoutMargins];
  [v11 setLayoutMargins:];
}

- (_TtC8AppStore22SubscriptionLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22SubscriptionLockupView *)sub_100528DAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22SubscriptionLockupView)initWithCoder:(id)a3
{
  double v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_lockupTapBlock);
  *double v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_subscriptionLockupPresenter) = 0;
  id v5 = a3;

  UIEdgeInsets result = (_TtC8AppStore22SubscriptionLockupView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for SmallLockupLayout.Metrics();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = qword_10097FC78;
  v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100087728(v5, (uint64_t)qword_1009E5EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
  v18.receiver = v10;
  v18.super_class = ObjectType;
  [(SubscriptionLockupView *)&v18 layoutMargins];
  id v12 = [(SubscriptionLockupView *)v10 traitCollection];
  double v13 = sub_100709D3C((uint64_t)v8);
  double v15 = v14;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  double v2 = (char *)v5.receiver;
  [(SubscriptionLockupView *)&v5 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView];
  [v2 bounds];
  [v3 setFrame:];
  double v4 = *(void **)&v2[OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_appLockupView];
  [v2 bounds];
  [v4 setFrame:];
}

- (void).cxx_destruct
{
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_lockupTapBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_appLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView));

  swift_release();
}

@end