@interface MKAccessibility
- (BOOL)enableDisplayInversion;
- (MKAccessibility)initWithData:(id)a3;
- (float)fontScale;
- (void)setEnableDisplayInversion:(BOOL)a3;
- (void)setFontScale:(float)a3;
@end

@implementation MKAccessibility

- (MKAccessibility)initWithData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKAccessibility;
  v5 = [(MKAccessibility *)&v15 init];
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
    v10 = [v9 objectForKey:@"display_inversion_enabled"];
    -[MKAccessibility setEnableDisplayInversion:](v5, "setEnableDisplayInversion:", [v10 BOOLValue]);

    v11 = [v9 objectForKey:@"font_scale"];

    [v11 floatValue];
    -[MKAccessibility setFontScale:](v5, "setFontScale:");
  }
  v12 = v5;
LABEL_11:

  return v12;
}

- (BOOL)enableDisplayInversion
{
  return self->_enableDisplayInversion;
}

- (void)setEnableDisplayInversion:(BOOL)a3
{
  self->_enableDisplayInversion = a3;
}

- (float)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(float)a3
{
  self->_fontScale = a3;
}

@end