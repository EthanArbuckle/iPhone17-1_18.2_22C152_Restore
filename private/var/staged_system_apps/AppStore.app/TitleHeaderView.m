@interface TitleHeaderView
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC8AppStore15TitleHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore15TitleHeaderView)initWithFrame:(CGRect)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (unint64_t)accessibilityTraits;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitleHeaderView

- (_TtC8AppStore15TitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15TitleHeaderView *)sub_100034E9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100047910();
}

- (_TtC8AppStore15TitleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100423628();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapWithAccessoryView:(id)a3
{
  id v3 = *(void (**)(void *))((char *)&self->super.super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction);
  if (v3)
  {
    v8[3] = sub_100084CF0(0, &qword_100990560);
    v8[0] = a3;
    id v6 = a3;
    v7 = self;
    sub_100060050((uint64_t)v3);
    v3(v8);
    sub_10006012C((uint64_t)v3);
    sub_100082BCC((uint64_t)v8, (uint64_t *)&unk_100982B40);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10041DC98(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(TitleHeaderView *)&v9 traitCollectionDidChange:v4];
  double v6 = *(void **)&v5[OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabel];
  double v7 = *(uint64_t (**)(char *))&v5[OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabelNumberOfLines];
  swift_retain();
  uint64_t v8 = v7(v5);
  swift_release();
  [v6 setNumberOfLines:v8];
  [v5 setNeedsLayout];
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10041E120();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_10041E498();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v4 = self;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  [(TitleHeaderView *)&v7 setAccessibilityLabel:v5];
}

- (BOOL)isAccessibilityElement
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabel);
  uint64_t v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    NSString v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v6 = String.count.getter();
    swift_bridgeObjectRelease();
    return v6 > 0;
  }
  else
  {
    v9.receiver = v3;
    v9.super_class = (Class)type metadata accessor for TitleHeaderView(0);
    BOOL v7 = [(TitleHeaderView *)&v9 isAccessibilityElement];
  }
  return v7;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  [(TitleHeaderView *)&v4 setIsAccessibilityElement:v3];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  [(TitleHeaderView *)&v4 setAccessibilityTraits:a3];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = self;
  uint64_t v3 = sub_10041E9A4();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowArtworkView));

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_shortDetailLabel));
  sub_10007F08C((uint64_t)self + OBJC_IVAR____TtC8AppStore15TitleHeaderView_style, type metadata accessor for TitleHeaderView.Style);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessory, &qword_1009A2980);
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore15TitleHeaderView_separatorLineView);
}

@end