@interface CategoryBrickPlaceholderView
- (_TtC8AppStore28CategoryBrickPlaceholderView)initWithCoder:(id)a3;
- (_TtC8AppStore28CategoryBrickPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CategoryBrickPlaceholderView

- (_TtC8AppStore28CategoryBrickPlaceholderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC8AppStore28CategoryBrickPlaceholderView_artworkPlaceholder;
  type metadata accessor for ArtworkView();
  v10 = self;
  id v11 = (id)static ArtworkView.brickArtworkView.getter();
  dispatch thunk of RoundedCornerView.borderWidth.setter();

  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)v11;
  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = -[CategoryBrickPlaceholderView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  [(CategoryBrickPlaceholderView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC8AppStore28CategoryBrickPlaceholderView_artworkPlaceholder)];
  return v12;
}

- (_TtC8AppStore28CategoryBrickPlaceholderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore28CategoryBrickPlaceholderView_artworkPlaceholder;
  type metadata accessor for ArtworkView();
  id v6 = a3;
  id v7 = (id)static ArtworkView.brickArtworkView.getter();
  dispatch thunk of RoundedCornerView.borderWidth.setter();

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v7;
  result = (_TtC8AppStore28CategoryBrickPlaceholderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004C15A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CategoryBrickPlaceholderView_artworkPlaceholder));
}

@end