@interface ArtworkCollectionViewCell
- (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ArtworkCollectionViewCell

- (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell *)sub_2ECCB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell *)sub_385890();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2ECE40();
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArtworkCollectionViewCell();
  v2 = (char *)v9.receiver;
  [(ArtworkCollectionViewCell *)&v9 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell_artworkView];
  id v4 = [v2 contentView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  [v3 setFrame:0.0, 0.0, v6, v8];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell_artworkView));
}

@end