@interface UIKBKeyplaneTransformationContext
- (BOOL)usesScriptSwitch;
- (CGSize)keyboardSize;
- (NSString)currentKeyplaneName;
- (UIKBScreenTraits)screenTraits;
- (UIKBTree)activeKeyboard;
- (UIKBTree)activeKeyplane;
- (double)resizingOffset;
- (void)setActiveKeyboard:(id)a3;
- (void)setActiveKeyplane:(id)a3;
- (void)setCurrentKeyplaneName:(id)a3;
- (void)setKeyboardSize:(CGSize)a3;
- (void)setResizingOffset:(double)a3;
- (void)setScreenTraits:(id)a3;
- (void)setUsesScriptSwitch:(BOOL)a3;
@end

@implementation UIKBKeyplaneTransformationContext

- (UIKBTree)activeKeyboard
{
  return self->_activeKeyboard;
}

- (void)setActiveKeyboard:(id)a3
{
}

- (UIKBTree)activeKeyplane
{
  return self->_activeKeyplane;
}

- (void)setActiveKeyplane:(id)a3
{
}

- (CGSize)keyboardSize
{
  double width = self->_keyboardSize.width;
  double height = self->_keyboardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setKeyboardSize:(CGSize)a3
{
  self->_keyboardSize = a3;
}

- (NSString)currentKeyplaneName
{
  return self->_currentKeyplaneName;
}

- (void)setCurrentKeyplaneName:(id)a3
{
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
}

- (BOOL)usesScriptSwitch
{
  return self->_usesScriptSwitch;
}

- (void)setUsesScriptSwitch:(BOOL)a3
{
  self->_usesScriptSwitch = a3;
}

- (double)resizingOffset
{
  return self->_resizingOffset;
}

- (void)setResizingOffset:(double)a3
{
  self->_resizingOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_currentKeyplaneName, 0);
  objc_storeStrong((id *)&self->_activeKeyplane, 0);
  objc_storeStrong((id *)&self->_activeKeyboard, 0);
}

@end