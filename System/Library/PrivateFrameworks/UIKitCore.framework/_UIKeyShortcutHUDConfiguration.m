@interface _UIKeyShortcutHUDConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isSearching;
- (_UIKeyShortcutHUDClientTraits)clientTraits;
- (_UIKeyShortcutHUDConfiguration)initWithCoder:(id)a3;
- (_UIKeyShortcutHUDModel)model;
- (int64_t)initialHeldModifierFlags;
- (int64_t)presentedModifierFlag;
- (void)encodeWithCoder:(id)a3;
- (void)setClientTraits:(id)a3;
- (void)setInitialHeldModifierFlags:(int64_t)a3;
- (void)setModel:(id)a3;
- (void)setPresentedModifierFlag:(int64_t)a3;
- (void)setSearching:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  model = self->_model;
  id v5 = a3;
  [v5 encodeObject:model forKey:@"model"];
  [v5 encodeBool:self->_searching forKey:@"searching"];
  [v5 encodeInteger:self->_presentedModifierFlag forKey:@"presentedModifierFlag"];
  [v5 encodeInteger:self->_initialHeldModifierFlags forKey:@"initialHeldModifierFlag"];
  [v5 encodeObject:self->_clientTraits forKey:@"clientTraits"];
}

- (_UIKeyShortcutHUDConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyShortcutHUDConfiguration *)self init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"model"];
    model = v5->_model;
    v5->_model = (_UIKeyShortcutHUDModel *)v7;

    v5->_searching = [v4 decodeBoolForKey:@"searching"];
    v5->_presentedModifierFlag = [v4 decodeIntegerForKey:@"presentedModifierFlag"];
    v5->_initialHeldModifierFlags = [v4 decodeIntegerForKey:@"initialHeldModifierFlag"];
    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"clientTraits"];
    clientTraits = v5->_clientTraits;
    v5->_clientTraits = (_UIKeyShortcutHUDClientTraits *)v10;
  }
  return v5;
}

- (_UIKeyShortcutHUDModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (void)setSearching:(BOOL)a3
{
  self->_searching = a3;
}

- (int64_t)presentedModifierFlag
{
  return self->_presentedModifierFlag;
}

- (void)setPresentedModifierFlag:(int64_t)a3
{
  self->_presentedModifierFlag = a3;
}

- (int64_t)initialHeldModifierFlags
{
  return self->_initialHeldModifierFlags;
}

- (void)setInitialHeldModifierFlags:(int64_t)a3
{
  self->_initialHeldModifierFlags = a3;
}

- (_UIKeyShortcutHUDClientTraits)clientTraits
{
  return self->_clientTraits;
}

- (void)setClientTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTraits, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end