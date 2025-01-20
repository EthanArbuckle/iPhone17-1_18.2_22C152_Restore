@interface InteractiveProductReviewsShelfHeaderView
- (_TtC8AppStore40InteractiveProductReviewsShelfHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore40InteractiveProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveProductReviewsShelfHeaderView

- (_TtC8AppStore40InteractiveProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore40InteractiveProductReviewsShelfHeaderView *)sub_1003269BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore40InteractiveProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC8AppStore40InteractiveProductReviewsShelfHeaderView_currentState;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v4[40] = 1;
  id v5 = a3;

  result = (_TtC8AppStore40InteractiveProductReviewsShelfHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(InteractiveProductReviewsShelfHeaderView *)&v4 prepareForReuse];
  [v2[OBJC_IVAR____TtC8AppStore40InteractiveProductReviewsShelfHeaderView_firstColumnLabel] setText:0 v4.receiver, v4.super_class];
  [*(id *)&v2[OBJC_IVAR____TtC8AppStore40InteractiveProductReviewsShelfHeaderView_pinnedLabel] setText:0];
  v3 = &v2[OBJC_IVAR____TtC8AppStore40InteractiveProductReviewsShelfHeaderView_currentState];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v3[40] = 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100327388();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40InteractiveProductReviewsShelfHeaderView_firstColumnLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore40InteractiveProductReviewsShelfHeaderView_pinnedLabel);
}

@end