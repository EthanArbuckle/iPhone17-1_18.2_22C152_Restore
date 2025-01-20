@interface UISimpleTextPrintFormatter
- (UISimpleTextPrintFormatter)initWithAttributedText:(NSAttributedString *)attributedText;
- (UISimpleTextPrintFormatter)initWithText:(NSString *)text;
@end

@implementation UISimpleTextPrintFormatter

- (UISimpleTextPrintFormatter)initWithText:(NSString *)text
{
  v4 = (objc_class *)MEMORY[0x1E4FB1DD8];
  v5 = text;
  v6 = objc_msgSend([v4 alloc], "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
  [v6 setText:v5];

  v7 = [(UIViewPrintFormatter *)[UITextViewPrintFormatter alloc] _initWithView:v6];
  return v7;
}

- (UISimpleTextPrintFormatter)initWithAttributedText:(NSAttributedString *)attributedText
{
  v4 = (objc_class *)MEMORY[0x1E4FB1DD8];
  v5 = attributedText;
  v6 = objc_msgSend([v4 alloc], "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
  [v6 setAttributedText:v5];

  v7 = [(UIViewPrintFormatter *)[UITextViewPrintFormatter alloc] _initWithView:v6];
  return v7;
}

@end