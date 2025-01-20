@interface BrickCollectionViewCell
- (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BrickCollectionViewCell

- (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell *)sub_212B24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2137F8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_212DF0();
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = (char *)v17.receiver;
  [(BrickCollectionViewCell *)&v17 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews23BrickCollectionViewCell_artworkContainer];
  id v4 = [v2 contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 layoutMargins];
  double v14 = v13;
  double v16 = v15;

  [v3 setFrame:UIEdgeInsetsInsetRect(v6, v8, v10, v12, v14, v16)];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23BrickCollectionViewCell_artworkView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews23BrickCollectionViewCell_artworkContainer);
}

@end