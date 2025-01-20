@interface ReviewsContainerCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC8AppStore20ReviewsContainerCell)initWithCoder:(id)a3;
- (_TtC8AppStore20ReviewsContainerCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didTapEditorsChoice;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ReviewsContainerCell

- (_TtC8AppStore20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20ReviewsContainerCell *)sub_100179A50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100184210();
}

- (void)dealloc
{
  v2 = self;
  sub_100179FF4();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_ratingsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_tapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_reviewSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_ratingsSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_reviewsShelf));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_editorsChoiceView));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_didSelectEditorsChoice));

  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10017A24C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10017A8CC();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapEditorsChoice
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_didSelectEditorsChoice);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

@end