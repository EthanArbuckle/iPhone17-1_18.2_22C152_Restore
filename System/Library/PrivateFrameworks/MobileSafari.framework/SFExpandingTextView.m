@interface SFExpandingTextView
- (CGSize)intrinsicContentSize;
- (SFExpandingTextView)init;
- (SFExpandingTextView)initWithMaxHeight:(double)a3;
- (void)setText:(id)a3;
@end

@implementation SFExpandingTextView

- (SFExpandingTextView)init
{
  return [(SFExpandingTextView *)self initWithMaxHeight:0.0];
}

- (SFExpandingTextView)initWithMaxHeight:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFExpandingTextView;
  v4 = [(SFExpandingTextView *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxHeight = a3;
    [(SFExpandingTextView *)v4 setScrollEnabled:0];
    v6 = v5;
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)SFExpandingTextView;
  [(SFExpandingTextView *)&v10 intrinsicContentSize];
  double v5 = v4;
  double v6 = v3;
  double maxHeight = self->_maxHeight;
  if (maxHeight != 0.0)
  {
    [(SFExpandingTextView *)self setScrollEnabled:v3 >= maxHeight];
    if (v6 >= maxHeight) {
      double v6 = self->_maxHeight;
    }
  }
  double v8 = v5;
  double v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFExpandingTextView;
  [(SFExpandingTextView *)&v4 setText:a3];
  [(SFExpandingTextView *)self invalidateIntrinsicContentSize];
}

@end