@interface UIKey
- (BOOL)equalsKeyCode:(int64_t)a3 modifiers:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)modifiersEqual:(int64_t)a3;
- (BOOL)unmodifiedKeyCodeEquals:(int64_t)a3;
- (NSString)characters;
- (NSString)charactersIgnoringModifiers;
- (NSString)modifiedInput;
- (NSString)unmodifiedInput;
- (UIKey)initWithCoder:(id)a3;
- (UIKey)initWithKeyboardEvent:(id)a3;
- (UIKeyModifierFlags)modifierFlags;
- (UIKeyboardHIDUsage)keyCode;
- (id)_initWithKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)modiferFlagsWithoutCapsLockOrNumberPad;
- (unint64_t)hash;
- (void)_setKeyCode:(int64_t)a3;
- (void)_setModifiedInput:(id)a3;
- (void)_setModifierFlags:(int64_t)a3;
- (void)_setUnmodifiedInput:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIKey

- (UIKey)initWithKeyboardEvent:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIKey;
  v5 = [(UIKey *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 _unmodifiedInput];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1ED0E84C0;
    }
    objc_storeStrong((id *)&v5->_unmodifiedInput, v8);

    uint64_t v9 = [v4 _modifiedInput];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_1ED0E84C0;
    }
    objc_storeStrong((id *)&v5->_modifiedInput, v11);

    v5->_modifierFlags = [v4 _modifierFlags];
    v5->_keyCode = [v4 _keyCode];
  }

  return v5;
}

- (id)_initWithKey:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKey;
  v5 = [(UIKey *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 unmodifiedInput];
    unmodifiedInput = v5->_unmodifiedInput;
    v5->_unmodifiedInput = (NSString *)v6;

    uint64_t v8 = [v4 modifiedInput];
    modifiedInput = v5->_modifiedInput;
    v5->_modifiedInput = (NSString *)v8;

    v5->_modifierFlags = [v4 modifierFlags];
    v5->_keyCode = [v4 keyCode];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 _initWithKey:self];
}

- (void)encodeWithCoder:(id)a3
{
  modifiedInput = self->_modifiedInput;
  id v5 = a3;
  [v5 encodeObject:modifiedInput forKey:@"_modifiedInput"];
  [v5 encodeObject:self->_unmodifiedInput forKey:@"_unmodifiedInput"];
  [v5 encodeInteger:self->_modifierFlags forKey:@"_modifierFlags"];
  [v5 encodeInteger:self->_keyCode forKey:@"_keyCode"];
}

- (UIKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKey;
  id v5 = [(UIKey *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_modifiedInput"];
    modifiedInput = v5->_modifiedInput;
    v5->_modifiedInput = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"_unmodifiedInput"];
    unmodifiedInput = v5->_unmodifiedInput;
    v5->_unmodifiedInput = (NSString *)v8;

    v5->_modifierFlags = [v4 decodeIntegerForKey:@"_modifierFlags"];
    v5->_keyCode = [v4 decodeIntegerForKey:@"_keyCode"];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_modifierFlags ^ self->_keyCode;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIKey *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(UIKey *)v4 hash];
      BOOL v6 = v5 == [(UIKey *)self hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)characters
{
  return self->_modifiedInput;
}

- (NSString)charactersIgnoringModifiers
{
  return self->_unmodifiedInput;
}

- (id)description
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"characters";
  v3 = [(UIKey *)self characters];
  v11[0] = v3;
  v10[1] = @"unmodified";
  id v4 = [(UIKey *)self charactersIgnoringModifiers];
  v11[1] = v4;
  v10[2] = @"modifierFlags";
  uint64_t v5 = [NSNumber numberWithInteger:self->_modifierFlags];
  v11[2] = v5;
  v10[3] = @"keyCode";
  BOOL v6 = [NSNumber numberWithLong:self->_keyCode];
  v11[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v8 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:v7];

  return v8;
}

- (int64_t)modiferFlagsWithoutCapsLockOrNumberPad
{
  return [(UIKey *)self modifierFlags] & 0xFFFFFFFFFFDEFFFFLL;
}

- (BOOL)modifiersEqual:(int64_t)a3
{
  return [(UIKey *)self modiferFlagsWithoutCapsLockOrNumberPad] == a3;
}

- (BOOL)equalsKeyCode:(int64_t)a3 modifiers:(int64_t)a4
{
  if ([(UIKey *)self keyCode] != a3) {
    return 0;
  }
  return [(UIKey *)self modifiersEqual:a4];
}

- (BOOL)unmodifiedKeyCodeEquals:(int64_t)a3
{
  return [(UIKey *)self equalsKeyCode:a3 modifiers:0];
}

- (UIKeyModifierFlags)modifierFlags
{
  return self->_modifierFlags;
}

- (void)_setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (UIKeyboardHIDUsage)keyCode
{
  return self->_keyCode;
}

- (void)_setKeyCode:(int64_t)a3
{
  self->_keyCode = a3;
}

- (NSString)unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (void)_setUnmodifiedInput:(id)a3
{
}

- (NSString)modifiedInput
{
  return self->_modifiedInput;
}

- (void)_setModifiedInput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedInput, 0);
  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
}

@end