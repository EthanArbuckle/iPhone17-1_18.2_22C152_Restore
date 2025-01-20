@interface ProductReviewsShelfHeaderView
- (_TtC8AppStore29ProductReviewsShelfHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)sortButtonTapped;
@end

@implementation ProductReviewsShelfHeaderView

- (_TtC8AppStore29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29ProductReviewsShelfHeaderView *)sub_1005DC58C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29ProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_sortButtonAction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore29ProductReviewsShelfHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1005DC99C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005DD1D8();
}

- (void)sortButtonTapped
{
  v2 = self;
  sub_1005DD5D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_sortButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_sortButtonAction);

  sub_10006012C(v3);
}

@end