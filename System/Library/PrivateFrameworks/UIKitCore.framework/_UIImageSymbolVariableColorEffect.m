@interface _UIImageSymbolVariableColorEffect
+ (BOOL)supportsSecureCoding;
+ (id)effect;
- (BOOL)_isValidAnimationPreset;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolEffectRepeatBehavior)repeatBehavior;
- (_UIImageSymbolVariableColorEffect)initWithCoder:(id)a3;
- (id)_nsSymbolEffectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)styleOptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRepeatBehavior:(id)a3;
- (void)setStyleOptions:(int64_t)a3;
@end

@implementation _UIImageSymbolVariableColorEffect

+ (id)effect
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____UIImageSymbolVariableColorEffect;
  v2 = objc_msgSendSuper2(&v6, sel_effect);
  v2[2] = 0;
  uint64_t v3 = +[_UIImageSymbolEffectRepeatBehavior defaultRepeatBehavior];
  v4 = (void *)v2[3];
  v2[3] = v3;

  return v2;
}

- (BOOL)_isValidAnimationPreset
{
  return 1;
}

- (id)_nsSymbolEffectRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F41A70] effect];
  v4 = v3;
  int64_t styleOptions = self->_styleOptions;
  if (styleOptions)
  {
    uint64_t v8 = [v3 effectWithIterative];

    int64_t styleOptions = self->_styleOptions;
    v4 = (void *)v8;
    if ((styleOptions & 2) == 0)
    {
LABEL_3:
      if ((styleOptions & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((styleOptions & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = [v4 effectWithHideInactiveLayers];

  v4 = (void *)v9;
  if ((self->_styleOptions & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = [v4 effectWithReversing];

    v4 = (void *)v6;
  }
LABEL_5:
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolVariableColorEffect;
  BOOL v5 = [(_UIImageSymbolEffect *)&v7 isEqual:v4]
    && self->_styleOptions == v4[2]
    && [(_UIImageSymbolEffectRepeatBehavior *)self->_repeatBehavior isEqual:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolVariableColorEffect;
  unint64_t v3 = self->_styleOptions ^ [(_UIImageSymbolEffect *)&v5 hash];
  return v3 ^ [(_UIImageSymbolEffectRepeatBehavior *)self->_repeatBehavior hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIImageSymbolVariableColorEffect;
  id v4 = [(_UIImageSymbolEffect *)&v6 copyWithZone:a3];
  *((void *)v4 + 2) = self->_styleOptions;
  objc_storeStrong((id *)v4 + 3, self->_repeatBehavior);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t styleOptions = self->_styleOptions;
  id v5 = a3;
  [v5 encodeInteger:styleOptions forKey:@"styleOptions"];
  [v5 encodeObject:self->_repeatBehavior forKey:@"repeatBehavior"];
}

- (_UIImageSymbolVariableColorEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() effect];

  if (v5)
  {
    v5->_int64_t styleOptions = [v4 decodeIntegerForKey:@"styleOptions"];
    objc_super v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"repeatBehavior"];
    repeatBehavior = v5->_repeatBehavior;
    v5->_repeatBehavior = (_UIImageSymbolEffectRepeatBehavior *)v7;
  }
  return v5;
}

- (int64_t)styleOptions
{
  return self->_styleOptions;
}

- (void)setStyleOptions:(int64_t)a3
{
  self->_int64_t styleOptions = a3;
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