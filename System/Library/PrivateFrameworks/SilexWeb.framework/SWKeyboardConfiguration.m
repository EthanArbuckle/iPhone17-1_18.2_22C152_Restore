@interface SWKeyboardConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isHardwareKeyboard;
- (BOOL)isKeyboardFloating;
- (BOOL)isKeyboardSplit;
- (BOOL)isKeyboardVisible;
- (BOOL)isPencilInputExpected;
- (CGRect)inputAccessoryViewFrame;
- (CGRect)keyboardFrame;
- (SWKeyboardConfiguration)initWithKeyboardFrame:(CGRect)a3 inputAccessoryViewFrame:(CGRect)a4 isKeyboardSplit:(BOOL)a5 isKeyboardFloating:(BOOL)a6 isHardwareKeyboard:(BOOL)a7 isKeyboardVisible:(BOOL)a8 isPencilInputExpected:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setInputAccessoryViewFrame:(CGRect)a3;
- (void)setIsHardwareKeyboard:(BOOL)a3;
- (void)setIsKeyboardFloating:(BOOL)a3;
- (void)setIsKeyboardSplit:(BOOL)a3;
- (void)setIsKeyboardVisible:(BOOL)a3;
- (void)setIsPencilInputExpected:(BOOL)a3;
- (void)setKeyboardFrame:(CGRect)a3;
@end

@implementation SWKeyboardConfiguration

- (SWKeyboardConfiguration)initWithKeyboardFrame:(CGRect)a3 inputAccessoryViewFrame:(CGRect)a4 isKeyboardSplit:(BOOL)a5 isKeyboardFloating:(BOOL)a6 isHardwareKeyboard:(BOOL)a7 isKeyboardVisible:(BOOL)a8 isPencilInputExpected:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v18 = a3.size.height;
  double v19 = a3.size.width;
  double v20 = a3.origin.y;
  double v21 = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)SWKeyboardConfiguration;
  v22 = [(SWKeyboardConfiguration *)&v25 init];
  v23 = v22;
  if (v22)
  {
    -[SWKeyboardConfiguration setKeyboardFrame:](v22, "setKeyboardFrame:", v21, v20, v19, v18);
    -[SWKeyboardConfiguration setInputAccessoryViewFrame:](v23, "setInputAccessoryViewFrame:", x, y, width, height);
    [(SWKeyboardConfiguration *)v23 setIsKeyboardSplit:v13];
    [(SWKeyboardConfiguration *)v23 setIsKeyboardFloating:v12];
    [(SWKeyboardConfiguration *)v23 setIsHardwareKeyboard:v11];
    [(SWKeyboardConfiguration *)v23 setIsKeyboardVisible:v10];
    [(SWKeyboardConfiguration *)v23 setIsPencilInputExpected:v9];
  }
  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SWKeyboardConfiguration alloc];
  BOOL isKeyboardSplit = self->_isKeyboardSplit;
  BOOL isKeyboardFloating = self->_isKeyboardFloating;
  BOOL isHardwareKeyboard = self->_isHardwareKeyboard;
  BOOL isKeyboardVisible = self->_isKeyboardVisible;
  BOOL isPencilInputExpected = self->_isPencilInputExpected;
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  double v14 = self->_inputAccessoryViewFrame.origin.x;
  double v15 = self->_inputAccessoryViewFrame.origin.y;
  double v16 = self->_inputAccessoryViewFrame.size.width;
  double v17 = self->_inputAccessoryViewFrame.size.height;
  return -[SWKeyboardConfiguration initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:isPencilInputExpected:](v4, "initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:isPencilInputExpected:", isKeyboardSplit, isKeyboardFloating, isHardwareKeyboard, isKeyboardVisible, isPencilInputExpected, x, y, width, height, v14, v15, v16, v17);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (!v5) {
      goto LABEL_9;
    }
    [(SWKeyboardConfiguration *)self keyboardFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v5 keyboardFrame];
    v39.origin.double x = v14;
    v39.origin.double y = v15;
    v39.size.double width = v16;
    v39.size.double height = v17;
    v37.origin.double x = v7;
    v37.origin.double y = v9;
    v37.size.double width = v11;
    v37.size.double height = v13;
    if (!CGRectEqualToRect(v37, v39)) {
      goto LABEL_9;
    }
    [(SWKeyboardConfiguration *)self inputAccessoryViewFrame];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    [v5 inputAccessoryViewFrame];
    v40.origin.double x = v26;
    v40.origin.double y = v27;
    v40.size.double width = v28;
    v40.size.double height = v29;
    v38.origin.double x = v19;
    v38.origin.double y = v21;
    v38.size.double width = v23;
    v38.size.double height = v25;
    if (!CGRectEqualToRect(v38, v40)) {
      goto LABEL_9;
    }
    int v30 = [(SWKeyboardConfiguration *)self isKeyboardSplit];
    if (v30 == [v5 isKeyboardSplit]
      && (int v31 = [(SWKeyboardConfiguration *)self isKeyboardFloating],
          v31 == [v5 isKeyboardFloating])
      && (int v32 = [(SWKeyboardConfiguration *)self isHardwareKeyboard],
          v32 == [v5 isHardwareKeyboard])
      && (int v33 = [(SWKeyboardConfiguration *)self isKeyboardVisible],
          v33 == [v5 isKeyboardVisible]))
    {
      BOOL v36 = [(SWKeyboardConfiguration *)self isPencilInputExpected];
      int v34 = v36 ^ [v5 isPencilInputExpected] ^ 1;
    }
    else
    {
LABEL_9:
      LOBYTE(v34) = 0;
    }
  }
  else
  {
    LOBYTE(v34) = 0;
  }

  return v34;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  [(SWKeyboardConfiguration *)self keyboardFrame];
  id v4 = NSStringFromCGRect(v8);
  [v3 appendFormat:@"; keyboardFrame: %@", v4];

  [(SWKeyboardConfiguration *)self inputAccessoryViewFrame];
  id v5 = NSStringFromCGRect(v9);
  [v3 appendFormat:@"; inputAccessoryViewFrame: %@", v5];

  objc_msgSend(v3, "appendFormat:", @"; isKeyboardSplit: %d",
    [(SWKeyboardConfiguration *)self isKeyboardSplit]);
  objc_msgSend(v3, "appendFormat:", @"; isKeyboardFloating: %d",
    [(SWKeyboardConfiguration *)self isKeyboardFloating]);
  objc_msgSend(v3, "appendFormat:", @"; isHardwareKeyboard: %d",
    [(SWKeyboardConfiguration *)self isHardwareKeyboard]);
  objc_msgSend(v3, "appendFormat:", @"; isKeyboardVisible: %d",
    [(SWKeyboardConfiguration *)self isKeyboardVisible]);
  objc_msgSend(v3, "appendFormat:", @"; isPencilInputExpected: %d",
    [(SWKeyboardConfiguration *)self isPencilInputExpected]);
  [v3 appendString:@">"];
  return v3;
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

- (CGRect)inputAccessoryViewFrame
{
  double x = self->_inputAccessoryViewFrame.origin.x;
  double y = self->_inputAccessoryViewFrame.origin.y;
  double width = self->_inputAccessoryViewFrame.size.width;
  double height = self->_inputAccessoryViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputAccessoryViewFrame:(CGRect)a3
{
  self->_inputAccessoryViewFrame = a3;
}

- (BOOL)isKeyboardSplit
{
  return self->_isKeyboardSplit;
}

- (void)setIsKeyboardSplit:(BOOL)a3
{
  self->_BOOL isKeyboardSplit = a3;
}

- (BOOL)isKeyboardFloating
{
  return self->_isKeyboardFloating;
}

- (void)setIsKeyboardFloating:(BOOL)a3
{
  self->_BOOL isKeyboardFloating = a3;
}

- (BOOL)isHardwareKeyboard
{
  return self->_isHardwareKeyboard;
}

- (void)setIsHardwareKeyboard:(BOOL)a3
{
  self->_BOOL isHardwareKeyboard = a3;
}

- (BOOL)isKeyboardVisible
{
  return self->_isKeyboardVisible;
}

- (void)setIsKeyboardVisible:(BOOL)a3
{
  self->_BOOL isKeyboardVisible = a3;
}

- (BOOL)isPencilInputExpected
{
  return self->_isPencilInputExpected;
}

- (void)setIsPencilInputExpected:(BOOL)a3
{
  self->_BOOL isPencilInputExpected = a3;
}

@end