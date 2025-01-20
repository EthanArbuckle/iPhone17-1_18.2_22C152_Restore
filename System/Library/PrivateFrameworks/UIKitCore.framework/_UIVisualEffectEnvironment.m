@interface _UIVisualEffectEnvironment
- (BOOL)allowsBlurring;
- (BOOL)allowsDithering;
- (BOOL)reducedMotion;
- (BOOL)reducedTransperancy;
- (BOOL)useSimpleVibrancy;
- (UITraitCollection)traitCollection;
- (UIVisualEffectView)effectView;
- (_UIVisualEffectEnvironment)initWithHost:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)blurQuality;
- (void)_applyBlurQualityToConfigurationDictionary:(id)a3;
- (void)setAllowsBlurring:(BOOL)a3;
- (void)setAllowsDithering:(BOOL)a3;
- (void)setBlurQuality:(int64_t)a3;
- (void)setReducedMotion:(BOOL)a3;
- (void)setReducedTransperancy:(BOOL)a3;
- (void)setTraitCollection:(id)a3;
- (void)setUseSimpleVibrancy:(BOOL)a3;
@end

@implementation _UIVisualEffectEnvironment

- (void).cxx_destruct
{
}

- (BOOL)allowsBlurring
{
  return [(_UIVisualEffectEnvironment *)self blurQuality] != -1;
}

- (BOOL)reducedTransperancy
{
  return self->_reducedTransperancy;
}

- (int64_t)blurQuality
{
  return self->_blurQuality;
}

- (BOOL)allowsDithering
{
  return self->_allowsDithering;
}

- (void)_applyBlurQualityToConfigurationDictionary:(id)a3
{
  id v4 = a3;
  v5 = @"low";
  id v7 = v4;
  switch(self->_blurQuality)
  {
    case 0:
      BOOL v6 = [(UITraitCollection *)self->_traitCollection userInterfaceIdiom] == UIUserInterfaceIdiomCarPlay;
      id v4 = v7;
      if (v6) {
        goto LABEL_4;
      }
      break;
    case 1:
      goto LABEL_6;
    case 2:
LABEL_4:
      v5 = @"medium";
      goto LABEL_6;
    case 3:
      v5 = @"high";
LABEL_6:
      [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3A1A8]];
      id v4 = v7;
      break;
    default:
      break;
  }
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v4[2] = self->_effectView;
  [v4 setAllowsDithering:self->_allowsDithering];
  [v4 setBlurQuality:self->_blurQuality];
  [v4 setUseSimpleVibrancy:self->_useSimpleVibrancy];
  [v4 setReducedTransperancy:self->_reducedTransperancy];
  [v4 setReducedMotion:self->_reducedMotion];
  v5 = (void *)[(UITraitCollection *)self->_traitCollection copy];
  [v4 setTraitCollection:v5];

  return v4;
}

- (void)setReducedTransperancy:(BOOL)a3
{
  self->_reducedTransperancy = a3;
}

- (void)setTraitCollection:(id)a3
{
}

- (void)setBlurQuality:(int64_t)a3
{
  self->_blurQuality = a3;
}

- (void)setAllowsDithering:(BOOL)a3
{
  self->_allowsDithering = a3;
}

- (void)setUseSimpleVibrancy:(BOOL)a3
{
  self->_useSimpleVibrancy = a3;
}

- (void)setReducedMotion:(BOOL)a3
{
  self->_reducedMotion = a3;
}

- (_UIVisualEffectEnvironment)initWithHost:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIVisualEffectEnvironment;
  result = [(_UIVisualEffectEnvironment *)&v5 init];
  if (result) {
    result->_effectView = (UIVisualEffectView *)a3;
  }
  return result;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)_UIVisualEffectEnvironment;
  v3 = [(_UIVisualEffectEnvironment *)&v11 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @" host=%p", self->_effectView);
  unint64_t v5 = self->_blurQuality + 1;
  if (v5 > 4) {
    BOOL v6 = @"default";
  }
  else {
    BOOL v6 = off_1E52DD788[v5];
  }
  [v4 appendFormat:@" traitCollection=%p blurQuality=%@", self->_traitCollection, v6];
  id v7 = "";
  if (self->_useSimpleVibrancy) {
    v8 = " useSimpleVibrancy";
  }
  else {
    v8 = "";
  }
  if (self->_reducedTransperancy) {
    v9 = " reducedTransperancy";
  }
  else {
    v9 = "";
  }
  if (self->_reducedMotion) {
    id v7 = " reducedMotion";
  }
  objc_msgSend(v4, "appendFormat:", @" %s%s%s", v8, v9, v7);
  return v4;
}

- (void)setAllowsBlurring:(BOOL)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (BOOL)useSimpleVibrancy
{
  return self->_useSimpleVibrancy;
}

- (BOOL)reducedMotion
{
  return self->_reducedMotion;
}

@end