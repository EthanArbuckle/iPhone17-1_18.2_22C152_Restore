@interface TTRIExpandedHitTestButton
- (CGRect)accessibilityFrame;
- (_TtC15RemindersUICore25TTRIExpandedHitTestButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore25TTRIExpandedHitTestButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityFrame:(CGRect)a3;
@end

@implementation TTRIExpandedHitTestButton

- (void)layoutSubviews
{
  v2 = self;
  TTRIExpandedHitTestButton.layoutSubviews()();
}

- (CGRect)accessibilityFrame
{
  double v2 = sub_1B944B3E4(self, (uint64_t)a2, type metadata accessor for TTRIExpandedHitTestButton);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
}

- (_TtC15RemindersUICore25TTRIExpandedHitTestButton)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore25TTRIExpandedHitTestButton *)sub_1B944B870(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TTRIExpandedHitTestButton);
}

- (_TtC15RemindersUICore25TTRIExpandedHitTestButton)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore25TTRIExpandedHitTestButton *)sub_1B944B968(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for TTRIExpandedHitTestButton);
}

@end