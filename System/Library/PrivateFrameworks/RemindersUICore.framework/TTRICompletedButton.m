@interface TTRICompletedButton
- (CGSize)intrinsicContentSize;
- (_TtC15RemindersUICore19TTRICompletedButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore19TTRICompletedButton)initWithFrame:(CGRect)a3;
@end

@implementation TTRICompletedButton

- (_TtC15RemindersUICore19TTRICompletedButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRICompletedButton();
  v7 = -[TTRIExpandedHitTestButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  TTRICompletedButton.commonInit()();

  return v7;
}

- (_TtC15RemindersUICore19TTRICompletedButton)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRICompletedButton();
  id v4 = a3;
  v5 = [(TTRIExpandedHitTestButton *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    TTRICompletedButton.commonInit()();
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = TTRICompletedButton.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

@end