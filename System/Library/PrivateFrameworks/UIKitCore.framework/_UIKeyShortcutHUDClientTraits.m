@interface _UIKeyShortcutHUDClientTraits
+ (BOOL)supportsSecureCoding;
+ (id)traitsWithReferenceTraitEnvironment:(id)a3 referenceKeyboardEvent:(id)a4;
- (BOOL)globeKeyLabelHasGlobeSymbol;
- (BOOL)hasArabicHardwareKeyboard;
- (BOOL)isSystemApp;
- (_UIKeyShortcutHUDClientTraits)initWithCoder:(id)a3;
- (int64_t)layoutDirection;
- (int64_t)userInterfaceStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setGlobeKeyLabelHasGlobeSymbol:(BOOL)a3;
- (void)setHasArabicHardwareKeyboard:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setSystemApp:(BOOL)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation _UIKeyShortcutHUDClientTraits

+ (id)traitsWithReferenceTraitEnvironment:(id)a3 referenceKeyboardEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [v6 traitCollection];
  objc_msgSend(v7, "setLayoutDirection:", objc_msgSend(v8, "layoutDirection"));

  v9 = [v6 traitCollection];

  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
  [v7 setHasArabicHardwareKeyboard:0];
  [v7 setGlobeKeyLabelHasGlobeSymbol:1];
  if (v5)
  {
    if ([v5 _hidEvent])
    {
      [v5 _hidEvent];
      uint64_t SenderID = IOHIDEventGetSenderID();
    }
    else
    {
      uint64_t SenderID = 0;
    }
    v11 = [(id)UIApp getKeyboardDevicePropertiesForSenderID:SenderID shouldUpdate:0];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 language];
      objc_msgSend(v7, "setHasArabicHardwareKeyboard:", objc_msgSend(v13, "isEqualToString:", @"Arabic"));

      objc_msgSend(v7, "setGlobeKeyLabelHasGlobeSymbol:", objc_msgSend(v12, "globeKeyLabelHasGlobeSymbol"));
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t layoutDirection = self->_layoutDirection;
  id v5 = a3;
  [v5 encodeInteger:layoutDirection forKey:@"layoutDirection"];
  [v5 encodeInteger:self->_userInterfaceStyle forKey:@"userInterfaceStyle"];
  [v5 encodeBool:self->_hasArabicHardwareKeyboard forKey:@"hasArabicHardwareKeyboard"];
  [v5 encodeBool:self->_globeKeyLabelHasGlobeSymbol forKey:@"globeKeyLabelHasGlobeSymbol"];
}

- (_UIKeyShortcutHUDClientTraits)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyShortcutHUDClientTraits *)self init];
  if (v5)
  {
    v5->_int64_t layoutDirection = [v4 decodeIntegerForKey:@"layoutDirection"];
    v5->_userInterfaceStyle = [v4 decodeIntegerForKey:@"userInterfaceStyle"];
    v5->_hasArabicHardwareKeyboard = [v4 decodeBoolForKey:@"hasArabicHardwareKeyboard"];
    v5->_globeKeyLabelHasGlobeSymbol = [v4 decodeBoolForKey:@"globeKeyLabelHasGlobeSymbol"];
  }

  return v5;
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_systemApp = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_int64_t layoutDirection = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (BOOL)hasArabicHardwareKeyboard
{
  return self->_hasArabicHardwareKeyboard;
}

- (void)setHasArabicHardwareKeyboard:(BOOL)a3
{
  self->_hasArabicHardwareKeyboard = a3;
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  return self->_globeKeyLabelHasGlobeSymbol;
}

- (void)setGlobeKeyLabelHasGlobeSymbol:(BOOL)a3
{
  self->_globeKeyLabelHasGlobeSymbol = a3;
}

@end