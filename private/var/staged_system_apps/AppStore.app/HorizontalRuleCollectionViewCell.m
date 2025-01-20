@interface HorizontalRuleCollectionViewCell
- (_TtC8AppStore32HorizontalRuleCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore32HorizontalRuleCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation HorizontalRuleCollectionViewCell

- (_TtC8AppStore32HorizontalRuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32HorizontalRuleCollectionViewCell *)sub_10076A1BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32HorizontalRuleCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineLayer;
  id v8 = objc_allocWithZone((Class)CAShapeLayer);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 init];
  v10 = (char *)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_style;
  uint64_t v11 = enum case for HorizontalRule.Style.solid(_:);
  uint64_t v12 = type metadata accessor for HorizontalRule.Style();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  uint64_t v13 = OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineColor;
  sub_100084CF0(0, (unint64_t *)&qword_100981AA0);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)static UIColor.defaultLine.getter();

  result = (_TtC8AppStore32HorizontalRuleCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10076A57C();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_10076A7C8();
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineLayer));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_style;
  uint64_t v4 = type metadata accessor for HorizontalRule.Style();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore32HorizontalRuleCollectionViewCell_lineColor);
}

@end