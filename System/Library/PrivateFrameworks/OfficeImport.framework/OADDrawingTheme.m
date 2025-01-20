@interface OADDrawingTheme
- (BOOL)isEqual:(id)a3;
- (OADColorContext)colorContext;
- (OADColorMap)colorMap;
- (OADColorPalette)colorPalette;
- (OADColorScheme)colorScheme;
- (OADDrawingTheme)initWithStyleMatrix:(id)a3 fontScheme:(id)a4 colorScheme:(id)a5 colorMap:(id)a6 colorPalette:(id)a7;
- (OADDrawingTheme)initWithTheme:(id)a3 colorMap:(id)a4 colorPalette:(id)a5;
- (OADFontScheme)fontScheme;
- (OADStyleMatrix)styleMatrix;
- (id)description;
- (unint64_t)hash;
- (void)applyThemeOverrides:(id)a3 colorMapOverride:(id)a4;
@end

@implementation OADDrawingTheme

- (OADDrawingTheme)initWithStyleMatrix:(id)a3 fontScheme:(id)a4 colorScheme:(id)a5 colorMap:(id)a6 colorPalette:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)OADDrawingTheme;
  v18 = [(OADDrawingTheme *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->mStyleMatrix, a3);
    objc_storeStrong((id *)&v19->mFontScheme, a4);
    v20 = [[OADColorContext alloc] initWithScheme:v15 map:v16 palette:v17];
    mColorContext = v19->mColorContext;
    v19->mColorContext = v20;
  }
  return v19;
}

- (OADDrawingTheme)initWithTheme:(id)a3 colorMap:(id)a4 colorPalette:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)OADDrawingTheme;
  v11 = [(OADDrawingTheme *)&v24 init];
  if (v11)
  {
    v12 = [v8 baseStyles];
    uint64_t v13 = [v12 styleMatrix];
    mStyleMatrix = v11->mStyleMatrix;
    v11->mStyleMatrix = (OADStyleMatrix *)v13;

    id v15 = [v8 baseStyles];
    uint64_t v16 = [v15 fontScheme];
    mFontScheme = v11->mFontScheme;
    v11->mFontScheme = (OADFontScheme *)v16;

    v18 = [OADColorContext alloc];
    v19 = [v8 baseStyles];
    v20 = [v19 colorScheme];
    uint64_t v21 = [(OADColorContext *)v18 initWithScheme:v20 map:v9 palette:v10];
    mColorContext = v11->mColorContext;
    v11->mColorContext = (OADColorContext *)v21;
  }
  return v11;
}

- (void)applyThemeOverrides:(id)a3 colorMapOverride:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [v13 fontScheme];

  if (v7)
  {
    id v8 = [v13 fontScheme];
    mFontScheme = self->mFontScheme;
    self->mFontScheme = v8;
  }
  id v10 = [v13 styleMatrix];

  if (v10)
  {
    v11 = [v13 styleMatrix];
    mStyleMatrix = self->mStyleMatrix;
    self->mStyleMatrix = v11;
  }
  [(OADColorContext *)self->mColorContext applyThemeOverrides:v13 colorMapOverride:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (objc_object **)v4;
    if ((TCObjectEqual((objc_object *)self->mStyleMatrix, v7[1]) & 1) != 0
      && TCObjectEqual((objc_object *)self->mFontScheme, v7[2]))
    {
      char v6 = TCObjectEqual((objc_object *)self->mColorContext, v7[3]);
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADFontScheme *)self->mFontScheme hash];
  unint64_t v4 = ([(OADColorContext *)self->mColorContext hash] << 8) + (v3 << 16);
  v6.receiver = self;
  v6.super_class = (Class)OADDrawingTheme;
  return [(OADDrawingTheme *)&v6 hash] + v4;
}

- (OADColorScheme)colorScheme
{
  return [(OADColorContext *)self->mColorContext scheme];
}

- (OADColorMap)colorMap
{
  return [(OADColorContext *)self->mColorContext map];
}

- (OADColorPalette)colorPalette
{
  return [(OADColorContext *)self->mColorContext palette];
}

- (id)description
{
  unint64_t v3 = +[OITSUDescription descriptionWithObject:self class:objc_opt_class()];
  unint64_t v4 = [(OADStyleMatrix *)self->mStyleMatrix description];
  [v3 addField:@"StyleMatrix" value:v4];

  uint64_t v5 = [(OADFontScheme *)self->mFontScheme description];
  [v3 addField:@"FontScheme" value:v5];

  objc_super v6 = [(OADColorContext *)self->mColorContext description];
  [v3 addField:@"ColorContext" value:v6];

  v7 = [v3 descriptionString];

  return v7;
}

- (OADStyleMatrix)styleMatrix
{
  return self->mStyleMatrix;
}

- (OADFontScheme)fontScheme
{
  return self->mFontScheme;
}

- (OADColorContext)colorContext
{
  return self->mColorContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorContext, 0);
  objc_storeStrong((id *)&self->mFontScheme, 0);
  objc_storeStrong((id *)&self->mStyleMatrix, 0);
}

@end