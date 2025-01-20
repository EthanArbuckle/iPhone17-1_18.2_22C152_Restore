@interface SXSanFranciscoFontFamily
- (NSSet)fontFaces;
- (NSString)familyName;
- (id)fontFaceWithAttributes:(id)a3 size:(int64_t)a4;
@end

@implementation SXSanFranciscoFontFamily

- (NSString)familyName
{
  return (NSString *)@"system";
}

- (NSSet)fontFaces
{
  return (NSSet *)MEMORY[0x263EFFA68];
}

- (id)fontFaceWithAttributes:(id)a3 size:(int64_t)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [v5 setObject:*MEMORY[0x263F1D248] forKey:*MEMORY[0x263F1D250]];
  uint64_t v6 = [v4 weight];
  if (v6 <= 499)
  {
    if (v6 > 299)
    {
      if (v6 == 300)
      {
        v7 = (double *)MEMORY[0x263F1D328];
        goto LABEL_21;
      }
    }
    else
    {
      if (v6 == 100)
      {
        v7 = (double *)MEMORY[0x263F1D348];
        goto LABEL_21;
      }
      if (v6 == 200)
      {
        v7 = (double *)MEMORY[0x263F1D358];
        goto LABEL_21;
      }
    }
LABEL_15:
    v7 = (double *)MEMORY[0x263F1D338];
    goto LABEL_21;
  }
  if (v6 <= 699)
  {
    if (v6 == 500)
    {
      v7 = (double *)MEMORY[0x263F1D330];
      goto LABEL_21;
    }
    if (v6 == 600)
    {
      v7 = (double *)MEMORY[0x263F1D340];
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  if (v6 == 700)
  {
    v7 = (double *)MEMORY[0x263F1D318];
    goto LABEL_21;
  }
  if (v6 == 800)
  {
    v7 = (double *)MEMORY[0x263F1D320];
    goto LABEL_21;
  }
  if (v6 != 900) {
    goto LABEL_15;
  }
  v7 = (double *)MEMORY[0x263F1D310];
LABEL_21:
  v8 = [NSNumber numberWithDouble:*v7];
  [v5 setObject:v8 forKey:*MEMORY[0x263F1D350]];

  uint64_t v9 = [v4 width];
  double v10 = 0.4;
  switch(v9)
  {
    case 0:
      v11 = (double *)MEMORY[0x263F03C58];
      goto LABEL_32;
    case 1:
    case 2:
      v11 = (double *)MEMORY[0x263F03C20];
      goto LABEL_32;
    case 3:
      v11 = (double *)MEMORY[0x263F03C08];
      goto LABEL_32;
    case 4:
      v11 = (double *)MEMORY[0x263F03C28];
      goto LABEL_32;
    case 5:
      v11 = (double *)MEMORY[0x263F03C10];
      goto LABEL_32;
    case 6:
      v11 = (double *)MEMORY[0x263F03C38];
      goto LABEL_32;
    case 8:
      v11 = (double *)MEMORY[0x263F03C40];
      goto LABEL_32;
    case 9:
      v11 = (double *)MEMORY[0x263F03C18];
      goto LABEL_32;
    case 10:
      v11 = (double *)MEMORY[0x263F03C30];
      goto LABEL_32;
    case 11:
      goto LABEL_33;
    default:
      v11 = (double *)MEMORY[0x263F03C48];
LABEL_32:
      double v10 = *v11;
LABEL_33:
      v12 = [NSNumber numberWithDouble:v10];
      [v5 setObject:v12 forKey:*MEMORY[0x263F1D360]];

      uint64_t v13 = [v4 style];
      double v14 = 0.06944444;
      if ((unint64_t)(v13 - 1) >= 2) {
        double v14 = 0.0;
      }
      v15 = [NSNumber numberWithDouble:v14];
      [v5 setObject:v15 forKey:*MEMORY[0x263F1D228]];

      v16 = [v4 grade];

      if (v16)
      {
        v17 = [v4 grade];
        [v5 setObject:v17 forKey:*MEMORY[0x263F1D258]];
      }
      uint64_t v25 = *MEMORY[0x263F1D210];
      v26[0] = v5;
      v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v19 = [MEMORY[0x263F1C660] fontDescriptorWithFontAttributes:v18];
      v20 = [SXSanFranciscoFontFace alloc];
      v21 = [v19 postscriptName];
      v22 = [v19 fontAttributes];
      v23 = [(SXSanFranciscoFontFace *)v20 initWithFontName:v21 fontAttributes:v4 fontDescriptorAttributes:v22];

      return v23;
  }
}

@end