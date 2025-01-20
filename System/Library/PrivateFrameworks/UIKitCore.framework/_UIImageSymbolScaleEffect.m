@interface _UIImageSymbolScaleEffect
+ (BOOL)supportsSecureCoding;
+ (id)effect;
+ (id)effectWithScale:(int64_t)a3;
+ (id)scaleDefaultEffect;
+ (id)scaleDownEffect;
+ (id)scaleUpEffect;
- (BOOL)_isValidAnimationPreset;
- (BOOL)byLayer;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolScaleEffect)initWithCoder:(id)a3;
- (id)_nsSymbolEffectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_desiredScale;
- (int64_t)_stateUpdateType;
- (int64_t)scale;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setByLayer:(BOOL)a3;
- (void)setScale:(int64_t)a3;
@end

@implementation _UIImageSymbolScaleEffect

+ (id)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIImageSymbolScaleEffect;
  uint64_t v2 = objc_msgSendSuper2(&v4, sel_effect);
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  return (id)v2;
}

+ (id)effectWithScale:(int64_t)a3
{
  id result = (id)[a1 effect];
  *((void *)result + 3) = a3;
  return result;
}

+ (id)scaleUpEffect
{
  return (id)[a1 effectWithScale:2];
}

+ (id)scaleDownEffect
{
  return (id)[a1 effectWithScale:3];
}

+ (id)scaleDefaultEffect
{
  return (id)[a1 effectWithScale:1];
}

- (BOOL)_isValidAnimationPreset
{
  if ((unint64_t)(self->_scale - 1) < 3) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolScaleEffect;
  return [(_UIImageSymbolEffect *)&v3 _isValidAnimationPreset];
}

- (int64_t)_stateUpdateType
{
  if ([(_UIImageSymbolScaleEffect *)self _isValidAnimationPreset]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolScaleEffect;
  return [(_UIImageSymbolEffect *)&v4 _stateUpdateType];
}

- (int64_t)_desiredScale
{
  if ([(_UIImageSymbolScaleEffect *)self _isValidAnimationPreset]) {
    return self->_scale;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolScaleEffect;
  return [(_UIImageSymbolEffect *)&v4 _desiredScale];
}

- (id)_nsSymbolEffectRepresentation
{
  if (self->_scale == 3) {
    [MEMORY[0x1E4F41A68] scaleDownEffect];
  }
  else {
  objc_super v3 = [MEMORY[0x1E4F41A68] scaleUpEffect];
  }
  if ([(_UIImageSymbolScaleEffect *)self byLayer]) {
    [v3 effectWithByLayer];
  }
  else {
  objc_super v4 = [v3 effectWithWholeSymbol];
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolScaleEffect;
  BOOL v5 = [(_UIImageSymbolEffect *)&v7 isEqual:v4]
    && self->_scale == v4[3]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolScaleEffect;
  return self->_scale ^ [(_UIImageSymbolEffect *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolScaleEffect;
  id result = [(_UIImageSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 3) = self->_scale;
  *((unsigned char *)result + 16) = self->_byLayer;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t scale = self->_scale;
  id v5 = a3;
  [v5 encodeInteger:scale forKey:@"scale"];
  [v5 encodeBool:self->_byLayer forKey:@"byLayer"];
}

- (_UIImageSymbolScaleEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() effect];

  if (v5)
  {
    v5->_int64_t scale = [v4 decodeIntegerForKey:@"scale"];
    v5->_byLayer = [v4 decodeBoolForKey:@"byLayer"];
  }

  return v5;
}

- (int64_t)scale
{
  return self->_scale;
}

- (void)setScale:(int64_t)a3
{
  self->_int64_t scale = a3;
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