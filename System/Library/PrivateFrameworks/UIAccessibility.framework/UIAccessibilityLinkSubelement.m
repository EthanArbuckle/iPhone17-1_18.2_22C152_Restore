@interface UIAccessibilityLinkSubelement
- (CGRect)accessibilityFrame;
- (NSURL)url;
- (_NSRange)range;
- (id)textRangeForTextView:(id)a3;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)setRange:(_NSRange)a3;
- (void)setUrl:(id)a3;
@end

@implementation UIAccessibilityLinkSubelement

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4F43518];
}

- (unint64_t)_accessibilityAutomationType
{
  return 42;
}

- (id)textRangeForTextView:(id)a3
{
  id v4 = a3;
  v5 = [v4 beginningOfDocument];
  v6 = objc_msgSend(v4, "positionFromPosition:offset:", v5, -[UIAccessibilityLinkSubelement range](self, "range"));
  uint64_t v7 = [(UIAccessibilityLinkSubelement *)self range];
  [(UIAccessibilityLinkSubelement *)self range];
  v9 = [v4 positionFromPosition:v5 offset:v8 + v7];
  v10 = [v4 textRangeFromPosition:v6 toPosition:v9];

  return v10;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:6];
  id v4 = (void *)v3;
  if (!v3)
  {
    v12 = [(UIAccessibilityLinkSubelement *)self accessibilityContainer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [(UIAccessibilityLinkSubelement *)self accessibilityContainer];
      id v15 = (id)objc_msgSend(v14, "hitTest:withEvent:", 0, 0.0, 0.0);

      v16 = [(UIAccessibilityLinkSubelement *)self accessibilityContainer];
      v17 = [(UIAccessibilityLinkSubelement *)self textRangeForTextView:v16];
      [(UIView *)v16 firstRectForRange:v17];
      CGRect v23 = UIAccessibilityConvertFrameToScreenCoordinates(v22, v16);
    }
    else
    {
      v16 = [(UIAccessibilityElement *)self accessibilityDelegate];
      if (v16)
      {
        if (objc_opt_respondsToSelector())
        {
          [(UIView *)v16 accessibilityFrame:self];
          CGFloat x = v24.origin.x;
          CGFloat y = v24.origin.y;
          CGFloat width = v24.size.width;
          CGFloat height = v24.size.height;
          if (!CGRectIsEmpty(v24)) {
            goto LABEL_10;
          }
        }
      }
      v17 = [(UIAccessibilityLinkSubelement *)self accessibilityContainer];
      [v17 accessibilityFrame];
    }
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;

LABEL_10:
    goto LABEL_11;
  }
  CGFloat x = (*(double (**)(uint64_t))(v3 + 16))(v3);
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
LABEL_11:

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end