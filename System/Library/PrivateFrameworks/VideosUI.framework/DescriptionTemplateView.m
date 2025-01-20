@interface DescriptionTemplateView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI23DescriptionTemplateView)initWithCoder:(id)a3;
- (_TtC8VideosUI23DescriptionTemplateView)initWithFrame:(CGRect)a3;
- (void)handleSelected:(id)a3;
@end

@implementation DescriptionTemplateView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E34EF198(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (_TtC8VideosUI23DescriptionTemplateView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI23DescriptionTemplateView *)sub_1E34EFC04();
}

- (_TtC8VideosUI23DescriptionTemplateView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI23DescriptionTemplateView *)sub_1E34EFCB4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23DescriptionTemplateView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23DescriptionTemplateView_descriptionTextView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8VideosUI23DescriptionTemplateView____lazy_storage___setupGestureRecognizer);
  sub_1E2C5FB90(v3);
}

- (void)handleSelected:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E34EFE2C(v4);
}

@end