@interface SummaryContentSummaryView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI25SummaryContentSummaryView)initWithCoder:(id)a3;
- (_TtC9SeymourUI25SummaryContentSummaryView)initWithFrame:(CGRect)a3;
- (void)bookmarkButtonTapped;
- (void)layoutSubviews;
- (void)shareButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation SummaryContentSummaryView

- (_TtC9SeymourUI25SummaryContentSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25SummaryContentSummaryView *)sub_239E8E790(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateConstraints
{
  v2 = self;
  sub_239E8F978();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_239E8FB64();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)bookmarkButtonTapped
{
}

- (void)shareButtonTapped
{
}

- (_TtC9SeymourUI25SummaryContentSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239E90894();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummaryContentSummaryView();
  v2 = (char *)v5.receiver;
  [(SummaryContentSummaryView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_bookmarkButton];
  id v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  CGRect v6 = self;
  sub_239E900A0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_bookmarkButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_labels));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_layoutGuide));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_labelsBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_bookmarkButtonBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_thumbnailWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_thumbnailHeightConstraint));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_onBookmarkTapped));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_onShareButtonTapped);

  sub_239C25118(v3);
}

@end