@interface MCKeyboardState
- (BOOL)isFloatingKeyboard;
- (BOOL)isHardwareKeyboard;
- (BOOL)isSplitKeyboard;
- (MCKeyboardState)initWithUserInterfaceIdiom:(int64_t)a3 isSplitKeyboard:(BOOL)a4 isFloatingKeyboard:(BOOL)a5 isHardwareKeyboard:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)userInterfaceIdiom;
@end

@implementation MCKeyboardState

- (BOOL)isHardwareKeyboard
{
  return self->_isHardwareKeyboard;
}

- (BOOL)isFloatingKeyboard
{
  return self->_isFloatingKeyboard;
}

- (BOOL)isSplitKeyboard
{
  return self->_isSplitKeyboard;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"i=%ld, s=%d, f=%d, h=%d", -[MCKeyboardState userInterfaceIdiom](self, "userInterfaceIdiom"), -[MCKeyboardState isSplitKeyboard](self, "isSplitKeyboard"), -[MCKeyboardState isFloatingKeyboard](self, "isFloatingKeyboard"), -[MCKeyboardState isHardwareKeyboard](self, "isHardwareKeyboard")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((void *)result + 2) = self->_userInterfaceIdiom;
    *((unsigned char *)result + 8) = self->_isSplitKeyboard;
    *((unsigned char *)result + 9) = self->_isFloatingKeyboard;
    *((unsigned char *)result + 10) = self->_isHardwareKeyboard;
  }
  return result;
}

- (MCKeyboardState)initWithUserInterfaceIdiom:(int64_t)a3 isSplitKeyboard:(BOOL)a4 isFloatingKeyboard:(BOOL)a5 isHardwareKeyboard:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MCKeyboardState;
  id result = [(MCKeyboardState *)&v11 init];
  if (result)
  {
    result->_userInterfaceIdiom = a3;
    result->_isSplitKeyboard = a4;
    result->_isFloatingKeyboard = a5;
    result->_isHardwareKeyboard = a6;
  }
  return result;
}

@end