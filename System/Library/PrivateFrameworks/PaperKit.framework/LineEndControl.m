@interface LineEndControl
- (CGSize)intrinsicContentSize;
- (_TtC8PaperKit14LineEndControl)initWithCoder:(id)a3;
- (_TtC8PaperKit14LineEndControl)initWithFrame:(CGRect)a3;
- (void)didTapNoArrowButton;
- (void)didTapOneArrowButton;
- (void)didTapTwoArrowButton;
- (void)layoutSubviews;
@end

@implementation LineEndControl

- (_TtC8PaperKit14LineEndControl)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit14LineEndControl_contentStackView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LineEndControl_regularCornerRadius) = (Class)0x4020000000000000;

  result = (_TtC8PaperKit14LineEndControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  LineEndControl.layoutSubviews()();
}

- (void)didTapNoArrowButton
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit14LineEndControl_lineEnds;
  *(void *)v2 = 0;
  v2[8] = 0;
  *((void *)v2 + 2) = 0;
  v2[24] = 0;
  v3 = self;
  LineEndControl.updateUI()();
  [(LineEndControl *)v3 sendActionsForControlEvents:4096];
}

- (void)didTapOneArrowButton
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit14LineEndControl_lineEnds;
  *(void *)v2 = 1;
  v2[8] = 0;
  *((void *)v2 + 2) = 0;
  v2[24] = 0;
  v3 = self;
  LineEndControl.updateUI()();
  [(LineEndControl *)v3 sendActionsForControlEvents:4096];
}

- (void)didTapTwoArrowButton
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit14LineEndControl_lineEnds;
  *(void *)v2 = 1;
  v2[8] = 0;
  *((void *)v2 + 2) = 1;
  v2[24] = 0;
  v3 = self;
  LineEndControl.updateUI()();
  [(LineEndControl *)v3 sendActionsForControlEvents:4096];
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LineEndControl_contentStackView), sel_systemLayoutSizeFittingSize_, *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC8PaperKit14LineEndControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8PaperKit14LineEndControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14LineEndControl_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14LineEndControl_noArrowButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14LineEndControl_oneArrowButton));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LineEndControl_twoArrowButton);
}

@end