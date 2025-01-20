@interface TTRIWhitespaceSelectionAvoidingTextView
- (_TtC15RemindersUICore39TTRIWhitespaceSelectionAvoidingTextView)initWithCoder:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TTRIWhitespaceSelectionAvoidingTextView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  TTRIWhitespaceSelectionAvoidingTextView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (_TtC15RemindersUICore39TTRIWhitespaceSelectionAvoidingTextView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIWhitespaceSelectionAvoidingTextView();
  return [(TTRIReminderTitleTextView *)&v5 initWithCoder:a3];
}

@end