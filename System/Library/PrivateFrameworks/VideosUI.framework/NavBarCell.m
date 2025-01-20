@interface NavBarCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI10NavBarCell)initWithCoder:(id)a3;
- (_TtC8VideosUI10NavBarCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation NavBarCell

- (_TtC8VideosUI10NavBarCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI10NavBarCell *)sub_1E34C8D90();
}

- (_TtC8VideosUI10NavBarCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E34C8E48();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E34C8EF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E34C8FC4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1E34C94F0(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI10NavBarCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI10NavBarCell_accessoryView);
}

@end