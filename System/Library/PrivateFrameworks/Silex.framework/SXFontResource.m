@interface SXFontResource
- (NSDictionary)fontDescriptorAttributes;
- (id)fontAttributesWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXFontResource

- (id)fontAttributesWithValue:(id)a3 withType:(int)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = [SXJSONFontAttributes alloc];
    v7 = [(SXJSONObject *)self specificationVersion];
    v8 = [(SXJSONObject *)v6 initWithJSONObject:v5 andVersion:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSDictionary)fontDescriptorAttributes
{
  v25[2] = *MEMORY[0x263EF8340];
  v24[0] = *MEMORY[0x263F1D1F0];
  v3 = [(SXFontResource *)self fontName];
  v25[0] = v3;
  v24[1] = *MEMORY[0x263F1D210];
  v22[0] = *MEMORY[0x263F1D350];
  v4 = NSNumber;
  id v5 = [(SXFontResource *)self fontAttributes];
  uint64_t v6 = [v5 weight];
  if (v6 <= 499)
  {
    if (v6 > 299)
    {
      if (v6 != 300)
      {
LABEL_15:
        v7 = (double *)MEMORY[0x263F1D338];
        goto LABEL_21;
      }
      v7 = (double *)MEMORY[0x263F1D328];
    }
    else
    {
      if (v6 != 100)
      {
        if (v6 == 200)
        {
          v7 = (double *)MEMORY[0x263F1D358];
          goto LABEL_21;
        }
        goto LABEL_15;
      }
      v7 = (double *)MEMORY[0x263F1D348];
    }
  }
  else if (v6 <= 699)
  {
    if (v6 != 500)
    {
      if (v6 == 600)
      {
        v7 = (double *)MEMORY[0x263F1D340];
        goto LABEL_21;
      }
      goto LABEL_15;
    }
    v7 = (double *)MEMORY[0x263F1D330];
  }
  else
  {
    switch(v6)
    {
      case 700:
        v7 = (double *)MEMORY[0x263F1D318];
        break;
      case 800:
        v7 = (double *)MEMORY[0x263F1D320];
        break;
      case 900:
        v7 = (double *)MEMORY[0x263F1D310];
        break;
      default:
        goto LABEL_15;
    }
  }
LABEL_21:
  v8 = [v4 numberWithDouble:*v7];
  v23[0] = v8;
  v22[1] = *MEMORY[0x263F1D360];
  v9 = NSNumber;
  v10 = [(SXFontResource *)self fontAttributes];
  uint64_t v11 = [v10 width];
  if (v11 <= 499)
  {
    if (v11 > 299)
    {
      if (v11 != 300)
      {
LABEL_35:
        v12 = (double *)MEMORY[0x263F1D338];
        goto LABEL_41;
      }
      v12 = (double *)MEMORY[0x263F1D328];
    }
    else
    {
      if (v11 != 100)
      {
        if (v11 == 200)
        {
          v12 = (double *)MEMORY[0x263F1D358];
          goto LABEL_41;
        }
        goto LABEL_35;
      }
      v12 = (double *)MEMORY[0x263F1D348];
    }
  }
  else if (v11 <= 699)
  {
    if (v11 != 500)
    {
      if (v11 == 600)
      {
        v12 = (double *)MEMORY[0x263F1D340];
        goto LABEL_41;
      }
      goto LABEL_35;
    }
    v12 = (double *)MEMORY[0x263F1D330];
  }
  else
  {
    switch(v11)
    {
      case 700:
        v12 = (double *)MEMORY[0x263F1D318];
        break;
      case 800:
        v12 = (double *)MEMORY[0x263F1D320];
        break;
      case 900:
        v12 = (double *)MEMORY[0x263F1D310];
        break;
      default:
        goto LABEL_35;
    }
  }
LABEL_41:
  v13 = [v9 numberWithDouble:*v12];
  v23[1] = v13;
  v22[2] = *MEMORY[0x263F1D228];
  v14 = NSNumber;
  v15 = [(SXFontResource *)self fontAttributes];
  uint64_t v16 = [v15 style];
  double v17 = 0.06944444;
  if ((unint64_t)(v16 - 1) >= 2) {
    double v17 = 0.0;
  }
  v18 = [v14 numberWithDouble:v17];
  v23[2] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v25[1] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  return (NSDictionary *)v20;
}

@end