@interface TTRIInlineButtonAttachmentTextViewButton
- (BOOL)isAccessibilityElement;
- (_TtC15RemindersUICore40TTRIInlineButtonAttachmentTextViewButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore40TTRIInlineButtonAttachmentTextViewButton)initWithFrame:(CGRect)a3;
@end

@implementation TTRIInlineButtonAttachmentTextViewButton

- (BOOL)isAccessibilityElement
{
  return !UIAccessibilityIsVoiceOverRunning();
}

- (_TtC15RemindersUICore40TTRIInlineButtonAttachmentTextViewButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRIInlineButtonAttachmentTextViewButton();
  return -[TTRIInlineButtonAttachmentTextViewButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore40TTRIInlineButtonAttachmentTextViewButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIInlineButtonAttachmentTextViewButton();
  return [(TTRIInlineButtonAttachmentTextViewButton *)&v5 initWithCoder:a3];
}

@end