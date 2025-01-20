@interface _UITextInputSessionKeyboardDockItemButtonPressAction
- (CGPoint)touchDownPoint;
- (CGPoint)touchUpPoint;
- (CGSize)buttonSize;
- (double)touchDuration;
- (id)description;
- (int64_t)inputActionCount;
- (int64_t)uiOrientation;
- (unint64_t)buttonPressResult;
- (unint64_t)buttonType;
- (void)setButtonPressResult:(unint64_t)a3;
- (void)setButtonSize:(CGSize)a3;
- (void)setButtonType:(unint64_t)a3;
- (void)setTouchDownPoint:(CGPoint)a3;
- (void)setTouchDuration:(double)a3;
- (void)setTouchUpPoint:(CGPoint)a3;
- (void)setUiOrientation:(int64_t)a3;
@end

@implementation _UITextInputSessionKeyboardDockItemButtonPressAction

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)_UITextInputSessionKeyboardDockItemButtonPressAction;
  v3 = [(_UITextInputSessionAction *)&v15 description];
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = NSString;
  v6 = +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonType:[(_UITextInputSessionKeyboardDockItemButtonPressAction *)self buttonType]];
  v7 = [v5 stringWithFormat:@"buttonType=%@", v6];
  [v4 addObject:v7];

  v8 = NSString;
  v9 = +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonPressResult:[(_UITextInputSessionKeyboardDockItemButtonPressAction *)self buttonPressResult]];
  v10 = [v8 stringWithFormat:@"buttonPressResult=%@", v9];
  [v4 addObject:v10];

  v11 = objc_msgSend(NSString, "stringWithFormat:", @"uiOrientation=%lu", -[_UITextInputSessionKeyboardDockItemButtonPressAction uiOrientation](self, "uiOrientation"));
  [v4 addObject:v11];

  v12 = [v4 componentsJoinedByString:@", "];
  v13 = [v3 stringByAppendingFormat:@", %@", v12];

  return v13;
}

- (int64_t)inputActionCount
{
  unint64_t v3 = [(_UITextInputSessionKeyboardDockItemButtonPressAction *)self buttonPressResult];
  int64_t result = [(_UITextInputSessionAction *)self inputActionCountFromMergedActions];
  if (v3 != 2) {
    ++result;
  }
  return result;
}

- (unint64_t)buttonPressResult
{
  return self->_buttonPressResult;
}

- (void)setButtonPressResult:(unint64_t)a3
{
  self->_buttonPressResult = a3;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)uiOrientation
{
  return self->_uiOrientation;
}

- (void)setUiOrientation:(int64_t)a3
{
  self->_uiOrientation = a3;
}

- (CGSize)buttonSize
{
  double width = self->_buttonSize.width;
  double height = self->_buttonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

- (CGPoint)touchDownPoint
{
  double x = self->_touchDownPoint.x;
  double y = self->_touchDownPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchDownPoint:(CGPoint)a3
{
  self->_touchDownPoint = a3;
}

- (CGPoint)touchUpPoint
{
  double x = self->_touchUpPoint.x;
  double y = self->_touchUpPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchUpPoint:(CGPoint)a3
{
  self->_touchUpPoint = a3;
}

- (double)touchDuration
{
  return self->_touchDuration;
}

- (void)setTouchDuration:(double)a3
{
  self->_touchDuration = a3;
}

@end