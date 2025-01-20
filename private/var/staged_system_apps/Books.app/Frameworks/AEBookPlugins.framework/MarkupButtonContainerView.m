@interface MarkupButtonContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC13AEBookPlugins25MarkupButtonContainerView)initWithCoder:(id)a3;
- (_TtC13AEBookPlugins25MarkupButtonContainerView)initWithFrame:(CGRect)a3;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)layoutSubviews;
- (void)updateForMiniBarState:(BOOL)a3;
@end

@implementation MarkupButtonContainerView

- (_TtC13AEBookPlugins25MarkupButtonContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_125604();
}

- (_TtC13AEBookPlugins25MarkupButtonContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC13AEBookPlugins25MarkupButtonContainerView *)sub_12462C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_124BF4();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_139440();
  swift_unknownObjectRelease();
  sub_124DBC();

  sub_125574((uint64_t)&v8);
}

- (void)updateForMiniBarState:(BOOL)a3
{
  id v3 = self;
  [(MarkupButtonContainerView *)v3 setNeedsLayout];
  [(MarkupButtonContainerView *)v3 layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_button);
  id v3 = self;
  [v2 intrinsicContentSize];
  double v5 = v4
     + *(double *)((char *)&v3->super.super.super.isa
                 + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_intrinsicWidthPadding);
  double v6 = *(double *)((char *)&v3->super.super.super.isa
                 + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_intrinsicHeight);

  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MarkupButtonContainerView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_compactImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_regularImage));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_button);
}

@end