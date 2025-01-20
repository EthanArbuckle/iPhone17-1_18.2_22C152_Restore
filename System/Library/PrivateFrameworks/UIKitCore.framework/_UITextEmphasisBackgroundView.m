@interface _UITextEmphasisBackgroundView
- (BOOL)shouldBeArchived;
- (CGPoint)origin;
- (NSTextRange)textRange;
- (_UITextEmphasisBackgroundView)initWithTextView:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setTextRange:(id)a3;
@end

@implementation _UITextEmphasisBackgroundView

- (_UITextEmphasisBackgroundView)initWithTextView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v8.receiver = self;
  v8.super_class = (Class)_UITextEmphasisBackgroundView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textView, v4);
    [(UIView *)v6 setUserInteractionEnabled:0];
    [(UIView *)v6 setClipsToBounds:1];
    [(UIView *)v6 setAutoresizingMask:18];
    [(UIView *)v6 setOpaque:0];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRange, 0);
  objc_destroyWeak((id *)&self->_textView);
}

- (BOOL)shouldBeArchived
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "drawTextHighlightBackgroundForTextRange:origin:", self->_textRange, self->_origin.x, self->_origin.y);
}

- (NSTextRange)textRange
{
  return (NSTextRange *)objc_getProperty(self, a2, 416, 1);
}

- (void)setTextRange:(id)a3
{
}

- (CGPoint)origin
{
  objc_copyStruct(v4, &self->_origin, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_origin, &v3, 16, 1, 0);
}

@end