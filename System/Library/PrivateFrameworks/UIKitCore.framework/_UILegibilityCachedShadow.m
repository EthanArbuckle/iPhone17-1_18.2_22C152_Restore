@interface _UILegibilityCachedShadow
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesSettings:(id)a3 strength:(double)a4;
- (UIImage)shadow;
- (_UILegibilitySettings)settings;
- (double)strength;
- (void)dealloc;
- (void)setSettings:(id)a3;
- (void)setShadow:(id)a3;
- (void)setStrength:(double)a3;
@end

@implementation _UILegibilityCachedShadow

- (void)dealloc
{
  self->_settings = 0;
  self->_shadow = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityCachedShadow;
  [(_UILegibilityCachedShadow *)&v3 dealloc];
}

- (BOOL)matchesSettings:(id)a3 strength:(double)a4
{
  [(_UILegibilityCachedShadow *)self strength];
  if (vabdd_f64(v7, a4) >= 0.00000011920929) {
    return 0;
  }
  v8 = [(_UILegibilityCachedShadow *)self settings];
  return [(_UILegibilitySettings *)v8 isEqual:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 settings];
  [a3 strength];
  return -[_UILegibilityCachedShadow matchesSettings:strength:](self, "matchesSettings:strength:", v5);
}

- (_UILegibilitySettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (UIImage)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
}

@end