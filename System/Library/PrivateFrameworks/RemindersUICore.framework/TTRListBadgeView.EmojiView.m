@interface TTRListBadgeView.EmojiView
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView)initWithCoder:(id)a3;
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation TTRListBadgeView.EmojiView

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRListBadgeView.EmojiView();
  v7 = -[TTRListBadgeView.EmojiView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(TTRListBadgeView.EmojiView *)v7 setTextAlignment:1];
  return v7;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView)initWithCoder:(id)a3
{
  result = (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4 = UIEdgeInsetsInsetRect_1(a3.origin.x);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TTRListBadgeView.EmojiView();
  v11 = self;
  -[TTRListBadgeView.EmojiView drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);
}

@end