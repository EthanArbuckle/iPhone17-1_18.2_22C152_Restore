@interface InformationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews15InformationView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews15InformationView)initWithFrame:(CGRect)a3;
- (void)buttonTappedFrom:(id)a3;
- (void)layoutSubviews;
@end

@implementation InformationView

- (void)buttonTappedFrom:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_219548((uint64_t)v4);
}

- (_TtC23ShelfKitCollectionViews15InformationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_buttons) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  sub_385780(27);
  swift_bridgeObjectRelease();
  result = (_TtC23ShelfKitCollectionViews15InformationView *)sub_385890();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = InformationView.sizeThatFits(_:)(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  InformationView.layoutSubviews()();
}

- (_TtC23ShelfKitCollectionViews15InformationView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews15InformationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationView_subtitleLabel));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end