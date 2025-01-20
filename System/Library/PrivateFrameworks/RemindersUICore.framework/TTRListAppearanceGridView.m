@interface TTRListAppearanceGridView
- (CGSize)badgeSize;
- (CGSize)intrinsicContentSize;
- (NSArray)accessibilityElements;
- (_TtC15RemindersUICore25TTRListAppearanceGridView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore25TTRListAppearanceGridView)initWithFrame:(CGRect)a3;
- (double)minimumGap;
- (void)layoutSubviews;
- (void)setBadgeSize:(CGSize)a3;
- (void)setMinimumGap:(double)a3;
@end

@implementation TTRListAppearanceGridView

- (_TtC15RemindersUICore25TTRListAppearanceGridView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore25TTRListAppearanceGridView *)TTRListAppearanceGridView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore25TTRListAppearanceGridView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore25TTRListAppearanceGridView *)TTRListAppearanceGridView.init(coder:)(a3);
}

- (CGSize)intrinsicContentSize
{
  v3 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_preferredMaxLayoutWidth);
  swift_beginAccess();
  double v4 = *v3;
  v5 = self;
  double v6 = TTRListAppearanceGridView.height(forWidth:)();

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)badgeSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_badgeSize);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setBadgeSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = (CGFloat *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_badgeSize);
  swift_beginAccess();
  *double v6 = width;
  v6[1] = height;
  [(TTRListAppearanceGridView *)self invalidateIntrinsicContentSize];
}

- (double)minimumGap
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_minimumGap);
  swift_beginAccess();
  return *v2;
}

- (void)setMinimumGap:(double)a3
{
  v5 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_minimumGap);
  swift_beginAccess();
  double *v5 = a3;
  [(TTRListAppearanceGridView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRListAppearanceGridView();
  id v2 = v3.receiver;
  [(TTRListAppearanceGridView *)&v3 layoutSubviews];
  TTRListAppearanceGridView.performLayout()();
}

- (NSArray)accessibilityElements
{
  swift_beginAccess();
  objc_super v3 = self;
  unint64_t v4 = _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  sub_1B95E6BFC(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1B996EE40();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (void).cxx_destruct
{
}

@end