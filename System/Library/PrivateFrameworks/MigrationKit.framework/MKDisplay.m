@interface MKDisplay
- (BOOL)enableDisplayDarkMode;
- (BOOL)enableDisplayZoom;
- (MKDisplay)initWithData:(id)a3;
- (void)setEnableDisplayDarkMode:(BOOL)a3;
- (void)setEnableDisplayZoom:(BOOL)a3;
@end

@implementation MKDisplay

- (MKDisplay)initWithData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKDisplay;
  v5 = [(MKDisplay *)&v15 init];
  if (v5)
  {
    id v14 = 0;
    v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v14];
    id v7 = v14;
    if (v7)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(MKAccount *)(uint64_t)v5 initWithData:v8];
      }
LABEL_10:

      v12 = 0;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKAccount initWithData:]((uint64_t)v5, v8);
      }
      goto LABEL_10;
    }
    id v9 = v6;
    v10 = [v9 objectForKey:@"display_zoom_enabled"];
    -[MKDisplay setEnableDisplayZoom:](v5, "setEnableDisplayZoom:", [v10 BOOLValue]);

    v11 = [v9 objectForKey:@"dark_mode_enabled"];

    -[MKDisplay setEnableDisplayDarkMode:](v5, "setEnableDisplayDarkMode:", [v11 BOOLValue]);
  }
  v12 = v5;
LABEL_11:

  return v12;
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

@end