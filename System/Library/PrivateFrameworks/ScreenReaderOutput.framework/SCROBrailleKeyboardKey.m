@interface SCROBrailleKeyboardKey
+ (BOOL)supportsSecureCoding;
- (NSString)keyString;
- (SCROBrailleKeyboardKey)initWithCoder:(id)a3;
- (id)description;
- (unsigned)keyCode;
- (unsigned)modifiers;
- (unsigned)virtualKeyCode;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyCode:(unsigned int)a3;
- (void)setKeyString:(id)a3;
- (void)setModifiers:(unsigned int)a3;
- (void)setVirtualKeyCode:(unsigned int)a3;
@end

@implementation SCROBrailleKeyboardKey

- (id)description
{
  unsigned int modifiers = self->_modifiers;
  return (id)[NSString stringWithFormat:@"display = %ld, keysting = \"%@\", shift = %d, command = %d, control = %d, option = %d, fn = %d, keycode = %d, virtualKeycode = %d", self->super._displayToken, self->_keyString, (*MEMORY[0x263F2BB08] & modifiers) != 0, (*MEMORY[0x263F2BAE0] & modifiers) != 0, (*MEMORY[0x263F2BAE8] & modifiers) != 0, (*MEMORY[0x263F2BAF8] & modifiers) != 0, (*MEMORY[0x263F2BB00] & modifiers) != 0, self->_keyCode, self->_virtualKeyCode];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROBrailleKeyboardKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCROBrailleKeyboardKey;
  v5 = [(SCROBrailleKey *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyString"];
    keyString = v5->_keyString;
    v5->_keyString = (NSString *)v6;

    v5->_unsigned int modifiers = [v4 decodeInt32ForKey:@"_modifiers"];
    v5->_keyCode = [v4 decodeInt32ForKey:@"_keyCode"];
    v5->_virtualKeyCode = [v4 decodeInt32ForKey:@"_virtualKeyCode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SCROBrailleKeyboardKey;
  [(SCROBrailleKey *)&v6 encodeWithCoder:v4];
  keyString = self->_keyString;
  if (keyString) {
    [v4 encodeObject:keyString forKey:@"_keyString"];
  }
  [v4 encodeInt32:self->_modifiers forKey:@"_modifiers"];
  [v4 encodeInt32:self->_keyCode forKey:@"_keyCode"];
  [v4 encodeInt32:self->_virtualKeyCode forKey:@"_virtualKeyCode"];
}

- (NSString)keyString
{
  return self->_keyString;
}

- (void)setKeyString:(id)a3
{
}

- (unsigned)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(unsigned int)a3
{
  self->_unsigned int modifiers = a3;
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unsigned int)a3
{
  self->_keyCode = a3;
}

- (unsigned)virtualKeyCode
{
  return self->_virtualKeyCode;
}

- (void)setVirtualKeyCode:(unsigned int)a3
{
  self->_virtualKeyCode = a3;
}

- (void).cxx_destruct
{
}

@end