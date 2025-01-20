@interface _SMUTVFocusableTextView
- (BOOL)_textTruncating;
- (double)maximumLineWidth;
- (void)setMaximumLineWidth:(double)a3;
- (void)set_textTruncating:(BOOL)a3;
@end

@implementation _SMUTVFocusableTextView

- (double)maximumLineWidth
{
  return self->_maximumLineWidth;
}

- (void)setMaximumLineWidth:(double)a3
{
  self->_maximumLineWidth = a3;
}

- (BOOL)_textTruncating
{
  return self->__textTruncating;
}

- (void)set_textTruncating:(BOOL)a3
{
  self->__textTruncating = a3;
}

@end