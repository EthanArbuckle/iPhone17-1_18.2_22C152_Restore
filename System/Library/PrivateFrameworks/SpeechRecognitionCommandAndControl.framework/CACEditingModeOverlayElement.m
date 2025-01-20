@interface CACEditingModeOverlayElement
- (BOOL)isEqual:(id)a3;
- (CGRect)axFrame;
- (CGRect)interfaceOrientedFrame;
- (NSString)label;
- (NSString)representedText;
- (_NSRange)range;
- (unint64_t)textUnit;
- (void)setAxFrame:(CGRect)a3;
- (void)setInterfaceOrientedFrame:(CGRect)a3;
- (void)setLabel:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setRepresentedText:(id)a3;
- (void)setTextUnit:(unint64_t)a3;
@end

@implementation CACEditingModeOverlayElement

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    uint64_t v7 = [(CACEditingModeOverlayElement *)self range];
    uint64_t v9 = v8;
    BOOL v11 = 0;
    if (v7 == [v6 range] && v9 == v10)
    {
      v12 = [(CACEditingModeOverlayElement *)self label];
      v13 = [v6 label];
      if ([v12 isEqual:v13])
      {
        v14 = [(CACEditingModeOverlayElement *)self representedText];
        v15 = [v6 representedText];
        if ([v14 isEqual:v15])
        {
          [(CACEditingModeOverlayElement *)self axFrame];
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          [v6 axFrame];
          v30.origin.x = v24;
          v30.origin.y = v25;
          v30.size.width = v26;
          v30.size.height = v27;
          v29.origin.x = v17;
          v29.origin.y = v19;
          v29.size.width = v21;
          v29.size.height = v23;
          BOOL v11 = CGRectEqualToRect(v29, v30);
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)representedText
{
  return self->_representedText;
}

- (void)setRepresentedText:(id)a3
{
}

- (CGRect)axFrame
{
  double x = self->_axFrame.origin.x;
  double y = self->_axFrame.origin.y;
  double width = self->_axFrame.size.width;
  double height = self->_axFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAxFrame:(CGRect)a3
{
  self->_axFrame = a3;
}

- (CGRect)interfaceOrientedFrame
{
  double x = self->_interfaceOrientedFrame.origin.x;
  double y = self->_interfaceOrientedFrame.origin.y;
  double width = self->_interfaceOrientedFrame.size.width;
  double height = self->_interfaceOrientedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInterfaceOrientedFrame:(CGRect)a3
{
  self->_interfaceOrientedFrame = a3;
}

- (unint64_t)textUnit
{
  return self->_textUnit;
}

- (void)setTextUnit:(unint64_t)a3
{
  self->_textUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedText, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end