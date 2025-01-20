@interface ProductReviewActionsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore24ProductReviewActionsView)initWithCoder:(id)a3;
- (_TtC8AppStore24ProductReviewActionsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)supportWithSender:(id)a3;
- (void)writeReviewWithSender:(id)a3;
@end

@implementation ProductReviewActionsView

- (_TtC8AppStore24ProductReviewActionsView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24ProductReviewActionsView *)sub_1002311F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24ProductReviewActionsView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_writeReviewAction;
  uint64_t v6 = sub_100082C28((uint64_t *)&unk_10098A9A0);
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_supportAction, 1, 1, v6);
  id v8 = a3;

  result = (_TtC8AppStore24ProductReviewActionsView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)writeReviewWithSender:(id)a3
{
}

- (void)supportWithSender:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100232EEC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_100233318(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_writeReviewButton));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_writeReviewAction, &qword_10098D120);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_supportButton));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_supportAction, &qword_10098D120);
}

@end