@interface UIKeyboardCameraSessionRTIConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isSingleLineDocument;
- (BOOL)isWebKitInteractionView;
- (BOOL)shouldSuppressKeyboard;
- (UIKeyboardCameraSessionRTIConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsSingleLineDocument:(BOOL)a3;
- (void)setIsWebKitInteractionView:(BOOL)a3;
- (void)setShouldSuppressKeyboard:(BOOL)a3;
@end

@implementation UIKeyboardCameraSessionRTIConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIKeyboardCameraSessionRTIConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v5 = [(UIKeyboardCameraSessionRTIConfiguration *)self init];
  if (v5)
  {
    v5->_isWebKitInteractionView = [v4 decodeBoolForKey:@"isWebKitInteractionView"];
    v5->_isSingleLineDocument = [v4 decodeBoolForKey:@"isSingleLineDocument"];
    v5->_shouldSuppressKeyboard = [v4 decodeBoolForKey:@"shouldSuppressKeyboard"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeBool:self->_isWebKitInteractionView forKey:@"isWebKitInteractionView"];
  [v4 encodeBool:self->_isSingleLineDocument forKey:@"isSingleLineDocument"];
  [v4 encodeBool:self->_shouldSuppressKeyboard forKey:@"shouldSuppressKeyboard"];
}

- (BOOL)isWebKitInteractionView
{
  return self->_isWebKitInteractionView;
}

- (void)setIsWebKitInteractionView:(BOOL)a3
{
  self->_isWebKitInteractionView = a3;
}

- (BOOL)isSingleLineDocument
{
  return self->_isSingleLineDocument;
}

- (void)setIsSingleLineDocument:(BOOL)a3
{
  self->_isSingleLineDocument = a3;
}

- (BOOL)shouldSuppressKeyboard
{
  return self->_shouldSuppressKeyboard;
}

- (void)setShouldSuppressKeyboard:(BOOL)a3
{
  self->_shouldSuppressKeyboard = a3;
}

@end