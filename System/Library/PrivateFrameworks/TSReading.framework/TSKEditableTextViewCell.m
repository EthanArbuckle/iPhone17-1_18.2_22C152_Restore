@interface TSKEditableTextViewCell
- (BOOL)isNegative;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (NSString)string;
- (TSKEditableTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)beginEditing;
- (void)dealloc;
- (void)deleteBackward;
- (void)endEditing;
- (void)insertDecimalSeparator;
- (void)insertNumber:(int64_t)a3;
- (void)layoutSubviews;
- (void)p_insertString:(id)a3;
- (void)p_parseText:(id)a3;
- (void)parseText;
- (void)setInputView:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setString:(id)a3;
- (void)setTextDelegate:(id)a3;
- (void)setTextTag:(int64_t)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)tintColorDidChange;
- (void)toggleNegative;
@end

@implementation TSKEditableTextViewCell

- (TSKEditableTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSKEditableTextViewCell;
  v4 = [(TSKEditableTextViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    -[TSKEditableTextViewCell setFont:](v4, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:17.0]);
    v5 = [TSKPlaceholderTextView alloc];
    v6 = -[TSKPlaceholderTextView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v4->mTextView = v6;
    [(TSKPlaceholderTextView *)v6 setTextAlignment:2];
    -[TSKPlaceholderTextView setFont:](v4->mTextView, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:17.0]);
    [(TSKPlaceholderTextView *)v4->mTextView setTextColor:[(TSKEditableTextViewCell *)v4 tintColor]];
    [(TSKPlaceholderTextView *)v4->mTextView setReturnKeyType:9];
    [(TSKPlaceholderTextView *)v4->mTextView setUserInteractionEnabled:0];
    [(TSKPlaceholderTextView *)v4->mTextView setScrollEnabled:0];
    [(TSKPlaceholderTextView *)v4->mTextView setOpaque:0];
    -[TSKPlaceholderTextView setBackgroundColor:](v4->mTextView, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v4 selector:sel_textFieldDidEndEditing_ name:*MEMORY[0x263F1D780] object:v4->mTextView];
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSKEditableTextViewCell;
  [(TSKEditableTextViewCell *)&v3 dealloc];
}

- (void)tintColorDidChange
{
  uint64_t v3 = [(TSKEditableTextViewCell *)self tintColor];
  mTextView = self->mTextView;
  [(TSKPlaceholderTextView *)mTextView setTextColor:v3];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)TSKEditableTextViewCell;
  [(TSKEditableTextViewCell *)&v18 layoutSubviews];
  objc_msgSend((id)-[TSKEditableTextViewCell contentView](self, "contentView"), "bounds");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = (void *)[(TSKEditableTextViewCell *)self textLabel];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  objc_msgSend(v11, "setFrame:", v13, v15, CGRectGetMaxX(v19) + -160.0, v17);
  [v11 setAdjustsLetterSpacingToFitWidth:1];
  [v11 setAdjustsFontSizeToFitWidth:1];
  [v11 setMinimumFontSize:12.0];
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v21.origin.x = CGRectGetMaxX(v20) + -170.0;
  v21.size.width = 160.0;
  v21.origin.y = 3.0;
  v21.size.height = 29.0;
  CGRect v22 = CGRectIntegral(v21);
  -[TSKPlaceholderTextView setFrame:](self->mTextView, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  if (![(TSKPlaceholderTextView *)self->mTextView superview]) {
    objc_msgSend((id)-[TSKEditableTextViewCell contentView](self, "contentView"), "addSubview:", self->mTextView);
  }
}

- (NSString)string
{
  return (NSString *)[(TSKPlaceholderTextView *)self->mTextView text];
}

- (void)p_parseText:(id)a3
{
  self->mNumberHasDecimal = 0;
  uint64_t v5 = [a3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while ([a3 characterAtIndex:v7] != 46)
    {
      if (v6 == ++v7) {
        return;
      }
    }
    self->mNumberHasDecimal = 1;
  }
}

- (void)setString:(id)a3
{
  -[TSKEditableTextViewCell p_parseText:](self, "p_parseText:");
  mTextView = self->mTextView;
  [(TSKPlaceholderTextView *)mTextView setText:a3];
}

- (void)setInputView:(id)a3
{
  mInputView = self->mInputView;
  if (mInputView != a3)
  {

    self->mInputView = (UIView *)a3;
  }
}

- (void)setPlaceholder:(id)a3
{
}

- (void)setTextTag:(int64_t)a3
{
}

- (void)setTextDelegate:(id)a3
{
}

- (void)beginEditing
{
  [(TSKPlaceholderTextView *)self->mTextView setInputView:self->mInputView];
  [(TSKPlaceholderTextView *)self->mTextView setUserInteractionEnabled:1];
  if (self->mSavedDelegate)
  {
    -[TSKPlaceholderTextView setDelegate:](self->mTextView, "setDelegate:");
    self->mSavedDelegate = 0;
  }
  [(TSKPlaceholderTextView *)self->mTextView becomeFirstResponder];
  if (([(TSKPlaceholderTextView *)self->mTextView isFirstResponder] & 1) == 0)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKEditableTextViewCell beginEditing]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"];
    [v3 handleFailureInFunction:v4, v5, 321, @"We just tried to begin text view editing, but did not become a first responder." file lineNumber description];
  }
}

- (void)endEditing
{
  [(TSKPlaceholderTextView *)self->mTextView setInputView:0];
  [(TSKPlaceholderTextView *)self->mTextView setUserInteractionEnabled:0];
  [(TSKPlaceholderTextView *)self->mTextView resignFirstResponder];
  self->mSavedDelegate = (UITextViewDelegate *)[(TSKPlaceholderTextView *)self->mTextView delegate];
  [(TSKPlaceholderTextView *)self->mTextView setDelegate:self];
  if ([(TSKPlaceholderTextView *)self->mTextView isFirstResponder])
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKEditableTextViewCell endEditing]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"];
    [v3 handleFailureInFunction:v4, v5, 336, @"We just tried to end text view editing, but did not resign the first responder." file lineNumber description];
  }
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return [(TSKPlaceholderTextView *)self->mTextView isUserInteractionEnabled];
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (void)p_insertString:(id)a3
{
  uint64_t v5 = [(TSKPlaceholderTextView *)self->mTextView selectedRange];
  uint64_t v7 = v6;
  if (![(TSKEditableTextViewCell *)self isNegative] || v5)
  {
    id v9 = (id)[(NSString *)[(TSKEditableTextViewCell *)self string] mutableCopy];
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v5, v7, a3);
    uint64_t v8 = [a3 length] + v5;
    [(TSKEditableTextViewCell *)self setString:v9];
    -[TSKPlaceholderTextView setSelectedRange:](self->mTextView, "setSelectedRange:", v8, 0);
  }
}

- (void)parseText
{
  double v3 = [(TSKEditableTextViewCell *)self string];
  [(TSKEditableTextViewCell *)self p_parseText:v3];
}

- (BOOL)isNegative
{
  v2 = [(TSKEditableTextViewCell *)self string];
  uint64_t v3 = [(NSString *)v2 length];
  if (v3) {
    LOBYTE(v3) = [(NSString *)v2 characterAtIndex:0] == 45;
  }
  return v3;
}

- (void)insertNumber:(int64_t)a3
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  if (([(TSKPlaceholderTextView *)self->mTextView isFirstResponder] & 1) == 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKEditableTextViewCell insertNumber:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 392, @"The current cell is not the first responder!");
  }
  [(TSKEditableTextViewCell *)self p_insertString:v4];
}

- (void)insertDecimalSeparator
{
  if (!self->mNumberHasDecimal)
  {
    if (([(TSKPlaceholderTextView *)self->mTextView isFirstResponder] & 1) == 0)
    {
      uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[TSKEditableTextViewCell insertDecimalSeparator]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 403, @"The current cell is not the first responder!");
    }
    -[TSKEditableTextViewCell p_insertString:](self, "p_insertString:", [MEMORY[0x263F7C890] currentLocaleDecimalSeparator]);
    self->mNumberHasDecimal = 1;
  }
}

- (void)deleteBackward
{
  if (([(TSKPlaceholderTextView *)self->mTextView isFirstResponder] & 1) == 0)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKEditableTextViewCell deleteBackward]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 415, @"The current cell is not the first responder!");
  }
  id v10 = (id)[(NSString *)[(TSKEditableTextViewCell *)self string] mutableCopy];
  if ([v10 length])
  {
    uint64_t v5 = [(TSKPlaceholderTextView *)self->mTextView selectedRange];
    uint64_t v7 = (v6 == 0) & (v5 != 0);
    if (v6 == 0 && v5 != 0) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v9 = v5 - v7;
    objc_msgSend(v10, "deleteCharactersInRange:", v5 - v7, v8);
    [(TSKEditableTextViewCell *)self setString:v10];
    -[TSKPlaceholderTextView setSelectedRange:](self->mTextView, "setSelectedRange:", v9, 0);
  }
}

- (void)toggleNegative
{
  if (([(TSKPlaceholderTextView *)self->mTextView isFirstResponder] & 1) == 0)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKEditableTextViewCell toggleNegative]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 442, @"The current cell is not the first responder!");
  }
  uint64_t v5 = [(TSKEditableTextViewCell *)self string];
  uint64_t v6 = [(TSKPlaceholderTextView *)self->mTextView selectedRange];
  uint64_t v8 = v7;
  if ([(TSKEditableTextViewCell *)self isNegative])
  {
    uint64_t v9 = [(NSString *)v5 substringFromIndex:1];
    uint64_t v10 = -1;
  }
  else
  {
    uint64_t v9 = [@"-" stringByAppendingString:v5];
    uint64_t v10 = 1;
  }
  uint64_t v11 = v6 + v10;
  [(TSKEditableTextViewCell *)self setString:v9];
  mTextView = self->mTextView;
  -[TSKPlaceholderTextView setSelectedRange:](mTextView, "setSelectedRange:", v11, v8);
}

@end