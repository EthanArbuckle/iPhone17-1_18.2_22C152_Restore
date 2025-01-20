@interface TTRIExpandedHitTestImageView
- (CGRect)accessibilityFrame;
- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithFrame:(CGRect)a3;
- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithImage:(id)a3;
- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)layoutSubviews;
- (void)setAccessibilityFrame:(CGRect)a3;
@end

@implementation TTRIExpandedHitTestImageView

- (void)layoutSubviews
{
  v2 = self;
  TTRIExpandedHitTestImageView.layoutSubviews()();
}

- (CGRect)accessibilityFrame
{
  double v2 = sub_1B944B3E4(self, (uint64_t)a2, type metadata accessor for TTRIExpandedHitTestImageView);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIExpandedHitTestImageView();
  return [(TTRIExpandedHitTestImageView *)&v5 initWithImage:a3];
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIExpandedHitTestImageView();
  return [(TTRIExpandedHitTestImageView *)&v7 initWithImage:a3 highlightedImage:a4];
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore28TTRIExpandedHitTestImageView *)sub_1B944B870(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TTRIExpandedHitTestImageView);
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore28TTRIExpandedHitTestImageView *)sub_1B944B968(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for TTRIExpandedHitTestImageView);
}

@end