@interface TextStyleEditingView
- (_TtC8PaperKit20TextStyleEditingView)initWithCoder:(id)a3;
- (_TtC8PaperKit20TextStyleEditingView)initWithFrame:(CGRect)a3;
@end

@implementation TextStyleEditingView

- (_TtC8PaperKit20TextStyleEditingView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized TextStyleEditingView.init(coder:)();
}

- (_TtC8PaperKit20TextStyleEditingView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit20TextStyleEditingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextStyleEditingView_fontNameControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextStyleEditingView_fontSizeControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextStyleEditingView_textAlignmentControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextStyleEditingView_textStyleView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit20TextStyleEditingView_colorSwatch);
}

@end