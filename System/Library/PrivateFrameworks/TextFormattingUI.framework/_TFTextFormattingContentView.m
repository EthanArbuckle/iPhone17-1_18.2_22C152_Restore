@interface _TFTextFormattingContentView
- (UIEdgeInsets)safeAreaInsets;
- (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView)initWithCoder:(id)a3;
- (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView)initWithFrame:(CGRect)a3;
@end

@implementation _TFTextFormattingContentView

- (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView)initWithCoder:(id)a3
{
  swift_weakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView____lazy_storage___childView) = 0;
  id v5 = a3;

  result = (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView *)sub_25EB4E5B8();
  __break(1u);
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView____lazy_storage___childView);
}

@end