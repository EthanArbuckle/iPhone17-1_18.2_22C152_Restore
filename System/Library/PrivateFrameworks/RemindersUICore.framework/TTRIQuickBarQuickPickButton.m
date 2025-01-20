@interface TTRIQuickBarQuickPickButton
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation TTRIQuickBarQuickPickButton

- (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton *)sub_1B93502BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton *)sub_1B935043C(a3);
}

- (BOOL)isHighlighted
{
  return sub_1B935085C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1B935060C(a3);
}

- (BOOL)isSelected
{
  return sub_1B935085C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  [(TTRIQuickBarQuickPickButton *)&v5 setSelected:v3];
  v4[OBJC_IVAR____TtC15RemindersUICore27TTRIQuickBarQuickPickButton_colorsAreDirty] = 1;
  objc_msgSend(v4, sel_setNeedsLayout, v5.receiver, v5.super_class);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B935091C();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end