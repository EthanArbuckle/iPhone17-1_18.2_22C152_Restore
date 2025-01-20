@interface AudiobookTOCHeaderView
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (NSArray)accessibilityElements;
- (_TtC5Books22AudiobookTOCHeaderView)initWithCoder:(id)a3;
- (_TtC5Books22AudiobookTOCHeaderView)initWithFrame:(CGRect)a3;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)didDismiss;
- (void)didSelectSupplementalContent;
- (void)layoutSubviews;
@end

@implementation AudiobookTOCHeaderView

- (_TtC5Books22AudiobookTOCHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books22AudiobookTOCHeaderView *)sub_10047554C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books22AudiobookTOCHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10047811C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100476C6C();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  v8 = *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_titleLabel);
  if (qword_100B22B58 != -1) {
    swift_once();
  }
  [v8 setFont:qword_100B34D10];
  v9 = *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_authorLabel);
  if (qword_100B22B60 != -1) {
    swift_once();
  }
  [v9 setFont:qword_100B34D18];

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v10);
}

- (void)didDismiss
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    [v4 dismissViewControllerAnimated:1 completion:0];

    swift_unknownObjectRelease();
  }
}

- (void)didSelectSupplementalContent
{
  v2 = self;
  sub_10047723C();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  sub_10047798C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return (NSArray *)v5.super.isa;
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView____lazy_storage___effectView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_titleGradientLayer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_authorGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_timeRemainingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_coverImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_supplementalContentButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_cachedGroupedLabelsAXElement);
}

@end