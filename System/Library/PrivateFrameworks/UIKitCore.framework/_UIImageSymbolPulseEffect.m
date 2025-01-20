@interface _UIImageSymbolPulseEffect
+ (BOOL)supportsSecureCoding;
+ (id)effect;
- (BOOL)_isValidAnimationPreset;
- (BOOL)byLayer;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolEffectRepeatBehavior)repeatBehavior;
- (_UIImageSymbolPulseEffect)initWithCoder:(id)a3;
- (id)_nsSymbolEffectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setByLayer:(BOOL)a3;
- (void)setRepeatBehavior:(id)a3;
@end

@implementation _UIImageSymbolPulseEffect

+ (id)effect
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____UIImageSymbolPulseEffect;
  uint64_t v2 = objc_msgSendSuper2(&v6, sel_effect);
  *(unsigned char *)(v2 + 16) = 1;
  uint64_t v3 = +[_UIImageSymbolEffectRepeatBehavior defaultRepeatBehavior];
  v4 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v3;

  return (id)v2;
}

- (id)_nsSymbolEffectRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F41A58] effect];
  if ([(_UIImageSymbolPulseEffect *)self byLayer]) {
    [v3 effectWithByLayer];
  }
  else {
  v4 = [v3 effectWithWholeSymbol];
  }

  return v4;
}

- (BOOL)_isValidAnimationPreset
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolPulseEffect;
  BOOL v5 = [(_UIImageSymbolEffect *)&v7 isEqual:v4]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16)
    && [(_UIImageSymbolEffectRepeatBehavior *)self->_repeatBehavior isEqual:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolPulseEffect;
  unint64_t v3 = [(_UIImageSymbolEffect *)&v5 hash];
  return [(_UIImageSymbolEffectRepeatBehavior *)self->_repeatBehavior hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIImageSymbolPulseEffect;
  id v4 = [(_UIImageSymbolEffect *)&v6 copyWithZone:a3];
  *((unsigned char *)v4 + 16) = self->_byLayer;
  objc_storeStrong((id *)v4 + 3, self->_repeatBehavior);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL byLayer = self->_byLayer;
  id v5 = a3;
  [v5 encodeBool:byLayer forKey:@"byLayer"];
  [v5 encodeObject:self->_repeatBehavior forKey:@"repeatBehavior"];
}

- (_UIImageSymbolPulseEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() effect];

  if (v5)
  {
    v5->_BOOL byLayer = [v4 decodeBoolForKey:@"byLayer"];
    objc_super v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"repeatBehavior"];
    repeatBehavior = v5->_repeatBehavior;
    v5->_repeatBehavior = (_UIImageSymbolEffectRepeatBehavior *)v7;
  }
  return v5;
}

- (BOOL)byLayer
{
  return self->_byLayer;
}

- (void)setByLayer:(BOOL)a3
{
  self->_BOOL byLayer = a3;
}

- (_UIImageSymbolEffectRepeatBehavior)repeatBehavior
{
  return self->_repeatBehavior;
}

- (void)setRepeatBehavior:(id)a3
{
}

- (void).cxx_destruct
{
}

@end