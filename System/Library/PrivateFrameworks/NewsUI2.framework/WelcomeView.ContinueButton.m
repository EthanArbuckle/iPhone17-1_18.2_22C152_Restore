@interface WelcomeView.ContinueButton
- (BOOL)isHighlighted;
- (_TtCC7NewsUI211WelcomeView14ContinueButton)initWithCoder:(id)a3;
- (_TtCC7NewsUI211WelcomeView14ContinueButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation WelcomeView.ContinueButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WelcomeView.ContinueButton();
  return [(WelcomeView.ContinueButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WelcomeView.ContinueButton();
  id v4 = v5.receiver;
  [(WelcomeView.ContinueButton *)&v5 setHighlighted:v3];
  sub_1DEC09728();
}

- (_TtCC7NewsUI211WelcomeView14ContinueButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WelcomeView.ContinueButton();
  v7 = -[WelcomeView.ContinueButton initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  uint64_t v8 = qword_1EBAEA660;
  v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  [(WelcomeView.ContinueButton *)v9 setBackgroundColor:qword_1EBB62CA0];

  return v9;
}

- (_TtCC7NewsUI211WelcomeView14ContinueButton)initWithCoder:(id)a3
{
  result = (_TtCC7NewsUI211WelcomeView14ContinueButton *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

@end