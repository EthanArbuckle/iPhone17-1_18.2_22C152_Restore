@interface CanonicalInfoCardCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI21CanonicalInfoCardCell)initWithCoder:(id)a3;
- (_TtC8VideosUI21CanonicalInfoCardCell)initWithFrame:(CGRect)a3;
- (void)vui_prepareForReuse;
@end

@implementation CanonicalInfoCardCell

- (_TtC8VideosUI21CanonicalInfoCardCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI21CanonicalInfoCardCell *)sub_1E3020074();
}

- (_TtC8VideosUI21CanonicalInfoCardCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30210E8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E302117C(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E30212E4();
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardCell_cardView);
}

@end