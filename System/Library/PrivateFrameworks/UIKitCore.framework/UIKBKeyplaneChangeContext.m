@interface UIKBKeyplaneChangeContext
+ (id)keyplaneChangeContext;
+ (id)keyplaneChangeContextWithSize:(CGSize)a3;
- (BOOL)isDynamicLayout;
- (BOOL)isSecureTextEntry;
- (BOOL)selfSizingChanged;
- (BOOL)sizeDidChange;
- (BOOL)splitWidthsChanged;
- (BOOL)updateAssistantView;
- (CGSize)size;
- (void)setIsDynamicLayout:(BOOL)a3;
- (void)setIsSecureTextEntry:(BOOL)a3;
- (void)setSelfSizingChanged:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setSplitWidthsChanged:(BOOL)a3;
- (void)setUpdateAssistantView:(BOOL)a3;
@end

@implementation UIKBKeyplaneChangeContext

+ (id)keyplaneChangeContext
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (id)keyplaneChangeContextWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v5, "setSize:", width, height);
  return v5;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
  self->_sizeDidChange = 1;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)sizeDidChange
{
  return self->_sizeDidChange;
}

- (BOOL)splitWidthsChanged
{
  return self->_splitWidthsChanged;
}

- (void)setSplitWidthsChanged:(BOOL)a3
{
  self->_splitWidthsChanged = a3;
}

- (BOOL)selfSizingChanged
{
  return self->_selfSizingChanged;
}

- (void)setSelfSizingChanged:(BOOL)a3
{
  self->_selfSizingChanged = a3;
}

- (BOOL)updateAssistantView
{
  return self->_updateAssistantView;
}

- (void)setUpdateAssistantView:(BOOL)a3
{
  self->_updateAssistantView = a3;
}

- (BOOL)isSecureTextEntry
{
  return self->_isSecureTextEntry;
}

- (void)setIsSecureTextEntry:(BOOL)a3
{
  self->_isSecureTextEntry = a3;
}

- (BOOL)isDynamicLayout
{
  return self->_isDynamicLayout;
}

- (void)setIsDynamicLayout:(BOOL)a3
{
  self->_isDynamicLayout = a3;
}

@end