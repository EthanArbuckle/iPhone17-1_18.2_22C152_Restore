@interface SBLockOverlayStyleProperties
- (SBLockOverlayStyleProperties)initWithStyle:(unint64_t)a3 quality:(int64_t)a4;
- (UIColor)tintColor;
- (double)blurRadius;
- (double)tintAlpha;
- (id)_settingsForStyle;
- (id)_stringForQuality;
- (id)_stringForStyle;
- (id)description;
- (int64_t)graphicsQuality;
- (unint64_t)style;
- (void)_configure;
@end

@implementation SBLockOverlayStyleProperties

- (SBLockOverlayStyleProperties)initWithStyle:(unint64_t)a3 quality:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBLockOverlayStyleProperties;
  v6 = [(SBLockOverlayStyleProperties *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    v6->_quality = a4;
    [(SBLockOverlayStyleProperties *)v6 _configure];
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SBLockOverlayStyleProperties *)self _stringForStyle];
  v6 = [(SBLockOverlayStyleProperties *)self _stringForQuality];
  v7 = [v3 stringWithFormat:@"<%@:%p>             style: %@, quality: %@, tintColor: %@, tintAlpha: %f, blurRadius: %f             settings: %@", v4, self, v5, v6, self->_tintColor, *(void *)&self->_tintAlpha, *(void *)&self->_blurRadius, self->_settings];

  return v7;
}

- (void)_configure
{
  v3 = [(SBLockOverlayStyleProperties *)self _settingsForStyle];
  settings = self->_settings;
  self->_settings = v3;

  v5 = [(_UIBackdropViewSettings *)self->_settings combinedTintColor];
  [v5 alphaComponent];
  self->_tintAlpha = v6;

  v7 = [(_UIBackdropViewSettings *)self->_settings combinedTintColor];
  v8 = [v7 colorWithAlphaComponent:1.0];
  tintColor = self->_tintColor;
  self->_tintColor = v8;

  [(_UIBackdropViewSettings *)self->_settings blurRadius];
  self->_blurRadius = v10;
}

- (id)_settingsForStyle
{
  switch(self->_style)
  {
    case 0uLL:
      int64_t quality = self->_quality;
      v3 = (void *)MEMORY[0x1E4F430B0];
      uint64_t v4 = -2;
      goto LABEL_5;
    case 2uLL:
      int64_t quality = self->_quality;
      v3 = (void *)MEMORY[0x1E4F430B0];
      uint64_t v4 = 11070;
      goto LABEL_5;
    case 3uLL:
      double v6 = SBBlackBackdropSettings;
      goto LABEL_8;
    case 4uLL:
      double v6 = SBWhiteBackdropSettings;
LABEL_8:
      id v5 = objc_alloc_init(v6);
      break;
    default:
      int64_t quality = self->_quality;
      v3 = (void *)MEMORY[0x1E4F430B0];
      uint64_t v4 = 11050;
LABEL_5:
      id v5 = [v3 settingsForPrivateStyle:v4 graphicsQuality:quality];
      break;
  }
  return v5;
}

- (id)_stringForQuality
{
  if (self->_quality == 10) {
    return @"UIDeviceGraphicsQualityLow";
  }
  else {
    return @"UIDeviceGraphicsQualityHigh";
  }
}

- (id)_stringForStyle
{
  unint64_t v2 = self->_style - 2;
  if (v2 > 2) {
    return @"SBLockOverlayStyleMedium";
  }
  else {
    return off_1E5CCE390[v2];
  }
}

- (unint64_t)style
{
  return self->_style;
}

- (int64_t)graphicsQuality
{
  return self->_quality;
}

- (double)tintAlpha
{
  return self->_tintAlpha;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

@end