@interface HintListCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI12HintListCell)initWithCoder:(id)a3;
- (_TtC8VideosUI12HintListCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)vui_setHighlighted:(BOOL)a3;
@end

@implementation HintListCell

- (_TtC8VideosUI12HintListCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI12HintListCell *)sub_1E35F46AC();
}

- (_TtC8VideosUI12HintListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E35F4764();
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1E35F4810(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = self;
  sub_1E35F4FF4(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E35F50BC();
}

- (void)vui_setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1E35F518C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI12HintListCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI12HintListCell____lazy_storage___accessoryImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI12HintListCell____lazy_storage___bottomSeparatorView);
}

@end