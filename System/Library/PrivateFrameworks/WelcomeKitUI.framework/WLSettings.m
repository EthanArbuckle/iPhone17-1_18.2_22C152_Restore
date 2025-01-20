@interface WLSettings
- (BOOL)enableDisplayZoom;
- (WLSettings)init;
- (void)setEnableDisplayZoom:(BOOL)a3;
@end

@implementation WLSettings

- (WLSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLSettings;
  v2 = [(WLSettings *)&v5 init];
  if (v2)
  {
    -[WLSettings setEnableDisplayZoom:](v2, "setEnableDisplayZoom:", [MEMORY[0x263F862C0] BOOLForKey:@"enable_display_zoom"] == 1);
    BOOL enableDisplayZoom = v2->_enableDisplayZoom;
    _WLLog();
    objc_msgSend(MEMORY[0x263F862C0], "removeForKey:", @"enable_display_zoom", enableDisplayZoom);
  }
  return v2;
}

- (BOOL)enableDisplayZoom
{
  return self->_enableDisplayZoom;
}

- (void)setEnableDisplayZoom:(BOOL)a3
{
  self->_BOOL enableDisplayZoom = a3;
}

@end