@interface IMImageBlur
- (BOOL)hasModifications;
- (IMImageBlur)initWithStyle:(int64_t)a3 radius:(double)a4;
- (double)radius;
- (id)_backdropBlurSettings;
- (id)_blurredImageFromSourceImage:(id)a3;
- (id)_lightBackdropBlurSettings;
- (id)_newBackdropSettings;
- (id)modificationCacheKey;
- (int64_t)style;
@end

@implementation IMImageBlur

- (IMImageBlur)initWithStyle:(int64_t)a3 radius:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IMImageBlur;
  result = [(IMImageBlur *)&v7 init];
  if (result)
  {
    result->_style = a3;
    result->_radius = a4;
  }
  return result;
}

- (id)modificationCacheKey
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(IMImageBlur *)self hasModifications])
  {
    v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    double v5 = v4;

    int64_t v6 = [(IMImageBlur *)self style];
    if (!v6)
    {
      v8 = @"none";
      goto LABEL_6;
    }
    int v7 = v6;
    if (v6 == 1)
    {
      v8 = @"light";
LABEL_6:
      [(IMImageBlur *)self radius];
      v10 = [NSString stringWithFormat:@"blur{%@,radius-%f}@%dx", v8, v9, (int)v5];
      goto LABEL_11;
    }
    v11 = [MEMORY[0x1E4F91F08] defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v7;
      _os_log_impl(&dword_1E3BC5000, v11, OS_LOG_TYPE_ERROR, "Invalid or unimplemented blurStyle encountered (%d)", buf, 8u);
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasModifications
{
  int64_t v3 = [(IMImageBlur *)self style];
  if (v3)
  {
    [(IMImageBlur *)self radius];
    LOBYTE(v3) = v4 > 0.00000011920929;
  }
  return v3;
}

- (id)_blurredImageFromSourceImage:(id)a3
{
  id v4 = a3;
  double v5 = [(IMImageBlur *)self _backdropBlurSettings];
  if (v5)
  {
    int64_t v6 = [v4 _applyBackdropViewSettings:v5 includeTints:1 includeBlur:1 allowImageResizing:0];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)_backdropBlurSettings
{
  if ([(IMImageBlur *)self hasModifications])
  {
    id v3 = [(IMImageBlur *)self _newBackdropSettings];
    [(IMImageBlur *)self radius];
    objc_msgSend(v3, "setBlurRadius:");
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_newBackdropSettings
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t style = self->_style;
  if (style)
  {
    if (style == 1)
    {
      [(IMImageBlur *)self _lightBackdropBlurSettings];
      return (id)objc_claimAutoreleasedReturnValue();
    }
    double v5 = [MEMORY[0x1E4F91F08] defaultCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int64_t v6 = self->_style;
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_ERROR, "Invalid or unimplemented blurStyle encountered (%d)", (uint8_t *)v7, 8u);
    }
  }
  return 0;
}

- (id)_lightBackdropBlurSettings
{
  return (id)[MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2020];
}

- (int64_t)style
{
  return self->_style;
}

- (double)radius
{
  return self->_radius;
}

@end