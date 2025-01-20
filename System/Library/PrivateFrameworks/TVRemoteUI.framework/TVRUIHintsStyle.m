@interface TVRUIHintsStyle
+ (id)styleProviderForUserInterfaceIdiom:(int64_t)a3 hasHomeButton:(BOOL)a4;
- (BOOL)hasHomeButton;
- (BOOL)shouldShowSiriHint;
- (BOOL)shouldShowVolumeHint;
- (BOOL)supportsSBHints;
- (TVRUIHintsStyle)initWithHomeButton:(BOOL)a3;
- (double)activationAnimationDismissalDelay;
- (double)activationAnimationDuration;
- (double)animationDuration;
- (double)animationPresentationDelay;
- (double)maximumSymbolPointSize;
- (double)preferredTipWidth;
- (id)siriHintTipContext;
- (int64_t)userInterfaceStyle;
- (void)setHasHomeButton:(BOOL)a3;
- (void)setSupportsSBHints:(BOOL)a3;
@end

@implementation TVRUIHintsStyle

+ (id)styleProviderForUserInterfaceIdiom:(int64_t)a3 hasHomeButton:(BOOL)a4
{
  if (a3 == 1)
  {
    v5 = TVRUIHintsStylePad;
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = TVRUIHintsStylePhone;
LABEL_5:
    v6 = (TVRUIHintsStylePhone *)[[v5 alloc] initWithHomeButton:a4];
    goto LABEL_9;
  }
  v7 = _TVRUIHintsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    +[TVRUIHintsStyle styleProviderForUserInterfaceIdiom:hasHomeButton:](a3, v7);
  }

  v6 = objc_alloc_init(TVRUIHintsStylePhone);
LABEL_9:
  return v6;
}

- (TVRUIHintsStyle)initWithHomeButton:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TVRUIHintsStyle;
  v4 = [(TVRUIHintsStyle *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_hasHomeButton = a3;
    int v6 = SBSUIHardwareButtonHintViewsSupported();
    if (v6) {
      LOBYTE(v6) = [MEMORY[0x263F7C9A8] greymatterEnabled];
    }
    v5->_supportsSBHints = v6;
  }
  return v5;
}

- (BOOL)shouldShowSiriHint
{
  return ![(TVRUIHintsStyle *)self hasHomeButton];
}

- (BOOL)shouldShowVolumeHint
{
  return 1;
}

- (double)maximumSymbolPointSize
{
  return 31.0;
}

- (double)animationPresentationDelay
{
  return 0.24;
}

- (double)animationDuration
{
  return 2.4;
}

- (double)activationAnimationDuration
{
  return 0.2;
}

- (double)activationAnimationDismissalDelay
{
  BOOL v2 = [(TVRUIHintsStyle *)self supportsSBHints];
  double result = 0.13;
  if (v2) {
    return 0.25;
  }
  return result;
}

- (id)siriHintTipContext
{
  return @"ATVRemoteSiriHint";
}

- (int64_t)userInterfaceStyle
{
  return 2;
}

- (double)preferredTipWidth
{
  return 310.0;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

- (BOOL)supportsSBHints
{
  return self->_supportsSBHints;
}

- (void)setSupportsSBHints:(BOOL)a3
{
  self->_supportsSBHints = a3;
}

+ (void)styleProviderForUserInterfaceIdiom:(uint64_t)a1 hasHomeButton:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_227326000, a2, OS_LOG_TYPE_FAULT, "Unsupported UIUserInterfaceIdiom (%ld) requested! Defaulting to Phone", (uint8_t *)&v2, 0xCu);
}

@end