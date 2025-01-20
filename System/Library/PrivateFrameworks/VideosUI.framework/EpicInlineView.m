@interface EpicInlineView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI14EpicInlineView)initWithCoder:(id)a3;
- (_TtC8VideosUI14EpicInlineView)initWithFrame:(CGRect)a3;
@end

@implementation EpicInlineView

- (_TtC8VideosUI14EpicInlineView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI14EpicInlineView *)sub_1E31AE738();
}

- (_TtC8VideosUI14EpicInlineView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E31AE850();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E31AE910(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI14EpicInlineView_contentView);
}

@end