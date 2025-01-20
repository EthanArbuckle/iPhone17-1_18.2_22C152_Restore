@interface FontAttributeStylingControl
- (_TtC8PaperKit27FontAttributeStylingControl)initWithCoder:(id)a3;
@end

@implementation FontAttributeStylingControl

- (_TtC8PaperKit27FontAttributeStylingControl)initWithCoder:(id)a3
{
  return (_TtC8PaperKit27FontAttributeStylingControl *)FontAttributeStylingControl.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27FontAttributeStylingControl_titleLabelTintColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit27FontAttributeStylingControl_overrideImageViewTintColor);
}

@end