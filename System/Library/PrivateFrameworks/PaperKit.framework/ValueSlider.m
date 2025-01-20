@interface ValueSlider
- (CGSize)intrinsicContentSize;
- (_TtC8PaperKit11ValueSlider)initWithCoder:(id)a3;
- (_TtC8PaperKit11ValueSlider)initWithFrame:(CGRect)a3;
- (void)didChangeSlider;
- (void)didFinishChangingSlider;
- (void)didStartChangingSlider;
@end

@implementation ValueSlider

- (_TtC8PaperKit11ValueSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ValueSlider.init(coder:)();
}

- (void)didStartChangingSlider
{
}

- (void)didFinishChangingSlider
{
}

- (void)didChangeSlider
{
  v2 = self;
  ValueSlider.didChangeSlider()();
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit11ValueSlider_contentStackView);
  double v3 = *MEMORY[0x263F83810];
  double v4 = *(double *)(MEMORY[0x263F83810] + 8);
  v5 = self;
  objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, v3, v4);
  double v7 = v6;
  double v9 = v8;
  double v10 = *(double *)((char *)&v5->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit11ValueSlider_minimumContentSizeHeight);

  if (v10 > v9) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  double v12 = v7;
  result.height = v11;
  result.width = v12;
  return result;
}

- (_TtC8PaperKit11ValueSlider)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8PaperKit11ValueSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit11ValueSlider_leadingContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit11ValueSlider_trailingContentView));

  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit11ValueSlider_contentStackView);
}

@end