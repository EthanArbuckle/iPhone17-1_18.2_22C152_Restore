@interface UIKBDerivedKeyboard
- (BOOL)addsSupplementaryControlKeys;
- (CGSize)keyboardSize;
- (CGSize)keyboardSizeBasis;
- (NSString)derivedKBStarPrefixName;
- (void)setAddsSupplementaryControlKeys:(BOOL)a3;
- (void)setDerivedKBStarPrefixName:(id)a3;
- (void)setKeyboardSize:(CGSize)a3;
- (void)setKeyboardSizeBasis:(CGSize)a3;
@end

@implementation UIKBDerivedKeyboard

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

- (CGSize)keyboardSizeBasis
{
  double width = self->_keyboardSizeBasis.width;
  double height = self->_keyboardSizeBasis.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setKeyboardSizeBasis:(CGSize)a3
{
  self->_keyboardSizeBasis = a3;
}

- (NSString)derivedKBStarPrefixName
{
  return self->_derivedKBStarPrefixName;
}

- (void)setDerivedKBStarPrefixName:(id)a3
{
}

- (BOOL)addsSupplementaryControlKeys
{
  return self->_addsSupplementaryControlKeys;
}

- (void)setAddsSupplementaryControlKeys:(BOOL)a3
{
  self->_addsSupplementaryControlKeys = a3;
}

- (void).cxx_destruct
{
}

@end