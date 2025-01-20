@interface _UITintColorViewEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UIColor)tintColor;
- (id)description;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation _UITintColorViewEntry

- (void)setTintColor:(id)a3
{
}

- (void)applyRequestedEffectToView:(id)a3
{
}

- (void)removeEffectFromView:(id)a3
{
}

- (void)applyIdentityEffectToView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UITintColorViewEntry *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(_UITintColorViewEntry *)self tintColor];
      v7 = [(_UITintColorViewEntry *)v5 tintColor];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UITintColorViewEntry;
  v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" tintColor=%@", self->_tintColor];

  return v4;
}

@end