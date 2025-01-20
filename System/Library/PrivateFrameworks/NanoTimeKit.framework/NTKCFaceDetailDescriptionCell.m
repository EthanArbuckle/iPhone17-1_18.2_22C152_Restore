@interface NTKCFaceDetailDescriptionCell
+ (id)reuseIdentifier;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSAttributedString)attributedText;
- (NSString)text;
- (NTKCFaceDetailDescriptionCell)init;
- (UITextView)textView;
- (double)rowHeight;
- (id)_fontDescriptor;
- (void)_fontSizeDidChange;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setText:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation NTKCFaceDetailDescriptionCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailDescriptionCell)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailDescriptionCell;
  v2 = [(NTKCDetailTableViewCell *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(NTKCFaceDetailDescriptionCell *)v2 setTextView:v3];

    v4 = BPSDetailTextColor();
    [(UITextView *)v2->_textView setTextColor:v4];

    [(UITextView *)v2->_textView setBackgroundColor:0];
    [(UITextView *)v2->_textView setScrollEnabled:0];
    [(UITextView *)v2->_textView setEditable:0];
    [(UITextView *)v2->_textView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)v2->_textView setSelectable:1];
    v5 = [(UITextView *)v2->_textView textContainer];
    [v5 setLineBreakMode:4];

    v6 = [(UITextView *)v2->_textView textContainer];
    [v6 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](v2->_textView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v7 = NTKCActionColor();
    [(UITextView *)v2->_textView setTintColor:v7];

    [(UITextView *)v2->_textView setDelegate:v2];
    [(UITextView *)v2->_textView setClipsToBounds:0];
    v8 = [(NTKCFaceDetailDescriptionCell *)v2 contentView];
    [v8 addSubview:v2->_textView];

    [(NTKCFaceDetailDescriptionCell *)v2 _fontSizeDidChange];
  }
  return v2;
}

- (NSString)text
{
  return [(UITextView *)self->_textView text];
}

- (void)setText:(id)a3
{
  [(UITextView *)self->_textView setText:a3];
  [(NTKCFaceDetailDescriptionCell *)self setNeedsLayout];
}

- (NSAttributedString)attributedText
{
  return [(UITextView *)self->_textView attributedText];
}

- (void)setAttributedText:(id)a3
{
  [(UITextView *)self->_textView setAttributedText:a3];
  [(NTKCFaceDetailDescriptionCell *)self setNeedsLayout];
}

- (double)rowHeight
{
  [(NTKCFaceDetailDescriptionCell *)self layoutIfNeeded];
  v3 = [(UITextView *)self->_textView font];
  [v3 _scaledValueForValue:13.5];
  double v5 = v4;
  [(UITextView *)self->_textView bounds];
  double v6 = v5 + CGRectGetHeight(v10);
  [v3 _scaledValueForValue:21.5];
  double v8 = v6 + v7;

  return v8;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)NTKCFaceDetailDescriptionCell;
  [(NTKCDetailTableViewCell *)&v22 layoutSubviews];
  v3 = [(NTKCFaceDetailDescriptionCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  double Width = CGRectGetWidth(v23);
  [(NTKCFaceDetailDescriptionCell *)self separatorInset];
  double v14 = Width + v13 * -2.0;
  [(UITextView *)self->_textView frame];
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v14, 1.79769313e308);
  double v16 = v15;
  [(NTKCFaceDetailDescriptionCell *)self separatorInset];
  double v18 = v17;
  v19 = [(UITextView *)self->_textView font];
  [v19 _scaledValueForValue:13.5];
  double v21 = v20;

  -[UITextView setFrame:](self->_textView, "setFrame:", v18, v21, v14, v16);
}

- (id)_fontDescriptor
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2948]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:0x8000];

  return v3;
}

- (void)_fontSizeDidChange
{
  id v4 = [(NTKCFaceDetailDescriptionCell *)self _fontDescriptor];
  v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
  [(UITextView *)self->_textView setFont:v3];
  [(NTKCFaceDetailDescriptionCell *)self setNeedsLayout];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return a6 == 0;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end