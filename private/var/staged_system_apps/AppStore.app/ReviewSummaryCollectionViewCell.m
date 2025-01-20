@interface ReviewSummaryCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore31ReviewSummaryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31ReviewSummaryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReviewSummaryCollectionViewCell

- (_TtC8AppStore31ReviewSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ReviewSummaryCollectionViewCell *)sub_100325E18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31ReviewSummaryCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_reviewSummaryView;
  id v8 = objc_allocWithZone((Class)type metadata accessor for ReviewSummaryView());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC8AppStore31ReviewSummaryCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ReviewSummaryCollectionViewCell();
  v2 = (char *)v12.receiver;
  [(ReviewSummaryCollectionViewCell *)&v12 layoutSubviews];
  id v3 = [v2 contentView];
  sub_10003A33C();
  LayoutMarginsAware<>.layoutFrame.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [*(id *)&v2[OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_reviewSummaryView] setFrame:v5, v7, v9, v11];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(ReviewSummaryCollectionViewCell *)v3 traitCollection];
  double v5 = sub_1006B5254();
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_itemLayoutContext);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31ReviewSummaryCollectionViewCell_reviewSummaryView);
}

@end