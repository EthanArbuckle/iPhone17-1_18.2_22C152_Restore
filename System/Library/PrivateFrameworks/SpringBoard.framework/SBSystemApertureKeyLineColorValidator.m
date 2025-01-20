@interface SBSystemApertureKeyLineColorValidator
- (SBSystemApertureKeyLineColorValidator)init;
- (id)validateKeyLineColor:(id)a3;
- (void)_applySettingsValues;
- (void)dealloc;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBSystemApertureKeyLineColorValidator

- (SBSystemApertureKeyLineColorValidator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureKeyLineColorValidator;
  v2 = [(SBSystemApertureKeyLineColorValidator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SBSystemApertureDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBSystemApertureSettings *)v3;

    [(PTSettings *)v2->_settings addKeyObserver:v2];
    [(SBSystemApertureKeyLineColorValidator *)v2 _applySettingsValues];
    v2->_labColorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC08]);
    v2->_colorTransformToLAB = (CGColorTransform *)MEMORY[0x1D9488E80]();
    v2->_rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    v2->_colorTransformToRGB = (CGColorTransform *)MEMORY[0x1D9488E80]();
  }
  return v2;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_labColorSpace);
  CGColorTransformRelease();
  CGColorSpaceRelease(self->_rgbColorSpace);
  CGColorTransformRelease();
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureKeyLineColorValidator;
  [(SBSystemApertureKeyLineColorValidator *)&v3 dealloc];
}

- (id)validateKeyLineColor:(id)a3
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F428B8] colorWithWhite:0.916 alpha:1.0];
  if (v4)
  {
    objc_super v6 = [MEMORY[0x1E4F428B8] clearColor];
    if ([v4 isEqual:v6])
    {
    }
    else
    {
      BOOL v7 = [(SBSystemApertureSettings *)self->_settings activityKeyLineColorEnabled];

      if (v7)
      {
        v8 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
        v9 = [v4 resolvedColorWithTraitCollection:v8];

        id v10 = [v9 colorWithAlphaComponent:1.0];
        [v10 CGColor];
        v11 = (CGColor *)CGColorTransformConvertColor();
        v12 = (uint64_t *)CGColorGetComponents(v11);
        if (CGColorGetNumberOfComponents(v11) != 4) {
          goto LABEL_17;
        }
        uint64_t v13 = 0;
        char v14 = 0;
        do
        {
          if (v13 * 8)
          {
            *(void *)&components[v13] = v12[v13];
          }
          else
          {
            if (BSFloatEqualToFloat()) {
              goto LABEL_12;
            }
            *(void *)&components[0] = SBSystemApertureKeyLineFixedLstar;
            char v14 = 1;
          }
          ++v13;
        }
        while (v13 != 4);
        if ((v14 & 1) == 0) {
          goto LABEL_17;
        }
LABEL_12:
        v15 = CGColorCreate(self->_labColorSpace, components);
        v16 = (CGColor *)CGColorTransformConvertColor();
        CGColorRelease(v15);
        v17 = SBLogSystemApertureController();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          [(SBSystemApertureKeyLineColorValidator *)v12 validateKeyLineColor:v17];
        }

        if (v16)
        {
          id v18 = [MEMORY[0x1E4F428B8] colorWithCGColor:v16];
        }
        else
        {
LABEL_17:
          id v18 = v10;
          v16 = 0;
        }

        CGColorRelease(v16);
        CGColorRelease(v11);

        v5 = v18;
      }
    }
  }

  return v5;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([a4 containsString:@"keyLineColorFixedLstar"])
  {
    [(SBSystemApertureKeyLineColorValidator *)self _applySettingsValues];
  }
}

- (void)_applySettingsValues
{
  [(SBSystemApertureSettings *)self->_settings keyLineColorFixedLstar];
  SBSystemApertureKeyLineFixedLstar = v2;
}

- (void).cxx_destruct
{
}

- (void)validateKeyLineColor:(os_log_t)log .cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Key Line Lightness Adjusted from %f to %f.", (uint8_t *)&v5, 0x16u);
}

@end