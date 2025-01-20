@interface BKCapturedCoverEffectsEnvironment
+ (id)newCapturedEnvironment:(id)a3;
+ (id)newCapturedEnvironmentWithNightMode:(BOOL)a3 rtlOverride:(id)a4;
- (BOOL)coverEffectsNightMode;
- (NSNumber)coverEffectRTLOverride;
- (unint64_t)coverEffectsContent;
- (void)setCoverEffectRTLOverride:(id)a3;
- (void)setCoverEffectsContent:(unint64_t)a3;
- (void)setCoverEffectsNightMode:(BOOL)a3;
@end

@implementation BKCapturedCoverEffectsEnvironment

+ (id)newCapturedEnvironment:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = objc_alloc_init(BKCapturedCoverEffectsEnvironment);
  -[BKCapturedCoverEffectsEnvironment setCoverEffectsContent:](v4, "setCoverEffectsContent:", [v3 coverEffectsContent]);
  -[BKCapturedCoverEffectsEnvironment setCoverEffectsNightMode:](v4, "setCoverEffectsNightMode:", [v3 coverEffectsNightMode]);
  v5 = [v3 coverEffectRTLOverride];

  [(BKCapturedCoverEffectsEnvironment *)v4 setCoverEffectRTLOverride:v5];
  return v4;
}

+ (id)newCapturedEnvironmentWithNightMode:(BOOL)a3 rtlOverride:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = objc_alloc_init(BKCapturedCoverEffectsEnvironment);
  [(BKCapturedCoverEffectsEnvironment *)v6 setCoverEffectsNightMode:v4];
  [(BKCapturedCoverEffectsEnvironment *)v6 setCoverEffectRTLOverride:v5];

  return v6;
}

- (unint64_t)coverEffectsContent
{
  return self->_coverEffectsContent;
}

- (void)setCoverEffectsContent:(unint64_t)a3
{
  self->_coverEffectsContent = a3;
}

- (BOOL)coverEffectsNightMode
{
  return self->_coverEffectsNightMode;
}

- (void)setCoverEffectsNightMode:(BOOL)a3
{
  self->_coverEffectsNightMode = a3;
}

- (NSNumber)coverEffectRTLOverride
{
  return self->_coverEffectRTLOverride;
}

- (void)setCoverEffectRTLOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end