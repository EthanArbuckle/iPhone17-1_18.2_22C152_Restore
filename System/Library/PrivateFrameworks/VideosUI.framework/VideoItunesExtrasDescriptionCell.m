@interface VideoItunesExtrasDescriptionCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI32VideoItunesExtrasDescriptionCell)initWithCoder:(id)a3;
- (_TtC8VideosUI32VideoItunesExtrasDescriptionCell)initWithFrame:(CGRect)a3;
@end

@implementation VideoItunesExtrasDescriptionCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E2F88134(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI32VideoItunesExtrasDescriptionCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI32VideoItunesExtrasDescriptionCell *)sub_1E2F88338();
}

- (_TtC8VideosUI32VideoItunesExtrasDescriptionCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI32VideoItunesExtrasDescriptionCell *)sub_1E2F883CC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI32VideoItunesExtrasDescriptionCell_descriptionView);
}

@end