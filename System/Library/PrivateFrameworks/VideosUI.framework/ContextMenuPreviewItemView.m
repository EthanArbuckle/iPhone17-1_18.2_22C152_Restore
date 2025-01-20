@interface ContextMenuPreviewItemView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI26ContextMenuPreviewItemView)initWithCoder:(id)a3;
- (_TtC8VideosUI26ContextMenuPreviewItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ContextMenuPreviewItemView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1E35D9A48(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E35DA3D8();
}

- (_TtC8VideosUI26ContextMenuPreviewItemView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI26ContextMenuPreviewItemView *)sub_1E35DA474();
}

- (_TtC8VideosUI26ContextMenuPreviewItemView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI26ContextMenuPreviewItemView *)sub_1E35DA51C(a3);
}

- (void).cxx_destruct
{
  sub_1E35D95C0(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_imageViewComponent));
  sub_1E35D95C0(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_titleViewComponent));
  sub_1E35D95C0(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_subtitleViewComponent));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_eyeBrowViewComponent);
  sub_1E35D95C0(v3);
}

@end