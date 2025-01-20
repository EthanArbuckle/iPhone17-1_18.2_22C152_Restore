@interface _UIImageSymbolVisibilityEffect
+ (BOOL)supportsSecureCoding;
+ (id)appearEffect;
+ (id)disappearEffect;
+ (id)effect;
+ (id)effectWithVisibility:(int64_t)a3;
- (BOOL)_isValidAnimationPreset;
- (BOOL)byLayer;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolVisibilityEffect)initWithCoder:(id)a3;
- (id)_nsSymbolEffectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_desiredVisibility;
- (int64_t)_stateUpdateType;
- (int64_t)style;
- (int64_t)visibility;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setByLayer:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation _UIImageSymbolVisibilityEffect

+ (id)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIImageSymbolVisibilityEffect;
  uint64_t v2 = objc_msgSendSuper2(&v4, sel_effect);
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  return (id)v2;
}

+ (id)effectWithVisibility:(int64_t)a3
{
  id result = (id)[a1 effect];
  *((void *)result + 3) = a3;
  return result;
}

+ (id)appearEffect
{
  return (id)[a1 effectWithVisibility:1];
}

+ (id)disappearEffect
{
  return (id)[a1 effectWithVisibility:2];
}

- (BOOL)_isValidAnimationPreset
{
  if ((unint64_t)(self->_visibility - 1) < 2) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return [(_UIImageSymbolEffect *)&v3 _isValidAnimationPreset];
}

- (int64_t)_stateUpdateType
{
  if ([(_UIImageSymbolVisibilityEffect *)self _isValidAnimationPreset]) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return [(_UIImageSymbolEffect *)&v4 _stateUpdateType];
}

- (int64_t)_desiredVisibility
{
  if ([(_UIImageSymbolVisibilityEffect *)self _isValidAnimationPreset]) {
    return self->_visibility;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return [(_UIImageSymbolEffect *)&v4 _desiredVisibility];
}

- (id)_nsSymbolEffectRepresentation
{
  if (self->_visibility == 2)
  {
    if (self->_style == 2) {
      [MEMORY[0x1E4F41A40] disappearUpEffect];
    }
    else {
    objc_super v4 = [MEMORY[0x1E4F41A40] disappearDownEffect];
    }
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4F41A20] effect];
    if (self->_style == 2) {
      [MEMORY[0x1E4F41A20] appearDownEffect];
    }
    else {
    objc_super v4 = [MEMORY[0x1E4F41A20] appearUpEffect];
    }
  }
  if ([(_UIImageSymbolVisibilityEffect *)self byLayer]) {
    [v4 effectWithByLayer];
  }
  else {
  v5 = [v4 effectWithWholeSymbol];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolVisibilityEffect;
  BOOL v5 = [(_UIImageSymbolEffect *)&v7 isEqual:v4]
    && self->_visibility == v4[3]
    && self->_style == v4[4]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return self->_visibility ^ [(_UIImageSymbolEffect *)&v3 hash] ^ self->_style;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolVisibilityEffect;
  id result = [(_UIImageSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 3) = self->_visibility;
  *((void *)result + 4) = self->_style;
  *((unsigned char *)result + 16) = self->_byLayer;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t visibility = self->_visibility;
  id v5 = a3;
  [v5 encodeInteger:visibility forKey:@"visibility"];
  [v5 encodeInteger:self->_style forKey:@"style"];
  [v5 encodeBool:self->_byLayer forKey:@"byLayer"];
}

- (_UIImageSymbolVisibilityEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() effect];

  if (v5)
  {
    v5->_int64_t visibility = [v4 decodeIntegerForKey:@"visibility"];
    v5->_style = [v4 decodeIntegerForKey:@"style"];
    v5->_byLayer = [v4 decodeBoolForKey:@"byLayer"];
  }

  return v5;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_int64_t visibility = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)byLayer
{
  return self->_byLayer;
}

- (void)setByLayer:(BOOL)a3
{
  self->_byLayer = a3;
}

@end