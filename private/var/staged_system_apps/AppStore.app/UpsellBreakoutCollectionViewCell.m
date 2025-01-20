@interface UpsellBreakoutCollectionViewCell
- (UIEdgeInsets)layoutMargins;
- (_TtC8AppStore32UpsellBreakoutCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore32UpsellBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation UpsellBreakoutCollectionViewCell

- (_TtC8AppStore32UpsellBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32UpsellBreakoutCollectionViewCell *)sub_1006D1EA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32UpsellBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore32UpsellBreakoutCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore32UpsellBreakoutCollectionViewCell_shouldApplyBreakoutData) = 1;
  id v7 = a3;

  result = (_TtC8AppStore32UpsellBreakoutCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (UIEdgeInsets)layoutMargins
{
  [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore32UpsellBreakoutCollectionViewCell_upsellBreakoutView) layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UpsellBreakoutCollectionViewCell();
  double v2 = (char *)v13.receiver;
  [(UpsellBreakoutCollectionViewCell *)&v13 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore32UpsellBreakoutCollectionViewCell_upsellBreakoutView];
  id v4 = [v2 contentView];
  sub_10003A33C();
  LayoutMarginsAware<>.layoutFrame.getter();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for UpsellBreakoutCollectionViewCell();
  [(UpsellBreakoutCollectionViewCell *)&v2 prepareForReuse];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1006D2584(v4);
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore32UpsellBreakoutCollectionViewCell_itemLayoutContext);
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore32UpsellBreakoutCollectionViewCell_upsellBreakoutView);
}

@end