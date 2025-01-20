@interface OADColorContext
+ (id)colorContextWithScheme:(id)a3 map:(id)a4 palette:(id)a5;
- (BOOL)isEqual:(id)a3;
- (OADColorContext)initWithScheme:(id)a3 map:(id)a4 palette:(id)a5;
- (OADColorMap)map;
- (OADColorPalette)palette;
- (OADColorScheme)scheme;
- (unint64_t)hash;
- (void)applyThemeOverrides:(id)a3 colorMapOverride:(id)a4;
- (void)setPalette:(id)a3;
@end

@implementation OADColorContext

- (OADColorContext)initWithScheme:(id)a3 map:(id)a4 palette:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OADColorContext;
  v12 = [(OADColorContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mScheme, a3);
    objc_storeStrong((id *)&v13->mMap, a4);
    objc_storeStrong((id *)&v13->mPalette, a5);
  }

  return v13;
}

- (OADColorMap)map
{
  return self->mMap;
}

- (OADColorScheme)scheme
{
  return self->mScheme;
}

- (OADColorPalette)palette
{
  return self->mPalette;
}

+ (id)colorContextWithScheme:(id)a3 map:(id)a4 palette:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[OADColorContext alloc] initWithScheme:v7 map:v8 palette:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = (objc_object **)v4;
    if ((TCObjectEqual((objc_object *)self->mScheme, v7[1]) & 1) != 0
      && TCObjectEqual((objc_object *)self->mMap, v7[2]))
    {
      char v6 = TCObjectEqual((objc_object *)self->mPalette, v7[3]);
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
  unint64_t v3 = [(OADColorScheme *)self->mScheme hash];
  unint64_t v4 = ([(OADColorMap *)self->mMap hash] << 8) + (v3 << 16);
  v6.receiver = self;
  v6.super_class = (Class)OADColorContext;
  return [(OADColorContext *)&v6 hash] + v4;
}

- (void)applyThemeOverrides:(id)a3 colorMapOverride:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 colorScheme];

  if (v7)
  {
    id v8 = [v10 colorScheme];
    mScheme = self->mScheme;
    self->mScheme = v8;
  }
  if (v6) {
    objc_storeStrong((id *)&self->mMap, a4);
  }
}

- (void)setPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPalette, 0);
  objc_storeStrong((id *)&self->mMap, 0);
  objc_storeStrong((id *)&self->mScheme, 0);
}

@end