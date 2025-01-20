@interface UberCollectionViewCell
- (_TtC23ShelfKitCollectionViews22UberCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews22UberCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation UberCollectionViewCell

- (_TtC23ShelfKitCollectionViews22UberCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews22UberCollectionViewCell *)sub_2A1570(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews22UberCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2A2418();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  [(UberCollectionViewCell *)v5 layoutIfNeeded];
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for UberCollectionViewCell();
  id v6 = [(UberCollectionViewCell *)&v8 preferredLayoutAttributesFittingAttributes:v4];

  return v6;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2A1874();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell_uberBackgroundView));
  sub_33944(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell_background), self->yOffset[OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell_background]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell____lazy_storage___fadeOutView));

  swift_release();
}

@end