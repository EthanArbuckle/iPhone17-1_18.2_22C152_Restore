@interface _UISheetPresentationControllerClientConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)containsFirstResponder;
- (BOOL)firstResponderRequiresKeyboard;
- (BOOL)isEqual:(id)a3;
- (CGRect)keyboardFrame;
- (NSString)description;
- (_UISheetPresentationControllerClientConfiguration)initWithBSXPCCoder:(id)a3;
- (_UISheetPresentationControllerClientConfiguration)initWithCoder:(id)a3;
- (double)proposedDepthLevel;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContainsFirstResponder:(BOOL)a3;
- (void)setFirstResponderRequiresKeyboard:(BOOL)a3;
- (void)setKeyboardFrame:(CGRect)a3;
- (void)setProposedDepthLevel:(double)a3;
@end

@implementation _UISheetPresentationControllerClientConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(_UISheetPresentationControllerClientConfiguration *)self containsFirstResponder];
    if (v6 != [v5 containsFirstResponder]) {
      goto LABEL_7;
    }
    int v7 = [(_UISheetPresentationControllerClientConfiguration *)self firstResponderRequiresKeyboard];
    if (v7 != [v5 firstResponderRequiresKeyboard]) {
      goto LABEL_7;
    }
    [(_UISheetPresentationControllerClientConfiguration *)self keyboardFrame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v5 keyboardFrame];
    v26.origin.x = v16;
    v26.origin.y = v17;
    v26.size.width = v18;
    v26.size.height = v19;
    v25.origin.x = v9;
    v25.origin.y = v11;
    v25.size.width = v13;
    v25.size.height = v15;
    if (CGRectEqualToRect(v25, v26))
    {
      [(_UISheetPresentationControllerClientConfiguration *)self proposedDepthLevel];
      double v21 = v20;
      [v5 proposedDepthLevel];
      BOOL v23 = v21 == v22;
    }
    else
    {
LABEL_7:
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (NSString)description
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = NSStringFromSelector(sel_containsFirstResponder);
  v11[0] = v4;
  id v5 = NSStringFromSelector(sel_firstResponderRequiresKeyboard);
  v11[1] = v5;
  int v6 = NSStringFromSelector(sel_keyboardFrame);
  v11[2] = v6;
  int v7 = NSStringFromSelector(sel_proposedDepthLevel);
  v11[3] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  CGFloat v9 = +[UIDescriptionBuilder descriptionForObject:self keys:v8];

  return (NSString *)v9;
}

- (_UISheetPresentationControllerClientConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerClientConfiguration;
  id v5 = [(_UISheetPresentationControllerClientConfiguration *)&v11 init];
  if (v5)
  {
    -[_UISheetPresentationControllerClientConfiguration setContainsFirstResponder:](v5, "setContainsFirstResponder:", [v4 decodeBoolForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder"]);
    -[_UISheetPresentationControllerClientConfiguration setFirstResponderRequiresKeyboard:](v5, "setFirstResponderRequiresKeyboard:", [v4 decodeBoolForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard"]);
    if ([v4 containsValueForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"])
    {
      [v4 decodeCGRectForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"];
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB20];
      double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    -[_UISheetPresentationControllerClientConfiguration setKeyboardFrame:](v5, "setKeyboardFrame:", v6, v7, v8, v9);
    [v4 decodeDoubleForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel"];
    -[_UISheetPresentationControllerClientConfiguration setProposedDepthLevel:](v5, "setProposedDepthLevel:");
  }

  return v5;
}

- (_UISheetPresentationControllerClientConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerClientConfiguration;
  id v5 = [(_UISheetPresentationControllerClientConfiguration *)&v11 init];
  if (v5)
  {
    -[_UISheetPresentationControllerClientConfiguration setContainsFirstResponder:](v5, "setContainsFirstResponder:", [v4 decodeBoolForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder"]);
    -[_UISheetPresentationControllerClientConfiguration setFirstResponderRequiresKeyboard:](v5, "setFirstResponderRequiresKeyboard:", [v4 decodeBoolForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard"]);
    if ([v4 containsValueForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"])
    {
      [v4 decodeCGRectForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"];
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB20];
      double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    -[_UISheetPresentationControllerClientConfiguration setKeyboardFrame:](v5, "setKeyboardFrame:", v6, v7, v8, v9);
    [v4 decodeDoubleForKey:@"_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel"];
    -[_UISheetPresentationControllerClientConfiguration setProposedDepthLevel:](v5, "setProposedDepthLevel:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration containsFirstResponder](self, "containsFirstResponder"), @"_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder");
  objc_msgSend(v5, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration firstResponderRequiresKeyboard](self, "firstResponderRequiresKeyboard"), @"_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard");
  [(_UISheetPresentationControllerClientConfiguration *)self keyboardFrame];
  if (!CGRectIsNull(v7))
  {
    [(_UISheetPresentationControllerClientConfiguration *)self keyboardFrame];
    objc_msgSend(v5, "encodeCGRect:forKey:", @"_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame");
  }
  [(_UISheetPresentationControllerClientConfiguration *)self proposedDepthLevel];
  *(float *)&double v4 = v4;
  [v5 encodeFloat:@"_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel" forKey:v4];
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration containsFirstResponder](self, "containsFirstResponder"), @"_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration firstResponderRequiresKeyboard](self, "firstResponderRequiresKeyboard"), @"_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard");
  [(_UISheetPresentationControllerClientConfiguration *)self keyboardFrame];
  if (!CGRectIsNull(v6))
  {
    [(_UISheetPresentationControllerClientConfiguration *)self keyboardFrame];
    objc_msgSend(v4, "encodeCGRect:forKey:", @"_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame");
  }
  [(_UISheetPresentationControllerClientConfiguration *)self proposedDepthLevel];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)containsFirstResponder
{
  return self->_containsFirstResponder;
}

- (void)setContainsFirstResponder:(BOOL)a3
{
  self->_containsFirstResponder = a3;
}

- (BOOL)firstResponderRequiresKeyboard
{
  return self->_firstResponderRequiresKeyboard;
}

- (void)setFirstResponderRequiresKeyboard:(BOOL)a3
{
  self->_firstResponderRequiresKeyboard = a3;
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (double)proposedDepthLevel
{
  return self->_proposedDepthLevel;
}

- (void)setProposedDepthLevel:(double)a3
{
  self->_proposedDepthLevel = a3;
}

@end