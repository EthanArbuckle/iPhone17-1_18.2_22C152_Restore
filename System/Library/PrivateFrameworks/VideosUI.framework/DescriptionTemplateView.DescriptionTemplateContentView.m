@interface DescriptionTemplateView.DescriptionTemplateContentView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView)initWithCoder:(id)a3;
- (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView)initWithFrame:(CGRect)a3;
@end

@implementation DescriptionTemplateView.DescriptionTemplateContentView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E3753FBC(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView *)sub_1E37541B8();
}

- (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView *)sub_1E3754258(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView_descriptionTextView));
}

@end