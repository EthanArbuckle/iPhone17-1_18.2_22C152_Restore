@interface WLInternalSettings
+ (id)settingsWithData:(id)a3;
- (BOOL)enableAccessibilityDisplayInversion;
- (BOOL)enableDisplayDarkMode;
- (BOOL)enableDisplayZoom;
- (WLInternalSettings)initWithJSONDictionary:(id)a3;
- (double)accessibilityFontScale;
- (void)setAccessibilityFontScale:(double)a3;
- (void)setEnableAccessibilityDisplayInversion:(BOOL)a3;
- (void)setEnableDisplayDarkMode:(BOOL)a3;
- (void)setEnableDisplayZoom:(BOOL)a3;
@end

@implementation WLInternalSettings

- (WLInternalSettings)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WLInternalSettings;
  v5 = [(WLInternalSettings *)&v7 init];
  if (v5)
  {
    -[WLInternalSettings setEnableAccessibilityDisplayInversion:](v5, "setEnableAccessibilityDisplayInversion:", objc_msgSend(v4, "wl_BOOLForKey:", @"accessibility_display_inversion_enabled"));
    -[WLInternalSettings setEnableDisplayDarkMode:](v5, "setEnableDisplayDarkMode:", objc_msgSend(v4, "wl_BOOLForKey:", @"display_dark_mode_enabled"));
    -[WLInternalSettings setEnableDisplayZoom:](v5, "setEnableDisplayZoom:", objc_msgSend(v4, "wl_BOOLForKey:", @"display_zoom_enabled"));
    objc_msgSend(v4, "wl_floatForKey:", @"accessibility_font_scale");
    -[WLInternalSettings setAccessibilityFontScale:](v5, "setAccessibilityFontScale:");
  }

  return v5;
}

+ (id)settingsWithData:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    _WLLog(v3, 0, @"data was nil and did skip", v4, v5, v6, v7, v8, v28);
    v20 = 0;
    goto LABEL_14;
  }
  id v29 = 0;
  v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v29];
  id v11 = v29;
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (v12)
  {
    v13 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    v14 = [v11 description];
    _WLLog(v3, 0, @"did fail to convert json to object %@\n%@", v15, v16, v17, v18, v19, (uint64_t)v14);

LABEL_12:
    v20 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    _WLLog(v3, 0, @"expected a dictionary but got a wrong type", v22, v23, v24, v25, v26, v28);
    goto LABEL_12;
  }
  v20 = [[WLInternalSettings alloc] initWithJSONDictionary:v10];
LABEL_13:

LABEL_14:

  return v20;
}

- (BOOL)enableAccessibilityDisplayInversion
{
  return self->_enableAccessibilityDisplayInversion;
}

- (void)setEnableAccessibilityDisplayInversion:(BOOL)a3
{
  self->_enableAccessibilityDisplayInversion = a3;
}

- (BOOL)enableDisplayZoom
{
  return self->_enableDisplayZoom;
}

- (void)setEnableDisplayZoom:(BOOL)a3
{
  self->_enableDisplayZoom = a3;
}

- (BOOL)enableDisplayDarkMode
{
  return self->_enableDisplayDarkMode;
}

- (void)setEnableDisplayDarkMode:(BOOL)a3
{
  self->_enableDisplayDarkMode = a3;
}

- (double)accessibilityFontScale
{
  return self->_accessibilityFontScale;
}

- (void)setAccessibilityFontScale:(double)a3
{
  self->_accessibilityFontScale = a3;
}

@end