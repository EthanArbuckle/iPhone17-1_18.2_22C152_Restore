@interface SmallBreakoutCollectionViewCell
- (UIColor)backgroundColor;
- (_TtC8AppStore19BreakoutDetailsView)accessibilityDetailsView;
- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SmallBreakoutCollectionViewCell

- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31SmallBreakoutCollectionViewCell *)sub_100193E2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100194D54();
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(SmallBreakoutCollectionViewCell *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v6 = a3;
  v7 = self;
  [(SmallBreakoutCollectionViewCell *)&v12 setBackgroundColor:v6];
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_iconView);
  v11.receiver = v7;
  v11.super_class = ObjectType;
  id v9 = v8;
  v10 = [(SmallBreakoutCollectionViewCell *)&v11 backgroundColor];
  ArtworkView.backgroundColor.setter();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100194438();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100194708();
}

- (_TtC8AppStore19BreakoutDetailsView)accessibilityDetailsView
{
  return (_TtC8AppStore19BreakoutDetailsView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_detailsView));
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_detailsView));

  swift_unknownObjectRelease();
}

@end