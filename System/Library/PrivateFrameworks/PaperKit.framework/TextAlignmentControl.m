@interface TextAlignmentControl
- (_TtC8PaperKit20TextAlignmentControl)initWithCoder:(id)a3;
- (_TtC8PaperKit20TextAlignmentControl)initWithFrame:(CGRect)a3;
- (void)didTapCenterAlignmentButton;
- (void)didTapJustifiedAlignmentButton;
- (void)didTapLeftAlignmentButton;
- (void)didTapRightAlignmentButton;
- (void)layoutSubviews;
@end

@implementation TextAlignmentControl

- (_TtC8PaperKit20TextAlignmentControl)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized TextAlignmentControl.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  TextAlignmentControl.layoutSubviews()();
}

- (void)didTapLeftAlignmentButton
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(void *)v2 = 0;
  v2[8] = 0;
  id v3 = self;
  TextAlignmentControl.updateUI()();
  [(TextAlignmentControl *)v3 sendActionsForControlEvents:4096];
}

- (void)didTapCenterAlignmentButton
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(void *)v2 = 1;
  v2[8] = 0;
  id v3 = self;
  TextAlignmentControl.updateUI()();
  [(TextAlignmentControl *)v3 sendActionsForControlEvents:4096];
}

- (void)didTapRightAlignmentButton
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(void *)v2 = 2;
  v2[8] = 0;
  id v3 = self;
  TextAlignmentControl.updateUI()();
  [(TextAlignmentControl *)v3 sendActionsForControlEvents:4096];
}

- (void)didTapJustifiedAlignmentButton
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(void *)v2 = 3;
  v2[8] = 0;
  id v3 = self;
  TextAlignmentControl.updateUI()();
  [(TextAlignmentControl *)v3 sendActionsForControlEvents:4096];
}

- (_TtC8PaperKit20TextAlignmentControl)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit20TextAlignmentControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_leftAlignmentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_centerAlignmentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_rightAlignmentButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_justifiedAlignmentButton);
}

@end