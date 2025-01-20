@interface AccountMessageView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI18AccountMessageView)init;
- (_TtC8VideosUI18AccountMessageView)initWithCoder:(id)a3;
- (_TtC8VideosUI18AccountMessageView)initWithFrame:(CGRect)a3;
@end

@implementation AccountMessageView

- (_TtC8VideosUI18AccountMessageView)init
{
  return (_TtC8VideosUI18AccountMessageView *)sub_1E34168B8();
}

- (_TtC8VideosUI18AccountMessageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3416C3C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E3416D58(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI18AccountMessageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18AccountMessageView____lazy_storage___backgroundExtensionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18AccountMessageView____lazy_storage___shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18AccountMessageView____lazy_storage___amsMaskingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18AccountMessageView_topSeparatorView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI18AccountMessageView_bottomSeparatorView);
}

@end