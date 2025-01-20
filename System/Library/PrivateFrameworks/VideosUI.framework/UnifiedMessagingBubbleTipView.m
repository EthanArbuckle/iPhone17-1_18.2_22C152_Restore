@interface UnifiedMessagingBubbleTipView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI29UnifiedMessagingBubbleTipView)initWithCoder:(id)a3;
- (_TtC8VideosUI29UnifiedMessagingBubbleTipView)initWithFrame:(CGRect)a3;
@end

@implementation UnifiedMessagingBubbleTipView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E367C174(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI29UnifiedMessagingBubbleTipView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI29UnifiedMessagingBubbleTipView *)sub_1E367C314();
}

- (_TtC8VideosUI29UnifiedMessagingBubbleTipView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI29UnifiedMessagingBubbleTipView *)sub_1E367C3A0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29UnifiedMessagingBubbleTipView_bubbleTipContentView));
  swift_release();
}

@end