@interface UnknownAssetView
- (_TtC7Journal16UnknownAssetView)initWithCoder:(id)a3;
- (_TtC7Journal16UnknownAssetView)initWithFrame:(CGRect)a3;
@end

@implementation UnknownAssetView

- (_TtC7Journal16UnknownAssetView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal16UnknownAssetView_symbolAndTextFallbackView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UnknownAssetView();
  v7 = -[JournalAssetView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  [(UnknownAssetView *)v7 setContentMode:2];
  [(UnknownAssetView *)v7 setClipsToBounds:1];
  sub_1000C873C();

  return v7;
}

- (_TtC7Journal16UnknownAssetView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal16UnknownAssetView_symbolAndTextFallbackView) = 0;
  id v4 = a3;

  result = (_TtC7Journal16UnknownAssetView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal16UnknownAssetView_symbolAndTextFallbackView));
}

@end