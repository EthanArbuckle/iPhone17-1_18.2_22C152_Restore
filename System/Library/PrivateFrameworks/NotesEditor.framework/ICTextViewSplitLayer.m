@interface ICTextViewSplitLayer
- (UITextView)textView;
- (void)drawInContext:(CGContext *)a3;
- (void)setTextView:(id)a3;
@end

@implementation ICTextViewSplitLayer

- (void)drawInContext:(CGContext *)a3
{
  UIGraphicsPushContext(a3);
  v4 = [(ICTextViewSplitLayer *)self textView];
  v5 = [v4 layoutManager];
  v6 = [(ICTextViewSplitLayer *)self textView];
  v7 = [v6 textContainer];
  uint64_t v8 = [v5 glyphRangeForTextContainer:v7];
  uint64_t v10 = v9;

  [(ICTextViewSplitLayer *)self sublayerTransform];
  v11 = [(ICTextViewSplitLayer *)self textView];
  v12 = [v11 layoutManager];
  objc_msgSend(v12, "drawGlyphsForGlyphRange:atPoint:updateAttachments:", v8, v10, 0, 0.0, 0.0);

  UIGraphicsPopContext();
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (UITextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end