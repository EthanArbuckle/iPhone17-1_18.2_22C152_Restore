@interface _UIImageSymbolBounceEffect
+ (BOOL)supportsSecureCoding;
+ (id)effect;
- (BOOL)_isValidAnimationPreset;
- (BOOL)byLayer;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolBounceEffect)initWithCoder:(id)a3;
- (_UIImageSymbolEffectRepeatBehavior)repeatBehavior;
- (id)_nsSymbolEffectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bounceDirection;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBounceDirection:(int64_t)a3;
- (void)setByLayer:(BOOL)a3;
- (void)setRepeatBehavior:(id)a3;
@end

@implementation _UIImageSymbolBounceEffect

+ (id)effect
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____UIImageSymbolBounceEffect;
  uint64_t v2 = objc_msgSendSuper2(&v6, sel_effect);
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  uint64_t v3 = +[_UIImageSymbolEffectRepeatBehavior defaultRepeatBehavior];
  v4 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = v3;

  return (id)v2;
}

- (BOOL)_isValidAnimationPreset
{
  return 1;
}

- (id)_nsSymbolEffectRepresentation
{
  int64_t bounceDirection = self->_bounceDirection;
  if (bounceDirection == 2)
  {
    uint64_t v4 = [MEMORY[0x1E4F41A30] bounceDownEffect];
  }
  else
  {
    if (bounceDirection == 1) {
      [MEMORY[0x1E4F41A30] bounceUpEffect];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4F41A30] effect];
    }
  }
  v5 = (void *)v4;
  if ([(_UIImageSymbolBounceEffect *)self byLayer]) {
    [v5 effectWithByLayer];
  }
  else {
  objc_super v6 = [v5 effectWithWholeSymbol];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolBounceEffect;
  BOOL v5 = [(_UIImageSymbolEffect *)&v7 isEqual:v4]
    && self->_bounceDirection == v4[3]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16)
    && [(_UIImageSymbolEffectRepeatBehavior *)self->_repeatBehavior isEqual:v4[4]];

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolBounceEffect;
  unint64_t v3 = self->_bounceDirection ^ [(_UIImageSymbolEffect *)&v5 hash];
  return v3 ^ [(_UIImageSymbolEffectRepeatBehavior *)self->_repeatBehavior hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIImageSymbolBounceEffect;
  id v4 = [(_UIImageSymbolEffect *)&v6 copyWithZone:a3];
  *((void *)v4 + 3) = self->_bounceDirection;
  *((unsigned char *)v4 + 16) = self->_byLayer;
  objc_storeStrong((id *)v4 + 4, self->_repeatBehavior);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t bounceDirection = self->_bounceDirection;
  id v5 = a3;
  [v5 encodeInteger:bounceDirection forKey:@"bounceDirection"];
  [v5 encodeBool:self->_byLayer forKey:@"byLayer"];
  [v5 encodeObject:self->_repeatBehavior forKey:@"repeatBehavior"];
}

- (_UIImageSymbolBounceEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() effect];

  if (v5)
  {
    v5->_int64_t bounceDirection = [v4 decodeIntegerForKey:@"bounceDirection"];
    v5->_byLayer = [v4 decodeBoolForKey:@"byLayer"];
    objc_super v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"repeatBehavior"];
    repeatBehavior = v5->_repeatBehavior;
    v5->_repeatBehavior = (_UIImageSymbolEffectRepeatBehavior *)v7;
  }
  return v5;
}

- (int64_t)bounceDirection
{
  return self->_bounceDirection;
}

- (void)setBounceDirection:(int64_t)a3
{
  self->_int64_t bounceDirection = a3;
}

- (BOOL)byLayer
{
  return self->_byLayer;
}

- (void)setByLayer:(BOOL)a3
{
  self->_byLayer = a3;
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