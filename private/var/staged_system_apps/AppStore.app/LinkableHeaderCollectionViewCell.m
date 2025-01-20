@interface LinkableHeaderCollectionViewCell
- (_TtC8AppStore32LinkableHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore32LinkableHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkableHeaderCollectionViewCell

- (_TtC8AppStore32LinkableHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32LinkableHeaderCollectionViewCell *)sub_1001FD038(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32LinkableHeaderCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC8AppStore32LinkableHeaderCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for LinkableHeaderCollectionViewCell();
  v2 = (char *)v12.receiver;
  [(LinkableHeaderCollectionViewCell *)&v12 layoutSubviews];
  id v3 = [v2 contentView];
  sub_10003A33C();
  LayoutMarginsAware<>.layoutFrame.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [*(id *)&v2[OBJC_IVAR____TtC8AppStore32LinkableHeaderCollectionViewCell_headerView] setFrame:v5, v7, v9, v11];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32LinkableHeaderCollectionViewCell_headerView));
}

@end